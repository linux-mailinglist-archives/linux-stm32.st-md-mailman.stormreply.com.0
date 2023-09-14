Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3F67A0DB1
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 21:00:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 898CEC6A5EF;
	Thu, 14 Sep 2023 19:00:59 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F280AC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 19:00:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 79907B82A86;
 Thu, 14 Sep 2023 19:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47243C433C9;
 Thu, 14 Sep 2023 19:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694718057;
 bh=qShUtFOUyzVf8/Vy8Ou2aMiD2+CkI0mrrVsJEqs5+Do=;
 h=From:To:Cc:Subject:Date:From;
 b=WD3EM3v+YCsBFw/HyGd5NpYli5TyFDn1qgSxdXNa5AQACYr3nq+s4WGnNeZcmLYZw
 LYMq6jvrnI2End4qZDjcMCF1z8XvldTNI/k8tOuxi/ugnRwcZPCQ0yKNLwaJInp47j
 IvasPjFi9rX51Y01FD0p2ScHUnJbNP9YkA4TElP2gve9YSNRTo1tWFhbAwVYo1bwGR
 CKcXDOgJ2aqC0f45FYpbx1Wsgxexl6tSsNuPsQkr8tFjvP/o6ePwxJif3z2LquVvjM
 GxwKSGl13V/8sq6EjXNIIiazum1ELgB/n+hCMfrqAIZWrYztj079ccJWpn+NN8Lnzu
 5IbAWdz5aC6xQ==
Received: (nullmailer pid 1853444 invoked by uid 1000);
 Thu, 14 Sep 2023 19:00:55 -0000
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Erwan Leray <erwan.leray@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Thu, 14 Sep 2023 14:00:42 -0500
Message-Id: <20230914190049.1853136-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: [Linux-stm32] [PATCH] spi: dt-bindings: st, stm32-spi: Move "st,
	spi-midi-ns" to spi-peripheral-props.yaml
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

In order to validate SPI peripherals, SPI controller-specific child node
properties need to be in a separate schema, spi-peripheral-props.yaml,
which SPI peripheral schemas reference. As there is just a single
property in this case, just add it to spi-peripheral-props.yaml directly.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/spi/spi-peripheral-props.yaml    |  5 +++++
 .../devicetree/bindings/spi/st,stm32-spi.yaml | 20 -------------------
 2 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
index dc4f7bb47090..15938f81fdce 100644
--- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
@@ -113,6 +113,11 @@ properties:
     minItems: 2
     maxItems: 4
 
+  st,spi-midi-ns:
+    description: |
+      Only for STM32H7, (Master Inter-Data Idleness) minimum time
+      delay in nanoseconds inserted between two consecutive data frames.
+
 # The controller specific properties go here.
 allOf:
   - $ref: arm,pl022-peripheral-props.yaml#
diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
index 9ca1a843c820..ae0f082bd377 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
@@ -18,15 +18,6 @@ maintainers:
 
 allOf:
   - $ref: spi-controller.yaml#
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: st,stm32f4-spi
-
-    then:
-      properties:
-        st,spi-midi-ns: false
 
 properties:
   compatible:
@@ -59,17 +50,6 @@ properties:
       - const: rx
       - const: tx
 
-patternProperties:
-  "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-f]+$":
-    type: object
-    # SPI slave nodes must be children of the SPI master node and can
-    # contain the following properties.
-    properties:
-      st,spi-midi-ns:
-        description: |
-          Only for STM32H7, (Master Inter-Data Idleness) minimum time
-          delay in nanoseconds inserted between two consecutive data frames.
-
 required:
   - compatible
   - reg
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
