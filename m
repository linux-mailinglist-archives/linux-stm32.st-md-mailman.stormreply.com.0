Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B9D67932D
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 09:33:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3698CC6904B;
	Tue, 24 Jan 2023 08:33:57 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AE03C65E71
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 08:33:55 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so12276261wmb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 00:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b+nxm6AUQrdND9hhv0fMGvZp0eeAkpWlOdH7gphjJuI=;
 b=F5EtfmWAs7GPnYDrFQA3qmog15Uouc0N5eHuu9MQT8H2T6aDjEdcdx6q4XF1aYYbaJ
 rbwCf0tZscxlRycuE90c1IDIIYSkTVn6+h5a7tyAiGlxsWcdO0soiLhxFb8WtixiaCy2
 WhJ7z1uWeJG3cB8kdbcxsXHLILrdicAwZQwK3ABCRS3cgWDvH+Noz8yeqWEdjLT3Adfl
 xIoYzEWZLOmTO25Qa6Z52Pr2d0ZuTw6ENohjnwx1ee9VkWdrhhCjjUzkjdm+I3XLz0h2
 1aVovCbXImM9IRjLIsfp/mQTfRMevBV5hGf/qmeILQbAth9fbOj/6XP0FHJANAst6ttN
 Kmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b+nxm6AUQrdND9hhv0fMGvZp0eeAkpWlOdH7gphjJuI=;
 b=VDyYFw0JELFR8I0keIdmEZmMnQszB1mfnVEUw2EC9cpIr/LrsGomRB12tCtyjQhZ4V
 MAfkekyptNcYNxrpiRN29pGauvZJ5WBBTbKGZdQKWtgjuATeZjhhmh4PSG1qGr08Fjrj
 3yr17bW2HUsS/rhAsf07ftwudjk8o2FFVKY7sTLNecBnBWcTQAw77dMyXGwtFWy2rFdc
 Ya2MSAlPVBbl8Aqz6B76YH/XnmWGyen1BtVhQPVfGiw+1qN79t0sK/js9k2mawujTB3M
 pQ5FjtZh34ewI+hZX/OmxpIAJZoGqjbSFaHvkREpkOM65yJwVkMEL1LiXIZCNPCKEtph
 HEMg==
X-Gm-Message-State: AFqh2kqatbpkpNqoRHtea/vFUAPJktTU9XZevuKvRFDUeKvwiAPEeH8o
 JE6Y2K8hNoP1DYomnPxpwDty0w==
X-Google-Smtp-Source: AMrXdXva1GteWUvLjwso/FKOzr72v0f91fSczdeUW3DCTAHFGCcG58kJzxHtnlRqyRT3RNGgPZZBjg==
X-Received: by 2002:a1c:ed0a:0:b0:3d3:4a47:52e9 with SMTP id
 l10-20020a1ced0a000000b003d34a4752e9mr26816656wmh.15.1674549235084; 
 Tue, 24 Jan 2023 00:33:55 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 n34-20020a05600c182200b003da286f8332sm1319075wmp.18.2023.01.24.00.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 00:33:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Han Xu <han.xu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
 Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Li-hao Kuo <lhjeff911@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, =?UTF-8?q?=82ecki?= <rafal@milecki.pl>,
 Vaishnav Achath <vaishnav.a@ti.com>,
 Parshuram Thombare <pthombar@cadence.com>,
 Leilk Liu <leilk.liu@mediatek.com>, Gabor Juhos <juhosg@openwrt.org>,
 Bert Vermeulen <bert@biot.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Marek Vasut <marex@denx.de>, Birger Koblitz <mail@birger-koblitz.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Anson Huang <Anson.Huang@nxp.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Kuldeep Singh <singh.kuldeep87k@gmail.com>,
 Pragnesh Patel <pragnesh.patel@sifive.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Erwan Leray <erwan.leray@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Tue, 24 Jan 2023 09:33:42 +0100
Message-Id: <20230124083342.34869-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124083342.34869-1-krzysztof.kozlowski@linaro.org>
References: <20230124083342.34869-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v2 2/2] spi: dt-bindings: cleanup examples -
	indentation, lowercase hex
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

Cleanup examples:
 - use 4-space indentation (for cases when it is neither 4 not 2 space),
 - drop redundant blank lines,
 - use lowercase hex.

No functional impact except adjusting to preferred coding style.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
Reviewed-by: Andrew Jeffery <andrew@aj.id.au> # aspeed
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org> # meson

---

