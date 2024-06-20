Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D839102ED
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 13:35:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2725C78013;
	Thu, 20 Jun 2024 11:35:22 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 604BCC78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 11:35:22 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42179dafd6bso11903295e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 04:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718883322; x=1719488122;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5OVGzPb2T54n84UG0w5VuP9rB69Akm5GdGCvEoQqRbw=;
 b=X0o+Xn1ISBNV9O35Q95Mluq5gSnKrMvs/Uw4CBstrUaJTvSDYl7GoRQFQyO3rR/1Ri
 wZQda2P3BwsxdlTG5QCNZvL5csSPG9xYOusBmMYuE8JM5qP3HyCwjz3IaEnS7HJ8Vdn7
 TeEsQOUV55rC99IabgrIERQ+y7XHE6uEttIJHWe53UHiRDYLaI95HcCVP3JgT9euXbPk
 +1ench1BpCjLQrgnSLqMDGscw24MP+mVTcHMoiHG/11UVaM3vilE1XRoKKmIeXJxnPLH
 INl6U7mskcKBAWmBhkRc001mQoPamsihxoE5x7C0UuQP2iWDxpCsusrt9R1xChyGxPfR
 5z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718883322; x=1719488122;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5OVGzPb2T54n84UG0w5VuP9rB69Akm5GdGCvEoQqRbw=;
 b=I2b0DicVVJZKfaJJdyYtHnTeEe8OVBly2F0R3ULWJgbOixkvstFy4NJW2I+mLv44U/
 RM6yDywv48hUet03zyOxjSYKnl0RGvUIgsC1WFRxjOrdJaXxryLJDjlOsGJeiRGPgIvO
 4FZwyLX5xQLGhnNYIe5IFuCCWDgCpsOWBNMi37XTMu0obwmW7p/pnWso28ggtObG6dPz
 3gGCd2hoG7OMlo9rDIIvgLCv4I3TlneATx4k3O0CuSj1FT+vxn1N/7rDclk422SjOEM7
 XFSMpyJjm1vtYl/MGcGzHUccAELbffV4tne62K5Lz88TFcUSnzCJ0sL6epgtqVDwvtqe
 pTlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrJwSMdCzDQivCCU01FukAWx6FXgWzoe55O2TXuOM7Q1juGm47rcmG8jbPBGOzd/iT6IbnOSTWg1mwYHyZ/obuilOnwxY1qJUZu45Nzlgj4CRrcCj05SL0
X-Gm-Message-State: AOJu0YyjQvL7fUbGpxolJ2sF6N6lXlQMFPRHNTFK6V8S25v+pGTAbECw
 Fe2Q33Ugii4pldhsyFCyVe6/fDN4vQsNoEfJpjQy//IVlQusSDsQShXohv1aVaI=
X-Google-Smtp-Source: AGHT+IGxFgSbXX/tbvCY4mGSbhlg4H+ttH7NdxDQOym+VwY4bkIYH4LHOMqvrmeli2SSBzVJP4AtnQ==
X-Received: by 2002:adf:e390:0:b0:363:10cb:45aa with SMTP id
 ffacd0b85a97d-36310cb4a2bmr4364353f8f.24.1718883321788; 
 Thu, 20 Jun 2024 04:35:21 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42471e6623fsm49708985e9.1.2024.06.20.04.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 04:35:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 20 Jun 2024 13:34:55 +0200
