Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7B890FFBA
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 10:59:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A08FDC7128D;
	Thu, 20 Jun 2024 08:59:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40DADC71288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 08:59:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0A6D96211C;
 Thu, 20 Jun 2024 08:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D8D2C2BD10;
 Thu, 20 Jun 2024 08:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718873952;
 bh=cxO0O9LpvQgPUIclFb5zIAe3EVexH+Kz4teCj8aZZ3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LLxHfoOx65muZqCx7fXYQA+BVobfWUYljU/T3kndPOGXaItcWwNz4sYjMRVbL3rfo
 2Wl9Y3l0tXzCpA1JqnJH8IbC1gIGadbM9RlKUjZnN+iERxeohoKaqA2b+0I/P+GKUQ
 E7r0CKv9OjU85F7M3QTLjy4MXkx02x5FYj0KhbNSGQDO2pL9Nkc5CKRgEY0pQkloFg
 eAwbHg/kEjhUpo1fZ9PJ4waOyWUO4UwYVqHTHFfuOcTYHL7ggnBLIjxx3KJSq7YXBV
 DccgAGUgDnKd7IEv63oQfrqeXQWUx1siv0oeFbw+i9tCmvdWuuSfyccn1MLT+Vnmaj
 isDWOie3aU/qg==
Date: Thu, 20 Jun 2024 17:59:07 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Lee Jones <lee@kernel.org>
Message-ID: <ZnPvW6Zx69wVjNRS@ishi>
References: <cover.1718791090.git.u.kleine-koenig@baylibre.com>
 <126bd153a03f39e42645573eecf44ffab5354fc7.1718791090.git.u.kleine-koenig@baylibre.com>
 <20240620084451.GC3029315@google.com>
MIME-Version: 1.0
In-Reply-To: <20240620084451.GC3029315@google.com>
Cc: linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thorsten Scherer <T.Scherer@eckelmann.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/5] counter: stm32-timer-cnt: Use
 TIM_DIER_CCxIE(x) instead of TIM_DIER_CCxIE(x)
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
Content-Type: multipart/mixed; boundary="===============3333209879921791813=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3333209879921791813==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qUxpVBYe6s7jx2cy"
Content-Disposition: inline


--qUxpVBYe6s7jx2cy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 09:44:51AM +0100, Lee Jones wrote:
> On Wed, 19 Jun 2024, Uwe Kleine-K=C3=B6nig wrote:
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
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> > ---
> >  drivers/counter/stm32-timer-cnt.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> Did you drop William's Ack on purpose?
>=20
> --=20
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

No problem, here it is again for the sake of the LKML scraper tools:

Acked-by: William Breathitt Gray <wbg@kernel.org>

Lee, do you prefer taking this patchset through your tree?

William Breathitt Gray

--qUxpVBYe6s7jx2cy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZnPvWwAKCRC1SFbKvhIj
K1GgAP9odcqC0bo8rEeP0eJTrSUFEqcSuJZBP7eDgnXlVa0onwD+PKCxPPIJMLff
Zg4Fw4SPOHzpnOcfqWbkCDNjqMhH6AY=
=XwMH
-----END PGP SIGNATURE-----

--qUxpVBYe6s7jx2cy--

--===============3333209879921791813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3333209879921791813==--
