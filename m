Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BD223EFE9
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Aug 2020 17:20:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BB44C36B3A
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Aug 2020 15:20:51 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73F16C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Aug 2020 15:10:14 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <has@pengutronix.de>)
 id 1k440Y-0006QD-If; Fri, 07 Aug 2020 17:10:10 +0200
Received: from has by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <has@pengutronix.de>)
 id 1k440W-00039A-Km; Fri, 07 Aug 2020 17:10:08 +0200
From: Holger Assmann <h.assmann@pengutronix.de>
To: Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Fri,  7 Aug 2020 17:03:56 +0200
Message-Id: <20200807150355.6116-1-h.assmann@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: has@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Fri, 07 Aug 2020 15:20:50 +0000
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: lxa-mc1: Fix kernel warning
	about PHY delays
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

The KSZ9031 PHY skew timings for rxc/txc, originally set to achieve
the desired phase shift between clock- and data-signal, now trigger a
kernel warning when used in rgmii-id mode:

 *-skew-ps values should be used only with phy-mode = "rgmii"

This is because commit bcf3440c6dd7 ("net: phy: micrel: add phy-mode
support for the KSZ9031 PHY") now configures own timings when
phy-mode = "rgmii-id". Device trees wanting to set their own delays
should use phy-mode "rgmii" instead as the warning prescribes.

The "standard" timings now used with "rgmii-id" work fine on this
board, so drop the explicit timings in the device tree and thereby
silence the warning.

Fixes: 666b5ca85cd3 ("ARM: dts: stm32: add STM32MP1-based Linux Automation MC-1 board")
Signed-off-by: Holger Assmann <h.assmann@pengutronix.de>
---
 arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
index 5700e6b700d3..b85025d00943 100644
--- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
@@ -121,8 +121,6 @@
 			reset-gpios = <&gpiog 0 GPIO_ACTIVE_LOW>; /* ETH_RST# */
 			interrupt-parent = <&gpioa>;
 			interrupts = <6 IRQ_TYPE_EDGE_FALLING>; /* ETH_MDINT# */
-			rxc-skew-ps = <1860>;
-			txc-skew-ps = <1860>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <300>;
 			micrel,force-master;
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
