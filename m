Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE49CF7C42
	for <lists+linux-stm32@lfdr.de>; Tue, 06 Jan 2026 11:23:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B653C8F277;
	Tue,  6 Jan 2026 10:23:03 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B609FC60463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jan 2026 10:23:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A3B8560148;
 Tue,  6 Jan 2026 10:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB1BC116C6;
 Tue,  6 Jan 2026 10:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767694980;
 bh=coo59hx6eOu0vGs3Mvf5pYDqS+tTCWWQ6cQTmjAtPpY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mcz3AnU23rCd7g3gAAoHuH2oXu847Aljn2Lu4uQGu+fOUwY98XYRy56C4NQ2xr/6H
 n3fDnSqJiEiZTRkdxhwqdYAz7+f70bW/89W3L6qv6lHSXbZ/jSXNbb8zzzdGDhX8mg
 d+hwEDGyB4Psr9wOQEs3oB0le+O72YKBXNM75qXJrXXaTnZRkgoC7dlmZTSNFuJTo4
 FR7DSFp7QCbJSZEF2w83sGjnfzva4fij8UUB/Ds/Tx8PsEwbCl02XICAcwFwHB6tAa
 9h2RV1+kXH6cDZtyAy07bcKSF6827rsrcl0Bp1RybJHH+TBtyItACp4/+Cd7uYIkXE
 tOzIc1SD/c60w==
Date: Tue, 6 Jan 2026 11:22:57 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Message-ID: <kemjjoyrhqglqq4p2j6kygspevq2mdbiujtnksw4rkdapoqcfy@zte2c7fhqvn3>
References: <20260106-stm32-pwm-v1-1-33e9e8a9fc33@geanix.com>
MIME-Version: 1.0
In-Reply-To: <20260106-stm32-pwm-v1-1-33e9e8a9fc33@geanix.com>
Cc: linux-pwm@vger.kernel.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32: handle polarity change when
	PWM is enabled
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
Content-Type: multipart/mixed; boundary="===============8649467173155811756=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8649467173155811756==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="adci6bclvlmizahh"
Content-Disposition: inline


--adci6bclvlmizahh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: stm32: handle polarity change when PWM is enabled
MIME-Version: 1.0

Hello Sean,

On Tue, Jan 06, 2026 at 08:01:57AM +0100, Sean Nyekjaer wrote:
> After commit 7346e7a058a2 ("pwm: stm32: Always do lazy disabling"),
> polarity changes are ignored. Updates to the TIMx_CCER CCxP bits are
> ignored by the hardware when the master output is enabled via the
> TIMx_BDTR MOE bit.
>=20
> Handle polarity changes by temporarily disabling the PWM when required,
> in line with apply() implementations used by other PWM drivers.
>=20
> Fixes: 7346e7a058a2 ("pwm: stm32: Always do lazy disabling")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
> This patch is only applicable for stable tree's <=3D 6.12
> How to explicitly state that and what is the procedure?

I haven't checked in detail yet but I wonder if the problem also exists
in newer kernels. Also I think that changing the polarity with the
hardware on happend before 7346e7a058a2; in that case you blamed the
wrong commit.

So even if we decide to apply a small targetted fix for the issue you
report to stable without an equivalent commit in mainline (due to the
rework the driver saw in v6.13-rc1~157^2~9^2~3 ("pwm: stm32:
Implementation of the waveform callbacks")), I refuse to do that if the
problem still exists in mainline.

> ---
>  drivers/pwm/pwm-stm32.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
> index eb24054f9729734da21eb96f2e37af03339e3440..d5f79e87a0653e1710d46e6bf=
9268a59638943fe 100644
> --- a/drivers/pwm/pwm-stm32.c
> +++ b/drivers/pwm/pwm-stm32.c
> @@ -452,15 +452,23 @@ static int stm32_pwm_apply(struct pwm_chip *chip, s=
truct pwm_device *pwm,
> =20
>  	enabled =3D pwm->state.enabled;
> =20
> +	if (state->polarity !=3D pwm->state.polarity) {
> +		if (enabled) {
> +			stm32_pwm_disable(priv, pwm->hwpwm);
> +			enabled =3D false;
> +		}
> +
> +		ret =3D stm32_pwm_set_polarity(priv, pwm->hwpwm, state->polarity);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	if (!state->enabled) {
>  		if (enabled)
>  			stm32_pwm_disable(priv, pwm->hwpwm);
>  		return 0;
>  	}
> =20
> -	if (state->polarity !=3D pwm->state.polarity)
> -		stm32_pwm_set_polarity(priv, pwm->hwpwm, state->polarity);
> -
>  	ret =3D stm32_pwm_config(priv, pwm->hwpwm,
>  			       state->duty_cycle, state->period);
>  	if (ret)

I would prefer the following change:

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index eb24054f9729..5f118c20f1ca 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -452,12 +452,16 @@ static int stm32_pwm_apply(struct pwm_chip *chip, str=
uct pwm_device *pwm,
=20
 	enabled =3D pwm->state.enabled;
=20
-	if (!state->enabled) {
+	/* The hardware must be disabled to honor polarity changes. */
+	if (!state->enabled || state->polarity !=3D pwm->state.polarity) {
 		if (enabled)
 			stm32_pwm_disable(priv, pwm->hwpwm);
-		return 0;
+		enabled =3D false;
 	}
=20
+	if (!state->enabled)
+		return 0;
+
 	if (state->polarity !=3D pwm->state.polarity)
 		stm32_pwm_set_polarity(priv, pwm->hwpwm, state->polarity);
=20
Maybe it's just me, but I think the resulting code is simpler with this
hunk.

I have hardware using this driver, will set it up later this week for
testing.

Best regards
Uwe

--adci6bclvlmizahh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlc4n4ACgkQj4D7WH0S
/k4PPQgAmawyHAcyv863JANknfAFeEAdQkQ06D1C/9LZyoVJJ7f5ozR8gwqQ+WDj
MyfVx+Te/oM2rj8Hz94OPihbcEo2aM0VVmWPgcthdcHGBGGPf907/Emts0L9TZi9
vWQIGys5Mc8DSJWB71krKZSngEEIup8AVQqoUxQIkLRTai7wPr5dH4P/BSe/eXRi
OgD+EV4ToZQUQl2VnaHakcqKTiDsE5C1KFFCnKwKhHT0YfdYb89BbjT6U9uKL/kc
BezmtEMe3rKH33czeKLwnKX0WXXCxY7zbHNgsA/Ukr5ZvrrUmlp/3Z+2n9xnnIGe
qEl/4av0tDgRaS2c+bcGCpfoYo8BJA==
=dPiB
-----END PGP SIGNATURE-----

--adci6bclvlmizahh--

--===============8649467173155811756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8649467173155811756==--
