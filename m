Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E6CA20B07
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2025 14:14:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 474DAC78034;
	Tue, 28 Jan 2025 13:14:02 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FC88C7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 13:14:00 +0000 (UTC)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250128131357epoutp039ff0a7abc8918b14809eaa70dae66693~e3X2da2LC2380323803epoutp03N
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 13:13:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250128131357epoutp039ff0a7abc8918b14809eaa70dae66693~e3X2da2LC2380323803epoutp03N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738070037;
 bh=9mMEHURnnIRaojc/45hwS5ELTtQ8ag5mR0lXAwg4Kdc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JT8BPvPREuuqayyvDSXuRhPKHfm3aCZ6n5bUsEkc4CUL3SKQESqeG128x8GIudNNa
 p1dgRmjeB6jaUnZyIcVxgAq8l3t/r8L96Xi+H9qKq7xXxVNtpLj/FwmWuOkjki+uOw
 fJy29XnGQ6Js6EmIy+E6k6VSbGRApPqlv6ZSF00M=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20250128131357epcas5p4efaa15ab01713a577e210cc2c5354499~e3X1wgonU0105801058epcas5p4G;
 Tue, 28 Jan 2025 13:13:57 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.180]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Yj5Ml3PpRz4x9Pt; Tue, 28 Jan
 2025 13:13:55 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 94.13.29212.318D8976; Tue, 28 Jan 2025 22:13:55 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20250128102725epcas5p44b02ac2980a3aeb0016ce9fdef011ecf~e1GcDkDy62132621326epcas5p40;
 Tue, 28 Jan 2025 10:27:25 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250128102725epsmtrp2d2b58c924547ed9b86a0b7f7a3fb783e~e1GcCad081510015100epsmtrp2k;
 Tue, 28 Jan 2025 10:27:25 +0000 (GMT)
X-AuditID: b6c32a50-7ebff7000000721c-66-6798d813dece
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 2D.DC.33707.C01B8976; Tue, 28 Jan 2025 19:27:24 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250128102721epsmtip18b6b197d3a1843eadbc1e0d25038816f~e1GYeexmp1807818078epsmtip1m;
 Tue, 28 Jan 2025 10:27:21 +0000 (GMT)
From: Swathi K S <swathi.ks@samsung.com>
To: krzk@kernel.org, robh@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 conor+dt@kernel.org, richardcochran@gmail.com, mcoquelin.stm32@gmail.com,
 andrew@lunn.ch, alim.akhtar@samsung.com, linux-fsd@tesla.com