MIME-Version: 1.0
Message-Id: <20240620-dt-bindings-i2c-clean-v1-7-3a1016a95f9d@linaro.org>
References: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
In-Reply-To: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Sergiu Moga <sergiu.moga@microchip.com>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, Doug Anderson <dianders@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 =?utf-8?q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Vignesh R <vigneshr@ti.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Chris Brandt <chris.brandt@renesas.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=17181;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Siv8V0Nn9CGvuerqMXS4Ni1veQBMZhGjgdRiTq9SAcI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmdBPk9TIvT+9cZ5d6+FmrQL9vylEc0MTi9y+R/
 nOtpbNnVe6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnQT5AAKCRDBN2bmhouD
 17mGEACY4RKry1pseeS4ML12cXws80LBFCHL5d8/gLPNJu+F4cVyo7J5Z+yGZxAI9wHRyMbfMH5
 W5Nc7stR8JZRBmCSra/leQ1H81s2gpV6k6Ojy9rVVEd3tUVdjJOsWjKJ3lPDGdXUdeJB63W0Qt5
 WdGboQfP2LA54HOed/vs3I62s5Bdijty6fK1fKlssB0uU1yLN4jlH8+rXeKXqcnjaEKKsxvjFIr
 uVqaus67/o3GfbClC3W/MOSrNLYsw1+YPZTUK6QHVMut4ARoxGutvx5Ooa/eZbWgb+GYKQx3UQC
 wcqGrhxTx7Ej3mLdJAi8LDPXdp67mczAisBVfTAA5FigxVg0tZAJKAZfBxLoWTpeSZ3VWCwyfKf
 Xp5Pz4Xvmk8anIX7us7t5XmBwSgrOOnRvISUA6/5zvGqgEWDTuAmeHlNQB/Fwy3HrUBQmlOWP/7
 UhqdQgvqvF1hH8OuGsarR6cQDTIPJVYVho6Z/PCfqJrRkDLm51onsy4nDJSiz8EFcn9l4DHSB0p
 RbyuG98o3Qc/0upUB5hhR1q6JdabMZd7aMqVU2dZFQv+8fypq/jI/+7Jmo2JysR3Wai6WWPQuwt
 woWnqF8iBWjS3WNCgD9beHrB5l+Ky/kZl6ZiygkepP8rzbBis1TDDdN6vzSJm9DAOYAmcfpN/WF
 RbsmREMkRXuYAJw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 7/7] dt-bindings: i2c: adjust indentation in
 DTS example to coding style
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

Bindings coding style expects 2- or 4-space indentation in the DTS
example.  Correct files having something odd (6- or 8-space) to 4-space
while re-ordering few properties according to DTS coding style (the
first property should be compatible, then reg/ranges).  No functional
impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/i2c/brcm,brcmstb-i2c.yaml  |  28 +++---
 .../devicetree/bindings/i2c/i2c-demux-pinctrl.yaml | 106 ++++++++++-----------
 .../devicetree/bindings/i2c/renesas,iic-emev2.yaml |  14 +--
 .../devicetree/bindings/i2c/renesas,rcar-i2c.yaml  |  20 ++--
 .../devicetree/bindings/i2c/renesas,riic.yaml      |  34 +++----
 .../bindings/i2c/renesas,rmobile-iic.yaml          |  24 ++---
 .../devicetree/bindings/i2c/st,stm32-i2c.yaml      |  66 ++++++-------
 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml      |  12 +--
 8 files changed, 152 insertions(+), 152 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/brcm,brcmstb-i2c.yaml b/Documentation/devicetree/bindings/i2c/brcm,brcmstb-i2c.yaml
index 7070c04469ed..ac9ddf228c82 100644
--- a/Documentation/devicetree/bindings/i2c/brcm,brcmstb-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/brcm,brcmstb-i2c.yaml
@@ -76,21 +76,21 @@ else:
 
 examples:
   - |
-      bsca: i2c@f0406200 {
-          clock-frequency = <390000>;
-          compatible = "brcm,brcmstb-i2c";
-          interrupt-parent = <&irq0_intc>;
-          reg = <0xf0406200 0x58>;
-          interrupts = <0x18>;
-          interrupt-names = "upg_bsca";
-      };
+    bsca: i2c@f0406200 {
+        compatible = "brcm,brcmstb-i2c";
+        reg = <0xf0406200 0x58>;
+        clock-frequency = <390000>;
+        interrupt-parent = <&irq0_intc>;
+        interrupts = <0x18>;
+        interrupt-names = "upg_bsca";
+    };
 
   - |
