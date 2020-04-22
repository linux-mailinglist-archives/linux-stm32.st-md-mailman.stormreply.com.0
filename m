Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F3F1B4075
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Apr 2020 12:46:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB3D0C36B0C;
	Wed, 22 Apr 2020 10:46:33 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FEBFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 10:46:28 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 496cYb4PJrz1qs3D;
 Wed, 22 Apr 2020 12:46:27 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 496cYb3cgqz1qql5;
 Wed, 22 Apr 2020 12:46:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id CbspIRQPiG2s; Wed, 22 Apr 2020 12:46:26 +0200 (CEST)
X-Auth-Info: iEWIM2ZkZgtORfdWZsXsZ1KBnA0Qt+CW2w/JTzzpL4o=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 22 Apr 2020 12:46:26 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Wed, 22 Apr 2020 12:45:54 +0200
Message-Id: <20200422104613.96944-2-marex@denx.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200422104613.96944-1-marex@denx.de>
References: <20200422104613.96944-1-marex@denx.de>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH V5 01/20] ARM: dts: stm32: Repair PMIC
	configuration on AV96
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

The vdd PMIC buck regulator was misconfigured, which caused instability
of the board and malfunction of high-speed interfaces, like the RGMII.
Configure the PMIC correctly to repair these problems. Also add missing
Enpirion regulator for the IO voltage into the DT.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
V2: Model the Enpirion EP53A8LQI on the DHCOR SoM as a fixed regulator
V3: Move this before the SDMMC2 patch, as there is now a dependency
V4: Rebase on stm32-next
V5: Reorder the patch before the SDMMC and ethernet patches
    Set buck1 minimum voltage to 1V2
---
 arch/arm/boot/dts/stm32mp157a-avenger96.dts | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
index aba38950f2e9..380ce148520f 100644
--- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
+++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
@@ -77,6 +77,17 @@ led6 {
 			default-state = "off";
 		};
 	};
+
+	/* Enpirion EP3A8LQI U2 on the DHCOR */
+	vdd_io: regulator-buck-io {
+		compatible = "regulator-fixed";
+		regulator-name = "buck-io";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vdd>;
+	};
 };
 
 &ethernet0 {
@@ -166,8 +177,8 @@ vdd_ddr: buck2 {
 
 			vdd: buck3 {
 				regulator-name = "vdd";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <2900000>;
+				regulator-max-microvolt = <2900000>;
 				regulator-always-on;
 				regulator-initial-mode = <0>;
 				regulator-over-current-protection;
@@ -245,6 +256,7 @@ vbus_otg: pwr_sw1 {
 				regulator-name = "vbus_otg";
 				interrupts = <IT_OCP_OTG 0>;
 				interrupt-parent = <&pmic>;
+				regulator-active-discharge = <1>;
 			};
 
 			vbus_sw: pwr_sw2 {
@@ -275,7 +287,7 @@ &iwdg2 {
 };
 
 &pwr_regulators {
-	vdd-supply = <&vdd>;
+	vdd-supply = <&vdd_io>;
 	vdd_3v3_usbfs-supply = <&vdd_usb>;
 };
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
