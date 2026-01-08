Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96998D04D47
	for <lists+linux-stm32@lfdr.de>; Thu, 08 Jan 2026 18:16:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 611FDC8F288;
	Thu,  8 Jan 2026 17:16:10 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010045.outbound.protection.outlook.com [52.101.69.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED6D1C8F264
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jan 2026 17:16:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQM5yvJQwuv4ejATGuIIAl5Lg08nGKHVo4SxXLQxUtjb5GR/RbeBE+CRe7vyrHEEwzIf+3ynQejT0WvBOZK1Dd6YK6F7mC/NJTzNu1b4kPUSkxJUmVxWCNEzsThG6ROe+O34kaFH2n2sVsfOXNqcsSRkDMtOCkAr8fRQnO57Jzrzj07KX9so4CoQLVBdhxKKzfO+cSlIqrmlhlB3yqYQzVj6kg3jb+4Ttg4+ebRCN999tLOXNknGc7nNoMaEWVevij4o/9s6LqWXnRrVS4jyivSxDhta1awUWLEO8wQhb3Kz4GTahUdHLrh9rLfmIH9gCSBwkQoM3/cXBOWW8yjT1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdgesra8sUsh2QVglCjzufnpeFIapWv6f1CrS9FLne4=;
 b=HYXUJx3Z+vmbKVjw2OnGR0AjwhEplHRdgspWhV4L6yHHEdLk8fIyogh8kaAilKMz69ZoDP4K29G/c64dmrcBLk+Qrml/t5RdU/5F59gbcVC81EcRseXyjPGPy+U7ggpTrtgnyHPLtJl64OB5Y/IRxSUnPKRQI+OihRVCcSK8aUNJn5crWh2n5H0qi91NM7uhiOWI5jvP28maCO640u8P3ipv0rd+2PoY+UFH4GAguZgP2gI5HeLNnnHgWev+jaefAEkSmwSJAFtHB4WiFOYH4U8RvpZQJeCs42SemZsHQ0xtU/PbRW+e0HwBiAfdzX28tlffk8oAlsoesZteXm9PYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdgesra8sUsh2QVglCjzufnpeFIapWv6f1CrS9FLne4=;
 b=V2GBKm1MPQhexNGA/uf2dEuhAcZZXhXdWeCxjjCR3xMMYGRr+CHWJapmi1jsRpV6Srv5E2OIXe4TtxwjjWLzymx8yGbP14j5J12vbszKcHOVEq2Pxn7Scg2oplDOOYDhAm6InG1ufDYwJIDv6jzKpfUkV50z1P/OBSDujdL04e7DqMaXgVwrbnDGZPipGPAF7TOxb6pzfAqXSRxlvDY734S/hg6cVFKMQkjHmgb9t78aB8d6X/UF1Wp4e2RFApc7E+7+8wzVMTq1zwS9WAMXr61hFRF+BCH3/VMxxPyfP3zW/FU/aiDdvTBTSYycDAlTHAT4zC8zz+zKesyo1nJL6A==
Received: from AS4P251CA0005.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::10)
 by VI1PR10MB3728.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:131::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 17:16:04 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::3c) by AS4P251CA0005.outlook.office365.com
 (2603:10a6:20b:5d2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 17:16:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 17:16:04 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 18:17:20 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 18:16:03 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 8 Jan 2026 18:16:01 +0100
MIME-Version: 1.0
Message-ID: <20260108-upstream_uboot_properties-v3-2-c1b9d4f2ce8d@foss.st.com>
References: <20260108-upstream_uboot_properties-v3-0-c1b9d4f2ce8d@foss.st.com>
In-Reply-To: <20260108-upstream_uboot_properties-v3-0-c1b9d4f2ce8d@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004D:EE_|VI1PR10MB3728:EE_
X-MS-Office365-Filtering-Correlation-Id: 282a019b-3509-488c-f843-08de4ed99ae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elVwRTdxK1pRTW9FcjFlOWdGOUI4UTlzTjZQOUxKNittTGN1U3BFVlZVSWh2?=
 =?utf-8?B?Y1gwOVdqeHRNY280WlJjK0F6K2ZTaEFaVFl3VzVUSTJLeDZvRTFPVU03bHZM?=
 =?utf-8?B?RTFMaGhmWU44NERmMG9VNklxUHczRTRaTXBVaDhidXFiNWlUQUNPVmZINmtE?=
 =?utf-8?B?d1ZXTzMvNE54emVJOTZ6ZzN3M3FwdDNsZkF1SW9Hc1JHVno5Q1ZYYmEyOHc3?=
 =?utf-8?B?VWNkajBzWlRTbjkrdVRsdUVmNWFxOHV1MDFrbWthZC9SSUJkUU1ibXZlUHgx?=
 =?utf-8?B?eWNTMDB6LzBMc2tURzQ2Y3lEY3FJL013Z2M5Umh3aGt4YTdRRzNTelplK2FO?=
 =?utf-8?B?SlBtK09FbWZPaXJoWk1ONUlqdE9ITHVEdnpuZlFteTdtZEVXWk9lSlJGd3Q2?=
 =?utf-8?B?RjNiT1dDczBUdTJ2LzMxTXE1cXJaN3RCN21ma2d1MzVJU21HUHNVU1JvdTZo?=
 =?utf-8?B?eTlTS0FwdE8wcjl6RUVVSWdBQzJpdVphUWtuR1NlbjQ2N3laR2RTc2ZtNlhQ?=
 =?utf-8?B?SllmZ2dmQVNwZHNRdEd6cGtBUFFOdXhDUkRhYzNKVmNZUjBrYXpNbmh5eTgr?=
 =?utf-8?B?amt3aktrNFZhMUNEMkNyL09zU3pJcDdjSnd2YzJJdThnUDRaYi9RZkxVNEl4?=
 =?utf-8?B?WGZreWlmV2ZUQjBmRlowc09LL3lTOE5pNnpYY29JZTh5WFJ1Tk1EbmhoOU1G?=
 =?utf-8?B?SDN0S2JTRVF2bnRBY05QWTBPb2w0THNQdjdXTXhuekw4MkV0ZzJmTU5oempX?=
 =?utf-8?B?RVA5cktEeFVpaDZtNFJHQzJEUlhYbllwY25ZZ1pnTkZUdWEwOFJEa1hmQ1Ew?=
 =?utf-8?B?YURKWUxXREJ4aTdFcjlKZHpQZnRVVkU1QmJwbHZINGVpWXdnbDBiK21tT1hW?=
 =?utf-8?B?VWZNU1QwUUh2b0x2OFc2cHhDL3hmNmhpMmt6UDJnd2dvT2QwMGEzbjVxREgy?=
 =?utf-8?B?ckpFQ3J1bmFLbW1GdDNGRFBmUDBGTG9FQW5tWEJmOUNINlA3WFlQWmozeTFw?=
 =?utf-8?B?V1Z4bzJzUmJ2Z0g2a2JlbGV4eW9KcHVjNEJ3Z3dGR2pNbEYwOE4rQW45TFBE?=
 =?utf-8?B?TGJ5RCtyaVpOa1RnZk5NcG5wYW9Wb0srYTN2SzFVb21veDhYbFR1TUUySHlh?=
 =?utf-8?B?Rm5JWFhUenoyVE1LMU5lUDBoT3BTcXhLdkFQbTl1ZzN1TXcyVTVnL29TbkUz?=
 =?utf-8?B?bFNKOTMwdWU0eURkSWF2bHltRy9EbUl6VEx4bUpuZnBPbUg0VDFyK2tia0VF?=
 =?utf-8?B?MWJSRGx4ajNPbXM5ZkRqWVhXUkw3OE1YZHJPVG9LckM2aG84cVNVY0JEN3ZE?=
 =?utf-8?B?VW81WWtQUEN2N0tyOGt4VDFuQ21aTGlaQXcwOEZaLy9mR2JFTERhVnJvdnVC?=
 =?utf-8?B?aGJMOWRNNmhiL3VyTi84MFo2WU5MMjdzMG8rWGpHcmwwa0dxSGdPQW9HcFNy?=
 =?utf-8?B?Z0FXdmtYR0YxRXpyMWx0eGZGdE1OTE1GclBuR3R4WGcza0FKNTF0MTIxUUpG?=
 =?utf-8?B?bGFVZVlxUFU1c3ZBUnpaOEhvMDNiZko0dFhKRnc3MDRmWFdkbEVIV21TTGxB?=
 =?utf-8?B?RzREWWlZQkozemhIdWFDVW5HL1dDMjI2dGErN2t3U2VOY2k1cFB0V093RFls?=
 =?utf-8?B?TVFVeml5M1JnRGdzcjg4ZUxZa084TzcwYVNjQ3drdHNtaC9TYnVDZ2FSZXda?=
 =?utf-8?B?cW45elpSMmxuK3U3a1A4NXVDMU1JaXFKYnpyY0dVaTcrazBJdjA1bC8rRHZr?=
 =?utf-8?B?RkNRTjFmZkVyQkNlbFFLZ2xma3VFZ2tTUXJMTm1EZjBySWVlaTYxSDFTWUlw?=
 =?utf-8?B?RFRGSmc5UFk4T1RuQ1F1dDhDOXJmRmRPYWx2VlFkNzJSdHZPRGRMcGI2Wm05?=
 =?utf-8?B?TkpiUzFib3JuQm5BMFB3U1M3UVl6eUd4R2ZsZUhMMWFUS05pTmhnMkFOT0Np?=
 =?utf-8?B?ZnZrS3VZZy9md3JkazBxait4VnZZRjVzWmZVZXlQT1ZydmlXNXJZMldtZ1F5?=
 =?utf-8?B?OWowUEUxcmRyMlNiNUNRUzFFamEvRjZYdmdKbzZFZTFNZDQwVHRLUUhMd3JN?=
 =?utf-8?B?ckJTMFZva1NIdnhHc3hSTkd5Tksra2dVcGU4dkNnb2dNN1paQ2VsMGJxczFG?=
 =?utf-8?Q?ghVE=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: BB/8pFrjkwJ6F8ZnNxuM6uV0YTV3LraE0oIRKVpEbShVat1zfumicT56dBDHEBnBvvL+EiC1IED+QZUNvRdquL9X3q+CJCdwj2pJUm+bemEgVl61aMtbUaM6sORgChvtC0fTG4HSC36hme8i3DZug+zWnKvpOrwMetnxi6Rt9/4/KkeapmAdVX80jQdWpb1GCaV7juZz+yak7d+NOqFL70Jyd0wO5LQ3QDwB1QHoJ7sBiTdmQjsgK1PEHcq81stvUIwwu4EOQmKLn6z0nZ1tgxJlReihgCLENqKjaX/c04Qh0Dhk10VUmpSiJKwNkwbyURLBL0Wsxbt0j8OFLgm79wzRdcNbg9G+AdHjnYKnMp/fcBNg0i4IPfLFyY2HCRyRbyoamo2lnW4QAZMFxxzuaoKsf8xUPKTHVPaL2yWjHwJTaglmxBDCXEWy10nKVipwiUwyHkfWjGvpEbIOOEc88uUOhlydx5+XVsClxtlg6cjUSMiDbngSStHCvcSWlFhdS5wZKUcIpa2oLD/U+LXpB+4zCGH2C+CoYguBvFnKmzXm/dRAYFSuHQ1DIeVlyNKgQPHOqYCVHrw+RKpuXmGdvVyevexf6z5vCQLQkkjp9X84+TE8Zazkj6sC+9Qxj1xltm24SmOgCqIdE1VarBA+L0hViBGZN2feug+Tp9Ezf3+XSvl5zfpwgubAy68+M6S7
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:16:04.6321 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 282a019b-3509-488c-f843-08de4ed99ae9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3728
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 2/6] ARM: dts: stm32: Add boot phase tags
 for STMicroelectronics f7 boards
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

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32746g-eval.dts   | 10 ++++++++++
 arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi | 11 +++++++++++
 arch/arm/boot/dts/st/stm32f746-disco.dts  | 12 ++++++++++++
 arch/arm/boot/dts/st/stm32f746.dtsi       |  5 +++++
 arch/arm/boot/dts/st/stm32f769-disco.dts  | 12 ++++++++++++
 5 files changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32746g-eval.dts b/arch/arm/boot/dts/st/stm32746g-eval.dts
