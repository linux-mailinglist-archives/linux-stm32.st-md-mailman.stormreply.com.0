Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5AEA48332
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 16:40:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF5E1C7A84F;
	Thu, 27 Feb 2025 15:40:21 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2100.outbound.protection.outlook.com [40.107.21.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43BDAC7A84D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 15:40:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKA4nzPzjRnzjyjMJTWeMC7/DE4Vgzo8jN5AW/A4dQ76d/op2hIk79DIzGTb4SGwPxmPKC05OSCj8+wv1YsfxSTPjqa+ukO4Uz8nffcppB4yn5c6SIY6GswIQ18uR7ZDuVpKIUGkjtTe9uPnF6BI+BkzDX5yVH0M8mmZAOJDUPHtiTQhMkXHyTzg1SVFX/TL3N2st0A0koI+oDVoeMVHnzydHeShhn4pUcNV8lpGRiLIWM6Uc7OZArqnvoAlTYcbq76VD8hrQRfbN/dzzv7+wu9HeX2NA4ujDVjay+AMeqXnEg6gz0KPiEPJa5LkHzePAs8B0KtMuNcvCaV5FBMDHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nyfGDNf1BUXv5TskihyMGhR7ipgLkBQ2c4yd1xoBs3s=;
 b=yVyDIPhdxlizN3dHEiv+78ckS83Qho3VqpUgdwNjrthOJj/3QE7BJaWwm/byDGfkfZ0TglPr+9mo2WIyoKZvj+n1+hUNohDUPZvJR1m1MKM9azsQiM5CVE6QC5LyIZVKHOItGgvHqSybsH+cLKmgEapS4XdP4dwnPgFlw1Zbt14G61401/ACraY0e4A7Fo6Jmq0UiCnBI4OVSm3pgqjt0B1Z8AFS3d1NGBmDoGgbJzxzu/jXkXgkbR2CUJCSz86q5+Hv0V1OTmR3eHT1hTk9XsnExkvdU1tRRl6o61aztJJokuR+C4dNg93lgltYqLKv46y6KSoaZFm7OB3We9/jOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyfGDNf1BUXv5TskihyMGhR7ipgLkBQ2c4yd1xoBs3s=;
 b=TALp83rwrmwlqH3CId0Uaf/VaWeego2wbGmmiKnCNjd91H2Z8w+HbP5j7BeFeJz0K1V3iJuFG5lBQwaAyrZKKcraP1B9Aa99HBIHkG54+KwPVBeYwymod7nxnWTArbcxx+fzFordim2XvALgVCg0GnoYroBfDxh2xd9OrvUEh+8=
Received: from AS4PR10CA0025.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::14)
 by AS2P195MB2250.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:59d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 15:40:15 +0000
