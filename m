Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD4E91A2AC
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 11:31:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9790FC71282;
	Thu, 27 Jun 2024 09:31:30 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC192C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 09:31:23 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a689ad8d1f6so1019021166b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 02:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719480683; x=1720085483;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=81uADl9gzx1pZQLnpmU4eqBtf4JckqOzqIE2g/EMDAM=;
 b=zT9jHDIyLscQQcZnnCJf4MjQUhLgE9xiY0/x1Z7/LUdo8BGA73b2zm9wNtW+fqWH+p
 qmZgT4fpnvgG3vXn6FBGtFV6uyxqP7WoUm6G1Ynu+MQd+s33JvpxqxsF2b9ZmFGOahxk
 Ucm6vSLM6R6Yy4WEGMls4xBMxWjiKgRYanUt8b6SLOFw6Fpu9Yv6E/hWelBTO7P7z5vs
 LFZ8+mG31s2II7F2CRSUpnrCvQj2CfhZAu5Fd7HtDzf8JTjHspsga9D7Zc4WGI9pQQ/e
 WTjKs6AbTFsqDyjUBmMM5Bcvbtlx0WGgjBJUOXlHIpxjN8sGQR2CU3ZGLqnbFsp8Id+p
 KQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719480683; x=1720085483;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=81uADl9gzx1pZQLnpmU4eqBtf4JckqOzqIE2g/EMDAM=;
 b=NyQGkd6QVCFoCFINUwKdqr3VSjuA/YXWMlIefj3DNi8Ac9XneXr6iIvumkTtkePVpe
 sMnK++F0HQZfsdQKqeHfEmv4ZjBEJOrjlCweXUFLWyelTuKk9+Oqhms/SmYaFMkJ/Fbe
 DJjq2JIbyrU5cbu1fJNnbc0CKlCYxr8txiepmqPJ4nytwUz4xWx62Ce4bLt+TVb9TjUp
 oPbXLKFw3ONUGfl8H0RHBzv6xDurOwxj+nGczFKUMuYcXKZDz2uXKLgrYvNzgPiNmLuJ
 M5tgEcqG6DnW9KIuR0JCFFAo3JCiXLV4dakHUi0Z6aaUDCJnF+2XA4X3HZTduBD6bgdT
 LHNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY9ddi7Q1VmEmvDMssXhd1Eogv7YqJXCR+NhoQa132DHVCPVcHM/Wpw8s/vo+R6B4LDwaSNZfhzyVPfYHnqXa99bOMs9mIM67+h9IIYTRaIN94uBqr3LXt
X-Gm-Message-State: AOJu0YyFd7jyg68CVyChKSpEkxjbdOcRjkeJprG688YNNHcdDTWMjnpC
 xUnU/x6BIccO86Sqqep/hDOycLstC8gLjQHSV9coF9dB5LFhwjf7o8XkFWWdQHg=
X-Google-Smtp-Source: AGHT+IEZEakJrYlLWf81n+uR0SMouaD32H88SYgYSsBDf+TYDg+dUPUwNlB2qE6bsFfB8sg9nImaXw==
X-Received: by 2002:a17:907:a70d:b0:a72:8b89:f878 with SMTP id
 a640c23a62f3a-a728b8a01d0mr319543266b.76.1719480683323; 
 Thu, 27 Jun 2024 02:31:23 -0700 (PDT)
