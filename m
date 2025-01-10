Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A848BA09494
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 16:02:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E37FC78F72;
	Fri, 10 Jan 2025 15:02:54 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2111.outbound.protection.outlook.com [40.107.21.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3566EC78F71
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 15:02:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urhT1hL7v45/3Sfp7pu/+MEFAlyjV0fYDAKRMaYZe1g9T3Y9l61fgUZ3nHfJMvp09OxTYue4EMhvirZ2cGNFzJAj/n2/HWfoTfgJSzyiGtK7T/MQ61zLtNf0JYTldv81KVz9RUt2pnW9gHul13IgsX9BLFVbeMIOrNG08dXmFsrVjIvAjZBlJ3AGoJjjmLN9/oCB4xx5qAg+Ul4yBdajT1lUMdQ0vLBVqutIy0bkKLnAH1Ve7zN0T7XSzw//36xoJrwLZyoMGyPmpo9EJufj88fEtWPU1doyudMxgFuvy+N0xOBC6EY8QavQuTWUf2EpX3B9HFmFmMnf0TEyhu/7Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJJsCn7XbwSE5AQqzr8bAU2q409fIgNXsdISJAquHp4=;
 b=OTX2SqoL1YGP1erKjzCVjBUWhr6/nNA85V4/cZRKR1dHYNmNKEPR83tC9iLaa4GA/DzgnlULhnFhPgtC5ur2b4vswqo6d5mXP9dFLlqXZH9APQ0wVqiZrQJy9+7BADaCmYHZtz0nzHV0Qs7+UT4aQv96EVJRAovvCRiWvcEmxXXD7Gl8fYiU2JEFcqhExrML70Sz3ZVUGeL1B5wMRvfyF2mDwSojob6oDODWcUFRxLTeXWeuoVwfCdEU0Lig4hLAEDyBKMQWY37bS9RuaGY4QGZbdafxmmnT0mN1rTbNBjAszKWIFXQzkv3Ig8yqveOhN6wi4JcJm5PNpt3hohcbgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=phytec.fr; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJJsCn7XbwSE5AQqzr8bAU2q409fIgNXsdISJAquHp4=;
 b=P1ocrpo40iq0VtTl46zraXcDlWePqbznlIlGVFDonIcr8Q4IJVNYzTD23NlQ5X3LmqTwOJ+XRpdYCiebQnx0qg0iRg+FchATGO6hinuL5yKnIXq3XEN14K2/tPXhyzoFk9vz5lt9+S5pBbo8fOCwCrfEgHgZfoy8s2U2bU+XFMY=
Received: from DU7P190CA0005.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::22)
 by DU0P195MB2301.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:425::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 15:02:49 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:550:cafe::e9) by DU7P190CA0005.outlook.office365.com
 (2603:10a6:10:550::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.12 via Frontend Transport; Fri,
 10 Jan 2025 15:02:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 15:02:49 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 10 Jan
 2025 16:02:19 +0100
Received: from Diagnostix.phytec.de (172.25.0.14) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 10 Jan
 2025 16:02:18 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 10 Jan 2025 16:02:18 +0100
Received: from pc.. ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025011016021881-31 ; Fri, 10 Jan 2025 16:02:18 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 10 Jan 2025 16:02:14 +0100
Message-ID: <20250110150216.309760-10-c.parant@phytec.fr>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8D:EE_|DU0P195MB2301:EE_
X-MS-Office365-Filtering-Correlation-Id: ff2bb278-cd5b-40a4-7412-08dd3187d968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZCYuUKcBhTlAqmmny6fYbNRrtHz0z4qwjhOrUsnYy8jMl3JCaMEG7eDO83DH?=
 =?us-ascii?Q?0FdssGw6JInEnZtkEemprIwUvbp7ZacIvxvXG/tM79WJDcOING1XuvGfBAWA?=
 =?us-ascii?Q?imwwhnwstPvixY2zS0zFHonrOM//bRL5ieOePJ4Q7QTWVj1kQQ+lCBowbV+E?=
 =?us-ascii?Q?C2KoXJgt3fOhZgfIRJConxRUtCGNRKjIvn2adkvwjgKLM6JUXxWVW2izf46p?=
 =?us-ascii?Q?dszpU5sIxPCiVLOaRzmL+UG0FnklNY0LfCY5V0vNDoMNjc+JrzrAS1uqc6kD?=
 =?us-ascii?Q?ktPy7ofMpqxtgZmFh4KP6KzP07CvjgNWKtQtUS4zN+24FXmpcCPfjExG2G+x?=
 =?us-ascii?Q?cF6uy09GctyfndwZ5oYkIe5qegGNKyrsSDOp4xeioqnyCJH4L226CVSERGZC?=
 =?us-ascii?Q?6i+0Y5K8ZX59cxrvh9W6o+qMzzWpe+xxcyS5m17HoqvguP8IfhXln74ZItIs?=
 =?us-ascii?Q?mcnLDID2WqhfzVRM+x3Xo8G40cam4dL/xJAlIHzTaTesm6GbhouTrq+av0Qr?=
 =?us-ascii?Q?XSe3Kby0Xd/uTwA75S0ROhWdqaFcZ33lrP//K082HwZGpHn4b+6dhbKg0+6r?=
 =?us-ascii?Q?RZhwe7Iv3ogIwCBDjLEeDnPL88zb5Zg3PrG4sXI9YUaRyAMarM1+eU8OrP+i?=
 =?us-ascii?Q?KZh1afB4XLPJ8NdxZbwoPTUw2IdW6ePGT+uOJp711h7kgPLM8BUCMNb6ux5y?=
 =?us-ascii?Q?60V4WtWNS3f3R4Y09kkKXzxg8MVGJWpb0ooCT5RtPKqS3/ArjQ6i4wm61x/l?=
 =?us-ascii?Q?h1u54S4TaZGZRFR3fFwKX/95Ja8SxlfAfXf2IBt1dwC9l5nC2sYYoUYv4mYI?=
 =?us-ascii?Q?aER3q/d05w39b83DqDTtyZS44ZrfVaS0tnOhxqlBFEYpdQBwd/38/1BCbUxN?=
 =?us-ascii?Q?+XBox9jmm5fahfG6ZgG+eZdNpkUlHZLL7YtQpxWlNp85ulcmEGWXajoju2JC?=
 =?us-ascii?Q?UHHNekK67Mb3+MGy9FMo2N8lwgk4Vl9Buk8PcQ8Q7+s/VLDQCGtHJVKidH+U?=
 =?us-ascii?Q?IQuVolJFgp8tTXaVyOpaCnXt69XNwlQ/NaH+F69ZkDCSQJBuoi0hLs2ktruo?=
 =?us-ascii?Q?/N2FgqOh6jf3N1P6xy9+i3T5xW3DvI4HX1Sztjrjfmp2vCaXA+99xMXVGvOy?=
 =?us-ascii?Q?GJeBUvUbViY0Zy7ykcDG5cc+F6mP828p8rdVDIG6vuY5X9rtSSYyR2RtMEDr?=
 =?us-ascii?Q?BTs8okuv+wBvw36kect9WApt2QCHtFv5Yndbx+gOlgd831+xAzEG1WD2ulAb?=
 =?us-ascii?Q?jV9L8RBhKBGOhnEz6SwwpN1z3JVY9aUa7BDi97stMAhzufX9ZcBEoA6FGj14?=
 =?us-ascii?Q?gviPVFIyofX/F/l2ozcbZg445jBtd0zC8Sn3jdpqtzrt7kom8YgCulTlNF21?=
 =?us-ascii?Q?jQZqWyG16xkrcRN7ZoTXEVJi/bxOBYvV5isyqEizp8blnPt8d2qnc/7Q+1ER?=
 =?us-ascii?Q?xWo/jEpMvBzVBC34QCNnGMx3QI6yeaTOCRYOf2sQQLjQPubFClIi+UTqE6Mi?=
 =?us-ascii?Q?a/DOFI8m/vWSeGk=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 15:02:49.3544 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2bb278-cd5b-40a4-7412-08dd3187d968
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB2301
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH 09/11] ARM: dts: stm32mp15: phycore: Disable
	optional SoM peripherals
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

