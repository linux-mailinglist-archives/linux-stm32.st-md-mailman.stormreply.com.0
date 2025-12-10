Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D44CB1F71
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Dec 2025 06:25:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E69EC5F1FA;
	Wed, 10 Dec 2025 05:25:22 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1953C5F1D9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Dec 2025 05:25:20 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso4651265e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Dec 2025 21:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765344320; x=1765949120;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4cI6o8go+UXL/S5TqQXusywCs+KEzzJC/G+A907W08g=;
 b=CU7jCuYVMrnumn+8QHiy2mUgzmrZynpJ4dySanrfWpKoxUxHjEOlk4djzJKayCE2Yv
 QBXJ83JsQCLZWMNxrL8IH9qcS3hXUFhtcYH+tqv8nDLwvEzdEao7ur5MUHtphOPz9lg7
 bo3xdt+dMSKfhm97L38dOkMwcEFuRf1Ve0wjgB3lzd5QcsQC+x3eHd4gPB6AhqEpE21L
 4BsWeVtpTpo/bxU0LtaAQ0pdeHTdeA9yjRT+VYc1mKH5+ZQcnCm0ozuwW8QmBKMRSPkj
 MTMNr1l3MabMfNKZBxvBUfzWRZ2jpXDqmnTXDNii/05jRWSydU723tho8t81XOw9IoRG
 fIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765344320; x=1765949120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4cI6o8go+UXL/S5TqQXusywCs+KEzzJC/G+A907W08g=;
 b=onLbIzWc9ftC+bhUm+izY8b2nNH7oKYjJEh/AI0VC+Aim1Oxd24Eb7svd3hCmcjEqt
 orXM8GoOpuT+zPeLFuUomMt87Djc3C5PuHOfbhS2ZCctMbyFm5FK/hlabAb6WW+gZXqr
 r/Z/5CuAiWudt+q+a0jRWGiEw1XYcTAD+HNjbQsfDeTr+dFkf3/eZ+kPFQ7XscyoOYia
 //Rw98SWihOk/Pb7hvo6TCgUC0pxE8NRTPHfXLXJEmCVyWkSLsnczVsr9OWY8OSj478K
 EOxZVnA0+aGfE9o8TZdZ/QM8eqN5K4+1drDGdfunrv20Xppvs/hGSkVWF8fhPyMc0jzO
 EAPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULyRnmi1/7sHf/CkaKwu+JtXjFXyom5N5/F8p5GsTmb+JFH4THCZNFQJKyM73czrc70Yhkyq1QNqmiYQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzB3mhC22iWvUqnddnSX5RCavZRnaVH++Y4jScGjiUXFGApFp5a
 QErY69+dceMsZyP9bxC48NW0cxmip5dYoTnvDs5y6EJhdbC2V05tkdBqIZCl9iIISgA=
X-Gm-Gg: ASbGncvuMkKt1IRuDmG+BaYHtt+keAxSQDwx30wOUn8VbGKdtiR0hv1drriBV4lRQX0
 +H/7xm06NG6nLZA4VC9qh/9fCaHblhQlg9hXEEM2lIa4foHaMJZ722cJzK332M/8eI/I4x/hkNR
 r1mG79x65wACbUFdMhG82Lxm+ie/6e0uBx9Q9+r4JwjHWrHweqAXJ7qFA9vbSrZA/NehRogZIMj
 f2xih0csZhwlinPcUdqetwtY9NaDZ/HlJRe02NYgnmK528qQpeqcZJCucTY8+Js6OyIGJJMu+pY
 yPz/tm67ID79/PRY8Qkmg7JMV4n2aKb7Adk4xABloopjOtXnZ3qP89l4w2slGD3mlquv86pWKkH
 66xYXLXaIptyFMvgdLn8pew13C7WaKCPzRdia37VGYfQZhFAJN4gmS+JMqYl5gRnEqhe+L57UIk
 EQmtIiv+h5Eg0j70GnPThg8BNs5pYmYyQ=
X-Google-Smtp-Source: AGHT+IFm2uRrTxNeE4MWzwAU4VluA6mvY1no+6jYZZ3xTzIhUq0RwCW0mb7k9rZckuaKaPuIe8SKTw==
X-Received: by 2002:a05:600c:4e92:b0:479:2a78:4a2e with SMTP id
 5b1f17b1804b1-47a838d1688mr9398385e9.7.1765344320173; 
 Tue, 09 Dec 2025 21:25:20 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:4fde:b93c:87db:86e6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a7d3a75a3sm33485695e9.6.2025.12.09.21.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Dec 2025 21:25:19 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wbg@kernel.org, robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
Date: Wed, 10 Dec 2025 06:24:46 +0100
Message-ID: <20251210052449.4154283-3-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210052449.4154283-1-daniel.lezcano@linaro.org>
References: <20251210052449.4154283-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, s32@nxp.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH v2 2/3] dt-bindings: counter: Add NXP System
	Timer Module Counter
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
when it is used as a counter and the compatible for the s32g2 variant.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../bindings/counter/nxp,s32g2-stm-cnt.yaml   | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/counter/nxp,s32g2-stm-cnt.yaml

diff --git a/Documentation/devicetree/bindings/counter/nxp,s32g2-stm-cnt.yaml b/Documentation/devicetree/bindings/counter/nxp,s32g2-stm-cnt.yaml
new file mode 100644
index 000000000000..4d42996f5ad3
--- /dev/null
+++ b/Documentation/devicetree/bindings/counter/nxp,s32g2-stm-cnt.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/counter/nxp,s32g2-stm-cnt.yaml#
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
+  The counter is driven by the STM module clock divided by an 8-bit prescale
+  value.
+
+properties:
+  compatible:
+    oneOf:
+      - const: nxp,s32g2-stm-cnt
+      - items:
+          - const: nxp,s32g3-stm-cnt
+          - const: nxp,s32g2-stm-cnt
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
+        compatible = "nxp,s32g2-stm-cnt";
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
