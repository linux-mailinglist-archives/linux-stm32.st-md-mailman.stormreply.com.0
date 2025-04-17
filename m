Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66629A9211E
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Apr 2025 17:16:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 146EDC78F74;
	Thu, 17 Apr 2025 15:16:51 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11C8AC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Apr 2025 15:16:49 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-39c266c1389so705044f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Apr 2025 08:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744903009; x=1745507809;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G+Z5tO3GODKfqrnPsiikglYSIdtJzrzy+9eK4sw+PJo=;
 b=DUJukuR/ht56y9Lf9i1OYJYc98GEiob8cCSXLZgKLDo52J6uzvo9bNghhQ8AnArDdK
 ZniiEX9+eJeKsGegGjANC06kmPg+FOJhltyckVwsZh5oCvxbESWSKIBNQB74DoEq/7po
 oT22Pq+FGk5fhH7hl9hi0b7vLUeUs1p4m/s2EMSVg/p8OW5D2iVKgO4RDULGXVgOpBXD
 CQBaYPQ2Qkya5F36z62G7ANYj3mD0gPV6TBvlslLzKqkrBCxTdwGdhHG9pvvgudzqv4S
 g3VEjdc+eZHaWxDXzBzz1El2Q1yP/T+Nh/IKRBKSlPeCHSHp2XUfLPxsljSxiKZsiJ9l
 Plcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744903009; x=1745507809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G+Z5tO3GODKfqrnPsiikglYSIdtJzrzy+9eK4sw+PJo=;
 b=qsV2Kd6R32WM783/nSsQCgVcrGlNtNUxLgToQ02SvAgWegK9SGlQfGTtJe2eqeucRA
 HoB95/GUbousJODg2rTGM9hFEpuYJ9//Pzg4o7P+LEhNbf23KTM9L8zhdG8wOmUQdf/5
 8TfXj8TWkQW2rBVjgcdG77cGiy/1BnZIwh8K46rVhY31+0T5ElMo4cgvryLdFG7SQjYb
 SP7c8c/lVhcSRZWQckIAOApCfM9fyxbVP2rfyS/fxEKTS3Mb+7/VNMUm69MlMgasCIf1
 2EDOvJWbBhmpBLMktn8EvUKzCTrZxcd/QgDdbiUrNqXngiMcwqDMxhpK4/5bspXyoGUb
 1TWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXSGrtb1yD4IHP9SgL/lmG6yhxXEUZyVaJWjny3HFUEjXMlPOnsuQtdpMIRu/Cp7mVFSv1FxwNNtGeNg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyjfMS8RWW+yrVSn5UuxZka1lb/FhaOExpYYXr9fMQP6q8Gm1u+
 lON26xN46rTNSEHiE/8urBkai9rPq23Kc6UAdvnoKmhzghv8nGPvFfp3aMSrOjY=
X-Gm-Gg: ASbGncuTTyKWLuE7uCwFucjFVQoO6jbgdgRWj5W1igXiyWuPvkdQNPNLWvaBp6uDlXs
 QHwjzOBIKMospLhSwiOkeDzxhM9mNkxShVZwMrQP8hlHsnBRDwmzE00TwcLJWVj+X1uX99jEpOK
 UKpVRoKKKIr1KP78a4yWdr4vtaxvn6Vsdrk3gNDW/flliXO6E4j8A9qGL21UalLXjQSfBlEoW8O
 1ienYcURUNY/tn8RyHJDMtYj1Go46WYlx2b/JnXIg2ITAeR6sQPytqhKUArdGWj2JU5MbtTwvF+
 ImW1TgA4tjiDcRZc2rFmHWEFExj1KEZqo+1PYeO9pENk/YeRIvJkQDHgfjtZzYImy3k=
X-Google-Smtp-Source: AGHT+IFZYzUX82Ksuo0S1uAg+PqHG6T59fFdOzMPnqwGCV02MTZaP2xSEO83gicXA+9vGukmp3V9xw==
X-Received: by 2002:a05:6000:4014:b0:391:3aab:a7d0 with SMTP id
 ffacd0b85a97d-39ee5b19f5cmr4872897f8f.19.1744903009074; 
 Thu, 17 Apr 2025 08:16:49 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf445315sm20528346f8f.82.2025.04.17.08.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 08:16:48 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Date: Thu, 17 Apr 2025 17:16:18 +0200
Message-ID: <20250417151623.121109-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417151623.121109-1-daniel.lezcano@linaro.org>
References: <20250417151623.121109-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 S32@nxp.com, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Larisa.Grigore@nxp.com,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, thomas.fossati@linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 ghennadi.procopciuc@nxp.com,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH v5 1/2] dt-bindings: timer: Add NXP System
	Timer Module
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

Add the System Timer Module description found on the NXP s32 platform
and the compatible for the s32g2 variant.

Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../bindings/timer/nxp,s32g2-stm.yaml         | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml

diff --git a/Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml b/Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml
new file mode 100644
index 000000000000..b44b9794bb85
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/nxp,s32g2-stm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP System Timer Module (STM)
+
+maintainers:
+  - Daniel Lezcano <daniel.lezcano@kernel.org>
+
+description:
+  The System Timer Module supports commonly required system and application
+  software timing functions. STM includes a 32-bit count-up timer and four
+  32-bit compare channels with a separate interrupt source for each channel.
+  The timer is driven by the STM module clock divided by an 8-bit prescale
+  value.
+
+properties:
+  compatible:
+    oneOf:
+      - const: nxp,s32g2-stm
+      - items:
+          - const: nxp,s32g3-stm
+          - const: nxp,s32g2-stm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Counter clock
+      - description: Module clock
+      - description: Register clock
+
+  clock-names:
+    items:
+      - const: counter
+      - const: module
+      - const: register
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    timer@4011c000 {
+        compatible = "nxp,s32g2-stm";
+        reg = <0x4011c000 0x3000>;
+        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+        clock-names = "counter", "module", "register";
+    };
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
