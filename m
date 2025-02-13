Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D3EA33DC4
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2025 12:22:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0DE2C78F6D;
	Thu, 13 Feb 2025 11:22:01 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44972C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 11:21:54 +0000 (UTC)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250213112151epoutp01ceb6a7d55891d1a89c610b826750e706~jwKieNeSh1512915129epoutp01H
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 11:21:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250213112151epoutp01ceb6a7d55891d1a89c610b826750e706~jwKieNeSh1512915129epoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1739445711;
 bh=FYeA0egZv4FF41HWS+5lY5RJ3ar8Pphs0FsmtbhyRSE=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=qj29tY/iSIOX/IKeNwEWLUhYSOojk/p0yq39MyLUD5o9EhMrlTrfigvInh/f3eecq
 84a7nGp1x9AltRNUKXaTRFq1GhRgM7M05Jp+LqCej7VEd5vtVEEIO+C/IeAU42+Yjt
 9eaRUYaXidA013VMkA3nAAG5lk5HvpMbpBwigtMw=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20250213112150epcas5p432ded18de14682cc3b9c16d15c3a6f1b~jwKh9cVoO2775827758epcas5p4Q;
 Thu, 13 Feb 2025 11:21:50 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.176]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4Ytt710fwvz4x9Pr; Thu, 13 Feb
 2025 11:21:49 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 AF.8A.19710.CC5DDA76; Thu, 13 Feb 2025 20:21:48 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20250213110439epcas5p4363f12d24845f86de9f5e0d1c15bcaf9~jv7hQbNb63061630616epcas5p4_;
 Thu, 13 Feb 2025 11:04:39 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250213110439epsmtrp1713a253bece086c0e65de979af9e8830~jv7hPeule2200722007epsmtrp1E;
 Thu, 13 Feb 2025 11:04:39 +0000 (GMT)
