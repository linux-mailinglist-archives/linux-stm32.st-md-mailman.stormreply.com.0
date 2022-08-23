Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF1659E56D
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Aug 2022 16:57:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45542C640F3;
	Tue, 23 Aug 2022 14:57:22 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31F96C03FC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Aug 2022 14:57:21 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id w196so16180471oiw.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Aug 2022 07:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=h0CnVKrOjJedjISgP9+nhkN7E189WcSV8KiZ+ezPrBE=;
 b=6p+7W6I+KFAt/4CQR3x1H23bcNppwHNh+jwKMd0v7tME2x2YF73e1G8RnrCvuUEBYU
 HvqINs5q12A5MwstErh+UZRyUh3Hd3Hv9QD1gx3DBfXTNxgwkGX0Dym/HhwPGF0NcwJ6
 iP5awDIPyGClEOMhbVCYMr9PN1VttsFSWLHKN5qGsbk7+rwjSx3R0lxYyyTjgjT7bG+2
 eV5fREF5hXnp0kTbVhoCS/4JWa3acNqZ4gcZZaWruPgSrWdldSs9iOuBAdRjDenY+Gg9
 GsKfBmTnjMgVe80hw7aMotiAaJvJxeoTrqZ14j7nR+UNfQ1DyA6pL+2M6mhUjJnUEGYo
 bPGA==
X-Gm-Message-State: ACgBeo2TEWjd3lKrGiKq9Fd1MztJiQ1z1MUDBSwDY4a8o83JgO0wOiyz
 zKvOvpaHZq+scW3xrT/7Gw==
X-Google-Smtp-Source: AA6agR5OARvxdnc8BmaUXFTmBiSwYZaPHP9yws/NVD55WI4mBLuEUcY0qCEgGgE0JHMJhoGGEYBTzg==
X-Received: by 2002:aca:f054:0:b0:345:7285:1147 with SMTP id
 o81-20020acaf054000000b0034572851147mr1505615oih.108.1661266640082; 
 Tue, 23 Aug 2022 07:57:20 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020a056870600100b0011c65559b04sm3840637oaa.34.2022.08.23.07.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 07:57:19 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Sowjanya D <lakshmi.sowjanya.d@intel.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andy Teng <andy.teng@mediatek.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Date: Tue, 23 Aug 2022 09:56:37 -0500
Message-Id: <20220823145649.3118479-6-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: pinctrl: Add missing
	(unevaluated|additional)Properties on child nodes
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

In order to ensure only documented properties are present, node schemas
must have unevaluatedProperties or additionalProperties set to false
(typically).

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml      | 1 +
 .../devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml     | 1 +
 .../devicetree/bindings/pinctrl/intel,pinctrl-thunderbay.yaml  | 1 +
 .../devicetree/bindings/pinctrl/marvell,ac5-pinctrl.yaml       | 1 +
 .../devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml   | 2 ++
 .../devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml   | 1 +
 .../devicetree/bindings/pinctrl/renesas,rza1-ports.yaml        | 1 +
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 3 +++
 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml          | 3 +++
 .../devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml  | 1 +
 10 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml
index 175a992f15e1..8a9fb9b433ca 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml
@@ -23,6 +23,7 @@ patternProperties:
   '-pins$':
     type: object
     $ref: pinmux-node.yaml#
+    additionalProperties: false
 
     properties:
       function:
diff --git a/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml b/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml
index 5e99d79499b4..846651ff77c9 100644
--- a/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml
@@ -44,6 +44,7 @@ properties:
 patternProperties:
   '^gpio@[0-9a-f]*$':
     type: object
+    additionalProperties: false
 
     description:
       Child nodes can be specified to contain pin configuration information,
diff --git a/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-thunderbay.yaml b/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-thunderbay.yaml
index 0ec476248f21..6f30b5337ca2 100644
--- a/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-thunderbay.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-thunderbay.yaml
@@ -42,6 +42,7 @@ properties:
 patternProperties:
   '^gpio@[0-9a-f]*$':
     type: object
+    additionalProperties: false
 
     description:
       Child nodes can be specified to contain pin configuration information,
diff --git a/Documentation/devicetree/bindings/pinctrl/marvell,ac5-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/marvell,ac5-pinctrl.yaml
index a651b2744caf..491f67e7cc4f 100644
--- a/Documentation/devicetree/bindings/pinctrl/marvell,ac5-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/marvell,ac5-pinctrl.yaml
@@ -24,6 +24,7 @@ patternProperties:
   '-pins$':
     type: object
     $ref: pinmux-node.yaml#
+    additionalProperties: false
 
     properties:
       marvell,function:
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index e7601c0f5a69..840f649e36ce 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -76,6 +76,8 @@ required:
 patternProperties:
   '-[0-9]*$':
     type: object
+    additionalProperties: false
+
     patternProperties:
       '-pins*$':
         type: object
diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
index 7a11beb8f222..7b7f840ffc4c 100644
--- a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
@@ -30,6 +30,7 @@ patternProperties:
 
   "^gpio@[0-7]$":
     type: object
+    additionalProperties: false
 
     description:
       Eight GPIO banks (gpio@0 to gpio@7), that each contain between 14 and 18
diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml
index 8ed4b98a1628..9083040c996a 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml
@@ -41,6 +41,7 @@ required:
 patternProperties:
   "^gpio-[0-9]*$":
     type: object
+    additionalProperties: false
 
     description:
       Each port of the r7s72100 pin controller hardware is itself a GPIO
diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 3a65c66ca71d..d006a940c7c6 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -97,6 +97,9 @@ patternProperties:
         additionalProperties: false
 
   "^(initial|sleep)-state$":
+    type: object
+    additionalProperties: false
+
     patternProperties:
       "^(pin-[a-z0-9-]+|[a-z0-9-]+-pin)$":
         $ref: samsung,pinctrl-pins-cfg.yaml
diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index d35dcc4f0242..53c952d93ea2 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -115,9 +115,12 @@ patternProperties:
 
   '-[0-9]*$':
     type: object
+    additionalProperties: false
+
     patternProperties:
       '^pins':
         type: object
+        additionalProperties: false
         description: |
           A pinctrl node should contain at least one subnode representing the
           pinctrl group available on the machine. Each subnode will list the
diff --git a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
index 306524885a2b..98b4663f9766 100644
--- a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
@@ -36,6 +36,7 @@ patternProperties:
       pins it needs, and how they should be configured, with regard to muxer
       configuration, pullups, drive strength.
     $ref: "pinmux-node.yaml"
+    additionalProperties: false
 
     properties:
       function:
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
