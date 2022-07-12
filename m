Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D6657152B
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Jul 2022 10:56:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31678C640F9;
	Tue, 12 Jul 2022 08:56:43 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0508CC03FD4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Jul 2022 08:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657616201; x=1689152201;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BAj2BVRnVHVx4BIVLBA7qJLUD2eGU+U6NgPxuH9MK6w=;
 b=TdCj1HwjiRgCzcAtX99RoCvH1yyGmHJw/gMf1Sw2mvZ17lexBGHavZ5/
 848I+RtQrR0Bhfiw35ri5SYlUxNzTujUK4Fmj45yAwPSOjnTOTEoQzcYU
 //kVNZ5lswbq3E0mbXAbgbFLEatFDpu0gsoQVT8AnmXBjfzcUHW/WVkB0
 8pKStilL5xokHHpSs6phPR8traf9BKRPja5uTMLX6wi1EIUCSxbNAJZ10
 TpFqx7nrdlxOQuBzmSl5cFiQnwd0qIdJVF12T+mYI3sjoOSjg+wIfsv7y
 BE3CrtNSysZZx+4GARbleOQ+7ROxMd10jSeh7TE8gNk7VDnv2kmB6hkZM w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="282431783"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="282431783"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 01:56:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="737408607"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by fmsmga001.fm.intel.com with SMTP; 12 Jul 2022 01:56:35 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 12 Jul 2022 11:56:34 +0300
Date: Tue, 12 Jul 2022 11:56:34 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <Ys03QgD0aIF1Zl9R@kuha.fi.intel.com>
References: <20220711120122.25804-1-fabrice.gasnier@foss.st.com>
 <20220711120122.25804-5-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220711120122.25804-5-fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 christophe.jaillet@wanadoo.fr, krzysztof.kozlowski+dt@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 4/4] usb: typec: ucsi: stm32g0: add
 support for power management
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

Hi,

Mon, Jul 11, 2022 at 02:01:22PM +0200, Fabrice Gasnier kirjoitti:
> Type-C connector can be used as a wakeup source (typically to detect
> changes on the port, attach or detach...).
> Add suspend / resume routines to enable wake irqs, and signal a wakeup
> event in case the IRQ has fired while in suspend.
> The i2c core is doing the necessary initialization when the "wakeup-source"
> flag is provided.
> Note: the interrupt handler shouldn't be called before the i2c bus resumes.
> So, the interrupts are disabled during suspend period, and re-enabled
> upon resume, to avoid i2c transfer while suspended, from the irq handler.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Does this really need a separate patch? Does the support depend on the
second patch somehow?

If not, then just merge this into the first patch. That
g0->in_bootloader check you can add in the second patch.

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_stm32g0.c | 52 +++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> index b1d891c9a92c0..061551d464f12 100644
> --- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> +++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> @@ -66,6 +66,8 @@ struct ucsi_stm32g0 {
>  	unsigned long flags;
>  	const char *fw_name;
>  	struct ucsi *ucsi;
> +	bool suspended;
> +	bool wakeup_event;
>  };
>  
>  /*
> @@ -416,6 +418,9 @@ static irqreturn_t ucsi_stm32g0_irq_handler(int irq, void *data)
>  	u32 cci;
>  	int ret;
>  
> +	if (g0->suspended)
> +		g0->wakeup_event = true;
> +
>  	ret = ucsi_stm32g0_read(g0->ucsi, UCSI_CCI, &cci, sizeof(cci));
>  	if (ret)
>  		return IRQ_NONE;
> @@ -696,6 +701,52 @@ static int ucsi_stm32g0_remove(struct i2c_client *client)
>  	return 0;
>  }
>  
> +static int ucsi_stm32g0_suspend(struct device *dev)
> +{
> +	struct ucsi_stm32g0 *g0 = dev_get_drvdata(dev);
> +	struct i2c_client *client = g0->client;
> +
> +	if (g0->in_bootloader)
> +		return 0;
> +
> +	/* Keep the interrupt disabled until the i2c bus has been resumed */
> +	disable_irq(client->irq);
> +
> +	g0->suspended = true;
> +	g0->wakeup_event = false;
> +
> +	if (device_may_wakeup(dev) || device_wakeup_path(dev))
> +		enable_irq_wake(client->irq);
> +
> +	return 0;
> +}
> +
> +static int ucsi_stm32g0_resume(struct device *dev)
> +{
> +	struct ucsi_stm32g0 *g0 = dev_get_drvdata(dev);
> +	struct i2c_client *client = g0->client;
> +
> +	if (g0->in_bootloader)
> +		return 0;
> +
> +	if (device_may_wakeup(dev) || device_wakeup_path(dev))
> +		disable_irq_wake(client->irq);
> +
> +	enable_irq(client->irq);
> +
> +	/* Enforce any pending handler gets called to signal a wakeup_event */
> +	synchronize_irq(client->irq);
> +
> +	if (g0->wakeup_event)
> +		pm_wakeup_event(g0->dev, 0);
> +
> +	g0->suspended = false;
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(ucsi_stm32g0_pm_ops, ucsi_stm32g0_suspend, ucsi_stm32g0_resume);
> +
>  static const struct of_device_id __maybe_unused ucsi_stm32g0_typec_of_match[] = {
>  	{ .compatible = "st,stm32g0-typec" },
>  	{},
> @@ -712,6 +763,7 @@ static struct i2c_driver ucsi_stm32g0_i2c_driver = {
>  	.driver = {
>  		.name = "ucsi-stm32g0-i2c",
>  		.of_match_table = of_match_ptr(ucsi_stm32g0_typec_of_match),
> +		.pm = pm_sleep_ptr(&ucsi_stm32g0_pm_ops),
>  	},
>  	.probe = ucsi_stm32g0_probe,
>  	.remove = ucsi_stm32g0_remove,
> -- 
> 2.25.1

-- 
heikki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
