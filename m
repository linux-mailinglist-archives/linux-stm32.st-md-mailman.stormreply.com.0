Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC67A0948C
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 16:02:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 284CAC78F72;
	Fri, 10 Jan 2025 15:02:34 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2137.outbound.protection.outlook.com [40.107.21.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04CD6C78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 15:02:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kj4g1zM/sdJyuNhrlRA0NUB13CRlOettHdCTUXFYR1NzS+3yfSPD05rKnD/ANBaTg99FoQt39hzZXsj/VjlUFsSaM8sUR2/uRt4mQDNCO3ldW7JLHXvL73uIZQSnrU/ZFzKB7VqMSz/E+SvdVXyFCULyBtVwd0NzMEwul61lQ4c59og3xIRDfCFZOpJLPCm+XCuPOYKGhxoT0CF0R/h8tvofFud+QDK+BJ64nj91S/T0IkxbHjcnHAuoHz6bx946bop0PiVgbfgwdmlOLVf34smOqILhlL1i6tq1DgUGCi10XGbYLPIUgdZMZUK+QCFSMeCincK9TXIpCeIS2XMxCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51KRD95eH57E6R9yv/6nab4OMy06ephTzwXmkHgig/w=;
 b=ik4WMij0j+pAMt43HSBXxuj4jL329qG24jRJ4A6H4XjDjER4E6UOIExkmnrf7k5JobLBLmp+puM/AaTlqnd4e9IqTvs1xjFJDhEKCUMhMSiz5fI34TMkNffB/FyM60vkGxe1dfVZ0oEutLqoWzcCpO1kuZ7y2hwtjPalxTfy3z9UIi+lg2SMQBJmuSYZ69rGBdQLoTVt/tfwOVbsReRvilAFlaFv76eKbw5QWVu2+4KMPktv0XFxNH0B4ecBe9SUN2/bwz8fZNbYNugrK6TzPu+aV7uFVgcBRh2bg74Xu+6oG7rwATsNKyqNdvFRkXviD4QAK2FdcHGj5RAibPSpMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=phytec.fr; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51KRD95eH57E6R9yv/6nab4OMy06ephTzwXmkHgig/w=;
 b=TWDTz6Z08yKOyojoO7eMjVNAOnFLY2BwaDAaFOjj5QHSiE6tk9goZ0ZPT7NZRQx5oarbM2zaPJb/Vt/QqQcmkxEUmDoMgwDcLWseQlUfbKwQ/4/0YbqDxbEt1nKy3muAqiIXbFeAGfrX5ZEzARn3vHRGeIcgjUG1aEam6k5SOa4=
Received: from DUZP191CA0061.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::16)
 by PR3P195MB0763.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:34::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 15:02:31 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::58) by DUZP191CA0061.outlook.office365.com
 (2603:10a6:10:4fa::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.13 via Frontend Transport; Fri,
 10 Jan 2025 15:02:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 15:02:30 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 10 Jan
 2025 16:02:18 +0100
Received: from Diagnostix.phytec.de (172.25.0.14) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 10 Jan
 2025 16:02:18 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 10 Jan 2025 16:02:18 +0100
Received: from pc.. ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025011016021786-28 ; Fri, 10 Jan 2025 16:02:17 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 10 Jan 2025 16:02:11 +0100
Message-ID: <20250110150216.309760-7-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110150216.309760-1-c.parant@phytec.fr>
References: <20250110150216.309760-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 10.01.2025 16:02:18,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.01.2025 16:02:18
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8B:EE_|PR3P195MB0763:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c092f2b-7983-4bcf-26b9-08dd3187ce6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wEeABCzEyQub5ZTP2MDlfoNO9Q0N3gBLCnqje/xno2HDRkGHNrO9gpoHShkY?=
 =?us-ascii?Q?GXo3dXzwoqI8BjPxarR5eWAEORoyjXNrKLY/6YfXCVI7u6j3/D9JqW7yW4Dm?=
 =?us-ascii?Q?7QEmaKxCPoprtbfFQXLrWfuAjNJo5QHjgxi1ae1234QEfSUSGDruvr/zB9Zm?=
 =?us-ascii?Q?THXGnK7mCfK53KpJHtig0VZA/tO4JWTJnBriDtcHUETdePoHp9J07rzlBB0b?=
 =?us-ascii?Q?y8kMn/2vkyfaEmnINz0/r8pp0HIYh1Y7SYK9TVpBYYegzg7Q47ZwR5bi3drr?=
 =?us-ascii?Q?C1nrC7I/ykWeRyHMrhy4htIY2o2WDqAAiThk3gov5WVpzpBY9pdTF5CCkE0L?=
 =?us-ascii?Q?Ov70K3OLW4ftalxOWLaUjH2z2w2/3fxvUEm15IPGpLlfQB97PqxUErk8j3Mt?=
 =?us-ascii?Q?RRXKJ//bxxXiK+WC7kPLPB8HjJDC9w/Z/ySdaGMSohWH91YUetJr6s92wzA6?=
 =?us-ascii?Q?8CR0povtL5rL89z9K48NtB47p4KJpvtiKVph6Xr/8vMCmyc5Yd8s0dI/0y60?=
 =?us-ascii?Q?rcondvFo5yMgDEJdRsyPfVDR8adNYb2f8cq3t6xGIFsbik/YHVT+yN/dJrCE?=
 =?us-ascii?Q?WbFFboFsrI4Nd3a3aIhRK/8bzRBisPAwNdI+3lM4Vb6J598/X1OupIB+a5b8?=
 =?us-ascii?Q?iY8PpVloEa90MtUL9j/1NzGxXplcVz7qNfq4cpCs6YdYP7Ifd+pIG4462ZEK?=
 =?us-ascii?Q?xdZrFwc7G3n/czzSWET99etP3XnIztpJLNlHZZtlX6MdwbYotuCFFYBy6E4a?=
 =?us-ascii?Q?fKU1XUhyDRI2halOyBwiWhAEhjeSGDQZzKUlgpNAlrqOS8UtY7Y4u60dk3jS?=
 =?us-ascii?Q?zcbYa+NigRxvWFY3MRokV6yLrO2k0uebPGwenLBAcDTm2VD6CMcAi4XzzdzE?=
 =?us-ascii?Q?WCZ6QXcYrn3h7xbtYiIx983oOxrsola2qQjF3lNj52XAp6lQXJvqe5vfErqp?=
 =?us-ascii?Q?bXsJumcyENIQ8HNOKsDHFpoli6yWllWbqB/jCrTKTMPEU4ffwNMDfoWE7Nza?=
 =?us-ascii?Q?zrhf87giC09wMVkoic6aOsKBNpDbW/4f++7/jsPZbPoklp6UT+rpgOf56OCH?=
 =?us-ascii?Q?1o4Xbq0nT4qJHChSpOfHsjghCsVwcWqUJdgeyjEOlYgIAPKpQPHaSFQQXaaK?=
 =?us-ascii?Q?l6xshE9LZptII1GWGaWItljPZxCvp5SW9/xB29K07x4IVRgu/4GvyDM7Rm7a?=
 =?us-ascii?Q?Uf6bYNAXpiPZgLoSiocuA66LUVkrRekMk2HzCy8Iw2H7e/9/5HkSx1BmArMF?=
 =?us-ascii?Q?0M04NddFxlWEzt4rGM8/jyUUXFNusbKqApzJyo+Xydw+Uon9DuC8p3Os5Clw?=
 =?us-ascii?Q?VOJ7C/H9abKu4Rz3CShvmD82UaiB271t6eOWum+IKbr4C099Vve1gqDH3vP8?=
 =?us-ascii?Q?Xwdce8srsF/j0BPMB5iOTZ9fTvkusdbKV3Zfd3FsjJZMGS4ypwoHPq+/YLra?=
 =?us-ascii?Q?YWdxSXs0GeBNR3rwJ/jAHt88CSsoIsdYskwqexXcgSgRkPPxDLwP66QUNuu+?=
 =?us-ascii?Q?RuEhvEmzczQpK9M=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 15:02:30.9590 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c092f2b-7983-4bcf-26b9-08dd3187ce6f
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0763
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH 06/11] ARM: dts: stm32mp15: phycore: qspi: Fix
	memory map and pinctrl
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

- Add missing chip select pin group in pinctrl.
- Overwrite the memory map to the Flash device size (16MB) is necessary
to avoid waste of virtual memory that will not be used.
Without this modification, qspi probe fails because of ioremap error.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
index 660cdc260963..f8808eee6a22 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
@@ -290,8 +290,14 @@ &pwr_regulators {
 
 &qspi {
 	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a>;
-	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a>;
+	pinctrl-0 = <&qspi_clk_pins_a
+				 &qspi_bk1_pins_a
+				 &qspi_cs1_pins_a>;
+	pinctrl-1 = <&qspi_clk_sleep_pins_a
+				 &qspi_bk1_sleep_pins_a
+				 &qspi_cs1_sleep_pins_a>;
+	reg = <0x58003000 0x1000>,
+		  <0x70000000 0x1000000>;
 	status = "okay";
 
 	flash0: flash@0 {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
