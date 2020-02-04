Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACFC151B34
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Feb 2020 14:26:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01106C36B10;
	Tue,  4 Feb 2020 13:26:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16AA5C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Feb 2020 13:26:28 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 014DN70n018475; Tue, 4 Feb 2020 14:26:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=DQPPnENN4OvejI/WvANWll8Ll71nJFT9PWSn4hA0scM=;
 b=pgIu/M29OKqF+lFLKhE5yFuYlnstLG7kaviC8Ef8hu+rDOUlpCP9vGHYv0Fn1zZ6h/Nd
 ZxPjy+FfpUfMFNAkLRj+PFC7gz/pjN8xI61G4T4eQvW/XKZJgCMnalNJntArxAVngITV
 ffXTbtSbiCWHhV3KOxSdlaBovPYmM2/zT3yVkEbKaqy2ZNS9UllinQqzpp90zcZkJOxd
 el4KDdnqmHBoBisYDVL2ZG0aMc0XINmtiqdRUtA/2cRGQqvfC2fSWUfBmD/gj41biYA4
 CD6MnZyhCprJ0ZDmf7oZoiWiJmHYHwapUOzX7bQ7xPgL7k1Pw4B3e2n7nrHuWJdakdSh 1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xvyp61uyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Feb 2020 14:26:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9B8A810003A;
 Tue,  4 Feb 2020 14:26:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8FF402BC7BA;
 Tue,  4 Feb 2020 14:26:15 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 4 Feb 2020 14:26:15
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
Date: Tue, 4 Feb 2020 14:26:06 +0100
Message-ID: <20200204132606.20222-4-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204132606.20222-1-amelie.delaunay@st.com>
References: <20200204132606.20222-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-04_04:2020-02-04,
 2020-02-04 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/3] ARM: dts: stm32: enable USB OTG Dual Role
	on stm32mp157c-ev1
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

Now that st,stm32mp15-hsotg is used, dual role is supported. ID pin is
managed to detect the current role.
On stm32mp157c-ev1, Host mode requires a vbus-supply property. Charge pump
for vbus is provided by PMIC VBUS_OTG.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/boot/dts/stm32mp157c-ed1.dts | 4 ++++
 arch/arm/boot/dts/stm32mp157c-ev1.dts | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
index 1fc43251d697..c84f14b17371 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
@@ -355,6 +355,10 @@
 	status = "okay";
 };
 
+&usbotg_hs {
+	vbus-supply = <&vbus_otg>;
+};
+
 &usbphyc_port0 {
 	phy-supply = <&vdd_usb>;
 	vdda1v1-supply = <&reg11>;
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 228e35e16884..8f1fe0781d9f 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -353,7 +353,8 @@
 };
 
 &usbotg_hs {
-	dr_mode = "peripheral";
+	pinctrl-0 = <&usbotg_hs_pins_a>;
+	pinctrl-names = "default";
 	phys = <&usbphyc_port1 0>;
 	phy-names = "usb2-phy";
 	status = "okay";
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
