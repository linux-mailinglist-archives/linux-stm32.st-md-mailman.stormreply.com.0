Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 666D188BBBE
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 08:56:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7DE3C6B45B;
	Tue, 26 Mar 2024 07:56:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01487C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 07:56:02 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42Q7rht5020463; Tue, 26 Mar 2024 08:55:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=Na0dP/m
 dBs4BLxpEYdqbjgbAo3j03TJxGOWuR82MAOQ=; b=S4YxDNcoUGspfJQBA6y8fa1
 +MNSYdj2PJGI/bQ++DY9JwS3MLd8eUlasogLBsYuZcZrP1+i5P7AY4MulzM47ExC
 yQNSHCVuLikaRR13vrKMX1uDTwxARNkWcbUH0zNpt2gnWB/63m3hzItYgqpeJ1OF
 ANqWQX7LHnrbWOuho3Z+Xx6Nh5XD4dyMcddr8I6j2hLJAlNAsjJ86mPEgFHrsOwu
 7kIUmrq64Z25vCTUvY3iXUq9ZCocdqkc9RZ0OTdDtEcyg8H8va+C17mPNzMWBBpm
 v7q4ECKQOxU8MTBNYWM0qW/8dlHZiTZlcS0E1+759Ht12cPnG4VEUtA0WB5U/Qg=
 =
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x1qa342v7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Mar 2024 08:55:41 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 368DD40046;
 Tue, 26 Mar 2024 08:55:05 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 85EBB2105BE;
 Tue, 26 Mar 2024 08:54:41 +0100 (CET)
Received: from localhost (10.201.20.71) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 26 Mar
 2024 08:54:41 +0100
From: <patrice.chotard@foss.st.com>
To: <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, <alexandre.torgue@foss.st.com>
Date: Tue, 26 Mar 2024 08:54:38 +0100
Message-ID: <20240326075438.2891335-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.71]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_04,2024-03-21_02,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2] ARM: dts: stm32: add heartbeat led for
	stm32mp157c-ed1
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Add heartbeat led for stm32mp157c-ed1.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

V2 changes :
  _ add color and function properties.

 arch/arm/boot/dts/st/stm32mp157c-ed1.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
index 66ed5f9921ba..525d9ca7d576 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
@@ -10,6 +10,7 @@
 #include "stm32mp15-pinctrl.dtsi"
 #include "stm32mp15xxaa-pinctrl.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/mfd/st,stpmic1.h>
 
 / {
@@ -24,6 +25,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	led {
+		compatible = "gpio-leds";
+		led-blue {
+			gpios = <&gpiod 9 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "off";
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+
 	memory@c0000000 {
 		device_type = "memory";
 		reg = <0xC0000000 0x40000000>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
