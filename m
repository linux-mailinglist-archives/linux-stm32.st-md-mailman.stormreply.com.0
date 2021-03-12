Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAB4339186
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Mar 2021 16:39:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 667BEC57B53;
	Fri, 12 Mar 2021 15:39:48 +0000 (UTC)
Received: from smtp.wifcom.cz (smtp.wifcom.cz [85.207.3.150])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 958E5C57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 15:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=eaxlabs.cz;
 s=mail; 
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=LxZqyySCpkVm6WBH2H3h8XdkfiFZZjSDTwsoFd8R1oE=; 
 b=wuw60i32/m0uJ59OMHIiIK0yeo1QlIW0EsYrNmfLQz0QLCM6uuRufD8O/e/HZMFeJ1nissFR6vBgmqdAjpBoNk6Gyu0YfcuixFagXUfCrOwXVhPjjo5sX4zTtbakx5vtmYv6w3cCEaDVr2Z8mmoVKY3NrOnBMmiRwf7uFbIG23E=;
From: Martin Devera <devik@eaxlabs.cz>
To: linux-kernel@vger.kernel.org
Date: Fri, 12 Mar 2021 16:37:01 +0100
Message-Id: <20210312153702.12349-1-devik@eaxlabs.cz>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <1615559009.788146.2976052.nullmailer@robh.at.kernel.org>
References: <1615559009.788146.2976052.nullmailer@robh.at.kernel.org>
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus
X-Wif-ss: -2.9 (--)
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Martin Devera <devik@eaxlabs.cz>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Le Ray <erwan.leray@st.com>
Subject: [Linux-stm32] [PATCH v7 1/2] dt-bindings: serial: Add rx-tx-swap to
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
Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
v7:
  - fix yaml linter warning
v6: 
  - add version changelog
v5: 
  - yaml fixes based on Rob Herring comments
    - add serial.yaml reference
    - move compatible from 'then' to 'if'
v3:
  - don't allow rx-tx-swap for st,stm32-uart (suggested
    by Fabrice Gasnier)
v2:
  - change st,swap to rx-tx-swap (suggested by Rob Herring)
---
 .../devicetree/bindings/serial/st,stm32-uart.yaml  | 29 ++++++++++++++--------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
index 8631678283f9..68a0f3ce8328 100644
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
@@ -40,6 +37,8 @@ properties:
 
   uart-has-rtscts: true
 
+  rx-tx-swap: true
+
   dmas:
     minItems: 1
     maxItems: 2
@@ -66,13 +65,23 @@ properties:
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
+  - $ref: rs485.yaml#
+  - $ref: serial.yaml#
+  - if:
+      required:
+        - st,hw-flow-ctrl
+    then:
+      properties:
+        cts-gpios: false
+        rts-gpios: false
+  - if:
+      properties:
+        compatible:
+          const: st,stm32-uart
+    then:
+      properties:
+        rx-tx-swap: false
 
 required:
   - compatible
-- 
2.11.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
