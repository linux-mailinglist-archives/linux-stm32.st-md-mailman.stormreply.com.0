Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB064EC817
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 17:22:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FBC7C60467;
	Wed, 30 Mar 2022 15:22:25 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 889BBC01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 15:22:23 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 l7-20020a05600c1d0700b0038c99618859so139994wms.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 08:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VsktZd1lrpgrX+V/L1u1pkl3lthFyT18R1StRVOqeME=;
 b=BDBQTdTSUt24gLYrTuCs4gNhSDd1O1k0+jDSX4hWVEL3W35F5nbZjZ6EqJkh/9u0En
 erGGuiv2FmAgVkcHi3VHqY60MlgY9g8+jqhXktkdqhLkJlVMaGZhOJyBjUe3L/1I82Ir
 Ob5u3nAXtykeHInVc7gS8LV7ZCpdCIwQtC5JvG+lHvtkLf+hSTiJMi4N9X9O/5hl+NnC
 megWRTGELbcngkgNBzf9ZN0TE5dxEAtG8ySyHl9SWDbvG3MwcHB/dIloYWBD+IqWSWLT
 W8Gu5aWG9ktI2GAUpgQY8fZsYV7fj+mxmarBzBgzTQ8ToduTMTrGAhhDySSzxO536S9N
 x58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VsktZd1lrpgrX+V/L1u1pkl3lthFyT18R1StRVOqeME=;
 b=Pi9Tn7lS8VkISWATnrVuNqODvlnPiNdTqZF+52kAWIxNwBb8UJZtr3B87dCejqPEb4
 6EXoH24t4Mol/SoNjIGuZaKTpMhAtDshEdLSBjI4XtahuWId5fY+P703tWTnej6Ekayk
 8bUIYCUov4Qit6GzIhq2ws4Sx97IQU1EahAPWFiemH6hBCDZSJIRZchEYQEIqOQNGA0p
 vFT5fh7bTbQP38yMTQCoICxDGTQMefHv81i59898OIZYUp7rd7keIkPiwC/xCw2QkUrR
 nZTicR2epr0l1i/cCAUpL/jbFv5x/u5vHLyV90Bm2LuO5ES+3PCXujx084jfL8pZoRJc
 J3cw==
X-Gm-Message-State: AOAM533mMG8SI2XhAeReniS5WqINHu5jHxzuYRAbmiQ+THh05QIAEyVj
 0mavOe45WE6vYKFilATDOQVMig==
X-Google-Smtp-Source: ABdhPJzQnHg7FADFhfDN5WNwL6d7L/J0cN4GJJs3uwA9AeUV9+yD7d8e2R/SvmrTa8scE2MOsp2T/A==
X-Received: by 2002:a1c:f607:0:b0:381:1db:d767 with SMTP id
 w7-20020a1cf607000000b0038101dbd767mr4793481wmc.165.1648653742795; 
 Wed, 30 Mar 2022 08:22:22 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:e47f:3cdb:5811:cee8?
 ([2001:861:44c0:66c0:e47f:3cdb:5811:cee8])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a5d63c5000000b002040822b680sm25478862wrw.81.2022.03.30.08.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 08:22:22 -0700 (PDT)
