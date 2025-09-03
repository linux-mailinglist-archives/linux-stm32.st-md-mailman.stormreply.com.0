Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD98B41AAC
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 11:54:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DE6BC3FACD;
	Wed,  3 Sep 2025 09:54:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25374C3F956
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 09:54:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5839lVCA011971;
 Wed, 3 Sep 2025 11:54:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 kr0qsv6QevC8O4Vu08rbDlOZZqjwFJtz5rUmJDaOsGA=; b=VsTEhjG5tkbM2PwB
 KtYjW8Q3Q9BQO01q/r8PVnPvPB8d2Z/Tw11jzAwha/vvs4qfXt19SZYyujqrq2yR
 V7uXAKJgqYcR3xvbXs8oHh1ia4afBlBDrkYcqzKnwNaHmWWvAHwqHpIqo6FeFsmz
 qxcubyAu+FlXGNiwai1oqjRp5ZxNfGSKkktT25I9veheKPhY+NBM7JYCRGcRppUr
 75GCk3URBkQL/A8S4ujbwuIbTI8KuFtuehHM6sxnFfVH6H8VYBhY5QVkg70KGirA
 zGh1H5YwI+5vbyb9RPB5bhjUBhiPAq6eY1XiAM37Bb53PF9xlTznj2VO4CaWuSGf
 KlBcRA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48ur6fqnu8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Sep 2025 11:54:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 06B6B4004B;
 Wed,  3 Sep 2025 11:53:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 59CE52B5137;
 Wed,  3 Sep 2025 11:53:14 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 11:53:14 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 3 Sep 2025 11:53:04 +0200
MIME-Version: 1.0
Message-ID: <20250903-mp2_ethernet-v1-3-4105b0ad2344@foss.st.com>
References: <20250903-mp2_ethernet-v1-0-4105b0ad2344@foss.st.com>
In-Reply-To: <20250903-mp2_ethernet-v1-0-4105b0ad2344@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/4] arm64: dts: st: enable ethernet1
 controller on stm32mp257f-ev1
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

ethernet1 controller is connected to the RTL8211F-CG Realtek PHY in
RGMII mode. It can either be used as a standalone Ethernet controller
or be connected to the internal TSN capable switch. For this board,
keep the standalone setup. Also enable this peripheral on the
stm32mp257f-ev1 board.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 4ff334563599b46e987474076798337e75e16ef7..725846dfaac925646f43db542ed803dd7b9d85dd 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -19,6 +19,7 @@ / {
 
 	aliases {
 		ethernet0 = &ethernet2;
+		ethernet1 = &ethernet1;
 		serial0 = &usart2;
 		serial1 = &usart6;
 	};
@@ -133,6 +134,30 @@ dcmipp_0: endpoint {
 	};
 };
 
+&ethernet1 {
+	pinctrl-0 = <&eth1_rgmii_pins_a &eth1_mdio_pins_a>;
+	pinctrl-1 = <&eth1_rgmii_sleep_pins_a &eth1_mdio_sleep_pins_a>;
+	pinctrl-names = "default", "sleep";
+	max-speed = <1000>;
+	phy-handle = <&phy1_eth1>;
+	phy-mode = "rgmii-id";
+	st,ext-phyclk;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		phy1_eth1: ethernet-phy@4 {
+			compatible = "ethernet-phy-id001c.c916";
+			reset-gpios =  <&gpioj 9 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <80000>;
+			reg = <4>;
+		};
+	};
+};
+
 &ethernet2 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&eth2_rgmii_pins_a>;

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
