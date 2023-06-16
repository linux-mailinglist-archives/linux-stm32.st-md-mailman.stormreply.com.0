Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E18C733861
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jun 2023 20:52:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E62BAC6A615;
	Fri, 16 Jun 2023 18:52:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 485C5C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 18:52:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4880161447;
 Fri, 16 Jun 2023 18:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C0BC433C8;
 Fri, 16 Jun 2023 18:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686941575;
 bh=rXAOuleexf719oHBItUk2/1HRdDKOpd0Rj6yJJRrZ0w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uQptDTGP6Gn5u0IixUqZ1YrSYll9/0BBhDNyEJvj0XDP207w7DKIu1lqUjRY3h37M
 NDtqDTYCvbYbm+ZuqFr2gUpCgyBzb3yhHiHJMnxLmbF4xQ10dku4w4LdXprTP9Y9F/
 JOaCvPMVReWRlrdXG7gjSn/28bkKw59m3f6SQrw28VqOnQ+Mv3H2+vgb4ht5O59MVt
 ZdDiLCFfO38C+BkPtipARwzQEYSoEpDLkfHAhVUI3siXj06po2bpl3az9EUhaIaKro
 1jtf8AqxNos4QbgIptygfz8k4dHPstRcWQh0IJ5K3oCky7TpkvYO79i2lNN0C+ezPt
 KKSySXPPnc3hw==
Date: Fri, 16 Jun 2023 19:52:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20230616-afar-glove-a58d8ea5576e@spud>
References: <20230616103127.285608-1-krzysztof.kozlowski@linaro.org>
 <20230616103127.285608-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230616103127.285608-2-krzysztof.kozlowski@linaro.org>
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
Subject: Re: [Linux-stm32] [RFT PATCH 2/2] MIPS: dts: loongson: drop
 incorrect dwmac fallback compatible
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
Content-Type: multipart/mixed; boundary="===============8123343753311897172=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8123343753311897172==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v5Uzg8JAkxoXp3OM"
Content-Disposition: inline


--v5Uzg8JAkxoXp3OM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2023 at 12:31:27PM +0200, Krzysztof Kozlowski wrote:
> Device binds to proper PCI ID (LOONGSON, 0x7a03), already listed in DTS,
> so checking for some other compatible does not make sense.  It cannot be
> bound to unsupported platform.
>=20
> Drop useless, incorrect (space in between) and undocumented compatible.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--v5Uzg8JAkxoXp3OM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIyvgQAKCRB4tDGHoIJi
0kPBAP9ge4BqKvCvx5l997dp/dJGtEyDhTnNVPpcziB52eZb+wD/VzpfQUv9mSIf
qO6NQbomXWFOYzC4upKMWuIoMqQ0Egs=
=OY/b
-----END PGP SIGNATURE-----

--v5Uzg8JAkxoXp3OM--

--===============8123343753311897172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8123343753311897172==--
