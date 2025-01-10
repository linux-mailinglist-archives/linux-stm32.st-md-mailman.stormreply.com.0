Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7947EA09489
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 16:02:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D499BC78F75;
	Fri, 10 Jan 2025 15:02:26 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2107.outbound.protection.outlook.com [40.107.22.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C99AC78F71
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 15:02:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcAe7IGrpEt6gMkam4qX+bl4vmpCTjfydUxyHdk9UJEh20Y4wpZ/3lueUaYDi7Ek+ht1ENYroP7HC46oDQGT9mops6ssGLA8GlM59JgkJkRocJnszhuGTaw8FdmWhtxr/9t7t0Cxrl+mtqbMzloADaca7b6aDev9D0FUvs3EdCqygU7UJAj0IUiEwICBF3TAulWcswEQChnP4FfL5eRdyy267VM5TmwpOdrt259vkzOFpcBFSM11/Xq7jNJiHJugZ1SSwrl7j7X58eiRz1VjdManFzhDWt4fJloOTJcCVrjBBhv+wvMjfbJghIiiCWLphfK+VVvROWXIPZucwa3b4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0qVTiGEcVTynn2hZcK4SUBgSKWLJRUAkKqZS+QLdUU=;
 b=qwxZPmEkbuUst5uXXau9JkERwVymeEWWHI4p9FFgKk9rfar88vpXg4fLURBzRCMbxJIkPnMJ/07Otntka+prQg4yV0NkyYDXOrY6y0U1jKNFSkmziYbILA37/tqFK/WAd7Wq0TRY59P8ni1rm725AGu54+j89pDAwoMM8eAGD2eRyUgAWD0OUmxDm9pdschyadZ/4yf1r2vECAzLtEmOFgPkf5BnIfCFwAcNvY6AHhW3KnOQFI9PXLoB0v0i7+BwBRm5WEXEKmzt+2ypzpqXTkygbWbaxIp4hxGHUxSKHe44MISaFRcG9kYTPnwCdOlc0smlaiCFnXjURsfBlv72Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=phytec.fr; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0qVTiGEcVTynn2hZcK4SUBgSKWLJRUAkKqZS+QLdUU=;
 b=Src9XvQaEhByx88t+IIGLVKBxlV39TtVSoqf4NGsE/O/8qshr9bG2ZVav5x9ibdd4QEmechbbbZQRiPHdEB1mGJZY7pebW2Ukl/92+IhJ667mRNDQavPmhQLQNBIihCVPnZSA+UE8t8lhXFEyqipV8RQtQZa4NkEqJc7BHQw0CQ=
Received: from DUZP191CA0053.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::21)
 by AM0P195MB0769.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:149::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 15:02:18 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::81) by DUZP191CA0053.outlook.office365.com
 (2603:10a6:10:4fa::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.12 via Frontend Transport; Fri,
 10 Jan 2025 15:02:18 +0000
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
 2025 16:02:17 +0100
Received: from Diagnostix.phytec.de (172.25.0.14) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 10 Jan
 2025 16:02:16 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 10 Jan 2025 16:02:16 +0100
Received: from pc.. ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025011016021676-23 ; Fri, 10 Jan 2025 16:02:16 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 10 Jan 2025 16:02:06 +0100
Message-ID: <20250110150216.309760-2-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110150216.309760-1-c.parant@phytec.fr>
References: <20250110150216.309760-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 10.01.2025 16:02:16,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.01.2025 16:02:16
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8B:EE_|AM0P195MB0769:EE_
X-MS-Office365-Filtering-Correlation-Id: c8776dd8-0534-4ef8-1f5b-08dd3187c6ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o8ayCll2Med5RhB5sOoJPsGrIwpYkwxVvjklwMbIbICT9y6SPxuRWkXhiwxI?=
 =?us-ascii?Q?K5UfbnRT9Frpipc2VNN115xxksBtdpM9XddPWLr0FgRHU2GYLIMorDATzRtz?=
 =?us-ascii?Q?5wdOrlNA713ofVpToT+V/wfHAFNEkgksrJlFxXXupAM0YcjQQ46aR8AB1II4?=
 =?us-ascii?Q?SGbyB0cUTJmEOxKldFCAthOVZCJYRXYb9X95d5HySh9Dj9Zvdn5ncOoHjid9?=
 =?us-ascii?Q?sA4LXEZW22s8Egg7Wr0VglBJVlV3egc1XMLv4F9aX/4o5hcShyj9nvjdsERl?=
 =?us-ascii?Q?kydxpWeOe82GPI0OwxdCIdNPFvvc8OwPD3JV2CsRCG/7bTb/x/zIrirliDrH?=
 =?us-ascii?Q?hmirgpzr17ueOf0a9S8psIV7nwT/ws25efimIRB/jFdKpn6icCwh/k0lhVdo?=
 =?us-ascii?Q?pAwwYNju/1hdwPXUC6ypXkIpQQCG9OE1BybTkUwOrao67pMBX4/Dd7pYETdi?=
 =?us-ascii?Q?Syr7o7pkh1+eHjFv+JQO5mH6GnQMUg/mqX5jbtv+GaDifxQUM4pfLhnK031d?=
 =?us-ascii?Q?3BmZ9SSEJvJaGJWr/CTyk6Dlyqc3Bm2QIupri/GzWJOWFeY5qVYmwKpFHj7E?=
 =?us-ascii?Q?DVn1I6eMgUtSt0RyEPN/XGMpOIu6JA2SNEspn/CwQK9g9E4r9r1T7/OduXDy?=
 =?us-ascii?Q?25WPUxFIfbQrSz89Od2sURvh5JWslx8LtTxfgl6CPW64eZO53g37QTONyXJa?=
 =?us-ascii?Q?ajnbK41l80XaCV9Q4Wru11J94iMrmCgTSKlszQI5mmX2MvtAtGMuQS7TJXx1?=
 =?us-ascii?Q?hBiih6Tzul//67+QQ7zHiYZ+SNbJxOerr8SWQMiSaN5rkJrKlMEZziO4YFgb?=
 =?us-ascii?Q?fkG24WUWkprrzCInARFb7UarZwEWdiyMa5abQXwQfHapsOHMc8RsH2sIfOAp?=
 =?us-ascii?Q?cR72bge0DhO41KJMB52+x1Qn6o83XHtI8tdGvDWAPddnwC7w51YJTXC3yGhG?=
 =?us-ascii?Q?X3yjjJvKcykfCVC+yjq2GvVSAJ/hd0x9eqFcKSfQlnKua78T6XQCpAcmjSY+?=
 =?us-ascii?Q?XSnzZ0IVVHq5hKbR/hJBb8xbNUlsaTd8Y7SMkEex0I1kl7FADe6ksNMk3YqA?=
 =?us-ascii?Q?IXVycs4bhm/1vcXSj9H0iaG9AjiZzIs3McWB3ZW/7ZHnQs3GsoH+a+kSrGQV?=
 =?us-ascii?Q?FnTSnZw9P1CQIh8ZcKr2ipgcdBKIxLZuRwCBIW6dBUD++/WQf5FhoA/UCYxO?=
 =?us-ascii?Q?2k/w4j976ZLy7FDjYLIWQjo2ZRCKMSjyC4fW4cvdB9M/5+gYqhX/v7Z9klSj?=
 =?us-ascii?Q?zoBySxwXp7PcV2i39cSzXfdMkAjOtlUTka+RvDTzSINj8CRAVFWMiC0SOAE7?=
 =?us-ascii?Q?gm2EkKqdr+Kg0lO1UIBYZOLIbWwa43MatBQF+L+iCu8qwPPKW/Ar0IcIpwOy?=
 =?us-ascii?Q?HhZpWZwQvxnNIdTpkERfS1Xu6r4sVwyoy1L3DhMFyo1LQFMWki2Di/xzjKW1?=
 =?us-ascii?Q?cpSTEt0yKXND8WmusAhUEtHbK7K0+cUP4a1fDLZGX8AiJbPaEGapX8hEiMlf?=
 =?us-ascii?Q?b6+y1ZW/3gq/oNs=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 15:02:17.9433 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8776dd8-0534-4ef8-1f5b-08dd3187c6ad
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P195MB0769
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH 01/11] ARM: dts: stm32mp15: phycore: Rename
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
index eab3a9bd435f..88f3a3cc2e6d 100644
--- a/arch/arm/boot/dts/st/Makefile
+++ b/arch/arm/boot/dts/st/Makefile
@@ -65,7 +65,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
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
