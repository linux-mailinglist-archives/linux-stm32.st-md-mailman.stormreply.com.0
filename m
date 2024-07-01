Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B581891E72B
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jul 2024 20:10:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 653F4C6DD9E;
	Mon,  1 Jul 2024 18:10:31 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6847AC5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jul 2024 18:10:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3D56ECE1695;
 Mon,  1 Jul 2024 18:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A5E4C32781;
 Mon,  1 Jul 2024 18:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719857421;
 bh=42+iNoMF14DtqzqhxbInBjWKbLDDhJxeyWwx2WLtC1o=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=smt5AEH8QL5nagLdczW5xMrkVGISw2IBh0c6PMgnUaJFpJtJ9nELunnWviupwHh1v
 whceka3Z8h2hiceGdHhtDN3Xl+AFbqc5f2DT0v2vsQuAqWPEC85Ll8wNdxZLvnSOsJ
 JXuFqv3FJgrhmm2TgghkEthsEpolns2TaIfYSEIMIyIA8O7aSsX1pTLPUTzTwv3owr
 kp9iRnJemtkRFQse66czG+FzFf7oSO7MwD2s0jXi8kSdSelNedGjT3xYPphi9BQ+WR
 sgB+3i1KCxg0R25yW2f/m2LZRLaFOIB0KwfmmP3aXEZ8xwfLa5ULgPkDR4NEq0vBu7
 CRbtWgQNPUjCA==
Date: Mon, 01 Jul 2024 12:10:20 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
In-Reply-To: <20240629171100.20285-1-marex@denx.de>
References: <20240629171100.20285-1-marex@denx.de>
Message-Id: <171985715690.313627.4404278514791505125.robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add ethernet MAC nvmem
 cells to DH STM32MP13xx DHCOR DHSBC board
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


On Sat, 29 Jun 2024 19:10:30 +0200, Marek Vasut wrote:
> Describe ethernet MAC address nvmem cells in DH STM32MP13xx DHCOR DHSBC
> board DT. The MAC address can be fused in BSEC OTP fuses and used to set
> up MAC address for both ethernet MACs on this board.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christophe Roullier <christophe.roullier@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y st/stm32mp135f-dhcor-dhsbc.dtb' for 20240629171100.20285-1-marex@denx.de:

arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800a000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts-extended', 'mdio', 'nvmem-cell-names', 'nvmem-cells', 'phy-handle', 'phy-mode', 'snps,axi-config', 'snps,mixed-burst', 'snps,pbl', 'snps,tso', 'stmmac-axi-config' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/stm32-dwmac.yaml#
arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800e000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts-extended', 'mdio', 'nvmem-cell-names', 'nvmem-cells', 'phy-handle', 'phy-mode', 'snps,axi-config', 'snps,mixed-burst', 'snps,pbl', 'snps,tso', 'stmmac-axi-config' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/stm32-dwmac.yaml#





_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
