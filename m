Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B27BC3C70
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Oct 2025 10:18:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D3D0C2902A;
	Wed,  8 Oct 2025 08:18:04 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35E60C28770
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Oct 2025 08:18:03 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3ee1221ceaaso5351090f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Oct 2025 01:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759911483; x=1760516283;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GBlQSSiEamv+oYM2If/aD+aYUWLw42K0i3enm5+zupw=;
 b=w15wZhLPasAZBoSrCqMUIIyooRsOcfsjaAF0iolkPhjxMuQLd6ZktYT2xB/8Xa8jkC
 1niujVnF2Wlti8tTT5sIvc9lht+ENf9PGS8xSnCTphphVYGm6TUkc5AbCS2euQ/vJGSq
 xFMnTPHpHtbckYX7OGMebHgOcK+vKbkv1bDYXZFHYu/9vIERhEHnyrUmQ9qI41n5kLwd
 78I1W9mq+eTAvMDgm8o6mn4UbWYRoBlNYzcJOnGl69P4kQna0Ll863qaPhRpRCd8NAxj
 aZX5hsWQQXg7U2tE8LL834QACqJEpYz/ZlCZ2gf7NU11vK18Sbcj7jr4WFjm4Gf8usy9
 KB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759911483; x=1760516283;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GBlQSSiEamv+oYM2If/aD+aYUWLw42K0i3enm5+zupw=;
 b=uIMdscJM299xyZPVSZiVpTr0xlI2nTVaJhehtDaQh4PRxBYuDY3apOvfUL2d0b0L/r
 QZACkZcRpcGHOfT2zoJdG3t/udyHl81G4nwKIYXivc2nBT/zyPG4VpQ2ZbpwSk79wO7w
 jwm6PLQKbDTEeDCUlQYv3NyYi5LoBg0on1sP8i1mZGxF5XcsBjVn4kkIm2rpp1oaa6Ya
 fkECp2/yRrE/0+Uhp3HL/zEPJ6h/JWgsK9S9dcdT6czV1DpIcQoKyAuJAhNNLnkHQvZB
 7FDnECvG+BYW9WPNL7FF16N9OFUrTJopf+p4Pg7EJ5u9TMJ80vrFQEH4Z/Pb6LUFWu2j
 L2qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1/yNLT0AHKKTDp36pF73oL7ltsOTtEvkC4EtHG9PibkA5Oj2qn6Y2FdGLGNlNA2tPRaqJ9l5TpT0SAg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxflg6mxNgql6Cwjw6fLPy9Qd2RG3vv8rsELp3IAUvQD5kjETA+
 ySdmRLfEQwLwKctjfJnfb8BzgxcH7bXDtZWd4U43w7GONLBE4yQxNnFRb4m83F7ARWg=
X-Gm-Gg: ASbGnctM8nb4sR1jmEt52eBKKM+j0mlNMn523X/oWMtbLHPWc77nR//ans+9WpF+2Nj
 gTYEFmq7fjqSaVw8uFi0D+/k9a07ADGMFB9E4T1w1K8IEeDeCbvaIssA05bz143403Pu+8J7D+X
 J1WiN+u7MH6ujJk0gODAoyPwxMuGAQeXSp3gNAZUAGvnwXtmPpRA3PmbOOkq90U47vzRV3Bd/dT
 K/lu8d0YtkfISMsZFKZHFsL9CS375Nlbi6aMGBJPEs3Pj8fK4ey/4qLkQGvE+KLM1V9V6A2ABLW
 AX/URwhXkBGEGd8nzkjUsfW2NS4P7+5eHJtSEWYHayCZTE4TF37Qb8fCdz5aAuypcDoHk0+Q2kY
 T3Ni9i9eESrTdsc65agDea+TVT7V1u8/RA8+hF0AF6MBDB1pk5+DO
