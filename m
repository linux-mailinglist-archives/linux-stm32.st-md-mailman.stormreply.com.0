Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E49AAFED2B
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 17:10:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBCD5C36B3C;
	Wed,  9 Jul 2025 15:10:17 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2123.outbound.protection.outlook.com [40.107.20.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2D75C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 15:10:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSE9tujHU8vgR3o+bAlIPbjC7NND17TtCXt+tIlsVFlr0OPmu1QvzZhGO7AsIU3RJNqjzNbSEgLcJic4rgdNe6yTRrECMbLerM8gCOtHxEXVyv9q/OdF32HTVhbd15jauJTx2HLD9QKf7IrrzjoojUVTFgvQlvtxzNkZvTzy/FY8VkuAhd1yluEogDrGbpSuV2TDReCJeU0GvFmvVHmEKApDHWpbqSFQc6N1V8mAz1kPprR2crWw5UTLmuAly9+8BN8T9oJ7TQGKh4gnxW0uMVZSJcfmeMgQm24n6fe9j+rdRjMOeLbdth+krs4pkY9xglTOoxA+SOJYEXI/mecw/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+04es0m6ApEgTx7oicnrSBXGMamroZDVNqZl5wmGJh8=;
 b=kf1KPBCjQcoUBdrIaPhOwt/euM/XyBsatO9Mx5PkgGExfyZsvGgpbQ+4KV878LrDV/eEoShStPd6biPE0q3kSZukgb0O69D0+tnvl+AwFSpPIV3KuEUs9VxAdxvJ6G68ljnPi6Vmx2KisCDBq7M7wK0d5mEbKr5f7PzCeaMJqrjhhoteu4l5z//hIDhoLhuRwYMwvZdwD04fnldPV4vCSxfaiBLfnpF4IL2DFuaagbyub3+yJx/WlbS//bpzJqDU3PKqSxZPbK2K96bDaID965dIWQURYKir1oE5YV5fr7kZCa954SCyuKVA5o0behb/87FaIjEdDkJ7/pX2/uye9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+04es0m6ApEgTx7oicnrSBXGMamroZDVNqZl5wmGJh8=;
 b=Zz/iEoFEe/zGWaST4vKRpyirgMwbM5aK1gAtd6KMDuKSkSZ7lBWzt2E61MuJvi5QH/SnyjamUkaFvTb0i8ZpY21U36a1BSIBE9qAcNs1bt99Uk/xc44qKb91LKnrohD1c/pvOx1LPl14Dq1xfTau36OhejRnH9Y4C0HBUiGpsNQ=
Received: from DB7PR02CA0011.eurprd02.prod.outlook.com (2603:10a6:10:52::24)
 by DU4P195MB2616.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:577::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 15:10:13 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:52:cafe::17) by DB7PR02CA0011.outlook.office365.com
 (2603:10a6:10:52::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Wed,
 9 Jul 2025 15:10:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 9 Jul 2025 15:10:13 +0000
Received: from Berlix.phytec.de (172.25.0.12) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 9 Jul
 2025 17:10:12 +0200
Received: from Diagnostix.phytec.de (172.25.0.14) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 9 Jul
 2025 17:10:12 +0200
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.57 via Frontend
 Transport; Wed, 9 Jul 2025 17:10:12 +0200
Received: from pc.home ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025070917101199-207 ; Wed, 9 Jul 2025 17:10:11 +0200 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 9 Jul 2025 17:10:01 +0200
Message-ID: <20250709151011.366537-2-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709151011.366537-1-c.parant@phytec.fr>
References: <20250709151011.366537-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 09.07.2025 17:10:12,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 09.07.2025 17:10:12
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509ED:EE_|DU4P195MB2616:EE_
X-MS-Office365-Filtering-Correlation-Id: dbfcc7c5-0ef3-4edc-0bf4-08ddbefab485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6ijc147wqsQvr5LBXbhjuKhTx/AhowTHqU+tkS7vAgpRp1y6m/KjlirbFoaZ?=
 =?us-ascii?Q?X9rZzfYqQeisOzgIfP8q9f0b7x0r11JOvowmgJUsbI8vilNLhRxINSSzHtCD?=
 =?us-ascii?Q?d1GJJD2uqSW4bLYcY3yDmy6QMOJc+Mp3u5D1cd+nRUCQRexhXTq/tOhT/z7G?=
 =?us-ascii?Q?UgHHs3ZlkvOd3MpzdfIzXsZjuyEo+gkDT7DebfLRToUEs5afywCyeFChIoR/?=
 =?us-ascii?Q?2WLYHhXuTr0b06tArIcJzbrccu399XycnOG+rWeF+N+muXLe/gwm+yOHLhXb?=
 =?us-ascii?Q?73rpJcmhBxOcW1ESRKBc4/fY9IvmH4HQoW0cFtAtHyMBXj8QXBbU4ZMduYVQ?=
 =?us-ascii?Q?ml9T2UhucsGn8V4E8Fk2mS8buFt8cLE0/HfkoIEFCY0SEEcgGzUE2R3eLc1l?=
 =?us-ascii?Q?yaUb1ScbdGO3wlwotf0t8gGhmlor044QvxVm/la3fiTWljlk/HyMZbTvdCij?=
 =?us-ascii?Q?7CDO8+iRCKscLvh06TQMol5MWymXohq/78K2ay0FX7kuxw5XrdsHODiX7ZK5?=
 =?us-ascii?Q?ikrs+CCGpaJ2p8vXn2XqupdNFXGNGEkPFRMghItCq1ecCjn36AbHgqikjydw?=
 =?us-ascii?Q?CJHueaWZV3iMWIkswf4lFPeByVNaKRbHbkfPilJEDCKdVZqnHGfyKcGkCOvb?=
 =?us-ascii?Q?VkBs2nsVgClCQ8AmTyWWhY7sULcw+1giWOGFYE0ib/RWtWNZLHNDXwRxyVdr?=
 =?us-ascii?Q?Acrdl8V/50H69Kcp0PFzyTgTaGZlbDmxBa7aH0PWyMIrCyS3zwNRo9gmjpWo?=
 =?us-ascii?Q?r/69S0KMJV/kcbZUpM2pOiYRK7Ybx0PKL4yunqbnSmQy8bcFSeY1biPDQSzR?=
 =?us-ascii?Q?lXXh302enbuX3M+d1pO8lrrL713HrGrcwPeiCda/jB9C1QaK/dWz6gyoMmiJ?=
 =?us-ascii?Q?M6vL0s8MzTf0Go9LSC81y/7B0DHT7eieIpgzPFBoPPE2FvxEeNTDOTbuWumH?=
 =?us-ascii?Q?wnsT21ppMisDGe1hFFhFguloEufgBbLbZW55pLkNsbWXQIVj/G4A52tp43oR?=
 =?us-ascii?Q?bCJNKPtMWWbKn5TqFcn0wEs7fP2PqwhaPLxoAXEOqlXu4x991L3wU3lKu/+m?=
 =?us-ascii?Q?6KMMbQTey9ekdUdw8Oia+yMiFKSYRk5VbnXx5yXmr+Jd/U9sI93M72A7HKpa?=
 =?us-ascii?Q?C340JJH6r8TV6AkC/vRvSSm5Z3vGBXSe/eW4map8xFFxopTsaYj9l3LVVec/?=
 =?us-ascii?Q?Zuj0Qyf3k5PdTjrakqEd9uto5S6jyfkbJ8SG2bFObK2HYjcoTkHLlXsgkrmr?=
 =?us-ascii?Q?eMzGSLWuZRXKsE3ivp4vUy1B/Ii88Em/vypjeDYr5gV9Tyep7MktBef02nFn?=
 =?us-ascii?Q?oJ/pmM6xZf5DVLV2kW0CV6NZcFKAq5WJbTgva1DBgO9QUbsCNjrms0UeZwqe?=
 =?us-ascii?Q?SEWZGpvh6yWnVEcZmoru5GvbF6Bmh/tqmaD4TUPzQoQV90tFJPjqh1raenjs?=
 =?us-ascii?Q?ETWVG+kev+tDl9nTguCyYYOgVzOkdGM1BoXyAuW5XxZjIKPb+m8SmLybzJTo?=
 =?us-ascii?Q?bhEtZmtVvev5fsjFKXp33o2e4vZxbR9r8SD1?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 15:10:13.5480 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbfcc7c5-0ef3-4edc-0bf4-08ddbefab485
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P195MB2616
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [Linux-stm32] [PATCH v2 01/11] ARM: dts: stm32: phycore-stm32mp15:
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
- "model" property is updated to introduce the name "phyBOARD-Sargas".

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 arch/arm/boot/dts/st/Makefile                                 | 2 +-
 ...ore-stm32mp1-3.dts => stm32mp157c-phyboard-sargas-rdk.dts} | 4 ++--
 ...re-stm32mp15-som.dtsi => stm32mp15xx-phyboard-sargas.dtsi} | 3 ---
 3 files changed, 3 insertions(+), 6 deletions(-)
 rename arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp1-3.dts => stm32mp157c-phyboard-sargas-rdk.dts} (89%)
 rename arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp15-som.dtsi => stm32mp15xx-phyboard-sargas.dtsi} (99%)

diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
index cc9948b9870f..099199f3e5f3 100644
--- a/arch/arm/boot/dts/st/Makefile
+++ b/arch/arm/boot/dts/st/Makefile
@@ -71,7 +71,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp157c-lxa-tac-gen2.dtb \
 	stm32mp157c-odyssey.dtb \
 	stm32mp157c-osd32mp1-red.dtb \
-	stm32mp157c-phycore-stm32mp1-3.dtb \
+	stm32mp157c-phyboard-sargas-rdk.dtb \
 	stm32mp157c-ultra-fly-sbc.dtb
 dtb-$(CONFIG_ARCH_U8500) += \
 	ste-snowball.dtb \
diff --git a/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dts b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
similarity index 89%
rename from arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dts
rename to arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
index 28d7203264ce..26995eb2a619 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
@@ -10,10 +10,10 @@
 #include "stm32mp157.dtsi"
 #include "stm32mp15xc.dtsi"
 #include "stm32mp15xxac-pinctrl.dtsi"
-#include "stm32mp157c-phycore-stm32mp15-som.dtsi"
+#include "stm32mp15xx-phyboard-sargas.dtsi"
 
 / {
-	model = "PHYTEC phyCORE-STM32MP1-3 Dev Board";
+	model = "PHYTEC phyBOARD-Sargas STM32MP157C";
 	compatible = "phytec,phycore-stm32mp1-3",
 		     "phytec,phycore-stm32mp157c-som", "st,stm32mp157";
 
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
