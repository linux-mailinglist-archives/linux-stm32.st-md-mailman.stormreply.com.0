Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD13294B4E
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Oct 2020 12:34:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A639C424B3;
	Wed, 21 Oct 2020 10:34:57 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F4C8C3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 10:34:55 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <afa@pengutronix.de>)
 id 1kVBSG-0006i7-8U; Wed, 21 Oct 2020 12:34:52 +0200
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <afa@pengutronix.de>)
 id 1kVBSE-00024Q-MQ; Wed, 21 Oct 2020 12:34:50 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Christophe Roullier <christophe.roullier@st.com>
Date: Wed, 21 Oct 2020 12:28:55 +0200
Message-Id: <20201021102855.18026-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/2] dt-bindings: arm: stm32: add
	simple-mfd compatible for tamp node
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

The stm32mp1 TAMP (Tamper and backup registers) does tamper detection
and features 32 backup registers that, being in the RTC domain, may
survive even with Vdd switched off.

This makes it suitable for use to communicate a reboot mode from OS
to bootloader via the syscon-reboot-mode binding. Add a "simple-mfd"
to support probing such a child node. The actual reboot mode
node could then be defined in a board.dts or fixed up by the bootloader.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
v1 available here:
https://lore.kernel.org/linux-arm-kernel/20200916142216.25142-1-a.fatoum@pengutronix.de/

v1 -> v2:
 - new patch, rebased on top of
   https://lore.kernel.org/r/20201014125441.2457-1-arnaud.pouliquen@st.com
---
 .../devicetree/bindings/arm/stm32/st,stm32-syscon.yaml       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index 6634b3e0853e..4684017a42e4 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -19,8 +19,11 @@ properties:
               - st,stm32mp151-pwr-mcu
               - st,stm32-syscfg
               - st,stm32-power-config
-              - st,stm32-tamp
           - const: syscon
+      - items:
+          - const: st,stm32-tamp
+          - const: syscon
+          - const: simple-mfd
 
   reg:
     maxItems: 1
-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
