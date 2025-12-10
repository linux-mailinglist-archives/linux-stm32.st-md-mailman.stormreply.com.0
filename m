Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 795BBCB2A68
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Dec 2025 11:16:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AC27C5F1FB;
	Wed, 10 Dec 2025 10:16:20 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11021112.outbound.protection.outlook.com
 [40.107.130.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37CDFC5F1FA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Dec 2025 10:16:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdz0j02cAYcYVo0/6NKwb/zKzxPxaWSrQ9FRfONq0GLWrHeqPVpgiC1FIIi6YTGaKkvd/LGirkzAwSM9l/p6cYwBJNhgENkWLcujs898dpO7ZgWqhfNppwAYpl4zQQHfTL7x3b+WpjpBzQY9V0Lv4+t9Y/oug3CX7MQwF3R5a2ry8EIdBKE+eft7/v2p3Q+TQ4Uf4q67u24Og9H3dsLNLmKDJsoVbeQ4yphKHbAQljXlQkyRxJctI70QrDAOZI23yptYzMlvGyzyBZO+tMQO4AKcruL2Ul+bWL+JyOzq7Q8m30ef3DOrgkNK41oqRE3Kwj4PwVGl0RLwL5NhNyiWtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCpGj14y8qnWzSxrj6VdBuo5/QZItUYGIcekqKER1Go=;
 b=kZplxndKw8pAWD3yP1iy7blWYiJnEkJT/pebcexiHYEQwQWEDXxJT+QOKuTVcO9cHusxQZ1kTPAzi6kGgOxFNC++DV/KYChx7MasZIW4VsEyKJf48zAIQPu7aa8GEvnzU/0SBmPhHDwh7YKgsQA3s06DOa7YRsA2Rv4GJ9B4bSfFtDXkWYoEsksYxO7zAc/V5BGcpYOicDyFwPFoiOY8g/Ro5BAXpgp/1LZN7T9+2agdz89NDuB2g7G4Inl0xALLIKFwYtdz6QUx3oVipW/rpTDf9WJkfOwFdD8TwX7554j/7aNDH7RtPAFT/pBJZLph9UXHGEtAJvpELYT/D2/Ekg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCpGj14y8qnWzSxrj6VdBuo5/QZItUYGIcekqKER1Go=;
 b=AkjEsIPLzr4EVAsj2nJAIQDAKtslNaZ6rziQco66XH2HaRWQpHe+qm0wgr4jayiRIgGBM16us6Lk9H5gGRSwYkh5KMV7qPxCybpIQAffDRazvQmxEWRhYJ8/AYP9HV2y5anGvMpgwu4qbDgQ8aeUZioU7dXDHF+Yg2iUhzIRThM=
Received: from DB9PR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::29) by PA3P195MB2844.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:4d5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 10:16:16 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::d9) by DB9PR01CA0024.outlook.office365.com
 (2603:10a6:10:1d8::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Wed,
 10 Dec 2025 10:16:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 10 Dec 2025 10:16:15 +0000
Received: from Postix.phytec.de (172.25.0.11) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 10 Dec
 2025 11:16:13 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.11) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Wed, 10 Dec 2025 11:16:13 +0100
