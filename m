Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2604BC0F057
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 16:45:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA6AAC60489;
	Mon, 27 Oct 2025 15:45:05 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D9CBC60488
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 15:45:04 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-47112a73785so30945395e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 08:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761579904; x=1762184704;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2OlAwR0Ez2lmPLsYc3tLDTQTUPw8dFRTu8oJtM9uyYA=;
 b=zZqwgshD/i+QWHiKdyBajqS+73bmPsFU9tVo+i7gcdd27AsW3hss4T5hchhOTGsf7k
 IInOb3mP52oWEe+KNaocP7OUfLCzDCpKI8gN6UQi/lEiHZVAcgeUsO784uNC5luPn9Sq
 PsPceSh2KvsuldWOjzG+VxTq5i0Y5F1wUDySDJIQjNOyXUzQze//R3fXyz1y2pM7Me3H
 gUlAM1bFMsUkOy8vydEkj0wy4pKFNJuhY1+DIhDGMQ45TjbPDDjLQ1yrIWRE4SP/3d9v
 svHu78AB7mYmHw+igc0TjIeDevS0Oa++euGKsOFmTuslG4EHN4h7oiaUEV7kYTt4skoT
 R8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761579904; x=1762184704;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2OlAwR0Ez2lmPLsYc3tLDTQTUPw8dFRTu8oJtM9uyYA=;
 b=w4IZSe7ihbN3cg0LJV8ceZUAXtYUdq7ZMYv/CKfq+sLiS/ruLOOi/FsFjg3MQ+5utB
 uG/6KigsJd7zX2MUFoCxYN0cX28Hiz9wM3OG9uNCuH27CNC/jorxT9nyQ7QYhr34X2QZ
 i91+/76S29RivwhDdPoX9akup9vA+lMimxi8Izli3+hikJk/if4o41pfZYWoTFl18htR
 NBnBWOeNHRzQ5T6i70PR1HnimRtCFS98DdhRz8+5cuQMOJR5hQvdLjav8qk7lg0B56OZ
 dfwqI3s/j5/KXBc/6KCbBtvpsMUepHus/VUTJTFnMm7orCCOyl9qniy88bW0Sga1jIzn
 HwNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV5JQ0J6/ctQG9i7gamm1oXNeu24MJdJzgkNzb3sQ1ziZmDIGdwMnzuo0fY//v4HPYExGR4m7TZpRt/w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwAmJ9m682REe5Ww/FNwwEQ0qExbVJr+pBO0TQnAhv+76cp5pg7
 UlogsyflavkaP6Z1e912r6xmVQrO1Cy9y6XJH9MSb5Iq5u5GhkqJnQuir2b2vZORjCU=
X-Gm-Gg: ASbGncuQ3c2UbiAwuO0yJpXOPu0gFeZweesNsOCnifkkrf9JbLguTrPEC+YXYD59vwu
 ijqtJGa7byGWHISSUvGvWVbDQM0Sw4kwc45vYBazG7akcfNCcbMvaV2OklFgn+BdyFgCh8Kt1SP
 qSnYsanF84iiCyaWQWnmjTvUSCipqP6h0RImnglNBnjqC8Oqq9+heb2lJw+sAoX9AJ01FzSjH1V
 WML4JwVVFwhmulHfxg672yjj7V4+GHmq8HQhvx68/vv1zTeFUwkCHkkx/RqECAzWQzB3h3kfltJ
 pNs8CsCibRJZRjPYS3NqjzBe6wR5trqLRV+X1jiqOQOksttw5PVCCEY7FlsBY3VI/Rm9XTcw7kU
 tkkjmFv1WbuFBHj5qOjJPtUYCABys2BPusgplgI6IgGJRMDQgDnYvAd5vKwmOChBCT6JAwIt4/P
 m9/CK7o8E4eiGOUsxs
X-Google-Smtp-Source: AGHT+IF3LUL3bfxhtdpuEv0pHPdlEkBGo06ytgVfCVUCGuaC1FOwUetTffXhS0o9uNVApIit+32qLA==
X-Received: by 2002:a05:600d:416d:b0:475:dcbb:76b0 with SMTP id
 5b1f17b1804b1-47717dfaa40mr966635e9.12.1761579903932; 
 Mon, 27 Oct 2025 08:45:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd477d0esm138708045e9.0.2025.10.27.08.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 08:45:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 Oct 2025 16:44:49 +0100