Received: from AM2PEPF0001C708.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::5b) by AS4PR10CA0025.outlook.office365.com
 (2603:10a6:20b:5d8::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.19 via Frontend Transport; Thu,
 27 Feb 2025 15:40:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AM2PEPF0001C708.mail.protection.outlook.com (10.167.16.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 15:40:15 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 27 Feb
 2025 16:40:15 +0100
Received: from Florix.phytec.de (172.25.0.13) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 27 Feb
 2025 16:40:14 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.13) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 27 Feb 2025 16:40:14 +0100
Received: from localhost.localdomain ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025022716401483-87 ; Thu, 27 Feb 2025 16:40:14 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 27 Feb 2025 16:40:05 +0100
Message-ID: <20250227154012.259566-5-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227154012.259566-1-c.parant@phytec.fr>
References: <20250227154012.259566-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 27.02.2025 16:40:14,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 27.02.2025 16:40:14
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C708:EE_|AS2P195MB2250:EE_
X-MS-Office365-Filtering-Correlation-Id: ab505bb6-8d0e-4110-091e-08dd57450821
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oilnypw5Dnv5s4spSnvtm+3dAE7AJA9WI8hIHpWuRlq0fD8hIZX3uHxilbih?=
 =?us-ascii?Q?Mn+seiTqTw0YIeKCssDvXnQcJb0dm7ja3SgHPsTeZ0c2LUVygNrZcXUy4KKS?=
 =?us-ascii?Q?VJnI6dhCx0id3E49k55t1YzmqUj0O5LKpN4rlGTf/9iD6JXAp7ydNSprZ3AL?=
 =?us-ascii?Q?zcDJefFpxoHxZTuDC3RSTFiRHoi903LuWP+jy92Z2OHtPnIXC18+Ibh7tvFl?=
 =?us-ascii?Q?ezUHXLJBqQhwlnFlIC2LuRBDkh/La8/247+wqevxQBdByHjuzwMmaFZPrFMi?=
 =?us-ascii?Q?SjrgRM6lMuKytf1Ksno8xscBgl+sfSO2CDWx6yIVyRM112rur8VdjzFncd01?=
 =?us-ascii?Q?ZmfYuSJ/lMe0TaFmyKTk1GkUCha9MZbbhy20rIJGcGl8FjdDqjxmhn/FYJYZ?=
 =?us-ascii?Q?Kk1fJJy/C8YcmPnc/cdOrXXWPfRohSOW9Kh8Ywzlgx/YzlAAda77KiNAmes9?=
 =?us-ascii?Q?+1UQNxUR51FDRMb96Oun5INhLPimoqA0emFQUuG3F+ACgupvNgk5G3Sey4Lr?=
 =?us-ascii?Q?Ba+zuSWVg3ZSsDg/L4T18ElLSFo7MY8LxWpkvIS8qrGelj3eJ47W8MnSm5L8?=
 =?us-ascii?Q?vI+41JX1Fd/azY6paQnUwe1Q3k8w4auKXVqdEfJrZjOnYdh5cizkS5NP8yNC?=
 =?us-ascii?Q?uvi8cAPpKpEnFM2uU/2hrvfs1NbKMemmBlrSvHqcl6Ra0ZgACGmH/4R28RT3?=
 =?us-ascii?Q?lxxj3Gjpqsh/ThZbSWAhi+WWD4lc2D7LhUI4Df3EI8vMGSx2hvYSq+f5dXbS?=
 =?us-ascii?Q?iwvEuD6gXZ1FxIMOiLjvLlaaXISeW6EikCo12wLtWdu8O9DZdzIC774JOXta?=
 =?us-ascii?Q?JJDY22wLGNC1aCWxdc0mjMAfG4m6oeqngM9vCgV9ZDL/71Xm6AGqgdmuc4cb?=
 =?us-ascii?Q?rNtrwkEVdUBUfjGYG1Lf4pDWwGuq+euPQw1mMD4ZLfhqoVifooJV2A9wO9Dq?=
 =?us-ascii?Q?GsBs/WLgbKOhhB/3ok/0DGPGrBNSSWqv1nTIn+nAWoYn77+N8nnKPOJz8c38?=
 =?us-ascii?Q?37ocdnOSFRqz+XRNvKu7hv8wWscZLGnnUA20L0Jw/nadg4UG/tBVyTInQ5F1?=
 =?us-ascii?Q?8yJx+7K3gxBAZhhe2uGwzhisGn9KUWzoTIx3tnoFpZZ5ol8Z7FlIch1PtVlr?=
 =?us-ascii?Q?X7F4wWat/zjv2NBwWtUC1SWXGStDwEk40BVaLFJOT0ywjfPbMo8hzSno/To+?=
 =?us-ascii?Q?Wvd/cHegxqbgGX810qrzxy5ADFs2K06fvXSyH+nTB272/Fn6x71J9KmZx/o/?=
 =?us-ascii?Q?rbZ80n1dMtnLXMfmmpGe5dmx1+QhO7HnwsG1KSbKZmhOlZd3/gnCJT7VaxSA?=
 =?us-ascii?Q?YG/Fq52J1cW89fuhRz7GY2pUYtZstcdFq9saklQS0E3kFAvHRqvdQOY+eEOK?=
 =?us-ascii?Q?SHOzTKti3/44WjgeIqArsPdJ8TPNQ7D6SpzeHndezCbW/3RA9h2B5q6tTE+f?=
 =?us-ascii?Q?J8xku9mx8eb8LQH1lEGKa/rsq1lpp5nn9qEVvOpwwh8GlM05YyygtR0ri5Lw?=
 =?us-ascii?Q?lLzBsHpt8WjOHbA=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 15:40:15.6908 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab505bb6-8d0e-4110-091e-08dd57450821
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P195MB2250
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [Linux-stm32] [PATCH 04/11] ARM: dts: stm32: Add new pinmux groups
	for phyboard-sargas and phycore
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
