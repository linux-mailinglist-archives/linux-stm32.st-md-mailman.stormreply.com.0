Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E39E64381D
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Dec 2022 23:30:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E3AFC65E63;
	Mon,  5 Dec 2022 22:30:39 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E09C4C65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Dec 2022 22:30:37 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 73F5F1C09F4; Mon,  5 Dec 2022 23:30:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1670279436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0beeeN3x4oja6CoA48n0dgddbavIjL+s5ouQp7TTWtU=;
 b=Glfr3eDW908ut8l8ZtyxnivFsAwFhKrd91OZ8Hn4B5DsYqkFacSwVHpMdO+0ZJbEke3io+
 rZJ6H6RfHZXL+x1iQ654lTF809RKZz+X/69jMIvQbgjOVGWGx/4uVo747OBUmRhyZzWmxv
 I6Gh8EjJUSygmU/FfosMXAkJOwmFGvg=
Date: Mon, 5 Dec 2022 23:30:35 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <Y45xC/Gwhrr+fctN@duo.ucw.cz>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Satya Priya <quic_c_skakit@quicinc.com>, Guenter Roeck <groeck@chromium.org>,
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
Content-Type: multipart/mixed; boundary="===============2261364040442922043=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2261364040442922043==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZBm0pYJnT4srarSL"
Content-Disposition: inline


--ZBm0pYJnT4srarSL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> .get_state() might fail in some cases. To make it possible that a driver
> signals such a failure change the prototype of .get_state() to return an
> error code.
>=20
> This patch was created using coccinelle and the following semantic patch:
>=20
> @p1@
> identifier getstatefunc;
> identifier driver;
> @@
>  struct pwm_ops driver =3D {
>         ...,
>         .get_state =3D getstatefunc
>         ,...
>  };
>=20
> @p2@
> identifier p1.getstatefunc;
> identifier chip, pwm, state;
> @@
> -void
> +int
>  getstatefunc(struct pwm_chip *chip, struct pwm_device *pwm, struct pwm_s=
tate *state)
>  {
>    ...
> -  return;
> +  return 0;
>    ...
>  }
>=20
> plus the actual change of the prototype in include/linux/pwm.h (plus some
> manual fixing of indentions and empty lines).
>=20
> So for now all drivers return success unconditionally. They are adapted
> in the following patches to make the changes easier reviewable.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

LED part:

Acked-by: Pavel Machek <pavel@ucw.cz>

Best regards,
							Pavel

>  static const struct pwm_ops ti_sn_pwm_ops =3D {
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qco=
m-lpg.c
> index 02f51cc61837..741cc2fd817d 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -968,8 +968,8 @@ static int lpg_pwm_apply(struct pwm_chip *chip, struc=
t pwm_device *pwm,
>  	return ret;
>  }
> =20
> -static void lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *=
pwm,
> -			      struct pwm_state *state)
> +static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *p=
wm,
> +			     struct pwm_state *state)
>  {
>  	struct lpg *lpg =3D container_of(chip, struct lpg, pwm);
>  	struct lpg_channel *chan =3D &lpg->channels[pwm->hwpwm];
> @@ -982,20 +982,20 @@ static void lpg_pwm_get_state(struct pwm_chip *chip=
, struct pwm_device *pwm,
> =20
>  	ret =3D regmap_read(lpg->map, chan->base + LPG_SIZE_CLK_REG, &val);
>  	if (ret)
> -		return;
> +		return 0;
> =20
>  	refclk =3D lpg_clk_rates[val & PWM_CLK_SELECT_MASK];
>  	if (refclk) {
>  		ret =3D regmap_read(lpg->map, chan->base + LPG_PREDIV_CLK_REG, &val);
>  		if (ret)
> -			return;
> +			return 0;
> =20
>  		pre_div =3D lpg_pre_divs[FIELD_GET(PWM_FREQ_PRE_DIV_MASK, val)];
>  		m =3D FIELD_GET(PWM_FREQ_EXP_MASK, val);
> =20
>  		ret =3D regmap_bulk_read(lpg->map, chan->base + PWM_VALUE_REG, &pwm_va=
lue, sizeof(pwm_value));
>  		if (ret)
> -			return;
> +			return 0;
> =20
>  		state->period =3D DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * LPG_RESOLUTION =
* pre_div * (1 << m), refclk);
>  		state->duty_cycle =3D DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * pwm_value *=
 pre_div * (1 << m), refclk);
> @@ -1006,13 +1006,15 @@ static void lpg_pwm_get_state(struct pwm_chip *ch=
ip, struct pwm_device *pwm,
> =20
>  	ret =3D regmap_read(lpg->map, chan->base + PWM_ENABLE_CONTROL_REG, &val=
);
>  	if (ret)
> -		return;
> +		return 0;
> =20
>  	state->enabled =3D FIELD_GET(LPG_ENABLE_CONTROL_OUTPUT, val);
>  	state->polarity =3D PWM_POLARITY_NORMAL;
> =20
>  	if (state->duty_cycle > state->period)
>  		state->duty_cycle =3D state->period;
> +
> +	return 0;
>  }

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--ZBm0pYJnT4srarSL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCY45xCwAKCRAw5/Bqldv6
8qEdAKCcIFDwtp8cJpPtW1EpTb0IJOYYKwCdGtyKdQYCFKVLwV+BGw7lryK0MC8=
=gb+Q
-----END PGP SIGNATURE-----

--ZBm0pYJnT4srarSL--

--===============2261364040442922043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2261364040442922043==--