Message-ID: <357c0ae6-7910-dfe5-eefa-1a7820e7e46b@baylibre.com>
Date: Wed, 30 Mar 2022 17:22:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20220330145030.1562-1-andriy.shevchenko@linux.intel.com>
 <20220330145030.1562-10-andriy.shevchenko@linux.intel.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220330145030.1562-10-andriy.shevchenko@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Nancy Yuen <yuenn@google.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Benjamin Fair <benjaminfair@google.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Patrick Venture <venture@google.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alim Akhtar <alim.akhtar@samsung.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 09/13] pinctrl: meson: Rename REG_* to
	MESON_REG_*
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 30/03/2022 16:50, Andy Shevchenko wrote:
> Rename REG_* to MESON_REG_* as a prerequisite for enabling COMPILE_TEST.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/pinctrl/meson/pinctrl-meson.c | 24 ++++++++++++------------
>   drivers/pinctrl/meson/pinctrl-meson.h | 24 ++++++++++++------------
>   2 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 49851444a6e3..5b46a0979db7 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -218,13 +218,13 @@ static int meson_pinconf_set_output(struct meson_pinctrl *pc,
>   				    unsigned int pin,
>   				    bool out)
>   {
> -	return meson_pinconf_set_gpio_bit(pc, pin, REG_DIR, !out);
> +	return meson_pinconf_set_gpio_bit(pc, pin, MESON_REG_DIR, !out);
>   }
>   
>   static int meson_pinconf_get_output(struct meson_pinctrl *pc,
>   				    unsigned int pin)
>   {
> -	int ret = meson_pinconf_get_gpio_bit(pc, pin, REG_DIR);
> +	int ret = meson_pinconf_get_gpio_bit(pc, pin, MESON_REG_DIR);
>   
>   	if (ret < 0)
>   		return ret;
> @@ -236,13 +236,13 @@ static int meson_pinconf_set_drive(struct meson_pinctrl *pc,
>   				   unsigned int pin,
>   				   bool high)
>   {
> -	return meson_pinconf_set_gpio_bit(pc, pin, REG_OUT, high);
> +	return meson_pinconf_set_gpio_bit(pc, pin, MESON_REG_OUT, high);
>   }
>   
>   static int meson_pinconf_get_drive(struct meson_pinctrl *pc,
>   				   unsigned int pin)
>   {
> -	return meson_pinconf_get_gpio_bit(pc, pin, REG_OUT);
> +	return meson_pinconf_get_gpio_bit(pc, pin, MESON_REG_OUT);
>   }
>   
>   static int meson_pinconf_set_output_drive(struct meson_pinctrl *pc,
> @@ -269,7 +269,7 @@ static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MESON_REG_PULLEN, &reg, &bit);
>   	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit), 0);
>   	if (ret)
>   		return ret;
> @@ -288,7 +288,7 @@ static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MESON_REG_PULL, &reg, &bit);
>   	if (pull_up)
>   		val = BIT(bit);
>   
> @@ -296,7 +296,7 @@ static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MESON_REG_PULLEN, &reg, &bit);
>   	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit),	BIT(bit));
>   	if (ret)
>   		return ret;
> @@ -321,7 +321,7 @@ static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MESON_REG_DS, &reg, &bit);
>   
>   	if (drive_strength_ua <= 500) {
>   		ds_val = MESON_PINCONF_DRV_500UA;
> @@ -407,7 +407,7 @@ static int meson_pinconf_get_pull(struct meson_pinctrl *pc, unsigned int pin)
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MESON_REG_PULLEN, &reg, &bit);
>   
>   	ret = regmap_read(pc->reg_pullen, reg, &val);
>   	if (ret)
> @@ -416,7 +416,7 @@ static int meson_pinconf_get_pull(struct meson_pinctrl *pc, unsigned int pin)
>   	if (!(val & BIT(bit))) {
>   		conf = PIN_CONFIG_BIAS_DISABLE;
>   	} else {
> -		meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
> +		meson_calc_reg_and_bit(bank, pin, MESON_REG_PULL, &reg, &bit);
>   
>   		ret = regmap_read(pc->reg_pull, reg, &val);
>   		if (ret)
> @@ -447,7 +447,7 @@ static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MESON_REG_DS, &reg, &bit);
>   
>   	ret = regmap_read(pc->reg_ds, reg, &val);
>   	if (ret)
> @@ -595,7 +595,7 @@ static int meson_gpio_get(struct gpio_chip *chip, unsigned gpio)
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, gpio, REG_IN, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, gpio, MESON_REG_IN, &reg, &bit);
>   	regmap_read(pc->reg_gpio, reg, &val);
>   
>   	return !!(val & BIT(bit));
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
> index ff5372e0a475..fa042cd6a7ff 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.h
> +++ b/drivers/pinctrl/meson/pinctrl-meson.h
> @@ -63,12 +63,12 @@ struct meson_reg_desc {
>    * enum meson_reg_type - type of registers encoded in @meson_reg_desc
>    */
>   enum meson_reg_type {
> -	REG_PULLEN,
> -	REG_PULL,
> -	REG_DIR,
> -	REG_OUT,
> -	REG_IN,
> -	REG_DS,
> +	MESON_REG_PULLEN,
> +	MESON_REG_PULL,
> +	MESON_REG_DIR,
> +	MESON_REG_OUT,
> +	MESON_REG_IN,
> +	MESON_REG_DS,
>   	NUM_REG,
>   };
>   
> @@ -150,12 +150,12 @@ struct meson_pinctrl {
>   		.irq_first	= fi,					\
>   		.irq_last	= li,					\
>   		.regs = {						\
> -			[REG_PULLEN]	= { per, peb },			\
> -			[REG_PULL]	= { pr, pb },			\
> -			[REG_DIR]	= { dr, db },			\
> -			[REG_OUT]	= { or, ob },			\
> -			[REG_IN]	= { ir, ib },			\
> -			[REG_DS]	= { dsr, dsb },			\
> +			[MESON_REG_PULLEN]	= { per, peb },		\
> +			[MESON_REG_PULL]	= { pr, pb },		\
> +			[MESON_REG_DIR]		= { dr, db },		\
> +			[MESON_REG_OUT]		= { or, ob },		\
> +			[MESON_REG_IN]		= { ir, ib },		\
> +			[MESON_REG_DS]		= { dsr, dsb },		\
>   		},							\
>   	 }
>   

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
