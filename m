Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3382A84FA77
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Feb 2024 18:03:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9819C6C859;
	Fri,  9 Feb 2024 17:03:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D70E2C6C858
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Feb 2024 17:03:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 904F761D1A;
 Fri,  9 Feb 2024 17:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 774C1C43390;
 Fri,  9 Feb 2024 17:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707498179;
 bh=Lrq5hrellIefTYXXaHqu+INob5qfnV/eTzPySL8VU5g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q35So9lMUF2qGPmWrxH5SYbPPJBrKVvLLQw5AQec4iPoHNRwhUzDQ6SYepvHKvMro
 oCqjzcMTp4qbIiaqL2RA9dcZkHPMyJ8cFx2i9ruAJEn6fofmNCCEfOb1MIYdlSuqRu
 wShi0uujxKxLN2LnKK6rGoIzOy9gXVTx5dbheOVbYBSLcUbztCGqv6HYN0U3Ry922i
 oJey30Qf+Td7NtryF4L5kN7kEm3Y8uu00Yfdogb9ZqHE54Z+NNzFpxOHV9aOQsYhnl
 cZBhywCyFiyJOYuJ2DsHlUZlmpYZSx1Ph8LczEAJf5cTpqTRlXCHoDQDwFPaat9Wd3
 GwifIkFRL1Vbw==
Date: Fri, 9 Feb 2024 17:02:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Message-ID: <20240209-stinging-unwarlike-674ebb82d53e@spud>
References: <20240208142301.155698-1-gabriel.fernandez@foss.st.com>
 <20240208142301.155698-3-gabriel.fernandez@foss.st.com>
 <20240208-syndrome-storeroom-5cc8bdd07c05@spud>
 <768067ff-cd69-4a55-aa5a-fc1eae5c1116@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <768067ff-cd69-4a55-aa5a-fc1eae5c1116@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v9 2/4] dt-bindings: stm32: update DT
 bingding for stm32mp25
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
Content-Type: multipart/mixed; boundary="===============5469723097559302960=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5469723097559302960==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ySXbP4Hch0LxT6iF"
Content-Disposition: inline


--ySXbP4Hch0LxT6iF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 09, 2024 at 10:46:14AM +0100, Gabriel FERNANDEZ wrote:
> Hi Conor,
>=20
> Thank's for your review.
>=20
> Yes, I have checked that point. I have also written the RCC driver for
> TFA/OPTE/UBOOT and once
>=20
> I receive Ack in the Kernel, I will upstream the other components.

Okay, if you know theres no other implementations:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

btw, please avoid top posting in the future.

Thanks,
Conor.

--ySXbP4Hch0LxT6iF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcZavgAKCRB4tDGHoIJi
0nJ9AP9pgCiDfbPPK8C8wpcNkD8v8BwOQJmplpuRMXqfPtlZbAD/TCtE1mY94jtz
r1I6lqx/NZblJhh+vgmcoqfZ+KCBWw8=
=1lSt
-----END PGP SIGNATURE-----

--ySXbP4Hch0LxT6iF--

--===============5469723097559302960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5469723097559302960==--
