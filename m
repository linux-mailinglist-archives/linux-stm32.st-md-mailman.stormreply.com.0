Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC976D2A20
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 23:46:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7237CC69069;
	Fri, 31 Mar 2023 21:46:25 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9486C6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 21:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680299182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8R6+P26evvrjI1mMxGxNI8F3VJcXEzOTQuxXqUJHchU=;
 b=iod8/uK08lt2ylLv6pZuRqlyYHu7U9FPNiVIRKmQt2OpD/vfbzy0U2M05RwcHLdLshH/Ql
 QMBTKkkBKmwZ+A6nxELdVBq16KCGx4bjbJ0jaf26AV5080YtbS8rBa/mC78t7fMaJalE1R
 sv2nDKEShb3lnPk6jp5Z0dFR5ZE4flE=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-dUoBpzbCOVaJNtnX4gRWsg-1; Fri, 31 Mar 2023 17:46:21 -0400
X-MC-Unique: dUoBpzbCOVaJNtnX4gRWsg-1
Received: by mail-ot1-f71.google.com with SMTP id
 i27-20020a9d611b000000b006a13cc62b7eso6220859otj.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 14:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680299181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8R6+P26evvrjI1mMxGxNI8F3VJcXEzOTQuxXqUJHchU=;
 b=tkHR/fFAv2BDQf17NwuavsTCUl+RVCMTZ9H2jZQ+g2B2oVURwWf7C4W/6MJNljbZKM
 uUwiwC5SsjFJGdh9yadvknX5NdH3blKZ66pRfwWfPEYCPWRabExu/xPP5viP32Xn5yRg
 lf1HBX5Dg1ADYf0lQgAk8h7xpzJtQhEoJEEpsLjlt/dC2caxPdbEeKMSOTaPOceNGx9h
 RmY8QX7g1oI4ihuU1oAA8/EptpSoo8+TrNqDJbJW8RiQPw6fy7wYWyOvw847DgQYo9nM
 NXTy6eufjHEiNPZK1EzetSEImiIsSISWWq425tBDD1vHKeWG+5aXnNqQoow3wwaCIB0M
 d6YA==
X-Gm-Message-State: AO0yUKXvCMZam9N7XfDKeWmOAARczs8hJX/F8Q12XyU5ocUHbwjSwy55
 ne9DxWi/qUMksFoC/239dg2SeT+ZxGeGW6yoluoYVe4tLQ1SSuwOeQz7hDfBWipHRB1VJg+x5bf
 Ra+zr/qSbd3KU06zt0A9dmB6OzKZldZVkCG/SUjQg
X-Received: by 2002:a4a:3707:0:b0:525:7096:972f with SMTP id
 r7-20020a4a3707000000b005257096972fmr14921286oor.9.1680299180843; 
 Fri, 31 Mar 2023 14:46:20 -0700 (PDT)
X-Google-Smtp-Source: AK7set/bskbV6geSFXft4u62uYE9fQAbErIyvbDf9O3zDwGhoSREhWl8Q4OqItd4FnDju7pVl4zrzA==
X-Received: by 2002:a4a:3707:0:b0:525:7096:972f with SMTP id
 r7-20020a4a3707000000b005257096972fmr14921245oor.9.1680299180588; 
 Fri, 31 Mar 2023 14:46:20 -0700 (PDT)
