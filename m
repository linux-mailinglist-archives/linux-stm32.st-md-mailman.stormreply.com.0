Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBA623CA9F
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Aug 2020 14:37:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A862C36B3E;
	Wed,  5 Aug 2020 12:37:09 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5251FC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Aug 2020 12:37:06 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BMB2n6mJtz1rvyG;
 Wed,  5 Aug 2020 14:37:05 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BMB2n6Pxtz1qyXM;
 Wed,  5 Aug 2020 14:37:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id PEywUgRb2RgZ; Wed,  5 Aug 2020 14:37:04 +0200 (CEST)
X-Auth-Info: OJntxYlNwzxpI0Tp7ga3RG7Me3noWldyzo2843GS62s=
Received: from desktop.lan (ip-86-49-101-166.net.upcbroadband.cz
 [86.49.101.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  5 Aug 2020 14:37:04 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Wed,  5 Aug 2020 14:36:28 +0200
Message-Id: <20200805123629.97146-2-marex@denx.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200805123629.97146-1-marex@denx.de>
References: <20200805123629.97146-1-marex@denx.de>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/3] ARM: dts: stm32: Drop QSPI CS2 pinmux on
	DHCOM
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

The QSPI CS2 is not used on DHCOM, remove the pinmux settings.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index ba905196fb54..ba600b0114cf 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -285,8 +285,8 @@ &pwr_regulators {
 
 &qspi {
 	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a &qspi_bk2_pins_a>;
-	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a &qspi_bk2_sleep_pins_a>;
+	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a>;
+	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a>;
 	reg = <0x58003000 0x1000>, <0x70000000 0x4000000>;
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
