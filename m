Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B7F6DE53E
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Apr 2023 22:04:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE0DCC57B6A;
	Tue, 11 Apr 2023 20:04:48 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DD47C69065
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 20:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681243486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q3NnvVuLlL0DF9zj913pLjOYbeCyB2YctaCAm9deSc0=;
 b=f0c43zO5TkIJv6LoB7Q5CxLXnR90HFQKBft+QQWLVq2Ddo3CDncZexwEG7nmG59h+pXgef
 tQKEXnv7bEk5zOwKyRXaJcB4Ze9UIKuTST15zHO8uOACcNyVY9P4FEUk41Cc4TNE3SEe6+
 LbFVB4CqBSCr2aEkxgCdnBMoidM8OWg=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-zZYrWEkxM1-nPQQTHAuJyw-1; Tue, 11 Apr 2023 16:04:43 -0400
X-MC-Unique: zZYrWEkxM1-nPQQTHAuJyw-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-1842ab38ebcso5417664fac.19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 13:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681243482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q3NnvVuLlL0DF9zj913pLjOYbeCyB2YctaCAm9deSc0=;
 b=G+LMUgo5lwoVxLf4CVsSL1eahTn4ub6U9xwGQD6UHqGcdMKuKEV0NvbbyXy75cNwll
 A3G3cMg0btGV7O4YG0iOoG1Gnk7cBvN1PDwGb94g07HwZ/D2xHD32fsYYJkQ3qQ6QRJI
 ZCvVT+rMh94cAoSEFvRYaG8Qgql4SjAwdkugp0qck2T5oVN0MAdcfT2LP19ylq9/XNFR
 2LqwFpha7hMrplNR98auq5bNFpUVgFhqh7rDuIpkXbO1p6r+1BAYOVsBsioh1fIA6Ri8
 /IX8S5n+srjwd6FD+sZyOwetJUmyYNg5QhUCnUf1BaCj+AzrPZnLmrIeKhfGQKgg90zH
 UvXw==
X-Gm-Message-State: AAQBX9cqSH0ya3fr/vuKzMbLNJb+F66SgsmuHGi1C7fLG3w/9ltjaXWU
 bPK7CDxCkOz6VCCUXWCwMmA9VZYn5S2qizhu+xbt5ecnwvCZEMUwqpuHUQffdzF9w5s6vouuDyJ
 ekoxyeZi+IPs/qzTD61DXXzvr6tFwf/zeZ0+M051r
X-Received: by 2002:a05:6870:4686:b0:17e:13e9:1e4a with SMTP id
 a6-20020a056870468600b0017e13e91e4amr2694418oap.17.1681243482492; 
 Tue, 11 Apr 2023 13:04:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350aqs3TvzPHoWLog8KEU5yBrOpPGXVg7bre6Q6dsImqUB42LBUNfxcnWlWDkNolu+XbapjSJOQ==
X-Received: by 2002:a05:6870:4686:b0:17e:13e9:1e4a with SMTP id
 a6-20020a056870468600b0017e13e91e4amr2694402oap.17.1681243482242; 
 Tue, 11 Apr 2023 13:04:42 -0700 (PDT)
Received: from halaney-x13s.attlocal.net
 (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a056808149400b00387764759a3sm5868545oiw.24.2023.04.11.13.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 13:04:41 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 11 Apr 2023 15:04:00 -0500
Message-Id: <20230411200409.455355-4-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411200409.455355-1-ahalaney@redhat.com>
References: <20230411200409.455355-1-ahalaney@redhat.com>
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
Subject: [Linux-stm32] [PATCH net-next v4 03/12] dt-bindings: net: qcom,
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

Changes since v3:
    * None

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
index 0b19a3fb266c..fdcef63fa9a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17304,7 +17304,7 @@ M:	Vinod Koul <vkoul@kernel.org>
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