Received: from pc.home ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025121011161348-313 ; Wed, 10 Dec 2025 11:16:13 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 10 Dec 2025 11:16:04 +0100
Message-ID: <20251210101611.27008-5-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251210101611.27008-1-c.parant@phytec.fr>
References: <20251210101611.27008-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 10.12.2025 11:16:13,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.12.2025 11:16:13
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D09:EE_|PA3P195MB2844:EE_
X-MS-Office365-Filtering-Correlation-Id: 41fdaccb-e344-4ef5-6e63-08de37d52751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T2Iw6cm36jr/FILbLXI/8bgqt/voDTuTzF3a5m4KFMQ0rnzHx7Om8RdnjPBP?=
 =?us-ascii?Q?gHNsKrQoHpLE7JCsFSXB7iZnuenyYBvVyb2EEPTQxBY0nnd6kYqj85gEoBe7?=
 =?us-ascii?Q?ys2Ak1M6dHJbCPxRF6hqV3FBz5iwu158peNEz5U2MvVd7sczH4h20lkaCo+E?=
 =?us-ascii?Q?qqnNOZ5DRXc60sqD+Px0Xzg8MHISiRGiTO1URwwb9isBgAs8jFCMElUKtBwZ?=
 =?us-ascii?Q?ryVI6UVJ7TapvPDDmL5B98HgO7rQ31lbUFAsimn93T3Xjgtq2PiTl0d30eYV?=
 =?us-ascii?Q?ndmXswYNzUOv1rqCrmXKtaXhIslFQ9ecOHI44gWfAnpkJsSf4TAKX4KUP8it?=
 =?us-ascii?Q?72nu7L4dSPvuAKzKdkopBlYeXat8jw8VfOHpHhEhlB9CyRPvG9DnoV5Q56Ao?=
 =?us-ascii?Q?CcO1Dz7b8FTH1cmRfIWmMrDURQZ3eH8V/TVy5ZAhOOurhd9jL75RCeeA7V0+?=
 =?us-ascii?Q?mht1TUOGkBRB9GG9EnuPPSzlRSy8Lnx+XC/UyUeOW4tTIiTcoFicJV4jKW2B?=
 =?us-ascii?Q?CO1gH6GzWgV2AVS7IyTnCv+BUBY/lP5CIjgFtMtwdGnJB2W8RcRcjHncdC5R?=
 =?us-ascii?Q?cxcvTqoil6ukG/VRuevA4JeGpy65541aNNvBYqfSUXqggYwZyof3JEg2A9y0?=
 =?us-ascii?Q?rhRrRm1FIasSxcTE1AvCxyrpZZOLUx0PtyajIIIqcO5F+ubBuRlxclJI/JE1?=
 =?us-ascii?Q?QpSk2dv1A2M7op0CZbvGv5hpnpJEITeSnhbkcbEFf8BQwFyDVEgYcSi6lJMH?=
 =?us-ascii?Q?HjqMz9xrHNCbx87O68Ukx7Vgnz43ZW94dxQzD87DUC1+rjy95VQAQiC8E/vV?=
 =?us-ascii?Q?jM7YCqhklPPihV4XLgDPQGIMIKj2PAbdNdrSuM0g1aMmVF88p4WhCpy4lUSx?=
 =?us-ascii?Q?8pg65AYftSKY4ck8VfoAVnrHXbGL4LhljY4D0gNMKePPUqvMpfjRHHhpavhj?=
 =?us-ascii?Q?jRQW+poVQ/9vwhMWcUWl9G1vNSHjuowlCAAl1oNYU9sdJqEsvD2zuZHD/Gvq?=
 =?us-ascii?Q?OBa2P0/9D5m5TZj2Nr+98RimZAgiQOJrB/hUFu1B7Sqra6oukddTD3/ltXWo?=
 =?us-ascii?Q?/EQdQxS4UOvOIuHcW7w5Qpafmp4iLLyvXMu4XPyW5SRTr7m+4ec9ddQ+J/W0?=
 =?us-ascii?Q?skleVsWFVzmDFq2jpjqlPYLvOi/+VQqVxIErc7oCxMwa9PbCS2h07DddZ0kE?=
 =?us-ascii?Q?pH/XmwSr2qTE+7QOJW+Dji4zgohDje/joGHrdjnsBRY0PGEOzCbe5bspWxRW?=
 =?us-ascii?Q?Y7S/PuiwhLLreiH6608U05nYzY7y622A+Emui8OVGtDwBxPGLiz81PnTZPxP?=
 =?us-ascii?Q?hs08ASuwT940SlP2IW9WNhimQb4eGByoAOwSL0YmDLgVTJ547KNAMTRMTsns?=
 =?us-ascii?Q?HrLJ+z0fKU9zXbKmEVGm1ZrKJLuMhyfRJjKPV6cwF2rb5UbQNT119YU9ME6D?=
 =?us-ascii?Q?A/FAs2fDF+Pl4tzFyRXQtwyZF8uxQUc0XJzfftB62B7eiJGz119V5TJdXdmW?=
 =?us-ascii?Q?QlJaeXi0iFuzQHjEl905kcNmVb/+zUvzSIsBB4aEM99lVVeULk1b+1RhNFEE?=
 =?us-ascii?Q?FN7kJpkVnRVSNQYsqGQ=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:Postix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 10:16:15.9673 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41fdaccb-e344-4ef5-6e63-08de37d52751
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P195MB2844
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [Linux-stm32] [PATCH RESEND v2 04/11] ARM: dts: stm32: Add new
	pinmux groups for phyboard-sargas and phycore
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
index 40605ea85ee1..f242959e8716 100644
--- a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
@@ -223,6 +223,45 @@ pins {
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
@@ -386,6 +425,7 @@ pins1 {
 	ethernet0_rgmii_pins_d: rgmii-3 {
 		pins1 {
 			pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('G', 4, AF11)>, /* ETH_RGMII_GTX_CLK */
 				 <STM32_PINMUX('G', 13, AF11)>,	/* ETH_RGMII_TXD0 */
 				 <STM32_PINMUX('G', 14, AF11)>,	/* ETH_RGMII_TXD1 */
 				 <STM32_PINMUX('C', 2, AF11)>, /* ETH_RGMII_TXD2 */
@@ -1304,6 +1344,65 @@ pins {
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
@@ -1644,6 +1743,23 @@ pins {
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
@@ -1869,6 +1985,21 @@ pins {
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
@@ -2856,6 +2987,39 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	uart4_pins_f: uart4-5 {
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
+	uart4_idle_pins_f: uart4-idle-5 {
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
+	uart4_sleep_pins_f: uart4-sleep-5 {
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
