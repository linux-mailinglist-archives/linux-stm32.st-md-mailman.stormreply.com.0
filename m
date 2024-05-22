Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFBC8CBCD8
	for <lists+linux-stm32@lfdr.de>; Wed, 22 May 2024 10:24:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6027BC6C838;
	Wed, 22 May 2024 08:24:00 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A806C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2024 08:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=P7gzquHYAk77nHHQ5uNsf0UW7QweoRnYgjes1qcmeuE=; b=sQDB8K1m/Fh9+KrEvWpENqrvzT
 7KTLeQyP8h4s86XNL0NTxryDZS8ujbecjk1ptITqos63ezZLRt4EO2guWc+Gcn3Dc0kUo1MNcUBy8
 uSJghwwmc4MOyEM+gj1zTXTAxaAG9csLGn7Vhbhn6VoKLf/mv7wjPQUk57rknjeop8760O0XeJLXl
 5tK9EhjsjBQZJ15YVE1nzqV4ML7eY+7kHFR/NIZWi+6AFvvdsZuopY99fmgYL7+SXllxj4XuAA6kA
 +Idi16O1Dw7j0NzJV57uU7+QXgCQhnIAUwypAGzoE/gqG7OYpWmK9wT1snxrzcRHZW17w4RRPPLph
 hxcrBW8A==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1s9hGE-000FPM-Tb; Wed, 22 May 2024 10:23:46 +0200
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy02.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sean@geanix.com>) id 1s9hGE-000LzZ-2o;
 Wed, 22 May 2024 10:23:46 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 22 May 2024 10:23:29 +0200
Message-ID: <20240522082332.2471337-1-sean@geanix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27282/Tue May 21 10:30:22 2024)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Sean Nyekjaer <sean@geanix.com>
Subject: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: osd32: move usb phy
	power to common
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

According to the OSD32MP1 Power System overview[1] usb phy power is
hard-wired internally in the SIP module to ldo4.

[1]:
https://octavosystems.com/app_notes/osd32mp1-power-system-overview/#connections

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts | 8 --------
 arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi     | 8 --------
 arch/arm/boot/dts/st/stm32mp15xx-osd32.dtsi       | 8 ++++++++
 3 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts b/arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts
index 527c33be66cc..854dfecd801f 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dts
@@ -211,11 +211,3 @@ &usbotg_hs {
 &usbphyc {
 	status = "okay";
 };
-
-&usbphyc_port0 {
-	phy-supply = <&vdd_usb>;
-};
-
-&usbphyc_port1 {
-	phy-supply = <&vdd_usb>;
-};
diff --git a/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi b/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
index cfaf8adde319..aa28043c30fb 100644
--- a/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
@@ -590,14 +590,6 @@ &usbphyc {
 	status = "okay";
 };
 
-&usbphyc_port0 {
-	phy-supply = <&vdd_usb>;
-};
-
-&usbphyc_port1 {
-	phy-supply = <&vdd_usb>;
-};
-
 &vrefbuf {
 	regulator-min-microvolt = <2500000>;
 	regulator-max-microvolt = <2500000>;
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-osd32.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-osd32.dtsi
index aeb71c41a734..ae01e7a5339e 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-osd32.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-osd32.dtsi
@@ -214,3 +214,11 @@ &m4_rproc {
 &rng1 {
 	status = "okay";
 };
+
+&usbphyc_port0 {
+	phy-supply = <&vdd_usb>;
+};
+
+&usbphyc_port1 {
+	phy-supply = <&vdd_usb>;
+};
-- 
2.44.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
