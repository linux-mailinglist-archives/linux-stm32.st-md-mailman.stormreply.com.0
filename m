Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C73E26B7E4F
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 17:57:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90C04C65E60;
	Mon, 13 Mar 2023 16:57:38 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11224C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 16:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678726656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TPEAjXqtLe7sEldj4DCKu8ktiAl8IL0ME/tYH+iy+MU=;
 b=SO3rfhyctLuyM9NTiuvyfwwisulnW33M+AWEVq/p65oiG7yaN5oDMDogT2HqMaZVNY6jpR
 SE0onTjY2DtZdOCt0ERUM//gWQMTCeGORWW7zuXOrEBQ5ql0Bh387V/PFfX/Wb3yq3cBYI
 DHPOSh+ug5Klrxu0xKkD65V+Vwak8Mc=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-uKfHOInBOTmHteq2N23G-g-1; Mon, 13 Mar 2023 12:57:35 -0400
X-MC-Unique: uKfHOInBOTmHteq2N23G-g-1
Received: by mail-oi1-f197.google.com with SMTP id
 3-20020aca1003000000b003845588afd5so5588886oiq.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 09:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678726654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TPEAjXqtLe7sEldj4DCKu8ktiAl8IL0ME/tYH+iy+MU=;
 b=Otb1doLCJctE98E5jtfv2xavQubP43k1l8A1/SQmzWzIlCPaxDxhNRqdln/7SyHrB1
 PDNz+5obWmgE3a2NAIld5XKPzsqdQClUvYRdqKr4jP3sQcIO8ABOQIpZBC4sXcv/Yf3O
 zssPifgiyJts/5mCymH7D8ZSUQQxr0Nm6Trok4dsjE2O5Ilw44OnjuSR60WYIq3snAeB
 BGNJf1WHN6cyOjzQ39cHHSBjAk6aC2mxNcqwvsKA1YNf77HUQL12phmT47hnItozszGV
 AsCn2fqPFAcv2Vj+V85PlM15Iif/m4RX/sjq9+UJCIPlYofgRMTyn72aGVrvlRPwvO5k
 z1jA==
X-Gm-Message-State: AO0yUKXIN3FRWOJcjn3C0CP1kkTwi0ezJXCk4kljDIxKEi0Zu4tqa/5o
 G6Mn3tXq6ledyXz3r+R3CuevZ2DKU7YPyqlSkkAaZ0DjF88kDzp/D2bch+PldA8d2WVeMyl/Z08
 v4ebSCEYXgZaybMnAS9WyPLa4S/HrENQW3YrAJ9mX
X-Received: by 2002:a05:6870:d24d:b0:177:81bb:1b1b with SMTP id
 h13-20020a056870d24d00b0017781bb1b1bmr5506880oac.40.1678726654305; 
 Mon, 13 Mar 2023 09:57:34 -0700 (PDT)
X-Google-Smtp-Source: AK7set/OnnfD/msoWrWc/yqIcmuyqan6o9z6z9g8FpabKIa2nPkyJ/JNvjVlhM87MfqOEvTGU8827g==
X-Received: by 2002:a05:6870:d24d:b0:177:81bb:1b1b with SMTP id
 h13-20020a056870d24d00b0017781bb1b1bmr5506853oac.40.1678726654035; 
 Mon, 13 Mar 2023 09:57:34 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::21])
 by smtp.gmail.com with ESMTPSA id
 o2-20020acad702000000b00384d3003fa3sm3365273oig.26.2023.03.13.09.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 09:57:33 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 13 Mar 2023 11:56:12 -0500
Message-Id: <20230313165620.128463-4-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313165620.128463-1-ahalaney@redhat.com>
References: <20230313165620.128463-1-ahalaney@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-clk@vger.kernel.org, tee.min.tan@linux.intel.com, linux@armlinux.org.uk,
 veekhee@apple.com, hisunil@quicinc.com, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org,
 Andrew Halaney <ahalaney@redhat.com>, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, sboyd@kernel.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 agross@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: [Linux-stm32] [PATCH net-next 03/11] dt-bindings: net: qcom,
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

While at it, also update the MAINTAINERS file to point to the yaml
version of the bindings.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
[halaney: Remove duplicated snps,dwmac.yaml properties, add MAINTAINERS]
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

I picked this up from:
https://lore.kernel.org/netdev/20220929060405.2445745-4-bhupesh.sharma@linaro.org/

Changes since then include:
	* Change MAINTAINERS atomically with the filename change
	* Remove duplicated snps,dwmac.yaml properties

As listed on that thread, the issues Bhupesh saw were due to a bug in
dtschema that has since been fixed.

 .../devicetree/bindings/net/qcom,ethqos.txt   |  66 -----------
 .../devicetree/bindings/net/qcom,ethqos.yaml  | 112 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 113 insertions(+), 67 deletions(-)
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
index 000000000000..68ef43fb283d
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -0,0 +1,112 @@
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
+  This binding describes the dwmmac based Qualcomm ethernet devices which
+  support Gigabit ethernet (version v2.3.0 onwards).
+
+  So, this file documents platform glue layer for dwmmac stmmac based Qualcomm
+  ethernet devices.
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
index 8d5bc223f305..720ae2f1bf95 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17282,7 +17282,7 @@ M:	Vinod Koul <vkoul@kernel.org>
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
