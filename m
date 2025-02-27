Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AECA4833F
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 16:40:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67C87C7A84B;
	Thu, 27 Feb 2025 15:40:46 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2129.outbound.protection.outlook.com [40.107.103.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1A08C7A849
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 15:40:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u82zp7cZmlT470sc2JqUStlc1BKb3gLsKH2XBAIwXzYckGrf132aQtMQszXc3TPr8pKjvwxblQbAao+8soAIj63lkyAt/1QWxPztsydeRjMO2awEtq8Gx73S9ODja8HEzBJTvSDwMYnbvU2uDMEgeydV0YMTIr14ymwQpwwxtJmDyBGCWrLYGwraPBKZGSKWNxdB+792zx8G0dJXADPLqJ5YjhBhdAq9B/ZC5e3QUqWEDsbYGRqkGhWKlmMJNrgi0SVo9A/m7oC9xDl2KQ3vSjcLawZaDuKErqOAreWPQ7oQUkgjdRvhWGfyLzQViq5k/+EPPBcsI9E6fB9VhINrqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yd3dTLedqb5GA2DtXcI0Oi5n0dqfuJJDV7nWzFjTFlI=;
 b=ynpOrUq4s57XOl/YzobbUnV0RUvrJfmHAaAXMPpnFyzfxOcz5Ll5KRAWd+PulTu9wU7jysmJYNZ0UAXAOeFcjpCrovE9+3Aoc0lUF+DOmI/LGaMx+BDHZLCuf/iDeFnJKrI/lzCnafYNct5ZXIgh2SqfPU05wu7Gdu63EuvTY4gceGPQ5SwcTJ6fEih2h1i+tht4xeT8RmH7daR9x7gKr3WsYJfYSwlWrb8qXvw/+dIWOeDOyr5NweYkuagnDScKgc/eRbcDZ0qLlC7xAmnCQHqOV2S84JKvluwh+er+yPmv9RDIKgTgynMWHH4Hx8HSk9AzmohKSQQxS0ORRe4fbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yd3dTLedqb5GA2DtXcI0Oi5n0dqfuJJDV7nWzFjTFlI=;
 b=gWhZl5WnF1JEHiYJATzHxO72TqKwWxu7DZ2kprasFKdkNzwJ7UvZ30SnZybyvgLoQz8/82C4oCUFAaalHi4/82OwRXBRSmP4NaBm+7DnzaQPsg6/sPA2pMkFKS/njlJ/boIlJXCtJTdBibs3iCU+LKM7SKsbudhTcYbsoNGJJ0U=
Received: from AS9PR06CA0563.eurprd06.prod.outlook.com (2603:10a6:20b:485::28)
 by DBAP195MB1004.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:1c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 15:40:43 +0000
Received: from AM2PEPF0001C70C.eurprd05.prod.outlook.com
 (2603:10a6:20b:485:cafe::d9) by AS9PR06CA0563.outlook.office365.com
 (2603:10a6:20b:485::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.20 via Frontend Transport; Thu,
 27 Feb 2025 15:40:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AM2PEPF0001C70C.mail.protection.outlook.com (10.167.16.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 15:40:43 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 27 Feb
 2025 16:40:17 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.13) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 27 Feb 2025 16:40:17 +0100
Received: from localhost.localdomain ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025022716401750-92 ; Thu, 27 Feb 2025 16:40:17 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 27 Feb 2025 16:40:10 +0100
Message-ID: <20250227154012.259566-10-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227154012.259566-1-c.parant@phytec.fr>
References: <20250227154012.259566-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 27.02.2025 16:40:17,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 27.02.2025 16:40:17
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70C:EE_|DBAP195MB1004:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c4fca1c-88b8-495a-6490-08dd574518b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DAhC6+bC2tL1dW1E8kK3V5be50SU0lxwXall8m8yoa7S3GrHAy5x4mksAvhU?=
 =?us-ascii?Q?6h5oIFPRNcm5teoRqAgIfVjt0lvpgJedvXSPpR82Oa2JOwcSKaEGqLyVZMpo?=
 =?us-ascii?Q?jYeX7qtVwawxASB61dBG1e7ysMTLITqpyIPJXS71ecA+12ENBeQykGStHBsv?=
 =?us-ascii?Q?Dkz9CeViqjlX1V2IxNDZy4lQ60+XH/qqAP1s/Fh9R85rSm7dkAeeHhWbFOw1?=
 =?us-ascii?Q?uPvevX0Q6KUfHZLgy6s2f9MLYDVxTZTYjiT4JUtL9yWORmi7LaYzwHWuxUor?=
 =?us-ascii?Q?QhY19VYekjXEDwXWLMY/zxTjNZFCprAzp+fwdT9PKS7xsTHo+VGJIIzWyDnl?=
 =?us-ascii?Q?KtM+auMMElWPLmyZREwSlLSEUd9AsOR3wUYXTqIuw/SPIbXWSw+JZD57++2o?=
 =?us-ascii?Q?YrY/y+bfp6oLMWbZdok9uVguwnUqcBkaoVD5ItqMkHKbrhCbBZGhL53uNh8S?=
 =?us-ascii?Q?IA+wf5vWLm90zD5T5v+n+suf2vysu6W+y6eAJgGv0fQKzswJc76ljv7qtNOS?=
 =?us-ascii?Q?eCgTp4MppdjW4kaqdhVkNqqqt2tNBZnFQFX3EYQSI/dZH0CQWUYJyCYqSBzm?=
 =?us-ascii?Q?9oSKDLSrIo5zK6R1d+bGb9t3d7ty+fJ4NXDstH70M3pZNdy5QWBS143kA5su?=
 =?us-ascii?Q?mWVfkrdvnKYXerb/FM2sZ3C5IhtnPYNBOnv41274zN2jIqoZKPYTo6SLyVPy?=
 =?us-ascii?Q?fXqUmlURUqQilu2JXp2N/6F+GE6Cw6U2zkBt36nmzMJMAo57k/2GBW8vqB6J?=
 =?us-ascii?Q?DsRiRGL5IEGLF5EGnh2sYtGckCYcVUtlHgIzvn9/tpF6wAjmTgTImes136zA?=
 =?us-ascii?Q?MZfxWClIqXy+ijNfKw5/y86onrTl4laRVAYCAPypQKLx75E2KL0RLfkzP1uQ?=
 =?us-ascii?Q?5G6+g/OpWr7vk/Il0NBxZgT0yoo9hXOI/Ma1O9C2RVjLAlSA/Bvv9AKnvGS4?=
 =?us-ascii?Q?fxqba+zu9VIgaN+FOpbW0vRlAnu80lB1p1ZlldWUXyHIzkVDxGIGDOyuf8sw?=
 =?us-ascii?Q?coEFEzMJonY9XFKw9/d7EZIDg9mE672M11mEaXnwwJ0ctnrpOs3kxFmo6zrE?=
 =?us-ascii?Q?mqQknBCVMUO6+2dNBzWwYovMus0EshvfYBLodE2UkpDPJhAzzR7sLflWsJZw?=
 =?us-ascii?Q?o4jLW2mCldlQSmYVYFcpfqN6ZzaUc95UdD0yJ/8T678bql431JPHDNSA306n?=
 =?us-ascii?Q?dO0EknS/vWTmBV1TKCbtmLemiFw29wp8b7GgrZw+faVrzcqKaUcXvZwleNw6?=
 =?us-ascii?Q?8Ncp0qirtA7V9fh/JOoAwOouRjQCfa3MZUcG2n39u4IeAg5d/JFSzYrOJliM?=
 =?us-ascii?Q?T8/Y3CzE8I5UE6CtmP9A6OMgDvDCBH5aI09KEvRo88nPnKYVtwlTzIv5eigf?=
 =?us-ascii?Q?xUia+IWs+FLrabvTUbOio03TAjLFo4+rgv1gRoPFdW/D8wQw0xe6g4jPZoST?=
 =?us-ascii?Q?BBpQLNWBMj5FWlRROsecLq+9JB8MRecuZJJVw64cX30Ek7qEF3eOAbelCeKg?=
 =?us-ascii?Q?2qIZEZluVIjndkQ=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 15:40:43.4870 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4fca1c-88b8-495a-6490-08dd574518b2
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP195MB1004
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [Linux-stm32] [PATCH 09/11] ARM: dts: stm32: phycore-stm32mp15:
	Disable optional SoM peripherals
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
index ce859b94ae26..3f60f184978c 100644
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