X-AuditID: b6c32a44-363dc70000004cfe-d8-67add5cc2674
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 CF.18.23488.7C1DDA76; Thu, 13 Feb 2025 20:04:39 +0900 (KST)
Received: from FDSFTE596 (unknown [107.122.82.131]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20250213110436epsmtip2c8a8209a8c3b9ff20b96d86af3fac0e3~jv7ezI9zW2340823408epsmtip2R;
 Thu, 13 Feb 2025 11:04:36 +0000 (GMT)
From: "Swathi K S" <swathi.ks@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
In-Reply-To: <20250213-adorable-arboreal-degu-6bdcb8@krzk-bin>
Date: Thu, 13 Feb 2025 16:34:29 +0530
Message-ID: <009a01db7e07$132feb60$398fc220$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFMfZy5LnHh86L+CikZ+hKlrx3PbgHP/Q5uAh59lGQBgzSo3LQ3hOaA
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta1BUZRjuO2cvB2mZ44LywUSuJ7twWdjFZT3bLFhKzhZWFD9yGJWOcGYX
 2dvsLlJNTRZGiALSJLELrgsjFw1IF12X6wQhjkKAFzYoKBJIbjOMohgY0C4Hin/P9z7P+z3v
 810wlD/NCcRStSbaoKXUBGcDy/FT8CvCrr4apWjotpycnygEZOWwk01WN3cjZEnPMRZ5tr2b
 TY513OOSE5bfOWRPz0Uu2evIY5P2ERebvNNQwiFzXKNs0rpYwyY7bJvJuc5pQLZ3jaPk7fwC
 hFxucnJf4yvuuG6hisvnBxDFWP4VrqLeMsRV2OzpCvuF4xxF3bnPFfXOWUQx09LHUbS2iBWz
 9ufjvRPT5CqaSqENAlqbrEtJ1SqjibiEpN1JUVKRWCiWkTsIgZbS0NFE7N544Z5UtTsXIThC
 qdPdpXjKaCQiYuQGXbqJFqh0RlM0QetT1HqJPtxIaYzpWmW4lja9KhaJIqPcwg/TVHXmZkTf
 L/joQeEQ6yho9M8BXhjEJXDw7/sgB2zA+HgjgOaqRZaH4OMPAcy5F8YQcwDen/6StdZR9bAI
 YYhmAK2OBpRZjAP4XfYj4FFx8BBYltfC9WA/XAjr+iu5HhGKD6PwZFHJylZeeAzMnc10Exjm
 i78Hs675eMos/EVYUDLH8WAeLoNtrTdZDN4Ib5hHVzCKh8KK0imUmUgA58cq2IzXHvi0eAkw
 Gn94bf7kynAQP+EFKx1ONtMQCwfrMjkM9oWT1y9zGRwIJ/KzVnES/D6vbzWyCg4tFKzqd8If
 73rmx9wGwfCHhgimHARP36xFGF8fmPt0FGHqPOi0ruEX4OKUa3XLAOgon+GeAoRlXTTLumiW
 dREs/7vZAOsCCKD1Ro2STo7Si7V0xn8XnqzT2MHKsw+JdYL+s0vhbQDBQBuAGEr48WBhtZLP
 S6E+/oQ26JIM6Wra2Aai3OddgAZuSta5/43WlCSWyEQSqVQqkW2Xigl/Xmb9MSUfV1ImOo2m
 9bRhrQ/BvAKPIgc6R20J2dih0IMR7KyNGO9464I690zYvi/eBI7HTwJcj4sOTVyJ9HZs23vu
 ZdOmxbjSwb4y76L9w16/1XduaSWoLuuutPlk+tKIf6LQ/M6ULYgM3Uw0Fl/tiKm6WP3rQfR9
 LeIzvlQxkLaj3CqMvH7a71NNwfmF7N3tQfWnmpb/GbYkbGFDyaQm8sHXR3wzUrfJ5Rr71pqr
 5jFZ8K7Kv575Y1jfe2BfapP88I0Pen+Je/Qz/nbG5FuijlvWmbvdxW9cop6bebf3z5eeTYzM
 bnrdpAz7Ft0pFwwcXlbXfmOuLaXPTA9FDQpkrv6ZphNSqq56ZHvtmKUs74ntM5+Y8v21X6ki
 CJZRRYlDUIOR+hfqY4fEfwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRmVeSWpSXmKPExsWy7bCSvO7xi2vTDTY+EbD4+XIao8XyBztY
 LdbsPcdkMed8C4vF/CPnWC2eHnvEbvFy1j02i/PnN7BbXNjWx2qx6fE1VovLu+awWXRde8Jq
 Me/vWlaLYwvELL6dfsNoceTMC2aLS/0TmSz+79nB7iDkcfnaRWaPLStvMnk87d/K7rFz1l12
 jwWbSj02repk89i8pN5j547PTB7v911l8zi4z9Dj8ya5AO4oLpuU1JzMstQifbsErowFGyaw
 FjyXr9jY3svcwHhCrIuRk0NCwERixacZTF2MXBxCArsZJWadX84MkZCU+NQ8lRXCFpZY+e85
 O0TRM0aJvnUbGEESbAJaEov69rGD2CICuhKbbywHK2IW+MIsMfv+ZKixbxklrjYdYAGp4hSw
 k+j93AzWISzgL/G+9ySYzSKgKjFxzjc2EJtXwFLi0MFTLBC2oMTJmU/AbGYBbYmnN5/C2csW
 voY6VUHi59NlrBBXuEn8nv2PEaJGXOLozx7mCYzCs5CMmoVk1Cwko2YhaVnAyLKKUTK1oDg3
 PTfZsMAwL7Vcrzgxt7g0L10vOT93EyM46rU0djC++9akf4iRiYPxEKMEB7OSCK/EtDXpQrwp
 iZVVqUX58UWlOanFhxilOViUxHlXGkakCwmkJ5akZqemFqQWwWSZODilGpi6QvQf7P8iaav1
 4mzOiq3nQy7PXRN8est2l/dRqXdY64ofqt09IMTynvtnrWVB0NezPutdg3yCGjhmeX06veyJ
 mPB2izvXC/zU0vPPBuYdCJZJiBD1TEvhWnKrn4275uh649r6jXwL/GWz/M9+/uP2oNm//yfr
 7xOvJ5eu8IrUd8zhV6n4/nTXuzuxFv95hZ6xG01qcFPiCTh5polz6oZ4Sx7Zd/mzN93f2Fcr
 pl/w9u2cubtnyGiesm9R/Nebe/lY5nTBmqcPZvned5C0/6gmK1sWzrAs19Rk2tGGDcGzJOS2
 dZX3TpvcO+POet7aXA6vFwGPUueLrJvacYm7b2NiNkuc7ZZNVlJThGt+7FBiKc5INNRiLipO
 BACb1ffZaQMAAA==
X-CMS-MailID: 20250213110439epcas5p4363f12d24845f86de9f5e0d1c15bcaf9
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250213044955epcas5p110d1e582c8ee02579ead73f9686819ff
References: <20250213044624.37334-1-swathi.ks@samsung.com>
 <CGME20250213044955epcas5p110d1e582c8ee02579ead73f9686819ff@epcas5p1.samsung.com>
 <20250213044624.37334-2-swathi.ks@samsung.com>
 <20250213-adorable-arboreal-degu-6bdcb8@krzk-bin>
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



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 13 February 2025 13:24
> To: Swathi K S <swathi.ks@samsung.com>
> Cc: krzk+dt@kernel.org; andrew+netdev@lunn.ch; davem@davemloft.net;
> edumazet@google.com; kuba@kernel.org; pabeni@redhat.com;
> robh@kernel.org; conor+dt@kernel.org; richardcochran@gmail.com;
> mcoquelin.stm32@gmail.com; alexandre.torgue@foss.st.com;
> rmk+kernel@armlinux.org.uk; netdev@vger.kernel.org;
> devicetree@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v6 1/2] dt-bindings: net: Add FSD EQoS device tree
> bindings
> 
> On Thu, Feb 13, 2025 at 10:16:23AM +0530, Swathi K S wrote:
> > +  clock-names:
> > +    minItems: 5
> > +    maxItems: 10
> > +    contains:
> > +      enum:
> > +        - ptp_ref
> > +        - master_bus
> > +        - slave_bus
> > +        - tx
> > +        - rx
> > +        - master2_bus
> > +        - slave2_bus
> > +        - eqos_rxclk_mux
> > +        - eqos_phyrxclk
> > +        - dout_peric_rgmii_clk
> 
> This does not match the previous entry. It should be strictly ordered with
> minItems: 5.

