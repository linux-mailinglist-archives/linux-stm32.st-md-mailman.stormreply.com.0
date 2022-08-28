Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A673E5A3DBD
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Aug 2022 15:33:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74B35C640FD;
	Sun, 28 Aug 2022 13:33:40 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F78AC5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Aug 2022 13:33:39 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id u9so10992744ejy.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Aug 2022 06:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=b/btFehREFVzIjnfwZ0fR/od68XSqMjGfHOju/rQyoU=;
 b=mGwOSs8uRwcBFikc4fKzn6cA61x5ln2dvWQFrU+kdsYkjmEo0WaZUZjIKRHNRtRRN3
 qcsD1gSixY0iR9W98/wSTVXkGDCpFsEbjWbU4VEyJjLtkoiKZ+op4cWQt+B5zgbLJKuA
 uAI962pJ3qTQHXcE0S/0MG238FDGTgRiIpm+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=b/btFehREFVzIjnfwZ0fR/od68XSqMjGfHOju/rQyoU=;
 b=tc3Z2eUa8Ivy1s20VnKJbCjbo0+lGl3DFpq9HV1zXZ3z8w93X9Zth2nAB2Q6ZlRA5c
 69e5OWKmlj/64Tm5VbHoY5FCUEADgx6o5EKgMjySkG2Dbp9l4Nbtv/zoZimuwM+nDD9d
 YeIsuqaMPs87oNQze0BmyOF2qhwf7rv++uNukmBJZ0Iz3S2tQioNxMaPpOPYJsrvlb3B
 f7IVcaBicIbBMLKoWnkkiTJcSND/YdUqeF72if+DhlhIZfUk4AbgnlO3BF72yWdRfgnO
 kOf/puYpeaGpOK0meGPS0XU867drMxPzc7SAJT3k07n17LiL3Ue7O9nWF+EzVBk8iZLR
 1f7A==
X-Gm-Message-State: ACgBeo3iHRJxjsJRQ6lUYyob+MgFb0jpyqCl/AfR8zyOfl2LIw8tz5Za
 /+GJ9d5rir/KYHY0zyL9pJVGHg==
X-Google-Smtp-Source: AA6agR4bOIGmsAhChMVhMNdemmW9m88gH6GVC5wHtB5s/IJcxN+33iJUWoFivYFrRrVDuzRxW+6wmA==
X-Received: by 2002:a17:906:eec7:b0:733:189f:b07a with SMTP id
 wu7-20020a170906eec700b00733189fb07amr10600791ejb.230.1661693619043; 
 Sun, 28 Aug 2022 06:33:39 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-31-31-9.retail.telecomitalia.it. [79.31.31.9])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a1709064ada00b007313a25e56esm3247669ejt.29.2022.08.28.06.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 06:33:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 28 Aug 2022 15:33:26 +0200
Message-Id: <20220828133329.793324-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220828133329.793324-1-dario.binacchi@amarulasolutions.com>
References: <20220828133329.793324-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eric Dumazet <edumazet@google.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh+dt@kernel.org>, linux-can@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Paolo Abeni <pabeni@redhat.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 "David S. Miller" <davem@davemloft.net>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [Linux-stm32] [RFC PATCH v3 1/4] dt-bindings: net: can: add STM32
	bxcan DT bindings
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

Add documentation of device tree bindings for the STM32 basic extended
CAN (bxcan) controller.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Remove 'Dario Binacchi <dariobin@libero.it>' SOB.
- Add description to the parent of the two child nodes.
- Move "patterProperties:" after "properties: in top level before "required".
- Add "clocks" to the "required:" list of the child nodes.

Changes in v2:
- Change the file name into 'st,stm32-bxcan-core.yaml'.
- Rename compatibles:
  - st,stm32-bxcan-core -> st,stm32f4-bxcan-core
  - st,stm32-bxcan -> st,stm32f4-bxcan
- Rename master property to st,can-master.
- Remove the status property from the example.
- Put the node child properties as required.

 .../bindings/net/can/st,stm32-bxcan.yaml      | 142 ++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml

diff --git a/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml b/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
new file mode 100644
index 000000000000..3278c724e6f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
@@ -0,0 +1,142 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/can/st,stm32-bxcan.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics bxCAN controller
+
+description: STMicroelectronics BxCAN controller for CAN bus
+
+maintainers:
+  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
+
+allOf:
+  - $ref: can-controller.yaml#
+
+properties:
+  compatible:
+    description:
+      It manages the access to the 512-bytes SRAM memory shared by the
+      two bxCAN cells (CAN1 master and CAN2 slave) in dual CAN peripheral
+      configuration.
+    enum:
+      - st,stm32f4-bxcan-core
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  clocks:
+    description:
+      Input clock for registers access
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^can@[0-9]+$":
+    type: object
+    description:
+      A CAN block node contains two subnodes, representing each one a CAN
+      instance available on the machine.
+
+    properties:
+      compatible:
+        enum:
+          - st,stm32f4-bxcan
+
+      st,can-master:
+        description:
+          Master and slave mode of the bxCAN peripheral is only relevant
+          if the chip has two CAN peripherals. In that case they share
+          some of the required logic, and that means you cannot use the
+          slave CAN without the master CAN.
+        type: boolean
+
+      reg:
+        description: |
+          Offset of CAN instance in CAN block. Valid values are:
+            - 0x0:   CAN1
+            - 0x400: CAN2
+        maxItems: 1
+
+      interrupts:
+        items:
+          - description: transmit interrupt
+          - description: FIFO 0 receive interrupt
+          - description: FIFO 1 receive interrupt
+          - description: status change error interrupt
+
+      interrupt-names:
+        items:
+          - const: tx
+          - const: rx0
+          - const: rx1
+          - const: sce
+
+      resets:
+        maxItems: 1
+
+      clocks:
+        description:
+          Input clock for registers access
+        maxItems: 1
+
+    additionalProperties: false
+
+    required:
+      - compatible
+      - reg
+      - interrupts
+      - resets
+      - clocks
+
+required:
+  - compatible
+  - reg
+  - resets
+  - clocks
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32fx-clock.h>
+    #include <dt-bindings/mfd/stm32f4-rcc.h>
+
+    can: can@40006400 {
+        compatible = "st,stm32f4-bxcan-core";
+        reg = <0x40006400 0x800>;
+        resets = <&rcc STM32F4_APB1_RESET(CAN1)>;
+        clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN1)>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        can1: can@0 {
+            compatible = "st,stm32f4-bxcan";
+            reg = <0x0>;
+            interrupts = <19>, <20>, <21>, <22>;
+            interrupt-names = "tx", "rx0", "rx1", "sce";
+            resets = <&rcc STM32F4_APB1_RESET(CAN1)>;
+            clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN1)>;
+            st,can-master;
+        };
+
+        can2: can@400 {
+            compatible = "st,stm32f4-bxcan";
+            reg = <0x400>;
+            interrupts = <63>, <64>, <65>, <66>;
+            interrupt-names = "tx", "rx0", "rx1", "sce";
+            resets = <&rcc STM32F4_APB1_RESET(CAN2)>;
+            clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN2)>;
+        };
+    };
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
