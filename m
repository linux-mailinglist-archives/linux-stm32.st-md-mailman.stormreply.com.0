Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40187330908
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Mar 2021 08:55:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE890C58D49;
	Mon,  8 Mar 2021 07:55:57 +0000 (UTC)
Received: from ms9.eaxlabs.cz (ms9.eaxlabs.cz [147.135.177.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24790C56634
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Mar 2021 19:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=eaxlabs.cz;
 s=mail; 
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=65e45oHZO+BxFf5UqN9fVtID/K010U91Mz2QcQ/swdo=; 
 b=EDAtFQZ9mVFD65Wff/a94mHlD9FCA6zVKQueKKYilfU3rhnQR4/xuDvTEry+n7OtG5lR54ychj7JxOF2ANKxGfpGjZgsSY0uoYSHBF/LvtumbmdaaRxMbYsXU5+wcfT2VffoR89NzyhIFtMWmSSw7QtQ+RHAIqQaOqQrJqUIZd8=;
Received: from [82.99.129.6] (helo=localhost.localdomain)
 by ms9.eaxlabs.cz with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <devik@eaxlabs.cz>)
 id 1lHAIX-000335-MD; Tue, 02 Mar 2021 20:03:11 +0100
From: Martin Devera <devik@eaxlabs.cz>
To: linux-kernel@vger.kernel.org
Date: Tue,  2 Mar 2021 20:03:02 +0100
Message-Id: <20210302190303.28630-1-devik@eaxlabs.cz>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <aeefa74e-fa19-6c31-5240-0f14fca89298@foss.st.com>
References: <aeefa74e-fa19-6c31-5240-0f14fca89298@foss.st.com>
X-Mailman-Approved-At: Mon, 08 Mar 2021 07:55:55 +0000
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Martin Devera <devik@eaxlabs.cz>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Le Ray <erwan.leray@st.com>
Subject: [Linux-stm32] [PATCH v4 1/2] dt-bindings: serial: Add rx-tx-swap to
	stm32-usart
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Add new rx-tx-swap property to allow for RX & TX pin swapping.

Signed-off-by: Martin Devera <devik@eaxlabs.cz>
---
 .../devicetree/bindings/serial/st,stm32-uart.yaml  | 32 +++++++++++++++-------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
index 8631678283f9..6eab2debebb5 100644
--- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
@@ -9,9 +9,6 @@ maintainers:
 
 title: STMicroelectronics STM32 USART bindings
 
-allOf:
-  - $ref: rs485.yaml
-
 properties:
   compatible:
     enum:
@@ -40,6 +37,10 @@ properties:
 
   uart-has-rtscts: true
 
+  rx-tx-swap:
+    type: boolean
+    maxItems: 1
+
   dmas:
     minItems: 1
     maxItems: 2
@@ -66,13 +67,24 @@ properties:
   linux,rs485-enabled-at-boot-time: true
   rs485-rx-during-tx: true
 
-if:
-  required:
-    - st,hw-flow-ctrl
-then:
-  properties:
-    cts-gpios: false
-    rts-gpios: false
+allOf:
+  - $ref: rs485.yaml
+  - if:
+      required:
+        - st,hw-flow-ctrl
+    then:
+      properties:
+        cts-gpios: false
+        rts-gpios: false
+  - if:
+      required:
+        - rx-tx-swap
+    then:
+      properties:
+        compatible:
+          enum:
+            - st,stm32f7-uart
+            - st,stm32h7-uart
 
 required:
   - compatible
-- 
2.11.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
