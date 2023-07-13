Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4344752B04
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jul 2023 21:33:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57C26C6B452;
	Thu, 13 Jul 2023 19:33:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87C6DC6B44E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jul 2023 19:33:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CE49561B2F;
 Thu, 13 Jul 2023 19:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DFCC433C7;
 Thu, 13 Jul 2023 19:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689276795;
 bh=swwCrASK4MsXFccBmWXa9izIHsAa/Uh0k81oEqyv7x4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nQw3MRSqqEIDFUADaHxiVnlxDr2krhWlvM8oWiEkQDnKzAAwBPKCCxBr7iYRQw8Mm
 82iu/YBqpa1SMZ7JhbxlzWsVCwt4oJyuk9pcKM0DzgOu2SiHKU4GuQAPHr59AghAZ7
 DCOFW5lzlox6yIvOSeW6qX58S7AM7H80jlA55EFoWoaQ7cHJ7185dtEV18NrN4KLBG
 vIAICPNnoj9iOf237MBK2Y2iwFGx00LTO6fLDe7YCa9kwseeakg2DduOL9P9Zd+qk6
 Dq0hosXDdqa7tIYEYmQeYqugdBes99Chen6PlbBHLVJBT9yvf1jQl8wa2GF6AtgZq2
 gcdxJjfkhnDyg==
Date: Thu, 13 Jul 2023 20:33:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Thomas BOURGOIN <thomas.bourgoin@foss.st.com>
Message-ID: <20230713-scribble-unfounded-28ca40b49f57@spud>
References: <20230713151518.1513949-1-thomas.bourgoin@foss.st.com>
 <20230713151518.1513949-2-thomas.bourgoin@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230713151518.1513949-2-thomas.bourgoin@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/7] dt-bindings: crypto: add new
 compatible for stm32-hash
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
Content-Type: multipart/mixed; boundary="===============5014612203141572618=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5014612203141572618==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r2NqPxhuuW44NJK8"
Content-Disposition: inline


--r2NqPxhuuW44NJK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 05:15:12PM +0200, Thomas BOURGOIN wrote:
> From: Lionel Debieve <lionel.debieve@foss.st.com>
>=20
> Add a new compatible for stm32mp13 support.
>=20
> Signed-off-by: Lionel Debieve <lionel.debieve@foss.st.com>
> Signed-off-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--r2NqPxhuuW44NJK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLBRdQAKCRB4tDGHoIJi
0gD7AQDZlMvw7qcfosAQRsO1dpFw+U1cXwLJ7wUdywXY6RAmRgEA60IxnVvAz1EF
9VZFqXqKuxCBhtIgHsS6UJUlasNIEAI=
=XSsY
-----END PGP SIGNATURE-----

--r2NqPxhuuW44NJK8--

--===============5014612203141572618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5014612203141572618==--
