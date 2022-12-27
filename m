Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 082846570A6
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Dec 2022 00:03:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD5F4C65068;
	Tue, 27 Dec 2022 23:03:50 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24BEEC6410A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Dec 2022 23:03:49 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id i19so2156050ljg.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Dec 2022 15:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WFhxyjlvH2C97OwizzrUKlo9kQa69CcIj1hYQfOMQx8=;
 b=KTKV/mqiy1fp5moT/wefv5Uio4Bf0syNMLLz+KxjDYeGxkXWrqtazNd7itthPYt1Y/
 EorL6NBmhsS4taoQmSkpD4gxM76YP6Jr9y3N+BMuOFn0d36IN4IE9cfZ0HZtH2/3dX6o
 +/jtigOCamBrPQgVztzHUbVzJmmDwzop3+YvcHcnNyS4fn6im2tP+CmtjVWIh202Su1d
 eilm2y2KFB7A2EZXgBv/oBGJiyzO90r/oAueNAjFZlAKpBViCHQbYwTYgJW6iTOKD6eQ
 IVFF+HAaintxi+dBUbqyWa0HOa1tqODAh9XAsUViBADu6nhyCdeZym17OaZ1rfPVBpZj
 CFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WFhxyjlvH2C97OwizzrUKlo9kQa69CcIj1hYQfOMQx8=;
 b=HAbKJXK26Tc6lrKmrPbm0c8q4DGrhYVOlGreo5uyI7PenZE0Ln/WcDep8cEZcxmurS
 ncOhtsBHZyNCKHGAIHg8gwuMg/7Yczr7jNshztO6MBieFcv8wyaD/PVrYrilCFQZ1yq5
 0YkATbdhKJSj7ctVoP+uxu7w6ade7YCnaZpS1cdlzyzwKxS9aV4dpnvdiPUFOORNjrL+
 jQJKTqrEHfTnaIdeZVAOJXJxza1NH0OZyAgkqUn2MUC3aeWfRlJYhyOlPfyK43CJh9iN
 Zh12Y5pfikRnS1sixVbHmGlGyfjMmCmy+3ST7kE0vgKQzQT1zoSm4RDeUTY0KfU8ZGJH
 leSw==
X-Gm-Message-State: AFqh2krkl2nlvstzN9xZbldmUy5G+pxRPnrk3fZc6SYNr8Dd3ljNsQXr
 7TbNg/hRzFRRtDztHv7p90pKLQ==
X-Google-Smtp-Source: AMrXdXvLPSUTh6RzigUlrbFiO1oNps1dw6Y2+k7nc11Zux38U0qoG44OFTl5g08v1Wi0UGsJjtpJMg==
X-Received: by 2002:a2e:9296:0:b0:27b:574b:573d with SMTP id
 d22-20020a2e9296000000b0027b574b573dmr5621509ljh.19.1672182228880; 
 Tue, 27 Dec 2022 15:03:48 -0800 (PST)
Received: from Fecusia.local (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 bg25-20020a05651c0b9900b0027fbd4ee003sm876925ljb.124.2022.12.27.15.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 15:03:41 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 28 Dec 2022 00:03:33 +0100
MIME-Version: 1.0
Message-Id: <20221227-ux500-stm32-hash-v1-1-b637ac4cda01@linaro.org>
References: <20221227-ux500-stm32-hash-v1-0-b637ac4cda01@linaro.org>
In-Reply-To: <20221227-ux500-stm32-hash-v1-0-b637ac4cda01@linaro.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
X-Mailer: b4 0.11.1
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/7] dt-bindings: crypto: Let STM32 define
	Ux500 HASH
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

This adds device tree bindings for the Ux500 HASH block
as a compatible in the STM32 HASH bindings.

The Ux500 HASH binding has been used for ages in the kernel
device tree for Ux500 but was never documented, so fill in
the gap by making it a sibling of the STM32 HASH block,
which is what it is.

The relationship to the existing STM32 HASH block is pretty
obvious when looking at the register map, and I have written
patches to reuse the STM32 HASH driver on the Ux500.

The main difference from the outside is that the Ux500 HASH
lacks the interrupt line, so some special if-clauses are
needed to accomodate this in the binding.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/crypto/st,stm32-hash.yaml  | 30 +++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
index 4ccb335e8063..681812e1c941 100644
--- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
+++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
@@ -6,12 +6,18 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: STMicroelectronics STM32 HASH
 
+description: The STM32 HASH block is built on the HASH block found in
+  the STn8820 SoC introduced in 2007, and subsequently used in the U8500
+  SoC in 2010.
+
 maintainers:
   - Lionel Debieve <lionel.debieve@foss.st.com>
 
 properties:
   compatible:
     enum:
+      - st,stn8820-hash
+      - stericsson,ux500-hash
       - st,stm32f456-hash
       - st,stm32f756-hash
 
@@ -41,11 +47,33 @@ properties:
     maximum: 2
     default: 0
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
   - clocks
-  - interrupts
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          items:
+            const: stericsson,ux500-hash
+    then:
+      properties:
+        interrupts: false
+
+  - if:
+      not:
+        properties:
+          compatible:
+            items:
+              const: stericsson,ux500-hash
+    then:
+      required:
+        - interrupts
 
 additionalProperties: false
 

-- 
2.38.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
