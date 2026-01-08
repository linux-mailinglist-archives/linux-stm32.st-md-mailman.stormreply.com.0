Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66262D012FE
	for <lists+linux-stm32@lfdr.de>; Thu, 08 Jan 2026 07:05:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 228BFC8F284;
	Thu,  8 Jan 2026 06:05:24 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66CC2C8F283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jan 2026 06:05:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 04C7F43F89;
 Thu,  8 Jan 2026 06:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B2EC16AAE;
 Thu,  8 Jan 2026 06:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767852321;
 bh=Y0fA6F5gUKCiQEzQ6rqIGJ2uKAFcVjNQMVrpQtOL7pY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lIXYRiaVhagNWfVsVfoP5Th5/6rWC/KxcfFTbaHxSGjmtjsWNnNb41BLHiRpxxXUq
 vD/8p65ebOpFi2ZzyaehMslFktgp/gOGRoC+Aw3EpY95vqUcq4h4mO8vFPTe5IUnsi
 7FlyRh8qCePW1T4IQxiinj05H1YcgON2RDiBmMwJT7Cz7dqfOiVuDypRrgxSHv4Rlw
 mzyArY6SuUnl/uC48lcx2F88VVTwsLodSYF7LXzqfoWclhwP6+d8ttZk/3j2hVYcIR
 uqqwTiXSYRJi4HGz17ytPKe1N/i9BM3/S6UxiFQeD+y2DUr75RXQnKcjUgzuzyzkZX
 XnSb5YRaAFR+g==
Date: Thu, 8 Jan 2026 07:05:15 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Message-ID: <zj2vpruzoeyvyyzxiqcffajyhpmem4q75l6gzgxd4jgaizhrdq@bxuudn4kyvr3>
References: <20260106-stm32-pwm-v1-1-33e9e8a9fc33@geanix.com>
 <kemjjoyrhqglqq4p2j6kygspevq2mdbiujtnksw4rkdapoqcfy@zte2c7fhqvn3>
 <2e2iahbzcepbzwgk7xeta2afxmycfjgv2zofzngqjvp4on46r2@mzpi4bz4uqie>
 <nwhixocvhii27jvcyg7ex5emewntgfhyxa4ds5vo2dphe7xfe4@ibjsjdd5fgmn>
 <fwaodg2ovh7j47ifwjhgeppxs3oiqht5ecbs7bmfbi7j6djejs@shwokpcmutr3>
MIME-Version: 1.0
In-Reply-To: <fwaodg2ovh7j47ifwjhgeppxs3oiqht5ecbs7bmfbi7j6djejs@shwokpcmutr3>
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
Content-Type: multipart/mixed; boundary="===============6066169715009873667=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6066169715009873667==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2fbnr5emdw3vpmkk"
Content-Disposition: inline


--2fbnr5emdw3vpmkk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: stm32: handle polarity change when PWM is enabled
MIME-Version: 1.0

Hello Sean,

On Wed, Jan 07, 2026 at 04:05:56PM +0000, Sean Nyekjaer wrote:
> On Wed, Jan 07, 2026 at 04:54:46PM +0100, Uwe Kleine-K=F6nig wrote:
> > On Tue, Jan 06, 2026 at 11:30:34AM +0000, Sean Nyekjaer wrote:
> > > On Tue, Jan 06, 2026 at 11:22:57AM +0100, Uwe Kleine-K=F6nig wrote:
> > > > On Tue, Jan 06, 2026 at 08:01:57AM +0100, Sean Nyekjaer wrote:
> > > > > After commit 7346e7a058a2 ("pwm: stm32: Always do lazy disabling"=
),
> > > > > polarity changes are ignored. Updates to the TIMx_CCER CCxP bits =
are
> > > > > ignored by the hardware when the master output is enabled via the
> > > > > TIMx_BDTR MOE bit.
> > > > [...]
> > > > I have hardware using this driver, will set it up later this week f=
or
> > > > testing.
> > >=20
> > > Very cool, looking forward to hear if you can re-produce.
> >=20
> > I cannot. I have:
> >=20
> > 	# uname -r
> > 	6.11.0-rc1-00028-geb18504ca5cf-dirty
> >=20
> > (the -dirty is only from enabling the pwm for my machine, no driver
> > changes)
> >=20
> > 	# cat /sys/kernel/debug/pwm
> > 	0: platform/40001000.timer:pwm, 4 PWM devices
> > 	...
> > 	 pwm-3   (sysfs               ): requested enabled period: 313720 ns d=
uty: 10000 ns polarity: normal
> >=20
> > and pulseview/sigrok detects 3.187251% with a period of 313.8 =B5s.
> >=20
> > After
> >=20
> > 	echo inversed > /sys/class/pwm/pwmchip0/pwm3/polarity
> >=20
> > the output changes to
> >=20
> > 	# cat /sys/kernel/debug/pwm
> > 	0: platform/40001000.timer:pwm, 4 PWM devices
> > 	...
> > 	 pwm-3   (sysfs               ): requested enabled period: 313720 ns d=
uty: 10000 ns polarity: inverse
> >=20
> > and pulseview/sigrok claims 96.812749% with a period of 313.8 =B5s.
> > So the polarity change happend as expected.
> >=20
> > This is on an st,stm32mp135f-dk board.
> >=20
> > Where is the difference to your observations?
> >=20
>=20
> Thanks for taking a look!
> I'm using the PWM for a backlight. With this [0] in my dts:
>=20
> [0]:
> 	backlight: backlight {
> 		compatible =3D "pwm-backlight";
> 		pwms =3D <&pwm4 0 125000 PWM_POLARITY_INVERTED>;
> 		brightness-levels =3D <102 235 255>;
> 		default-brightness-level =3D <80>;
> 		num-interpolated-steps =3D <100>;
> 		enable-gpios =3D <&gpiof 12 GPIO_ACTIVE_LOW>;
> 	status =3D "okay";
> 	};
>=20
> Maybe that is doing something differently.

What is the actual problem you have? I assume it's the backlight being
off after boot? Does it start working if you disable and reenable?

Can you please boot with

	trace_event=3Dpwm

on the command line and provide /sys/kernel/debug/tracing/trace from
after the problem happend?

Best regards
Uwe

--2fbnr5emdw3vpmkk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlfSRgACgkQj4D7WH0S
/k76/wf+NFddM6PhSOYwyq/PnXeCfIhk+HaeZvBs4UvpXIOr4ndVeTWKnzuWw1Da
Pg2CmR/mfGLa4KZFQx6++CwRb/vWKtaAWIFWO4WtVRG4GIGinHvzB6SOPMXrcPFZ
R0L+ORoiCV6U0sMqmQpOIVIE7k8hRSp0f3uIB1wJY4J1br/ltzBwi1BWDmj6WvmV
PIll80wwi3lEpWj18zpt74atfQG34YXeT+RoZNqj/FVUKxHMRS7WSE3/tSAnXiCw
csNFUAlb+htjXqecAZU9D6Ay9C1jUL5lCYxISZRQGB8alzYTSKA2KyuEHdhqzaYT
pE+/udBA5H5rD34ILTOdL4N3aY+5ew==
=ofVw
-----END PGP SIGNATURE-----

--2fbnr5emdw3vpmkk--

--===============6066169715009873667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6066169715009873667==--