X-Google-Smtp-Source: AGHT+IHFjiAXaEAX/qwdcuEj85ehmkltNO/B2fGV2gAeQQvqe2timCfHbDTdR4nqHfSt59VV8hUwRg==
X-Received: by 2002:a5d:5c8a:0:b0:415:7a6c:6a38 with SMTP id
 ffacd0b85a97d-4266e8e6ebemr1270056f8f.59.1759911482606; 
 Wed, 08 Oct 2025 01:18:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:286d:ff1d:8b7c:4328])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e97f0sm28498943f8f.27.2025.10.08.01.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 01:18:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 08 Oct 2025 10:17:48 +0200
MIME-Version: 1.0
Message-Id: <20251008-qcom-sa8255p-emac-v2-1-92bc29309fce@linaro.org>
References: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
In-Reply-To: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4930;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=jt98/fKCMiWsJRKIBoUPImv7pfYjdVSMRpukpIdLRi0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo5h41r2ZAFmiwUn7PgIvcsf9/Ki1be/TmFs6ex
 u9nsqOD39GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOYeNQAKCRARpy6gFHHX
 cmLzEADDqXLdT+V7DmBbV2ZHe6RevBtvs/WskQguIekDpkpNMLSZUe9utgX4MAErix3Em600Fzb
 Tkj9Kqh+36Bc1FRGcZdRxZe73pOJpCGuCmG/KRJF5tLYIJyahyZC1508jX2v7hNmyGf6mo9E82N
 6/NDjG6ER2cU5IYtRDXLCbZHCxLJ55/QETUEBaEDppvVeYw2fuHPkXI72YN/rEZXDH/H/53yqlE
 2S1DabEok5qR3ZriVTUgPrb1A5F/Mwl/cSXsC0Z08RNG1kLKgKnOEkyJiGDQGXMI2KaBS0hKwCY
 cU9b7DMtbM0N9iWaFSPSjx0dTPcnmYvibwW7lvnhzDdeIEt3KHnD7PBgr2dOxUIJ1HGKarNYk01
 /70LZu4CmKqAZCP7cmP1mOA3lQWM9bMoQRQfcHyRrCIwb9NapxwyzZhqFtFnljzzrfoIUkLVR/b
 buL4wdvPvzHXXcsESe+jKltN0EA5k9iEWoeyMoeh5G+6BulF9UXbnw0k0s+8nFI6SeaEHCTdswK
 fP+l7j4Y1xw8Eg8ytjO4p30MMZso6krN7sHCC3JpUbVn83uAbqc+l53bbiyaEe0q1D2ZT/FxloU
 qX0NuHdAFujSg0cBE4rrb8p4H9I8Jbb7r8FKuj0nL1/bRE1uZkC3ZDexsMgQ1McQhE+YUNpAjUA
 n39CRzJaFaAqWnw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/8] dt-bindings: net: qcom: document the
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
index 0000000000000000000000000000000000000000..0a9cc789085e8bc94d44adc9da982b66071d1e79
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
+      - const: power_core
+      - const: power_mdio
+      - const: perf_serdes
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
+        power-domain-names = "power_core", "power_mdio","perf_serdes";
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 658c004e6a5c836bcc1dca109a251e27af6e23ca..5ef5c28d0337050268e76cdd787b4cd6de7fb0e2 100644
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
@@ -176,7 +177,8 @@ properties:
           - const: ahb
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   mac-mode:
     $ref: ethernet-controller.yaml#/properties/phy-connection-type
@@ -639,6 +641,7 @@ allOf:
                 - ingenic,x1830-mac
                 - ingenic,x2000-mac
                 - qcom,qcs404-ethqos
+                - qcom,sa8255p-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
                 - qcom,sm8150-ethqos
diff --git a/MAINTAINERS b/MAINTAINERS
index 3773c74b31d6d9d4c2f9ba53c4b3ecf3e4e2dd79..cb097a1369d08e708152a3a41b610b35273cebea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21096,6 +21096,7 @@ M:	Vinod Koul <vkoul@kernel.org>
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
