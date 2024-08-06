Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E7F94971D
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Aug 2024 19:51:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9611C71290;
	Tue,  6 Aug 2024 17:51:38 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAC58C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2024 17:51:30 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52efd8807aaso1522637e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Aug 2024 10:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722966690; x=1723571490;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cEPV8O/bobIi5p9nTTiWHc/1HlnUPMSVdRAVbmjiJfA=;
 b=F3kNMFetmE4UjAOyDImuv5hjp37VB2DqWCegJ1IrG+l5iKe6umV016Wg9N6wpoDr8w
 vmaPoqoqC19F9zbXzAC6JLabczhz4bYBFAAVaLldbHi/C8myOLD8rC0HY4yDfMYVZswN
 vKNVD7wu8j6uLGp8oKK4wUCGrgzq6K2KfjyFJ8p+CxrPRzk/UpRRRLuVor85j6co3BqS
 pc16zYlEptVSRC0i3OpdVg0todI+Wz4BXkiMs189v/l5vOsIjdUd0tSrXYKgRD5tMxLB
 UXiaSWyK3ylNBlhTAz+FcW5SFPsgd7sGl3B7+ZvRLsF2eEVMaTh/wufUekuucyEat2nV
 CMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722966690; x=1723571490;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cEPV8O/bobIi5p9nTTiWHc/1HlnUPMSVdRAVbmjiJfA=;
 b=NQVwasxI2GuIOf1UgYi0LgYUkpO09/jAKu8Z1PG/i7sUwjLR8sIKBxWgYAXjuyuWl9
 FjLS4SaX2txsDpWGIz8OvK8gOhvbXuoyWc97tEfxhYWPCr8MSF8VEvPjx3i7+D7f6aW1
 Ppb5KKmUyMTNQVPdLh5uUbOS0xMUeVbHGgTfcHMicPWkS+ZtjfgGua4oRSn0hrWHs/um
 FzkTN7UsSTjEmsZayLwpkn1gsqS3n9tBs3IlUH0uQaGzoM0kaw/8JjJQeEhRMNvZHtew
 AB8ubBQlK3FbXMKydD8GqqgvlgneDk9vBeg1EjMEG0HOBrf9hL3JrRC+aAb2BZRinTPj
 CiKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSMuNuIoNT1nNbAy+4qVLr7ZDAoyc52o+ekBD1/gqz2aaua9z6Lb6Dxjp2tRx1sLIfUhE3fvMSzFZicOI8atN9idYmxu5E/n9nVVAh5FE0BzvpuEn0ZrGa
X-Gm-Message-State: AOJu0Yy3tUEa6LVx06FR3AvGb+UXY3ZtqvgosctKoS/YX96rrhZhKL1s
 vhmR/monPotZ7wgn8yVCF9tpv+V8SDgm8rncHvjVpWj98rW7ZhKr7+5YuHOkVNU=
X-Google-Smtp-Source: AGHT+IGSi4GuJh9qmDt/eZ6cr3AQur9jVGY7A+ektYUqG98TbGGq6brOhPykx5o83fi+1WZZTOQ8kw==
X-Received: by 2002:a05:6512:3ba5:b0:52e:fefe:49c9 with SMTP id
 2adb3069b0e04-530bb39ddf8mr12022225e87.36.1722966689606; 
 Tue, 06 Aug 2024 10:51:29 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ba442ed7f1sm4416778a12.81.2024.08.06.10.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 10:51:29 -0700 (PDT)
Date: Tue, 6 Aug 2024 19:51:27 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>
Message-ID: <ld2hbd7tnltcrwihhcjrloicpoorrve7ugtjxgyjcowoneas6p@dircm3eb6yok>
References: <cover.1722261050.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <cover.1722261050.git.u.kleine-koenig@baylibre.com>
Cc: Trevor Gamblin <tgamblin@baylibre.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 0/8] pwm: New abstraction and userspace
	API
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
Content-Type: multipart/mixed; boundary="===============4792225262381749116=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4792225262381749116==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rnjsu6vonelo7pj6"
Content-Disposition: inline


