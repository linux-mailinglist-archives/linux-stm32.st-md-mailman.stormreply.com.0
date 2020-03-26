Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A560194B0F
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Mar 2020 23:02:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17F9EC36B11;
	Thu, 26 Mar 2020 22:02:56 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48043C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Mar 2020 22:02:54 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <afa@pengutronix.de>)
 id 1jHaaP-0006Dh-MO; Thu, 26 Mar 2020 23:02:49 +0100
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <afa@pengutronix.de>)
 id 1jHaaO-00088r-6A; Thu, 26 Mar 2020 23:02:48 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Date: Thu, 26 Mar 2020 23:02:05 +0100
Message-Id: <20200326220213.28632-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
Subject: [Linux-stm32] [PATCH v2 1/8] ARM: dts: stm32: enable stm32mp157's
	&gpu by default
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

In the original stm32mp157c.dtsi, the GPU was disabled as some SoC
variants lacked a GPU. We now have separate a dtsi for each SoC
variant and variants without a GPU lack the node altogether.

As we need no board support for using the GPU, enable it by default
and while at it remove the now redundant status = "okay" in existing
board device trees.

Suggested-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
v1 -> v2:
  - New Patch
---
 arch/arm/boot/dts/stm32mp157.dtsi            | 1 -
 arch/arm/boot/dts/stm32mp157c-dhcom-som.dtsi | 4 ----
 arch/arm/boot/dts/stm32mp157c-ed1.dts        | 1 -
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi       | 1 -
 4 files changed, 7 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157.dtsi b/arch/arm/boot/dts/stm32mp157.dtsi
index 3f0a4a91cce6..5e733cd16ff9 100644
--- a/arch/arm/boot/dts/stm32mp157.dtsi
+++ b/arch/arm/boot/dts/stm32mp157.dtsi
@@ -15,7 +15,6 @@ gpu: gpu@59000000 {
 			clocks = <&rcc GPU>, <&rcc GPU_K>;
 			clock-names = "bus" ,"core";
 			resets = <&rcc GPU_R>;
-			status = "disabled";
 		};
 
 		dsi: dsi@5a000000 {
diff --git a/arch/arm/boot/dts/stm32mp157c-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp157c-dhcom-som.dtsi
index f81dc3134135..f97e0d2ecf17 100644
--- a/arch/arm/boot/dts/stm32mp157c-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c-dhcom-som.dtsi
@@ -97,10 +97,6 @@ &dts {
 	status = "okay";
 };
 
-&gpu {
-	status = "okay";
-};
-
 &i2c4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c4_pins_a>;
diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
index 9d2592db630c..e9aad3e101ac 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
@@ -126,7 +126,6 @@ &dts {
 
 &gpu {
 	contiguous-area = <&gpu_reserved>;
-	status = "okay";
 };
 
 &i2c4 {
diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
index d946e0a02f5c..558a91a6962b 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
@@ -137,7 +137,6 @@ phy0: ethernet-phy@0 {
 
 &gpu {
 	contiguous-area = <&gpu_reserved>;
-	status = "okay";
 };
 
 &i2c1 {
-- 
2.26.0.rc2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
