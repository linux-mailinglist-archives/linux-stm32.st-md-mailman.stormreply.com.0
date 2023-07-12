Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C637751040
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 20:08:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE9F8C6B443;
	Wed, 12 Jul 2023 18:08:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58BD6C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 18:08:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 207836187A;
 Wed, 12 Jul 2023 18:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BAF7C433C7;
 Wed, 12 Jul 2023 18:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689185316;
 bh=pR0fZMsUXaaQwQtdPc6o/bATsnwQZMLuxq0kNgltOR4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J/8iPVdWzjarFmWJQDRHOGQ2jSofjOO4U9B1bfKkjJgqOBeQ6pIH0qxvlj1LUHJjv
 BrTwzXGiXvJmzajZfMc8xYChtwCo6w/754tI65VItlM0Qe4y3aftdv3l3kPGqXRGC1
 lk1yKrzwHTXPal0kZWl/nwoVSuOkjofaNJ0KxqA57Fvlf7J6ligMcwc0NMADa+2djD
 DXm8sRpbD80jSuNwO/aMT6AoDKTOT8aeVsUmrOBuMOrP/oeB+/2yZLXKMSzD4XRIFo
 RAlWt8WbnDj0Xi7Et76YpOYOxeKbZ+l96OdK6pa1s9yVEsNVmwK19GfbSJ8k/cgpXg
 x2n+6uaaBhQVg==
Date: Wed, 12 Jul 2023 19:08:29 +0100
From: Conor Dooley <conor@kernel.org>
To: p.paillet@foss.st.com
Message-ID: <20230712-wildland-molar-4a2db800081c@spud>
References: <20230712142432.1885162-1-p.paillet@foss.st.com>
 <20230712142432.1885162-2-p.paillet@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230712142432.1885162-2-p.paillet@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: rcc: stm32: add
 STM32MP13 SCMI regulators IDs
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
Content-Type: multipart/mixed; boundary="===============7242681677074076844=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7242681677074076844==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YlMgpd51Pn6qvNdn"
Content-Disposition: inline


--YlMgpd51Pn6qvNdn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 04:24:29PM +0200, p.paillet@foss.st.com wrote:
> From: Etienne Carriere <etienne.carriere@foss.st.com>
>=20
> Adds SCMI regulator identifiers for STM32MP13x family.
>=20
> Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> Signed-off-by: Pascal Paillet <p.paillet@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--YlMgpd51Pn6qvNdn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK7sHQAKCRB4tDGHoIJi
0llQAP9xn2pVsWdTdAbjpYJXAlxcGu2Qjk/asa8a9TIPucf+twD/SfC1UfPatxI1
oH/laRbiR+7EC7XoISHvDnhfNZEKyQc=
=g/Ko
-----END PGP SIGNATURE-----

--YlMgpd51Pn6qvNdn--

--===============7242681677074076844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7242681677074076844==--
