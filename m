Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6376C9685
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Mar 2023 18:03:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 759D3C6A603;
	Sun, 26 Mar 2023 16:03:35 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10D41C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Mar 2023 16:03:34 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id cn12so26302427edb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Mar 2023 09:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1679846613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kod5siM2bcM+dDVpz/GqL4BGUBIqfHoecSZkZ5xWujI=;
 b=Gye0T3mSAKu/KCA7d5RgF9fsYyJyVd7lXQsidrgXH1Eqo9gF2PE/PPbrxMmlQInLqC
 iKPHp+t5NVovkxeF0juFb89cE3w/SDzS4Oo2nzAnebcqo231WqHli0FKbvnYde0hGgvA
 jf9xgfbPJWb6+txtWcg/cbaOJN3qd5uYt1wYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679846613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kod5siM2bcM+dDVpz/GqL4BGUBIqfHoecSZkZ5xWujI=;
 b=C7NoeEEtTvJglrggg3bVghdFhd29c3u+0/kb1g+0J2L6JNSusjH3A99fJF0wtnFTKi
 H0iDByhbL4tnESTPI0sLJNsKshTYGogCk9Gi7ab3+PSyArQlHUa2/e8Ncv6YapthqR0K
 QyXFEABcesZ4spebQP0J51I9CX9h80YnDYFmW/V4G0vVs165Ma1jEMBQTAJAc83+guvk
 ZhjYFpfNKFhFUKqvkU5AUrkDJNr8sIWM/DiPHrBebyKrBYVKiZadWcSNyNU7gTEsOgnj
 2B6MvKNhhfLq4GfciM+wO0s0NX5waficSCFOQta1pgClHM0IJ0lLgrsPuKa/hdLgiuKZ
 qEsg==
X-Gm-Message-State: AAQBX9dZ8hhSLdr1NIBZFqWBFt/uE/6sJnjTWpw3gcVNpUxr+0RtSS0f
 eIbVl4LEn0iYyO3b71PTi/AXnPJS8lL1viuMxDiQHA==
X-Google-Smtp-Source: AKy350arxolBk/vjSQQ0TyraUQbcc8oXTrnHf+4lTyfT1Ri3vZx2dafkX3KmSoc900oU6UxNnr3/IQ==
X-Received: by 2002:aa7:cd8d:0:b0:4fe:1b62:4741 with SMTP id
 x13-20020aa7cd8d000000b004fe1b624741mr8976237edv.28.1679846613613; 
 Sun, 26 Mar 2023 09:03:33 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-0-102-254.retail.telecomitalia.it. [87.0.102.254])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a50d7c2000000b00501fc87352fsm6869333edj.13.2023.03.26.09.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 09:03:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 26 Mar 2023 18:03:22 +0200
Message-Id: <20230326160325.3771891-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230326160325.3771891-1-dario.binacchi@amarulasolutions.com>
References: <20230326160325.3771891-1-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [PATCH v8 2/5] dt-bindings: net: can: add STM32 bxcan
	DT bindings
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
Reviewed-by: Rob Herring <robh@kernel.org>

---

(no changes since v5)

Changes in v5:
- Add Rob Herring's Reviewed-by tag.

Changes in v4:
- Remove "st,stm32f4-bxcan-core" compatible. In this way the can nodes
 (compatible "st,stm32f4-bxcan") are no longer children of a parent
  node with compatible "st,stm32f4-bxcan-core".
- Add the "st,gcan" property (global can memory) to can nodes which
  references a "syscon" node containing the shared clock and memory
  addresses.

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

 .../bindings/net/can/st,stm32-bxcan.yaml      | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml

diff --git a/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml b/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
new file mode 100644
index 000000000000..c9194345d202
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
@@ -0,0 +1,83 @@
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
+      - st,stm32f4-bxcan
+
+  st,can-master:
+    description:
+      Master and slave mode of the bxCAN peripheral is only relevant
+      if the chip has two CAN peripherals. In that case they share
+      some of the required logic.
+    type: boolean
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: transmit interrupt
+      - description: FIFO 0 receive interrupt
+      - description: FIFO 1 receive interrupt
+      - description: status change error interrupt
+
+  interrupt-names:
+    items:
+      - const: tx
+      - const: rx0
+      - const: rx1
+      - const: sce
+
+  resets:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  st,gcan:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description:
+      The phandle to the gcan node which allows to access the 512-bytes
+      SRAM memory shared by the two bxCAN cells (CAN1 master and CAN2
+      slave) in dual CAN peripheral configuration.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - resets
+  - clocks
+  - st,gcan
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32fx-clock.h>
+    #include <dt-bindings/mfd/stm32f4-rcc.h>
+
+    can1: can@40006400 {
+        compatible = "st,stm32f4-bxcan";
+        reg = <0x40006400 0x200>;
+        interrupts = <19>, <20>, <21>, <22>;
+        interrupt-names = "tx", "rx0", "rx1", "sce";
+        resets = <&rcc STM32F4_APB1_RESET(CAN1)>;
+        clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN1)>;
+        st,can-master;
+        st,gcan = <&gcan>;
+    };
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
