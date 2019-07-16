Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 269386B16C
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jul 2019 23:56:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8D78C5978F
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jul 2019 21:56:22 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B69AC5978A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jul 2019 21:56:21 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id q22so42503765iog.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jul 2019 14:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kADd+NQKUgWUED+820fdDO7gVP7dDmGj1gYm9p5p3sw=;
 b=iK5+gUTflzBuWpZU9JiMMw7vR67JYG6a2baQ9U4U8Kb2DiV8EXaPgBKvxyt4zpcWbj
 gSUx9PCZhJjra4oPvWskcLtOf+9ZNj2ZgeQMp9Vrp1Ia5dPlGJ5NiPzM65AhdZr5T6OT
 nhrz6A/PBhqQPPCpP82DH8hbJbIHxkgQiVFEdRTxBwSFyZDFoJwSjdnS3HX0rqysIIT1
 h4bivVJVaAAyJkt9DK0VRNcXLY8xV8eyjz1/wwWTJKXv+2REeZtVB866BVoRTES9kvhA
 xi0WwQYTwHv5D0iIlITGu4zNQV0Bd6W9ZLjh9kLkWvyJ9Y4N6IHGECiYnKqC9Zj6eS+S
 Y+9Q==
X-Gm-Message-State: APjAAAUpX26yDY/PxXGL4mN5tkFCQ97zcsTIdFNye8SBEp2KwqE7HewO
 2Gdv9Bvbg42ahgGqqDqzQg==
X-Google-Smtp-Source: APXvYqwDMRb0ggHvOfuex4HW4eSe1qMvzAf6AwQILMzFafLTkg23I/dov4glX6kdigbpojvrSAFSjQ==
X-Received: by 2002:a5e:d51a:: with SMTP id e26mr26126978iom.71.1563314179727; 
 Tue, 16 Jul 2019 14:56:19 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id f17sm20074646ioc.2.2019.07.16.14.56.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 14:56:19 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Jul 2019 15:56:18 -0600
Message-Id: <20190716215618.29757-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: pinctrl: stm32: Fix missing
	'clocks' property in examples
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

Now that examples are validated against the DT schema, an error with
required 'clocks' property missing is exposed:

Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.example.dt.yaml: \
pinctrl@40020000: gpio@0: 'clocks' is a required property
Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.example.dt.yaml: \
pinctrl@50020000: gpio@1000: 'clocks' is a required property
Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.example.dt.yaml: \
pinctrl@50020000: gpio@2000: 'clocks' is a required property

Add the missing 'clocks' properties to the examples to fix the errors.

Fixes: 2c9239c125f0 ("dt-bindings: pinctrl: Convert stm32 pinctrl bindings to json-schema")
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 3ac5d2088e49..91d3e78b3395 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -197,6 +197,7 @@ required:
 examples:
   - |
     #include <dt-bindings/pinctrl/stm32-pinfunc.h>
+    #include <dt-bindings/mfd/stm32f4-rcc.h>
     //Example 1
       pinctrl@40020000 {
               #address-cells = <1>;
@@ -210,6 +211,7 @@ examples:
                       #gpio-cells = <2>;
                       reg = <0x0 0x400>;
                       resets = <&reset_ahb1 0>;
+                      clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOA)>;
                       st,bank-name = "GPIOA";
               };
        };
@@ -227,6 +229,7 @@ examples:
                       #gpio-cells = <2>;
                       reg = <0x1000 0x400>;
                       resets = <&reset_ahb1 0>;
+                      clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOB)>;
                       st,bank-name = "GPIOB";
                       gpio-ranges = <&pinctrl 0 0 16>;
               };
@@ -236,6 +239,7 @@ examples:
                       #gpio-cells = <2>;
                       reg = <0x2000 0x400>;
                       resets = <&reset_ahb1 0>;
+                      clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOC)>;
                       st,bank-name = "GPIOC";
                       ngpios = <5>;
                       gpio-ranges = <&pinctrl 0 16 3>,
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