Received: from halaney-x13s.attlocal.net
 (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
 by smtp.gmail.com with ESMTPSA id
 x80-20020a4a4153000000b0053d9be4be68sm1328531ooa.19.2023.03.31.14.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 14:46:20 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 31 Mar 2023 16:45:40 -0500
Message-Id: <20230331214549.756660-4-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331214549.756660-1-ahalaney@redhat.com>
References: <20230331214549.756660-1-ahalaney@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: mturquette@baylibre.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-stm32@st-md-mailman.stormreply.com, tee.min.tan@linux.intel.com,
 samuel@sholland.org, linux@armlinux.org.uk, jernej.skrabec@gmail.com,
 veekhee@apple.com, wens@csie.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org,
 Andrew Halaney <ahalaney@redhat.com>, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, echanude@redhat.com,
 konrad.dybcio@linaro.org, vkoul@kernel.org, hisunil@quicinc.com,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: [Linux-stm32] [PATCH net-next v3 03/12] dt-bindings: net: qcom,
	ethqos: Convert bindings to yaml
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

From: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Convert Qualcomm ETHQOS Ethernet devicetree binding to YAML.
In doing so add a new property for iommus since newer platforms support
using one, and without such make dtbs_check fails on them.

While at it, also update the MAINTAINERS file to point to the yaml
version of the bindings.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
[halaney: Remove duplicated properties, add MAINTAINERS and iommus]
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v2:
    * Add Krzysztof's Reviewed-by tag

Changes since v1:
    * Drop redundant wording in binding description (Krzysztof)
    * Document iommus addition explicitly in commit message (Krzysztof)

 .../devicetree/bindings/net/qcom,ethqos.txt   |  66 -----------
 .../devicetree/bindings/net/qcom,ethqos.yaml  | 110 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 111 insertions(+), 67 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/qcom,ethqos.txt
 create mode 100644 Documentation/devicetree/bindings/net/qcom,ethqos.yaml

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.txt b/Documentation/devicetree/bindings/net/qcom,ethqos.txt
deleted file mode 100644
index 1f5746849a71..000000000000
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.txt
+++ /dev/null
@@ -1,66 +0,0 @@
-Qualcomm Ethernet ETHQOS device
-
-This documents dwmmac based ethernet device which supports Gigabit
-ethernet for version v2.3.0 onwards.
-
-This device has following properties:
-
-Required properties:
-
-- compatible: Should be one of:
-		"qcom,qcs404-ethqos"
-		"qcom,sm8150-ethqos"
-
-- reg: Address and length of the register set for the device
-
-- reg-names: Should contain register names "stmmaceth", "rgmii"
-
-- clocks: Should contain phandle to clocks
-
-- clock-names: Should contain clock names "stmmaceth", "pclk",
-		"ptp_ref", "rgmii"
-
-- interrupts: Should contain phandle to interrupts
-
-- interrupt-names: Should contain interrupt names "macirq", "eth_lpi"
-
-Rest of the properties are defined in stmmac.txt file in same directory
-
-
-Example:
-
-ethernet: ethernet@7a80000 {
-	compatible = "qcom,qcs404-ethqos";
-	reg = <0x07a80000 0x10000>,
-		<0x07a96000 0x100>;
-	reg-names = "stmmaceth", "rgmii";
-	clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii";
-	clocks = <&gcc GCC_ETH_AXI_CLK>,
-		<&gcc GCC_ETH_SLAVE_AHB_CLK>,
-		<&gcc GCC_ETH_PTP_CLK>,
-		<&gcc GCC_ETH_RGMII_CLK>;
-	interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-names = "macirq", "eth_lpi";
-	snps,reset-gpio = <&tlmm 60 GPIO_ACTIVE_LOW>;
-	snps,reset-active-low;
-
-	snps,txpbl = <8>;
-	snps,rxpbl = <2>;
-	snps,aal;
-	snps,tso;
-
-	phy-handle = <&phy1>;
-	phy-mode = "rgmii";
-
-	mdio {
-		#address-cells = <0x1>;
-		#size-cells = <0x0>;
-		compatible = "snps,dwmac-mdio";
-		phy1: phy@4 {
-			device_type = "ethernet-phy";
-			reg = <0x4>;
-		};
-	};
-
-};
diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
new file mode 100644
index 000000000000..88234a2010b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Ethernet ETHQOS device
+
+maintainers:
+  - Bhupesh Sharma <bhupesh.sharma@linaro.org>
+
+description:
+  dwmmac based Qualcomm ethernet devices which support Gigabit
+  ethernet (version v2.3.0 and onwards).
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    enum:
+      - qcom,qcs404-ethqos
+      - qcom,sm8150-ethqos
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: stmmaceth
+      - const: rgmii
+
+  interrupts:
+    items:
+      - description: Combined signal for various interrupt events
+      - description: The interrupt that occurs when Rx exits the LPI state
+
+  interrupt-names:
+    items:
+      - const: macirq
+      - const: eth_lpi
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: pclk
+      - const: ptp_ref
+      - const: rgmii
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - reg-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-qcs404.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    ethernet: ethernet@7a80000 {
+      compatible = "qcom,qcs404-ethqos";
+      reg = <0x07a80000 0x10000>,
+            <0x07a96000 0x100>;
+      reg-names = "stmmaceth", "rgmii";
+      clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii";
+      clocks = <&gcc GCC_ETH_AXI_CLK>,
+               <&gcc GCC_ETH_SLAVE_AHB_CLK>,
+               <&gcc GCC_ETH_PTP_CLK>,
+               <&gcc GCC_ETH_RGMII_CLK>;
+      interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "macirq", "eth_lpi";
+
+      rx-fifo-depth = <4096>;
+      tx-fifo-depth = <4096>;
+
+      snps,tso;
+      snps,reset-gpio = <&tlmm 60 GPIO_ACTIVE_LOW>;
+      snps,reset-active-low;
+      snps,reset-delays-us = <0 10000 10000>;
+
+      pinctrl-names = "default";
+      pinctrl-0 = <&ethernet_defaults>;
+
+      phy-handle = <&phy1>;
+      phy-mode = "rgmii";
+      mdio {
+        #address-cells = <0x1>;
+        #size-cells = <0x0>;
+
+        compatible = "snps,dwmac-mdio";
+        phy1: phy@4 {
+          compatible = "ethernet-phy-ieee802.3-c22";
+          device_type = "ethernet-phy";
+          reg = <0x4>;
+
+          #phy-cells = <0>;
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index dffcc253563b..d1cb4fa8b704 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17294,7 +17294,7 @@ M:	Vinod Koul <vkoul@kernel.org>
 R:	Bhupesh Sharma <bhupesh.sharma@linaro.org>
 L:	netdev@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/net/qcom,ethqos.txt
+F:	Documentation/devicetree/bindings/net/qcom,ethqos.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
 
 QUALCOMM FASTRPC DRIVER
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
