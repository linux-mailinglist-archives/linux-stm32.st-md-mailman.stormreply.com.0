Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D195DCFEB60
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 16:54:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87010C8F282;
	Wed,  7 Jan 2026 15:54:52 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6971C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jan 2026 15:54:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 629524372A;
 Wed,  7 Jan 2026 15:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8AFAC4CEF1;
 Wed,  7 Jan 2026 15:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767801289;
 bh=dQHczuUO01yiJUoA4VVJbRjpUINgq/SBa7rpIL/696o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MzrWFiYr1lLU7Zo+vJOoMuB6y3YJDu3ijrEKUJhEYVuiRKPCKpIOagB9YslXNI74o
 kUQAwTd18zutfYUw+fOkoRM7OsGpAMTNWYkm1jGXjzThQtvLO8eFhX2rq8lW1HUu6b
 h6fnQ0k89bBDzpAi/xaBxhfFQYlX6X6h0D6WOOhV9jN7zdwAL2udsBD6es5Qu5W6Pk
 TCIPhLiOQ9++Yz2mFrqZxrvtco6aXeu7+5le5mI01NGQgjOvsZocJA3MLPKut2rT67
 dvOA4/aegHqCtdG+3Msr/oH97Z4qJrKMCA/3aO4YXAKYqkBd0GeNFcroJmgaN1rC/f
 EtJJVfnO3/nVQ==
Date: Wed, 7 Jan 2026 16:54:46 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Message-ID: <nwhixocvhii27jvcyg7ex5emewntgfhyxa4ds5vo2dphe7xfe4@ibjsjdd5fgmn>
References: <20260106-stm32-pwm-v1-1-33e9e8a9fc33@geanix.com>
 <kemjjoyrhqglqq4p2j6kygspevq2mdbiujtnksw4rkdapoqcfy@zte2c7fhqvn3>
 <2e2iahbzcepbzwgk7xeta2afxmycfjgv2zofzngqjvp4on46r2@mzpi4bz4uqie>
MIME-Version: 1.0
In-Reply-To: <2e2iahbzcepbzwgk7xeta2afxmycfjgv2zofzngqjvp4on46r2@mzpi4bz4uqie>
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
Content-Type: multipart/mixed; boundary="===============7966519929566585734=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7966519929566585734==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="64gye46smpsbdd4v"
Content-Disposition: inline


--64gye46smpsbdd4v
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: stm32: handle polarity change when PWM is enabled
MIME-Version: 1.0

Hey Sean,

On Tue, Jan 06, 2026 at 11:30:34AM +0000, Sean Nyekjaer wrote:
> On Tue, Jan 06, 2026 at 11:22:57AM +0100, Uwe Kleine-K=F6nig wrote:
> > On Tue, Jan 06, 2026 at 08:01:57AM +0100, Sean Nyekjaer wrote:
> > > After commit 7346e7a058a2 ("pwm: stm32: Always do lazy disabling"),
> > > polarity changes are ignored. Updates to the TIMx_CCER CCxP bits are
> > > ignored by the hardware when the master output is enabled via the
> > > TIMx_BDTR MOE bit.
> > [...]
> > I have hardware using this driver, will set it up later this week for
> > testing.
>=20
> Very cool, looking forward to hear if you can re-produce.

I cannot. I have:

	# uname -r
	6.11.0-rc1-00028-geb18504ca5cf-dirty

(the -dirty is only from enabling the pwm for my machine, no driver
changes)

	# cat /sys/kernel/debug/pwm
	0: platform/40001000.timer:pwm, 4 PWM devices
	...
	 pwm-3   (sysfs               ): requested enabled period: 313720 ns duty:=
 10000 ns polarity: normal

and pulseview/sigrok detects 3.187251% with a period of 313.8 =B5s.

After

	echo inversed > /sys/class/pwm/pwmchip0/pwm3/polarity

the output changes to

	# cat /sys/kernel/debug/pwm
	0: platform/40001000.timer:pwm, 4 PWM devices
	...
	 pwm-3   (sysfs               ): requested enabled period: 313720 ns duty:=
 10000 ns polarity: inverse

and pulseview/sigrok claims 96.812749% with a period of 313.8 =B5s.
So the polarity change happend as expected.

This is on an st,stm32mp135f-dk board.

Where is the difference to your observations?

Best regards
Uwe

--64gye46smpsbdd4v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlegcMACgkQj4D7WH0S
/k4fRwf+IoPI/fQOF4r4TdyNyj65K6n+ilKzhOPYzKYcI84BEcJY/rHKy5tCk9Un
DB3fGdGsshoeaQtmX1qobV/wi6PFT27ecr9Li3lppUnc7ncvEKwKstDEY79THvf9
laZNtq6+trpelYq4JQGCoXwgE+sJTjMpFtoJLFGko4LrJxXvhVZEuU8oYuelRaOe
e7jMVbf/EdBMnLkI7TopaonJ+/FH+YDFED2h1AJPY9RbGU6VbJ+Y76pIFQwC5/Nz
zfheLxXGMWT5G9eV6atq4rcrvRQDB3pr3fULyKSwb8q9vpObaJjyIiOkqCDK8zOF
MIfKdXUl/rx9CggHjkGDcVN+AzBkEA==
=Hapr
-----END PGP SIGNATURE-----

--64gye46smpsbdd4v--

--===============7966519929566585734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7966519929566585734==--
