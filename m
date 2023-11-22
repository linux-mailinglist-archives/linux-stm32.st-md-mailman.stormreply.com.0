Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CBD7F4FF2
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Nov 2023 19:52:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C086FC6B47C;
	Wed, 22 Nov 2023 18:52:46 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61E08C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Nov 2023 18:52:45 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1r5sL0-0002NJ-KB; Wed, 22 Nov 2023 19:52:38 +0100
Received: from [2a0a:edc0:0:1101:1d::54] (helo=dude05.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1r5sKz-00As7O-8d; Wed, 22 Nov 2023 19:52:37 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
 by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
 (envelope-from <a.fatoum@pengutronix.de>) id 1r5sKz-008Sz9-0M;
 Wed, 22 Nov 2023 19:52:37 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>
Date: Wed, 22 Nov 2023 19:52:33 +0100
Message-Id: <20231122185235.2017642-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: arm: stm32: don't mix SCMI
	and non-SCMI board compatibles
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

SCMI-enabled boards may restrict access to resources like clocks, resets
and regulators to the secure world.

A normal world bootloader or kernel compatible with the non-SCMI-enabled
board is thus not guaranteed to be able to deal with the SCMI variant.

It follows, that the SCMI-enabled board is not compatible with the
non-SCMI enabled board, so drop that compatible.

This change is motivated by the barebox' bootloader's use of bootloader
specification files[1][2]: barebox for non-SCMI DK2 will compare its
own top-level "stm32mp157c-dk2" compatible with all compatibles
listed in the device tree referenced by each bootloader spec file.
If the boot medium contains a configuration with
compatible = "st,stm32mp157c-dk2-scmi", "st,stm32mp157c-dk2", "st,stm32mp157";
it will match, because of the second compatible and boot a kernel with
SCMI enabled, although no SCMI may exist on the platform.

[1]: https://uapi-group.org/specifications/specs/boot_loader_specification/
[2]: https://www.barebox.org/doc/latest/user/booting-linux.html#boot-loader-specification

Fixes: 8e14ebb1f08f ("dt-bindings: arm: stm32: Add SCMI version of STM32 boards (DK1/DK2/ED1/EV1)")
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 .../devicetree/bindings/arm/stm32/stm32.yaml     | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index df087c81c69e..bc2f43330ae4 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -82,29 +82,19 @@ properties:
               - shiratech,stm32mp157a-iot-box # IoT Box
               - shiratech,stm32mp157a-stinger96 # Stinger96
               - st,stm32mp157c-ed1
+              - st,stm32mp157c-ed1-scmi
               - st,stm32mp157a-dk1
+              - st,stm32mp157a-dk1-scmi
               - st,stm32mp157c-dk2
+              - st,stm32mp157c-dk2-scmi
           - const: st,stm32mp157
 
-      - items:
-          - const: st,stm32mp157a-dk1-scmi
-          - const: st,stm32mp157a-dk1
-          - const: st,stm32mp157
-      - items:
-          - const: st,stm32mp157c-dk2-scmi
-          - const: st,stm32mp157c-dk2
-          - const: st,stm32mp157
-      - items:
-          - const: st,stm32mp157c-ed1-scmi
-          - const: st,stm32mp157c-ed1
-          - const: st,stm32mp157
       - items:
           - const: st,stm32mp157c-ev1
           - const: st,stm32mp157c-ed1
           - const: st,stm32mp157
       - items:
           - const: st,stm32mp157c-ev1-scmi
-          - const: st,stm32mp157c-ev1
           - const: st,stm32mp157c-ed1
           - const: st,stm32mp157
 
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
