Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A45B63606B5
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Apr 2021 12:11:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6961FC59781;
	Thu, 15 Apr 2021 10:11:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77632C58D64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 10:11:02 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FA2WmW022690; Thu, 15 Apr 2021 12:10:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=Q7RAsGh2Nu4pd56ble1suO8R8GEte9vH2lG9Xql2a90=;
 b=tudnyFsglqtH6Rw+D6HYnLE7w4t22vz9BrtzgIWo0UuwbFThw1YF/TezAnBk6Zt0sGDu
 oWnXEy9CGsy+SYwOGAZ/HcD0iTAQSfRN9So31d8bF4Hy67pYVzviqmcGrhrUTA1Knr3h
 1+EM6BLpYQlzLCsAMA5knoOx9r158y1dyepq5pILfTATCFDTZssanbkxle8CcDB0wmPh
 AoCgUIt015ceWJQDKEnTZs70MjpMK8qBPXWNJCVTHUsnluf7ky93YKxVNgzBI7b5DipC
 y9UwjRkFJo4o8S+5Mquna4KsA5oM4+QcY57Iwgk/Wm6p4YAxFoV3T7W/p2+hmRowM7oP Kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37xg6w1qaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 12:10:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4DCB310002A;
 Thu, 15 Apr 2021 12:10:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3DBF9226378;
 Thu, 15 Apr 2021 12:10:47 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 15 Apr 2021 12:10:46
 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: <arnd@arndb.de>, <robh+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 <jagan@amarulasolutions.com>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Marcin Sloniewski
 <marcin.sloniewski@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Thu, 15 Apr 2021 12:10:33 +0200
Message-ID: <20210415101037.1465-10-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210415101037.1465-1-alexandre.torgue@foss.st.com>
References: <20210415101037.1465-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_03:2021-04-15,
 2021-04-15 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, kuba@kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 09/13] ARM: dts: stm32: fix stpmic node for
	stm32mp1 boards
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

On some STM32 MP15 boards, stpmic node is not correct which generates
warnings running "make dtbs_check W=1" command. Issues are:

-"regulator-active-discharge" is not a boolean but an uint32.
-"regulator-over-current-protection" is not a valid entry for vref_ddr.
-LDO4 has a fixed voltage (3v3) so min/max entries are not allowed.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/arch/arm/boot/dts/stm32mp157a-stinger96.dtsi b/arch/arm/boot/dts/stm32mp157a-stinger96.dtsi
index 113c48b2ef93..a4b14ef3caee 100644
--- a/arch/arm/boot/dts/stm32mp157a-stinger96.dtsi
+++ b/arch/arm/boot/dts/stm32mp157a-stinger96.dtsi
@@ -184,8 +184,6 @@
 
 			vdd_usb: ldo4 {
 				regulator-name = "vdd_usb";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
 				interrupts = <IT_CURLIM_LDO4 0>;
 			};
 
@@ -208,7 +206,6 @@
 			vref_ddr: vref_ddr {
 				regulator-name = "vref_ddr";
 				regulator-always-on;
-				regulator-over-current-protection;
 			};
 
 			bst_out: boost {
@@ -219,13 +216,13 @@
 			vbus_otg: pwr_sw1 {
 				regulator-name = "vbus_otg";
 				interrupts = <IT_OCP_OTG 0>;
-				regulator-active-discharge;
+				regulator-active-discharge = <1>;
 			};
 
 			vbus_sw: pwr_sw2 {
 				regulator-name = "vbus_sw";
 				interrupts = <IT_OCP_SWOUT 0>;
-				regulator-active-discharge;
+				regulator-active-discharge = <1>;
 			};
 		};
 
diff --git a/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi b/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi
index 6cf49a0a9e69..0c0b66788ea1 100644
--- a/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi
@@ -173,8 +173,6 @@
 
 			vdd_usb: ldo4 {
 				regulator-name = "vdd_usb";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
 				interrupts = <IT_CURLIM_LDO4 0>;
 			};
 
@@ -197,7 +195,6 @@
 			vref_ddr: vref_ddr {
 				regulator-name = "vref_ddr";
 				regulator-always-on;
-				regulator-over-current-protection;
 			};
 
 			 bst_out: boost {
@@ -213,7 +210,7 @@
 			 vbus_sw: pwr_sw2 {
 				regulator-name = "vbus_sw";
 				interrupts = <IT_OCP_SWOUT 0>;
-				regulator-active-discharge;
+				regulator-active-discharge = <1>;
 			 };
 		};
 
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index 272a1a67a9ad..769fcf74685a 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -327,8 +327,6 @@
 
 			vdd_usb: ldo4 {
 				regulator-name = "vdd_usb";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
 				interrupts = <IT_CURLIM_LDO4 0>;
 			};
 
@@ -350,7 +348,6 @@
 			vref_ddr: vref_ddr {
 				regulator-name = "vref_ddr";
 				regulator-always-on;
-				regulator-over-current-protection;
 			};
 
 			bst_out: boost {
@@ -366,7 +363,7 @@
 			vbus_sw: pwr_sw2 {
 				regulator-name = "vbus_sw";
 				interrupts = <IT_OCP_SWOUT 0>;
-				regulator-active-discharge;
+				regulator-active-discharge = <1>;
 			};
 		};
 
diff --git a/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi b/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
index 713485a95795..6706d8311a66 100644
--- a/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
@@ -146,8 +146,6 @@
 
 			vdd_usb: ldo4 {
 				regulator-name = "vdd_usb";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
 				interrupts = <IT_CURLIM_LDO4 0>;
 			};
 
@@ -171,7 +169,6 @@
 			vref_ddr: vref_ddr {
 				regulator-name = "vref_ddr";
 				regulator-always-on;
-				regulator-over-current-protection;
 			};
 
 			bst_out: boost {
@@ -182,13 +179,13 @@
 			vbus_otg: pwr_sw1 {
 				regulator-name = "vbus_otg";
 				interrupts = <IT_OCP_OTG 0>;
-				regulator-active-discharge;
+				regulator-active-discharge = <1>;
 			};
 
 			vbus_sw: pwr_sw2 {
 				regulator-name = "vbus_sw";
 				interrupts = <IT_OCP_SWOUT 0>;
-				regulator-active-discharge;
+				regulator-active-discharge = <1>;
 			};
 		};
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
