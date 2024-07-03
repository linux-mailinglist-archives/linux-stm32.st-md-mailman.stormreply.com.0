Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 034B2924D3B
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 03:44:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94789C71280;
	Wed,  3 Jul 2024 01:44:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9653C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 01:44:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CDF7A61F24;
 Wed,  3 Jul 2024 01:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CDB5C116B1;
 Wed,  3 Jul 2024 01:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719971064;
 bh=42mTcGmLRkv0gLZBJggEWYL7CYdyKG+MNeqUzQmh2M0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hV1/ba8jri4uW/hdq1fo1Phlp5vxHC/78G3R3PdGKXYzHBnF8euCPl6/bOSKb9mfW
 HBgHG/7/fv0Zs2+l/SdssQ8imeUfc96UW4vzGER2clro7QfwMlrRIIgXsLpltInN5f
 D7STOdUUHcN2nvgj5wa1MQHOKG0dUKOjHxFESIkfgL/kA3IFQ0yXZ0a6Ps9br1ZrZw
 NcODsZ4/UEVcz9RaMD4Qv5wmZF4Y9QLzBKQ+GXEHcKKgeUa9JKwQnuhWBr0nf4oItW
 EOQTskB+rW+R19sik+GPIbZjZCXSccho8FXnzBGafyH92BWn38zbpW84wHB7FodNDj
 59/+rJ72k9H9g==
Date: Wed, 3 Jul 2024 10:44:16 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Lee Jones <lee@kernel.org>
Message-ID: <ZoSs8M3C72xAyG_J@ishi>
References: <cover.1718791090.git.u.kleine-koenig@baylibre.com>
 <20240626151343.GA2504017@google.com>
 <20240628142847.GN2532839@google.com>
MIME-Version: 1.0
In-Reply-To: <20240628142847.GN2532839@google.com>
Cc: linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thorsten Scherer <T.Scherer@eckelmann.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [GIT PULL] Immutable branch between MFD and
 Counter due for the v5.11 merge window
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
Content-Type: multipart/mixed; boundary="===============2382911925610016005=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2382911925610016005==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cHosmM4QmEp1ldDc"
Content-Disposition: inline


--cHosmM4QmEp1ldDc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 03:28:47PM +0100, Lee Jones wrote:
> Enjoy!
>=20
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfab=
d0:
>=20
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
>=20
> are available in the Git repository at:
>=20
>   ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags=
/ib-mfd-counter-v5.11
>=20
> for you to fetch changes up to 304d02aa711369da89b4f8c01702bf1b5d1f7abc:
>=20
>   mfd: stm32-timers: Drop unused TIM_DIER_CC_IE (2024-06-26 16:09:58 +010=
0)
>=20
> ----------------------------------------------------------------
> Immutable branch between MFD and Counter due for the v5.11 merge window
>=20
> ----------------------------------------------------------------
> Uwe Kleine-K=C3=B6nig (4):
>       mfd: stm32-timers: Unify alignment of register definition
>       mfd: stm32-timers: Add some register definitions with a parameter
>       counter: stm32-timer-cnt: Use TIM_DIER_CCxIE(x) instead of TIM_DIER=
_CCxIE(x)
>       mfd: stm32-timers: Drop unused TIM_DIER_CC_IE
>=20
>  drivers/counter/stm32-timer-cnt.c |   4 +-
>  include/linux/mfd/stm32-timers.h  | 179 ++++++++++++++++++++------------=
------
>  2 files changed, 96 insertions(+), 87 deletions(-)
>=20
> --=20
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

Merged and pushed out to counter-next.

Thanks,

William Breathitt Gray

--cHosmM4QmEp1ldDc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZoSs8AAKCRC1SFbKvhIj
Ky8MAQCC9OFsKPs8E4VTmZK8Xqj6JXfh9iGdsN91Jg4gi36RXwEA0grMJ7WNXywX
ZzM6pVG8xYYtcsMeyAz9psBr/wCtkQg=
=1DWZ
-----END PGP SIGNATURE-----

--cHosmM4QmEp1ldDc--

--===============2382911925610016005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2382911925610016005==--
