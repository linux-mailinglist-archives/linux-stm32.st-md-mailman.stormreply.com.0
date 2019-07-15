Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E192A69F50
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jul 2019 01:05:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96D64C5AEC9
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jul 2019 23:05:02 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18585C5AB8C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jul 2019 23:05:01 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id k8so36968507iot.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jul 2019 16:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k28XQmjVwDonv00Vu61ACUarMShzug/T9SvQGCXzgaE=;
 b=m8WKqsgQFWXDt+00g0RguCHkEgLROSY+gYN3+BUaJFnSoRdmJdkOSjI8inW+t+bGRw
 /GKQLBBd59efX1gwlCu08tSS5shpd52tkF6wOLxsUwb48koG4EpqUvNgZoqXm+RCcor9
 vB1iqJ/EA6GfctDaPWq75L30vTIqs8ehEabF5AHDpBXBPcT+Ih1GAVPc6161bJag31Fx
 tFjyDZHgmCFLubBXVIBic3nVjpjt6AHarFI+rr47GvjJTXLK2hirFUiy5W08pVCaJ/Wd
 JBmJE26FDS1iTbgtZehX8nOQ06G1jNKIi5lTUd5lkAE2wyVMpwOugHcfBn5cmTFY9f3a
 MQww==
X-Gm-Message-State: APjAAAUDAqq63napRyZ0h8iupI4btxTwN1hABCcKVGPVOw3pO4/O+c1c
 6sbuaadbmTumrJn5KiomvA==
X-Google-Smtp-Source: APXvYqx8oBeU1HXQ+y/8oUso7u6EabN+Lj8Dck1Dh5+0lXZxGOc8P8rXKPubjC3HT1yThMl/Q9mGIw==
X-Received: by 2002:a5e:9404:: with SMTP id q4mr28791973ioj.46.1563231899603; 
 Mon, 15 Jul 2019 16:04:59 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id h8sm19123434ioq.61.2019.07.15.16.04.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 16:04:59 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Date: Mon, 15 Jul 2019 17:04:57 -0600
Message-Id: <20190715230457.3901-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-gpio@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] dt-bindings: Ensure child nodes are of type
	'object'
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

Properties which are child node definitions need to have an explict
type. Otherwise, a matching (DT) property can silently match when an
error is desired. Fix this up tree-wide. Once this is fixed, the
meta-schema will enforce this on any child node definitions.

Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-mtd@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-spi@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack. I will take this via the DT tree.

Rob

 .../devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml       | 1 +
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml      | 1 +
 Documentation/devicetree/bindings/mtd/nand-controller.yaml     | 1 +
 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml          | 3 +++
 .../devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml       | 1 +
 .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml       | 1 +
 6 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml
index fc2f63860cc8..be32f087c529 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml
@@ -42,6 +42,7 @@ properties:
 
 patternProperties:
   "^.*@[0-9a-fA-F]+$":
+    type: object
     properties:
       reg:
         maxItems: 1
diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index e5a411518be1..b5b3cf5b1ac2 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -55,6 +55,7 @@ patternProperties:
   "^pinctrl-[0-9]+$": true
 
   "^nand@[a-f0-9]+$":
+    type: object
     properties:
       reg:
         minimum: 0
diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index 199ba5ac2a06..d261b7096c69 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -40,6 +40,7 @@ properties:
 
 patternProperties:
   "^nand@[a-f0-9]$":
+    type: object
     properties:
       reg:
         description:
diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 06c4b66c3ee6..3ac5d2088e49 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -55,6 +55,7 @@ properties:
 
 patternProperties:
   '^gpio@[0-9a-f]*$':
+    type: object
     properties:
       gpio-controller: true
       '#gpio-cells':
@@ -113,8 +114,10 @@ patternProperties:
       - st,bank-name
 
   '-[0-9]*$':
+    type: object
     patternProperties:
       '^pins':
+        type: object
         description: |
           A pinctrl node should contain at least one subnode representing the
           pinctrl group available on the machine. Each subnode will list the
diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml
index c374fd4923a6..6d1329c28170 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml
@@ -50,6 +50,7 @@ properties:
 
 patternProperties:
   "^.*@[0-9a-f]+":
+    type: object
     properties:
       reg:
         items:
diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index bda7a5befd8b..f36c46d236d7 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
@@ -55,6 +55,7 @@ properties:
 
 patternProperties:
   "^.*@[0-9a-f]+":
+    type: object
     properties:
       reg:
         items:
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
