Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8374BA2C593
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Feb 2025 15:35:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 334C2C78F8F;
	Fri,  7 Feb 2025 14:35:56 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2118.outbound.protection.outlook.com [40.107.22.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DBFAC78F8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Feb 2025 14:35:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+5Vp5zNUFp/GlD8OZpY4k75Ot+6bIeVCRBWfnwkpeQeOHt0tZ1K6xfZD5bqo+taZ/pG2jHF2X7eEwh1nFOw2tJ4mk9U6P1juqUVtIvrIRHWr0zSujJx3BmJ/pW25nX5PL8bw1cpYa+7oarf2P+Lo64rWUEWoZgxZqQvOAj1hQ9y9L3Evi+ZxpYqOBPCuTab/DDVX1FlipygMd69kL8N5X3gB5xMmQ/ZbWuVbUHLcpN14JOk2C9BTFMN94NdQl4ldTFiVNB2BO4Sh4wu3OZgX25c4FUIZmdToVmgNtcYyp9jY0H2gyzs40AVfTGldNVafbzbqpI1JLbQw3IMdx61uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nyfGDNf1BUXv5TskihyMGhR7ipgLkBQ2c4yd1xoBs3s=;
 b=Ts0wCoh8j+y0ae78svPxxr43hixVjuc8D0ZjS/mfi2kB3TAAT2HHuBMnrzF1aZrilQuEc9S2MKVtqcvrpSjqS3SLb0sTeB+xNouTgeTeRgYSFjymovWIag9/Qeo8xkcvI59etYHJ8qmXojJRLJZpMqn2iFYhs6xEfW3MB6K9vdqfbT5esiee0aasI/Rck0juVMNW7Kf0p7ZOPgyMvTq18YjCfyDAlWccl4lKYcIww8jWFe73N/Kcj0fJasna0IQZ2vgU2ptVqAKOX6xnfBP2CsSH7KxVo6PtCEo8psZDzWW2jP9+chmC2+xHkXdPkzMROUfjALe4BnMlzEFSKdD4ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=phytec.fr; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.fr; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyfGDNf1BUXv5TskihyMGhR7ipgLkBQ2c4yd1xoBs3s=;
 b=MNvA69H4/+z5zkalkKID4s07nvodDKHck97/aNcEye8K80FCk+AXU2KTxrvD074k0yr1FuK3aaN6N3VH+bIKPcBcDDuG5sM8uxRNm7FkdmjJZnmPJTRpWxkl4m2r/ZhsbegFPCItZQyygJnlloaIyiJZ9rtGFvNfevIJKnz8QT0=
Received: from DB6PR0301CA0090.eurprd03.prod.outlook.com (2603:10a6:6:30::37)
 by AS8P195MB1365.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:3c2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Fri, 7 Feb
 2025 14:35:54 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:6:30:cafe::56) by DB6PR0301CA0090.outlook.office365.com
 (2603:10a6:6:30::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Fri,
 7 Feb 2025 14:35:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 14:35:53 +0000
Received: from Berlix.phytec.de (172.25.0.12) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 7 Feb
 2025 15:35:52 +0100
Received: from Diagnostix.phytec.de (172.25.0.14) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 7 Feb
 2025 15:35:52 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 7 Feb 2025 15:35:52 +0100
Received: from pc.. ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025020715355194-61 ; Fri, 7 Feb 2025 15:35:51 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 7 Feb 2025 15:35:43 +0100
Message-ID: <20250207143550.432541-5-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207143550.432541-1-c.parant@phytec.fr>
References: <20250207143550.432541-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 07.02.2025 15:35:51,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 07.02.2025 15:35:52
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C6:EE_|AS8P195MB1365:EE_
X-MS-Office365-Filtering-Correlation-Id: ba1c8d82-1dde-4b7e-dd9b-08dd4784ba06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eQW6WsJLLnpWuiqOp3NBmIqAXZXyJo8JcLyVmVigKWPKtCUnfTzn8prwo41z?=
 =?us-ascii?Q?iMuX7xaK9LYtMlGovPaxZKJ09+y/zGDA5yx8jQv4BDDNo7K8K7fEQ2iReyR1?=
 =?us-ascii?Q?dnnTwsF9JyNNuy6lAEwX0zbg/bzY8+0C/63OlLOvqxT9k0GokSllTb80iA8F?=
 =?us-ascii?Q?Nl6qy/aY8/ThR9H36skR89k8AMJcUXH0dSnFVSxpifuovmLvWsm9RRG4MnDT?=
 =?us-ascii?Q?cVsZtfdLVY0JaOujmNyeFm0/MJK7kVEViwdgk43agNaxtsGpDOJGWLA3YXmY?=
 =?us-ascii?Q?YuqR/UzG9Z3NviQZC/hwOXuYtsrAxWpcVtXA6ZcM6KAdK6oESIbT1BRMN3v0?=
 =?us-ascii?Q?ARYeccmI+Mt6z/tJZQIHcxLCHZFiS2C4O3lG8CUXoipWzY2jnNmwG15eAsAk?=
 =?us-ascii?Q?/FfeKKVvRrAVTYlO5GgpxoOG61/069u7c3SccXAHnVDUZnxN027cZHUk2YuG?=
 =?us-ascii?Q?/nFKxqSSJvCm674AFNULCqd9jWdYnwnP33LBvKk8qdUnYP+wSECYtdd6l9j9?=
 =?us-ascii?Q?zqcPiySKFigBTrxPp749emDlBv+1KP5vaBiOCQDMKgILCq4/xvPUcYAdV7ZI?=
 =?us-ascii?Q?ZIYDbx7usJguS+JBG8D2QIILupe4FFlPwQvmajCFDEKPy07Q+vvI2tmw0KaA?=
 =?us-ascii?Q?imdAK0toThfiaX2HfJQwC8whcUql/7YzH4Z86Kp0gnjmbPkA7UBCQNxzyrgo?=
 =?us-ascii?Q?AaSi8X6afJS8ZCkBJEiF3avM4AY6N091onFUcZ4PLuBAVNqy7eKi7v85h1pO?=
 =?us-ascii?Q?n9HZkC3W3Cm67vdbHlvk1nw4mnefxOK7m8jz//0DIaB4yz83/sUCD7pIy8Ap?=
 =?us-ascii?Q?MjBJ9MKfDu1DfQVuNDsk3VaH/fR3pTksjRF2wxhCF+/YHTl42lF9dupT/DJ8?=
 =?us-ascii?Q?Qi6eFxgl0qnSW7tnP91g9QJH0BVVV7CGR7AUK5ihhD+S2Z2BCyp+O3hN76p/?=
 =?us-ascii?Q?aIZgjCnoqwOgky+xMba4y8aykiYe3B0BS83EoEFtJLZ/jniGr8TE/JT2BrVu?=
 =?us-ascii?Q?wL+mp92CPM0LWnOc4hz6RAP3fgkQyS1nUF3Wu4AwKSIACSL9wZmnZ34mFlhh?=
 =?us-ascii?Q?OdslHyGwE2nXxFIkmTtkjMpoIbi4WgwLq/kDNtj4ocCnEtN7ovE6av16bMJP?=
 =?us-ascii?Q?ImWEjZ77O7ZT39uTS7g0xOjkWEg2wXMOMycwp7enbGSdBzkrJAi2izpo3PFL?=
 =?us-ascii?Q?bhfagOC33lKUiJclWGLH+pSMzByJsImbq2NQXFm8roeT3G/f/szcAOXPkHeR?=
 =?us-ascii?Q?Tmjp1lcHVNeBD2/BHMaMxliJoJSq1EDFCrriCuaFwdFlIpmyrxR/ULb+9q/C?=
 =?us-ascii?Q?NwaHRSEabinjP0WPKABeMXeSrSNyUi0R6EK0Ce2/MdgDTtfsR677C3/oqeT7?=
 =?us-ascii?Q?4PYwHqT1G0sXPTyVy7noQftDMaMyD+44Sj7bG1ifTsKZ+R+MMzvt098XqZ6O?=
 =?us-ascii?Q?nd7teTxi/iRsqsJGa3Cyy87ASJBKq2O9juBtKFSxC+WlW4cfhqiq7c7+Dug5?=
 =?us-ascii?Q?edFM2cuTz+98NnQ=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 14:35:53.7964 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1c8d82-1dde-4b7e-dd9b-08dd4784ba06
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB1365
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH v2 04/11] ARM: dts: stm32mp15: Add new pinmux
	groups for phycore and phyboard
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

