Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8DAAFED2F
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 17:10:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E0A6C3F931;
	Wed,  9 Jul 2025 15:10:22 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2120.outbound.protection.outlook.com [40.107.21.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B060C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 15:10:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2t+DylmqhPIT0vHb6S8so7VmjW1Tv8SABKM+MVZWxWHwkWV5/PXRpkeOpiNfuLVzbFc7meNhJOf+8xDvC2tdQIYWW5FzFJKwc4rRxdSNLErc1Qa8hvupMqBU8dPABoEuNQE8nQdtIS2SMgh3Ea6GUnFMExPcdJndsu45fsQ9sDMl8cAkFoUR9Oq5ihIA8h9Ku/t9i83GzBk1+F+y2r3PdSpm/W7VukPzDcxISKPebKbo3ba0QpIVCS8NZO4RUWZOPWwm1tj4F2pG33mE58QV2oej/VbCL97fhlGNtMwyWKLfiTxESCgrgKPMwV0iePcM0HeBYPx52JAteeLsJYy1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCpGj14y8qnWzSxrj6VdBuo5/QZItUYGIcekqKER1Go=;
 b=JEuCAh6FKjK0JziOtwvmEMZYu7EN+Q5cwxuh98xq+2s7HS294Jlfxh3aDtgUOrHV0J2isFYgU0Q03ugnicIeCdVT9ZgYK1G+Gkn0HJ01suzwEm0GTTQvpYE7kDXeDrGsnAqQjdRvTy4TBsZA9WC26NI05BemdJUP3ShOSiBxvmE2XyyE9TF2NPppazfLS5FQWpiBoMTEytZ2DrT2kQUi3IcIhPOU5Q6VcQ7xDbDdfzhf4D344tWzB83a5e54LXe/HPTPTe8jkzXoYnXKe/PAgmhE3hQ4dy+VGhpwQUloUpTVuek2A0pT9IcRT4MCrGw5yLsNVU4L1agfSMyDGYByZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCpGj14y8qnWzSxrj6VdBuo5/QZItUYGIcekqKER1Go=;
 b=x5X5zIArL6N6rr1rKL6ljed8AD+3uWmJjkp4ZmdwkTrRNCXe59rdHIorE2SDcIe5Zlau9k1TwW6DIrfNPzD1A/gc/W8ML+5+gfouqPLbj8ZTcalycwNa5nl0zAyzalzjikapkkoZS1KnUqomt3W1DVWYL7wdvCWdqOSPuEehVH8=
Received: from DB7PR02CA0018.eurprd02.prod.outlook.com (2603:10a6:10:52::31)
 by AM9P195MB0870.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:1f5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Wed, 9 Jul
 2025 15:10:17 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:52:cafe::c) by DB7PR02CA0018.outlook.office365.com
 (2603:10a6:10:52::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Wed,
 9 Jul 2025 15:10:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 9 Jul 2025 15:10:17 +0000
Received: from Berlix.phytec.de (172.25.0.12) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 9 Jul
 2025 17:10:13 +0200
Received: from Diagnostix.phytec.de (172.25.0.14) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 9 Jul
 2025 17:10:13 +0200
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.57 via Frontend
 Transport; Wed, 9 Jul 2025 17:10:13 +0200
Received: from pc.home ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025070917101328-210 ; Wed, 9 Jul 2025 17:10:13 +0200 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 9 Jul 2025 17:10:04 +0200
Message-ID: <20250709151011.366537-5-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709151011.366537-1-c.parant@phytec.fr>
References: <20250709151011.366537-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 09.07.2025 17:10:13,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 09.07.2025 17:10:13
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509ED:EE_|AM9P195MB0870:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f21b0ac-5a0d-4983-f351-08ddbefab703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/KKS9FqSBsUPx4ljmzRpadyyc9GWIIfXCPQcbsG69gW6vlJc/V4B2jV9CwFD?=
 =?us-ascii?Q?m0FIQfC9c8s7lR0luRyt8UbWhadk/7L7Y20uEIp/iBJ/3cUA9OHYkgrd3AHl?=
 =?us-ascii?Q?TWrGttyfQloGCrjBXJ2i85HfUsmDgj1Wp4IPZDWs5wib9MA1K5QLsM0Bc0cw?=
 =?us-ascii?Q?TXO37JmPFrmZaDWg4B4Qijoz0K25HeK00I7lRHmYg4+uC5pVeaVEM4pGcWfy?=
 =?us-ascii?Q?VSV+UsVYFoNTVFGFQEzpE5UIFE21K0CVVFZrvCOVf5PcdtKEceOmLDPdc/Hm?=
 =?us-ascii?Q?GdOvlg4AIg/tFPj3LQ8Gqf8YK/e+/soQp8r5nXe5bSFoyWdTv5+2VKa8dRPY?=
 =?us-ascii?Q?LrtToucSt7rX4T4mcmJhyQ2yCTVwymoALhZeXesOFXr0vNPEkLt8CXVLyD9e?=
 =?us-ascii?Q?FnmpZnY59lS22ayv8IfkwRDmiCcD3V29JbtpTXVqY39r4qlhe5KLIJbCJttx?=
 =?us-ascii?Q?3Mi6f2ArVk9qBoMY3F5HDt8FI0Jvz38qTy9Dyd45rSm22xu9xk00GPNaIpo7?=
 =?us-ascii?Q?YN1ri6tYUOKYHvMiwBIA3FhX1qwUo1gOu2uheu4TrBgsYX1nTtfPISZaB49v?=
 =?us-ascii?Q?HDG/5kAlE8FGe1SACvJ65iqJaRYQ9Ubdbnm4ewcRmquXyjK7QUsfE7D7SVeg?=
 =?us-ascii?Q?snf+ZTzxU8yxWrgjtV/jWo0YPsC+lpoS0oknunERUr52vyXsjYrblqr2R1Oj?=
 =?us-ascii?Q?rbjLqiqB/x7Dmq6ZRVKkqVvdpl2GF9mnE2JQqh4HGufa6mshRwGHEV6W/oi+?=
 =?us-ascii?Q?FbC0/zHX2rlYUApS6ag8UyOfA2BgZE9ksCSoUqyb18D8y4id6hQjFTGjRZLJ?=
 =?us-ascii?Q?gOx+/r6XcHfxmCXvs2URCkayH7qTlFodLJqa5eGKmQQllnXKqLs3HouoAgIH?=
 =?us-ascii?Q?YASxDno4GzdtVfpsIMpbOanALAc1YPQzxKMfyUvUEggGQl6Sf1hOgK+cAB0B?=
 =?us-ascii?Q?kuBC2vUnEHQMmDgEO65BeSzEGKU8SaOeo7bXFdDolTXlpelE3J+pn3ifPIlO?=
 =?us-ascii?Q?CP9PIzAIsJmBBOMQJ4Yf/77LuxRSUCm1Px3foaKi1+/mscrT/aiUhD5dsPWx?=
 =?us-ascii?Q?bxc3zvLSoqAckBoH7HMmbSoSV1Ghv0iZsA0u5CFMdhA3kCQA6veUF0TMqu1y?=
 =?us-ascii?Q?yv6h7pMpUQbR8nVa16xKSDo18V6WMJDaAnWsYgdlTck/5HBf8QxfxOLiyZxy?=
 =?us-ascii?Q?x1S/OjZSnMqf6u0t2EvHC8x98AOknc1FxHVOccGhBfDxUeTVgpDrke4Vz8oK?=
 =?us-ascii?Q?5reDrqpGnVziMdHuG+vI4bURKrD+YW1K3j1HF+WGegbD3Ii0fCp8AozmVRQM?=
 =?us-ascii?Q?HmELaXroNRI0TGLXkSum2dRQW6ySIrhby24IRK9c4e3C9IoxCAonYUwjO+yS?=
 =?us-ascii?Q?IzhdbMsq7FhRgu4wgk205o0CD9/0ASWrYSkcvO7YBtFVB+wwVQSHk+kXWhk+?=
 =?us-ascii?Q?S3tiN/ReHdBzuHWGJbMoPAfha3UlOVnMRb/U2OTQEKhS30coa3DGEfYTulMS?=
 =?us-ascii?Q?KUtfPyJcBoPL/JZq/uD/POXptAjdailnMe0k?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 15:10:17.7342 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f21b0ac-5a0d-4983-f351-08ddbefab703
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB0870
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [Linux-stm32] [PATCH v2 04/11] ARM: dts: stm32: Add new pinmux
	groups for phyboard-sargas and phycore
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