index e9ac37b6eca0..26c5796a81fb 100644
--- a/arch/arm/boot/dts/st/stm32746g-eval.dts
+++ b/arch/arm/boot/dts/st/stm32746g-eval.dts
@@ -213,6 +213,16 @@ &usart1 {
 	status = "okay";
 };
 
+&usart1_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_hs {
 	dr_mode = "otg";
 	phys = <&usbotg_hs_phy>;
diff --git a/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
index 97fc3fb5a9ca..6b01c3c84272 100644
--- a/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
@@ -24,6 +24,7 @@ gpioa: gpio@40020000 {
 				reg = <0x0 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOA)>;
 				st,bank-name = "GPIOA";
+				bootph-all;
 			};
 
 			gpiob: gpio@40020400 {
@@ -34,6 +35,7 @@ gpiob: gpio@40020400 {
 				reg = <0x400 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOB)>;
 				st,bank-name = "GPIOB";
+				bootph-all;
 			};
 
 			gpioc: gpio@40020800 {
@@ -44,6 +46,7 @@ gpioc: gpio@40020800 {
 				reg = <0x800 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOC)>;
 				st,bank-name = "GPIOC";
+				bootph-all;
 			};
 
 			gpiod: gpio@40020c00 {
@@ -54,6 +57,7 @@ gpiod: gpio@40020c00 {
 				reg = <0xc00 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOD)>;
 				st,bank-name = "GPIOD";
+				bootph-all;
 			};
 
 			gpioe: gpio@40021000 {
@@ -64,6 +68,7 @@ gpioe: gpio@40021000 {
 				reg = <0x1000 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOE)>;
 				st,bank-name = "GPIOE";
+				bootph-all;
 			};
 
 			gpiof: gpio@40021400 {
@@ -74,6 +79,7 @@ gpiof: gpio@40021400 {
 				reg = <0x1400 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOF)>;
 				st,bank-name = "GPIOF";
+				bootph-all;
 			};
 
 			gpiog: gpio@40021800 {
@@ -84,6 +90,7 @@ gpiog: gpio@40021800 {
 				reg = <0x1800 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOG)>;
 				st,bank-name = "GPIOG";
+				bootph-all;
 			};
 
 			gpioh: gpio@40021c00 {
@@ -94,6 +101,7 @@ gpioh: gpio@40021c00 {
 				reg = <0x1c00 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOH)>;
 				st,bank-name = "GPIOH";
+				bootph-all;
 			};
 
 			gpioi: gpio@40022000 {
@@ -104,6 +112,7 @@ gpioi: gpio@40022000 {
 				reg = <0x2000 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOI)>;
 				st,bank-name = "GPIOI";
+				bootph-all;
 			};
 
 			gpioj: gpio@40022400 {
@@ -114,6 +123,7 @@ gpioj: gpio@40022400 {
 				reg = <0x2400 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOJ)>;
 				st,bank-name = "GPIOJ";
+				bootph-all;
 			};
 
 			gpiok: gpio@40022800 {
@@ -124,6 +134,7 @@ gpiok: gpio@40022800 {
 				reg = <0x2800 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOK)>;
 				st,bank-name = "GPIOK";
+				bootph-all;
 			};
 
 			cec_pins_a: cec-0 {
diff --git a/arch/arm/boot/dts/st/stm32f746-disco.dts b/arch/arm/boot/dts/st/stm32f746-disco.dts
index b57dbdce2f40..9545b14d77c3 100644
--- a/arch/arm/boot/dts/st/stm32f746-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f746-disco.dts
@@ -169,6 +169,7 @@ touchscreen@38 {
 &ltdc {
 	pinctrl-0 = <&ltdc_pins_a>;
 	pinctrl-names = "default";
+	bootph-all;
 	status = "okay";
 
 	port {
@@ -207,6 +208,17 @@ &usart1 {
 	status = "okay";
 };
 
+
+&usart1_pins_b {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_fs {
 	dr_mode = "host";
 	pinctrl-0 = <&usbotg_fs_pins_a>;
diff --git a/arch/arm/boot/dts/st/stm32f746.dtsi b/arch/arm/boot/dts/st/stm32f746.dtsi
index 208f8c6dfc9d..b0f012de759c 100644
--- a/arch/arm/boot/dts/st/stm32f746.dtsi
+++ b/arch/arm/boot/dts/st/stm32f746.dtsi
@@ -54,6 +54,7 @@ clk_hse: clk-hse {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <0>;
+			bootph-all;
 		};
 
 		clk-lse {
@@ -76,6 +77,7 @@ clk_i2s_ckin: clk-i2s-ckin {
 	};
 
 	soc {
+		bootph-all;
 		timers2: timers@40000000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -149,6 +151,7 @@ timers5: timers@40000c00 {
 			reg = <0x40000C00 0x400>;
 			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM5)>;
 			clock-names = "int";
+			bootph-all;
 			status = "disabled";
 
 			pwm {
@@ -645,6 +648,7 @@ ltdc: display-controller@40016800 {
 		pwrcfg: power-config@40007000 {
 			compatible = "st,stm32-power-config", "syscon";
 			reg = <0x40007000 0x400>;
+			bootph-all;
 		};
 
 		crc: crc@40023000 {
@@ -663,6 +667,7 @@ rcc: rcc@40023800 {
 			st,syscfg = <&pwrcfg>;
 			assigned-clocks = <&rcc 1 CLK_HSE_RTC>;
 			assigned-clock-rates = <1000000>;
+			bootph-all;
 		};
 
 		dma1: dma-controller@40026000 {
diff --git a/arch/arm/boot/dts/st/stm32f769-disco.dts b/arch/arm/boot/dts/st/stm32f769-disco.dts
index 535cfdc4681c..539517c7991e 100644
--- a/arch/arm/boot/dts/st/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f769-disco.dts
@@ -133,6 +133,7 @@ &clk_hse {
 &dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
+	bootph-all;
 	status = "okay";
 
 	ports {
@@ -178,6 +179,7 @@ &i2c1 {
 };
 
 &ltdc {
+	bootph-all;
 	status = "okay";
 
 	port {
@@ -221,6 +223,16 @@ &usart1 {
 	status = "okay";
 };
 
+&usart1_pins_a	{
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_hs {
 	dr_mode = "otg";
 	phys = <&usbotg_hs_phy>;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