Date: Tue, 28 Jan 2025 15:55:55 +0530
Message-Id: <20250128102558.22459-2-swathi.ks@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250128102558.22459-1-swathi.ks@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WTe1DUVRTH5/5eu1DgBlRXJpTWpNDhsba7XhTCkuw3ohPlH1kNrTvwYyGW
 3Z19UNRM7ijqSLkJVDKwPIcm4qG48lhweS0MJCGLrKKgiBhrvJFgEAykhV3sv8/5nvM95865
 97Jxj3nKm50gUzNKmVjKpVyJmlZ//wDPO1mSYOusJ1oa+wWgB3k1FLIMmnFU3tCNIb0llUD5
 bd0ksrU/ZKH+5joMtXUWY+h+0TSJLJZKFuqp0ZHI8FcfiYbHP0HWej2FsiyNGErrGyFR3koF
 idoLXkELf04CVFQ9z0KrE9UADT82sVB2j5FEbV2jOFo1GVmo6EEBieYv97P2vUZX/d6P0bYf
 q1l0XfYgiy4waGhD6VmKvlJ8nK4zzmH0TOMtitZVlQK6pZFH2xYbcLqqaQ7Qz07ksug5w5Yo
 988SQ+MZcSyj9GVkMfLYBJkkjBt5RLRfJBAG8wJ4IWg311cmTmLCuBGHogIOJEjte+H6Joul
 GrsUJVapuEHvhCrlGjXjGy9XqcO4jCJWquArAlXiJJVGJgmUMeo9vODgXQJ74bHE+PLTjwnF
 fe7XthE9pQVGmAZc2JDDh9qGUSwNuLI9OCYAtQtayhH8A+BqdS/+PFieHGFtWFpqy0lHog5A
 3Ykep2UewCeGK8RaFcV5C94uqWWtJbw4WgxmTN1Y74VzmnDYr7OtV3lyImHm5Mw6E5ztcKD3
 b2qN3Th7YE+u3jlvKyyrbMbX2IWzF44WzRIO/YILzLj6nYMjYIXpLulgTzjeUeX0esO56QbK
 wSJYprvl9MbDwafpTj0cNt/U23W2/XD+8FJ9kEP2gT93XsTWGOe4w3P/jmAO3Q0a8zZ4G1yZ
 6HO23Axrfp1xjqWh9eYUcGxFB2Dr6gRxHmzJ/n9EAQClwJtRqJIkTIxAwQuQMV89v7gYeZIB
 rD//HVFGUFa5EmgGGBuYAWTjXC+36O4siYdbrDjlG0YpFyk1UkZlBgL7AtNx75dj5Pb/I1OL
 ePyQYL5QKOSHvC3kcV91O1mXKvHgSMRqJpFhFIxyw4exXby12IuujNcxP381b6CVCA+SnCtO
 OjXVRPo0hr7x+sdjs4cTB4lUbbJg4FkQViL/8ABpDVWfDnmYvr3W3FxeGEik5NuuHzSezZx+
 U3p059LKoaD0q72Cxp+Wd2mGVC3Rnd/+MbU0HHGyKyRnVp6xtDCkz6nnb7snK3T3HRjbn3nj
 /VMpiTH9hqitX+w1PwnojPO09EaLXkju0G7yu94Zdo0oDDzYHPde+qOcC5vPPO04PLRozf30
 +00f7At/9+LUD9D20dHk88tUifm2Ld+Ut8iLZq4VWkt7S37rji2WflnvG3nmMrgrzMce7Y77
 3MXHq8LU0DF+Z2ee371stHiJntO/1HW870g7l1DFi3k7cKVK/B9ZwYwlhwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWReUiTYRzHe95377HB4mVqPh0YLJSwmkpBTwdRZvViJwXZAerUl6k5G5sz
 C7pcB1uSskpMpsk006mYU+e8j0xIy61LW6U4j9Tuqd2Z5aT/vj8+H77fP340LrrNW0THJSZx
 ykRpgpgU8Cz3xD6rhBVZssAvCvRjPBOggVwLiWx9bTgqbezGkMF2gYdutXcTaKRjkEKOlloM
 tXcWYKjf+JFANttdCtktVwlkHuohkPNtGHpaZyBRlq0JQ7qeYQLlTpcRqCNvAfra9R4gY/UU
 hWbeVQPk/NxAoWy7lUDtD8dwNNNgpZBxII9AUxUOavMStqrYgbEj6dUUW5vdR7F5ZjVrNmlJ
 trLgLFtrncTYT03PSfZqlQmwrU1B7Mj3Rpytap4E7J/UHIqdNPvsm39EsDGGS4hL5pQBmyIF
 saWXPvMU/eKUkWEDeQ5YoQ7wacisga01pYQOCGgRUwPgHc0Hcg4shBOaG8Rc9oDFf0apOWkC
 wBxtAT4LSGY57C2qcQNPJgOD5RPN2OyBM49xqOl0UbOWB7MTXnv/iTebeYwvfPlk1D0hZNZD
 e46BmptYCkvutrhb+cwGOGZ0uX3RP8eZmgkywPw8MM8EvDiFSi6TRyuCJCqpXKVOlEmij8vN
 wP1J//1WUFg+LWkDGA3aAKRxsadQ67guEwljpCdPccrjEUp1AqdqA4tpnthbuCxBGyNiZNIk
 7hjHKTjlf4rR/EXnsCuBRZGHkqu/hNXf7l2blt/iW9aa6acazq+6UCvqzz8gOLxMl3kiPb4r
 6tuAx+jCyIZXwUnjoUcfRVd+vyjuRqZgU3iFpfP6Cs2uUP9tAX6ucTPqdgm3ek4nh/NnIhyK
 6brJaP93WwZDyurV1zoe/EzzvqGet/ho11aX8w1/z69+TfL9yqj4wnjF4Hn7TNaO1wWCY3uH
 3krK+b2PDk9Ru7cXpQUHl0BJysO+5UdWb/KW1Whf/F4Z5iMOu2m84oyQZvid2qOnQ34Weut8
 d0WWr9nOys1vtuj1g5f19oO3nlnOrIr1WaI/xNUdyE5XBIyt8zrtu7Qn2wBDS0P6yLTU5wE5
 Yp4qVhrkjytV0r+hOdqyOAMAAA==
