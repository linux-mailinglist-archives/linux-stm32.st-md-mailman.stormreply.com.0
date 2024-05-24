Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 748278CEA27
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2024 21:01:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25471C6DD6D;
	Fri, 24 May 2024 19:01:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 458D3C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2024 19:01:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 27FCC63255;
 Fri, 24 May 2024 19:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E120C2BBFC;
 Fri, 24 May 2024 19:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716577310;
 bh=8AHQ9p6PvVe4520jRRGX5kkQufDnzP7izZGOrirOQ0I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CELcBtIkpB5jCodnFjjOjwruw3QCwbpf5Exmq6tZ2onRAlbnRDZ30PRAZ37lmgUtY
 5VbfwfQqh/wfjjdIcJfw9ZLkEL+OM5U0Oomww17SMMy09v8IwIbQbNs16pIiHmZSuR
 QLVKRKL8XJyk7WsaYTTHHOuWjNd85QLJYEZxbb6/e0cWSIQXdI1GoahikipROjZgeZ
 DraqkBAIgdkVi++1bJaTTjkXYewx/YYQ74+kAK9fJBkFEtjGvXFjMLmQ89qcEqGa8J
 EH0Hg8SOGAdb6vt8bT3gKayProiTLRmITRitNxr+DhRYwM4p2DbFH/yE1nngFP4u89
 Z6IXXgqxK6P4Q==
Date: Fri, 24 May 2024 20:01:46 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Message-ID: <20240524-selection-little-f8adfa0a32b4@spud>
References: <20240523154208.2457864-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240523154208.2457864-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: arm: stm32: st,
 mlahb: Drop spurious "reg" property from example
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
Content-Type: multipart/mixed; boundary="===============3721624642575705848=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3721624642575705848==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BHX4szPWPsM2i9bl"
Content-Disposition: inline


--BHX4szPWPsM2i9bl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 10:42:07AM -0500, Rob Herring (Arm) wrote:
> "reg" is not documented nor used for st,mlahb, so drop it from the
> example to fix the warning:
>=20
> Documentation/devicetree/bindings/arm/stm32/st,mlahb.example.dtb: ahb@380=
00000: Unevaluated properties are not allowed ('reg' was unexpected)
>         from schema $id: http://devicetree.org/schemas/arm/stm32/st,mlahb=
=2Eyaml#
>=20
> Since "reg" is dropped, the unit-address must be as well.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--BHX4szPWPsM2i9bl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlDkGgAKCRB4tDGHoIJi
0uCiAQDbjFKnua6YZv9wGHzySJp/xAnFvNaIBNwON9KN0AwFaAEAvtpXl04h0qr4
OTc619LWMWvQYdnJxGl2CUuMgzl8WAA=
=7zD8
-----END PGP SIGNATURE-----

--BHX4szPWPsM2i9bl--

--===============3721624642575705848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3721624642575705848==--
