Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8E2928F5F
	for <lists+linux-stm32@lfdr.de>; Sat,  6 Jul 2024 00:42:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6A33C71282;
	Fri,  5 Jul 2024 22:42:13 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC6F6C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 22:42:06 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a724a8097deso255884766b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jul 2024 15:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720219326; x=1720824126;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mUppU/lkzU3xzcHPedeqIyGAOs2uN9mWGr+GLHwrHbU=;
 b=AtbRfoANxb1eMr8MUBpnZszq4LaAUIjlMp/0SwUH/C2JKNXEBU5WhZv0fn5QRO1k6y
 FrJsmQCQROSUflzrPfAZ8HAP9LIrFbOHqbfUxw3NgeEPmeeM81YM45gYjv8AHbPz1yQ/
 SWWr+nvPkLI4NW6FeVOKYBJ48zu0EPWg/9ID4pX42Rvnbq1KToRoKxGcphpJ2v4euvfS
 G/WQLpa4c2UiY9OYMeQTyJaMM2WAJL3EfA5zSS1TJwxG/bl4w9sZoLBvHdCh7W6m789Y
 432+UhJXnUvfG4JVoPPa+k8+RyKc5AjdT3T/TAMylQU0dtCiI7jzHgCXvPk+eVXCYqFo
 1D4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720219326; x=1720824126;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mUppU/lkzU3xzcHPedeqIyGAOs2uN9mWGr+GLHwrHbU=;
 b=u0AEwFn0ta3HYzcRii5wh/AkI6HlRfzxEOL9rn2tdWD70aWMMGEZVsINJCFalUDkok
 wRMTyosUxsQNHn+jB0I9olCF1NcduoFFbLMLs8xHuo48VRtxIIWLLrdeUlQMGPLzyFwC
 kAj0vfDTGtjJ0XmVrZio4SdRgLtXngmnLCL6vdXdv7o3FNPlcSRO/6qnMxzCnOvJpypd
 9UluK75PSZRgAZws6AB9m9WY+COBwwj5BvEC9kdtzosTBJNbPwi6RRuLJ4s7+t3aXM5j
 fzhCMJT+h3uoodD/KeVN3Fbja5s2vSk/zKh8tusRb2nMwtt73Hnm8ASGo6TrdFvYYDy2
 K0Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3iX3Dro7aWsTMG1Rz9NVWnz/fGt4PEoZVKMkrXPs2HBR/4I+Wd42AargAXsC7/6WsoPuW8px61uQHOwwb/HsYVKX7ibDhZ1KEn4CzRrNpmAT0xhqbxYg+
X-Gm-Message-State: AOJu0YxTXPOA8moXzd3CqGBnYidqVC4TU5Lt69AtJJx7dUKtlAlVAMta
 GUN4PSKOKLbSc5PvLCyCO8bFOfC6FNILpYsGwQP2R3mJfm7Hbxri5BKIerW4LUwhWBT9gUW3thS
 WKbY=
X-Google-Smtp-Source: AGHT+IFZWboItQiUJ7AeUQsVS+Sh3p6421pIOvP7OOoXRqly+gYjGtaBz5w2pohD9dZz2VYUXg+IUA==
X-Received: by 2002:a17:906:f296:b0:a77:cdaa:88a7 with SMTP id
 a640c23a62f3a-a77cdaa8ac0mr196896266b.48.1720219325508; 
 Fri, 05 Jul 2024 15:42:05 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:5898:1844:403c:d2d6])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77dea1d4fcsm32264466b.127.2024.07.05.15.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 15:42:04 -0700 (PDT)
Date: Sat, 6 Jul 2024 00:42:02 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <kanykpgvxz57wuv2quejts3r32shfiwew2nangl6bn4qrows6m@7h2rchpeeemc>
References: <20240703110010.672654-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20240703110010.672654-2-u.kleine-koenig@baylibre.com>
Cc: linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32: Always do lazy disabling
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
Content-Type: multipart/mixed; boundary="===============8871475855815116985=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8871475855815116985==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qofqf7sh33crvhqo"
Content-Disposition: inline


--qofqf7sh33crvhqo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[Updated Benjamin's email address]

On Wed, Jul 03, 2024 at 01:00:06PM +0200, Uwe Kleine-K=F6nig wrote:
> When the state changes from enabled to disabled, polarity, duty_cycle
> and period are not configured in hardware and TIM_CCER_CCxE is just
> cleared. However if the state changes from one disabled state to
> another, all parameters are written to hardware because the early exit
> from stm32_pwm_apply() is only taken if the pwm is currently enabled.
>=20
> This yields surprises like: Applying
>=20
> 	{ .period =3D 1, .duty_cycle =3D 0, .enabled =3D false }
>=20
> succeeds if the pwm is initially on, but fails if it's already off
> because 1 is a too small period.
>=20
> Update the check for lazy disable to always exit early if the target
> state is disabled, no matter what is currently configured.
>=20
> Fixes: 7edf7369205b ("pwm: Add driver for STM32 plaftorm")
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

I applied this to my pwm/for-next branch. I applied it directly on top
of my last PR to Linus and rebased pwm/for-next on top of it, as it's a
fix that should come early. I won't send it for inclusion before 6.10,
but if another PR will become necessary before 6.10, I'll include this
patch.

Best regards
Uwe

--qofqf7sh33crvhqo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmaIdrgACgkQj4D7WH0S
/k5e8Qf/X6nczzHSx3sD+fghW/1L2ZuyMey9JqaDIh3XV/9CLj2kB3b7YgQ64gEr
HDr2vAUfUDXyutAf3CGmR0fpoVcBM1SUd4l2ZDdR6R1Ts2gfK2czk2UoWp82WEmK
t0M9e0wi4S5KKkxLtOWn0CeExH1zSNM7tXJ7EjATW6miL/mqSJdi4ifmKWFho3Vi
UuT4BpZcDjhzVH8gKxmlmALa/0prq62ogPuDHAbHjQ/jZ++J//25xh1/S5DVRKMx
eq+7cPZJJIPPR3qTjgSD62HDC9h3w5m5JvDfLb+gtSkAS8iCc6WxRUbZ/bc4b8nf
jJZvg3/y5wWY/atwKFuLMnaAUkGNkw==
=PxZ8
-----END PGP SIGNATURE-----

--qofqf7sh33crvhqo--

--===============8871475855815116985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8871475855815116985==--
