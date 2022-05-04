Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4869519FF4
	for <lists+linux-stm32@lfdr.de>; Wed,  4 May 2022 14:49:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D568C6047D;
	Wed,  4 May 2022 12:49:59 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4CC7C60467
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 May 2022 12:49:57 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 357E483988;
 Wed,  4 May 2022 14:49:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651668597;
 bh=GBzLa65YYXoh+oi1jR5mzYULxZeiXyV3aBPD+iXH3Rw=;
 h=From:To:Cc:Subject:Date:From;
 b=VfG1IuXaIpT+64Hz6Jl14MZnq+oo3uhC2cyw3XZVQjM6plkTb3smDG0D/OhS0m8VK
 ClxPFWTn6LI01GuaO0QVnCFFlGf5mLZ0M+GCRDMxGl0MDmWxBCuCqSDX5Id8/YiQ0h
 RJ6k7dmtzJ12SNLBdztEd1ZITHvtnpQtjjKq56FnVViZ5tiIxkU00mrV0W2rykL2VZ
 oSsR3Y18zn9/fQl7QZlJeMkmGWn4d+jVWMjMPLHqWpgc1qWjdJ+OCpS9Rk0ts6u7OK
 2u/2jJa39f5L+H4oQV59pnoEOMlY2picvLtqRzQL6Qq/qU48MGUXAhL7bZJbj+UyJF
 cV3FLtTA/Q/Xw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Wed,  4 May 2022 14:49:45 +0200
Message-Id: <20220504124945.77331-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Move DHCOR BUCK3 VDD 2V9
	adjustment to 1V8 DTSI
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

The Buck3 on DHCOR is used to supply IO voltage. It can output either 3V3
in the default DHCOR configuration, or 2V9 in case of AV96 DHCOR variant
which has extra Empirion DCDC converter in front of the 1V8 IO supply, or
outright 1V8 in case of 1V8 IO DHCOR without the Empirion DCDC converter.

The 2V9 mode in case of AV96 DHCOR variant is used to reduce unnecessarily
high input voltage to the Empirion DCDC converter, so move it into matching
DTSI to stop confusing users.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15xx-dhcor-io1v8.dtsi | 5 +++++
 arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi   | 4 ++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-io1v8.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-io1v8.dtsi
index 75172314d7afd..9937b28548c23 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-io1v8.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-io1v8.dtsi
@@ -18,6 +18,11 @@ vdd_io: regulator-buck-io {
 	};
 };
 
+&vdd {
+	regulator-min-microvolt = <2900000>;
+	regulator-max-microvolt = <2900000>;
+};
+
 &pwr_regulators {
 	vdd-supply = <&vdd_io>;
 };
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
index 6336c3ca0f0e2..134a798ad3f23 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
@@ -119,8 +119,8 @@ vdd_ddr: buck2 {
 
 			vdd: buck3 {
 				regulator-name = "vdd";
-				regulator-min-microvolt = <2900000>;
-				regulator-max-microvolt = <2900000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
 				regulator-initial-mode = <0>;
 				regulator-over-current-protection;
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
