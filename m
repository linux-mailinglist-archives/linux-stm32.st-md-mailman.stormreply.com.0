Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3F0A48335
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 16:40:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29C5BC7A855;
	Thu, 27 Feb 2025 15:40:22 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2129.outbound.protection.outlook.com [40.107.241.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E870C78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 15:40:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdyiZ3NUjMOKvOGQvFTY7TJNnO4vF/xQ2kS2ZrkLhxMgcJj+ewoFOuYGPNutie9Z5TH538ABo5EO28gLyu575OFGsCNCsNhblUOHCjmBUVAkC4hTIFP/Pe7ImcPkgIvkmYHzijcji6u9xPgZW+pVnnWvRx3aIB9vAyrTDCT5vjExnxjHwRUJ2lZgHTv9Nb76ldFJ105j3+brTq+ceA+JEfxwJI7ZL2zBkJ38YD7Usr20uwOeGcWQW5Uyd2vb0T2OsIOiWmBgGAcdnTgXmaTMHCbhRI4G8TMcrBsctTrygLn7zwsMXcfpzRfd50mTyMd8rZeo9fjM4NQgPybKmWkrgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PyA+aHoTSAY9fZ+lXdh3rZpa35IYxkJ0GJ/vezDlDA=;
 b=u8HU/EKLdq9U175kdUFiaIWb4wcaLalWz9pG/ACe7xJbpp82O2Tq+dcH2AXbYixu7kKW8Jjd1kq+zxEJwznw7epZmyqToJ5OzQkCxDkBVpnGfITTNlG5syNNcebSDsfMjZROuuK47diHjGfvdwLLVhMO4yY/b3g62vn+pb2OLCx3DvI+7cW72+38rfVMM4R7AQEwC7qEG3YZP2CIYGQpZ49eKnYNctBZJ8kG16Iwa3Tqple8fyK7Acos0870/SbIvNRjkygxU6VbaYtFoOYGSVlNgDBHON8i0Sw6sGdStXG58/mUJ5WcdkSCThjD1xWgJoNKNlC4+x9QaRO38E5fkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PyA+aHoTSAY9fZ+lXdh3rZpa35IYxkJ0GJ/vezDlDA=;
 b=f2Qi5sYuikCWmlbIhUXUWhAjaNImJprbNuPNia3IFv36BT3+erQMciFKfDKMIlVrgUXoVp9LpNvkM/BYk5yCFBYICi4nVeGc7iVEXkcsJp5/1iq6ijwxxfjubfNx9AdMLxQj7eyl411M9AVEJwP+vsyE6qpHujWddlbEUHBNeYM=
Received: from AS4PR10CA0016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::8)
 by DB9P195MB2104.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:3db::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Thu, 27 Feb
 2025 15:40:13 +0000
