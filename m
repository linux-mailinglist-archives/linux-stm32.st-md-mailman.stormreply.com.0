Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C4259AC93
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Aug 2022 10:30:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8BF4C64100;
	Sat, 20 Aug 2022 08:30:08 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB2D5C640FF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Aug 2022 08:30:06 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id gt3so220036ejb.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Aug 2022 01:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=HLh67C/o4C2BwENLXIMxr20ywGIxfeZ/JS1OF1ffbiQ=;
 b=Got7h1ZKfDUESy2e1P4v1odWn0gRNpD298bKZwk4I2438GlURZNLLbUT3g33Wdes5k
 qdxWKBnCzq8T43p8Dr6HPBAle7iszHXY7pkVlja/zpGGJgpB2evAfQjlssvuAG+/X+Gk
 FTdxuSZekcTPI8IbnYyxVWb6t76MfgDjVvK0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=HLh67C/o4C2BwENLXIMxr20ywGIxfeZ/JS1OF1ffbiQ=;
 b=DKQQPx+ufFQCrafnzcmjy1A859/514svbzZbrV34tOAuvZHWtSiK+d1+Hx+QjZaN4D
 B12ZoLlM1CJt2mABAtmx2LzCE/MXo3bDD6ZAhtaxnT5F5c18mAGMLMdeXSjNQmqXX1+e
 1hYnOFvxyJbRW7RE5XRswcMHiyeUJ6C3xIYgzrLcS+AM8nZkDC8EOsX6O3A6ln9ygmxX
 1r2+ae88funUvJ9EmvXhuC+mtOhPdusFr3dKL7qrf2gmlZv7s+OTDYMjAvV2MeZPlUbB
 0jAKbCbDxuG98s9VDuuNCJYK3KR70wo9SddR3yKWY0YwjX3evkgVD+4aByX9HJ2hiugE
 PufQ==
X-Gm-Message-State: ACgBeo0yelqcSKC7WAJJqlD01VC3BA6NBhpeIoQ4d6n4BSypdC50GiUT
 Kto079dI570kttEztJ9mc6voFQ==
X-Google-Smtp-Source: AA6agR7J/eXfs3hdUgESd/tx1X0k/lOEzd5dY2aCf6mu5lT6lH0X1oBlNH6N9tRXNvPgDSVgWlYiUA==
X-Received: by 2002:a17:907:c18:b0:731:65f6:1f29 with SMTP id
 ga24-20020a1709070c1800b0073165f61f29mr6965935ejc.577.1660984206468; 
 Sat, 20 Aug 2022 01:30:06 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-31-31-9.retail.telecomitalia.it. [79.31.31.9])
 by smtp.gmail.com with ESMTPSA id
 gx14-20020a1709068a4e00b0072b33e91f96sm3336112ejc.190.2022.08.20.01.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Aug 2022 01:30:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sat, 20 Aug 2022 10:29:33 +0200
Message-Id: <20220820082936.686924-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220820082936.686924-1-dario.binacchi@amarulasolutions.com>
References: <20220820082936.686924-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 linux-can@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 "David S. Miller" <davem@davemloft.net>, Dario Binacchi <dariobin@libero.it>
Subject: [Linux-stm32] [RFC PATCH v2 1/4] dt-bindings: net: can: add STM32
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

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Change the file name into 'st,stm32-bxcan-core.yaml'.
- Rename compatibles:
  - st,stm32-bxcan-core -> st,stm32f4-bxcan-core
  - st,stm32-bxcan -> st,stm32f4-bxcan
- Rename master property to st,can-master.
- Remove the status property from the example.
- Put the node child properties as required.

 .../bindings/net/can/st,stm32-bxcan.yaml      | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml

diff --git a/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml b/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
new file mode 100644
index 000000000000..288631b5556d
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
@@ -0,0 +1,136 @@
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
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - resets
+  - clocks
+  - '#address-cells'
+  - '#size-cells'
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
