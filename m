Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA5667A77C
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jan 2023 01:23:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 702F4C65E4B;
	Wed, 25 Jan 2023 00:23:21 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D333C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 00:23:20 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id vw16so43475727ejc.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 16:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IhJRzXVyFbYsW9+EPTTFmUQre+ecqTHVuxtlkf1ZhBo=;
 b=KCLc7tjuPxwl5JW8yMLr1Wn5U5TnOHXpJR9NXS35wGwpcxF92n6GwN6d2xeH3QzBrU
 4WAG5bmWef/Pu9BseaRWJIdThGWZUghD1/mykmTHdHyUNMMUPv5yKRdM2LqG/f5iCYtm
 6HCjTLZJF3O29/qVTTMGYJymLcJEvX0M0G8iT0jKLteUVJGi06JmvEXGBsp3olwYz95A
 D7gOtlA4y4SqhHcejKrZK41ioSnnOL/8y4AjT0QJ851q9johTHIgv30clTX1wW5iBTgm
 PRHADWXI1A4mEBUAfuQ8hWdCO5tIm1Rx0SZ1Bq5vTPcQ1WsljCaAYNtJJ5AWQazQ+r5c
 q4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IhJRzXVyFbYsW9+EPTTFmUQre+ecqTHVuxtlkf1ZhBo=;
 b=YYF4JH2nyQJ1ln407SJQzwRi9y1NgVTf8fAFWSRQ6peDpK0KtR3dKOtv/dHuDVJRJo
 5mnAWRNQOUDFwV9MS5GXdDv2HqSaaJn0HWjN2kzD1ODb6ldXDxyTwS4va0U0PifTrcQU
 FZUHoXQrh8OFjqXDgXGQwSmebN77g3PaK9/zzm6L0HMnIw8selgJUbK+TywUPisSQy8N
 5LhBCstE3Opx1FCmLqX8Il0asar+gN/GHvcD+NtaCWOKltIuSHSMOXr1vgFBW1UAOw22
 20+WYUDwliFsAZSdI5K+vGFpmXP2H4R8s4Vx7/x3+da3n45lCOdrDUnlCSPiAyTb1tO3
 oGaw==
X-Gm-Message-State: AFqh2kqy6qlSxEzW4a1BAT5scnyJ+kUbdfbUZpLX0+MDmsxuOH0xSHnc
 jY+NaMXGCtmIXrT6QZGiW6UNKQ==
X-Google-Smtp-Source: AMrXdXvS1BAG+73sw122jBVVgFvXv4BoWPsK0NmBVj0lSa1oJW1cWbomQQG6e+x6UomqF0DgG/FF/Q==
X-Received: by 2002:a17:907:9252:b0:86e:d832:2f60 with SMTP id
 kb18-20020a170907925200b0086ed8322f60mr27013282ejb.48.1674606199621; 
 Tue, 24 Jan 2023 16:23:19 -0800 (PST)
Received: from fedora.local (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 if10-20020a170906df4a00b00738795e7d9bsm1584606ejc.2.2023.01.24.16.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 16:23:19 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 25 Jan 2023 01:23:06 +0100
MIME-Version: 1.0
Message-Id: <20221227-ux500-stm32-hash-v3-1-32ee12cd6f06@linaro.org>
References: <20221227-ux500-stm32-hash-v3-0-32ee12cd6f06@linaro.org>
In-Reply-To: <20221227-ux500-stm32-hash-v3-0-32ee12cd6f06@linaro.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
X-Mailer: b4 0.11.1
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 1/6] dt-bindings: crypto: Let STM32 define
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Pick up Rob's review tag.
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
