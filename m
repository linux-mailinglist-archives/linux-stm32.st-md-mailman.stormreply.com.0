Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6048FA2C591
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Feb 2025 15:35:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18116C78025;
	Fri,  7 Feb 2025 14:35:55 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2136.outbound.protection.outlook.com [40.107.20.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85F5BC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Feb 2025 14:35:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnaBfDKLoyUcsAtbHEVWXeypYPTPtZMWOcxGaho+gPg1m8AH4yzpLTTBsCE9uMIW5tOQf4MnsfZkl7BG+05uc04tY+J/oLkIptxLTWRtQJkTUGRaTXI5UyT0OPhi+NoB3H42O2dA8WJb/pY/JC4Myoviolf1NW26beKTqkPaNtGlxmX5qlYj87KI+YCLXwrj3lboni+Y9HEYBI5zfIyw8gph9ETHbyeRZVFg12VwX4IzknULgsD3x/yeKKBZHMw33LM9yLbCX6/N9qjkLp+Z1w8DrDWHIqrKpHC7mVMWCIZkdWZuoLMYotSXzbvyuBRfKDNryHQzURY+o9OKkl/t1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+3UgZPNuzz/YXDMYKi17qCbdiRivy2PRfUhjk5JlKM=;
 b=MzBSvU+8f+mV1+ZiadfZHaJDIAkP3mk1zbgv2cw+rO/c1bUj7shcklyBzd3BbC1lcB/d+KdvDlIDKs6N9ekGUzA9OxpMtoPndqH8BMVV0AVC+PAHu3BVAwsLhavBT66b2TfmGC9i0rMXoaZrRoL4gtpQyIWcCWdStXnSuYdwaJyBf3jujrzQIQw2dBlV7xhugfAVEqzxVelFVzufv16G4faoq/U588NkF2WvhPWXNPeNkIp+5UlrZl1Be23phZUqTqbqjE4Jsex9tZ9OmRwGVwP/R1gQXlq9kUDda48frSUwkTUoZ1acPTNdpZ7CdCOh5Ir/3jJmpj86R9/ezW18UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=phytec.fr; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.fr; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+3UgZPNuzz/YXDMYKi17qCbdiRivy2PRfUhjk5JlKM=;
 b=SNuZG0w1N2r5bTJ4k0TJ4MoIsxkncCO59/SJyu1+9zUUBbOY8a0t98hPA5777HgGUDdZkjefQBgcsbAFnKhMeD/XJm8ZKRA+LVfE9L/TSKIQtRs2kRa9UluGxuucsOzgcBN1PQM/5dO50MoEdirvZETEUy0YCTfTGhH7cJI4KMU=
Received: from DB6PR0301CA0083.eurprd03.prod.outlook.com (2603:10a6:6:30::30)
 by DU0P195MB1981.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:3e5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 14:35:52 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:6:30:cafe::37) by DB6PR0301CA0083.outlook.office365.com
 (2603:10a6:6:30::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Fri,
 7 Feb 2025 14:35:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 14:35:52 +0000
Received: from Diagnostix.phytec.de (172.25.0.14) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 7 Feb
 2025 15:35:51 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 7 Feb 2025 15:35:51 +0100
Received: from pc.. ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025020715355121-58 ; Fri, 7 Feb 2025 15:35:51 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 7 Feb 2025 15:35:40 +0100
Message-ID: <20250207143550.432541-2-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207143550.432541-1-c.parant@phytec.fr>
References: <20250207143550.432541-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 07.02.2025 15:35:51,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 07.02.2025 15:35:51
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C6:EE_|DU0P195MB1981:EE_
X-MS-Office365-Filtering-Correlation-Id: bd070176-54f6-4b2f-20f9-08dd4784b948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZyC1vE/ZW7feHmM0/DChYRZ3nk7mcXakp4oLD1NfzhAJ7CU+FIxqgBKuew78?=
 =?us-ascii?Q?tkjVLfj6gJo/8sQ0twbtJ9AhD9X00AbpPajyjt9AXGgAxTehkyBildi8JWPb?=
 =?us-ascii?Q?+s+amW2oRTJA02iUrwP9LjrE7IV1gN90bqWkGExtYepY5BGzXeA6xxI06d7P?=
 =?us-ascii?Q?fPuBsNKWDB9MNMZw2bpfrYRKhvdILLkRIjxVjpdK3lXJ/pKq2/KGo78Wnm6L?=
 =?us-ascii?Q?O84+oeRW7/n210Y8I3pOLMBMPU0z25upGkOfiJ/A8taTinhwkF1Zgu0jRFGR?=
 =?us-ascii?Q?fHr3fx7eHJRLnd0ndlaknMTRNWjYmdSI6ODgAlKH6PNQ7QplO9K9CfoUyNOB?=
 =?us-ascii?Q?ny7hNZXnjvZGOTCegautyWv6zrg4wGpVKZOOyE1BysmBcnOOmFlMXHLo1b4z?=
 =?us-ascii?Q?c992qlpxTpNgUM3HK/DCOuIOYoG/ccTfRRGRMfIIgs7Aai+aCgeFirqVwjn1?=
 =?us-ascii?Q?x3qfLQbRmvFWpb8DqAmOF0zF7fFI1/edc0DpASWikcp4T+LptGMVhqgZTcY4?=
 =?us-ascii?Q?SZzGpH0g6PxWjqndUcYMO+lH3wsmYsfUVq1gL4hQuRhV1x/H2F0cWA6cXtne?=
 =?us-ascii?Q?VxiUfPjgAuQuN9bKzVk0W2Wed3itaRjphSr0MJ+3UgrVqzbPbbvI6APBfDIX?=
 =?us-ascii?Q?RVkH9e9IAYz9PCG+L6iPxQl8+DBXf7w+5grzDmYpVPj/6jpp0ZZ/6i6bjilu?=
 =?us-ascii?Q?mg7ETwc6ynnHZN4dwIDyL3+OuAhhXp/zh8eEWK5mYXvmN1pgdp1jXSGjY03d?=
 =?us-ascii?Q?jVicWT2K7SAqx23sXsIVSTDKNDm3ij1RKVUV0NeI09RGZVno6JH/IMzOUxCK?=
 =?us-ascii?Q?bo8XBlSPHu20iC/JUOp/B3v7Gk1r65FZ4Lg/Avt+6X2F6XnGrxB1vHDN8In1?=
 =?us-ascii?Q?uu9VGwIuO0er6j+1UvQuvdvWvaKn+gEwxtiWEr+uxpNO0pVzMIu8cuFagiIz?=
 =?us-ascii?Q?OoQ25gYN128tTk4vwncrnVucruOH9sLsVee4TilUk8kZ5if+b9k0eL8hsOfk?=
 =?us-ascii?Q?8KVDbGW+wiTH9hSWrIJVeawyBjGgyg6+OdnU2JkLJCsK+Errm78A+ySlA8aQ?=
 =?us-ascii?Q?yAtruYR4Q0S9FDMTvXSm850Nza0czVpPq4xg41ilYo9kMootITOtXUj2AAoD?=
 =?us-ascii?Q?zwYxt6kZegWlDXLMIfzx+sAEU0rQe2mIyzehnyjV80nudiZtbRbASn+aukno?=
 =?us-ascii?Q?0Buh6+WTxCuViR2ZUv1TPm8Ptp2EHs1E3iWF0DIZj0ytd2n3jECa4HvNXPVW?=
 =?us-ascii?Q?JKRxIB7jWBfRXf+kpD49CAjPIV/Xr0E9vOFsXZBN8ww8HJk5pQhBES2eMJWG?=
 =?us-ascii?Q?vgPKTLjNXufQopi+6vnktnZnnxe8Zkum4S37K82Kz5eGGdrKfAiBZz44AxWW?=
 =?us-ascii?Q?EQvTMKVBUfbQLhPro6L+jN7LaujLxBB1PPVWaTg/w+6i4XxrXmi1axbYPO7W?=
 =?us-ascii?Q?9fZBIc8UNWZOxsxUKxNQX6qMZaRpfxXYmnIuc3CKR9tbxMOBbO4KEHsdZmv+?=
 =?us-ascii?Q?HfkNd3F/spRPAwA=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 14:35:52.5464 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd070176-54f6-4b2f-20f9-08dd4784b948
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB1981
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH v2 01/11] ARM: dts: stm32mp15: phycore: Rename
	device tree files
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
