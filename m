Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8075FEB8E
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Oct 2022 11:27:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B6DAC65042;
	Fri, 14 Oct 2022 09:27:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60E4AC65040
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 09:27:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29E8kGsL008745;
 Fri, 14 Oct 2022 11:27:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=q0/OPFW5hO7+SZAXVi2/9OJBTnFnuvo2YL06oJLX+y8=;
 b=Q/tqyT/aO7EdVq/i5F0dJZAbQqtbNcnzX1QG95Ou1Uz9z8ggimYD27bOs8U5ZeStPndH
 gnLxQvN2PSgNztwc9p+wj4Lnj+9FHtmlfEQwmmE/OGMQu8H74mqJEKxfCWZZ7s+NfNbG
 5LpI90Rr1gbT0MCIDY59Fm/yq8jqgzuyBUVX5kYHLFV6MKIJCSgb/1z3xpeIgtH0LXGc
 4RB6ggzcXJ11WN2XNx/fXYtAWuryXI0qPqPeWN5X950PLFG4TdDww/3ZQzK1e/YBFGIZ
 ruaz+jhqIHS5iOqoyZq/ZYBGFCGCzKTfcltjn2ze3c6+3BtQ39xwqBWPfjO2Zp71gG0h wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k6h7v7ge2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 11:27:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EFE8D10002A;
 Fri, 14 Oct 2022 11:27:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E7E0021A905;
 Fri, 14 Oct 2022 11:27:35 +0200 (CEST)
Received: from localhost (10.75.127.116) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 14 Oct
 2022 11:27:32 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <alexandre.torgue@foss.st.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>
Date: Fri, 14 Oct 2022 11:26:43 +0200
Message-ID: <20221014092651.25202-3-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221014092651.25202-1-fabrice.gasnier@foss.st.com>
References: <20221014092651.25202-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_05,2022-10-13_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 02/10] ARM: dts: stm32: add USBPHYC and dual
	USB HS PHY support on stm32mp131
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

From: Amelie Delaunay <amelie.delaunay@foss.st.com>

This patch adds support for USBPHYC and its two USB HS PHY on stm32mp131.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm/boot/dts/stm32mp131.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
index e0e0e27a9221..cd31fdd47536 100644
--- a/arch/arm/boot/dts/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/stm32mp131.dtsi
@@ -409,6 +409,29 @@ iwdg2: watchdog@5a002000 {
 			status = "disabled";
 		};
 
+		usbphyc: usbphyc@5a006000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <0>;
+			compatible = "st,stm32mp1-usbphyc";
+			reg = <0x5a006000 0x1000>;
+			clocks = <&rcc USBPHY_K>;
+			resets = <&rcc USBPHY_R>;
+			vdda1v1-supply = <&reg11>;
+			vdda1v8-supply = <&reg18>;
+			status = "disabled";
+
+			usbphyc_port0: usb-phy@0 {
+				#phy-cells = <0>;
+				reg = <0>;
+			};
+
+			usbphyc_port1: usb-phy@1 {
+				#phy-cells = <1>;
+				reg = <1>;
+			};
+		};
+
 		rtc: rtc@5c004000 {
 			compatible = "st,stm32mp1-rtc";
 			reg = <0x5c004000 0x400>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
