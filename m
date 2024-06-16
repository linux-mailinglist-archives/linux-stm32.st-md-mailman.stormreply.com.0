Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D48909CA8
	for <lists+linux-stm32@lfdr.de>; Sun, 16 Jun 2024 10:47:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74176C6A613;
	Sun, 16 Jun 2024 08:47:01 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF65CC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Jun 2024 08:46:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5B1E1CE097C;
 Sun, 16 Jun 2024 08:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B01C2BBFC;
 Sun, 16 Jun 2024 08:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718527611;
 bh=nQ/vCqxQ64G/dU866VmZFNtnjndHdvzguYFblH2UCDY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N2OHdvVKgDV+k8tBQb+6fbyD7clBj1Ae+BaJCTTdzJQNSHTbIIYCAmvRZnVnpuMUQ
 0S04uOl50zNEJJV8ztTxdj1bG/H9Z2GJDy4jm71ycJ7t2pwMCiXtH6MlepC8uFGxhI
 y1+hq6cpVQ4Xs/SONuFzbQRyx9v7P4nHz+F2+BR92quaY1ANm+vlOBMZBjdqcj4rvN
 B9MAsRbOoevugcbQlQ3NRrg/S1BbLm29qkIOdxzXKMW3gSolOFTsYK7BkiTW/iadfp
 L1mAbgaHwc/LdwyEjUw+ojql6oqoXtzAWCAV66s1MbPjE3dn4GGeYq50Fz7kHFL4+j
 OIWYMuetZQcVQ==
Date: Sun, 16 Jun 2024 17:46:45 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Message-ID: <Zm6mdYBhP1dAMthI@ishi>
References: <cover.1718352022.git.u.kleine-koenig@baylibre.com>
 <0735860960b1b38570bffa5b0de81a97f6e3230e.1718352022.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <0735860960b1b38570bffa5b0de81a97f6e3230e.1718352022.git.u.kleine-koenig@baylibre.com>
Cc: linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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
Content-Type: multipart/mixed; boundary="===============0960924857989072210=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0960924857989072210==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dCl7/OXUWXzDpqmf"
Content-Disposition: inline


--dCl7/OXUWXzDpqmf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 10:10:13AM +0200, Uwe Kleine-K=F6nig wrote:
> These two defines have the same purpose and this change doesn't
> introduce any differences in drivers/counter/stm32-timer-cnt.o.
>=20
> The only difference between the two is that
>=20
> 	TIM_DIER_CC_IE(1) =3D=3D TIM_DIER_CC2IE
>=20
> while
>=20
> 	TIM_DIER_CCxIE(1) =3D=3D TIM_DIER_CC1IE
>=20
> . That makes it necessary to have an explicit "+ 1" in the user code,
> but IMHO this is a good thing as this is the code locatation that
> "knows" that for software channel 1 you have to use TIM_DIER_CC2IE
> (because software guys start counting at 0, while the relevant hardware
> designer started at 1).
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

I concur with Lee Jones that the subject should be renamed. Regardless,
here's my ack for the code changes.

Acked-by: William Breathitt Gray <wbg@kernel.org>

--dCl7/OXUWXzDpqmf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZm6mdQAKCRC1SFbKvhIj
K30lAQDsaSV5Lc4QTe+SNucCUL6Fa1IDxYIgK4zoGmqxb9xPwwD9F2jDmowZBtn1
G4nggdLs3gGlZTYbXuMu9YnjuVjaTgk=
=v9Mi
-----END PGP SIGNATURE-----

--dCl7/OXUWXzDpqmf--

--===============0960924857989072210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0960924857989072210==--
