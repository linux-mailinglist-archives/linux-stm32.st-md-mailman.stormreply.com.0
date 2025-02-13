Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 092DAA3394A
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2025 08:54:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADBB1C78039;
	Thu, 13 Feb 2025 07:54:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 401D7C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 07:54:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 78A795C041E;
 Thu, 13 Feb 2025 07:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B991C4CED1;
 Thu, 13 Feb 2025 07:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739433252;
 bh=56Ta27lSOpZW6WT1dfipytAfcqD14QNHO7m6Mo7UhBY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GkKfm+0z1/NQtvj5DekG7tlgJXv7KvTYjV7uBiZCErsGUfI88dj0z4vErZav2EL04
 H9SIpabXaoUXbWxWg/s9f/pJaJW/ux2aWLSHp/Ud3SkJGU5QW91S2oY052y1q57ohM
 TFw0DXIBakxQmtCdF4c/xrs3SGT0kHWTIl5NT1CaV9ycuzmTyO+WZVuHFD6BDLDHF7
 DWnCV9GdRsg13axmldqBa1yZ5sx0bTnDw5syFgZYGB4/k71TZChpkQc2ieAJfaBfBZ
 T5APTSqFiLrYNV4UFPgdPGmN8utVYIWp++nRPuYHcmeH1iTwpZn/E/YOFXWguOcKUj
 RGy9TQHVMsG2Q==
Date: Thu, 13 Feb 2025 08:54:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swathi K S <swathi.ks@samsung.com>
Message-ID: <20250213-adorable-arboreal-degu-6bdcb8@krzk-bin>
References: <20250213044624.37334-1-swathi.ks@samsung.com>
 <CGME20250213044955epcas5p110d1e582c8ee02579ead73f9686819ff@epcas5p1.samsung.com>
 <20250213044624.37334-2-swathi.ks@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250213044624.37334-2-swathi.ks@samsung.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 krzk+dt@kernel.org, pabeni@redhat.com, rmk+kernel@armlinux.org.uk,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 1/2] dt-bindings: net: Add FSD EQoS
 device tree bindings
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

On Thu, Feb 13, 2025 at 10:16:23AM +0530, Swathi K S wrote:
> +  clock-names:
> +    minItems: 5
> +    maxItems: 10
> +    contains:
> +      enum:
> +        - ptp_ref
> +        - master_bus
> +        - slave_bus
> +        - tx
> +        - rx
> +        - master2_bus
> +        - slave2_bus
> +        - eqos_rxclk_mux
> +        - eqos_phyrxclk
> +        - dout_peric_rgmii_clk

This does not match the previous entry. It should be strictly ordered
with minItems: 5.


> +
> +  iommus:
> +    maxItems: 1
> +
> +  phy-mode:
> +    enum:
> +      - rgmii-id
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - iommus
> +  - phy-mode
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/fsd-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        ethernet1: ethernet@14300000 {
> +            compatible = "tesla,fsd-ethqos";
> +            reg = <0x0 0x14300000 0x0 0x10000>;
> +            interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "macirq";
> +            clocks = <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_CLK_PTP_REF_I>,
> +                     <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_ACLK_I>,
> +                     <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_HCLK_I>,
> +                     <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_RGMII_CLK_I>,
> +                     <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_CLK_RX_I>,
> +                     <&clock_peric PERIC_BUS_D_PERIC_IPCLKPORT_EQOSCLK>,
> +                     <&clock_peric PERIC_BUS_P_PERIC_IPCLKPORT_EQOSCLK>,
> +                     <&clock_peric PERIC_EQOS_PHYRXCLK_MUX>,
> +                     <&clock_peric PERIC_EQOS_PHYRXCLK>,
> +                     <&clock_peric PERIC_DOUT_RGMII_CLK>;
> +            clock-names = "ptp_ref", "master_bus", "slave_bus","tx",
> +                          "rx", "master2_bus", "slave2_bus", "eqos_rxclk_mux",
> +                          "eqos_phyrxclk","dout_peric_rgmii_clk";
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&eth1_tx_clk>, <&eth1_tx_data>, <&eth1_tx_ctrl>,
> +                        <&eth1_phy_intr>, <&eth1_rx_clk>, <&eth1_rx_data>,
> +                        <&eth1_rx_ctrl>, <&eth1_mdio>;
> +            iommus = <&smmu_peric 0x0 0x1>;
> +            phy-mode = "rgmii-id";
> +       };

Misaligned/misindented.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
