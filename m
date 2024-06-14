Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B58D908803
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 11:47:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C66DEC78011;
	Fri, 14 Jun 2024 09:47:22 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FE11C78010
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 09:47:21 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a6f0c3d0792so241401866b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 02:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718358441; x=1718963241;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uodfs//bjqrAe2qZ9kd84WsjVyMmGfcvrKfsL+16kuU=;
 b=n/gxaERkzDS3MkeHRVhhtSRex1EQ4YcgCHFIDnCQdKe/XVv1LXoSTTbFY0+hqIG6qW
 8522MfCl7xZdofZYH0o9XLRqU10FrdcfGOJ62GlQEsb73hk7m+K62egDu/KDURm/BICr
 0nuxWX7PnqMOlxeHngcASQRfXJjkv3ABDdJicvw95Ud/y5+mlpLkoq1Dk0MhEffdwLq3
 AMO1EART19QYpHkIR1ekgxZz66YDCzXeG6WGQT9Q+am8/T8//qXeWGYyEMHGRetcFG4N
 tK3nwyafZi5+a47QuzYrRYPDRt4LQuuJujjO8+urEy1XeuHdsakOP5EzcEl1lgoKxmCT
 mHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718358441; x=1718963241;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uodfs//bjqrAe2qZ9kd84WsjVyMmGfcvrKfsL+16kuU=;
 b=IrhEcEzRBKGby6QJHwHfDCokdR50d/JeEkh88iwnEn10ycXFsHtrgJJil6mU0xMaY6
 fjXMPNKZfeT97Sz4uBBOw9Zd1Pl9gjBcCjg9P84eAAnUIctWqA3jBCQHMBDnUJwuRGU7
 Iz9TPSPgguhuDmThpgHL/SANbylrGR1ufsnMu6DiHwTT4yhMZtySCUcQq7UiTR4zt15f
 MXpLKpeHP6b95w6Z5P4CEqzznwTZWnXGW8RAyUE/lIg5FUhVh48mcMZ8OZ90h9WIpWJA
 cIeAepL22VncTu6sN6nfS+1ZCu1RDHTD3ZDGYnTdCkxRwE/NGvH996v+PdSuqHxF6MlA
 2gzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQFWFYEmZM3GV5+KlXMLff4o2LrQGGi8aJsZl28ITVIUp2kkhVaKVPUviCNU2In06gMX2w6GLAstCIyYLQg1Freig5SN89XlyJJkzjq0VwoD8p98PDXE6n
X-Gm-Message-State: AOJu0YwHvNMcKLxyutB+qeM/QybsxJB1eIXEkEsOR467VfR6hYKO68mI
 wxMWVDeB1qLws+kvHiekqeRkeZShiIS4y9XnqQCH4lHliDjxtxh5ZrcwXnS63mY=
X-Google-Smtp-Source: AGHT+IFLXVZv5XBW+iKZMorDGOlMRZlD+plTHxN5ZcGaV4oaBUeSx4OwwCAW6apvsQZglLUiZLZZUA==
X-Received: by 2002:a17:906:4c58:b0:a68:b49e:4745 with SMTP id
 a640c23a62f3a-a6f60de6279mr130459866b.70.1718358440945; 
 Fri, 14 Jun 2024 02:47:20 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 02:47:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:20 +0200
