Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD01E672613
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jan 2023 19:01:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9074BC69053;
	Wed, 18 Jan 2023 18:01:54 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D244C69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jan 2023 18:01:53 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id e3so25562406wru.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jan 2023 10:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zp84JUX2wPLB6FAIMuryYBX4UoBq5satkVPoiHfbwC8=;
 b=SuzsQHg+VL7NqkwjrA63pCX0Wh/ri6IncPBZXyPuINUTQvvp788mh5J4vJJxBa9Mc/
 y/ttCKrX0uNIm+tw6/vqD5JFPoJIAH/m1xJd12MANZgmNBGvfqVoslitJaDVlpYG6Gcg
 ljT6biT3+fWn72zFSlQeveqfkUxSwqcVzuAg0RUZL3rklTY4sVg1jBK14OM92QHKLI48
 rjYxW/75SOrTLmszDt2eq00ibyhe+I+UMNVBKLJKKppm//AV5dM89TEYBDgLS70RCG60
 7ZznQt3ixUsuMaRIYB+5yX51Oph7bYwjr0NIzHepDaw7N5dDr9M05cbdJmoCBItHwWrH
 SkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zp84JUX2wPLB6FAIMuryYBX4UoBq5satkVPoiHfbwC8=;
 b=b0EFcDdtR7uChr9mH9IxzkVyaYr6/M7N1peTUr5reIw8baJJXp3Bw2bS6FK+na8JWs
 ecBY7kwv7NPPCBqo9qGSfoGDpV2cAhbubXWIYd0vI6Xj9mrJpT/DMFYlrbxArnK/UGSS
 z2T5pUPJd9iykA7lcakMdqZAO3gneeAwNvVj4FFuuB5Ih/67qkkJN6/jV/9vG5ob1KtY
 mRRjAxCiTi1cXxKbyeUudWkF102Vq3JDWEfWNDZ2C8AEGS54wSVEDi+wgD1tzY+E/aJy
 xIuRVPMga1JHKhNVHDHYn3vCxSw2xIlaIHSfSUCABGK8Afv2K3z8gGQ5ZDsnjn4ehp7o
 ZFzw==
X-Gm-Message-State: AFqh2kp0yDOh2dpF0H4qG/lKyD719h9IZyOFN8B0AhcE8lYMX+682X1V
 1SjIWvHvIIAEmZsjqb+oKqfZIg==
X-Google-Smtp-Source: AMrXdXv3mSWZmyjShmt7WtX7nY6Hcxtp9KvdQ4XjWZI2xRezvrvP5e54ZFq9WAbXPQXpGcFKgypXlQ==
X-Received: by 2002:adf:efc8:0:b0:29d:f817:42d4 with SMTP id
 i8-20020adfefc8000000b0029df81742d4mr16973520wrp.19.1674064912700; 
 Wed, 18 Jan 2023 10:01:52 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 w4-20020a5d4b44000000b002366dd0e030sm31657450wrs.68.2023.01.18.10.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 10:01:52 -0800 (PST)
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
Date: Wed, 18 Jan 2023 19:01:44 +0100
Message-Id: <20230118180144.364756-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
References: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 2/2] dt-bindings: dma: cleanup examples -
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
 - use lowercase hex.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/dma/snps,dw-axi-dmac.yaml        | 36 +++++++++----------
 .../bindings/dma/stericsson,dma40.yaml        |  4 +--
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 2bedab1f74e0..d34d0fa62ab5 100644
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
+    dmac: dma-controller@80000 {
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
index 664ee61a00d8..57395a810719 100644
--- a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
+++ b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
@@ -147,9 +147,9 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/mfd/dbx500-prcmu.h>
-    dma-controller@801C0000 {
+    dma-controller@801c0000 {
       compatible = "stericsson,db8500-dma40", "stericsson,dma40";
-      reg = <0x801C0000 0x1000>, <0x40010000 0x800>;
+      reg = <0x801c0000 0x1000>, <0x40010000 0x800>;
       reg-names = "base", "lcpa";
       interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
       #dma-cells = <3>;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
