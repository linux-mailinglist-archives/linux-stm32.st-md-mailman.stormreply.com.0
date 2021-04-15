Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C453606B2
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Apr 2021 12:11:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34664C58D79;
	Thu, 15 Apr 2021 10:11:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADF65C58D5D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 10:11:01 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FAAjiB025351; Thu, 15 Apr 2021 12:10:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=aDEfqJZ03pN13kIb7KCcqKMAKGHSDmPqSeW9wyMeTwc=;
 b=l2313y8dvdtj2kUo56/KGFtAU6gAimZvRKgYrcI2KLzJIGra5L9wvoSiS4U+Q2dgo58t
 o9GVFlBXjJ4//fz/fGf6OVOFLIWu3BvdIUiIksgF6Rv/0nMyoFzV7zOp1cKbTFQOEFYf
 xEhmq+/5tqQWo0UihfNKPY8Mz8U/rreFSaFUSqx+KGXhzjczrfSUJGl4nfJaLos2iI9r
 XFvK/x0Bcm1UBvQs25G1gArCJkQR5USUIeY/dnBeH7tiSG/BxdCW8vqzuyNAONdKAfej
 AnMhaCctjb0J1pqX2FObL/GGbpMfGsQhmlYsiHzSlGtI59m9u8SZYWBnArzcn87YJXvh xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37xes0t60k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 12:10:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C005C10002A;
 Thu, 15 Apr 2021 12:10:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B0AB7226378;
 Thu, 15 Apr 2021 12:10:49 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 15 Apr 2021 12:10:49
 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: <arnd@arndb.de>, <robh+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 <jagan@amarulasolutions.com>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Marcin Sloniewski
 <marcin.sloniewski@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Thu, 15 Apr 2021 12:10:36 +0200
Message-ID: <20210415101037.1465-13-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210415101037.1465-1-alexandre.torgue@foss.st.com>
References: <20210415101037.1465-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_03:2021-04-15,
 2021-04-15 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, kuba@kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 12/13] ARM: dts: stm32: fix DSI port node on
	STM32MP15
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

Running "make dtbs_check W=1", some warnings are reported concerning
DSI. This patch reorder DSI nodes to avoid:

soc/dsi@5a000000: unnecessary #address-cells/#size-cells without
"ranges" or child "reg" property

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/arch/arm/boot/dts/stm32mp157.dtsi b/arch/arm/boot/dts/stm32mp157.dtsi
index 54e73ccea446..c355fcf26ec3 100644
--- a/arch/arm/boot/dts/stm32mp157.dtsi
+++ b/arch/arm/boot/dts/stm32mp157.dtsi
@@ -24,8 +24,6 @@
 			clock-names = "pclk", "ref", "px_clk";
 			resets = <&rcc DSI_R>;
 			reset-names = "apb";
-			#address-cells = <1>;
-			#size-cells = <0>;
 			status = "disabled";
 
 			ports {
diff --git a/arch/arm/boot/dts/stm32mp157c-dk2.dts b/arch/arm/boot/dts/stm32mp157c-dk2.dts
index 19ef475a48fc..763dde1dbbaf 100644
--- a/arch/arm/boot/dts/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/stm32mp157c-dk2.dts
@@ -36,6 +36,8 @@
 &dsi {
 	status = "okay";
 	phy-dsi-supply = <&reg18>;
+	#address-cells = <1>;
+	#size-cells = <0>;
 
 	ports {
 		port@0 {
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 6fe5b0fee7c4..4625bb58cc6d 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -102,6 +102,8 @@
 &dsi {
 	phy-dsi-supply = <&reg18>;
 	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
 
 	ports {
 		port@0 {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