MIME-Version: 1.0
Message-Id: <20240614-dt-bindings-thermal-allof-v1-21-30b25a6ae24e@linaro.org>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Amit Kucheria <amitk@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 zhanghongchen <zhanghongchen@loongson.cn>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4876;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=cnRkmLQXvImOJ6clYhAxknZOfk4WOGw9WYVxljgJNd0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFyeLfiWLO3TcJQWHtxyb2jlsrVArsQc5HSM
 Zl8d/bpA9uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRcgAKCRDBN2bmhouD
 14q/D/wPchU0i1VJXyIyken/BpDy3CFIoxfe1Lx6ww08lDDBl6vxpB0QaflHSCvUb6oJhYLx5XC
 KQWlbHOynfTXswZGltb7vmbxKtQZKkAuceB/+6DHHkHVvJSfygqXTpFwbERstRbVdvrkm0AAxn6
 c6feUiuenfE5zkU/hdbvkKiJcodB6VehCGu6gcWyxCi66DbLYb2tZeACluumArIm7xZqfogg9CZ
 NAg8xL6WQwY+D0V4zDLageaphLcGdZNLe6M704GpS8vvp3MATTujqASLJDPu3+g5syhZR9Th/+4
 ioQj88CRX4dOOOTFbMLjaHgPb9zbFwilrfsCSQFnjKZk3PoB1IPqoIiPE2hYrbONHxgOIRJfnY0
 oYZ3dksGJEjv6eGF5a3+bWnW9RuFzW3l8M7VY6ZDfUQ1eRLSu8ZR2fCN455j6SSC3M/VioNDPi1
 /NqNoR6pA2KvS5eSU5z/weJ1XMQk7n2xgL2nsrA38ni1ljmOC5Q2oS/jZIzbpHE3Tv6Ud1/DMHv
 XEJ4O/YuwHiNNigQ8l5CgZCER+b0tvL4jTWX2XrLXP7uN4zbEBz+fBrrtWY/5sCM++WwlYKpz09
 VUQcTb1inEie1Ek8CxxovMd9HIe2vrwVJr8D4KDpvt2NCCwln+qHv5tRXUiDeHOwyyVMEf/34tB
 BEM3vs6dT6iX0RQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 21/22] dt-bindings: thermal: simplify few
	bindings
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

Simplify few bindings which already reference thermal-sensor.yaml schema
by dropping unneeded requiring of '#thermal-sensor-cells' and dropping
assigned-clocks properties (core schema allows it if 'clocks' are
there).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml          | 1 -
 Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml   | 1 -
 Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml        | 1 -
 Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml  | 1 -
 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml  | 1 -
 .../devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml         | 1 -
 Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml | 4 ----
 Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml   | 1 -
 8 files changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml b/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml
index 267a0f423504..32730211e15b 100644
--- a/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml
+++ b/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml
@@ -42,7 +42,6 @@ additionalProperties: false
 required:
   - compatible
   - reg
-  - "#thermal-sensor-cells"
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml b/Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml
index 2b6026d9fbcf..ddf0f20e5285 100644
--- a/Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml
@@ -34,7 +34,6 @@ required:
   - compatible
   - reg
   - clocks
-  - '#thermal-sensor-cells'
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml b/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml
index e02d04d4f71e..ceef318668bf 100644
--- a/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml
@@ -28,7 +28,6 @@ properties:
 
 required:
   - compatible
-  - '#thermal-sensor-cells'
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
index ca81c8afba79..79e691b08341 100644
--- a/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
@@ -38,7 +38,6 @@ required:
   - compatible
   - reg
   - interrupts
-  - '#thermal-sensor-cells'
 
 if:
   properties:
diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
index 331cf4e662e3..0259cd3ce9c5 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
@@ -99,7 +99,6 @@ required:
   - resets
   - nvmem-cells
   - nvmem-cell-names
-  - "#thermal-sensor-cells"
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
index b0237d236021..19bb1f324183 100644
--- a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
@@ -197,7 +197,6 @@ required:
   - clock-names
   - resets
   - reset-names
-  - "#thermal-sensor-cells"
 
 allOf:
   - $ref: thermal-sensor.yaml
diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
index 972d608ddf95..63a29a1f7fe6 100644
--- a/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
@@ -48,10 +48,6 @@ properties:
   "#thermal-sensor-cells":
     const: 1
 
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-  assigned-clocks: true
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml b/Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml
index 5f08b6e59b8a..30b22151aa82 100644
--- a/Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml
@@ -42,7 +42,6 @@ required:
   - compatible
   - reg
   - interrupts
-  - '#thermal-sensor-cells'
 
 additionalProperties: false
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
