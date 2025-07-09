Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F280CAFED35
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 17:10:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8A05C3F92F;
	Wed,  9 Jul 2025 15:10:27 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2135.outbound.protection.outlook.com [40.107.241.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29288C36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 15:10:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d578wWT7cm3cRqwXFi36QSKSA42cFbJ7L4yq5ip5aenoDYao5y4KaftdSv5q9VPJIZnCb08kW1I1pijJx581H1zPxlJ50SaVtFCVecO/XlNscFiPi3LdxqQbG8QmHLI+SRIRBH7kjUZj6aAaBM0k223VzIajNwI/L0O7MD+bkqM4K5bkY9bn+x4EaOK3Jbp4ZF66o+pxkyR5vfMVJ4t0s7tC4zd7V3Un/EkA1y2VwbpqxKcfyjlJpkom/A3w9a2PqZtznPKGL2ZN3voJLv1vVk0c8FPkMu79xTTZOX4+CjShEMda+f2V1kOYGuvR+zUh6CAYnykFCvapRCDJD6R1kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5abZY0SB9KzkKudzsNwj4y7+tQ/rWq4t+Pl8mssI4lg=;
 b=vmybQfmkxkZXLfneqblvgehHxXolVEhXfotOD6ffdShAfA0kZu2tmyhulZrRFhp9Em3l1mujuwaGiz+QQ/GY4z4CFPeRTz62kbuzyorkAPTmSxS5D3NBM91Gw6KAKLUIlGg2n4CCGCknXp2vAEyd9GO0q5poGHJgOp6dGE6yF2nHc4C1BlMyhhi0YJyLEQcRHBDAFY+RXozJVNq3Jr9hWWxg9fOGUvmD7WcCmX0Orw9XpeBRbZOWvgqq6I8y28t1N9KlufCHrNNllZ2CRk+35wkODhfGg5bYWWinvEdh5l6aexiQ/f/dROgVeJ9W22YOFCYRbr0QrHdgE8GtttrX6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5abZY0SB9KzkKudzsNwj4y7+tQ/rWq4t+Pl8mssI4lg=;
 b=xYkVzA7oSYqP6T5bVOUQ5u9za5OKxpfMwkfTdFje8DKKQWqnu2cQo7D6/GZrhoIqAipewMmH2May4uMUz8B2x7QRUM/NIAsE+62wqG6fTbP/LTayPys26R2aEHM9HxCbOiDGx3wWYbLEpCWpvipgBQWYeImraU9/wT20kkMNvtQ=
Received: from DB7PR02CA0035.eurprd02.prod.outlook.com (2603:10a6:10:52::48)
 by DB4P195MB2018.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:386::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 15:10:21 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:52:cafe::80) by DB7PR02CA0035.outlook.office365.com
 (2603:10a6:10:52::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Wed,
 9 Jul 2025 15:10:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 9 Jul 2025 15:10:21 +0000
Received: from Diagnostix.phytec.de (172.25.0.14) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 9 Jul
 2025 17:10:15 +0200
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.57 via Frontend
 Transport; Wed, 9 Jul 2025 17:10:15 +0200
Received: from pc.home ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025070917101579-215 ; Wed, 9 Jul 2025 17:10:15 +0200 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 9 Jul 2025 17:10:09 +0200
Message-ID: <20250709151011.366537-10-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709151011.366537-1-c.parant@phytec.fr>
References: <20250709151011.366537-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 09.07.2025 17:10:15,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 09.07.2025 17:10:15
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509ED:EE_|DB4P195MB2018:EE_
X-MS-Office365-Filtering-Correlation-Id: 478bc73b-4b22-4000-a9cf-08ddbefab8fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xxab1yq6Y//CrGq0+X57Ix2l6SwgNYWp11tOcFsfLL+SZDinIxQiF16Bu1/g?=
 =?us-ascii?Q?UXNP5Q37fq2iW/COD3mMB6LF0YQwAQZ9ajqBSiQ7LI8mCylFFHuFftcFI5cm?=
 =?us-ascii?Q?kR7I4VZdCq8HemJX0Mq5zXm2EfZTDws9XnkeF8S0fEwl9xrpc7K51BCLaF1I?=
 =?us-ascii?Q?zKMGJSZJfKp8la+RtR2OnOLUHAndCl9ArdP65o7aE4Cbahwrk4Nplc+VzZrO?=
 =?us-ascii?Q?cN0eZO5IK+P8WDHj7CyqMuviNib6cJGUTlTcXS2/KN2aOGtsJOezZvkLZvAP?=
 =?us-ascii?Q?wEWgW70AxcO0uKwoUlEEG7ineC44IMNhKMcqMEgjiZdCKOPCG5KnkZGg1tPN?=
 =?us-ascii?Q?JRbM+V4rmTG9JXxir6hHexr1RP6hZnN7nw1BPiotB1kQsu+sxZb6RXI150rI?=
 =?us-ascii?Q?4SE0MPNS+AhdWgGbHYnc01XLqw8nzSSlB/TuwSj8VGE9PrGQIeH6X1Xup/fY?=
 =?us-ascii?Q?CPTs/bgyuK9FXVEfvbyGmKs/BV+Rj+En5FjapJehPpqlFFYJQcGPzzT+AcD0?=
 =?us-ascii?Q?L0PKK069uikaDGjQahmZhsdHTZVBVm4pY56s0IzmWd+mVBcYdOakpMwp2L/P?=
 =?us-ascii?Q?as0LLkUCUMCYUx+M6p20To/02q43CyV+2ASmdg8EfrfGo935wUCi6S8usVr8?=
 =?us-ascii?Q?UJbsDvM+4g7/3skQNXHLZoxqhhlLOKPbHb/qa0JphbI/7mTk7LoLhTDmKz7s?=
 =?us-ascii?Q?SLcFC2vSOOMw3m7Z+Kec1hj9Tvxk56uxIUjINJz+kRbH4I6k6/DxURf0zUY2?=
 =?us-ascii?Q?xdpBUtJ26QAYJCxJ2c+QR3V5ctPBQ90E1MgmDwymdu77IvUUKDfCLTOJg6m3?=
 =?us-ascii?Q?Pg3GjQBq1nf/8EhK7oZnuivPioFSx8WUj6smyWfwBAvoVf/VeN8qN0SxtEWn?=
 =?us-ascii?Q?ZIErmf+KFwAWRDsyMEnoz7NrWl8ZyZII5an/4u2OOoOw2tb0aUiWSVGJYKHO?=
 =?us-ascii?Q?b1gDPLyIvZOk7XxrOhFQpoUHHQTQrQZXQtXXrgBciExnQ2oUF3h02R+9MoY4?=
 =?us-ascii?Q?cA0LpW/LZoENzGydaf2Zw0kHM93yE+/+Bjl+BBCiuG9lFNQ4Cl66HM7PDNoG?=
 =?us-ascii?Q?6Xkh/sLT8WVR1fsekRzpEkbqP+WSkVN+QEl5g7dX0+SbyLb6ZGBFJ4BErf+L?=
 =?us-ascii?Q?9MQR2tQOfGlurnmvhqshDObw8i2rFay0ey1dc1bDESSfGy2X+3gLz6CieM24?=
 =?us-ascii?Q?YuAHWQ1SlHgn7orWBEA0LcLaOpCqKj6/+faWhutgrfmMCiiud3BQysC+Ux/j?=
 =?us-ascii?Q?aBlGVRz1/9VjDGk7VR2r6RdwQbQEOsNDjj4sRdz7M0gkatf8i3L1kUgels0m?=
 =?us-ascii?Q?eSU+MTYi21NfQpDgAWzkW/nwzn1rmGFM6t90b1d5F639RWgmxT25C6BNi2aZ?=
 =?us-ascii?Q?vtf7QJZk5xeVAmzkXYZTBBz0tui4cZZUm6NWz1nxngxMBQU5FVBbYX9OAJk6?=
 =?us-ascii?Q?ezuW2OYhd7IKw7pbMOZLN42U6QGQp3kTLFm8I5HP/L8UZzC8msqjAAowY81E?=
 =?us-ascii?Q?9wVsiRP7ceZOrX5k6fuOnxLXoTzbVj5fpwyc?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 15:10:21.0490 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 478bc73b-4b22-4000-a9cf-08ddbefab8fd
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P195MB2018
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [Linux-stm32] [PATCH v2 09/11] ARM: dts: stm32: phycore-stm32mp15:
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
index f7c02a381304..c90b12a479c9 100644
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
