Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 412DFA09488
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 16:02:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFCB5C78F6F;
	Fri, 10 Jan 2025 15:02:26 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2130.outbound.protection.outlook.com [40.107.105.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E66CC78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 15:02:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8l8D3BxHogQ9grPzHoOC+IBTYRt6If1Dy/I5C/pozc2pDoWxO/CNCMgaXiXqVVX3+eHEMMo8sU9g0YV3cK6czenp9AvP1m+WhcPCtB9e3R67LowzB0Ox+XcNUXuS9Sxw4nQePIA6xZ4ytpVhbmWfEOubfucuOss0Rl05C8HHx0bes9X5secU9qcLDlEGkbFbyMkMDdtPR5VPlf4wa2vLahlr8XEb9yMYindeb7n1F8u1e5DvTsilGo2wJ6AA4tQAraFJn5gtt5hZbJrFWRzYAX1vF89b8iCef49WSCfTcxQ+mMcIPFbybl9USaDhxEVcKe58xLBokfS3+vmldxLBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVAbH4e0uZs6LRyt37bcwz0i3s++y/OYr/Y8U2h66zU=;
 b=s/w6KpRVX+t7xKalLbgX2RAjcPgNQLkZeLBZxXC9bpigjvfzBhGQ2tgo9+o+u2nBayfBx0MzCtGiBAy9sBBeipkUPlVSNl2LdlHlcESK3+KpAvc6i0OahosSfV1hXegH54TBbCq1pjcGZLLHGF/AHTZ/llnXbnuK05vpD6Prk/b8/ZB9v2JH19m550PBZaR2366WwfCFDgwTvLGiEv+Dm2H/FTfeiSMl+jsh5OuTA+FujbT8oJ/0lJTAwCANIKVxrq49/vhXSIoQFP03YvKG+9oOb5RI8qzd2lxKGPlnVasgED1nxWoAWQwry6x4sZAMEX+0zeWSV5UOQU0yrp3I2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=phytec.fr; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVAbH4e0uZs6LRyt37bcwz0i3s++y/OYr/Y8U2h66zU=;
 b=qkj3oi+35d/tQNe5SO+prx+tHKqUb2xGaYJ2L6FnGXVjBRe3Ics3wlQFiEi/R7KPMrah1OVmwDxlsuRcerlNZJDYJFpsuvyj+dExqSg0+K+tHGYCi8o5db8IOAcjZcQ72g4vLUW3DmkQ1GJnHTZOdy9DPtXN2L1hYpsN5D2kJAs=
Received: from DUZP191CA0067.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::26)
 by AM8P195MB0900.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:1e9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 15:02:17 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::cc) by DUZP191CA0067.outlook.office365.com
 (2603:10a6:10:4fa::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.12 via Frontend Transport; Fri,
 10 Jan 2025 15:02:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 15:02:17 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 10 Jan
 2025 16:02:16 +0100
Received: from Diagnostix.phytec.de (172.25.0.14) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 10 Jan
 2025 16:02:16 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 10 Jan 2025 16:02:16 +0100
Received: from pc.. ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025011016021659-22 ; Fri, 10 Jan 2025 16:02:16 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 10 Jan 2025 16:02:05 +0100
Message-ID: <20250110150216.309760-1-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 10.01.2025 16:02:16,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.01.2025 16:02:16
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8B:EE_|AM8P195MB0900:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e3ae40d-722f-430d-0f54-08dd3187c65c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2131NODyxm1RbHtnnyxQS7q6DYiCGH3diDGAwoer4ulKRineOA/w8nXVPq9/?=
 =?us-ascii?Q?ePpsL0k4jDUSX5GMoeSCDJ4Gb+N8uEgcVoZDWtxBTpCHJvl2MWtnhgSa7f/J?=
 =?us-ascii?Q?Rex9DTXJwH4QXe0s1h+y8jeGhD4hNbB3m6qf3XbiuT4DLHUgHjgF9UxiayRS?=
 =?us-ascii?Q?8DFKIpMxPNpAPwQQwfEWIBt46CurzBwVsuP2fxH5jpdU7zW2Gl8wYWo7a+0H?=
 =?us-ascii?Q?RahLnxR2FaszfId+VmMjZCHUKBd0T+QkJiREMmF4gO+pe8+3HvoHJLUQYRux?=
 =?us-ascii?Q?CBCfI5vAH3vRFHaSYATQcc3dK+/fl5CJKsTWyBQU8rSkuVncxjmBw2JctTlb?=
 =?us-ascii?Q?SClJZ6OB+mFNM9rr9LSarepHBeq6ABrouu9S9/G6Dv/QeV6cGwtd10Rq6AMJ?=
 =?us-ascii?Q?IrjB5YT8IF8Tk5YqWkLCTU0MULf9yVyiiDjswXmmz+36wB0SycNqK3LcQgmD?=
 =?us-ascii?Q?TOxSQENf3UT5w/nr5KASxkKG93jhIR1CsBWBYnFvACljGvIb/LuW0DWtKXS+?=
 =?us-ascii?Q?Pwl4TbdRaSYgPiwmU6dRjQbVJXw9gmLwlfG1YgZAV9yjDKfCgqexl09GlRzZ?=
 =?us-ascii?Q?Mnfo+VTeAboyFN5VSdkaOsm1srHlt/ATnQKckENPCPEaSX+J8aS47XaMjcay?=
 =?us-ascii?Q?S3lKG00pgBSR7FcW5kDRXh1GwDoUrmSn3St5KBNJnkdT6BD10il0s8HLeNYM?=
 =?us-ascii?Q?fYgEixN2Pr7ICAzsw9xFC1QMp9A798lJkIs3i58DM2RMz2ob/1OG7JvDeGfn?=
 =?us-ascii?Q?vEpp5i8Z+VBLsV4D+acF1jf+s+4DF8SUM4JITYxiTmhok+O1gqsT/M37UoNg?=
 =?us-ascii?Q?a2qgBL5PukAzU10aS/4PRO8lA/7ur2BNdJVaQ5HfluvUJWluiyzH75hAyO2j?=
 =?us-ascii?Q?BUSa11R60Vsk+93iBxsxFUSvRDX0zaZoll+mZ/WHH289u7CanwKeYM/y1btE?=
 =?us-ascii?Q?fq7HUPA4bt/ztbMqbbIxoiWLsa61DAEPsXiX5InoNsSxOYxqYchY0ZvD3b6+?=
 =?us-ascii?Q?au7XD0ZUTc+oq1yyBWa5HSieTgfqtz9K85tCBZQhV0aJhUc5ILImZPPcct2w?=
 =?us-ascii?Q?obqNd8/jG5lvTLe0ym7QDf0eRhWAxj5BZmTVquk+cDXjrNGkeJk1KTI32sUo?=
 =?us-ascii?Q?4fXAFazaTpGEj8Wxg9Pe/5c5O5bMoeI/6XQqDrttttODdTF7EGrc8ZLxwdHF?=
 =?us-ascii?Q?WfKJF5WjP1TMk+g/DJeYzUZijrD7rJcvmElDxkSjEMt25ioA3uRFZF0dMA5w?=
 =?us-ascii?Q?ztj/4VdddMPexDm+tkMIPHDmT1zIMLnwMg2k3z8wG6tlM+YSBl+96DnDM20/?=
 =?us-ascii?Q?OUuNMEpdzTh9JoJAyhNmEQajWa+jpG6D8eXCYWYd0SIPMrVx3F3mAVhnKmpe?=
 =?us-ascii?Q?/e3h2rehaxd2QKr9vn8Dp+xSOBT948sDaDBDlWU6DL8wulaIE+n4BYBqEqLO?=
 =?us-ascii?Q?/T7wJeQhkVZbn4AKNG4zEuWKgwFCm7nht7QZMr5sC6ueUAroDCJBj+/MG6ve?=
 =?us-ascii?Q?aSoiYihyPubPT6Y=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 15:02:17.3965 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e3ae40d-722f-430d-0f54-08dd3187c65c
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P195MB0900
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH 00/11] Rework and fix STM32MP15x PHYTEC dts
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

