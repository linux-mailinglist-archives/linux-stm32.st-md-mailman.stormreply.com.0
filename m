Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 088EE225A3D
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jul 2020 10:40:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B600EC36B33;
	Mon, 20 Jul 2020 08:40:54 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BF1AC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jul 2020 13:25:56 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
 (Authenticated sender: jacopo@jmondi.org)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 51DC01C0012;
 Fri, 17 Jul 2020 13:25:54 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: robh+dt@kernel.org,
	devicetree@vger.kernel.org
Date: Fri, 17 Jul 2020 15:28:54 +0200
Message-Id: <20200717132859.237120-9-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 20 Jul 2020 08:40:53 +0000
Cc: linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 laurent.pinchart@ideasonboard.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 slongerbeam@gmail.com, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 08/13] dt-bindings: media: ov5640: Remove
	data-shift
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

The value of the data-shift property solely depend on the selected
bus width and it's not freely configurable.

Remove it from the bindings document and update its users accordingly.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 Documentation/devicetree/bindings/media/i2c/ov5640.yaml | 9 ---------
 arch/arm/boot/dts/stm32mp157c-ev1.dts                   | 1 -
 2 files changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
index 5e1662e848bd..ab700a1830aa 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
@@ -92,12 +92,6 @@ properties:
               parallel bus.
             enum: [8, 10]

-          data-shift:
-            description: |
-              Shall be set to <2> for 8 bits parallel bus (lines 9:2 are used) or
-              <0> for 10 bits parallel bus.
-            enum: [0, 2]
-
           hsync-active:
             enum: [0, 1]

@@ -115,7 +109,6 @@ properties:
             then:
                 properties:
                   bus-width: false
-                  data-shift: false
                   hsync-active: false
                   vsync-active: false
                   pclk-sample: false
@@ -135,7 +128,6 @@ properties:
                 - remote-endpoint
                 - bus-type
                 - bus-width
-                - data-shift
                 - hsync-active
                 - vsync-active
                 - pclk-sample
@@ -204,7 +196,6 @@ examples:
                     remote-endpoint = <&parallel_from_ov5640>;
                     bus-type = <5>;
                     bus-width = <10>;
-                    data-shift = <0>;
                     hsync-active = <1>;
                     vsync-active = <1>;
                     pclk-sample = <1>;
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 613ede73b65b..96f96202ca63 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -192,7 +192,6 @@ ov5640_0: endpoint {
 				remote-endpoint = <&dcmi_0>;
 				bus-type = <5>;
 				bus-width = <8>;
-				data-shift = <2>; /* lines 9:2 are used */
 				hsync-active = <0>;
 				vsync-active = <0>;
 				pclk-sample = <1>;
--
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
