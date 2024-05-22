Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD19B8CBCD9
	for <lists+linux-stm32@lfdr.de>; Wed, 22 May 2024 10:24:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56E1AC6B47E;
	Wed, 22 May 2024 08:24:00 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08C80C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2024 08:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=q10IEafkKQVKlW5UPxyIdH8rk365Jnk+tsww6VNTTEs=; b=x2urkOHFgOh97UWsnWhSBWOcXS
 lNuqiP45YfO+3b+Y8Hx5hBmImSBAuvYUKN0gDK/66skh7cPLSSO0QS9JiTE8s36RM3VfpBpVg77N5
 mbjRgq+M0HDJJWXPNDxq5DtDhpJ0wnfWhR9dLPQJH84XLROFeIfG1OsV1+SkGCck37Fddhn8VH3hI
 xHSLX4CxYKrzdwTYhXAbe4W8IqQxtJn08TAKyrzO4sZ41VaBWD6lXjmqn855N4Z4+WrMdKy8bczvE
 ua+V20xpVCi72pyQZBtNridLCq9iJKUR4pb1fx8lFpVL5amPbOBsyN5prWWNpspeyPZ/mYujAIYxh
 4eNZiYKQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1s9hGF-000FPO-T4; Wed, 22 May 2024 10:23:47 +0200
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy02.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sean@geanix.com>) id 1s9hGF-000LzZ-2f;
 Wed, 22 May 2024 10:23:47 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 22 May 2024 10:23:30 +0200
Message-ID: <20240522082332.2471337-2-sean@geanix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240522082332.2471337-1-sean@geanix.com>
References: <20240522082332.2471337-1-sean@geanix.com>
MIME-Version: 1.0
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27282/Tue May 21 10:30:22 2024)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Sean Nyekjaer <sean@geanix.com>
Subject: [Linux-stm32] [PATCH 2/2] ARM: dts: stm32: osd32: move
	pwr_regulators to common
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

According to the OSD32MP1 Power System overview[1] pwr_regulators;
vdd-supply and vdd_3v3_usbfs-supply are hard-wired internally in
the SIP module to vdd and ldo4.

[1]:
https://octavosystems.com/app_notes/osd32mp1-power-system-overview/#connections

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts | 5 -----
 arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi     | 5 -----
 arch/arm/boot/dts/st/stm32mp15xx-osd32.dtsi       | 5 +++++
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts b/arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts
index 854dfecd801f..36e6055b5665 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts
@@ -147,11 +147,6 @@ &m_can1 {
 	status = "okay";
 };
 
-&pwr_regulators {
-	vdd-supply = <&vdd>;
-	vdd_3v3_usbfs-supply = <&vdd_usb>;
-};
-
 &rtc {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi b/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
index aa28043c30fb..c87fd96cbd91 100644
--- a/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
@@ -379,11 +379,6 @@ regulators {
 	};
 };
 
-&pwr_regulators {
-	vdd-supply = <&vdd>;
-	vdd_3v3_usbfs-supply = <&vdd_usb>;
-};
-
 &rtc {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-osd32.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-osd32.dtsi
index ae01e7a5339e..2022a1fa31ca 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-osd32.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-osd32.dtsi
@@ -215,6 +215,11 @@ &rng1 {
 	status = "okay";
 };
 
+&pwr_regulators {
+	vdd-supply = <&vdd>;
+	vdd_3v3_usbfs-supply = <&vdd_usb>;
+};
+
 &usbphyc_port0 {
 	phy-supply = <&vdd_usb>;
 };
-- 
2.44.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