MIME-Version: 1.0
Message-Id: <20251027-qcom-sa8255p-emac-v3-1-75767b9230ab@linaro.org>
References: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
In-Reply-To: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4896;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OSzCwUgDD3l4L0pYJMm0DD9DnJ/KFBo24c29rgi8yQk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo/5N6lhNlND4rsq376wqaZULe50mt5NDwwtTRC
 AFI8PIWioaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaP+TegAKCRARpy6gFHHX
 cruND/9HOgu2X1rNis9f+h3vpeLQ56ytu76P+bQW61H4CEezr3VWwQLx8BRjR1WXEoMT+5TlQRs
 ipD2fBeg8mJEbLux1Ltn6ag6107Soa/wvshuCQLxGVql/6xlYoDxSEEptIPhKa87T5+cb9tkCFJ
 xnw7Y4Wmsi9CKCy0YmRXURj0Gp+5llGqF6v0GYFf47t0PMRU6EQaxv5WFe7nw1V2ZA3ObckRqO2
 /e6dA0pR8x+mdWoIX9kdjlHcXEtlIseWvd+t3xM1UhGQM6atPn6tzQTh3JYd0uYChSqoqqxEO7x
 HjKBGc8YG1yjalOGpowa/eVeCjdVXw5KoUwZIREYEGEEnj5n4UssoDUABQC/LnKNGkoFRnF+0Bm
 Gg+7o9dasJAxuLr1Me2URwCXqUmxY6MQaN7/FqJm32LzdDs4z25W8siYaIc6hgl+/He8Nc1NAqP
 54GzTigkE5CjoL26SEhe+fRWClFSMDXUQQaFEfPDzvo5ZqPXkxZ/i4Jzac7IElpTQ6ItiKflDXL
 uqL6938plMXE7AQDbQ6IiZG20RV8dFgp6lHN3fN6Ktz4SLWi1jNkPMeFP9MzpATft99M2HDcAII
 NJVxIgZOSCbNz6zOqA9UlgkJ1Xo4f018d/ZhkyJ2hY4Sd1Sdc+Vt13hMV3uJCsJCuSJOd8luOwo
 i45uTVSxobapSnQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 1/8] dt-bindings: net: qcom: document the
 ethqos device for SCMI-based systems
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Describe the firmware-managed variant of the QCom DesignWare MAC. As the
properties here differ a lot from the HLOS-managed variant, lets put it
in a separate file.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  | 101 +++++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 MAINTAINERS                                        |   1 +
 3 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b821299d7b30cdb802d9ee5d9fa17542b8334bd2
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/qcom,ethqos-scmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Ethernet ETHQOS device (firmware managed)
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Konrad Dybcio <konradybcio@kernel.org>
+  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+description:
+  dwmmac based Qualcomm ethernet devices which support Gigabit
+  ethernet (version v2.3.0 and onwards) with clocks, interconnects, etc.
+  managed by firmware
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    const: qcom,sa8255p-ethqos
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
+      - description: The interrupt that occurs when HW safety error triggered
+
+  interrupt-names:
+    items:
+      - const: macirq
+      - const: sfty
+
+  power-domains:
+    minItems: 3
+
+  power-domain-names:
+    items:
+      - const: core
+      - const: mdio
+      - const: serdes
+
+  iommus:
+    maxItems: 1
+
+  dma-coherent: true
+
+  phys: true
+
+  phy-names:
+    const: serdes
+
+required:
+  - compatible
+  - reg-names
+  - power-domains
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ethernet: ethernet@7a80000 {
+        compatible = "qcom,sa8255p-ethqos";
+        reg = <0x23040000 0x10000>,
+              <0x23056000 0x100>;
+        reg-names = "stmmaceth", "rgmii";
+
+        iommus = <&apps_smmu 0x120 0x7>;
+
+        interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq", "sfty";
+
+        dma-coherent;
+
+        snps,tso;
+        snps,pbl = <32>;
+        rx-fifo-depth = <16384>;
+        tx-fifo-depth = <16384>;
+
+        phy-handle = <&ethernet_phy>;
+        phy-mode = "2500base-x";
+
+        snps,mtl-rx-config = <&mtl_rx_setup1>;
+        snps,mtl-tx-config = <&mtl_tx_setup1>;
+
+        power-domains = <&scmi8_pd 0>, <&scmi8_pd 1>, <&scmi8_dvfs 0>;
+        power-domain-names = "core", "mdio","serdes";
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index dd3c72e8363e70d101ed2702e2ea3235ee38e2a0..312d1bbc2ad1051520355039f5587381cbd1e01c 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -71,6 +71,7 @@ properties:
         - loongson,ls7a-dwmac
         - nxp,s32g2-dwmac
         - qcom,qcs404-ethqos
+        - qcom,sa8255p-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
         - qcom,sm8150-ethqos
@@ -180,7 +181,8 @@ properties:
           - const: ahb
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   mac-mode:
     $ref: ethernet-controller.yaml#/properties/phy-connection-type
@@ -643,6 +645,7 @@ allOf:
                 - ingenic,x1830-mac
                 - ingenic,x2000-mac
                 - qcom,qcs404-ethqos
+                - qcom,sa8255p-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
                 - qcom,sm8150-ethqos
diff --git a/MAINTAINERS b/MAINTAINERS
index 252b06d4240cc2b67405b8a967055bd53dec7c8e..14c80fbad8b97cc5562555d2422c81724d42111d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21218,6 +21218,7 @@ M:	Vinod Koul <vkoul@kernel.org>
 L:	netdev@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
 F:	Documentation/devicetree/bindings/net/qcom,ethqos.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
 

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
