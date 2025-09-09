Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C163B4A32F
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Sep 2025 09:14:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6DCDC36B3D;
	Tue,  9 Sep 2025 07:14:46 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15256C36B16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Sep 2025 07:14:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A926943667;
 Tue,  9 Sep 2025 07:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0328C4CEF4;
 Tue,  9 Sep 2025 07:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757402083;
 bh=9eG5fnaSGiqXsw4eiPV/yIEg2n0/EzNdL6QuKQ4J0G4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PyuPtYAwzhNuKU4CSjN/l5NrjK4jQlq9+Gd6w3rSIGppeuJ0CPZX6VeWqDtHL4h65
 RPH4fFhyVl7Dh0ieAdIQZbCjO5GMIckLfwxIZrzUVa9RdVZB3IOQkZFrdEbMdvmobG
 GZOgJb3ByAtgslNt9n6hMSayDcghNkFv9NbfbDyA1ePzq4ZqnsZ4dqiGdQ1tpArVy8
 PfdTXAuLyA6+jiPGJG6XjNEmrkQpwBiBILIhyYjhVhaTgRTWiUKGI9AJ/H7NbjLHB9
 MdhAX5tTLBe9r/FHQBAHLTl6KgqZH1IZTlhwM4hgonvAzGZDXtuuK+sBNZjRXi3hiD
 VS+HP22zctCDA==
Date: Tue, 9 Sep 2025 09:14:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Message-ID: <20250909-charming-tuscan-mouse-abc1e0@kuoka>
References: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250908105901.3198975-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250908105901.3198975-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/3] dt-bindings: net: renesas,
 rzv2h-gbeth: Document Renesas RZ/T2H and RZ/N2H SoCs
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

On Mon, Sep 08, 2025 at 11:58:59AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add device tree binding support for the Gigabit Ethernet MAC (GMAC) IP
> on Renesas RZ/T2H and RZ/N2H SoCs. While these SoCs use the same
> Synopsys DesignWare MAC version 5.20 as RZ/V2H, they are synthesized
> with different hardware configurations.
> 
> Add new compatible strings "renesas,r9a09g077-gbeth" for RZ/T2H and
> "renesas,r9a09g087-gbeth" for RZ/N2H, with the latter using RZ/T2H as
> fallback since they share identical GMAC IP.
> 
> Update the schema to handle hardware differences between SoC variants.
> RZ/T2H requires only 3 clocks compared to 7 on RZ/V2H, supports 8 RX/TX
> queue pairs instead of 4, and needs 2 reset controls with reset-names
> property versus a single unnamed reset. RZ/T2H also has the split header
> feature enabled which is disabled on RZ/V2H.
> 
> Add support for an optional pcs-handle property to connect the GMAC to
> the MIIC PCS converter on RZ/T2H. Use conditional schema validation to
> enforce the correct clock, reset, and interrupt configurations per SoC
> variant.
> 
> Extend the base snps,dwmac.yaml schema to accommodate the increased
> interrupt count, supporting up to 19 interrupts and extending the
> rx-queue and tx-queue interrupt name patterns to cover queues 0-7.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