Changes since v1:
1. Adjust indentation in two more examples (cdns,qspi-nor, st,stm32-spi)
2. Add tags
---
 .../bindings/spi/amlogic,meson-gx-spicc.yaml  |  26 +--
 .../bindings/spi/amlogic,meson6-spifc.yaml    |  22 +--
 .../bindings/spi/aspeed,ast2600-fmc.yaml      |  24 +--
 .../bindings/spi/brcm,spi-bcm-qspi.yaml       | 156 +++++++++---------
 .../bindings/spi/cdns,qspi-nor.yaml           |  34 ++--
 .../bindings/spi/nvidia,tegra210-quad.yaml    |  42 ++---
 .../bindings/spi/qcom,spi-qcom-qspi.yaml      |   1 -
 .../devicetree/bindings/spi/renesas,rspi.yaml |  22 +--
 .../bindings/spi/spi-sunplus-sp7021.yaml      |   4 +-
 .../devicetree/bindings/spi/st,stm32-spi.yaml |  23 ++-
 10 files changed, 176 insertions(+), 178 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
index e5eca3a6f132..4e28e6e9d8e0 100644
--- a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
+++ b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
@@ -100,17 +100,17 @@ unevaluatedProperties: false
 examples:
   - |
     spi@c1108d80 {
-          compatible = "amlogic,meson-gx-spicc";
-          reg = <0xc1108d80 0x80>;
-          interrupts = <112>;
-          clocks = <&clk81>;
-          clock-names = "core";
-          #address-cells = <1>;
-          #size-cells = <0>;
-
-          display@0 {
-              compatible = "lg,lg4573";
-              spi-max-frequency = <1000000>;
-              reg = <0>;
-          };
+        compatible = "amlogic,meson-gx-spicc";
+        reg = <0xc1108d80 0x80>;
+        interrupts = <112>;
+        clocks = <&clk81>;
+        clock-names = "core";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@0 {
+            compatible = "lg,lg4573";
+            spi-max-frequency = <1000000>;
+            reg = <0>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
index 806043fed4d1..8e769ccda97f 100644
--- a/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
+++ b/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
@@ -40,15 +40,15 @@ unevaluatedProperties: false
 examples:
   - |
     spi@c1108c80 {
-          compatible = "amlogic,meson6-spifc";
-          reg = <0xc1108c80 0x80>;
-          clocks = <&clk81>;
-          #address-cells = <1>;
-          #size-cells = <0>;
-
-          flash: flash@0 {
-              compatible = "spansion,m25p80", "jedec,spi-nor";
-              reg = <0>;
-              spi-max-frequency = <40000000>;
-          };
+        compatible = "amlogic,meson6-spifc";
+        reg = <0xc1108c80 0x80>;
+        clocks = <&clk81>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash: flash@0 {
+            compatible = "spansion,m25p80", "jedec,spi-nor";
+            reg = <0>;
+            spi-max-frequency = <40000000>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
index aae6fb139b5b..57d932af4506 100644
--- a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
+++ b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
@@ -60,23 +60,23 @@ examples:
         interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 
         flash@0 {
-                reg = < 0 >;
-                compatible = "jedec,spi-nor";
-                spi-max-frequency = <50000000>;
-                spi-rx-bus-width = <2>;
+            reg = < 0 >;
+            compatible = "jedec,spi-nor";
+            spi-max-frequency = <50000000>;
+            spi-rx-bus-width = <2>;
         };
 
         flash@1 {
-                reg = < 1 >;
-                compatible = "jedec,spi-nor";
-                spi-max-frequency = <50000000>;
-                spi-rx-bus-width = <2>;
+            reg = < 1 >;
+            compatible = "jedec,spi-nor";
+            spi-max-frequency = <50000000>;
+            spi-rx-bus-width = <2>;
         };
 
         flash@2 {
-                reg = < 2 >;
-                compatible = "jedec,spi-nor";
-                spi-max-frequency = <50000000>;
-                spi-rx-bus-width = <2>;
+            reg = < 2 >;
+            compatible = "jedec,spi-nor";
+            spi-max-frequency = <50000000>;
+            spi-rx-bus-width = <2>;
         };
     };
diff --git a/Documentation/devicetree/bindings/spi/brcm,spi-bcm-qspi.yaml b/Documentation/devicetree/bindings/spi/brcm,spi-bcm-qspi.yaml
index ec5873919170..28222aae3077 100644
--- a/Documentation/devicetree/bindings/spi/brcm,spi-bcm-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/brcm,spi-bcm-qspi.yaml
@@ -99,98 +99,98 @@ required:
 examples:
   - | # BRCMSTB SoC: SPI Master (MSPI+BSPI) for SPI-NOR access
     spi@f03e3400 {
-            compatible = "brcm,spi-brcmstb-qspi", "brcm,spi-bcm-qspi";
-            reg = <0xf03e3400 0x188>, <0xf03e3200 0x50>, <0xf03e0920 0x4>;
-            reg-names = "mspi", "bspi", "cs_reg";
-            interrupts = <0x5>, <0x6>, <0x1>, <0x2>, <0x3>, <0x4>, <0x0>;
-            interrupt-parent = <&gic>;
-            interrupt-names = "mspi_done",
-                              "mspi_halted",
-                              "spi_lr_fullness_reached",
-                              "spi_lr_session_aborted",
-                              "spi_lr_impatient",
-                              "spi_lr_session_done",
-                              "spi_lr_overread";
-            clocks = <&hif_spi>;
-            #address-cells = <0x1>;
-            #size-cells = <0x0>;
-
-            flash@0 {
-                    #size-cells = <0x2>;
-                    #address-cells = <0x2>;
-                    compatible = "m25p80";
-                    reg = <0x0>;
-                    spi-max-frequency = <0x2625a00>;
-                    spi-cpol;
-                    spi-cpha;
-            };
+        compatible = "brcm,spi-brcmstb-qspi", "brcm,spi-bcm-qspi";
+        reg = <0xf03e3400 0x188>, <0xf03e3200 0x50>, <0xf03e0920 0x4>;
+        reg-names = "mspi", "bspi", "cs_reg";
+        interrupts = <0x5>, <0x6>, <0x1>, <0x2>, <0x3>, <0x4>, <0x0>;
+        interrupt-parent = <&gic>;
+        interrupt-names = "mspi_done",
+                          "mspi_halted",
+                          "spi_lr_fullness_reached",
+                          "spi_lr_session_aborted",
+                          "spi_lr_impatient",
+                          "spi_lr_session_done",
+                          "spi_lr_overread";
+        clocks = <&hif_spi>;
+        #address-cells = <0x1>;
+        #size-cells = <0x0>;
+
+        flash@0 {
+            #size-cells = <0x2>;
+            #address-cells = <0x2>;
+            compatible = "m25p80";
+            reg = <0x0>;
+            spi-max-frequency = <0x2625a00>;
+            spi-cpol;
+            spi-cpha;
+        };
     };
   - | # BRCMSTB SoC: MSPI master for any SPI device
     spi@f0416000 {
-            clocks = <&upg_fixed>;
-            compatible = "brcm,spi-brcmstb-mspi", "brcm,spi-bcm-qspi";
-            reg = <0xf0416000 0x180>;
-            reg-names = "mspi";
-            interrupts = <0x14>;
-            interrupt-parent = <&irq0_aon_intc>;
-            interrupt-names = "mspi_done";
-            #address-cells = <1>;
-            #size-cells = <0>;
+        clocks = <&upg_fixed>;
+        compatible = "brcm,spi-brcmstb-mspi", "brcm,spi-bcm-qspi";
+        reg = <0xf0416000 0x180>;
+        reg-names = "mspi";
+        interrupts = <0x14>;
+        interrupt-parent = <&irq0_aon_intc>;
+        interrupt-names = "mspi_done";
+        #address-cells = <1>;
+        #size-cells = <0>;
     };
   - | # iProc SoC
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     spi@18027200 {
-            compatible = "brcm,spi-nsp-qspi", "brcm,spi-bcm-qspi";
-            reg = <0x18027200 0x184>,
-                  <0x18027000 0x124>,
-                  <0x1811c408 0x004>,
-                  <0x180273a0 0x01c>;
-            reg-names = "mspi", "bspi", "intr_regs", "intr_status_reg";
-            interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
-            interrupt-names = "mspi_done",
-                              "mspi_halted",
-                              "spi_lr_fullness_reached",
-                              "spi_lr_session_aborted",
-                              "spi_lr_impatient",
-                              "spi_lr_session_done";
-            clocks = <&iprocmed>;
-            num-cs = <2>;
-            #address-cells = <1>;
-            #size-cells = <0>;
+        compatible = "brcm,spi-nsp-qspi", "brcm,spi-bcm-qspi";
+        reg = <0x18027200 0x184>,
+              <0x18027000 0x124>,
+              <0x1811c408 0x004>,
+              <0x180273a0 0x01c>;
+        reg-names = "mspi", "bspi", "intr_regs", "intr_status_reg";
+        interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "mspi_done",
+                          "mspi_halted",
+                          "spi_lr_fullness_reached",
+                          "spi_lr_session_aborted",
+                          "spi_lr_impatient",
+                          "spi_lr_session_done";
+        clocks = <&iprocmed>;
+        num-cs = <2>;
+        #address-cells = <1>;
+        #size-cells = <0>;
     };
   - | # NS2 SoC
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     spi@66470200 {
-            compatible = "brcm,spi-ns2-qspi", "brcm,spi-bcm-qspi";
-            reg = <0x66470200 0x184>,
-                  <0x66470000 0x124>,
-                  <0x67017408 0x004>,
-                  <0x664703a0 0x01c>;
-            reg-names = "mspi", "bspi", "intr_regs", "intr_status_reg";
-            interrupts = <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>;
-            interrupt-names = "spi_l1_intr";
-            clocks = <&iprocmed>;
-            num-cs = <2>;
+        compatible = "brcm,spi-ns2-qspi", "brcm,spi-bcm-qspi";
+        reg = <0x66470200 0x184>,
+              <0x66470000 0x124>,
+              <0x67017408 0x004>,
+              <0x664703a0 0x01c>;
+        reg-names = "mspi", "bspi", "intr_regs", "intr_status_reg";
+        interrupts = <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "spi_l1_intr";
+        clocks = <&iprocmed>;
+        num-cs = <2>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
             #address-cells = <1>;
-            #size-cells = <0>;
-
-            flash@0 {
-                    #address-cells = <1>;
-                    #size-cells = <1>;
-                    compatible = "m25p80";
-                    reg = <0x0>;
-                    spi-max-frequency = <12500000>;
-                    spi-cpol;
-                    spi-cpha;
-            };
+            #size-cells = <1>;
+            compatible = "m25p80";
+            reg = <0x0>;
+            spi-max-frequency = <12500000>;
+            spi-cpol;
+            spi-cpha;
+        };
     };
diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
index 9be4e2c5d1ee..5c01db128be0 100644
--- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
@@ -103,21 +103,21 @@ unevaluatedProperties: false
 examples:
   - |
     qspi: spi@ff705000 {
-      compatible = "cdns,qspi-nor";
-      #address-cells = <1>;
-      #size-cells = <0>;
-      reg = <0xff705000 0x1000>,
-            <0xffa00000 0x1000>;
-      interrupts = <0 151 4>;
-      clocks = <&qspi_clk>;
-      cdns,fifo-depth = <128>;
-      cdns,fifo-width = <4>;
-      cdns,trigger-address = <0x00000000>;
-      resets = <&rst 0x1>, <&rst 0x2>;
-      reset-names = "qspi", "qspi-ocp";
-
-      flash@0 {
-              compatible = "jedec,spi-nor";
-              reg = <0x0>;
-      };
+        compatible = "cdns,qspi-nor";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0xff705000 0x1000>,
+              <0xffa00000 0x1000>;
+        interrupts = <0 151 4>;
+        clocks = <&qspi_clk>;
+        cdns,fifo-depth = <128>;
+        cdns,fifo-width = <4>;
+        cdns,trigger-address = <0x00000000>;
+        resets = <&rst 0x1>, <&rst 0x2>;
+        reset-names = "qspi", "qspi-ocp";
+
+        flash@0 {
+            compatible = "jedec,spi-nor";
+            reg = <0x0>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
index 9f78b2c06494..9ae1611175f2 100644
--- a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
+++ b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
@@ -74,25 +74,25 @@ examples:
     #include <dt-bindings/reset/tegra210-car.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     spi@70410000 {
-            compatible = "nvidia,tegra210-qspi";
-            reg = <0x70410000 0x1000>;
-            interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
-            #address-cells = <1>;
-            #size-cells = <0>;
-            clocks = <&tegra_car TEGRA210_CLK_QSPI>,
-                     <&tegra_car TEGRA210_CLK_QSPI_PM>;
-            clock-names = "qspi", "qspi_out";
-            resets = <&tegra_car 211>;
-            dmas = <&apbdma 5>, <&apbdma 5>;
-            dma-names = "rx", "tx";
-
-            flash@0 {
-                    compatible = "jedec,spi-nor";
-                    reg = <0>;
-                    spi-max-frequency = <104000000>;
-                    spi-tx-bus-width = <2>;
-                    spi-rx-bus-width = <2>;
-                    nvidia,tx-clk-tap-delay = <0>;
-                    nvidia,rx-clk-tap-delay = <0>;
-            };
+        compatible = "nvidia,tegra210-qspi";
+        reg = <0x70410000 0x1000>;
+        interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&tegra_car TEGRA210_CLK_QSPI>,
+                 <&tegra_car TEGRA210_CLK_QSPI_PM>;
+        clock-names = "qspi", "qspi_out";
+        resets = <&tegra_car 211>;
+        dmas = <&apbdma 5>, <&apbdma 5>;
+        dma-names = "rx", "tx";
+
+        flash@0 {
+            compatible = "jedec,spi-nor";
+            reg = <0>;
+            spi-max-frequency = <104000000>;
+            spi-tx-bus-width = <2>;
+            spi-rx-bus-width = <2>;
+            nvidia,tx-clk-tap-delay = <0>;
+            nvidia,rx-clk-tap-delay = <0>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
index 85e7770703bd..e94d915e28c8 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
@@ -87,7 +87,6 @@ examples:
                 spi-tx-bus-width = <2>;
                 spi-rx-bus-width = <2>;
             };
-
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/spi/renesas,rspi.yaml b/Documentation/devicetree/bindings/spi/renesas,rspi.yaml
index f45d3b75d6de..4d8ec69214c9 100644
--- a/Documentation/devicetree/bindings/spi/renesas,rspi.yaml
+++ b/Documentation/devicetree/bindings/spi/renesas,rspi.yaml
@@ -141,15 +141,15 @@ examples:
     #include <dt-bindings/power/r8a7791-sysc.h>
 
     qspi: spi@e6b10000 {
-            compatible = "renesas,qspi-r8a7791", "renesas,qspi";
-            reg = <0xe6b10000 0x2c>;
-            interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&cpg CPG_MOD 917>;
-            dmas = <&dmac0 0x17>, <&dmac0 0x18>, <&dmac1 0x17>, <&dmac1 0x18>;
-            dma-names = "tx", "rx", "tx", "rx";
-            power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
-            resets = <&cpg 917>;
-            num-cs = <1>;
-            #address-cells = <1>;
-            #size-cells = <0>;
+        compatible = "renesas,qspi-r8a7791", "renesas,qspi";
+        reg = <0xe6b10000 0x2c>;
+        interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 917>;
+        dmas = <&dmac0 0x17>, <&dmac0 0x18>, <&dmac1 0x17>, <&dmac1 0x18>;
+        dma-names = "tx", "rx", "tx", "rx";
+        power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
+        resets = <&cpg 917>;
+        num-cs = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
     };
diff --git a/Documentation/devicetree/bindings/spi/spi-sunplus-sp7021.yaml b/Documentation/devicetree/bindings/spi/spi-sunplus-sp7021.yaml
index 69a463305274..edb5ba71af3a 100644
--- a/Documentation/devicetree/bindings/spi/spi-sunplus-sp7021.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-sunplus-sp7021.yaml
@@ -59,9 +59,9 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
-    spi@9C002D80 {
+    spi@9c002d80 {
         compatible = "sunplus,sp7021-spi";
-        reg = <0x9C002D80 0x80>, <0x9C002E00 0x80>;
+        reg = <0x9c002d80 0x80>, <0x9c002e00 0x80>;
         reg-names = "master", "slave";
         interrupt-parent = <&intc>;
         interrupt-names = "dma_w",
diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
index d35c6f7e2dd5..9ca1a843c820 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
@@ -84,18 +84,17 @@ examples:
     #include <dt-bindings/clock/stm32mp1-clks.h>
     #include <dt-bindings/reset/stm32mp1-resets.h>
     spi@4000b000 {
-      #address-cells = <1>;
-      #size-cells = <0>;
-      compatible = "st,stm32h7-spi";
-      reg = <0x4000b000 0x400>;
-      interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
-      clocks = <&rcc SPI2_K>;
-      resets = <&rcc SPI2_R>;
-      dmas = <&dmamux1 0 39 0x400 0x05>,
-             <&dmamux1 1 40 0x400 0x05>;
-      dma-names = "rx", "tx";
-      cs-gpios = <&gpioa 11 0>;
-
+        #address-cells = <1>;
+        #size-cells = <0>;
+        compatible = "st,stm32h7-spi";
+        reg = <0x4000b000 0x400>;
+        interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&rcc SPI2_K>;
+        resets = <&rcc SPI2_R>;
+        dmas = <&dmamux1 0 39 0x400 0x05>,
+               <&dmamux1 1 40 0x400 0x05>;
+        dma-names = "rx", "tx";
+        cs-gpios = <&gpioa 11 0>;
     };
 
 ...
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
