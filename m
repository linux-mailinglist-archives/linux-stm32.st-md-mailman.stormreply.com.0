Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0E6643606
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Dec 2022 21:50:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB611C65E63;
	Mon,  5 Dec 2022 20:50:29 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34E23C65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Dec 2022 20:50:28 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id n20so1548989ejh.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Dec 2022 12:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GVCjiKCCl/VeQNWt8PtvAxtZLBRlpY2z5UZuNcs/Lew=;
 b=XvJr+2rJm7JOHlq9x+fOv7NDm86bbibMxBpK63VeMD2EMqGdhu2XuWkgvVLdDR0z70
 rNjTyDDxW9o5ErSENlsUnIfCC0WhZuejJ2yih0mLoHswCM2M58xZp+WRXrhKHNzoDC98
 eywNrn9703v1hEHCC19pIxnm9UAOmv/ciCyk8aNqL1llwB1pwKlrAN3g0vWuCDVwec3u
 b2oe64W6gGqXEP/w77AW1mJZUnpIQaflKXXD7S2AxRLNn+kpk5aBgHioUah3AXqYRLz0
 Ni6YsVblS514+p5ZnwbjXWkaD6uhuoaqZS6tGC11waKPWHF6EekaoetSMeNIEbDaBvy2
 bqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GVCjiKCCl/VeQNWt8PtvAxtZLBRlpY2z5UZuNcs/Lew=;
 b=ldj1mED0TDFVSjTnfFB8hDJZm4OEpm7Wjiprc16r87WZL0g8jcdemNbKTsb5mz/4LZ
 CnKINrcSnYySQL/NGLsPC+Ll927x5dzRpX4k8GqRbUgbkToaAIhxoy3qjDEai0s4MqqN
 e1l2gASNi4RGKjshLBWZPQr5EW3vnqh2ZyyojKIT+fOKEPLuX2FKf2vdTghFAJ1Nf8Hf
 0Budy7I4KJ2Ia5h2Z1Hv9urWYXAvn4OGO17lf7eqz93QMk0099R4yoUId+JoR/3gf896
 zgRGWMbc5RzGvOjtl4srOhrxSeSusTD2aPvydsyglfAAXz/igwjOUxdn6PYrpLpN7MaP
 6hSw==
X-Gm-Message-State: ANoB5pkLv+n9KRKaTTYJRpIm4oWL0B3DJuUFsW+uiC6hdpWRiM4rO4sG
 9Y0LuSAu9wwoZNRWBPKutcQ=
X-Google-Smtp-Source: AA0mqf5OSt768BV9vzFy9k66tV39xf6Wmy4SS9KX61nTQHi4Fa5yPtn/xJX8Qo/SjgdCekjDSrIRXw==
X-Received: by 2002:a17:906:4b4a:b0:7c0:e5cb:aad8 with SMTP id
 j10-20020a1709064b4a00b007c0e5cbaad8mr7371981ejv.407.1670273427580; 
 Mon, 05 Dec 2022 12:50:27 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net.
 [82.149.19.102]) by smtp.gmail.com with ESMTPSA id
 g9-20020a17090670c900b0077f324979absm6580859ejk.67.2022.12.05.12.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 12:50:27 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Mon, 05 Dec 2022 21:50:24 +0100
Message-ID: <22881769.6Emhk5qWAg@kista>
In-Reply-To: <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Satya Priya <quic_c_skakit@quicinc.com>, Pavel Machek <pavel@ucw.cz>,
 Guenter Roeck <groeck@chromium.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-riscv@lists.infradead.org,
 linux-leds@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 chrome-platform@lists.linux.dev, Florian Fainelli <f.fainelli@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>,
 Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Michal Simek <michal.simek@xilinx.com>,
 linux-stm32@st-md-mailman.stormreply.com, Hammer Hsieh <hammerh0314@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Stephen Boyd <swboyd@chromium.org>, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>, Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v2 01/11] pwm: Make .get_state() callback
	return an error code
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Dne sreda, 30. november 2022 ob 16:21:38 CET je Uwe Kleine-K=F6nig napisal(=
a):
> .get_state() might fail in some cases. To make it possible that a driver
> signals such a failure change the prototype of .get_state() to return an
> error code.
> =

> This patch was created using coccinelle and the following semantic patch:
> =

> @p1@
> identifier getstatefunc;
> identifier driver;
> @@
>  struct pwm_ops driver =3D {
>         ...,
>         .get_state =3D getstatefunc
>         ,...
>  };
> =

> @p2@
> identifier p1.getstatefunc;
> identifier chip, pwm, state;
> @@
> -void
> +int
>  getstatefunc(struct pwm_chip *chip, struct pwm_device *pwm, struct
> pwm_state *state) {
>    ...
> -  return;
> +  return 0;
>    ...
>  }
> =

