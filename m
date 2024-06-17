Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB21690B3AD
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 17:15:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CC1AC69067;
	Mon, 17 Jun 2024 15:15:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBC38C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 15:15:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A581960ED4;
 Mon, 17 Jun 2024 15:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF4FC4AF1D;
 Mon, 17 Jun 2024 15:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718637320;
 bh=WHkOQwgQ0OkCBXBRQiaSNopJdYpyKdAicFRU5wIC1SQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tTDSqNl6jdkQtMK7cX4KvwKmvrBJb0KCpntchLkDEBpXVtz9ZsmfVQxHWSh5mN5z+
 aVyoZ3f/+5/qbSwFd98WTmEA7DvU4/Xg7wVF7KoZ8vx/VkgmimhKuf6+sQWFuKHiKF
 cy5DkUrz32DOkakoe8npzIfF6Lb3+vccSr1XWfpRCByMEnge/d8mx8C8aDFh7Ot4Rc
 du0vaGJDecUhWxZdzrG/75SYdzOx7NSPrOjtAAhBg2aVx6+VbtwG41y2Fi9qTyl3ic
 GORXm32SmliFyw7N3vj+KMQkoSxh6GNgfuR4Ir+bPVT4mf4Sorm43SZUUgyiIr5iq/
 Uv0uqk7dNXr8w==
Date: Mon, 17 Jun 2024 16:15:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Etienne Carriere <etienne.carriere@foss.st.com>
Message-ID: <20240617-schilling-unfreeze-1151ed3ffe3c@spud>
References: <20240617092016.2958046-1-etienne.carriere@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240617092016.2958046-1-etienne.carriere@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, Pascal Paillet <p.paillet@st.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: mfd: dual licensing for
 st, stpmic1 bindings
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
Content-Type: multipart/mixed; boundary="===============3964953254949007905=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3964953254949007905==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lGPyMPYHL/8mRCAF"
Content-Disposition: inline


--lGPyMPYHL/8mRCAF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 11:20:16AM +0200, Etienne Carriere wrote:
> Change include/dt-bindings/mfd/st,stpmic1.h license model from GPLv2.0
> only to dual GPLv2.0 or BSD-2-Clause. I have every legitimacy to request
> this change on behalf of STMicroelectronics. This change clarifies that
> this DT binding header file can be shared with software components as
> bootloaders and OSes that are not published under GPLv2 terms.
>=20
> In CC are all the contributors to this header file.
>=20
> Cc: Pascal Paillet <p.paillet@st.com>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
> Changes since v1:
> - Change request license from "GPL-2.0-only OR BSD-3-Clause" to
>   "GPL-2.0-only OR BSD-2-Clause".
> - Update Lee's e-mail address.
> ---
>  include/dt-bindings/mfd/st,stpmic1.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/dt-bindings/mfd/st,stpmic1.h b/include/dt-bindings/m=
fd/st,stpmic1.h
> index 321cd08797d9..9dd15b9c743e 100644
> --- a/include/dt-bindings/mfd/st,stpmic1.h
> +++ b/include/dt-bindings/mfd/st,stpmic1.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
>  /*
>   * Copyright (C) STMicroelectronics 2018 - All Rights Reserved
>   * Author: Philippe Peurichard <philippe.peurichard@st.com>,
> --=20
> 2.25.1
>=20

--lGPyMPYHL/8mRCAF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnBTBAAKCRB4tDGHoIJi
0qIWAPkBJ9q1i4xsdPxz3hLLu+JG/FRYZ1wTgLB3J64D5AYvrwEA8FkkvfvaQHtM
/MSFQyC8O7LR6GsPUulaf3eF0NkDXwc=
=80iE
-----END PGP SIGNATURE-----

--lGPyMPYHL/8mRCAF--

--===============3964953254949007905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3964953254949007905==--