Received: from AM2PEPF0001C708.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::f7) by AS4PR10CA0016.outlook.office365.com
 (2603:10a6:20b:5d8::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.21 via Frontend Transport; Thu,
 27 Feb 2025 15:40:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AM2PEPF0001C708.mail.protection.outlook.com (10.167.16.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 15:40:13 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 27 Feb
 2025 16:40:13 +0100
Received: from Florix.phytec.de (172.25.0.13) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 27 Feb
 2025 16:40:13 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.13) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 27 Feb 2025 16:40:13 +0100
Received: from localhost.localdomain ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025022716401291-83 ; Thu, 27 Feb 2025 16:40:12 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 27 Feb 2025 16:40:01 +0100
Message-ID: <20250227154012.259566-1-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 27.02.2025 16:40:12,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 27.02.2025 16:40:13
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C708:EE_|DB9P195MB2104:EE_
X-MS-Office365-Filtering-Correlation-Id: dada8172-1bdc-44b5-1757-08dd574506eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Uy5z777fiZhMr6a/9F6pBcUI8CRz0wwghmWluIn2VCKghlDZoj/pTUeNt6JW?=
 =?us-ascii?Q?VL+WAVuSU+4SERXtS5P3Kz+c7/h1lvnFbxSoqjdAO5l3sypTE/cSB75lNfp9?=
 =?us-ascii?Q?WWgpBa9OxTuDXWp2Yealn7jQUtnrqwYrw3g2p8s1Y8kOE6NLjyegnfB6Fqp6?=
 =?us-ascii?Q?IGYoZ27cTF2gpCeboKIyx2DK7V8MHXuXWMMzKuzwFllUjRNSSzomShK5nwsq?=
 =?us-ascii?Q?LPX5q48JQlwMdjYPD7QjmDJ6hwJ8cABkki/GAnkliv1g6o0LsCNDhiUwY+pF?=
 =?us-ascii?Q?ch8WTqJnT700EpNn8AZmBh1PEZYZF+mSBp+6rTuJxR7NTaTfhyTe9Umq/nFM?=
 =?us-ascii?Q?QinvttklEBn+ViypW/wGsCC6WWHZRzDMoQMMMZ8LUaWSso1g8WtQS9Qr+Wwm?=
 =?us-ascii?Q?h/w0Wnnql2nNOXbDlNXGJAHmR4JQR/tWjMJ1Z5+Z1oA3OTtnsOgb4be3IcJ/?=
 =?us-ascii?Q?61jXSh9PBHRP86RuxrenTJi12muEKhUl9y7nDZlaM278J8u+RI3TGrQN60xA?=
 =?us-ascii?Q?vKl7dCCT8gg46LSzUjRKx9q+qhV119RBO5LUGcoPhChTgsmVy9rI4Lt7XW42?=
 =?us-ascii?Q?ATJWWQaz3HM7A4rOfYWxrc32ofj5aT5QdHFc+6SJZIZUE2pkuaS/eZl1U8Zl?=
 =?us-ascii?Q?+e0yVuY1yrZM+PY/ut5huGEvWTWPdFBB53y1qPVHXuS6Fzefrno9IWXWJivy?=
 =?us-ascii?Q?Mcy4ZW1d49UsrciLalNOsnFVPmva/9JiJb3x71L64nvg7VoRSWDOOwYRZRB+?=
 =?us-ascii?Q?aA6rjlMPdgbk6GpXBwah1jAE71xkQbPQErBfB/yUQ0QAtecbi49I1vSfS7es?=
 =?us-ascii?Q?X0gBZqtXj32xABbUoDgDKbyetGtfQaSthd0pEf3NeLl3p2g2vEze1rQ6qwaP?=
 =?us-ascii?Q?JzA04HHfePwbkGyG5VsGq93xk9GWmLGa1frfvYhT+HDKDG6MCgCRTkgBIbUr?=
 =?us-ascii?Q?uEVrF7yh65f4U2SwrVITXBfIiTJ+iyGZYFXPlX6M+WucVTIIPSCmR4GT5cr7?=
 =?us-ascii?Q?z6KprXDUkujXdgM4jv/NcZ6jeZHX0/qINGX6DdxNTqBSFWbF54IlfvHxBjCp?=
 =?us-ascii?Q?DiZ4iRUQ96ugjVpZ9cRXDfhpY6R3iLwAnoILIodxdR7cJzS6hDIRPROC0hgx?=
 =?us-ascii?Q?AMbzpOjJ0elIs5IRYDvjvCA7Amf2GCQ1uOkNYyM/q6bI1mXFoxChoAL4RdVu?=
 =?us-ascii?Q?eBbVLyi9nfOuAwnNz/TH91XMiVUAMilTeBS5ZjJQfVAfIqCutHuqi2wVn3Hn?=
 =?us-ascii?Q?6bzj+zkG+Xdx9mwqa5KOp9rLmOfeH4YQOCL7A10lQYAubP4R+TU3HcYA64BB?=
 =?us-ascii?Q?ZI+Cxy6assIor3nYw8c+5ltUwS5kghARtQeRDQ5TfPAsO5lAoN2o3Vor6EN4?=
 =?us-ascii?Q?qNw2KAmotUxtrHySby+VRD7BNAzU5mBjPPBaSNSwshhYBlkwpMrqKb1ob5Mc?=
 =?us-ascii?Q?aBNir6euDrl07Zs7xpo2vfmSXJo3AbUgGgkfa+vA7rvbd3iOi/0qwqs0Vm0Y?=
 =?us-ascii?Q?qVdKY+3534NcST8=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 15:40:13.6596 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dada8172-1bdc-44b5-1757-08dd574506eb
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB2104
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
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
  ARM: dts: stm32: phycore-stm32mp15: Rename device tree files
  ARM: dts: stm32: phyboard-sargas: Introduce SoM device tree
  dt-bindings: arm: stm32: Rename STM32MP15x Phytec board and SoM
  ARM: dts: stm32: Add new pinmux groups for phyboard-sargas and phycore
  ARM: dts: stm32: phyboard-sargas: Fix uart4 and sai2 pinctrl
  ARM: dts: stm32: phycore-stm32mp15: qspi: Fix memory map and pinctrl
  ARM: dts: stm32: phycore-stm32mp15: Add dummy memory-node
  ARM: dts: stm32: phyboard-sargas: Move aliases from dts to dtsi
  ARM: dts: stm32: phycore-stm32mp15: Disable optional SoM peripherals
  ARM: dts: stm32: phyboard-sargas and phycore: Fix coding style issues
  ARM: dts: stm32: phyboard-sargas and phycore: Add optional interfaces

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   7 +-
 arch/arm/boot/dts/st/Makefile                 |   2 +-
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi   | 164 +++++++++
 .../st/stm32mp157c-phyboard-sargas-rdk.dts    |  42 +++
 .../dts/st/stm32mp157c-phycore-stm32mp1-3.dts |  60 ---
 .../dts/st/stm32mp15xx-phyboard-sargas.dtsi   | 285 +++++++++++++++
 ...-som.dtsi => stm32mp15xx-phycore-som.dtsi} | 344 ++++--------------
 7 files changed, 563 insertions(+), 341 deletions(-)
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
