Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3843729B0A
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Jun 2023 15:07:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 710B7C65E70;
	Fri,  9 Jun 2023 13:07:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07B2CC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jun 2023 13:07:06 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 359A3YsS008513; Fri, 9 Jun 2023 15:06:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=sYBwEPeeXVHCEaJ9zVgryQu6LOSyB5YipX+5SvAY0iI=;
 b=NfSxrEdNhzMx5h25ukxKXUgW9M//4dpO9nI21kUdgm1MXLHP9oKKXMFjM92gwiND9a6W
 q/eTq+1/Wcy4eU/I9rq1+EZzoczs8jiZkUrZ+oeSlZ64pOUDgq17M0p6A7esQ/8XXNL1
 rt10PqwCbarepLDuhldJ4DuoapAoOKji4ukpW28GA6x2/ouO7asn8U0LApWkKQbBZisv
 XLrOC5mGQuBpJE3wEPfJFSSUfp6FBuVlfX/akjFLknfGYNl7G/juHjLHZBS40lYt0dP0
 e2POSzqcss+rNWHToMGkfgLxXKbvAbvLzfEv7+2kCx74081Su5docSbTV3G3PpweIozj VA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r420813eg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jun 2023 15:06:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2D56E10002A;
 Fri,  9 Jun 2023 15:06:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2445F21A20A;
 Fri,  9 Jun 2023 15:06:51 +0200 (CEST)
Received: from [10.252.5.115] (10.252.5.115) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 9 Jun
 2023 15:06:48 +0200
Message-ID: <dac9c545-fcbc-3aec-c341-abc62f551703@foss.st.com>
Date: Fri, 9 Jun 2023 15:06:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Philipp Zabel <p.zabel@pengutronix.de>, Thierry Reding
 <thierry.reding@gmail.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230608-pwm-stm32-get-state-v1-1-db7e58a7461b@pengutronix.de>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20230608-pwm-stm32-get-state-v1-1-db7e58a7461b@pengutronix.de>
X-Originating-IP: [10.252.5.115]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_08,2023-06-09_01,2023-05-22_02
Cc: linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32: Implement .get_state()
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

Hi Philipp,

