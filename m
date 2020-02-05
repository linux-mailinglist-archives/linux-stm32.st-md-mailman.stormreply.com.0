Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C4C153722
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2020 19:00:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43478C36B0B;
	Wed,  5 Feb 2020 18:00:07 +0000 (UTC)
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
 [209.85.161.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F17EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2020 18:00:01 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id l5so3224395ywd.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Feb 2020 10:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rRgXvPr3SwIij87seHPiKa5mQQ0rdFnyGB2bv1mFSf8=;
 b=Bk0/Cw3/MqA+hum9NqHHMRRRYzF3xdfomLI5myEg+7tMx0ZRORwJbupYsD5Fcx6/WZ
 +iTgQCiKWKSaAPUceVbmwxBP3dluyHQ+6itcBpIHPH0q6OoUk1GIhnSIFXyXx8F4s84y
 1QKv3u2CkJ4vqiaqrL+rDTyQ14PmxhCKsvjK/ky0/EuFW9l1Ze8Vnw29Zc/5/Pr4gVfw
 +4aXPQpSJi3RqV+SAES3L5WtWJN9Lo1Kz9EuSdnxMjYaE5HgsLMCcoyeqKiMvDaPV+eg
 t7eXrxmLxe12Pq8r+W4u487E9V0L5qQsikTa3ePAzgAfKaLzIBM8sWyHYe2UKPsCTdfA
 nL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rRgXvPr3SwIij87seHPiKa5mQQ0rdFnyGB2bv1mFSf8=;
 b=mIZ73xsNQe3hXwSDTIU+dj3czotLi4sl7zRVDzKuGBJb+hrb+HpgVenaUihZONuyTj
 PRdPRAfXDs/X+xl++wLplKcVXX0x96/Q6P+GUbY5PmPz6Fs/gtuT94qujCPa8fISkG6w
 f+f+OxpZJ7BhWo2re5INBft02Ys0EW/tegoJRmkvwTQOr1bHswGmKuBOO2ZKxp4yzJxe
 iZrutZSvXrNbz7fjpTyLdSOQir90q/ua1tk/LGWsnyy/LHXBk56tx2LNO7Caz8cfVSku
 AvguQTJ+982bEZ7Qr9tc03VPUjsaTgfK3csCq90AeTnKrlXqEa+gxbSN+YBpTipa29sr
 YD3w==
X-Gm-Message-State: APjAAAX5z4ru5If//p7MKq/R9HQPT0qtRDvFm+NVVYjsxesot72WydTX
 mdE0//njAqkCGM3/cQqlMHI=
X-Google-Smtp-Source: APXvYqxL/2f5r/cM0VlljtruqTfsVW5vkWvw0UbpVFlDnScpMN99cE8YToUz2/tGE3IbM8NbrZIfaw==
X-Received: by 2002:a81:11d7:: with SMTP id 206mr11978061ywr.150.1580925600074; 
 Wed, 05 Feb 2020 10:00:00 -0800 (PST)
Received: from icarus (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id h203sm216399ywb.98.2020.02.05.09.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 09:59:59 -0800 (PST)
Date: Wed, 5 Feb 2020 12:59:45 -0500
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@st.com>, jic23@kernel.org
Message-ID: <20200205175945.GA57132@icarus>
References: <1580899678-26393-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1580899678-26393-1-git-send-email-fabrice.gasnier@st.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-timer-cnt: add power
	management support
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

On Wed, Feb 05, 2020 at 11:47:58AM +0100, Fabrice Gasnier wrote:
> Add suspend/resume PM sleep ops. When going to low power, enforce the
> counter isn't active.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>

These changes are purely for the PM ops and don't involve the Counter
API, so I don't see any see any issues with this patch from my end.

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

> ---
>  drivers/counter/stm32-timer-cnt.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
> index 3eafcce..3b84503 100644
> --- a/drivers/counter/stm32-timer-cnt.c
> +++ b/drivers/counter/stm32-timer-cnt.c
> @@ -12,6 +12,7 @@
>  #include <linux/iio/types.h>
>  #include <linux/mfd/stm32-timers.h>
>  #include <linux/module.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>  
>  #define TIM_CCMR_CCXS	(BIT(8) | BIT(0))
> @@ -358,10 +359,33 @@ static int stm32_timer_cnt_probe(struct platform_device *pdev)
>  	priv->counter.num_signals = ARRAY_SIZE(stm32_signals);
>  	priv->counter.priv = priv;
>  
> +	platform_set_drvdata(pdev, priv);
> +
>  	/* Register Counter device */
>  	return devm_counter_register(dev, &priv->counter);
>  }
>  
> +static int __maybe_unused stm32_timer_cnt_suspend(struct device *dev)
> +{
> +	struct stm32_timer_cnt *priv = dev_get_drvdata(dev);
> +	u32 cr1;
> +
> +	/* Check for active counter */
> +	regmap_read(priv->regmap, TIM_CR1, &cr1);
> +	if (cr1 & TIM_CR1_CEN)
> +		return -EBUSY;
> +
> +	return pinctrl_pm_select_sleep_state(dev);
> +}
> +
> +static int __maybe_unused stm32_timer_cnt_resume(struct device *dev)
> +{
> +	return pinctrl_pm_select_default_state(dev);
> +}
> +
> +static SIMPLE_DEV_PM_OPS(stm32_timer_cnt_pm_ops, stm32_timer_cnt_suspend,
> +			 stm32_timer_cnt_resume);
> +
>  static const struct of_device_id stm32_timer_cnt_of_match[] = {
>  	{ .compatible = "st,stm32-timer-counter", },
>  	{},
> @@ -373,6 +397,7 @@ static struct platform_driver stm32_timer_cnt_driver = {
>  	.driver = {
>  		.name = "stm32-timer-counter",
>  		.of_match_table = stm32_timer_cnt_of_match,
> +		.pm = &stm32_timer_cnt_pm_ops,
>  	},
>  };
>  module_platform_driver(stm32_timer_cnt_driver);
> -- 
> 2.7.4
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
