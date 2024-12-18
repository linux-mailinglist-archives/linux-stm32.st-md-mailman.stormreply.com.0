Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E33C9F6253
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2024 11:05:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 528CDC78012;
	Wed, 18 Dec 2024 10:05:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6019DC6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 10:05:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 247E35C05AF;
 Wed, 18 Dec 2024 10:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61230C4CECE;
 Wed, 18 Dec 2024 10:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734516305;
 bh=AvgDaXHtwbjGpgaswDIE8L8Q79jWldOS8jXiymOqhVI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GBoT5JfEG3pfz6gRlPYib7Y3mQXMytM4776pg7n11Ax/1FB1gGF4PuUGD0pu+/3M1
 fTdCR0peOq3XVYYzqgR8vTrocVlKfazgleENOepmy9l6Y+0M/G/HgcSs0NEXyhFhKi
 qCamv4C0sLyGxCYRNzV/XM2xd47k9vsx0M66oZduxJLuHnahexO0GL3uauj8eWoKsW
 ApyVzOM0NrEciAyArjzoJrM4Rd0mPQYYo46g3DWVWeAq/YEjyTsOGEfEDm6p66i/Da
 SpZEfRYPaO3SWX+ZRaCiTp3oy8IUamFvJX160Qyzu/CwVRUAlyaOtIeGzrbo40jRNW
 bk70WqLac5pQA==
Date: Wed, 18 Dec 2024 11:05:03 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <lptm6gh2lzjqxm26lbmdw4yr2fowo6ytxwzqwl65khrx5xpcox@u25yzz6ssdy5>
References: <20241218090153.742869-1-fabrice.gasnier@foss.st.com>
 <20241218090153.742869-6-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20241218090153.742869-6-fabrice.gasnier@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com, lee@kernel.org,
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH 5/9] pwm: stm32: add support for stm32mp25
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
Content-Type: multipart/mixed; boundary="===============8077431145907791403=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8077431145907791403==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o4ocvksavacg3j36"
Content-Disposition: inline


--o4ocvksavacg3j36
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/9] pwm: stm32: add support for stm32mp25
MIME-Version: 1.0

On Wed, Dec 18, 2024 at 10:01:49AM +0100, Fabrice Gasnier wrote:
> diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
> index 17e591f61efb..99383e09920e 100644
> --- a/drivers/pwm/pwm-stm32.c
> +++ b/drivers/pwm/pwm-stm32.c
> @@ -19,6 +19,7 @@
>  #define CCMR_CHANNEL_SHIFT 8
>  #define CCMR_CHANNEL_MASK  0xFF
>  #define MAX_BREAKINPUT 2
> +#define MAX_PWM_OUTPUT 4

I would prefer a less generic name. Something like STM32_PWM_MAX_OUTPUT.
=20
>  struct stm32_breakinput {
>  	u32 index;
> [...]
> @@ -790,11 +800,31 @@ static void stm32_pwm_detect_complementary(struct s=
tm32_pwm *priv)
>  	priv->have_complementary_output =3D (ccer !=3D 0);
>  }
> =20
> -static unsigned int stm32_pwm_detect_channels(struct regmap *regmap,
> +static unsigned int stm32_pwm_detect_channels(struct stm32_timers *ddata,
>  					      unsigned int *num_enabled)
>  {
> +	struct regmap *regmap =3D ddata->regmap;
>  	u32 ccer, ccer_backup;
> =20
> +	if (ddata->ipidr) {
> +		unsigned int npwm =3D 0;

No need to initialize npwm.

> +		u32 val;
> +
> +		/* Simply deduce from HWCFGR the number of outputs (MP25). */
> +		regmap_read(regmap, TIM_HWCFGR1, &val);
> +
> +		/*
> +		 * Timers may have more capture/compare channels than the
> +		 * actual number of PWM channel outputs (e.g. TIM_CH[1..4]).
> +		 */
> +		npwm =3D FIELD_GET(TIM_HWCFGR1_NB_OF_CC, val);
> +
> +		regmap_read(regmap, TIM_CCER, &ccer);
> +		*num_enabled =3D hweight32(ccer & TIM_CCER_CCXE);

So the part that determines *num_enabled is the same for both variants.
Maybe it's possible to share the code for that?

> +		return npwm < MAX_PWM_OUTPUT ? npwm : MAX_PWM_OUTPUT;
> +	}
> +
>  	/*
>  	 * If channels enable bits don't exist writing 1 will have no
>  	 * effect so we can detect and count them.

Best regards
Uwe

--o4ocvksavacg3j36
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdinkwACgkQj4D7WH0S
/k7nywf+JjLEk4Gaee/ADgMvYOiBEUH8OA9/D7Ae1isx7Ve33iUPYu57fZCQFdJ9
7ah0kiX1U5gsFd96TlfydpA3EjhrHr/t8DKL5ZL9WWiKPi68Bb1HM/MZrnh641TZ
xV6o0+OlYihaqYZpJkt93x0TXdg4+KR6PWk5aSVf47bWNC3jg3n1gLADY8GIKl/Y
Sk/j12ktASXSCxNOscdwhwdyNIHCbmH/rU3FA8lEA1H9/5UZ5ljUoZRxBeqDqptz
Qh4YiPPr1fs24A0/z4uh/W3CMkLkW8RXCCffGQprrejK0O1cb6JNhnAiMNZBLbcC
Wc1T1qulU2XYmW7Of1S4WCcelNWE+A==
=WbTY
-----END PGP SIGNATURE-----

--o4ocvksavacg3j36--

--===============8077431145907791403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8077431145907791403==--
