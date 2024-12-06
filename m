Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C435D9E7627
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2024 17:35:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79EE9C6DD9D;
	Fri,  6 Dec 2024 16:35:46 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEF40C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2024 16:35:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D5BA2A4439C;
 Fri,  6 Dec 2024 16:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C80C4CEDC;
 Fri,  6 Dec 2024 16:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733502938;
 bh=BpWfeIfcxxaNUbn2U8tKvdEkHK2FsMtBU4eTLwJnl7I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QuGYt4olh5TgvxpQcRl9PsFUBVax8yi9s7islv/y9OlAhdA+vMfaT6D+ES2NY8iqU
 AgGeGQsq7HZdd+l3d7QxeCUn8u8uyr2+2subSrnL+Zl7WM3RHjjEl+14YNPzkT7yeZ
 9J+e/vl7MoYGWnFG3dUkcR6kQPZ2xH0gJ62LJHfdzEsy8wGTwszUHXNeRh0+PgP77g
 hJK9GFhd32id039IqfSeHBOohpEM1+bHCIoZ8HYnwLRRIoSUOCqjx2ZpFA/iePQVnO
 Y3WCoPFi///8rDq9toJijZtrRNsKL1AG5mBT8FGpaKqebQII1RyBhOrZB4CohOG8Fy
 t60/s+ezsWQ5w==
Date: Fri, 6 Dec 2024 16:35:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Ken Sloat <ksloat@cornersoftsolutions.com>
Message-ID: <20241206-placard-hesitate-626fd285dfe6@spud>
References: <20241206115018.1155149-1-ksloat@cornersoftsolutions.com>
MIME-Version: 1.0
In-Reply-To: <20241206115018.1155149-1-ksloat@cornersoftsolutions.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dmaengine@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: dma: st-stm32-dmamux: Add
 description for dma-cell values
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
Content-Type: multipart/mixed; boundary="===============6832196968289740875=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6832196968289740875==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rLkrVVLioLF61Rl/"
Content-Disposition: inline


--rLkrVVLioLF61Rl/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2024 at 06:50:18AM -0500, Ken Sloat wrote:
> The dma-cell values for the stm32-dmamux are used to craft the DMA spec
> for the actual controller. These values are currently undocumented
> leaving the user to reverse engineer the driver in order to determine
> their meaning. Add a basic description, while avoiding duplicating
> information by pointing the user to the associated DMA docs that
> describe the fields in depth.
>=20
> Signed-off-by: Ken Sloat <ksloat@cornersoftsolutions.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--rLkrVVLioLF61Rl/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1Mn1QAKCRB4tDGHoIJi
0ufIAP9eSd/XJsTC82uOXaiS9+VsdB9msrVYPoh9A6R9d6eBIQD+Jz2f3eV4SOv7
heJ+59ODd2/vb4Rz4ypHMaY7cXXBFgg=
=7nq5
-----END PGP SIGNATURE-----

--rLkrVVLioLF61Rl/--

--===============6832196968289740875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6832196968289740875==--
