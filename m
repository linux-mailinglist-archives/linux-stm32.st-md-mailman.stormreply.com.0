Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E02BC0339
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Oct 2025 07:36:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91AB9C3F93C;
	Tue,  7 Oct 2025 05:36:21 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78861C3F938
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Oct 2025 05:36:20 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1v60Mv-0002SK-Fp; Tue, 07 Oct 2025 07:36:13 +0200
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <a.fatoum@pengutronix.de>) id 1v60Mu-002Li7-11;
 Tue, 07 Oct 2025 07:36:12 +0200
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
 by dude05.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
 (envelope-from <a.fatoum@pengutronix.de>) id 1v60Mu-0000000C6Jh-12wQ;
 Tue, 07 Oct 2025 07:36:12 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Tue, 07 Oct 2025 07:36:02 +0200
MIME-Version: 1.0
Message-Id: <20251007-lxa-usb-dt-v1-1-cacde8088bb9@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAMGm5GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwNz3ZyKRN3S4iTdlBLd5NQkA0MLS2NLs1QzJaCGgqLUtMwKsGHRsbW
 1AF85bcxcAAAA
X-Change-ID: 20251007-lxa-usb-dt-ceb0189396e6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: lxa: drop unnecessary
	vusb_d/a-supply
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

The LXA device trees are the only STM32MP1 device tree that specify
vusb_d/usb_a-supply and apparently not for good reason:

- vusb_d-supply (vdd_usb) is the same as the phy-supply for usbphyc_port1
- vusb_a-supply (reg18) is the same as vdda1v8-supply for usbphyc_port1

and usbphyc_port1 is linked to the usbotg_hs node via the phys property.

Specifying the regulators in the &usbotg_hs node is thus superfluous and
has been even found to be harmful in one instance:
Linux v6.10 was found to lock up every 50-125 or so reboots on the LXA
TAC when the DWC2 driver probe enables the regulators in bulk, unless
both properties were removed.

This issue was so far not reproducible on v6.17 (> 500 reboots), but as
these properties are unnecessary and different from other STM32MP1
boards, remove them anyway.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 3 ---
 arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi       | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi b/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi
index 9eeb9d6b5eb0ed35d4a83b743e8007f19422e2ed..7d3a6a3b5d09ea06689ebca11eda48785207aa31 100644
--- a/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi
@@ -374,9 +374,6 @@ &usbotg_hs {
 	phys = <&usbphyc_port1 0>;
 	phy-names = "usb2-phy";
 
-	vusb_d-supply = <&vdd_usb>;
-	vusb_a-supply = <&reg18>;
-
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi b/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
index be0c355d3105b89d4374d4f6972c7927970f06b1..9179075f2ead14a4deb45fcd2cefd60ab426a8d8 100644
--- a/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
@@ -493,9 +493,6 @@ &usbotg_hs {
 	phys = <&usbphyc_port1 0>;
 	phy-names = "usb2-phy";
 
-	vusb_d-supply = <&vdd_usb>;
-	vusb_a-supply = <&reg18>;
-
 	g-rx-fifo-size = <512>;
 	g-np-tx-fifo-size = <32>;
 	g-tx-fifo-size = <128 128 64 16 16 16 16 16>;

---
base-commit: 33f3d92bd1bee0e37d68124dd6e7df793a6af745
change-id: 20251007-lxa-usb-dt-ceb0189396e6

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