Following peripherals are optional on phyCORE-STM32MP15x following
PHYTEC standard SoM variants: external RTC, EEPROM, SPI NOR.
Also NAND (fmc) can be populated instead of eMMC (sdmmc2).

So disable those peripherals on SoM dtsi file and enable them on board
dts file.
Additionally, enable by default the "DTS" SoC IP on common SoM dtsi file
as it is not an optional IP in STM32MP15x SoC.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts | 8 --------
 arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi        | 9 ++++++++-
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
index 462c89e68e2c..c9870f94ac1f 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
@@ -22,14 +22,6 @@ &cryp1 {
 	status = "okay";
 };
 
-&dts {
-	status = "okay";
-};
-
-&fmc {
-	status = "disabled";
-};
-
 &gpu {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
index 1dcd5e4249ee..9987acfc8727 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
@@ -265,11 +265,13 @@ i2c4_eeprom: eeprom@50 {
 		compatible = "microchip,24c32",
 			     "atmel,24c32";
 		reg = <0x50>;
+		status = "disabled";
 	};
 
 	i2c4_rtc: rtc@52 {
 		compatible = "microcrystal,rv3028";
 		reg = <0x52>;
+		status = "disabled";
 	};
 };
 
@@ -307,7 +309,7 @@ &qspi_bk1_sleep_pins_a
 				 &qspi_cs1_sleep_pins_a>;
 	reg = <0x58003000 0x1000>,
 		  <0x70000000 0x1000000>;
-	status = "okay";
+	status = "disabled";
 
 	flash0: flash@0 {
 		compatible = "winbond,w25q128", "jedec,spi-nor";
@@ -328,6 +330,10 @@ &rtc {
 	status = "okay";
 };
 
+&dts {
+	status = "okay";
+};
+
 &sdmmc2 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_e>;
@@ -341,4 +347,5 @@ &sdmmc2 {
 	vmmc-supply = <&v3v3>;
 	vqmmc-supply = <&v3v3>;
 	mmc-ddr-3_3v;
+	status = "disabled";
 };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
