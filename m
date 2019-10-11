Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D1ED4218
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Oct 2019 16:05:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE412C36B16;
	Fri, 11 Oct 2019 14:05:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2283C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 14:05:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9BE15JT032062; Fri, 11 Oct 2019 16:05:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=iXQdHQC1Vzt4u1oBwlG3Nk7u0ghc+s1kyGaXxrAG8kI=;
 b=zvbvcJGDYCzbZNWkU5v9278dHQojZGQMtotVS3gFjzv9MydIg/xowaXQ5VnwMC+CR3ZT
 ocR7Ao3SLoO7vibbRMrr+tbWlsU8LWNX2d6u867UaywxFPtCgUHoSq8ipSHkNIjW7I3W
 hjU/R8KG3TAY+9KDEgJqA6GHq1gG7eL9sy82NJzaXdrlU/CeM6fDF5SjVEJpEoIAs67B
 2doleLmIzsWCbIUaG/bkudDRqn5Ol4LqB9ZhbRzsde5iUU6QIFhckwm3cjP2HFc3bDxm
 gyM3a5YducLshwrYnPM+D8s2r6yb8rq6TkztvGSnrgZ6AsGYfv+ZQ9qqiNS2keSTOU1m oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vej2ptnu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2019 16:05:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 88A1F10002A;
 Fri, 11 Oct 2019 16:05:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 774842A6AFE;
 Fri, 11 Oct 2019 16:05:04 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 11 Oct 2019 16:05:03 +0200
From: Pascal Paillet <p.paillet@st.com>
To: <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Fri, 11 Oct 2019 16:04:42 +0200
Message-ID: <20191011140445.32288-2-p.paillet@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011140445.32288-1-p.paillet@st.com>
References: <20191011140445.32288-1-p.paillet@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-11_08:2019-10-10,2019-10-11 signatures=0
Cc: p.paillet@st.com
Subject: [Linux-stm32] [PATCH 1/4] ARM: dts: stm32: add PWR regulators
	support on stm32mp157
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

This patch adds support of STM32 PWR regulators on
stm32mp157c. This replace dummy fixed regulators on
stm32mp157c-ed1 and stm32mp157c-dk2.

Signed-off-by: Pascal Paillet <p.paillet@st.com>
---
 arch/arm/boot/dts/stm32mp157a-avenger96.dts |  5 +++++
 arch/arm/boot/dts/stm32mp157a-dk1.dts       |  5 +++++
 arch/arm/boot/dts/stm32mp157c-dk2.dts       |  8 -------
 arch/arm/boot/dts/stm32mp157c-ed1.dts       | 21 +++++--------------
 arch/arm/boot/dts/stm32mp157c.dtsi          | 23 +++++++++++++++++++++
 5 files changed, 38 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
index 2e4742c53d04..5f35b0146017 100644
--- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
+++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
@@ -282,6 +282,11 @@
 	status = "okay";
 };
 
+&pwr_regulators {
+	vdd-supply = <&vdd>;
+	vdd_3v3_usbfs-supply = <&vdd_usb>;
+};
+
 &rng1 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
index 5ad4cef9e971..26fb7c77092c 100644
--- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
@@ -406,6 +406,11 @@
 	status = "okay";
 };
 
+&pwr_regulators {
+	vdd-supply = <&vdd>;
+	vdd_3v3_usbfs-supply = <&vdd_usb>;
+};
+
 &rng1 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/stm32mp157c-dk2.dts b/arch/arm/boot/dts/stm32mp157c-dk2.dts
index d44a7c6c2e20..d26adcbeba33 100644
--- a/arch/arm/boot/dts/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/stm32mp157c-dk2.dts
@@ -11,14 +11,6 @@
 / {
 	model = "STMicroelectronics STM32MP157C-DK2 Discovery Board";
 	compatible = "st,stm32mp157c-dk2", "st,stm32mp157";
-
-	reg18: reg18 {
-		compatible = "regulator-fixed";
-		regulator-name = "reg18";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-always-on;
-	};
 };
 
 &dsi {
diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
index 1d426ea8bdaf..1dbcc580e43c 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
@@ -74,22 +74,6 @@
 		serial0 = &uart4;
 	};
 
-	reg11: reg11 {
-		compatible = "regulator-fixed";
-		regulator-name = "reg11";
-		regulator-min-microvolt = <1100000>;
-		regulator-max-microvolt = <1100000>;
-		regulator-always-on;
-	};
-
-	reg18: reg18 {
-		compatible = "regulator-fixed";
-		regulator-name = "reg18";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-always-on;
-	};
-
 	sd_switch: regulator-sd_switch {
 		compatible = "regulator-gpio";
 		regulator-name = "sd_switch";
@@ -279,6 +263,11 @@
 	status = "okay";
 };
 
+&pwr_regulators {
+	vdd-supply = <&vdd>;
+	vdd_3v3_usbfs-supply = <&vdd_usb>;
+};
+
 &rng1 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index 9b11654a0a39..e0f3d4c62b4f 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -1079,6 +1079,29 @@
 			#reset-cells = <1>;
 		};
 
+		pwr_regulators: pwr@50001000 {
+			compatible = "st,stm32mp1,pwr-reg";
+			reg = <0x50001000 0x10>;
+
+			reg11: reg11 {
+				regulator-name = "reg11";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+			};
+
+			reg18: reg18 {
+				regulator-name = "reg18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			usb33: usb33 {
+				regulator-name = "usb33";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+			};
+		};
+
 		exti: interrupt-controller@5000d000 {
 			compatible = "st,stm32mp1-exti", "syscon";
 			interrupt-controller;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
