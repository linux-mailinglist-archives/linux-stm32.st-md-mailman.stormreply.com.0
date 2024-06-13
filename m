Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67748906A45
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jun 2024 12:44:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20CFEC78012;
	Thu, 13 Jun 2024 10:44:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5035C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jun 2024 10:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718275486; x=1749811486;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W3+ttgDIdBTkKzgo2dVVa4/yBGEx95jS9AbN62ug2yQ=;
 b=lnrJhVdugK83eum3icoV3EJMxMq9yYUwhzuakHZBKt9GvUwLYk90kDQ0
 5avtc7VtklC7xZgeVn31Tmmlg8+lrevJjedap+7dOMuJgdk4JfuVgCxzp
 r0SoHsq9qo3vthGEXm3sZQmAMFR1jmkJSYo4Qr7ua9jHhV+IN2EpiHCR6
 UIOwOSciGuRrVd5iBhKJ9oPIlkaz81JLXlni03migsMNX50BYAJPC4s1T
 mmLSv9zxxNpQ7itrqrfOOFLmRmJUgN9HvLEYClnX1+htc6I/tUKDJ60D4
 kbT6WnfXQrY79Rh3UN7McdgdEJZoR8lT9qX9NwGYQk5bDU4QWVT4T6/V0 A==;
X-CSE-ConnectionGUID: OEtmn5ILTN2MPPy6DsKmmg==
X-CSE-MsgGUID: Ur8SWeJ/SCqykEjv81TGXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15212926"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="15212926"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 03:44:37 -0700
X-CSE-ConnectionGUID: MSJrrvwrR6iuPIQgX7QQNA==
X-CSE-MsgGUID: eA9bH91KSbKf3OF5CWMfOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40585831"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by orviesa006.jf.intel.com with SMTP; 13 Jun 2024 03:44:35 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Thu, 13 Jun 2024 13:44:33 +0300
Date: Thu, 13 Jun 2024 13:44:33 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZmrNkTXkOQIcbwGa@kuha.fi.intel.com>
References: <20240612124656.2305603-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240612124656.2305603-1-fabrice.gasnier@foss.st.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dmitry.baryshkov@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] usb: ucsi: stm32: fix command
	completion handling
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, Jun 12, 2024 at 02:46:56PM +0200, Fabrice Gasnier wrote:
> Sometimes errors are seen, when doing DR swap, like:
> [   24.672481] ucsi-stm32g0-i2c 0-0035: UCSI_GET_PDOS failed (-5)
> [   24.720188] ucsi-stm32g0-i2c 0-0035: ucsi_handle_connector_change:
>  GET_CONNECTOR_STATUS failed (-5)
> 
> There may be some race, which lead to read CCI, before the command complete
> flag is set, hence returning -EIO. Similar fix has been done also in
> ucsi_acpi [1].
> 
> In case of a spurious or otherwise delayed notification it is
> possible that CCI still reports the previous completion. The
> UCSI spec is aware of this and provides two completion bits in
> CCI, one for normal commands and one for acks. As acks and commands
> alternate the notification handler can determine if the completion
> bit is from the current command.
> 
> To fix this add the ACK_PENDING bit for ucsi_stm32g0 and only complete
> commands if the completion bit matches.
> 
> [1] https://lore.kernel.org/lkml/20240121204123.275441-3-lk@c--e.de/
> 
> Fixes: 72849d4fcee7 ("usb: typec: ucsi: stm32g0: add support for stm32g0 controller")
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v2: rebase and define ACK_PENDING as commented by Dmitry.
> ---
>  drivers/usb/typec/ucsi/ucsi_stm32g0.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> index ac48b7763114..ac69288e8bb0 100644
> --- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> +++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> @@ -65,6 +65,7 @@ struct ucsi_stm32g0 {
>  	struct device *dev;
>  	unsigned long flags;
>  #define COMMAND_PENDING	1
> +#define ACK_PENDING	2
>  	const char *fw_name;
>  	struct ucsi *ucsi;
>  	bool suspended;
> @@ -396,9 +397,13 @@ static int ucsi_stm32g0_sync_write(struct ucsi *ucsi, unsigned int offset, const
>  				   size_t len)
>  {
>  	struct ucsi_stm32g0 *g0 = ucsi_get_drvdata(ucsi);
> +	bool ack = UCSI_COMMAND(*(u64 *)val) == UCSI_ACK_CC_CI;
>  	int ret;
>  
> -	set_bit(COMMAND_PENDING, &g0->flags);
> +	if (ack)
> +		set_bit(ACK_PENDING, &g0->flags);
> +	else
> +		set_bit(COMMAND_PENDING, &g0->flags);
>  
>  	ret = ucsi_stm32g0_async_write(ucsi, offset, val, len);
>  	if (ret)
> @@ -406,9 +411,14 @@ static int ucsi_stm32g0_sync_write(struct ucsi *ucsi, unsigned int offset, const
>  
>  	if (!wait_for_completion_timeout(&g0->complete, msecs_to_jiffies(5000)))
>  		ret = -ETIMEDOUT;
> +	else
> +		return 0;
>  
>  out_clear_bit:
> -	clear_bit(COMMAND_PENDING, &g0->flags);
> +	if (ack)
> +		clear_bit(ACK_PENDING, &g0->flags);
> +	else
> +		clear_bit(COMMAND_PENDING, &g0->flags);
>  
>  	return ret;
>  }
> @@ -429,8 +439,9 @@ static irqreturn_t ucsi_stm32g0_irq_handler(int irq, void *data)
>  	if (UCSI_CCI_CONNECTOR(cci))
>  		ucsi_connector_change(g0->ucsi, UCSI_CCI_CONNECTOR(cci));
>  
> -	if (test_bit(COMMAND_PENDING, &g0->flags) &&
> -	    cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))
> +	if (cci & UCSI_CCI_ACK_COMPLETE && test_and_clear_bit(ACK_PENDING, &g0->flags))
> +		complete(&g0->complete);
> +	if (cci & UCSI_CCI_COMMAND_COMPLETE && test_and_clear_bit(COMMAND_PENDING, &g0->flags))
>  		complete(&g0->complete);
>  
>  	return IRQ_HANDLED;
> -- 
> 2.25.1

-- 
heikki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