Received: from localhost (p50915e7b.dip0.t-ipconnect.de. [80.145.94.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a729d71f764sm41499566b.78.2024.06.27.02.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 02:31:22 -0700 (PDT)
Date: Thu, 27 Jun 2024 11:31:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <rrj2srkxpsomywut67sfmziuvi7w2vmbcrhtxxmr5tp376tdm7@6fce2i47xeus>
References: <20240613080229.2292413-2-u.kleine-koenig@baylibre.com>
 <b2796be8-d372-44e6-959c-e212097e99e8@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <b2796be8-d372-44e6-959c-e212097e99e8@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32mp135f-dk: Document output
	pins for PWMs
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
Content-Type: multipart/mixed; boundary="===============1720769412243247384=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1720769412243247384==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g3t24treeavhrh5t"
Content-Disposition: inline


--g3t24treeavhrh5t
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Alexandre,

On Thu, Jun 27, 2024 at 10:38:34AM +0200, Alexandre TORGUE wrote:
> On 6/13/24 10:02, Uwe Kleine-K=F6nig wrote:
> > To simplify identifying the pins where the PWM output is routed to,
> > add a comment to each PWM device about the respective pin on the
> > expansion connector.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > ---
> >   arch/arm/boot/dts/st/stm32mp135f-dk.dts | 4 ++++
> >   1 file changed, 4 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dt=
s/st/stm32mp135f-dk.dts
> > index 567e53ad285f..f1b50e4c1059 100644
> > --- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
> > +++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
> > @@ -273,6 +273,7 @@ &timers3 {
> >   	/delete-property/dma-names;
> >   	status =3D "disabled";
> >   	pwm {
> > +		/* PWM output on pin 7 of the expansion connector (CN8.7) using TIM3=
_CH4 function */
> >   		pinctrl-0 =3D <&pwm3_pins_a>;
> >   		pinctrl-1 =3D <&pwm3_sleep_pins_a>;
> >   		pinctrl-names =3D "default", "sleep";
> > @@ -288,6 +289,7 @@ &timers4 {
> >   	/delete-property/dma-names;
> >   	status =3D "disabled";
> >   	pwm {
> > +		/* PWM output on pin 31 of the expansion connector (CN8.31) using TI=
M4_CH2 function */
> >   		pinctrl-0 =3D <&pwm4_pins_a>;
> >   		pinctrl-1 =3D <&pwm4_sleep_pins_a>;
> >   		pinctrl-names =3D "default", "sleep";
> > @@ -303,6 +305,7 @@ &timers8 {
> >   	/delete-property/dma-names;
> >   	status =3D "disabled";
> >   	pwm {
> > +		/* PWM output on pin 32 of the expansion connector (CN8.32) using TI=
M8_CH3 function */
> >   		pinctrl-0 =3D <&pwm8_pins_a>;
> >   		pinctrl-1 =3D <&pwm8_sleep_pins_a>;
> >   		pinctrl-names =3D "default", "sleep";
> > @@ -316,6 +319,7 @@ timer@7 {
> >   &timers14 {
> >   	status =3D "disabled";
> >   	pwm {
> > +		/* PWM output on pin 33 of the expansion connector (CN8.33) using TI=
M14_CH1 function */
> >   		pinctrl-0 =3D <&pwm14_pins_a>;
> >   		pinctrl-1 =3D <&pwm14_sleep_pins_a>;
> >   		pinctrl-names =3D "default", "sleep";
> >=20
> > base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
>=20
> Good idea. Some lines exceed the 100 char. I could remove "function" or o=
nly
> keep "func" instead. What do u think ?

I don't care much and would have expected that the line length isn't
that critical. Anyhow, shorten it to func if you prefer.
=20
> Note also that commit should be: "ARM: dts: stm32: ....". i can fix it by
> myself.

Ack. I considered using

	ARM: dts: stm32: stm32mp135f-dk: ...

but that felt like duplicating so I dropped the "stm32" part. Feel free
to add it.

Best regards
Uwe

--g3t24treeavhrh5t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZ9MWYACgkQj4D7WH0S
/k5YgggAqvxKivSI3go5p4Kxakm/mRziyxTsR3IHJtpF/DxHnLNEsfDAKT7jTIwi
MCsbYDIt02wKebImeoA0oUkDhdrNxzdJr2e2v9DMZxu/aEQcyZUiO4zwHblDExQQ
VcFZVrJYQ5yE7XiQYJ82gpqzzLlv+a45Co5NYTcgYRJMUAZGqeKpD9plHCJcqo1W
HPsqLhGUjuaRjpgjKKjCFNHjn74Cc27Qp0UJ+XcQV7oTVAo7u4VvirSeInOb7qvZ
3BLs+KE1OxT93cc8hKtndD0KpoIE/RLhAUKl3HtxB2bdcqOPr9cg+fyGYwhl5jfm
59c/2GOMAb4LiHWot1tRQc/mXj5mZA==
=xp7e
-----END PGP SIGNATURE-----

--g3t24treeavhrh5t--

--===============1720769412243247384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1720769412243247384==--
