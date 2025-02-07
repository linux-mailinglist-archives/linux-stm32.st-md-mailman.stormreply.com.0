Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C27A2C59C
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Feb 2025 15:36:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8D7FC78F8E;
	Fri,  7 Feb 2025 14:36:07 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2127.outbound.protection.outlook.com [40.107.247.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4E72C78F8C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Feb 2025 14:36:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDH5iqtwo/W5M69x/HrvdtONuU1b5e4nwHK03wZMMi9C08b63yfC608Cza7gMJdDe8B1Il+SEHuT+EF+9HvN8IZpIkp6IgsEbtQVa8RQcLKRdzQUfYWHmjoKsWt2p6DtKNizjcojnInroj/PhMw/T0mdu8u3zGwf1reDx6Y03nyJ76PqaFzqGA/vrXyUjuzQpLGgujk6ItIZbGmtZUH6uFFqGW55qlP9Cf99l30C2R3b037kSuECpBbD/yuY6s1gbQho/YMzsg3fBEASvmdZSs4NnL2xHG4JHp5WtcTIztNt1cDL2AnpBoYAJj0aNde/y364Fp4EdeEIddhgW8+vFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4yCW7fz9of7ZgzbQksuVUmuVzW7uYUrdorMcsIVtvo=;
 b=nXnC5HiumJxDfLGYnBTzQ1HffNVHDkKIfBbXWJskq463MKF7Szk8yT2INsVbIcjt7HSGviYWiqct/Fp8gAXkOlMuhWC319C8qhW7wOQjBMY9KkFv7U+sHtjXZb8N1lpZwUAVLgKDqQGsWllnhUnLiABsH5uRqi6+KQ/LUzdOtKLNewbZHhSENP4wptW0MhnN+P55rd05NNt05TomJqoU7pRudhamzuL5aS6OVx29JEpa1ds3+2hjccNFCU+//5roxU0nBcCEimbuHrwZcXYMM22W2qiIVRddxP9WqQyyZFGrZG2tdUeHXifjQICwc5vbKoKltJN6hAWK6UqT2MDV9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=phytec.fr; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.fr; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4yCW7fz9of7ZgzbQksuVUmuVzW7uYUrdorMcsIVtvo=;
 b=CaIsT7kZ752ZknMWYYhM2+QBdT0zaJwj/TQ38b9s1QZL/6Dm/eGoCT+A17BYGmHCXfWnkArRxGxJtBFAbBifg6wwKt5UrsckIxoRIhajYd6A9TzCsaspVDRjG/PzZgRwAIzlhb5uV/NRYBdItPWGivqRPs9mJ26HPQpBcppIRaI=
Received: from DB6PR0301CA0068.eurprd03.prod.outlook.com (2603:10a6:6:30::15)
 by DU0P195MB1452.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:348::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 14:36:02 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:6:30:cafe::6a) by DB6PR0301CA0068.outlook.office365.com
 (2603:10a6:6:30::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.30 via Frontend Transport; Fri,
 7 Feb 2025 14:36:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 14:36:02 +0000
Received: from Berlix.phytec.de (172.25.0.12) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 7 Feb
 2025 15:35:53 +0100
Received: from Diagnostix.phytec.de (172.25.0.14) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 7 Feb
 2025 15:35:53 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 7 Feb 2025 15:35:53 +0100
Received: from pc.. ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025020715355303-65 ; Fri, 7 Feb 2025 15:35:53 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 7 Feb 2025 15:35:47 +0100
Message-ID: <20250207143550.432541-9-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207143550.432541-1-c.parant@phytec.fr>
References: <20250207143550.432541-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 07.02.2025 15:35:53,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 07.02.2025 15:35:53
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C6:EE_|DU0P195MB1452:EE_
X-MS-Office365-Filtering-Correlation-Id: d652b9db-ec77-4d59-7b74-08dd4784bf53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vO1LHr5zhdhBTseTxFcAPmC3nUB9J1DGW2E9T2oUI8mJDvwqfsAvmOCBvnt3?=
 =?us-ascii?Q?jb5FHFgYnp019Ibjk197RnZPVJrQ9Kl3y5zrutflT7wU2vz3f9lBHtpcakok?=
 =?us-ascii?Q?sC+KmhICjPV+TW02BIzdMsr7TwcaxjQ1gMQzUeuB8etqv5qbVi1znTggV9LA?=
 =?us-ascii?Q?x9oS7JqD9c57PbK/YvBAOyIx33vTgfsx9UV70qQtleMf0z65NxjqCEaQxJpF?=
 =?us-ascii?Q?9U41JFFcyNxFyq/i6S2upMFhKQvmtZ6Zwi+4L7/5LLZ9vOoIsu720jGG7b3z?=
 =?us-ascii?Q?1AjtuG6US8UzPNHaXoNqLLcnmvW15i1+iaemi9+yoL0KuSowisSVphK9XbH1?=
 =?us-ascii?Q?X8ZJJCMl2OyZLVOrQQV339r0I42kyZJibeDjPUC4dwhCdcZYbRM5WHei0Hnc?=
 =?us-ascii?Q?trmpsAht05fPHVkjVCvjRQrxd2vUm1MMlYv9yUFqOdmSS0Qwgg9Q09Ryq+uM?=
 =?us-ascii?Q?8jhokcl9UCdXNQLDMPjJxYtW3dtsPE61WaZVooRnosMmb60+vgmBTSddshUl?=
 =?us-ascii?Q?Jmbp2JnAyFjZ6sH+2faQwYnk3kAT1T1ExCw1dep0YxnqoogatOUzkiS63mSB?=
 =?us-ascii?Q?pJpS0eFBLvsR/cP/j5slVKjMl0x8HT3KC0kl0MUdvSPjZTOm3H+cP22BLpPp?=
 =?us-ascii?Q?EP5soAEe7lFqaQz/NHp2LtcqN+WMs85VGP0c2HmpZIlAolX93ym5fqsrVfOu?=
 =?us-ascii?Q?qcesM0m6LaNcYBMuVySAWBJcKuK1TRn5rnFXexZfRLOlo8Xzk/uMnb8hvlsv?=
 =?us-ascii?Q?DSxUOT2u7QT+L2LRKIvbOjeW0E9jqlGHuZWt9hb9N8rH6yBOpBCwvm55L0V6?=
 =?us-ascii?Q?Wgdj7Xve4p1uBk3Ox6sva40zTgrXY0R5nFvVwBPiI4uHG/SXCZMQ0pHEBOCt?=
 =?us-ascii?Q?UKL5QSNM7IwlQ2c2hoMnh3fsc59DJHmYwP/SXEL9Q4ZFmB2ldbK5RuSjn4wG?=
 =?us-ascii?Q?5TqJqrYyN4/1H+rEEEPpLXvj0b/55uOQhrejVNPtrKdwyDVH08HZGr+WdrAg?=
 =?us-ascii?Q?+CivklS7/crmW2TsAWmTPEcFQwJfeS4ihtfJJIPfprQJlLmHYA4eAui8cUV6?=
 =?us-ascii?Q?RzYRL/We0v9j5qaeNeVOZvPUtwlepYPx31LzHcn3OA8NHmAyi3EVFnrkNs+Z?=
 =?us-ascii?Q?EFRNvd82sFrut/SETrQZBBsuErOxdAT+CgYk+1expGWJW6jnrITv6P2ceZDU?=
 =?us-ascii?Q?qUuSqdNZ3JcGR+PMKw0N3k07o3r5aiXg12Atk+UQFzRkUWLBoL4V0MaJcxId?=
 =?us-ascii?Q?ZukoddQzRpQU0vHxdrZ0J06+F9Zo1MF222lEqNcycsaZ4V80wh0TGN4M1J6j?=
 =?us-ascii?Q?1R1Nd7xpXZpVaJ09rvGehvLzYXuMJUrbnldgIgi7pudjHGglsWsWhsoRNKaE?=
 =?us-ascii?Q?PiYnxzAiyWCFVgjaw4pb33NvQFqq8ohI6654xP9uw1zt2FKPeE3t6AMrwAt+?=
 =?us-ascii?Q?Ke1RKmGjis+lqzYcysN1icZMI5kCxmm9CIESTqbPQ+97mVmmMnyDcPVDc0Wi?=
 =?us-ascii?Q?HUCZh8w9QrM7Iv0=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 14:36:02.6871 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d652b9db-ec77-4d59-7b74-08dd4784bf53
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB1452
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH v2 08/11] ARM: dts: stm32mp15:
	phyboard-sargas: Move aliases from dts to dtsi
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

aliases are common to every phyboard-sargas version. So move it to
the common phyboard dtsi file.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts | 9 ---------
 arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi    | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
index 43592234573c..462c89e68e2c 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
@@ -16,15 +16,6 @@ / {
 	model = "PHYTEC phyBOARD-Sargas STM32MP157C";
 	compatible = "phytec,stm32mp157c-phyboard-sargas-rdk",
 		     "phytec,stm32mp157c-phycore-som", "st,stm32mp157";
-
-	aliases {
-		mmc0 = &sdmmc1;
-		mmc1 = &sdmmc2;
-		mmc2 = &sdmmc3;
-		serial0 = &uart4;
-		serial1 = &usart3;
-		serial2 = &usart1;
-	};
 };
 
 &cryp1 {
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
index 564b2607bb9d..3d62f9e4d0cd 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
@@ -12,6 +12,15 @@
 #include <dt-bindings/leds/leds-pca9532.h>
 
 / {
+	aliases {
+		mmc0 = &sdmmc1;
+		mmc1 = &sdmmc2;
+		mmc2 = &sdmmc3;
+		serial0 = &uart4;
+		serial1 = &usart3;
+		serial2 = &usart1;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
