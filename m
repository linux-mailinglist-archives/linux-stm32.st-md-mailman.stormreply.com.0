Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4933094F291
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Aug 2024 18:08:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB7CAC6DD72;
	Mon, 12 Aug 2024 16:08:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2AAFC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 16:08:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8B6866135B;
 Mon, 12 Aug 2024 16:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA121C32782;
 Mon, 12 Aug 2024 16:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723478889;
 bh=L0E1tT7pY2TMGLKXQCLiFYuVphFXk3nMv1X21i+KGQ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aGYwTBQ6mh6DphbQRwh7glFEYWj1jJe1gmYCGwI/V1ISjE6gPgfdI2hOuqYopcnM4
 zf5/CljKxwCr5onJJ8lYs7VeupOOg/lPEhLjgOFW1rm3vhF37TpYaiMlxglI61bcU0
 Nj36AnA1LBfdSuvraySA6zOWuQ9SvbVGbYWweMqDKs03G0CaQUfiIIvJeYRw3Brw6R
 eimEZqpYzL/bKOKLQSWC4kMZi6XHqmLhbSoIxzMddOruvkN9qoPNkw8EFLU+qnaKL6
 V++tUWdbmjRSEZOhPVZsBZPphmbdYJ2v58wPlInGlm702PmwagJtddzxIXUZ04cMtV
 Y0G1Tt7lIEJ5g==
Date: Mon, 12 Aug 2024 17:08:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20240812-rewind-detail-d1d2b43af88d@spud>
References: <20240811151737.106194-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240811151737.106194-1-krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: nvmem: st,
 stm32-romem: add missing "unevaluatedProperties" on child nodes
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
Content-Type: multipart/mixed; boundary="===============7081436138165254891=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7081436138165254891==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uAHQ9qS2Rkzz9BdF"
Content-Disposition: inline


--uAHQ9qS2Rkzz9BdF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 05:17:37PM +0200, Krzysztof Kozlowski wrote:
> All nodes need an explicit additionalProperties or unevaluatedProperties
> unless a $ref has one that's false.  Fixing this for STM32
> Factory-programmed data binding needs referencing fixed layout schema
> for children.  Add reference to the NVMEM deprecated cells for the
> schema to be complete.
>=20
> This fixes dt_binding_check warning:
>=20
>   st,stm32-romem.yaml: ^.*@[0-9a-f]+$: Missing additionalProperties/uneva=
luatedProperties constraint
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--uAHQ9qS2Rkzz9BdF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrozZAAKCRB4tDGHoIJi
0hmFAP9TybaQLB2/f/La+yrAEyFvjA+jQs7Nk2vduhmPvyo0FAEA10QHCY6cQRke
hOa6D+LkOwmIC5z75nvcr0wMopQG8QQ=
=urD/
-----END PGP SIGNATURE-----

--uAHQ9qS2Rkzz9BdF--

--===============7081436138165254891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7081436138165254891==--
