Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB56B5107F
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 10:07:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B17E8C3FAD0;
	Wed, 10 Sep 2025 08:07:50 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76BE4C3FAD0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 08:07:49 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-45df7dc034cso3878365e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 01:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757491669; x=1758096469;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uY7tyXoLmxoMYiQ/WAWTMF4JkPWNBAVamog1AGlGOlk=;
 b=AyWbdFk5CEWNWteWAg7bjCQWTV3aSDxEJNgcvm5q//cxeKkzy+Rpo0g9v7Y0f7EnN7
 mAQ64iFigirxFM9jXs9gZ2hDH6wad81RynFphZ0DIZoF7w1+hv92+y6ZFA/UmvneO5wt
 VsQAFgbh6Pi/wiMxyQmW1yalEC3h1cYPTNGweIQjDldPLYO2anizepIow/V6htXNimLS
 T3F6sbrUeP5L09ENeyc/Zt2jxITPYKawVHMJs9DqAZnYNwzrN5LbL9PnJmmswZVwvUL2
 XB51C/eKIj78XdLC9DDt6e/bkVgdZCsNgszbBN7/ELYUBrkaEZTpLf/yq8sbH4mk35Le
 bBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757491669; x=1758096469;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uY7tyXoLmxoMYiQ/WAWTMF4JkPWNBAVamog1AGlGOlk=;
 b=hCZL+lIkmcjiPXJW3QsixUpcX7iBbvkD6vEdcDdYelZc5ea4keSIU8O5IjLISP3Gm8
 uhaFPgD684evTn2EDv58otWSCPb2+lhBjfUGCxpovi8xjg2SsqAE+PZkOo2Fr/eNQxSm
 UBVz1VJTsO3VhjJSb0hpXYlgiP1IOsQXwNP0VHLzYAxTAoi35+9OBTiqnyQsXUHEyFbM
 d9g7ENJYoaCpcLB9yurJMxDcFjY0zr9+XMgZ7PVqvTzt8NS8flt3mfXVnGvGm4Zp8aOZ
 37PIIJYDyvtbnNfN9Az1hvtu6eh/rJzo4eKkuk9/B4uwkaunKQqlEjDrfKqXD5ISmMAm
 sP2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY+pD5NJ4IkHaslDnJ/nOppO0+zQEBXxU3J+chApCpGCsbce5tMkAHQFn4bH5HBnuqw0j4K/Oz2eH9mQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwIfdQsrCYy3Y5FxJgQzYo1jF+rfdA/+X2hdo+Bl4gi7EBM/8Nt
 HYzPN0BHCnM13S/gMK7hp0whwNh9GTQXlf9/qIOrIlu94UbAnRHrmCVojNVJTQjYJYg=
X-Gm-Gg: ASbGncut5B8L0/auIaoyHASpKgKcHUwsHYx0bqRiaJmlqbEMPYjK7LUOX4E/J6M/oBD
 nNcnj5RWlXprcOrEcVYRLjSJisBaioi5SJOKFGt6s5E/dumz3JdgscFCtFVvjONp9XvPzxvDRet
 dxXiBYKmPIx0CvKqvm4hPEv7mVIih+xfpW/exWU6f2T5Xb0fu+8S6IrD2rlueDOXhJK/KvHVgge
 ItWN1WlMCL1t0If2carOnPL9tRPH5QiL/spbVy2OC/X1tie7X6f14P9jIoHhlnUHJmcIcao41qw
 FFHVtgrigzHTMaV6X0zkYyD5fDwVg4/yQpO9HKiFuQaeoQu32aeQSFT3Eqyw96GDEV5aXGvQOP9
 vHdVuoZMH8yksg5kp9BBJvLpbTN2f03g0jc5cUfI=
X-Google-Smtp-Source: AGHT+IFnNZEgNDzwo9ApEnobHwV8aAoxFw0Jkpaf4P9Rpvk6aHXizs1NLoPb9xG6C0xsESVPAcwBNQ==
X-Received: by 2002:a05:600c:3b23:b0:45d:d3f4:a640 with SMTP id
 5b1f17b1804b1-45ddde82751mr137637395e9.15.1757491668832; 
 Wed, 10 Sep 2025 01:07:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df8247cc6sm17813605e9.12.2025.09.10.01.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 01:07:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 10:07:39 +0200
