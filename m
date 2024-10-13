Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D43999BA16
	for <lists+linux-stm32@lfdr.de>; Sun, 13 Oct 2024 17:33:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FBA8C7128A;
	Sun, 13 Oct 2024 15:33:22 +0000 (UTC)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FD2BC6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Oct 2024 15:33:15 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0C6EA1A13F7;
 Sun, 13 Oct 2024 17:33:15 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 052241A1C55;
 Sun, 13 Oct 2024 17:33:15 +0200 (CEST)
Received: from lsv051416.swis.nl-cdc01.nxp.com
 (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id C72CB20406;
 Sun, 13 Oct 2024 17:33:15 +0200 (CEST)
Date: Sun, 13 Oct 2024 17:33:14 +0200
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <ZwvoOpgApLQWWY05@lsv051416.swis.nl-cdc01.nxp.com>
References: <AM9PR04MB8506A1FAC2DA26F27771D039E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
 <7bbd48c8-7fa6-4d41-9560-3de0a2394c55@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7bbd48c8-7fa6-4d41-9560-3de0a2394c55@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Andrew Lunn <andrew@lunn.ch>, dl-S32 <S32@nxp.com>,
 Eric Dumazet <edumazet@google.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Rob Herring <robh@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 3/7] dt-bindings: net: Add DT bindings
 for DWMAC on NXP S32G/R SoCs
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

On Mon, Aug 19, 2024 at 08:21:03AM +0200, Krzysztof Kozlowski wrote:
> On 18/08/2024 23:50, Jan Petrous (OSS) wrote:
> > Add basic description for DWMAC ethernet IP on NXP S32G2xx, S32G3xx
> > and S32R45 automotive series SoCs.
> 
> Fix your email threading. b4 handle everything correctly, so start using it.
> 

Done. V3 will be sent by b4/msmtp.

> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  .../bindings/net/nxp,s32cc-dwmac.yaml         | 127 ++++++++++++++++++
> >  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
> >  2 files changed, 128 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/nxp,s32cc-dwmac.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/net/nxp,s32cc-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32cc-dwmac.yaml
> > new file mode 100644
> > index 000000000000..443ad918a9a5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/nxp,s32cc-dwmac.yaml
> 
> Filename based on compatible, so what does "cc" stand for?

Ok, removed 'cc'.

> 
> > @@ -0,0 +1,127 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright 2021-2024 NXP
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/nxp,s32cc-dwmac.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP S32G2xx/S32G3xx/S32R45 GMAC ethernet controller
> > +
> > +maintainers:
> > +  - Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > +
> > +description: |
> 
> Do not need '|' unless you need to preserve formatting.

Removed.

> 
> > +  This device is a platform glue layer for stmmac.
> 
> Drop description of driver and instead describe the hardware.

Changed in v3.

> 
> > +  Please see snps,dwmac.yaml for the other unchanged properties.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nxp,s32g2-dwmac
> > +      - nxp,s32g3-dwmac
> > +      - nxp,s32r45-dwmac
> > +
> > +  reg:
> > +    items:
> > +      - description: Main GMAC registers
> > +      - description: GMAC PHY mode control register
> > +
> > +  interrupts:
> > +    description: Common GMAC interrupt
> 
> No, instead maxItems: 1
> 

Done.

> > +
> > +  interrupt-names:
> > +    const: macirq
> > +
> > +  clocks:
> > +    items:
> > +      - description: Main GMAC clock
> > +      - description: Transmit clock
> > +      - description: Receive clock
> > +      - description: PTP reference clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: stmmaceth
> > +      - const: tx
> > +      - const: rx
> > +      - const: ptp_ref
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - interrupt-names
> > +  - clocks
> > +  - clock-names
> > +  - phy-mode
> 
> Drop, snps,dwmac requires this.

Compressed to 'clocks' and 'clock-names'.

> 
> > +
> > +allOf:
> > +  - $ref: snps,dwmac.yaml#
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/phy/phy.h>
> > +    bus {
> > +      #address-cells = <2>;
> > +      #size-cells = <2>;
> > +
> > +      ethernet@4033c000 {
> > +        compatible = "nxp,s32cc-dwmac";
> > +        reg = <0x0 0x4033c000 0x0 0x2000>, /* gmac IP */
> > +              <0x0 0x4007c004 0x0 0x4>;    /* GMAC_0_CTRL_STS */
> > +        interrupt-parent = <&gic>;
> > +        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> > +        interrupt-names = "macirq";
> > +        snps,mtl-rx-config = <&mtl_rx_setup>;
> > +        snps,mtl-tx-config = <&mtl_tx_setup>;
> > +        clocks = <&clks 24>, <&clks 17>, <&clks 16>, <&clks 15>;
> > +        clock-names = "stmmaceth", "tx", "rx", "ptp_ref";
> > +        phy-mode = "rgmii-id";
> > +        phy-handle = <&phy0>;
> > +
> > +        mtl_rx_setup: rx-queues-config {
> > +          snps,rx-queues-to-use = <5>;
> > +
> > +          queue0 {
> > +          };
> > +          queue1 {
> > +          };
> 
> 
> Why listing empty nodes?

Removed in v3.

> 
> Best regards,
> Krzysztof
> 

Thanks.
/Jan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