Add add alternate pinmux for following interfaces used on
phyBOARD-Sargas:
- UART4
- LTDC
- DCMI
- TIM5
- SAI2

Fix "ethernet0_rgmii_pins_d" pinmux used on phyCORE-STM32MP15x:
ETH_RGMII_GTX_CLK pin was missing.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi | 164 ++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
index 95fafc51a1c8..963d8616f3c1 100644
--- a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
@@ -216,6 +216,45 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	dcmi_pins_d: dcmi-3 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 8,  AF13)>,/* DCMI_HSYNC */
+				 <STM32_PINMUX('B', 7,  AF13)>,/* DCMI_VSYNC */
+				 <STM32_PINMUX('A', 6,  AF13)>,/* DCMI_PIXCLK */
+				 <STM32_PINMUX('H', 9,  AF13)>,/* DCMI_D0 */
+				 <STM32_PINMUX('C', 7,  AF13)>,/* DCMI_D1 */
+				 <STM32_PINMUX('E', 0,  AF13)>,/* DCMI_D2 */
+				 <STM32_PINMUX('E', 1,  AF13)>,/* DCMI_D3 */
+				 <STM32_PINMUX('H', 14, AF13)>,/* DCMI_D4 */
+				 <STM32_PINMUX('I', 4,  AF13)>,/* DCMI_D5 */
+				 <STM32_PINMUX('E', 5,  AF13)>,/* DCMI_D6 */
+				 <STM32_PINMUX('I', 7,  AF13)>,/* DCMI_D7 */
+				 <STM32_PINMUX('I', 1,  AF13)>,/* DCMI_D8 */
+				 <STM32_PINMUX('H', 7,  AF13)>;/* DCMI_D9 */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	dcmi_sleep_pins_d: dcmi-sleep-3 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 8,  ANALOG)>,/* DCMI_HSYNC */
+				 <STM32_PINMUX('B', 7,  ANALOG)>,/* DCMI_VSYNC */
+				 <STM32_PINMUX('A', 6,  ANALOG)>,/* DCMI_PIXCLK */
+				 <STM32_PINMUX('H', 9,  ANALOG)>,/* DCMI_D0 */
+				 <STM32_PINMUX('C', 7,  ANALOG)>,/* DCMI_D1 */
+				 <STM32_PINMUX('E', 0,  ANALOG)>,/* DCMI_D2 */
+				 <STM32_PINMUX('E', 1,  ANALOG)>,/* DCMI_D3 */
+				 <STM32_PINMUX('H', 14, ANALOG)>,/* DCMI_D4 */
+				 <STM32_PINMUX('I', 4,  ANALOG)>,/* DCMI_D5 */
+				 <STM32_PINMUX('E', 5,  ANALOG)>,/* DCMI_D6 */
+				 <STM32_PINMUX('I', 7,  ANALOG)>,/* DCMI_D7 */
+				 <STM32_PINMUX('I', 1,  ANALOG)>,/* DCMI_D8 */
+				 <STM32_PINMUX('H', 7,  ANALOG)>;/* DCMI_D9 */
+		};
+	};
+
 	/omit-if-no-ref/
 	ethernet0_rgmii_pins_a: rgmii-0 {
 		pins1 {
@@ -379,6 +418,7 @@ pins1 {
 	ethernet0_rgmii_pins_d: rgmii-3 {
 		pins1 {
 			pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('G', 4, AF11)>, /* ETH_RGMII_GTX_CLK */
 				 <STM32_PINMUX('G', 13, AF11)>,	/* ETH_RGMII_TXD0 */
 				 <STM32_PINMUX('G', 14, AF11)>,	/* ETH_RGMII_TXD1 */
 				 <STM32_PINMUX('C', 2, AF11)>, /* ETH_RGMII_TXD2 */
@@ -1220,6 +1260,65 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	ltdc_pins_f: ltdc-5 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 7,  AF14)>, /* LCD_CLK */
+				 <STM32_PINMUX('I', 10, AF14)>, /* LCD_HSYNC */
+				 <STM32_PINMUX('I', 9,  AF14)>, /* LCD_VSYNC */
+				 <STM32_PINMUX('E', 13, AF14)>, /* LCD_DE */
+				 <STM32_PINMUX('C', 10, AF14)>, /* LCD_R2 */
+				 <STM32_PINMUX('B', 0,   AF9)>, /* LCD_R3 */
+				 <STM32_PINMUX('H', 10, AF14)>, /* LCD_R4 */
+				 <STM32_PINMUX('H', 11, AF14)>, /* LCD_R5 */
+				 <STM32_PINMUX('H', 12, AF14)>, /* LCD_R6 */
+				 <STM32_PINMUX('E', 15, AF14)>, /* LCD_R7 */
+				 <STM32_PINMUX('H', 13, AF14)>, /* LCD_G2 */
+				 <STM32_PINMUX('E', 11, AF14)>, /* LCD_G3 */
+				 <STM32_PINMUX('H', 15, AF14)>, /* LCD_G4 */
+				 <STM32_PINMUX('H', 4,   AF9)>, /* LCD_G5 */
+				 <STM32_PINMUX('I', 11,  AF9)>, /* LCD_G6 */
+				 <STM32_PINMUX('I', 2,  AF14)>, /* LCD_G7 */
+				 <STM32_PINMUX('G', 10, AF14)>, /* LCD_B2 */
+				 <STM32_PINMUX('G', 11, AF14)>, /* LCD_B3 */
+				 <STM32_PINMUX('E', 12, AF14)>, /* LCD_B4 */
+				 <STM32_PINMUX('I', 5,  AF14)>, /* LCD_B5 */
+				 <STM32_PINMUX('B', 8,  AF14)>, /* LCD_B6 */
+				 <STM32_PINMUX('D', 8,  AF14)>; /* LCD_B7 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+	};
+
+	/omit-if-no-ref/
+	ltdc_sleep_pins_f: ltdc-sleep-5 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 7,  ANALOG)>, /* LCD_CLK */
+				 <STM32_PINMUX('I', 10, ANALOG)>, /* LCD_HSYNC */
+				 <STM32_PINMUX('I', 9,  ANALOG)>, /* LCD_VSYNC */
+				 <STM32_PINMUX('E', 13, ANALOG)>, /* LCD_DE */
+				 <STM32_PINMUX('C', 10, ANALOG)>, /* LCD_R2 */
+				 <STM32_PINMUX('B', 0,  ANALOG)>, /* LCD_R3 */
+				 <STM32_PINMUX('H', 10, ANALOG)>, /* LCD_R4 */
+				 <STM32_PINMUX('H', 11, ANALOG)>, /* LCD_R5 */
+				 <STM32_PINMUX('H', 12, ANALOG)>, /* LCD_R6 */
+				 <STM32_PINMUX('E', 15, ANALOG)>, /* LCD_R7 */
+				 <STM32_PINMUX('H', 13, ANALOG)>, /* LCD_G2 */
+				 <STM32_PINMUX('E', 11, ANALOG)>, /* LCD_G3 */
+				 <STM32_PINMUX('H', 15, ANALOG)>, /* LCD_G4 */
+				 <STM32_PINMUX('H', 4,  ANALOG)>, /* LCD_G5 */
+				 <STM32_PINMUX('I', 11, ANALOG)>, /* LCD_G6 */
+				 <STM32_PINMUX('I', 2,  ANALOG)>, /* LCD_G7 */
+				 <STM32_PINMUX('G', 10, ANALOG)>, /* LCD_B2 */
+				 <STM32_PINMUX('G', 11, ANALOG)>, /* LCD_B3 */
+				 <STM32_PINMUX('E', 12, ANALOG)>, /* LCD_B4 */
+				 <STM32_PINMUX('I', 5,  ANALOG)>, /* LCD_B5 */
+				 <STM32_PINMUX('B', 8,  ANALOG)>, /* LCD_B6 */
+				 <STM32_PINMUX('D', 8,  ANALOG)>; /* LCD_B7 */
+		};
+	};
+
 	/omit-if-no-ref/
 	mco1_pins_a: mco1-0 {
 		pins {
@@ -1543,6 +1642,23 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	pwm5_pins_c: pwm5-2 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 0, AF2)>; /* TIM5_CH4 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm5_sleep_pins_c: pwm5-sleep-2 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 0, ANALOG)>; /* TIM5_CH4 */
+		};
+	};
+
 	/omit-if-no-ref/
 	pwm8_pins_a: pwm8-0 {
 		pins {
@@ -1768,6 +1884,21 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sai2a_pins_d: sai2a-3 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 6, AF10)>; /* SAI2_SD_A */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	sai2a_sleep_pins_d: sai2a-3 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 6, ANALOG)>; /* SAI2_SD_A */
+		};
+	};
+
 	/omit-if-no-ref/
 	sai2b_pins_a: sai2b-0 {
 		pins1 {
@@ -2600,6 +2731,39 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	uart4_pins_e: uart4-4 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 9, AF8)>; /* UART4_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4_idle_pins_e: uart4-idle-4 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 9, ANALOG)>; /* UART4_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart4_sleep_pins_e: uart4-sleep-4 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 9, ANALOG)>, /* UART4_TX */
+				 <STM32_PINMUX('B', 2, ANALOG)>; /* UART4_RX */
+		};
+	};
+
 	/omit-if-no-ref/
 	uart5_pins_a: uart5-0 {
 		pins1 {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
