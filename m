Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A12FA4832E
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 16:40:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95052C7A84B;
	Thu, 27 Feb 2025 15:40:17 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2101.outbound.protection.outlook.com [40.107.20.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A4AEC78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 15:40:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVEitV9kfjvUu5jQ6WnfEpToddiLEmHnSdJXvB+Nl3r/Y77uRiZVAtQBq80v2tyd/jg4octCq6w5yIjZ8uWLQCInGYweBiMgoJ0icvjZGwk/edEbaUMwKjRQJYsfiyLJZ32+kvKX4WVga6OlxfuTWB8TefYASF6x36joib13BY+lCaT3tcWWKOvrM5Ev8+1uWC6tdaiVb4tz1Aflp19b35Ku3CSPCN0GM65Rc1ClL4PilryTf5Dd/9gfWO90PJLZkyOGlpxCOQiqomf0lPpyowSMoor/i7Z1A7D8wMS7nI5rc2q40pyFzJgBAbm6jVRqiYcHBej4tWPhHUYna/FIqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+3UgZPNuzz/YXDMYKi17qCbdiRivy2PRfUhjk5JlKM=;
 b=PcUiQ900gYrAH7CfzlYqrlgtuW2xsLmVSX8L1HpkD+UXY7FqIdbGHo0HhkMmGGNScI529mGQGzaBBQArkN8WAuojXCPuRyTAyPphYCbBiL+IhnMO0WKgJ8Jce4BY3EjI1L2zsQEjU1FdMw0OCSpoBnSCkadM06RU2AFpqkDY/x5peB6RlJynC31O353RWOk70iykN9bfbNd6tOabb8KFzoVGYLXnlaNtwL++fXlf4CLymAiBEWT1REw6Hp350FHQ+e+wIU5lr76ScxwGHX34D8TKTVklxFujHmVPncou3Nvz+rhJ6A2V7k5qE2WRDUfa2+0fpa+RoRRJ7RFRNBT6Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+3UgZPNuzz/YXDMYKi17qCbdiRivy2PRfUhjk5JlKM=;
 b=Mo8A7WNg8x7p8D2tFPNAL6tgAAIbHYJSTVZHM4rQmoDllPn3OA0WBT3Ko06QYoP6XuPuRBJRhyRwwileO09NPzSBU7Xrjp7Bx0iZMwOFDzjxza2Qu3kD9cPMqglvia5pwmzXFv+qjE7eKOtoy95jQ/mddqdonkn//D4pzt0TNzo=
Received: from AS4PR10CA0021.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::9)
 by DBAP195MB0939.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:1c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Thu, 27 Feb
 2025 15:40:14 +0000