This patch series rename and reorganize the STM32MP15x PHYTEC
baseboard (phyBOARD-Sargas) and SoM (phyCORE-STM32MP15x) device tree
files.
Indeed, the current device tree naming and organization is not really
consistent as it does not align with others STM32MP boards (use common
dtsi file as much as possible, use one dtsi for SoM and one dtsi for
baseboard).

The series also fixes some important pinctrl issues and minor one (coding
style). Additional pinctrl is also added for the optionnal interfaces
that are not enabled by default (FMC, LTDC, DCMI, PWM).

Christophe Parant (11):
  ARM: dts: stm32mp15: phycore: Rename device tree files
  ARM: dts: stm32mp15: phyboard-sargas: Introduce SoM device tree
  dt-bindings: arm: stm32: Rename STM32MP15x Phytec board and SoM
  ARM: dts: stm32mp15: Add new pinmux groups for phycore and phyboard
  ARM: dts: stm32mp15: phyboard-sargas: Fix uart4 and sai2 pinctrl
  ARM: dts: stm32mp15: phycore: qspi: Fix memory map and pinctrl
  ARM: dts: stm32mp15: phycore: Add dummy memory-node
  ARM: dts: stm32mp15: phyboard-sargas: Move aliases from dts to dtsi
  ARM: dts: stm32mp15: phycore: Disable optional SoM peripherals
  ARM: dts: stm32mp15: phycore and phyboard: Fix coding style issues
  ARM: dts: stm32mp15: phycore and phyboard: Add optional interfaces

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   7 +-
 arch/arm/boot/dts/st/Makefile                 |   2 +-
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi   | 164 +++++++++
 .../st/stm32mp157c-phyboard-sargas-rdk.dts    |  42 +++
 .../dts/st/stm32mp157c-phycore-stm32mp1-3.dts |  60 ---
 .../dts/st/stm32mp15xx-phyboard-sargas.dtsi   | 286 +++++++++++++++
 ...-som.dtsi => stm32mp15xx-phycore-som.dtsi} | 344 ++++--------------
 7 files changed, 564 insertions(+), 341 deletions(-)
 create mode 100644 arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
 delete mode 100644 arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dts
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
 rename arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp15-som.dtsi => stm32mp15xx-phycore-som.dtsi} (53%)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