On 6/8/23 16:06, Philipp Zabel wrote:
> Stop stm32_pwm_detect_channels() from disabling all channels and count
> the number of enabled PWMs to keep the clock running. Implement the
> &pwm_ops->get_state callback so drivers can inherit PWM state set by
> the bootloader.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Make the necessary changes to allow inheriting PWM state set by the
> bootloader, for example to avoid flickering with a pre-enabled PWM
> backlight.
> ---
>  drivers/pwm/pwm-stm32.c | 75 ++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 59 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
> index 62e397aeb9aa..e0677c954bdf 100644
> --- a/drivers/pwm/pwm-stm32.c
> +++ b/drivers/pwm/pwm-stm32.c
> @@ -52,6 +52,21 @@ static u32 active_channels(struct stm32_pwm *dev)
>  	return ccer & TIM_CCER_CCXE;
>  }
>  
> +static int read_ccrx(struct stm32_pwm *dev, int ch, u32 *value)
> +{
> +	switch (ch) {
> +	case 0:
> +		return regmap_read(dev->regmap, TIM_CCR1, value);
> +	case 1:
> +		return regmap_read(dev->regmap, TIM_CCR2, value);
> +	case 2:
> +		return regmap_read(dev->regmap, TIM_CCR3, value);
> +	case 3:
> +		return regmap_read(dev->regmap, TIM_CCR4, value);
> +	}
> +	return -EINVAL;
> +}
> +
>  static int write_ccrx(struct stm32_pwm *dev, int ch, u32 value)
>  {
>  	switch (ch) {
> @@ -486,9 +501,40 @@ static int stm32_pwm_apply_locked(struct pwm_chip *chip, struct pwm_device *pwm,
>  	return ret;
>  }
>  
> +static int stm32_pwm_get_state(struct pwm_chip *chip,
> +			       struct pwm_device *pwm, struct pwm_state *state)
> +{
> +	struct stm32_pwm *priv = to_stm32_pwm_dev(chip);
> +	int ch = pwm->hwpwm;
> +	unsigned long rate;
> +	u32 ccer, psc, arr, ccr;
> +	u64 dty, prd;
> +	int ret;
> +
> +	ret = regmap_read(priv->regmap, TIM_CCER, &ccer);
> +	if (ret)
> +		return ret;
> +
> +	state->enabled = ccer & (TIM_CCER_CC1E << (ch * 4));
> +	state->polarity = (ccer & (TIM_CCER_CC1P << (ch * 4))) ?
> +			  PWM_POLARITY_INVERSED : PWM_POLARITY_NORMAL;
> +	regmap_read(priv->regmap, TIM_PSC, &psc);
> +	regmap_read(priv->regmap, TIM_ARR, &arr);
> +	read_ccrx(priv, ch, &ccr);
> +	rate = clk_get_rate(priv->clk);
> +
> +	prd = (u64)NSEC_PER_SEC * (psc + 1) * (arr + 1);
> +	state->period = DIV_ROUND_UP_ULL(prd, rate);
> +	dty = (u64)NSEC_PER_SEC * (psc + 1) * ccr;
> +	state->duty_cycle = DIV_ROUND_UP_ULL(dty, rate);

Just a question/thought, could it be worth to use DIV_ROUND_CLOSEST_ULL() ?

> +
> +	return ret;
> +}
> +
>  static const struct pwm_ops stm32pwm_ops = {
>  	.owner = THIS_MODULE,
>  	.apply = stm32_pwm_apply_locked,
> +	.get_state = stm32_pwm_get_state,
>  	.capture = IS_ENABLED(CONFIG_DMA_ENGINE) ? stm32_pwm_capture : NULL,
>  };
>  
> @@ -579,30 +625,22 @@ static void stm32_pwm_detect_complementary(struct stm32_pwm *priv)
>  	priv->have_complementary_output = (ccer != 0);
>  }
>  
> -static int stm32_pwm_detect_channels(struct stm32_pwm *priv)
> +static int stm32_pwm_detect_channels(struct stm32_pwm *priv, int *n_enabled)
>  {
> -	u32 ccer;
> -	int npwm = 0;
> +	u32 ccer, ccer_backup;
> +	int npwm;
>  
>  	/*
>  	 * If channels enable bits don't exist writing 1 will have no
>  	 * effect so we can detect and count them.
>  	 */
> +	regmap_read(priv->regmap, TIM_CCER, &ccer_backup);
>  	regmap_set_bits(priv->regmap, TIM_CCER, TIM_CCER_CCXE);
>  	regmap_read(priv->regmap, TIM_CCER, &ccer);
> -	regmap_clear_bits(priv->regmap, TIM_CCER, TIM_CCER_CCXE);
> +	regmap_write(priv->regmap, TIM_CCER, ccer_backup);
>  
> -	if (ccer & TIM_CCER_CC1E)
> -		npwm++;
> -
> -	if (ccer & TIM_CCER_CC2E)
> -		npwm++;
> -
> -	if (ccer & TIM_CCER_CC3E)
> -		npwm++;
> -
> -	if (ccer & TIM_CCER_CC4E)
> -		npwm++;
> +	npwm = hweight32(ccer & TIM_CCER_CCXE);
> +	*n_enabled = hweight32(ccer_backup & TIM_CCER_CCXE);
>  
>  	return npwm;
>  }
> @@ -613,7 +651,9 @@ static int stm32_pwm_probe(struct platform_device *pdev)
>  	struct device_node *np = dev->of_node;
>  	struct stm32_timers *ddata = dev_get_drvdata(pdev->dev.parent);
>  	struct stm32_pwm *priv;
> +	int n_enabled;
>  	int ret;
> +	int i;
>  
>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
> @@ -635,7 +675,10 @@ static int stm32_pwm_probe(struct platform_device *pdev)
>  
>  	priv->chip.dev = dev;
>  	priv->chip.ops = &stm32pwm_ops;
> -	priv->chip.npwm = stm32_pwm_detect_channels(priv);
> +	priv->chip.npwm = stm32_pwm_detect_channels(priv, &n_enabled);
> +

I'd suggest to comment a bit here, to explain it initializes the PWM
counter clock refcount in sync with PWM initial state left by the
bootloader.

In all case, this is fine for me, you can add my:
Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Best Regards,
Thanks,
Fabrice

> +	for (i = 0; i < n_enabled; i++)
> +		clk_enable(priv->clk);
>  
>  	ret = pwmchip_add(&priv->chip);
>  	if (ret < 0)
> 
> ---
> base-commit: ac9a78681b921877518763ba0e89202254349d1b
> change-id: 20230608-pwm-stm32-get-state-4107bcadd786
> 
> Best regards,
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
