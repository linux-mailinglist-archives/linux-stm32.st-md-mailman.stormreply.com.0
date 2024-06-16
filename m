Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C48E909DD4
	for <lists+linux-stm32@lfdr.de>; Sun, 16 Jun 2024 15:52:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CA7CC6A613;
	Sun, 16 Jun 2024 13:52:24 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBADCC5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Jun 2024 13:52:16 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a689ad8d1f6so445639866b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Jun 2024 06:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718545936; x=1719150736;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aVJOf5/S/BQ++7Tmt06zBPeufq5XHjAatccdENKQCfA=;
 b=Wtidh/kptYTAKDE3StfINiGIAResNeeZ6p4levaLE8bO5NEZJ30KwZKiYmFqXQBUSP
 2rC3iuRQDBuupQx5VMlZNGpnx2ijagGWI0Fi1Rvcic33zoVyP9NfUL+G0/Acyh9hCctf
 LxHPzjrqmVCSqITeQAHRcNklWiFKiuX0ci9aypWAXn7DrUThsGbJW8dSdqRJrMZQc6Ds
 otvl0YyfvVUCo7YnJuPPR8JGUs84mphpIQNw3ybmkh1wKTFTYb7+5f5hyHCIegehPHT+
 MH67tPttDT8CuThfO2+GxJm4ES6tSmaySKqoxnzZVRnF9PFPLEhAvZstnvnmpgORdoJO
 5zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718545936; x=1719150736;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aVJOf5/S/BQ++7Tmt06zBPeufq5XHjAatccdENKQCfA=;
 b=qDArElImj66webOVlP7zxTr6BC6SeJ7ptS1iMGpOTH4VtTksop0/dQBc3eCLkJDdAU
 zyWJjH5QtdhMKsJ7ev75yec25Mzprk7ogBeQ+lpjsBJbBYEfy1LVJoY1S8ResphCucEb
 c1xN5CzCrL7wzjOBzmXqmMAdsX46mdH4w7nKMWiLZ08Oe950nrakp99kJNsa9sCAthG7
 aVgdYSnJfQaYeV9eg1K8YNZhrG3KrJjJ3SXwm2eK6DIdL6MSeU4pgLt2WHQPBNc5zkBs
 GDX1fuQeYwPWvdgHtQcmb0r1RggLT630nmoy4FPYdKqsTe55O0tBkdCdg/mw9aAUUxnP
 hvYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQTa9JlNuyjfA3ZYrtJtw8eHoAvvnTfzc6NQxB49I1gx/QX/URmMTFLfEipKvuacl4jIP1+bUByK1kW6vJj83vF+DGhhNC8Dj2PGdBmfqIjBp6+3al+7JY
X-Gm-Message-State: AOJu0YxHVjmEyUO94ruVQrDMD1ElbyEGFnekNK2KdtY4KnMATb2329NT
 A9f7sFNiGMOgLramqBYC+b1coqhsCuXCyY+Uf/vsJKu2TOfbfmZeETIOdBPhutA=
X-Google-Smtp-Source: AGHT+IH3WlK5nGht5TKwUuvUI31oT45+8B2XU+5qpjxYRhgxr6FETxyNMI61Wq9e4b9BfDJLMiVz1g==
X-Received: by 2002:a17:906:91b:b0:a69:2288:41da with SMTP id
 a640c23a62f3a-a6f60d1e08bmr477224266b.30.1718545936279; 
 Sun, 16 Jun 2024 06:52:16 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f41a7asm411104566b.159.2024.06.16.06.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jun 2024 06:52:15 -0700 (PDT)
Date: Sun, 16 Jun 2024 15:52:13 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Message-ID: <vhbq2mpiervp5iwsfu2cbcvrxpfq6mr63uqyonyc7xt75jponi@h37z6g43ohdj>
References: <cover.1718352022.git.u.kleine-koenig@baylibre.com>
 <0735860960b1b38570bffa5b0de81a97f6e3230e.1718352022.git.u.kleine-koenig@baylibre.com>
 <20240614093124.GD3029315@google.com>
MIME-Version: 1.0
In-Reply-To: <20240614093124.GD3029315@google.com>
Cc: linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 William Breathitt Gray <wbg@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 3/4] mfd: stm32-timers: Drop
 TIM_DIER_CC_IE(x) in favour of TIM_DIER_CCxIE(x)
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
Content-Type: multipart/mixed; boundary="===============5624003310841313195=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5624003310841313195==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="khghdirpbdghwbcv"
Content-Disposition: inline


--khghdirpbdghwbcv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Lee,

On Fri, Jun 14, 2024 at 10:31:24AM +0100, Lee Jones wrote:
> On Fri, 14 Jun 2024, Uwe Kleine-K=F6nig wrote:
>=20
> > These two defines have the same purpose and this change doesn't
> > introduce any differences in drivers/counter/stm32-timer-cnt.o.
> >=20
> > The only difference between the two is that
> >=20
> > 	TIM_DIER_CC_IE(1) =3D=3D TIM_DIER_CC2IE
> >=20
> > while
> >=20
> > 	TIM_DIER_CCxIE(1) =3D=3D TIM_DIER_CC1IE
> >=20
> > . That makes it necessary to have an explicit "+ 1" in the user code,
> > but IMHO this is a good thing as this is the code locatation that
> > "knows" that for software channel 1 you have to use TIM_DIER_CC2IE
> > (because software guys start counting at 0, while the relevant hardware
> > designer started at 1).
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > ---
> >  drivers/counter/stm32-timer-cnt.c | 4 ++--
>=20
> The subject should be renamed.

I guess you mean it should be something like:

	counter: stm32-timer-cnt: Drop TIM_DIER_CC_IE(x) in favour of TIM_DIER_CCx=
IE(x + 1)

?

Best regards
Uwe

--khghdirpbdghwbcv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZu7gsACgkQj4D7WH0S
/k4MUQf/VqW+at8uAggESZjyPhgYcHEaQ1kceLpTrHqaFJgZmlPa2zZvoQvWskUX
DexhB9bLAR7QtFS7LOgcPBUkhM5pktmjD4H3FMQl7QxmoZqF6pQZQyLagrpmA77s
yc4aqiukIH9LrPU0v7sam+PTe0QbVc6LTlzl0dxS2x0VsIW+PhfPrYLT6jV13rpx
rz6fA/jEgAOA80N9iOaE59VEc6eICE68EZv8NrcAXpx8GHBDLQ643JKssZyfUC7E
f1tcK9tUAUzK4BWhbyRgOdrBCOLOpkgMkrsF4FTKeL0c3jhbtA55jT5EeMXElZcF
SZ8TODt9DDKZ2A77+7WBHfa1Uc7tBA==
=Bi6N
-----END PGP SIGNATURE-----

--khghdirpbdghwbcv--

--===============5624003310841313195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5624003310841313195==--
