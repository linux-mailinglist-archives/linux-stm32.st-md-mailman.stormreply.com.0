Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA4E6CC6A7
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Mar 2023 17:37:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF850C6A5FD;
	Tue, 28 Mar 2023 15:37:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9EAFBC6A5FA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 15:37:52 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32SE1oum016476; Tue, 28 Mar 2023 17:37:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=FKaGslI7jPasSK/fcfNSrjsxE74p6Mh867fEXA6JvJs=;
 b=AdWQXBLTWZSdXDXIAG9Ib96Yh7EelNZbeFOAb43REPs3YuGEVaxl5mPlF2lkxmq1yP5+
 VgcvWtDdNS9ghtS0b1lA9hgRdkis3SvgAR4esk7wEW4KNB/0eBd5ayZnev5j3KambqCn
 RWgA4QNXZY3HoTGQ63rnYrQJBmxksO9KDwluh/8Lfeg+wLIQ+Oye3LERQT7RdqUjFRL8
 5x8nVxpc4CnATQWs58CBDCnGC5k1wO8chV+fbEKNTd/v3+HV6xyjhaLFu2IUFjueNt8s
 VB+shaWu+4TBkte7dM9AHi1aZUC7RdGHSfObMfYcTlI9T4QOD2vDo+3zwcHuyMD5DpX+ CA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pkwvsaamy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 17:37:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7FBAF100034;
 Tue, 28 Mar 2023 17:37:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 79DBE2194F9;
 Tue, 28 Mar 2023 17:37:38 +0200 (CEST)
Received: from localhost (10.201.20.168) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 28 Mar
 2023 17:37:38 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 28 Mar 2023 17:37:20 +0200
Message-ID: <20230328153723.498672-4-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230328153723.498672-1-valentin.caron@foss.st.com>
References: <20230328153723.498672-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/6] ARM: dts: stm32: clean uart aliases on
	stm32mp15xx-exx boards
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

Remove duplicates and clean uart aliases.
Uart aliases and uart pins should be declared and associated to
uart instance at the same time.

Put also aliases node above chosen node as same as stm32mp157c-dk2.dts.

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 arch/arm/boot/dts/stm32mp157c-ed1.dts | 8 ++++----
 arch/arm/boot/dts/stm32mp157c-ev1.dts | 9 ++++-----
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
index b1eb688a278a..2dfde6292668 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
@@ -16,6 +16,10 @@ / {
 	model = "STMicroelectronics STM32MP157C eval daughter";
 	compatible = "st,stm32mp157c-ed1", "st,stm32mp157";
 
+	aliases {
+		serial0 = &uart4;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -72,10 +76,6 @@ gpu_reserved: gpu@e8000000 {
 		};
 	};
 
-	aliases {
-		serial0 = &uart4;
-	};
-
 	sd_switch: regulator-sd_switch {
 		compatible = "regulator-gpio";
 		regulator-name = "sd_switch";
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 542226cfcfdf..ba8e9d9a42fa 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -14,16 +14,15 @@ / {
 	model = "STMicroelectronics STM32MP157C eval daughter on eval mother";
 	compatible = "st,stm32mp157c-ev1", "st,stm32mp157c-ed1", "st,stm32mp157";
 
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
 	aliases {
-		serial0 = &uart4;
 		serial1 = &usart3;
 		ethernet0 = &ethernet0;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	clocks {
 		clk_ext_camera: clk-ext-camera {
 			#clock-cells = <0>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
