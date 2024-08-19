Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 635EA957191
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 19:08:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CF3DC6DD72;
	Mon, 19 Aug 2024 17:08:46 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67457C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 17:08:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2D01260AB8;
 Mon, 19 Aug 2024 17:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351FDC32782;
 Mon, 19 Aug 2024 17:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724087316;
 bh=E3wx3Yy8f4Z4HsNkio0m66ed4QzhHvCCsBlgSiuE7yA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MGuiYdlZpf/fS6Lsr3MsXPxoJoBAsh4wRG0kt/2k3f5Xnkz+VKP0FYzfDv4mrqJZ+
 Z6tHbi2sUCd6PKoznrsqe2PUuFTBxGqDkcI2z93joXi248VOOujU1LsBWID6N4sbTD
 jUKLM+CUIRcM1r9vE3WlMGK39nDOTEZx8nIDcblJtK3+vRV+x8zyWPQqGvgNkCaL7i
 ve/X3CgTr6mPe5hJ9+QAhRiZFQxT0GtgN6mxR2UtV7mKQ4qKywm30KZWXixt69UTUS
 bq10T4HkhCPYL82xFoaW9UGv49fCBOtb2ECdItVxeL0GjKzo3Q25z5enR3DgN5tn77
 jt2b1vOwB5sYQ==
Date: Mon, 19 Aug 2024 18:08:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20240819-gatherer-sedan-154904ce49ba@spud>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
 <20240818173014.122073-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240818173014.122073-5-krzysztof.kozlowski@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, linux-mips@vger.kernel.org,
 linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 patches@opensource.cirrus.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 5/5] dt-bindings: clock: st,
 stm32mp1-rcc: add top-level constraints
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
Content-Type: multipart/mixed; boundary="===============7465839109865318979=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7465839109865318979==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rQtkFboImljYNJPX"
Content-Disposition: inline


--rQtkFboImljYNJPX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 07:30:14PM +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks and clock-names.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--rQtkFboImljYNJPX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsN8DQAKCRB4tDGHoIJi
0pVLAQDwyIKwfsPuyqXb02vbHEEbL8TGRHM/QQvfFPhvZCI9zAEA71idxnNe3Jq5
wxYq+g9QkUAnqtmBwUD3Hm7yuVfTDgs=
=1VCV
-----END PGP SIGNATURE-----

--rQtkFboImljYNJPX--

--===============7465839109865318979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7465839109865318979==--
