Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FEC6E06D5
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Apr 2023 08:22:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4D46C65E4F;
	Thu, 13 Apr 2023 06:22:22 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97B5BC57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Apr 2023 06:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681366941; x=1712902941;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cZESwgIlk1I8vfBOGAvQXzooT82QEWSameprF1BTFBU=;
 b=ie8iVVjqXn/MscxVnw8n/sgzit3FFS9nagRJ1p8IfynOEAlAgH1dDVRu
 0+bBBretaKJHZfqVV0+3S32xeNLMyc8aJKf0q7tIte1EylIHilOFRfbAf
 pTv61Xikau/w3WrB6GJU6z/06430rCOvcoQN1GBmBsdxQbopA9CVz2hCn
 wpMxgbrzqbjRVDwVkbRp5EQZhf1uWPHfJ5RVT0fjwBG7mfdelgOLSSImA
 BJUOQLOe3wKxo0ajA0O2gTP5kP+/rWUhCDxSG++Kilk9wmsEV2ezjTPWn
 cSEjEF25KvXl0ZqIhyGYyURZ4yePrhvI3n98BxKq8r0KKjJnFMLL3Dsvb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="406936202"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="406936202"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 23:22:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="832996332"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="832996332"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by fmsmga001.fm.intel.com with SMTP; 12 Apr 2023 23:22:16 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Thu, 13 Apr 2023 09:22:15 +0300
Date: Thu, 13 Apr 2023 09:22:15 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZDeflxzawVNxhsL7@kuha.fi.intel.com>
References: <20230412161734.3425090-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230412161734.3425090-1-fabrice.gasnier@foss.st.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] usb: typec: ucsi: don't print PPM init
	deferred errors
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

On Wed, Apr 12, 2023 at 06:17:34PM +0200, Fabrice Gasnier wrote:
> ucsi_init() may be deferred as usb_role_sw may be deferred in
> ucsi_register_port(). This results in several PPM init failed (-517)
> messages maybe printed several times upon boot, like on stm32mp135f-dk
> board, until the role_switch driver gets probed.
> 
> [   19.880945] dwc2 49000000.usb: supply vusb_d not found, using dummy regulator
> [   19.887136] dwc2 49000000.usb: supply vusb_a not found, using dummy regulator
> [   19.975432] ucsi-stm32g0-i2c 0-0053: PPM init failed (-517)
> [   20.155746] dwc2 49000000.usb: EPs: 9, dedicated fifos, 952 entries in SPRAM
> [   20.175429] ucsi-stm32g0-i2c 0-0053: PPM init failed (-517)
> [   20.184242] dwc2 49000000.usb: DWC OTG Controller
> 
> Adopt dev_err_probe() instead of dev_err(), to only print other errors.
> Also print an error in case the wait count has expired.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index f632350f6dcb..4d809e0d7761 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1447,11 +1447,13 @@ static void ucsi_init_work(struct work_struct *work)
>  
>  	ret = ucsi_init(ucsi);
>  	if (ret)
> -		dev_err(ucsi->dev, "PPM init failed (%d)\n", ret);
> +		dev_err_probe(ucsi->dev, ret, "PPM init failed\n");
>  
>  	if (ret == -EPROBE_DEFER) {
> -		if (ucsi->work_count++ > UCSI_ROLE_SWITCH_WAIT_COUNT)
> +		if (ucsi->work_count++ > UCSI_ROLE_SWITCH_WAIT_COUNT) {
> +			dev_err(ucsi->dev, "PPM init failed, stop trying\n");
>  			return;
> +		}
>  
>  		queue_delayed_work(system_long_wq, &ucsi->work,
>  				   UCSI_ROLE_SWITCH_INTERVAL);
> -- 
> 2.25.1

-- 
heikki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
