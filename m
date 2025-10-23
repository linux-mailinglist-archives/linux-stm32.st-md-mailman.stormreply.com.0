Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB70C0312D
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Oct 2025 20:51:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21FD6C5EC79;
	Thu, 23 Oct 2025 18:51:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0231C5EC7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 18:51:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BE60E4AE28;
 Thu, 23 Oct 2025 18:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9DBAC4CEE7;
 Thu, 23 Oct 2025 18:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761245480;
 bh=yAejfUUJiZAgzUJl4W0A3yvw8RvHpqUlB31kTfBanNc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=unAoiFqnIfbe471o7fJlWt0tAhvCj1MoRL5WGN0y+nI2rEaYyl92d3lqSkOBPLkJx
 E4v2EsiffVLRvDCUEm+PuXMOmN1Smby4jg9/3GF86ibNDRSwTDQ1TtgTFSBmJXFBNj
 BgCZ425F7QZN3aXLjcR6zgHXO1Po3s6/D/i0sXb0JZBX9RIL1PNaSHt0BEg9u9Mskd
 /rvqTOF/RDjTM0YEFtro72z1H4VVp5EMcJuwFMxsSs+zlVzqNm2zp+HHrczfMBNL1S
 Zs7wmGYy8OhMe+l1QE5dybFJYUhqwvZt8YX6z+GqiDxJUoBUD61Lq3O4cLO9qr0ZhK
 CwTBrW9V5bKFg==
Date: Thu, 23 Oct 2025 19:51:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Message-ID: <20251023-gab-applause-77043d499529@spud>
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
 <20251023132700.1199871-5-antonio.borneo@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20251023132700.1199871-5-antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v4 04/12] dt-bindings: pincfg-node: Add
 properties 'skew-delay-{in, out}put-ps'
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
Content-Type: multipart/mixed; boundary="===============2050482674421414781=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2050482674421414781==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T0BViuTcQBVHwGVl"
Content-Disposition: inline


--T0BViuTcQBVHwGVl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 03:26:52PM +0200, Antonio Borneo wrote:
> Add the properties 'skew-delay-input-ps' and 'skew-delay-output-ps'
> to specify independent skew delay value for the two pin's directions.
> Make the new properties unavailable when the existing property
> 'skew-delay' is selected.
>=20
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--T0BViuTcQBVHwGVl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPp5IwAKCRB4tDGHoIJi
0pkRAQCj7Ijye/ExnUsIE49cWonr9m6YS7a4wxdPBucoJ2MlggD/cPri8HMwGWK7
GGWHxrCWdfLHkTbJxCga1sVo8V4lJgU=
=q/g5
-----END PGP SIGNATURE-----

--T0BViuTcQBVHwGVl--

--===============2050482674421414781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2050482674421414781==--
