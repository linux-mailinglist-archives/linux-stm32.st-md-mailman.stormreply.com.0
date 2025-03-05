Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B6DA50245
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Mar 2025 15:38:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B27B3C78037;
	Wed,  5 Mar 2025 14:38:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18A81CFAC4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Mar 2025 14:38:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 306905C6996;
 Wed,  5 Mar 2025 14:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3645EC4CED1;
 Wed,  5 Mar 2025 14:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741185520;
 bh=4TB5DOPQd21hKHuqCzgn5hFKWa7l8WTPFGMMoIXKVUE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o8paCwND1OXZaThX0PBLZWfCWlsxJ85F5H8VUjHQrn9/EBMgPgPJQEDjZ21qk5qTw
 OPPlKAEpsUSpBj5gMZ0xgHJ8IGSct0+CTaTYtJRUoUQ1vAjsnpx0QmkszxcTkCQK1f
 EnOzHP8+FM9qrjEJ8znAPwUg1mgVaUQo6oWRXHpuHlnLTIAKZqqK6UtHfPM7NqzI8/
 /y0k9aiJH+0XHNmZpCESikQdr7fQ4Bej3LtO47+8RIDIbQM02S90xuv6n3G9wD6jWR
 mrpLy/4PvwNuBgtTlUV/gSleToWNNn/w2gFGrXeNrd5hh+eYJ5HZJO3K9NL9XwtX0e
 JmFDe47NMYz1Q==
Date: Wed, 5 Mar 2025 14:38:24 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20250305143824.138a2605@jic23-huawei>
In-Reply-To: <20250224180150.3689638-4-fabrice.gasnier@foss.st.com>
References: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
 <20250224180150.3689638-4-fabrice.gasnier@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: robh@kernel.org, conor+dt@kernel.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com, lee@kernel.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 ukleinek@kernel.org, krzk+dt@kernel.org, will@kernel.org, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH 3/8] iio: trigger: stm32-lptimer: add
 support for stm32mp25
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

On Mon, 24 Feb 2025 19:01:45 +0100
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> From: Olivier Moysan <olivier.moysan@foss.st.com>
> 
> Add support for STM32MP25 SoC. Use newly introduced compatible to handle
> this new HW variant. Add new trigger definitions that can be used by the
> stm32 analog-to-digital converter. Use compatible data to identify them.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Hi. I'm not really following why you can't use devm calls for the
trigger probe path and hence why you need the explicit remove.
Feels like a lot of infrastructure and I can't see why we need it.

Jonathan


