Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE28BA59B26
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Mar 2025 17:37:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92184C78F9A;
	Mon, 10 Mar 2025 16:37:34 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62DDEC78F97
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 16:37:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 20610A4602F;
 Mon, 10 Mar 2025 16:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30EABC4CEE5;
 Mon, 10 Mar 2025 16:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741624652;
 bh=gTUrSXfg09Nwvn6NfV7VP8ZhiyGW1oZOs57vjOlXqgQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=isA2ib1aReU7/YMLC0A167HcEx4jP7QsuD8D2y4izHGn50rEOQFBDYZNSziKJjKDZ
 /26GW9HwoehSWRa/6d33Fc8cngSprjxJxZrA4n6n9VOGCNjECpuQeOWVmZzxfmrtV4
 qMFiHx1AT0EshM/qKjtN6lsVdN53CY57v2/L0Ztjzd9a1rTe/Vx0dnIrv3uMNSmh9K
 hK5KecIm4Hmn+gZtOpdzc39eW5FKGo2b5TMc0yAV29emysm2hYQzguxuUdlnbwcRD/
 zUEbNjzMydSPWccmYsjJZXLSxQ+eiHRvav47olH7OLoyaaJDl5ORxzODTZZZHyJuKl
 HRNcOENPZvRWA==
Date: Mon, 10 Mar 2025 16:37:25 +0000
From: Conor Dooley <conor@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250310-climatic-monorail-f06784705219@spud>
References: <Z82tWYZulV12Pjir@shell.armlinux.org.uk>
 <E1trIAF-005ntc-S5@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1trIAF-005ntc-S5@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Emil Renner Berthing <kernel@esmil.dk>,
 Eric Dumazet <edumazet@google.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Jose Abreu <joabreu@synopsys.com>,
 Samin Guo <samin.guo@starfivetech.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Minda Chen <minda.chen@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 4/7] riscv: dts: starfive: remove
 "snps, en-tx-lpi-clockgating" property
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
Content-Type: multipart/mixed; boundary="===============1254148244034090071=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1254148244034090071==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CZyrpZ2HiVDm2QKt"
Content-Disposition: inline


--CZyrpZ2HiVDm2QKt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 09, 2025 at 03:02:03PM +0000, Russell King (Oracle) wrote:
> Whether the MII transmit clock can be stopped is primarily a property
> of the PHY (there is a capability bit that should be checked first.)
> Whether the MAC is capable of stopping the transmit clock is a separate
> issue, but this is already handled by the core DesignWare MAC code.
>=20
> As commit "net: stmmac: starfive: use PHY capability for TX clock stop"
> adds the flag to use the PHY capability, remove the DT property that is
> now unecessary.
>=20
> Cc: Samin Guo <samin.guo@starfivetech.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Acked-by: Conor Dooley <conor.dooley@microchip.com>


--CZyrpZ2HiVDm2QKt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ88VRAAKCRB4tDGHoIJi
0igTAQCFZVYFhHAngmyoswJyr+9kBc4WZx2CvPHD4XUtMbBjEQEA6wyvNZXw1B0U
/+2ky25MqZJCRKv33flXhTeDh7fNYw4=
=M1xu
-----END PGP SIGNATURE-----

--CZyrpZ2HiVDm2QKt--

--===============1254148244034090071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1254148244034090071==--
