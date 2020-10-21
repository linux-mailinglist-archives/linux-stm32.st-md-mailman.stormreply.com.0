Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CC1294B50
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Oct 2020 12:35:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 877FBC424BA;
	Wed, 21 Oct 2020 10:35:01 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B198C424B3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 10:35:00 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <afa@pengutronix.de>)
 id 1kVBSK-0006kK-Vy; Wed, 21 Oct 2020 12:34:56 +0200
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <afa@pengutronix.de>)
 id 1kVBSK-00024m-Lr; Wed, 21 Oct 2020 12:34:56 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Wed, 21 Oct 2020 12:28:56 +0200
Message-Id: <20201021102855.18026-2-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021102855.18026-1-a.fatoum@pengutronix.de>
References: <20201021102855.18026-1-a.fatoum@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/2] ARM: dts: stm32: support child mfd
	cells for the stm32mp1 TAMP syscon
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

The stm32mp1 TAMP peripheral has 32 backup registers that survive
a warm reset. This makes them suitable for storing a reboot
mode, which the vendor's kernel tree is already doing[0].

The actual syscon-reboot-mode child node can be added by a board.dts or
fixed up by the bootloader. For the child node to be probed, the
compatible needs to include simple-mfd. The binding now specifies this,
so have the SoC dtsi adhere to it.

[0]: https://github.com/STMicroelectronics/linux/commit/2e9bfc29dd

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
v1 -> v2:
  - Dropped simple-bus. simple-mfd is all that's needed
  - reworded commit message
---
 arch/arm/boot/dts/stm32mp151.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 842ecffae73a..662c2408d41b 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1542,7 +1542,7 @@ i2c6: i2c@5c009000 {
 		};
 
 		tamp: tamp@5c00a000 {
-			compatible = "st,stm32-tamp", "syscon";
+			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
 			reg = <0x5c00a000 0x400>;
 		};
 
-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
