Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B229C293E1B
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Oct 2020 16:06:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B187C424B9;
	Tue, 20 Oct 2020 14:06:02 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02A81C3FAE0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Oct 2020 14:06:00 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <afa@pengutronix.de>)
 id 1kUsGy-0003id-GA; Tue, 20 Oct 2020 16:05:56 +0200
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <afa@pengutronix.de>)
 id 1kUsGw-0000KI-My; Tue, 20 Oct 2020 16:05:54 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Tue, 20 Oct 2020 16:04:51 +0200
Message-Id: <20201020140450.29158-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: update sdmmc IP version for
	STM32MP157 SOC
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

From: Yann Gautier <yann.gautier@st.com>

Update the IP version to v2.0, which supports linked lists in internal DMA,
and is present in STM32MP1 SoCs.

The mmci driver supports the v2.0 periph id since 7a2a98be672b ("mmc: mmci:
Add support for sdmmc variant revision 2.0"), so it's now Ok to add it into
the SoC device tree to benefit from the improved DMA support.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
Signed-off-by: Yann Gautier <yann.gautier@st.com>
[afa: cherry-picked from https://github.com/STMicroelectronics/linux/commit/31e2a6bc8]
[afa: extended commit message with reference to driver patch]
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
Cc: Ludovic Barre <ludovic.barre@st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index bfe29023fbd5..b8d996d32dc0 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1040,7 +1040,7 @@ adc2: adc@100 {
 
 		sdmmc3: sdmmc@48004000 {
 			compatible = "arm,pl18x", "arm,primecell";
-			arm,primecell-periphid = <0x10153180>;
+			arm,primecell-periphid = <0x00253180>;
 			reg = <0x48004000 0x400>;
 			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "cmd_irq";
@@ -1338,7 +1338,7 @@ qspi: spi@58003000 {
 
 		sdmmc1: sdmmc@58005000 {
 			compatible = "arm,pl18x", "arm,primecell";
-			arm,primecell-periphid = <0x10153180>;
+			arm,primecell-periphid = <0x00253180>;
 			reg = <0x58005000 0x1000>;
 			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "cmd_irq";
@@ -1353,7 +1353,7 @@ sdmmc1: sdmmc@58005000 {
 
 		sdmmc2: sdmmc@58007000 {
 			compatible = "arm,pl18x", "arm,primecell";
-			arm,primecell-periphid = <0x10153180>;
+			arm,primecell-periphid = <0x00253180>;
 			reg = <0x58007000 0x1000>;
 			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "cmd_irq";
-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
