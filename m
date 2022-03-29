Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BB54EB196
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 18:13:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D7E1C5EC6C;
	Tue, 29 Mar 2022 16:13:24 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 088EBC5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 16:13:23 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so1791987wmb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 09:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YTxP7HWRQagvLol49w9U8StQxxwKyv5+VjuLHJHzNBc=;
 b=xaD4Og1Xqqt/c+vuuNvNvPRGz0QjW7LfiuaJLGgqojn5KiEeGmfbb9hX5Iqw9D1QCv
 cbLo+8LQFk0quq/KXtXrPEZ3Ae+H573+RMGNPXj/dBVwmge/E08j10ZXwiTksoj/nZ1+
 JF/PjAU/rYfvs2ZkDWTK2X1iv+I3ioS0ZSNgsWvkOuU2CyY+72Lc3Vw1s81OI/NB+HUQ
 /NPpwTIKSCqCzIietzPRRCn+3Z3aKCz1jFRKoAiiocpXHH7xZE8iz3yIVpUlukDFpOhl
 FGU5m1kuJL9YmBczNFSXf6jjtID0BkoU4ys0izSF9lL9NqWPVc0qI7hZicay4HQ6Efvn
 aGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YTxP7HWRQagvLol49w9U8StQxxwKyv5+VjuLHJHzNBc=;
 b=2SyLowI/F/iw5wm+k4UWsrziPGLqqtKBqmEVHLKtd1CSF2EDzCiFSL2fJ2VWTxvSdO
 7RIrIWfZXUNoSuFUqz63XgnadAicOSFEa86AFqPRTECC+/9S1/qqKOBX6hK3Gq47V59T
 FDiRmlFIsa+YBzZn5jbMj4nH1QGWJ1nEX6fdOn0tw/axGWky6QaoZm8JSpKVY6veutVy
 UzhJGSkzsGVtyJczlnlo1+j10BrGJFd2bss7It7FvXaNfhtIfsSl4dL9d2olqFEW+tjk
 2ZjVMvEwpO11w9yOLQ0faoTXn7hf2f7V3qdbCOun34bIIS7H5CRAeyghOTifCr9dmi1O
 BxZw==
X-Gm-Message-State: AOAM531MLwpe3zobr3rvMaBlSNGNpO05fM1JtUVeZWoFWWDcmPZ6C+uM
 4yzRgyUkUXJqmnUUlZGGVbI7pw==
X-Google-Smtp-Source: ABdhPJxNC8QU4RkF7zsoVybBcs79idtSW/nKBSrMwv6YVnFFHPw6flf9Pyqw6kxzux0CMOPDesy1PQ==
X-Received: by 2002:a05:600c:4e8a:b0:380:e340:bfba with SMTP id
 f10-20020a05600c4e8a00b00380e340bfbamr542917wmq.80.1648570402437; 
 Tue, 29 Mar 2022 09:13:22 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:a663:978b:3ffb:7dc3?
 ([2001:861:44c0:66c0:a663:978b:3ffb:7dc3])
 by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b00205aa05fa03sm11025699wrr.58.2022.03.29.09.13.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 09:13:21 -0700 (PDT)
Message-ID: <94e888fe-d8fc-5379-302f-66d64f2ae10b@baylibre.com>
Date: Tue, 29 Mar 2022 18:13:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-10-andriy.shevchenko@linux.intel.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220329152926.50958-10-andriy.shevchenko@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Nancy Yuen <yuenn@google.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>,
 Tomasz Figa <tomasz.figa@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Benjamin Fair <benjaminfair@google.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Patrick Venture <venture@google.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH v2 09/13] pinctrl: meson: Rename REG_* to
	MREG_*
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

On 29/03/2022 17:29, Andy Shevchenko wrote:
> Rename REG_* to MREG_* as a prerequisite for enabling COMPILE_TEST.

What error do you hit ?

MREG_ is rather ugly, something like PINCONF_REG_ or more simpler MESON_REG_ would be more appropriate.

