Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AC7817479
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 15:59:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0723BC6DD70;
	Mon, 18 Dec 2023 14:59:33 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 990A3C6DD6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Dec 2023 14:59:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 98E75CE0B2A;
 Mon, 18 Dec 2023 14:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30277C433C8;
 Mon, 18 Dec 2023 14:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702911568;
 bh=+s1PxLoBbDNRFaBMX1KOfgXL4tbGv/n20FEjafyPq/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mSbBcYtIEC/E7RqBQIzkCxec5TKgazZsWXYPY9+enwlKZ6OrEtXBMl8SgdPgJxfni
 krjGAU88aSHxxRA9x2MosUdLH2JQEF3QyLCBsR4LT//axdCB2DPmzwqsq8FQ9OuVrQ
 9FLgC5B75iasJpQCBSSE/PM26xfwWhdbZy81d6LhGHghtD+3r8iDWC07xhx6g+gh4p
 h1ttAeppZzSTCNU8XIlDlD1c8K//wMRQYcfd1poIbVGlHSBJGByodmP+Xa7zynYPx7
 dKgH4hQkK0Ik3hIiPZyIbjUigosGJhLSxyisitYnEJ+EFf1Yf/bmYq+R7HPmtThshI
 dXPcLYPG7K52A==
Date: Mon, 18 Dec 2023 14:59:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Message-ID: <20231218-snowcap-charter-f8c75312eaa9@spud>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
 <20231215204050.2296404-3-cristian.ciocaltea@collabora.com>
 <A7C96942-07CB-40FD-AAAA-4A8947DEE7CA@jrtc27.com>
 <65fd52f1-6861-42b0-9148-266766d054b1@sifive.com>
 <6c62e3b2-acde-4580-9b67-56683289e45e@collabora.com>
 <20231217-spray-livestock-a59d630b751e@spud>
 <fa4b9c1d-6033-4b35-b03c-e03419edb5dc@collabora.com>
MIME-Version: 1.0
In-Reply-To: <fa4b9c1d-6033-4b35-b03c-e03419edb5dc@collabora.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Michael Turquette <mturquette@baylibre.com>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, kernel@collabora.com,
 linux-clk@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>,
 Jose Abreu <joabreu@synopsys.com>, Samin Guo <samin.guo@starfivetech.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, LKML <linux-kernel@vger.kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 2/9] dt-bindings: net: starfive,
 jh7110-dwmac: Add JH7100 SoC compatible
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
Content-Type: multipart/mixed; boundary="===============6581755165265069621=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6581755165265069621==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xehaJyWNZIrFr2oM"
Content-Disposition: inline


--xehaJyWNZIrFr2oM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Won't this also relax the naming for all devices that allow a single
> > reset, but expect the stmmaceth one? I'm not sure that that actually
> > matters, I think the consumer bindings have constraints themselves.
>=20
> Before commit 843f603762a5 ("dt-bindings: net: snps,dwmac: Add 'ahb'
> reset/reset-name"), the 'stmmaceth' was the only possible option, hence
> there was no need for any constraints on the consumer bindings.  But
> afterwards it was allowed to use both resets, hence I think the bindings
> should have been updated at that time by adding 'maxItems: 1' to prevent
> using the 2nd reset.
>=20
> I could fix this in a separate series, if it's not something mandatory
> to be handled here.

If it is not introduced by this series, I don't see why it could not be
handled separately if needed.

--xehaJyWNZIrFr2oM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYBeSAAKCRB4tDGHoIJi
0kaHAQDOEcbXi7+qAEGh2DmnasVoZMuRlaf7aM8UbL0TedMfrAEAz4ujNDzOgg49
iA4wb0r9fYms/C/CCKtbwb34l7U9Wg8=
=8B0i
-----END PGP SIGNATURE-----

--xehaJyWNZIrFr2oM--

--===============6581755165265069621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6581755165265069621==--
