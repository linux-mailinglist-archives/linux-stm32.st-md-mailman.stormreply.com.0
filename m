Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3D8757556
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jul 2023 09:30:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9459FC6A611;
	Tue, 18 Jul 2023 07:30:12 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E7E1C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 07:30:11 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-314172bac25so5180640f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 00:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689665410; x=1692257410;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UOxv6RlPtRQPUg3pZ2EfLHp019vUXq6b634A2+YLSY4=;
 b=WUX+f9s6Q4AOZv2hEfP8NWA/Dv+c/KHTGJPIizE1JcrqhVt9rkKdPsmDSNs+/GqbeH
 YPfdYrsN9b38BtshtUlEfJXw8sIHuin5ZGORF9tNMHkw1R8WXtBaADujgiIXledPYS5J
 v2CMXIeOT6tltKzLbRFoCLtIpURZXNhjDyFQb0nVhf6TuPs9ov2rUW06xFoK5lVX5S5/
 D5uIQoYeaGu3kgM3RpDkJTVKqbRSuXBkPa6SO2RGKTt5kWy3m/pEXDVwizVHm+T5XFcV
 5q4n+DD4EjBGbb9pWWKFZXNHsb8nF56x2Nn9A6OTlP+lh/Aba6gLDyHH5cPYXPBUKsU3
 WpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689665410; x=1692257410;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UOxv6RlPtRQPUg3pZ2EfLHp019vUXq6b634A2+YLSY4=;
 b=OgR4yySAIDVS2z+af2ANiBURRi1g4XkwZD/zLjVRxe0crhYXtHixHDklLu6Xhfg/YL
 PvESakt4Ay4jwu7/H4jDKRwEtTdzhqcYRgbF7CsmErasgJc7p5eAGc7AQfX7N5e7NGyY
 m4hFKfXjWn1eK3S7+APTg5Zx89dLDDxruRHORON1JIftxiT29O6EQOKCti7Yx73k/9s9
 cKJEpojPo02wx0vBRo4FyyuSTs9SsJXqxf7SCX8Pz+B0OawRD5DZYU2B85j3uFyA5AnI
 UbSUFE6N/WTsD530PJ+nkd2BHtC3uurZlrzXpXWbSu6vljXJUMIKWjaCPf6qmclgB7cV
 ST/w==
X-Gm-Message-State: ABy/qLb47tIV0pnjhkmTP/YTQbwbs7fTg9j0jfIct1uI1Gwa2ZsCMwM6
 iYK/CXdQTGPVmvLwpc53Ddw=
X-Google-Smtp-Source: APBJJlGd2Ifui1poUv1aZUdKI8gYX8iEPIxgqJJtVIVEhide0moYe92EeJy/EuFeYdYGfH3NA/AJ5g==
X-Received: by 2002:a5d:428b:0:b0:314:d31:f7 with SMTP id
 k11-20020a5d428b000000b003140d3100f7mr11254090wrq.63.1689665410245; 
 Tue, 18 Jul 2023 00:30:10 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a5d5347000000b003143add4396sm1526055wrv.22.2023.07.18.00.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 00:30:09 -0700 (PDT)
Date: Tue, 18 Jul 2023 09:30:08 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Message-ID: <ZLY_gER7FeEB07cw@orome>
References: <20230608-pwm-stm32-get-state-v1-1-db7e58a7461b@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230608-pwm-stm32-get-state-v1-1-db7e58a7461b@pengutronix.de>
User-Agent: Mutt/2.2.10 (2023-03-25)
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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
Content-Type: multipart/mixed; boundary="===============4091013962970049806=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4091013962970049806==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pr3XEzmve5GXh8Qb"
Content-Disposition: inline


--pr3XEzmve5GXh8Qb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 08, 2023 at 04:06:02PM +0200, Philipp Zabel wrote:
> Stop stm32_pwm_detect_channels() from disabling all channels and count
> the number of enabled PWMs to keep the clock running. Implement the
> &pwm_ops->get_state callback so drivers can inherit PWM state set by
> the bootloader.
>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Make the necessary changes to allow inheriting PWM state set by the
> bootloader, for example to avoid flickering with a pre-enabled PWM
> backlight.
> ---
>  drivers/pwm/pwm-stm32.c | 75 ++++++++++++++++++++++++++++++++++++++-----=
------
>  1 file changed, 59 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
> index 62e397aeb9aa..e0677c954bdf 100644
> --- a/drivers/pwm/pwm-stm32.c
> +++ b/drivers/pwm/pwm-stm32.c
> @@ -52,6 +52,21 @@ static u32 active_channels(struct stm32_pwm *dev)
>  	return ccer & TIM_CCER_CCXE;
>  }
> =20
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

Looking at the register definitions we should be able to replace this
with a single line and parameterize based on channel.

I realize you probably just copied from write_ccrx(), but might as well
improve this while at it. Could be a separate patch, though.

Also, ch should be unsigned int since it comes from pwm->hwpwm.

