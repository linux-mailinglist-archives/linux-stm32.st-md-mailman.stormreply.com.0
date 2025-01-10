Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59803A0948B
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 16:02:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B14AC78F6F;
	Fri, 10 Jan 2025 15:02:34 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2094.outbound.protection.outlook.com [40.107.105.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62B91C78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 15:02:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAMwMaQPeKYy5z8ON17wJ3opg8ZZhovepzbpZsIzTfVyn3Cp7n53SFAci946yhwjEqaEIX4nwvrl/KMN1VZeqIWEF8O6c9Lb4RL5a5vzuNDNH9bEzd4xr0vvkMwm/Eak6DUWE26EKdSyD/we8Z3vlmJstZg0iKe2Bc5Tn7lKHV4wkLU9lt3nS+tcU2k+qHOShi1hlwh/OfJw/pA7PLaugUwGmNow29a1E43bZkId0HEhEE27rjT7EsH/5iJH0lVKIK+yLKUhyB0V+02Ad7t3gtmQXdqBL5TX2bFauQfvjoC2qYFNnT+ewbxgkMoc4IhPrcwwauAwZNGnYUz1/R6nng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJE0jkABUjSz8zxDwQYOjx4AFyHMny2Fa89whZLK6dw=;
 b=rBclDM6Fow3v2pgjBA2Y+6HhBYYQ0xElPcsgu1kXfDKCpDLShtasYsGNr3qcPTcX4KXVp6zaObjOOuTfri0a1i4A17OYMJSrFYUeael7tQlq4FcQf/wAa5am7aIv0mIXIqTcaewSbcVntkybrTjb7FA2hsM9lEymyeJoC09atC5+vV5Hm1uUhvqpaNLth4P9sC/mzHsj3YCwHycwwPMpzHodHDy0pWfIdzpuVJWqM1bYia8O1fb2QZKp6NiiD8zDZ0OdG2QkdaCIKJ34ElzzAWBQ5lRMkZbo8T1OMZsKRu8W+6Tu1F7/V0qoB4suS8fTdGzSAD8iGjxuzCl8OIjB2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=phytec.fr; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJE0jkABUjSz8zxDwQYOjx4AFyHMny2Fa89whZLK6dw=;
 b=b255pSk15j/L52IDtTb1oR1Sxkh3tC2tPfGg5LdPR1fANWiLvAfoh6YMsWR9HICK2B/yyDoLntMN0tpvy2ejs6kFWfykw3fBBYkIu6JHlW5MhirdvaxatrKZ4Ac+IH5UVM8f3A/1SKFcuoSqgDe+p6KSh3lMQIKy5clLXj05UCI=
Received: from DUZP191CA0049.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::24)
 by GV1P195MB1667.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:52::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 15:02:19 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::90) by DUZP191CA0049.outlook.office365.com
 (2603:10a6:10:4fa::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.12 via Frontend Transport; Fri,
 10 Jan 2025 15:02:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 15:02:19 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 10 Jan
 2025 16:02:17 +0100
Received: from Diagnostix.phytec.de (172.25.0.14) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 10 Jan
 2025 16:02:17 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 10 Jan 2025 16:02:17 +0100
Received: from pc.. ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025011016021750-26 ; Fri, 10 Jan 2025 16:02:17 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 10 Jan 2025 16:02:09 +0100
Message-ID: <20250110150216.309760-5-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110150216.309760-1-c.parant@phytec.fr>
References: <20250110150216.309760-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 10.01.2025 16:02:17,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.01.2025 16:02:17
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8B:EE_|GV1P195MB1667:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c48e072-550e-4d4f-dfda-08dd3187c78a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Um4jqkYZPH4OfGI5dgPiLIVGIczID5HdMoBnMEVsXmGtmfESe/mO/31CZpVg?=
 =?us-ascii?Q?TG1lE2WqSkRh7rMOg8kqk40vLv9nmWRLg0OqL5iQ5jcWNZMQhWasZ9rsgYrc?=
 =?us-ascii?Q?52Rhy5mBufqX6w5/uqlIukjfRzc0bcN5XhiqnHoXCP+ntWhPW/O/4XZOMYzu?=
 =?us-ascii?Q?PXZknpCRFfq4h8ZI1s46Fz+qQoX4irsEAvijfD8S2HnThN6Ify7XkT6pOOyy?=
 =?us-ascii?Q?jNeqMKeAFHBEg2LS9dIZ8Q+gvdX3VFITPCnuhp1w7YPoF4naQSxjqU7VNzUE?=
 =?us-ascii?Q?CmOVO/IAcItKq65xaH3zVEI/ARXQ5iPkJ0RjgHuFRfRiigQ503lQHEqfNCvp?=
 =?us-ascii?Q?S96PYjuOemeU8NJbpNqq+gFLGwjGTyJeo02A//3w4Xzek66pqtfz5WFkGXhE?=
 =?us-ascii?Q?YQb4bJvIRZcRWTz2zSM6qxtY7bL2eJvWzgno/vrEEA3fBCcuKdppLWX8e50x?=
 =?us-ascii?Q?V7acQirj27c6oDaUDgu4l4WvhI46Wr4sL3066Du6frhXR91Yahrrb8euyVAq?=
 =?us-ascii?Q?Zza3wTGW/cwMuUs3d4xBa1MwQvbVsWS5ZwI+YimEQRMbuijtLFbP7P39EQsX?=
 =?us-ascii?Q?wmSOfbCFRJ2h+VBNb/JfigBhqtWcd085y6BvTFOXcI7zfUfh+wAQw4NR5rwY?=
 =?us-ascii?Q?yk98NFirujxvhb5r3X2tkICaby3/2c8igpmMr04M5JTKRNKtd+AFgtkNqt2J?=
 =?us-ascii?Q?eGJlwv2oLZtob7iJQoduLV8krZ8lxb5uQGG//XOL9gLDHHHAh74+ElHikHNc?=
 =?us-ascii?Q?EDiB+ddRtHbiyaJ+XpCo+/u/SMQCy4VEKnzm0lapvUdECdeHpp5g8CG6zyLg?=
 =?us-ascii?Q?Zdh8TVneR2a19CnVWZGRYS/UuftOAj9kQVPlJ6xp0SQBgOdlBDQYsH+hJW1L?=
 =?us-ascii?Q?u0W2teigu3UkbjGA6u70DQ2NoZhrM0AsjA2fNUqGk6KDVXAq2ui9jx6cjkkZ?=
 =?us-ascii?Q?FsfMMs4n4yqZXeIzPMA69dkFHkByKgb6x8/BVIZNMZTATiRu3+ZFxueKAEv4?=
 =?us-ascii?Q?sjXVm3dw+Q8ItOsNLjbwBmlnRaae0qZSmTbCTl5vy/jNlAPVo/VLd5kLFNDa?=
 =?us-ascii?Q?M1qp/DsMWhhBlLR6ikqm6pjCjg52nhpSPbCTRxus/SUOg59VdxTo0LcM/htf?=
 =?us-ascii?Q?5Ew9SsKctu4GDtrwp4vRv1ZxJXUsJ0oJAnhGGb5Ad+l9EY6ffkKv72JtUCbD?=
 =?us-ascii?Q?y1/OvUZF2A9AfKqCLIV/QAlfbjK6nq0HsnyCI3VVjarAgnipi8N45vTl2qLx?=
 =?us-ascii?Q?iNI3sDxQTBtQxrPCXj3CMqCNdjtvnf0mw+EsW4qkdJVLIZgJq+nfqi/1wmR0?=
 =?us-ascii?Q?zO4108MmPhSx2Lf/urOsQ2j2jsDcU48ksiVgeejl7WxIqSidt3xoUtwWqDVe?=
 =?us-ascii?Q?26SC5LkLCFPaLSrlkpghHnhOc1ypcjHRdni0ud+vyfq32/Pmmp/60VtPDXQa?=
 =?us-ascii?Q?rVy8qFUZs7NEPc9PUU97nBdvjrkWgBzgVN7Nyq3SPYsT63wnDX0oiZRav6po?=
 =?us-ascii?Q?4p6Cuo6E1nXvJEA=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 15:02:19.3965 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c48e072-550e-4d4f-dfda-08dd3187c78a
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P195MB1667
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH 04/11] ARM: dts: stm32mp15: Add new pinmux
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
index 95fafc51a1c8..7b1063295da6 100644
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
+			pins1 {
+					pinmux = <STM32_PINMUX('B', 9, ANALOG)>; /* UART4_TX */
+			};
+			pins2 {
+					pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+					bias-disable;
+			};
+	};
+
+	/omit-if-no-ref/
+	uart4_sleep_pins_e: uart4-sleep-4 {
+			pins {
+					pinmux = <STM32_PINMUX('B', 9, ANALOG)>, /* UART4_TX */
+							 <STM32_PINMUX('B', 2, ANALOG)>; /* UART4_RX */
+			};
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
