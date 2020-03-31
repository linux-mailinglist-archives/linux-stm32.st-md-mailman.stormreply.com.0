Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2B9198929
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 02:57:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B89DAC36B0D;
	Tue, 31 Mar 2020 00:57:44 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9BF4C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 00:57:43 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48rrXR3wd0z1rpG2;
 Tue, 31 Mar 2020 02:57:43 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48rrXR3GlSz1r0cH;
 Tue, 31 Mar 2020 02:57:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id BhXLrgHhuEbu; Tue, 31 Mar 2020 02:57:41 +0200 (CEST)
X-Auth-Info: RxeJxoAY8CMqBuogti2Egcm06YvyI774ER+7fH7tphQ=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 31 Mar 2020 02:57:41 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Tue, 31 Mar 2020 02:56:49 +0200
Message-Id: <20200331005701.283998-11-marex@denx.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200331005701.283998-1-marex@denx.de>
References: <20200331005701.283998-1-marex@denx.de>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH V2 10/22] ARM: dts: stm32: Repair PMIC
	interrupt on AV96
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

The PMIC interrupt line is connected to PA0 on the DHCOR SoM, fix it.
This makes the POWER button on the AV96 working, and also all the other
PMIC interrupts. Furthermore, scrub the bogus interrupt-parent props.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
V2: No change
---
 arch/arm/boot/dts/stm32mp157a-avenger96.dts | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
index ebe8a134c7ff..9a44c8777f67 100644
--- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
+++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
@@ -171,7 +171,7 @@ &i2c4 {
 	pmic: stpmic@33 {
 		compatible = "st,stpmic1";
 		reg = <0x33>;
-		interrupts-extended = <&exti 55 IRQ_TYPE_EDGE_FALLING>;
+		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		status = "okay";
@@ -228,7 +228,6 @@ vdda: ldo1 {
 				regulator-min-microvolt = <2900000>;
 				regulator-max-microvolt = <2900000>;
 				interrupts = <IT_CURLIM_LDO1 0>;
-				interrupt-parent = <&pmic>;
 			};
 
 			v2v8: ldo2 {
@@ -236,7 +235,6 @@ v2v8: ldo2 {
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
 				interrupts = <IT_CURLIM_LDO2 0>;
-				interrupt-parent = <&pmic>;
 			};
 
 			vtt_ddr: ldo3 {
@@ -250,7 +248,6 @@ vtt_ddr: ldo3 {
 			vdd_usb: ldo4 {
 				regulator-name = "vdd_usb";
 				interrupts = <IT_CURLIM_LDO4 0>;
-				interrupt-parent = <&pmic>;
 			};
 
 			vdd_sd: ldo5 {
@@ -258,7 +255,6 @@ vdd_sd: ldo5 {
 				regulator-min-microvolt = <2900000>;
 				regulator-max-microvolt = <2900000>;
 				interrupts = <IT_CURLIM_LDO5 0>;
-				interrupt-parent = <&pmic>;
 				regulator-boot-on;
 			};
 
@@ -267,7 +263,6 @@ v1v8: ldo6 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				interrupts = <IT_CURLIM_LDO6 0>;
-				interrupt-parent = <&pmic>;
 				regulator-enable-ramp-delay = <300000>;
 			};
 
@@ -279,20 +274,17 @@ vref_ddr: vref_ddr {
 			bst_out: boost {
 				regulator-name = "bst_out";
 				interrupts = <IT_OCP_BOOST 0>;
-				interrupt-parent = <&pmic>;
 			};
 
 			vbus_otg: pwr_sw1 {
 				regulator-name = "vbus_otg";
 				interrupts = <IT_OCP_OTG 0>;
-				interrupt-parent = <&pmic>;
 				regulator-active-discharge = <1>;
 			};
 
 			vbus_sw: pwr_sw2 {
 				regulator-name = "vbus_sw";
 				interrupts = <IT_OCP_SWOUT 0>;
-				interrupt-parent = <&pmic>;
 				regulator-active-discharge = <1>;
 			};
 		};
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
