Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D578A6013B6
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Oct 2022 18:43:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 875B7C64115;
	Mon, 17 Oct 2022 16:43:01 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A057AC64115
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 16:43:00 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id r17so26223156eja.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 09:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D8/Md0NYJHUSKcz4MJWTxhKaskWW/ctRpyjjxqRRhnc=;
 b=MQqDeGmhfaHZojh/XCQv+q0XPLUePi2WVRcWzhdqpgGDSn7KUvowytrva0axseL/ji
 xFupNRehAAon4c1+nVPE/xoPe6KgppDovn6S/iPc/V3rXsNGUDXAhfEzh9vrISPv125c
 /MyBHlaX9dwHOEVkV7139J8m2mMI6t+LHst9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D8/Md0NYJHUSKcz4MJWTxhKaskWW/ctRpyjjxqRRhnc=;
 b=3zcCuEJf2YXkMynyzy9h5qEeYhNCd3mbXLxTUEMbmYdNxAjX8xNFFNb8w/4/x/lVBv
 iBUoh5eYYQrzb9ggnp0TsdKzMn8iLOvk80k7tkoAY8IFV5fW2lN52OjfogablXt5vf3B
 hiDbPbSTEYAud1mz/U2hYInlSertLUEKxb+IbuN07vLLfUDSzyl6tH74t3d+68b/Uy87
 TqxMxOkm//2Hjah6GDD2vFzeSGytSFcCS5NPAE5ov9kpu/s6Bxk83O1GNR34Gh1Q8hUK
 pA8mUr3dmJe85K4kmhIGqEdZbxFi60o0IMs4oEuRlL/72V/LlyUhRBE8+kxycG5RlC/0
 F9UQ==
X-Gm-Message-State: ACrzQf3ub2lvymr7d3X83djd824e84gco334QKAgAoOwdqdffnqgyO/Q
 nwKMpaQyrcTS7ffhmsnLtD5ihA==
X-Google-Smtp-Source: AMsMyM4L9wY21ugyePula3Hn8+jlnnouENgEU5TksoZ1/0mR1jpO4wtiDo/MgxHzz1DX9CscFJ/4Ew==
X-Received: by 2002:a17:907:d9e:b0:78e:2ff7:72f4 with SMTP id
 go30-20020a1709070d9e00b0078e2ff772f4mr9016694ejc.608.1666024980203; 
 Mon, 17 Oct 2022 09:43:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-244-101-110.retail.telecomitalia.it. [95.244.101.110])
 by smtp.gmail.com with ESMTPSA id
 a24-20020a1709063a5800b0078128c89439sm6437388ejf.6.2022.10.17.09.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 09:42:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 17 Oct 2022 18:42:28 +0200
Message-Id: <20221017164231.4192699-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20221017164231.4192699-1-dario.binacchi@amarulasolutions.com>
References: <20221017164231.4192699-1-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [RFC PATCH v5 2/5] dt-bindings: net: can: add STM32
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
Reviewed-by: Rob Herring <robh@kernel.org>

---

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
