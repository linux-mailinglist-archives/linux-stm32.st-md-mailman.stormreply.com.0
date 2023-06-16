Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C37A73385C
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jun 2023 20:52:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFE6BC6A615;
	Fri, 16 Jun 2023 18:52:26 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01AD6C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 18:52:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B8BE461447;
 Fri, 16 Jun 2023 18:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81ACCC433C8;
 Fri, 16 Jun 2023 18:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686941544;
 bh=SnILc4tHzLQ9qrWedm4qlSPGM6MMXgUtHYq78NQdHfc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iUqw7j+HeuoziYt9RbZCtqc64v+4G8v1edN3GQo4dVrs8cP0pYDBRLyr3g3RMkjL2
 oPprPOtTyghZTTdiSDa7G2/c3Dc/vDfBXIIr5C7a3Cap2ycoLvw/rpuwKN0vq1yjQr
 4B5WRMfgCFIsAo6ll4rl6MEz/eO4YMqlIcVETg58DdNwK0jvm4P++lNzCliGEOKeEf
 QMhuaPfMlWzxplJPj2Pj3O1JIfiIXMMEHMA+PZR2mpRWL+QuboRLHFkzDxBNNnDVOX
 l80E37UZxLBzpUsiZI6MOaQ+i+7FE8qrrRTe4XqojVDupcp2SR2Ud20w+8bYyELRGD
 KR8K0rWKiE0pg==
Date: Fri, 16 Jun 2023 19:52:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20230616-activity-shed-be3c13e5ac71@spud>
References: <20230616103127.285608-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230616103127.285608-1-krzysztof.kozlowski@linaro.org>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mips@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFT PATCH 1/2] stmmac: dwmac-loongson: drop
 useless check for compatible fallback
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
Content-Type: multipart/mixed; boundary="===============0480932165055080905=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0480932165055080905==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IZVYiw4TzhyBwr89"
Content-Disposition: inline


--IZVYiw4TzhyBwr89
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2023 at 12:31:26PM +0200, Krzysztof Kozlowski wrote:
> Device binds to proper PCI ID (LOONGSON, 0x7a03), already listed in DTS,
> so checking for some other compatible does not make sense.  It cannot be
> bound to unsupported platform.
>=20
> Drop useless, incorrect (space in between) and undocumented compatible.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Might be worth noting that dropping it is required to allow the
new loongarch dts stuff to be functional with a sane set of compatibles.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--IZVYiw4TzhyBwr89
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIyvYQAKCRB4tDGHoIJi
0g+bAPwIqFpdSVFR1J6wtacOyxZPUWWrlEBqpTPyxDWe+xdBWwEA2ZuQq95BtjsK
MOqgX/xyqqlAFwqAfioKQf/5rfup/gI=
=hq3B
-----END PGP SIGNATURE-----

--IZVYiw4TzhyBwr89--

--===============0480932165055080905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0480932165055080905==--