> plus the actual change of the prototype in include/linux/pwm.h (plus some
> manual fixing of indentions and empty lines).
> =

> So for now all drivers return success unconditionally. They are adapted
> in the following patches to make the changes easier reviewable.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpio/gpio-mvebu.c             |  9 ++++++---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 14 ++++++++------
>  drivers/leds/rgb/leds-qcom-lpg.c      | 14 ++++++++------
>  drivers/pwm/pwm-atmel.c               |  6 ++++--
>  drivers/pwm/pwm-bcm-iproc.c           |  8 +++++---
>  drivers/pwm/pwm-crc.c                 | 10 ++++++----
>  drivers/pwm/pwm-cros-ec.c             |  8 +++++---
>  drivers/pwm/pwm-dwc.c                 |  6 ++++--
>  drivers/pwm/pwm-hibvt.c               |  6 ++++--
>  drivers/pwm/pwm-imx-tpm.c             |  8 +++++---
>  drivers/pwm/pwm-imx27.c               |  8 +++++---
>  drivers/pwm/pwm-intel-lgm.c           |  6 ++++--
>  drivers/pwm/pwm-iqs620a.c             |  6 ++++--
>  drivers/pwm/pwm-keembay.c             |  6 ++++--
>  drivers/pwm/pwm-lpss.c                |  6 ++++--
>  drivers/pwm/pwm-meson.c               |  8 +++++---
>  drivers/pwm/pwm-mtk-disp.c            | 12 +++++++-----
>  drivers/pwm/pwm-pca9685.c             |  8 +++++---
>  drivers/pwm/pwm-raspberrypi-poe.c     |  8 +++++---
>  drivers/pwm/pwm-rockchip.c            | 12 +++++++-----
>  drivers/pwm/pwm-sifive.c              |  6 ++++--
>  drivers/pwm/pwm-sl28cpld.c            |  8 +++++---
>  drivers/pwm/pwm-sprd.c                |  8 +++++---
>  drivers/pwm/pwm-stm32-lp.c            |  8 +++++---
>  drivers/pwm/pwm-sun4i.c               | 12 +++++++-----
>  drivers/pwm/pwm-sunplus.c             |  6 ++++--
>  drivers/pwm/pwm-visconti.c            |  6 ++++--
>  drivers/pwm/pwm-xilinx.c              |  8 +++++---
>  include/linux/pwm.h                   |  4 ++--
>  29 files changed, 146 insertions(+), 89 deletions(-)
> =

<snip>
> diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
> index c8445b0a3339..37d75e252d4e 100644
> --- a/drivers/pwm/pwm-sun4i.c
> +++ b/drivers/pwm/pwm-sun4i.c
> @@ -108,9 +108,9 @@ static inline void sun4i_pwm_writel(struct
> sun4i_pwm_chip *chip, writel(val, chip->base + offset);
>  }
> =

> -static void sun4i_pwm_get_state(struct pwm_chip *chip,
> -				struct pwm_device *pwm,
> -				struct pwm_state *state)
> +static int sun4i_pwm_get_state(struct pwm_chip *chip,
> +			       struct pwm_device *pwm,
> +			       struct pwm_state *state)
>  {
>  	struct sun4i_pwm_chip *sun4i_pwm =3D to_sun4i_pwm_chip(chip);
>  	u64 clk_rate, tmp;
> @@ -132,7 +132,7 @@ static void sun4i_pwm_get_state(struct pwm_chip *chip,
>  		state->duty_cycle =3D DIV_ROUND_UP_ULL(state->period, 2);
>  		state->polarity =3D PWM_POLARITY_NORMAL;
>  		state->enabled =3D true;
> -		return;
> +		return 0;
>  	}
> =

>  	if ((PWM_REG_PRESCAL(val, pwm->hwpwm) =3D=3D PWM_PRESCAL_MASK) &&
> @@ -142,7 +142,7 @@ static void sun4i_pwm_get_state(struct pwm_chip *chip,
>  		prescaler =3D prescaler_table[PWM_REG_PRESCAL(val, pwm-
>hwpwm)];
> =

>  	if (prescaler =3D=3D 0)
> -		return;
> +		return 0;
> =

>  	if (val & BIT_CH(PWM_ACT_STATE, pwm->hwpwm))
>  		state->polarity =3D PWM_POLARITY_NORMAL;
> @@ -162,6 +162,8 @@ static void sun4i_pwm_get_state(struct pwm_chip *chip,
> =

>  	tmp =3D (u64)prescaler * NSEC_PER_SEC * PWM_REG_PRD(val);
>  	state->period =3D DIV_ROUND_CLOSEST_ULL(tmp, clk_rate);
> +
> +	return 0;
>  }
> =

>  static int sun4i_pwm_calculate(struct sun4i_pwm_chip *sun4i_pwm,

For sun4i:

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
