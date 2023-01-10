Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B9C664C36
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Jan 2023 20:19:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5FC8C69055;
	Tue, 10 Jan 2023 19:19:36 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59C1AC65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jan 2023 19:19:35 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id bf43so20039660lfb.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jan 2023 11:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ts8pg88W1SqtrgDHeZ4rSJsGAKw1h4BEAKukVwN8v3k=;
 b=SYtpocZKmQuNT/cicSsVXpir68fDa2z7z+EAUU6wwuQugpXbj7qS/eV7elXgrOdXzG
 y2VDDM9KRO4d3cg9VSYhTGYCBTmkB0SIUuTkQ85SjoBCBP08s9xPRvg4+KEHhPMlPAWi
 09WVmjPlfr4Q7yQ+yQYW1C0IoLAdSVC7XaxnLf17RM4UBOtBVS5ZR+ne5KYMWMVrEo1o
 oM8pQ4aZQS5lSKzCixfby8C6vO2POe8cGqKOExqjnJfV8IxeOD7t0R7WC+Hw6PKtyHhi
 LPT4U0q3q+F5Hd7xt8yfC/Ox7MIQvd4PX3BWBqId7XMaOl1aTjQPuBiDo1+kZQ1MgALY
 WjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ts8pg88W1SqtrgDHeZ4rSJsGAKw1h4BEAKukVwN8v3k=;
 b=3nCHIkwPc6m/JpCAekiy7/j9eqI3Vi4zobRiC7zHp5ErBfO4mQnqLGR7MUXV/WRrdh
 bU+42l108NA7Pe0zvqT9/DkrgSYaDmXgK7C97d3QIUrt/vLqq/wZBGTdAbQ4+M4CCIIV
 5dKQEPib5h6hEXnw1xAZ6MCo4BI3O6g3gdJXonTO6/5/CvBVddO2tpuBZ/b0fVfUw/w5
 s9Gl7V7W9O8s+ET9xgplXbymu6wQOWTE83njBA9a264Qk4bPTKBEbNZAoLlvx3kc13kJ
 A6B6U3A71pL7V7uuonlK2dzruoncb2b6vANSOKbjdjpjsQyPSEJ4bhYMcJ8YRgbPwRX1
 jflA==
X-Gm-Message-State: AFqh2kpYim76BfWwJXDc8g9HZFWrWaYExssZP8Wj+pn4nb2OVOT0aRBa
 Fpef5QRSqc1y3uNGeH9nILQB1A==
X-Google-Smtp-Source: AMrXdXsu5gKMcq/XNjBnXZSELLg6daB3YeKbqTWkcPPos88PhXSEz+HeSC+wiccc3koNOZ1lhkQngw==
X-Received: by 2002:a05:6512:e9f:b0:4cb:3b24:8390 with SMTP id
 bi31-20020a0565120e9f00b004cb3b248390mr10706584lfb.59.1673378374793; 
 Tue, 10 Jan 2023 11:19:34 -0800 (PST)
Received: from Fecusia.local (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 x28-20020a056512131c00b004b549ad99adsm2297725lfu.304.2023.01.10.11.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 11:19:34 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jan 2023 20:19:12 +0100
MIME-Version: 1.0
Message-Id: <20221227-ux500-stm32-hash-v2-1-bc443bc44ca4@linaro.org>
References: <20221227-ux500-stm32-hash-v2-0-bc443bc44ca4@linaro.org>
In-Reply-To: <20221227-ux500-stm32-hash-v2-0-bc443bc44ca4@linaro.org>
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
Subject: [Linux-stm32] [PATCH v2 1/6] dt-bindings: crypto: Let STM32 define
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
ChangeLog v1->v2:
- Use an else construction instead of if/if not.
---
 .../devicetree/bindings/crypto/st,stm32-hash.yaml  | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
index 4ccb335e8063..b767ec72a999 100644
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
 
@@ -41,11 +47,26 @@ properties:
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
+    else:
+      required:
+        - interrupts
 
 additionalProperties: false
 

-- 
2.39.0
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