-      ddc0: i2c@7ef04500 {
-          compatible = "brcm,bcm2711-hdmi-i2c";
-          reg = <0x7ef04500 0x100>, <0x7ef00b00 0x300>;
-          reg-names = "bsc", "auto-i2c";
-          clock-frequency = <390000>;
-      };
+    ddc0: i2c@7ef04500 {
+        compatible = "brcm,bcm2711-hdmi-i2c";
+        reg = <0x7ef04500 0x100>, <0x7ef00b00 0x300>;
+        reg-names = "bsc", "auto-i2c";
+        clock-frequency = <390000>;
+    };
 
 ...
diff --git a/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml b/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml
index b813f6d4810c..1eaf00b90a77 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml
@@ -109,65 +109,65 @@ examples:
     // Example for a bus to be demuxed.  It contains various I2C clients for
     // HDMI, so the bus is named "i2c-hdmi":
     i2chdmi: i2c-mux3 {
-            compatible = "i2c-demux-pinctrl";
-            i2c-parent = <&iic2>, <&i2c2>, <&gpioi2c2>;
-            i2c-bus-name = "i2c-hdmi";
-            #address-cells = <1>;
-            #size-cells = <0>;
+        compatible = "i2c-demux-pinctrl";
+        i2c-parent = <&iic2>, <&i2c2>, <&gpioi2c2>;
+        i2c-bus-name = "i2c-hdmi";
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-            ak4643: codec@12 {
-                    compatible = "asahi-kasei,ak4643";
-                    #sound-dai-cells = <0>;
-                    reg = <0x12>;
+        ak4643: codec@12 {
+            compatible = "asahi-kasei,ak4643";
+            #sound-dai-cells = <0>;
+            reg = <0x12>;
+        };
+
+        composite-in@20 {
+            compatible = "adi,adv7180";
+            reg = <0x20>;
+
+            port {
+                adv7180: endpoint {
+                    bus-width = <8>;
+                    remote-endpoint = <&vin1ep0>;
+                };
             };
+        };
 
-            composite-in@20 {
-                    compatible = "adi,adv7180";
-                    reg = <0x20>;
+        hdmi@39 {
+            compatible = "adi,adv7511w";
+            reg = <0x39>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+            clocks = <&cec_clock>;
+            clock-names = "cec";
 
-                    port {
-                            adv7180: endpoint {
-                                    bus-width = <8>;
-                                    remote-endpoint = <&vin1ep0>;
-                            };
+            avdd-supply = <&fixedregulator1v8>;
+            dvdd-supply = <&fixedregulator1v8>;
+            pvdd-supply = <&fixedregulator1v8>;
+            dvdd-3v-supply = <&fixedregulator3v3>;
+            bgvdd-supply = <&fixedregulator1v8>;
+
+            adi,input-depth = <8>;
+            adi,input-colorspace = "rgb";
+            adi,input-clock = "1x";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    adv7511_in: endpoint {
+                        remote-endpoint = <&lvds0_out>;
                     };
-            };
+                };
 
-            hdmi@39 {
-                    compatible = "adi,adv7511w";
-                    reg = <0x39>;
-                    interrupt-parent = <&gpio1>;
-                    interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
-                    clocks = <&cec_clock>;
-                    clock-names = "cec";
-
-                    avdd-supply = <&fixedregulator1v8>;
-                    dvdd-supply = <&fixedregulator1v8>;
-                    pvdd-supply = <&fixedregulator1v8>;
-                    dvdd-3v-supply = <&fixedregulator3v3>;
-                    bgvdd-supply = <&fixedregulator1v8>;
-
-                    adi,input-depth = <8>;
-                    adi,input-colorspace = "rgb";
-                    adi,input-clock = "1x";
-
-                    ports {
-                            #address-cells = <1>;
-                            #size-cells = <0>;
-
-                            port@0 {
-                                    reg = <0>;
-                                    adv7511_in: endpoint {
-                                            remote-endpoint = <&lvds0_out>;
-                                    };
-                            };
-
-                            port@1 {
-                                    reg = <1>;
-                                    adv7511_out: endpoint {
-                                            remote-endpoint = <&hdmi_con_out>;
-                                    };
-                            };
+                port@1 {
+                    reg = <1>;
+                    adv7511_out: endpoint {
+                        remote-endpoint = <&hdmi_con_out>;
                     };
+                };
             };
+        };
     };
diff --git a/Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml b/Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml
index 17c1102562be..551cfa6f885a 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml
@@ -44,11 +44,11 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     iic0: i2c@e0070000 {
-            #address-cells = <1>;
-            #size-cells = <0>;
-            compatible = "renesas,iic-emev2";
-            reg = <0xe0070000 0x28>;
-            interrupts = <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
-            clocks = <&iic0_sclk>;
-            clock-names = "sclk";
+        compatible = "renesas,iic-emev2";
+        reg = <0xe0070000 0x28>;
+        interrupts = <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&iic0_sclk>;
+        clock-names = "sclk";
+        #address-cells = <1>;
+        #size-cells = <0>;
     };
diff --git a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
index 51b220da461b..6cc60c3f61cd 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
@@ -153,14 +153,14 @@ examples:
     #include <dt-bindings/power/r8a7791-sysc.h>
 
     i2c0: i2c@e6508000 {
-            #address-cells = <1>;
-            #size-cells = <0>;
-            compatible = "renesas,i2c-r8a7791", "renesas,rcar-gen2-i2c";
-            reg = <0xe6508000 0x40>;
-            interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
-            clock-frequency = <400000>;
-            clocks = <&cpg CPG_MOD 931>;
-            power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
-            resets = <&cpg 931>;
-            i2c-scl-internal-delay-ns = <6>;
+        compatible = "renesas,i2c-r8a7791", "renesas,rcar-gen2-i2c";
+        reg = <0xe6508000 0x40>;
+        interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
+        clock-frequency = <400000>;
+        clocks = <&cpg CPG_MOD 931>;
+        power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
+        resets = <&cpg 931>;
+        i2c-scl-internal-delay-ns = <6>;
+        #address-cells = <1>;
+        #size-cells = <0>;
     };
diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index 91ecf17b7a81..7993fe463c4c 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -97,21 +97,21 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     i2c0: i2c@fcfee000 {
-            compatible = "renesas,riic-r7s72100", "renesas,riic-rz";
-            reg = <0xfcfee000 0x44>;
-            interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 158 IRQ_TYPE_EDGE_RISING>,
-                         <GIC_SPI 159 IRQ_TYPE_EDGE_RISING>,
-                         <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
-            interrupt-names = "tei", "ri", "ti", "spi", "sti", "naki", "ali",
-                              "tmoi";
-            clocks = <&mstp9_clks R7S72100_CLK_I2C0>;
-            clock-frequency = <100000>;
-            power-domains = <&cpg_clocks>;
-            #address-cells = <1>;
-            #size-cells = <0>;
+        compatible = "renesas,riic-r7s72100", "renesas,riic-rz";
+        reg = <0xfcfee000 0x44>;
+        interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 158 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 159 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "tei", "ri", "ti", "spi", "sti", "naki", "ali",
+                          "tmoi";
+        clocks = <&mstp9_clks R7S72100_CLK_I2C0>;
+        clock-frequency = <100000>;
+        power-domains = <&cpg_clocks>;
+        #address-cells = <1>;
+        #size-cells = <0>;
     };
diff --git a/Documentation/devicetree/bindings/i2c/renesas,rmobile-iic.yaml b/Documentation/devicetree/bindings/i2c/renesas,rmobile-iic.yaml
index 04e4ffd80bc0..ec5222a1224f 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,rmobile-iic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,rmobile-iic.yaml
@@ -134,16 +134,16 @@ examples:
     #include <dt-bindings/power/r8a7790-sysc.h>
 
     iic0: i2c@e6500000 {
-            compatible = "renesas,iic-r8a7790", "renesas,rcar-gen2-iic",
-                         "renesas,rmobile-iic";
-            reg = <0xe6500000 0x425>;
-            interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&cpg CPG_MOD 318>;
-            clock-frequency = <400000>;
-            dmas = <&dmac0 0x61>, <&dmac0 0x62>, <&dmac1 0x61>, <&dmac1 0x62>;
-            dma-names = "tx", "rx", "tx", "rx";
-            power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
-            resets = <&cpg 318>;
-            #address-cells = <1>;
-            #size-cells = <0>;
+        compatible = "renesas,iic-r8a7790", "renesas,rcar-gen2-iic",
+                     "renesas,rmobile-iic";
+        reg = <0xe6500000 0x425>;
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 318>;
+        clock-frequency = <400000>;
+        dmas = <&dmac0 0x61>, <&dmac0 0x62>, <&dmac1 0x61>, <&dmac1 0x62>;
+        dma-names = "tx", "rx", "tx", "rx";
+        power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+        resets = <&cpg 318>;
+        #address-cells = <1>;
+        #size-cells = <0>;
     };
diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index 8fd8be76875e..457bb0702ed9 100644
--- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
@@ -145,31 +145,31 @@ examples:
     #include <dt-bindings/mfd/stm32f7-rcc.h>
     #include <dt-bindings/clock/stm32fx-clock.h>
     //Example 1 (with st,stm32f4-i2c compatible)
-      i2c@40005400 {
-          compatible = "st,stm32f4-i2c";
-          #address-cells = <1>;
-          #size-cells = <0>;
-          reg = <0x40005400 0x400>;
-          interrupts = <31>,
-                       <32>;
-          resets = <&rcc 277>;
-          clocks = <&rcc 0 149>;
-      };
+    i2c@40005400 {
+        compatible = "st,stm32f4-i2c";
+        reg = <0x40005400 0x400>;
+        interrupts = <31>,
+                     <32>;
+        resets = <&rcc 277>;
+        clocks = <&rcc 0 149>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
 
   - |
     #include <dt-bindings/mfd/stm32f7-rcc.h>
     #include <dt-bindings/clock/stm32fx-clock.h>
     //Example 2 (with st,stm32f7-i2c compatible)
-      i2c@40005800 {
-          compatible = "st,stm32f7-i2c";
-          #address-cells = <1>;
-          #size-cells = <0>;
-          reg = <0x40005800 0x400>;
-          interrupts = <31>,
-                       <32>;
-          resets = <&rcc STM32F7_APB1_RESET(I2C1)>;
-          clocks = <&rcc 1 CLK_I2C1>;
-      };
+    i2c@40005800 {
+        compatible = "st,stm32f7-i2c";
+        reg = <0x40005800 0x400>;
+        interrupts = <31>,
+                     <32>;
+        resets = <&rcc STM32F7_APB1_RESET(I2C1)>;
+        clocks = <&rcc 1 CLK_I2C1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
 
   - |
     #include <dt-bindings/mfd/stm32f7-rcc.h>
@@ -178,16 +178,16 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/stm32mp1-clks.h>
     #include <dt-bindings/reset/stm32mp1-resets.h>
-      i2c@40013000 {
-          compatible = "st,stm32mp15-i2c";
-          #address-cells = <1>;
-          #size-cells = <0>;
-          reg = <0x40013000 0x400>;
-          interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
-                       <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
-          clocks = <&rcc I2C2_K>;
-          resets = <&rcc I2C2_R>;
-          i2c-scl-rising-time-ns = <185>;
-          i2c-scl-falling-time-ns = <20>;
-          st,syscfg-fmp = <&syscfg 0x4 0x2>;
-      };
+    i2c@40013000 {
+        compatible = "st,stm32mp15-i2c";
+        reg = <0x40013000 0x400>;
+        interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&rcc I2C2_K>;
+        resets = <&rcc I2C2_R>;
+        i2c-scl-rising-time-ns = <185>;
+        i2c-scl-falling-time-ns = <20>;
+        st,syscfg-fmp = <&syscfg 0x4 0x2>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
index c9d1030e9857..8c2e35fabf5b 100644
--- a/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
@@ -82,9 +82,9 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     main_i2c0: i2c@2000000 {
-            compatible = "ti,j721e-i2c", "ti,omap4-i2c";
-            reg = <0x2000000 0x100>;
-            interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
-            #address-cells = <1>;
-            #size-cells = <0>;
-         };
+        compatible = "ti,j721e-i2c", "ti,omap4-i2c";
+        reg = <0x2000000 0x100>;
+        interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
