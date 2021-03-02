Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D3432AC97
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 00:42:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1663BC56638;
	Tue,  2 Mar 2021 23:42:39 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFE63C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Mar 2021 23:42:37 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id l7so10682418pfd.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Mar 2021 15:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fiAnoFjzacA0imTnyoKZQv76RqIEHnX2/K6oUxFXX4o=;
 b=EPlDnykTEOFwrrNi3VCTr2D0NAu7wA6HUJXPlvXRoxdtGjJWxudI+EHEjlDB+QbLsL
 /Dig1CEWUEbkI86kKdzt2MkqboP2zo9p5Csz/+Bp78OpGBZ2juV1ImJ/YI5pAxX/PMDx
 d8FEHsjy6PZ2z//B1TSxK6Fdra/ml7/EVUhs7bIIz2Ryc2QCoapDQYdt9q1j4hFYKr0R
 MSBdBTwNeUYpM9WAZxbngXJ5T7zB9gX4KIx4Za2BF/3n1Wuj6qcqKDrRHkDrn+dDdvIx
 WXHNJpMM+dwLkAri+AhVMV0Z8nlRjUSKAoQNXtgdmWkwxaGCUBT99J5aDWzs7DnGlN9R
 72cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fiAnoFjzacA0imTnyoKZQv76RqIEHnX2/K6oUxFXX4o=;
 b=ddU0lIPnnHPM/mGkHNk8DzA1NRJc//p9gL+1+MxheNpdEXGgMzigV3fcDjCJwZw1Fl
 npkMH6NhBmHd6beK8H/QOiCIDhSX9bohGGI4Fy4jVAkkJWsQOX0n4iJob6umo9wXhB1w
 C5AZ0ArB7L55XvMdJ8NzkQIZTcNcssgoA9ZhMXwvv4a/ZBzy9J3ozxo/FFIvrmgXfLhg
 gbhFaTSRN/HC9/fRktYcXebasj6ogExGsdnpJiwh9Hhlv/Gx/2MVfX4VtXJ7tJJXC6Qt
 k5YRgc6MuTpD5IjhiQflYOGxRjrQ9HDWZHyzQeGmuQTmPuYgJ8auFPpmTKOQTfcFMVGd
 VWew==
X-Gm-Message-State: AOAM533GQktuvPbjl61MqygCS7jzDIFoGIdnrkd8NzoCp69ZC/uQgutS
 35LHVRDrFOzDy2Tlvm7yqNE=
X-Google-Smtp-Source: ABdhPJw28iH7elPLbDmtvEvdF40fXJweRxOIP3ohvJ71aWvfcCbL8d8nufDoY6fKQt5phiAIhCJArg==
X-Received: by 2002:a65:5c85:: with SMTP id a5mr19936436pgt.355.1614728556132; 
 Tue, 02 Mar 2021 15:42:36 -0800 (PST)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id h186sm21599877pgc.38.2021.03.02.15.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 15:42:35 -0800 (PST)
Date: Wed, 3 Mar 2021 08:42:30 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <YD7NZiqCtmtmqJGg@shinobu>
References: <1614696235-24088-1-git-send-email-fabrice.gasnier@foss.st.com>
 <YD5SLrdttn+95M7N@shinobu>
 <e54d1446-b583-9625-1ab3-09e54d6a7456@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <e54d1446-b583-9625-1ab3-09e54d6a7456@foss.st.com>
Cc: linux-iio@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org, david@lechnology.com
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-timer-cnt: fix ceiling
	write max value
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
Content-Type: multipart/mixed; boundary="===============8758582791079421540=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8758582791079421540==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bCkxX5gdifsBCD9i"
Content-Disposition: inline