MIME-Version: 1.0
Message-Id: <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
In-Reply-To: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4931;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=YiaOUOOI0GWV9ljzY4gBLMGGn2gS4PsTZMpw74epeYo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowTHM5rrhVBB6aGbLx1+QUka9GEHLBn1Bh6zAk
 6upsGPRnFWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMExzAAKCRARpy6gFHHX
 clb7EACr8mgXcJhgQAtdioBd+rpPreLM1NgdsdbVw1eRYaLBKd8D6Gvowzq+W+SOWk6p5nt42LT
 yHphk380KW+A8RxjYCIPTDF0aIgEqXkvdtxViXF4WMU5rXPnG7YAgYGkZmV7XkaOBfXvkt8jr+f
 JIRuGuyNcLxrBDfdE+3aHT30Z5ImO3a8GAd+d1TlQT5QQr+IH+RWSddXjYXVRHbnZpNDw6A58xc
 1rKH5ZhUrllwrmvfZ2tL2ySQJ2tr7t9lCwdOxEMLp7x8ceU7gyDZSMEbYHCCqhKT1CUrbX3cEQ7
 seg3SC2afuBtDvkQh32Jf6v3Re9tHnMjpyzZJJGoWKnKTZlFkBWphcwA2GozI+ebZE8kGRRMM47
 u6/gFnm3+i2pePRz2BGlXiErGT4soU0D/Cxykz7AN1/zIyYJrJhKqUkty4KDQdmhD1a8dU0BQTA
 5Z1htu1KKk31ys72gNFQV+RrBNke/CJDTVmAqI1iuBusokeSjFbI9TLna6rROjPIGQiCIoc60VC
 mV701Kemnb8TglYfSTSZIc9hFX5TCfNFi4mRxn9lma7RRwmQqIo6eCuNx3kSRcTiGo5hnqnIFYQ
 CLS6xFvNuIDwVOKEau13A1WLlFvA6s5WHJuXCP42XtIpc6DPAghOU8OtItJIo+kk4eQtt0/u7DA
 QWzLqY6L+dkuFdw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/9] dt-bindings: net: qcom: document the
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
 .../devicetree/bindings/net/snps,dwmac.yaml        |   4 +-
 MAINTAINERS                                        |   1 +
 3 files changed, 105 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d7d6c013311c2643d5ac0e2a75e0180911487d96
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
+  power-domains: true
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
+        phy-handle = <&sgmii_phy1>;
+        phy-mode = "2500base-x";
+
+        snps,mtl-rx-config = <&mtl_rx_setup1>;
+        snps,mtl-tx-config = <&mtl_tx_setup1>;
+        snps,ps-speed = <1000>;
+
+        power-domains = <&scmi8_pd 0>, <&scmi8_pd 1>, <&scmi8_dvfs 0>;
+        power-domain-names = "power_core", "power_mdio","perf_serdes";
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 4e3cbaa062290a6e8e5e60d0d01b0b39485c5478..07264c9c62778e9e8e2768999c5c377fce6811a1 100644
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
@@ -175,7 +176,7 @@ properties:
           - const: ahb
 
   power-domains:
-    maxItems: 1
+    maxItems: 3
 
   mac-mode:
     $ref: ethernet-controller.yaml#/properties/phy-connection-type
@@ -638,6 +639,7 @@ allOf:
                 - ingenic,x1830-mac
                 - ingenic,x2000-mac
                 - qcom,qcs404-ethqos
+                - qcom,sa8255p-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
                 - qcom,sm8150-ethqos
diff --git a/MAINTAINERS b/MAINTAINERS
index cd7ff55b5d321752ac44c91d2d7e74de28e08960..ab453e599a174e5414fc0c1baab5a64e0d88dd78 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20745,6 +20745,7 @@ M:	Vinod Koul <vkoul@kernel.org>
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
