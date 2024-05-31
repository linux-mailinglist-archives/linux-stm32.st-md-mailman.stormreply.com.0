Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C928D63A0
	for <lists+linux-stm32@lfdr.de>; Fri, 31 May 2024 15:54:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9324C6C820;
	Fri, 31 May 2024 13:54:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70BABCFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2024 10:50:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 61B6262999;
 Fri, 31 May 2024 10:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97EB1C116B1;
 Fri, 31 May 2024 10:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717152648;
 bh=IgNuUc7H+4H+wS/T7K15pYQS/lOBI7Syd2UuQzgQbNg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IaLcqEvxf3WPsbG2GeI4rF01P9sJapsh+waMRV+Bn5GVwzGlT4iKmwQqs6EEovMXO
 bq5MHfHY6YFi1fR4X70+hsY69LAzUVWpDrh57DRzkJYj4jjsvmAOyPuwwp3KKMkAjn
 UNJ1Sxz2GocpMQCwrvXq5T6CImk7oLDAiMvZnkyrdTjfuo93qfcnD1WxaylZTpZw6B
 WNpypSu8SidR+hFaMIGQYj/Ax384ABc4lusdGy+QKdKxtiXO7/oEWY3nklJt1AUC5u
 Ko6rwqc3pTr8n9ZBCL52sbLWtxUPyureJ7C/BmxytphV3nt4YdZisxhRC8WhplyUzE
 DA5PC6T4geM0A==
Date: Fri, 31 May 2024 12:50:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <n5fitoidzxrqqsjddfaza5z52hmjgjksytpqua726s7h56z63e@m4cygxcnafo3>
References: <20240531085749.42863-1-marex@denx.de>
MIME-Version: 1.0
In-Reply-To: <20240531085749.42863-1-marex@denx.de>
X-Mailman-Approved-At: Fri, 31 May 2024 13:54:22 +0000
Cc: Rob Herring <robh@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 kernel@dh-electronics.com, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>, Olivia Mackall <olivia@selenic.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] hwrng: stm32 - use sizeof(*priv) instead
 of sizeof(struct stm32_rng_private)
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
Content-Type: multipart/mixed; boundary="===============3849535136397359291=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3849535136397359291==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xek54sdap76jwck5"
Content-Disposition: inline


--xek54sdap76jwck5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 10:57:34AM +0200, Marek Vasut wrote:
> Use sizeof(*priv) instead of sizeof(struct stm32_rng_private), the
> former makes renaming of struct stm32_rng_private easier if necessary,
> as it removes one site where such rename has to happen. No functional
> change.

IMHO the main upside is that it's easier to spot that the allocation
size is correct.

Acked-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--xek54sdap76jwck5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZZq34ACgkQj4D7WH0S
/k7cTAgAlRRgppFhUD+9O+z0yqXTYZdPWzdDaF2Y/wCjo4vW+41rmwpPXPYjUj6V
RUSJ0g1eMaVwKaX53dbWlNYD3RTj8bv7uScBomwhTGUY8CUlIpEHkbY0xIrjCq2p
d36Rm/i3BzP0AvYV8EGgKLCys7f+u1br8Kl/ubGUx+E7P40C0V8D1biYD5kxvzYX
7U55QcKsKuAinDRk126iXM6d2f/aZGwO4Syh7NvNC6Q9czeSK2MAqU+dpQLScogl
UlNK+9iYjkadIlusVt19D2BDhpY8iG4hidRNL/sncLLA+M9i0oqZfCMvi01A4fEd
eRlktUFUxNYh6x/yhWMoVApAbqccRA==
=sZmB
-----END PGP SIGNATURE-----

--xek54sdap76jwck5--

--===============3849535136397359291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3849535136397359291==--
