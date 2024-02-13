Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B911D853C33
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 21:27:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62A4AC6DD69;
	Tue, 13 Feb 2024 20:27:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8F02C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 20:27:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5C857616C3;
 Tue, 13 Feb 2024 20:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACEE0C433F1;
 Tue, 13 Feb 2024 20:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707856023;
 bh=wr2SPv5Ld/DSkoS5vcAzZJ9Df9CxqcjpNgsKUEXsmMg=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=lPFkxYPR0J3NXG1zdBfo423wECnKhWMgXPxCg52F3jS4QKKMEyqjBhXaUGKE3tgG6
 37ZF1eFh/KlF2KXEvZh8+5akK0hqsrS1FZnabOENmkW6SqKVRepSFJf7g6xxh7ojEV
 jnkdi6FQUiy1uKshzEZhLb5yve1bg3+EMiWyulcWid6e7LMamsxlhTvq2275lGDRVd
 PYq1svZG2Lc2X9dtgFRoH1KjCqQDhIoYjVbGHKXP+VJjE7rPkT9HdKzpsCs5RzEGYP
 ef1gd/J3wmRP/+qW2yBa+bsr9UVpRx1oatwybDxzT9Hk3Wx4NArI6+dQLf7ihqU6h7
 NgaQAYTbgz0rQ==
Date: Tue, 13 Feb 2024 20:26:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <20240213-wafer-garnish-88287bc5d4a5@spud>
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Tony Lindgren <tony@atomide.com>, linux-arm-msm@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>, Chanho Min <chanho.min@lge.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Schier <nicolas@fjasle.eu>, Bjorn Andersson <andersson@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-aspeed@lists.ozlabs.org,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, linux-renesas-soc@vger.kernel.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Linus Walleij <linusw@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-kbuild@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 Nathan Chancellor <nathan@kernel.org>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Imre Kaloz <kaloz@openwrt.org>, Scott Branden <sbranden@broadcom.com>,
 openbmc@lists.ozlabs.org, Antoine Tenart <atenart@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Tsahee Zidenberg <tsahee@annapurnalabs.com>
Subject: Re: [Linux-stm32] [PATCH 0/6] dts: Fix dtc interrupt warnings
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
Content-Type: multipart/mixed; boundary="===============1373546533329277976=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1373546533329277976==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4XczAmSSxV0XIpGO"
Content-Disposition: inline


--4XczAmSSxV0XIpGO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 01:34:24PM -0600, Rob Herring wrote:
> I had a branch with most of these changes sitting in my tree for some=20
> time. Geert's asking about some errors not getting found prompted me to=
=20
> clean it up and send it out. This series fixes all* interrupt related=20
> warnings and enables the check by default.=20
>=20
> SoC maintainers, Can you please take this series directly.=20
>=20
> Rob
>=20
> *There's a few Renesas warnings still Geert said he would fix.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Rob Herring (6):
>       arm64: dts: freescale: Disable interrupt_map check
>       arm: dts: Fix dtc interrupt_provider warnings
>       arm64: dts: Fix dtc interrupt_provider warnings
>       arm: dts: Fix dtc interrupt_map warnings
>       arm64: dts: qcom: Fix interrupt-map cell sizes
>       dtc: Enable dtc interrupt_provider check

Only fixing it for arm, Sadge.

Co-incidentally I noticed there was one for riscv while looking at
Krzysztof's underscore in node name patch earlier, so I'd already
written a patch to fix it :)

--4XczAmSSxV0XIpGO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcvQiwAKCRB4tDGHoIJi
0iKoAP9EkRpfMdcQD2Rxy6EyQrFHOf9aK1XBqWvwsM+uYWZVZAD9El92XfSbd1tC
IcCJORhtpqwWl2bRDhMSRtSpWpqRygA=
=9Yjc
-----END PGP SIGNATURE-----

--4XczAmSSxV0XIpGO--

--===============1373546533329277976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1373546533329277976==--
