Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 892FEBF2D37
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Oct 2025 19:58:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FE20C5A4E5;
	Mon, 20 Oct 2025 17:58:13 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81F86C349C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Oct 2025 17:58:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1BCAB454B4;
 Mon, 20 Oct 2025 17:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000F9C113D0;
 Mon, 20 Oct 2025 17:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760983091;
 bh=3eybZrHiTS9wZG23hXV62FCDJFtCcIIaUJqij9JPSCA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=txdlpjK24x3VCahUT9ZDmp1hV0WioZsFGhVrgeWjDL9cx419PRG+z1aKhv4F5V0L9
 JapR/jG2vy2nXcja7HIJQuklXNawrWVBoUolmzXHNRskdSKILmpFmLNOHEd+Btk5Pd
 qyn6a8t3q415LXmmbB0OmJ+br+Yk6RQ1zNWN7tT8gECh7sss9pQprEy62S4/LcnEEi
 bzGWKnucEFvyT7CGRoAUWazf3X6ltNAtyfv4e0VnzA2dTCxa2eFGSqKKQxR/kr6l2F
 ZCkJiMMNO3p8R/OE5SRiIEDOKEE+VOtTJOVUdsPeE+y1j3RcqM8+8331BV2BKQeHCp
 idWOt9+MTZi2g==
Date: Mon, 20 Oct 2025 18:58:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Message-ID: <20251020-coroner-headstone-c8685f6e3868@spud>
References: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
In-Reply-To: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
Cc: imx@lists.linux.dev, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Liu Ying <victor.liu@nxp.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-spi@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 0/4] dt-bindings: treewide: don't check
	node names
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
Content-Type: multipart/mixed; boundary="===============4710458911791014680=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4710458911791014680==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ifIYyPcG9nWKLWH/"
Content-Disposition: inline


--ifIYyPcG9nWKLWH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 08:09:49AM +0200, Wolfram Sang wrote:
> Node names are already and properly checked by the core schema. No need
> to do it again.
>=20
> These are all occurrences I found in linux-next as of 20251015. I did
> run dt_bindings_check successfully. I haven't done a way to run
> dtbs_check yet because I would need to identify the proper architecture
> first, right? Is there some tool which tests all DTs of a certain
> binding? At least build bot is happy, I don't know if it checks DTs as
> well, though.
>=20
> I'd suggest to give subsystems some time to pick these patches before
> Rob applies the remaining ones?
>=20
>=20
> Wolfram Sang (4):
>   dt-bindings: bus: don't check node names
>   dt-bindings: nvmem: don't check node names
>   ASoC: dt-bindings: don't check node names
>   dt-bindings: spi: don't check node names

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ifIYyPcG9nWKLWH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPZ4KgAKCRB4tDGHoIJi
0nQOAP9zt58K2r6VVxQGAjEOeExklSakIE1QYNmtoG9DXBZsvAEAw5tz28SP3wVF
gblhCrRV4FJmV7bWABaDA6WjOT5AlAI=
=dLoT
-----END PGP SIGNATURE-----

--ifIYyPcG9nWKLWH/--

--===============4710458911791014680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4710458911791014680==--
