Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9331D3A2EED
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jun 2021 17:02:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37E03C58D7C;
	Thu, 10 Jun 2021 15:02:53 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9FC4C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 15:02:49 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 03E0082D6E;
 Thu, 10 Jun 2021 17:02:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1623337369;
 bh=Z0FQrk378gWXhnkO+BP0iYi92dHaRFFA/wJzxQw70uc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rooU4dn2sKwozE6UNX4pUSOJlFo7nT8li+wB1uyZ4X9/ZemUXrIg5CAtb9l4ZUdHz
 Tfj/uVGLi2TfwtEdo4J0DGWwU5fjeUVT6n7WPKUS3szmTXksb7cNJ6ICbcwVaIYMFK
 qYuwWR35ECOiZ/U0ueC6WlTQoXlFMc1FgIV/rxZSNlmDWwOTzRaezX2L76cdvBZRvT
 +M7pjg89XaqDWyGWACi06r9jYTWrvYnq/+uX3A7ayE3v8ssUxy0Lw41GjBIsv72eaX
 p62pJ6W6glD3C7TYmNZn21Sq2RgyFAZV1puD92rux+KONPp5Uob70Si0SS3Z+a2LpZ
 Gzp2mWHuZKcGA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Thu, 10 Jun 2021 17:02:42 +0200
Message-Id: <20210610150243.30017-2-marex@denx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210610150243.30017-1-marex@denx.de>
References: <20210610150243.30017-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, kernel@dh-electronics.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/3] ARM: dts: stm32: Add backlight and panel
	supply on DHCOM SoM
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

Fix the following dtbs_check warning:
arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dt.yaml: display-bl: 'power-supply' is a required property
arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dt.yaml: panel: 'power-supply' is a required property

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: kernel@dh-electronics.com
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
index d9316701fd03..4f6b94f10f4a 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
@@ -29,6 +29,7 @@ display_bl: display-bl {
 		brightness-levels = <0 16 22 30 40 55 75 102 138 188 255>;
 		default-brightness-level = <8>;
 		enable-gpios = <&gpioi 0 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_panel_bl>;
 		status = "okay";
 	};
 
@@ -106,6 +107,7 @@ led-3 {
 	panel {
 		compatible = "edt,etm0700g0edh6";
 		backlight = <&display_bl>;
+		power-supply = <&reg_panel_bl>;
 
 		port {
 			lcd_panel_in: endpoint {
@@ -114,6 +116,21 @@ lcd_panel_in: endpoint {
 		};
 	};
 
+	reg_panel_bl: regulator-panel-bl {
+		compatible = "regulator-fixed";
+		regulator-name = "panel_backlight";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_panel_supply>;
+	};
+
+	reg_panel_supply: regulator-panel-supply {
+		compatible = "regulator-fixed";
+		regulator-name = "panel_supply";
+		regulator-min-microvolt = <24000000>;
+		regulator-max-microvolt = <24000000>;
+	};
+
 	sound {
 		compatible = "audio-graph-card";
 		routing =
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