Neil

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/pinctrl/meson/pinctrl-meson.c | 24 ++++++++++++------------
>   drivers/pinctrl/meson/pinctrl-meson.h | 24 ++++++++++++------------
>   2 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 49851444a6e3..64da61ba2bb9 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -218,13 +218,13 @@ static int meson_pinconf_set_output(struct meson_pinctrl *pc,
>   				    unsigned int pin,
>   				    bool out)
>   {
> -	return meson_pinconf_set_gpio_bit(pc, pin, REG_DIR, !out);
> +	return meson_pinconf_set_gpio_bit(pc, pin, MREG_DIR, !out);
>   }
>   
>   static int meson_pinconf_get_output(struct meson_pinctrl *pc,
>   				    unsigned int pin)
>   {
> -	int ret = meson_pinconf_get_gpio_bit(pc, pin, REG_DIR);
> +	int ret = meson_pinconf_get_gpio_bit(pc, pin, MREG_DIR);
>   
>   	if (ret < 0)
>   		return ret;
> @@ -236,13 +236,13 @@ static int meson_pinconf_set_drive(struct meson_pinctrl *pc,
>   				   unsigned int pin,
>   				   bool high)
>   {
> -	return meson_pinconf_set_gpio_bit(pc, pin, REG_OUT, high);
> +	return meson_pinconf_set_gpio_bit(pc, pin, MREG_OUT, high);
>   }
>   
>   static int meson_pinconf_get_drive(struct meson_pinctrl *pc,
>   				   unsigned int pin)
>   {
> -	return meson_pinconf_get_gpio_bit(pc, pin, REG_OUT);
> +	return meson_pinconf_get_gpio_bit(pc, pin, MREG_OUT);
>   }
>   
>   static int meson_pinconf_set_output_drive(struct meson_pinctrl *pc,
> @@ -269,7 +269,7 @@ static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MREG_PULLEN, &reg, &bit);
>   	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit), 0);
>   	if (ret)
>   		return ret;
> @@ -288,7 +288,7 @@ static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MREG_PULL, &reg, &bit);
>   	if (pull_up)
>   		val = BIT(bit);
>   
> @@ -296,7 +296,7 @@ static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MREG_PULLEN, &reg, &bit);
>   	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit),	BIT(bit));
>   	if (ret)
>   		return ret;
> @@ -321,7 +321,7 @@ static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MREG_DS, &reg, &bit);
>   
>   	if (drive_strength_ua <= 500) {
>   		ds_val = MESON_PINCONF_DRV_500UA;
> @@ -407,7 +407,7 @@ static int meson_pinconf_get_pull(struct meson_pinctrl *pc, unsigned int pin)
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MREG_PULLEN, &reg, &bit);
>   
>   	ret = regmap_read(pc->reg_pullen, reg, &val);
>   	if (ret)
> @@ -416,7 +416,7 @@ static int meson_pinconf_get_pull(struct meson_pinctrl *pc, unsigned int pin)
>   	if (!(val & BIT(bit))) {
>   		conf = PIN_CONFIG_BIAS_DISABLE;
>   	} else {
> -		meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
> +		meson_calc_reg_and_bit(bank, pin, MREG_PULL, &reg, &bit);
>   
>   		ret = regmap_read(pc->reg_pull, reg, &val);
>   		if (ret)
> @@ -447,7 +447,7 @@ static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MREG_DS, &reg, &bit);
>   
>   	ret = regmap_read(pc->reg_ds, reg, &val);
>   	if (ret)
> @@ -595,7 +595,7 @@ static int meson_gpio_get(struct gpio_chip *chip, unsigned gpio)
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, gpio, REG_IN, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, gpio, MREG_IN, &reg, &bit);
>   	regmap_read(pc->reg_gpio, reg, &val);
>   
>   	return !!(val & BIT(bit));
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
> index ff5372e0a475..c00d9ad27843 100644
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
> +	MREG_PULLEN,
> +	MREG_PULL,
> +	MREG_DIR,
> +	MREG_OUT,
> +	MREG_IN,
> +	MREG_DS,
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
> +			[MREG_PULLEN]	= { per, peb },			\
> +			[MREG_PULL]	= { pr, pb },			\
> +			[MREG_DIR]	= { dr, db },			\
> +			[MREG_OUT]	= { or, ob },			\
> +			[MREG_IN]	= { ir, ib },			\
> +			[MREG_DS]	= { dsr, dsb },			\
>   		},							\
>   	 }
>   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