> @@ -54,25 +82,49 @@ bool is_stm32_lptim_trigger(struct iio_trigger *trig)
>  }
>  EXPORT_SYMBOL(is_stm32_lptim_trigger);
>  
> -static int stm32_lptim_setup_trig(struct stm32_lptim_trigger *priv)
> +static void stm32_lptim_unregister_triggers(struct stm32_lptim_trigger *priv)
>  {
> -	struct iio_trigger *trig;
> +	struct iio_trigger *tr;
>  
> -	trig = devm_iio_trigger_alloc(priv->dev, "%s", priv->trg);
> -	if  (!trig)
> -		return -ENOMEM;
> +	list_for_each_entry(tr, &priv->tr_list, alloc_list)
> +		iio_trigger_unregister(tr);
> +}
> +
> +static int stm32_lptim_register_triggers(struct stm32_lptim_trigger *priv)
> +{
> +	const char * const *cur = priv->triggers;
> +	int ret;
>  
> -	trig->dev.parent = priv->dev->parent;
> -	trig->ops = &stm32_lptim_trigger_ops;
> -	iio_trigger_set_drvdata(trig, priv);
> +	INIT_LIST_HEAD(&priv->tr_list);
>  
> -	return devm_iio_trigger_register(priv->dev, trig);
> +	while (cur && *cur) {
> +		struct iio_trigger *trig;
> +
> +		trig = devm_iio_trigger_alloc(priv->dev, "%s", *cur);
> +		if  (!trig)
> +			return -ENOMEM;
> +
> +		trig->dev.parent = priv->dev->parent;
> +		trig->ops = &stm32_lptim_trigger_ops;
> +		iio_trigger_set_drvdata(trig, priv);
> +
> +		ret = iio_trigger_register(trig);

I'm not really following why you can't use devm_iio_trigger_register() here
and avoid your own tracking with the list below.


> +		if (ret)
> +			return ret;
> +
> +		list_add_tail(&trig->alloc_list, &priv->tr_list);
> +		cur++;
> +	}
> +
> +	return 0;
>  }
>  
>  static int stm32_lptim_trigger_probe(struct platform_device *pdev)
>  {
>  	struct stm32_lptim_trigger *priv;
> +	struct stm32_lptim_cfg const *lptim_cfg;
>  	u32 index;
> +	int ret;
>  
>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
> @@ -81,23 +133,42 @@ static int stm32_lptim_trigger_probe(struct platform_device *pdev)
>  	if (device_property_read_u32(&pdev->dev, "reg", &index))
>  		return -EINVAL;
>  
> -	if (index >= ARRAY_SIZE(stm32_lptim_triggers))
> +	lptim_cfg = device_get_match_data(&pdev->dev);
> +
> +	if (index >= lptim_cfg->nb_triggers)
>  		return -EINVAL;
>  
>  	priv->dev = &pdev->dev;
> -	priv->trg = stm32_lptim_triggers[index];
> +	priv->triggers = lptim_cfg->triggers[index];
> +
> +	ret = stm32_lptim_register_triggers(priv);
> +	if (ret) {
> +		stm32_lptim_unregister_triggers(priv);
> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	return 0;
> +}
> +
> +static void stm32_lptim_trigger_remove(struct platform_device *pdev)
> +{
> +	struct stm32_lptim_trigger *priv = platform_get_drvdata(pdev);
>  
> -	return stm32_lptim_setup_trig(priv);
> +	stm32_lptim_unregister_triggers(priv);

Why not a devm_add_action_or_reset?
or for that matter a devm_iio_trigger_register() in the first place.

>  }
>  
>  static const struct of_device_id stm32_lptim_trig_of_match[] = {
> -	{ .compatible = "st,stm32-lptimer-trigger", },
> +	{ .compatible = "st,stm32-lptimer-trigger", .data = (void *)&stm32mp15_lptim_cfg },
> +	{ .compatible = "st,stm32mp25-lptimer-trigger", .data = (void *)&stm32mp25_lptim_cfg},
Why cast away a const then pass it to a const void *?

That is I don't think the casts are needed.

>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, stm32_lptim_trig_of_match);
>  
>  static struct platform_driver stm32_lptim_trigger_driver = {
>  	.probe = stm32_lptim_trigger_probe,
> +	.remove = stm32_lptim_trigger_remove,
>  	.driver = {
>  		.name = "stm32-lptimer-trigger",
>  		.of_match_table = stm32_lptim_trig_of_match,
> diff --git a/include/linux/iio/timer/stm32-lptim-trigger.h b/include/linux/iio/timer/stm32-lptim-trigger.h
> index a34dcf6a6001..ce3cf0addb2e 100644
> --- a/include/linux/iio/timer/stm32-lptim-trigger.h
> +++ b/include/linux/iio/timer/stm32-lptim-trigger.h
> @@ -14,6 +14,15 @@
>  #define LPTIM1_OUT	"lptim1_out"
>  #define LPTIM2_OUT	"lptim2_out"
>  #define LPTIM3_OUT	"lptim3_out"
> +#define LPTIM4_OUT	"lptim4_out"
> +#define LPTIM5_OUT	"lptim5_out"
> +
> +#define LPTIM1_CH1	"lptim1_ch1"
> +#define LPTIM1_CH2	"lptim1_ch2"
> +#define LPTIM2_CH1	"lptim2_ch1"
> +#define LPTIM2_CH2	"lptim2_ch2"
> +#define LPTIM3_CH1	"lptim3_ch1"
> +#define LPTIM4_CH1	"lptim4_ch1"
>  
>  #if IS_REACHABLE(CONFIG_IIO_STM32_LPTIMER_TRIGGER)
>  bool is_stm32_lptim_trigger(struct iio_trigger *trig);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