Received: from AM2PEPF0001C708.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::35) by AS4PR10CA0021.outlook.office365.com
 (2603:10a6:20b:5d8::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.23 via Frontend Transport; Thu,
 27 Feb 2025 15:40:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AM2PEPF0001C708.mail.protection.outlook.com (10.167.16.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 15:40:14 +0000
Received: from Berlix.phytec.de (172.25.0.12) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 27 Feb
 2025 16:40:13 +0100
Received: from Florix.phytec.de (172.25.0.13) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 27 Feb
 2025 16:40:13 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.13) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 27 Feb 2025 16:40:13 +0100
Received: from localhost.localdomain ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025022716401335-84 ; Thu, 27 Feb 2025 16:40:13 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 27 Feb 2025 16:40:02 +0100
Message-ID: <20250227154012.259566-2-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227154012.259566-1-c.parant@phytec.fr>
References: <20250227154012.259566-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 27.02.2025 16:40:13,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 27.02.2025 16:40:13
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C708:EE_|DBAP195MB0939:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dd1d66e-6c4c-4dae-4e4d-08dd57450743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kq1nzESRdgq4oZvNwGVOXqw5r7F7bYjh2BE8QGQv3vaCJg5ZpkC61ZRdAmZJ?=
 =?us-ascii?Q?VKZVU7rQ2JBIR+4opZgsrkpoTZq93vAE/BFY+RaNN3hnszvLvPzLU/m9YsWl?=
 =?us-ascii?Q?p/aaV/Qbl4vhre124eMW/zGCtjXWf5FaHTFsLSRsD7EkQJFMyyiWleQQ0HBY?=
 =?us-ascii?Q?YHqP+BOl0HNd7HsFHakBj1JGDx0OsF3cqkqARES/cG+Ps96g32i+exYexJ5q?=
 =?us-ascii?Q?T01BNNO4HdBI0j1dXWShrDlWqu1tlvO1Xo6PkYSyFPDLSvp44S1cV8/AB+XY?=
 =?us-ascii?Q?YZ7WxhCb8nXPtmphgxsq8P6rzV/c16p0ha9A0Dg4Nbzlowf9tCSa2cPkUnjZ?=
 =?us-ascii?Q?3TpQQoAir31yTCTOhtRhtz+jqaln/ulJMIVqg0u2tSQXPjWEgRZVkrKi34kB?=
 =?us-ascii?Q?TYPG/yMvDhIeqq71aBKT9nKRfX6IlIClpFxRGrCt3yFpo6uOMEAKrRS0NzCc?=
 =?us-ascii?Q?+H84KqJJA31YXAg6KjR+PUaDgnZHwkTkATTI/5yUML1kDrlh4zeHYMExSAGK?=
 =?us-ascii?Q?kLJvcAnBcxn75K462i5O070t4UDxD7S95Kj+cQ1L+akOqjsW3PqkN464GXGI?=
 =?us-ascii?Q?A3+oxbf5dC8mEhSgmClORQkrCduL8v7uN+mKhRmgy2cdbn/QCKmolBRaTyHd?=
 =?us-ascii?Q?ymS4EW1nf/pK8OHi71ffa1l1R2OOr7zDWYc4dYEkWfcV7RubmFEceysWImVZ?=
 =?us-ascii?Q?JmdAqMLM0EJANmVhLhen30zQaE5kbxEOBJabBHQfcgW9Eaihw9KnxWsGh2M2?=
 =?us-ascii?Q?6VGRHC3woyvwXl6MU04vf+M5vkUIzRfoTjRUR3d77/IXnf3nW9Gmi7Xj0SbW?=
 =?us-ascii?Q?vIUb6g0efLCfMMt3gs0RnI7ltLRKqQhiGSqE9TwYcd+PmdFOSdZjlhG4G+vo?=
 =?us-ascii?Q?xTVlsHhY+ddgc6DFn5XkGwHcl7VA8wfDsjXMoB+OTWCA8Ci7T1yc/90E8wvU?=
 =?us-ascii?Q?frsUV7doqDgXPRc2/FGFo5aF3O8/aR8H/JmQSDwhTJ6vm56yl8uWApTpmmXX?=
 =?us-ascii?Q?p9UTBBzJRc8F683fnWPv1V62GqlQZl1Bu49A0Ev4/iGRT2QTzVYyhOq0iz4d?=
 =?us-ascii?Q?oTk12LPct0R1mQp6qF9Ut8CwFaM3eap3K55K4+qHoPHa6Bh6FuZS1pmuHn3a?=
 =?us-ascii?Q?DbnEQIbFpfiBs3AgBqWj6hhUBDWeS1bzYnScvUVCG1nAelN11rdxPyJRc8dd?=
 =?us-ascii?Q?jAKTG8CzDu9KHXQ/rxcPoE9S5i2Fme+CK90ijd8Nqw2RffnFWdd/jL3Txt42?=
 =?us-ascii?Q?XJp2s+TMP3W4hKtegDLGuOZ8iISYvucxupLJzdT2UPUkwdkuitj3E/09Wgnc?=
 =?us-ascii?Q?OUdY8pqZ2T1VITstARPYE/jV/6wkkqJKBttkeghF7uJKBv99awipp+Rf1kk4?=
 =?us-ascii?Q?jTGZD0JSUDBEdqHsaLhl3Fv9VXc+3+Ul1bakB1aQ8gcTIj7zrwAwBfd7AnFg?=
 =?us-ascii?Q?sMIzRjC32o6CHscmfq3ErRb2Ix6HSl92n+nEdqHIlq3Rpa3XJdlb7fYM5XkW?=
 =?us-ascii?Q?qxQxulKOM4Ye6g4=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 15:40:14.2377 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd1d66e-6c4c-4dae-4e4d-08dd57450743
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP195MB0939
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [Linux-stm32] [PATCH 01/11] ARM: dts: stm32: phycore-stm32mp15:
	Rename device tree files
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

Rename "stm32mp157c-phycore-*" device tree for the following reasons:

- The name of the dts should match to the phyBOARD name and not the name
of the SoM ("phycore-stm32mp1-3" was initialy coming from the name of
the yocto machine from meta-phytec).
- PHYTEC manages different SoM configurations with different STM32MP15x
SoC versions, so common dtsi files starting with "stm32mp15xx-*" should
be used (as it is done for ST boards for example).
- Add "-rdk" as suffix (for "Rapid Development Kit") to match our others
phytec boards dts names (imx6, imx6ul,..).

"model" and "compatible" properties are updated to follow new device
tree naming.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 arch/arm/boot/dts/st/Makefile                             | 2 +-
 ...stm32mp1-3.dts => stm32mp157c-phyboard-sargas-rdk.dts} | 8 ++++----
 ...tm32mp15-som.dtsi => stm32mp15xx-phyboard-sargas.dtsi} | 3 ---
 3 files changed, 5 insertions(+), 8 deletions(-)
 rename arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp1-3.dts => stm32mp157c-phyboard-sargas-rdk.dts} (77%)
 rename arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp15-som.dtsi => stm32mp15xx-phyboard-sargas.dtsi} (99%)

diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
index b7d5d305cbbe..57b20c53cfee 100644
--- a/arch/arm/boot/dts/st/Makefile
+++ b/arch/arm/boot/dts/st/Makefile
@@ -66,7 +66,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp157c-lxa-tac-gen2.dtb \
 	stm32mp157c-odyssey.dtb \
 	stm32mp157c-osd32mp1-red.dtb \
-	stm32mp157c-phycore-stm32mp1-3.dtb
+	stm32mp157c-phyboard-sargas-rdk.dtb
 dtb-$(CONFIG_ARCH_U8500) += \
 	ste-snowball.dtb \
 	ste-hrefprev60-stuib.dtb \
diff --git a/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dts b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
similarity index 77%
rename from arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dts
rename to arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
index 28d7203264ce..cb5a55798036 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
@@ -10,12 +10,12 @@
 #include "stm32mp157.dtsi"
 #include "stm32mp15xc.dtsi"
 #include "stm32mp15xxac-pinctrl.dtsi"
-#include "stm32mp157c-phycore-stm32mp15-som.dtsi"
+#include "stm32mp15xx-phyboard-sargas.dtsi"
 
 / {
-	model = "PHYTEC phyCORE-STM32MP1-3 Dev Board";
-	compatible = "phytec,phycore-stm32mp1-3",
-		     "phytec,phycore-stm32mp157c-som", "st,stm32mp157";
+	model = "PHYTEC phyBOARD-Sargas STM32MP157C";
+	compatible = "phytec,stm32mp157c-phyboard-sargas-rdk",
+		     "phytec,stm32mp157c-phycore-som", "st,stm32mp157";
 
 	aliases {
 		mmc0 = &sdmmc1;
diff --git a/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
similarity index 99%
rename from arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi
rename to arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
index bf0c32027baf..ebbb82c09a1e 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
@@ -16,9 +16,6 @@
 #include "stm32mp15-pinctrl.dtsi"
 
 / {
-	model = "PHYTEC phyCORE-STM32MP15 SOM";
-	compatible = "phytec,phycore-stm32mp157c-som", "st,stm32mp157";
-
 	aliases {
 		ethernet0 = &ethernet0;
 		rtc0 = &i2c4_rtc;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
