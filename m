Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C0B6792B3
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 09:11:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A182C69054;
	Tue, 24 Jan 2023 08:11:30 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDA89C69049
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 08:11:28 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso10270144wmq.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 00:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nfjek5I1oI6I+fvZ0/B32LKubURkbISmBCkZ0YpdN10=;
 b=eDb2eUaNmqc6RJ4X2WI2l7rWHFeOluRyE/kcnDtOWp+0DqwtA38WsnV48j3ePYzbFP
 EQYQxNv9ZXhvWuZbMtoLxRjrcC6np4eQaLKmXzt1SB1j2qi6KqWvzw97Qqw8q9Tcj/kJ
 jRkpTATMw5OIV0lre30D8pKGEEkyeXkw4ljIHPMQNEyAhtrIzYwPkv7vOSeHKGF5iD40
 wci0xsCQgObSm9c0bqJUw7B42/Mi/epy4pqCgUifQQemyne16Fh2aeGwJHrQWfBPLLGF
 eXMXqllG6GWAuOS6znc7YpeyMd2iydmUqqH51FyZvDoPgN/LAPAB5nC35L/n6/NSluM4
 ynWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nfjek5I1oI6I+fvZ0/B32LKubURkbISmBCkZ0YpdN10=;
 b=S6LOGQcIhWpB9Jox3cd9jFDMUV1//Unjkdm7E2i9m8fWcKMLV7nynIQwt2qQ/vZGrq
 yXjGn3W9aDaqD75zoUMM4Mr3WMDWnira4WaYHFSfb922oJBiK2CSJkNoRd5TVexJU3O3
 dj2ag6lZUcbnHDjeYAO+a0bXtDPJbvyXUWXpIh0GOWeMNGJid4ohZnBMVfN0dI4waaa9
 c8bod+JA2Fw+QX0bjhE30J00a6pn5tyNeSn0D8aRjHn2SRjzG+oHvWF+W5fGXbwUPkep
 IZIuAylX+Vx+sRDZ7AgQUH4Ea6oNERjS0L+tIUT027XR8/RzDyhmanNa0PRo/WUmlG2C
 E21w==
X-Gm-Message-State: AFqh2kovL4sylvrCT8jZQqAqHo7vOpipQ1mt6O+h3oEUXyfhq7rs3uhE
 wNBcjJDxxPvk83U4Xw6zOQRzsw==
X-Google-Smtp-Source: AMrXdXsAy5Fj0pQUlmUK2moB+gPQM3akwPZ40HQiL5qb7z319tG/FrGiJd4D178rigOr93uyKBy5+Q==
X-Received: by 2002:a05:600c:4928:b0:3d2:2043:9cb7 with SMTP id
 f40-20020a05600c492800b003d220439cb7mr26935434wmp.5.1674547888579; 
 Tue, 24 Jan 2023 00:11:28 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 o17-20020a05600c511100b003dc0d5b4fa6sm1387338wms.3.2023.01.24.00.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 00:11:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Olivier Dautricourt <olivierdautricourt@gmail.com>,
 Stefan Roese <sr@denx.de>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Green Wan <green.wan@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?=A1er?= <povik+lin@cutebit.org>, Peng Fan <peng.fan@nxp.com>,
 Paul Cercueil <paul@crapouillou.net>, - <chuanhua.lei@intel.com>,
 Long Cheng <long.cheng@mediatek.com>, Rajesh Gumasta <rgumasta@nvidia.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Palmer Debbelt <palmer@sifive.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org
Date: Tue, 24 Jan 2023 09:11:17 +0100
Message-Id: <20230124081117.31186-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124081117.31186-1-krzysztof.kozlowski@linaro.org>
References: <20230124081117.31186-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v2 2/2] dt-bindings: dma: cleanup examples -
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
 - use lowercase hex,
 - drop unused node's label.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Drop unused label, correct indentation.
---
 .../bindings/dma/snps,dw-axi-dmac.yaml        | 36 +++++++++----------
 .../bindings/dma/stericsson,dma40.yaml        | 16 ++++-----
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 2bedab1f74e0..5c81194e2300 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -113,21 +113,21 @@ additionalProperties: false
 
 examples:
   - |
-     #include <dt-bindings/interrupt-controller/arm-gic.h>
-     #include <dt-bindings/interrupt-controller/irq.h>
-     /* example with snps,dw-axi-dmac */
-     dmac: dma-controller@80000 {
-         compatible = "snps,axi-dma-1.01a";
-         reg = <0x80000 0x400>;
-         clocks = <&core_clk>, <&cfgr_clk>;
-         clock-names = "core-clk", "cfgr-clk";
-         interrupt-parent = <&intc>;
-         interrupts = <27>;
-         #dma-cells = <1>;
-         dma-channels = <4>;
-         snps,dma-masters = <2>;
-         snps,data-width = <3>;
-         snps,block-size = <4096 4096 4096 4096>;
-         snps,priority = <0 1 2 3>;
-         snps,axi-max-burst-len = <16>;
-     };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    /* example with snps,dw-axi-dmac */
+    dma-controller@80000 {
+        compatible = "snps,axi-dma-1.01a";
+        reg = <0x80000 0x400>;
+        clocks = <&core_clk>, <&cfgr_clk>;
+        clock-names = "core-clk", "cfgr-clk";
+        interrupt-parent = <&intc>;
+        interrupts = <27>;
+        #dma-cells = <1>;
+        dma-channels = <4>;
+        snps,dma-masters = <2>;
+        snps,data-width = <3>;
+        snps,block-size = <4096 4096 4096 4096>;
+        snps,priority = <0 1 2 3>;
+        snps,axi-max-burst-len = <16>;
+    };
diff --git a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
index 664ee61a00d8..64845347f44d 100644
--- a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
+++ b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
@@ -147,13 +147,13 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/mfd/dbx500-prcmu.h>
-    dma-controller@801C0000 {
-      compatible = "stericsson,db8500-dma40", "stericsson,dma40";
-      reg = <0x801C0000 0x1000>, <0x40010000 0x800>;
-      reg-names = "base", "lcpa";
-      interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
-      #dma-cells = <3>;
-      memcpy-channels = <56 57 58 59 60>;
-      clocks = <&prcmu_clk PRCMU_DMACLK>;
+    dma-controller@801c0000 {
+        compatible = "stericsson,db8500-dma40", "stericsson,dma40";
+        reg = <0x801c0000 0x1000>, <0x40010000 0x800>;
+        reg-names = "base", "lcpa";
+        interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        #dma-cells = <3>;
+        memcpy-channels = <56 57 58 59 60>;
+        clocks = <&prcmu_clk PRCMU_DMACLK>;
     };
 ...
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