--bCkxX5gdifsBCD9i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 06:03:25PM +0100, Fabrice Gasnier wrote:
> On 3/2/21 3:56 PM, William Breathitt Gray wrote:
> > Side question: if priv->ceiling is tracking the current ceiling
> > configuration, would it make sense to change stm32_count_ceiling_read()
> > to print the value of priv->ceiling instead of doing a regmap_read()
> > call?
>=20
> Hi William,
>=20
> Thanks for reviewing.
>=20
> I'd be fine either way. So no objection to move to the priv->ceiling
> (cached) value. It could also here here.
> By looking at this, I figured out there's probably another thing to fix
> here, for initial conditions.
>=20
> At probe time priv->ceiling is initialized to max value (ex 65535 for a
> 16 bits counter). But the register content is 0 (clear by mfd driver at
> probe time).
>=20
> - So, reading ceiling from sysfs currently reports 0 (regmap_read())
> after booting and probing.
>=20
> I see two cases at this point:
> - In case the counter gets enabled without any prior configuration, it
> won't count: ceiling value (e.g. 65535) should be written to register
> before it is enabled, so the counter will actually count. So there's
> room for a fix here.
>=20
> - In case function gets set (ex: quadrature x4), priv->ceiling (e.g.
> 65535) gets written to the register (although it's been read earlier as
> 0 from sysfs).
> This could be fixed by reading the priv->ceiling in
> stm32_count_ceiling_read() as you're asking (provided 1st case has been
> fixed as well)
>=20
> I'll probably prepare one or two patches for the above cases, if you agre=
e ?
>=20
> Best Regards,
> Fabrice

Looking through the driver, it doesn't seem like priv->ceiling is used
in any performance critical code, just the callbacks for count_write()
and function_set(). It might make more sense to remove priv->ceiling and
replace it with the regmap_read() calls where necessary so that we
always get the most current ceiling value from the device when needed.

As for the default ceiling value for the device at probe time, this
should probably be set to the max value because that is what a normal
user would expect when loading a Counter driver (a ceiling value of 0 at
startup is somewhat unintuitive).

If you prepare those two patches, then that should resolve this.

William Breathitt Gray

--bCkxX5gdifsBCD9i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmA+zVsACgkQhvpINdm7
VJJFfhAApkmoM+QVO5Ye1YiRiaPZVc4EraJ5xZXent7IGzIjHmwT8Z0mPz32vpVb
XI3Wab4NSUGT49jZxArKseAB8Q0ifCezMxTzgV10vAXPX1M7ys8rkT1lKQ77nuI0
3FGOVhSFX2Np29B1+TNTQWL9MqoH/vRk+IyZmWlMfoy2UkmxHo4zDCnAvx157bOD
ltBOol8XHodbZ4aSTooW5CnflMzPOetWEkc2w7BQ4MZaMJbQ8QGFTrTHd8N/V17+
KITYs3f0OHPBJL66O4+fLTfi66EZcy44OH+9+flDF2js8YZRX548z8T8yv6Vn2UK
eFHR0f1RTmBjL1BH6qvRdqZtwiBit6S40wcm7OxmC8HcLswReWLKd74v/ObEw9N9
2IfRhWtY+xw/G1G68OR4fuAw4xxU9K+lGXBF1G/UnD5zGCdBfDEbE3sIyHvheKWk
RnWlHD2KHfZlNL7e8pPabTHh/dX46D2NjAZbZTPYwB4y3vUPpbBaVJXH7TBAneEo
odk96y8aXnd9HItyeHVdb60Ie38NUsAhl0XOqI6ntrJ/XHzLHIeO313BXJ5p0J6y
WJRyrlJO8tZcl/K5KeQXohhuRRwmkAToM5GNvCPOn81tPMRZodNniuy59Y81PGaJ
5TQOBetBgKfy+I2EDWzzyFg7rQLBSG7d4wm6gHAqw9pO7RhjuXw=
=uxhN
-----END PGP SIGNATURE-----

--bCkxX5gdifsBCD9i--

--===============8758582791079421540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8758582791079421540==--