> +
>  static int write_ccrx(struct stm32_pwm *dev, int ch, u32 value)
>  {
>  	switch (ch) {
> @@ -486,9 +501,40 @@ static int stm32_pwm_apply_locked(struct pwm_chip *c=
hip, struct pwm_device *pwm,
>  	return ret;
>  }
> =20
> +static int stm32_pwm_get_state(struct pwm_chip *chip,
> +			       struct pwm_device *pwm, struct pwm_state *state)
> +{
> +	struct stm32_pwm *priv =3D to_stm32_pwm_dev(chip);
> +	int ch =3D pwm->hwpwm;

This should reflect the type of pwm->hwpwm.

> +	unsigned long rate;
> +	u32 ccer, psc, arr, ccr;
> +	u64 dty, prd;
> +	int ret;
> +
> +	ret =3D regmap_read(priv->regmap, TIM_CCER, &ccer);
> +	if (ret)
> +		return ret;
> +
> +	state->enabled =3D ccer & (TIM_CCER_CC1E << (ch * 4));
> +	state->polarity =3D (ccer & (TIM_CCER_CC1P << (ch * 4))) ?
> +			  PWM_POLARITY_INVERSED : PWM_POLARITY_NORMAL;
> +	regmap_read(priv->regmap, TIM_PSC, &psc);
> +	regmap_read(priv->regmap, TIM_ARR, &arr);

We should probably check regmap_read() consistently here.

> +	read_ccrx(priv, ch, &ccr);
> +	rate =3D clk_get_rate(priv->clk);
> +
> +	prd =3D (u64)NSEC_PER_SEC * (psc + 1) * (arr + 1);
> +	state->period =3D DIV_ROUND_UP_ULL(prd, rate);
> +	dty =3D (u64)NSEC_PER_SEC * (psc + 1) * ccr;
> +	state->duty_cycle =3D DIV_ROUND_UP_ULL(dty, rate);
> +
> +	return ret;
> +}
> +
>  static const struct pwm_ops stm32pwm_ops =3D {
>  	.owner =3D THIS_MODULE,
>  	.apply =3D stm32_pwm_apply_locked,
> +	.get_state =3D stm32_pwm_get_state,
>  	.capture =3D IS_ENABLED(CONFIG_DMA_ENGINE) ? stm32_pwm_capture : NULL,
>  };
> =20
> @@ -579,30 +625,22 @@ static void stm32_pwm_detect_complementary(struct s=
tm32_pwm *priv)
>  	priv->have_complementary_output =3D (ccer !=3D 0);
>  }
> =20
> -static int stm32_pwm_detect_channels(struct stm32_pwm *priv)
> +static int stm32_pwm_detect_channels(struct stm32_pwm *priv, int *n_enab=
led)

unsigned int * for n_enabled.

>  {
> -	u32 ccer;
> -	int npwm =3D 0;
> +	u32 ccer, ccer_backup;
> +	int npwm;

Also make this and the return value unsigned int while at it. These can
never be negative.

Thierry

--pr3XEzmve5GXh8Qb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS2P30ACgkQ3SOs138+
s6FVgQ/8DwHqcWHq8jW8Cj3oeOb2zx0zcFsabJGySzaN0DEG0+tG6QRqqaUj+kSy
J5G81hoLnLTiO3xyvFFM/5rh6LQe2cUUqiDJ3scER7YUGYShE6ay9tBfLY+jrPlw
rGI37WyPb8XgrnaHJLaHRBGGMkNhHWJu5mf4CEq+XW8NcsbS7mK+lPgDBjHMX5MC
rCk5a43je5potHQUmh+Cn+1JEz9S/RrulvneiA2J7AktjSWWPLkX4Ul9ALSqUXUh
cUDQsZxX7zk0TloXSUDfMlW+/E9ZlhYxDD1x1w1fXy8yEg95Le1v1YTJmejSNo8c
HAvjh4RDa//dsI+nEQJqmaE7VNdUhxODs4udliCy9RUsAzk7cMAShbCAAIvBuZ2v
dvvfxXdRv0gWIukq5B75bpYUsbs0k3liRL8E+McbWmoHBl6JJ2u7mSXU4m27ogIO
MFgCEhc1rVhd5sqVc+vuPMGkjAdFHYsjxX2lfWJLEYnb7lVvQbq5ee44+QYDmN4a
KL5vOwR0TFfWmVTzARSEI4P35Ls9nxFemdSj7zZ4FChTQ/VvHRVg/2NnYRJ2YEk/
wymb4HeIgBu6R0GUoZdhzs1NTYgz0PLgCYE/Yp0tW9q7R6wuoT4Ml4lJbSF8yyyv
Du2MFCxrqMnemzC8NB60GQDAlEHT3N9CgViwElAfzXUnzwEvhpc=
=6iB+
-----END PGP SIGNATURE-----

--pr3XEzmve5GXh8Qb--

--===============4091013962970049806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4091013962970049806==--