Hi Krzysztof,
Thanks for reviewing.
In FSD SoC, we have 2 instances of ethernet in two blocks.
One instance needs 5 clocks and the other needs 10 clocks.

I tried to understand this by looking at some other dt-binding files as given below, but looks like they follow similar approach
Documentation/devicetree/bindings/net/stm32-dwmac.yaml
Documentation/devicetree/bindings/net/rockchip-dwmac.yaml

Could you please guide me on how to implement this?
Also, please help me understand what is meant by 'strictly ordered'

> 
> 
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  phy-mode:
> > +    enum:
> > +      - rgmii-id
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - iommus
> > +  - phy-mode
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/fsd-clk.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +        ethernet1: ethernet@14300000 {
> > +            compatible = "tesla,fsd-ethqos";
> > +            reg = <0x0 0x14300000 0x0 0x10000>;
> > +            interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
> > +            interrupt-names = "macirq";
> > +            clocks = <&clock_peric
> PERIC_EQOS_TOP_IPCLKPORT_CLK_PTP_REF_I>,
> > +                     <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_ACLK_I>,
> > +                     <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_HCLK_I>,
> > +                     <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_RGMII_CLK_I>,
> > +                     <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_CLK_RX_I>,
> > +                     <&clock_peric PERIC_BUS_D_PERIC_IPCLKPORT_EQOSCLK>,
> > +                     <&clock_peric PERIC_BUS_P_PERIC_IPCLKPORT_EQOSCLK>,
> > +                     <&clock_peric PERIC_EQOS_PHYRXCLK_MUX>,
> > +                     <&clock_peric PERIC_EQOS_PHYRXCLK>,
> > +                     <&clock_peric PERIC_DOUT_RGMII_CLK>;
> > +            clock-names = "ptp_ref", "master_bus", "slave_bus","tx",
> > +                          "rx", "master2_bus", "slave2_bus", "eqos_rxclk_mux",
> > +                          "eqos_phyrxclk","dout_peric_rgmii_clk";
> > +            pinctrl-names = "default";
> > +            pinctrl-0 = <&eth1_tx_clk>, <&eth1_tx_data>, <&eth1_tx_ctrl>,
> > +                        <&eth1_phy_intr>, <&eth1_rx_clk>, <&eth1_rx_data>,
> > +                        <&eth1_rx_ctrl>, <&eth1_mdio>;
> > +            iommus = <&smmu_peric 0x0 0x1>;
> > +            phy-mode = "rgmii-id";
> > +       };
> 
> Misaligned/misindented.

Ack

> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