X-CMS-MailID: 20250128102725epcas5p44b02ac2980a3aeb0016ce9fdef011ecf
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250128102725epcas5p44b02ac2980a3aeb0016ce9fdef011ecf
References: <20250128102558.22459-1-swathi.ks@samsung.com>
 <CGME20250128102725epcas5p44b02ac2980a3aeb0016ce9fdef011ecf@epcas5p4.samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 ravi.patel@samsung.com, rcsekar@samsung.com, netdev@vger.kernel.org,
 jayati.sahu@samsung.com, ssiddha@tesla.com, linux-kernel@vger.kernel.org,
 swathi.ks@samsung.com, joabreu@synopsys.com, pankaj.dubey@samsung.com,
 peppe.cavallaro@st.com, gost.dev@samsung.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 1/4] dt-bindings: net: Add FSD EQoS device
	tree bindings
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Add FSD Ethernet compatible in Synopsys dt-bindings document. Add FSD
Ethernet YAML schema to enable the DT validation.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
Signed-off-by: Swathi K S <swathi.ks@samsung.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |  5 +-
 .../bindings/net/tesla,fsd-ethqos.yaml        | 91 +++++++++++++++++++
 2 files changed, 94 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 91e75eb3f329..2243bf48a0b7 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -103,6 +103,7 @@ properties:
         - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
         - thead,th1520-gmac
+        - tesla,fsd-ethqos
 
   reg:
     minItems: 1
@@ -126,7 +127,7 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 8
+    maxItems: 10
     additionalItems: true
     items:
       - description: GMAC main clock
@@ -138,7 +139,7 @@ properties:
 
   clock-names:
     minItems: 1
-    maxItems: 8
+    maxItems: 10
     additionalItems: true
     contains:
       enum:
diff --git a/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml b/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
new file mode 100644
index 000000000000..579a7bd1701d
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/tesla,fsd-ethqos.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: FSD Ethernet Quality of Service
+
+maintainers:
+  - Swathi K S <swathi.ks@samsung.com>
+
+description:
+  Tesla ethernet devices based on dwmmac support Gigabit ethernet.
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    const: tesla,fsd-ethqos.yaml
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 5
+    maxItems: 10
+
+  clock-names:
+    minItems: 5
+    maxItems: 10
+
+  iommus:
+    maxItems: 1
+
+  phy-mode:
+    enum:
+     - rgmii-id
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - iommus
+  - phy-mode
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/fsd-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ethernet_1: ethernet@14300000 {
+              compatible = "tesla,fsd-ethqos";
+              reg = <0x0 0x14300000 0x0 0x10000>;
+              interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+              clocks = <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_CLK_PTP_REF_I>,
+                       <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_ACLK_I>,
+                       <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_HCLK_I>,
+                       <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_RGMII_CLK_I>,
+                       <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_CLK_RX_I>,
+                       <&clock_peric PERIC_BUS_D_PERIC_IPCLKPORT_EQOSCLK>,
+                       <&clock_peric PERIC_BUS_P_PERIC_IPCLKPORT_EQOSCLK>,
+                       <&clock_peric PERIC_EQOS_PHYRXCLK_MUX>,
+                       <&clock_peric PERIC_EQOS_PHYRXCLK>,
+                       <&clock_peric PERIC_DOUT_RGMII_CLK>;
+              clock-names = "ptp_ref",
+                            "master_bus",
+                            "slave_bus",
+                            "tx",
+                            "rx",
+                            "master2_bus",
+                            "slave2_bus",
+                            "eqos_rxclk_mux",
+                            "eqos_phyrxclk",
+                            "dout_peric_rgmii_clk";
+              pinctrl-names = "default";
+              pinctrl-0 = <&eth1_tx_clk>, <&eth1_tx_data>, <&eth1_tx_ctrl>,
+                          <&eth1_phy_intr>, <&eth1_rx_clk>, <&eth1_rx_data>,
+                          <&eth1_rx_ctrl>, <&eth1_mdio>;
+              iommus = <&smmu_peric 0x0 0x1>;
+              phy-mode = "rgmii-id";
+    };
+
+...
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
