Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3A4A313EF
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2025 19:19:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED80CC78006;
	Tue, 11 Feb 2025 18:19:38 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC7E2C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 18:19:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 71504A40BDB;
 Tue, 11 Feb 2025 18:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F17E2C4CEDD;
 Tue, 11 Feb 2025 18:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739297976;
 bh=ZeJSRLFk7KzsTUlyQirGAXBVKKCiGm4LCGhgWOZKRJU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O/Osz5JbUrSHd8Om2IbxPFGYYL42La6X+hZMhI8cImporz2QzFoqtyehmGRht+viM
 sPw0rF//J+UBF2IR3YmhFIDgSIznzMXXoYd3fTdqmJPy3zYr6UbtDfy+g8m7MAE934
 upZ10ewuGLmO7CT3W28CaiYl5Dm+RyxOyEE8fH7G6qJTXD1z409uGqePU2zzCIkwWJ
 oow7KqxmXHGhY4mDI6/KLe7XAGTnF6ECpXiF6uBzIMuKOlkOWlsOrVjAFF4TGlhzXf
 aKJTlOEQnqMEe2RB2/70p8MARoJ7vz8lrxR+rxu+vN+e+rg58M1cMgQER/GQXduqGR
 8DjomiUPvWf+A==
Date: Tue, 11 Feb 2025 18:19:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <20250211-napping-womankind-3c3146c6b2d6@spud>
References: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
 <20250210-b4-stm32mp2_new_dts-v1-1-e8ef1e666c5e@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20250210-b4-stm32mp2_new_dts-v1-1-e8ef1e666c5e@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 01/10] dt-bindings: stm32: document
	stm32mp257f-dk board
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
Content-Type: multipart/mixed; boundary="===============0770475748322739949=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0770475748322739949==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8ZGf21frFMU/x+4E"
Content-Disposition: inline


--8ZGf21frFMU/x+4E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 04:20:55PM +0100, Amelie Delaunay wrote:
> Add new entry for stm32mp257f-dk board.
>=20
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--8ZGf21frFMU/x+4E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6uUswAKCRB4tDGHoIJi
0gNGAP4rXS2pU6/TpiaMyh6ngiLT4et79Hj10mAIW2mYBmMPegD/Uz/xYHHM4rFT
xeXShH6AVOss5Xm80BVMmzfIPq1bows=
=9R2h
-----END PGP SIGNATURE-----

--8ZGf21frFMU/x+4E--

--===============0770475748322739949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0770475748322739949==--