--rnjsu6vonelo7pj6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 04:34:16PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> here comes v3 of the series to add support for duty offset in PWM
> waveforms. For a single PWM output there is no gain, but if you have a
> chip with two (or more) outputs and both operate with the same period,
> you can generate an output like:
>=20
>=20
>                ______         ______         ______         ______
>    PWM #0  ___/      \_______/      \_______/      \_______/      \_______
>                  __             __             __             __   =20
>    PWM #1  _____/  \___________/  \___________/  \___________/  \_________
>               ^              ^              ^              ^
>=20
> Changes since v2, which is available from
> https://lore.kernel.org/linux-pwm/cover.1721040875.git.u.kleine-koenig@ba=
ylibre.com
> include:
>=20
>  - Degrade a dev_alert() to dev_warn() on feedback by David Lechner
>=20
>  - Improvement of various comments (partly in reply to David Lechner)
>=20
>  - Add _ns suffixes for members of pwm_waveform, thanks David for that su=
ggestion.
>=20
>  - Rebased to v6.11-rc1 + pwm/for-next.
>=20
> Because of these changes I didn't add Trevor's Reviewed-by tag for patch
> #3.
>=20
> I kept the BUG_ONs. There are a few check_patch warnings about it, but I =
still
> prefer these given that it is safe they don't trigger without further (bo=
gus)
> code changes and when they trigger crashing early is better than stack
> corruption. Also checkpatch tells
>         WARNING: Comparisons should place the constant on the right side =
of the test
>         #158: FILE: drivers/pwm/core.c:262:
>         +       BUG_ON(WFHWSIZE < ops->sizeof_wfhw);
>=20
> But as the BUG_ON is about WFHWSIZE being wrong, this order is OK.
>=20
> There are a few more checkpatch warnings about line lengths. Breaking
> the criticised lines further hurts readability IMHO, so I kept them. It
> gets a bit better once stm32_pwm_mul_u64_u64_div_u64_roundup() is
> implemented (without the stm32_pwm prefix) alongside
> mul_u64_u64_div_u64() in lib/math/div64.c, but I don't want to wait for
> that. I will address that once Nicolas's patch improving precision of
> mul_u64_u64_div_u64() landed. (Hmm, it's not in next any more since
> next-20240724, before it was 3cc8bf1a81efde105d8e57398cf8554b57768777 +
> dbbe95af0fad2a9d22a4b910cfc4b87949d61a3c).
>=20
> Best regards
> Uwe
>=20
> Uwe Kleine-K=F6nig (8):
>   pwm: Simplify pwm_capture()
>   pwm: Add more locking
>   pwm: New abstraction for PWM waveforms
>   pwm: Provide new consumer API functions for waveforms
>   pwm: Add support for pwmchip devices for faster and easier userspace
>     access
>   pwm: Add tracing for waveform callbacks
>   pwm: axi-pwmgen: Implementation of the waveform callbacks
>   pwm: stm32: Implementation of the waveform callbacks

I applied patch #1 which is a harmless cleanup for now. I will wait a
bit for the rest of the series, as during August I won't be able to
react to fall-outs reliably and quickly. I plan to apply this series
with PWM_IOCTL_GET_NUM_PWMS dropped directly after the next merge window
for cooking in next as long as possible.

Best regards
Uwe

--rnjsu6vonelo7pj6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmayYpwACgkQj4D7WH0S
/k5X6Af5AcYk85/lzILYN6aUXwXaafFzMLqD0NyuhAkvVU5nIXZV4zCAe5RIcAPQ
aMYc9HZgZcjnSLLwQdfUviOyI4O5pRXsTHlbhCww1G1iS5o0QWb5ioODTaJUmAFc
cgqGhmkIlFjA98c8ByAtxtS7NqpnuAcMmZSGf5YoFj7EAElBxKEOXApRVL6oUkpc
JURo6Ea4n/grMcvwkdT0px09TdCs80ZK5efU5QgVduB3ME8fzoI/S4vvNjgp10x6
Ur4eoGnXGRoJ4Uzcv3OY/ydc3STvoJ6mmTvFO2cgCDdpdHs8LwNM7GoDx8/jJ8gZ
HW0SHHwcjYziOe9BuAsEz4bw4JwdkA==
=FH+q
-----END PGP SIGNATURE-----

--rnjsu6vonelo7pj6--

--===============4792225262381749116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4792225262381749116==--
