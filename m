Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB977A2C598
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Feb 2025 15:36:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F18DC78F8C;
	Fri,  7 Feb 2025 14:36:04 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2091.outbound.protection.outlook.com [40.107.22.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2DF0C78F8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Feb 2025 14:36:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUkcA9c4QLqRyxwq5vIgl0G2lUXfDv1SSjQTAdjq7GNK2t0qosWn3kqOkSXQHvCQAKu+Z2bK4hRPZ6TuX8yn4jDi4vm4OXxv2fbdUlqQw1MA+eOWnPd57gNFtqZYV+DqO0ynAp/1iJJxFx2IKbPLKXy11iOiTz3FKZCpzA8FfqJIZcmVKJmIDfL8E7J2flQ1mJ0lzFSs+dp/aM49hLVt4Vwe+vFojfPnipHe/ouO8/+l8++Vhd7woFPo5T76O1mUtPNvhvYv66F93SE6Hw0YnYyk1in6PJSb1jh+2Jq99Al+yYN6UkSUSC/VJDgrFD6wObc/OajRBPRVLv6BYqlR9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yd3dTLedqb5GA2DtXcI0Oi5n0dqfuJJDV7nWzFjTFlI=;
 b=HFMuCpuvQioGVLNDzkTRzCwuaESMPnbNyOtGBS5HzgdZymWxv2ebXQVWmchX2A2PzCosG1iUaQLORGGI+zaMo0kTZlF/3wfNYCJz/6jU6rdOVZ4ujCEMaJ/mtG/bawGfQq+6S4L0I2A0p/wIDRUH7Ie0Of9rjWo89MO8dCX6UYLQ/jDc2Fr2LJ7m37Pop35XW2B2n1y57sfv6wijYaIqly0js4mK6YhQL4jPOrM769BU9oZo/G0Oxm0gofeESx3X/KnEw9t6HtWK86OwC5cEoZlIUFFC4/TuzDUNu8/Bevg3WvhieDVdsLRNlEOPiLte+ujbelE7GhO6vE6G/UVwZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=phytec.fr; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.fr; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yd3dTLedqb5GA2DtXcI0Oi5n0dqfuJJDV7nWzFjTFlI=;
 b=ks2ldxbRpktbV8gZJ5dO6TX4x0TkB7pP0m7pzweHE1y2JbBWIYxhXx7PjAFgBaTTWxEcQOXXwsMqK7VJ2nSxExcbjM7UfcKK9fCwMsqJhOwKDHfPVE8lz0JXQLiPmZ6LGawfdwni1baE/fDdHohgv/dv7gWmbw1MiOTNRowaA84=
Received: from DB6PR0301CA0068.eurprd03.prod.outlook.com (2603:10a6:6:30::15)
 by GVXP195MB1759.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 14:36:01 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:6:30:cafe::ee) by DB6PR0301CA0068.outlook.office365.com
 (2603:10a6:6:30::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.30 via Frontend Transport; Fri,
 7 Feb 2025 14:36:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 14:36:01 +0000
Received: from Diagnostix.phytec.de (172.25.0.14) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 7 Feb
 2025 15:35:53 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 7 Feb 2025 15:35:53 +0100
Received: from pc.. ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025020715355319-66 ; Fri, 7 Feb 2025 15:35:53 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 7 Feb 2025 15:35:48 +0100
Message-ID: <20250207143550.432541-10-c.parant@phytec.fr>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C6:EE_|GVXP195MB1759:EE_
X-MS-Office365-Filtering-Correlation-Id: f16411a1-09d6-49e0-0f88-08dd4784be65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LAXKo7pGc5ee8KXTEVhqC8RVF9xu+EiAzEFEtvgaObeAJMvGIWJ5xI806JsB?=
 =?us-ascii?Q?fGc1ANkH/uHMS1nnIDnJf49Qkf5HfRi9Jtj2aSkn09CWdJq+uqXEODoP4Z0I?=
 =?us-ascii?Q?La+ICKeFbE4ou7+0c3aulpnKy/n5dbKW5yF/OB2n86m50iWuJw6pezUf56MT?=
 =?us-ascii?Q?7V9O+cO1b9IUPqZkaoo3G+5KWi4vdBdvRJEkf1eI8nVQVTCUmB3ezPicBEwe?=
 =?us-ascii?Q?CXyQocy0QhKezm5GbOrZazdEofwTjzkPUVC2TfsmfqAz5USCl+fTM2sl3nDF?=
 =?us-ascii?Q?um+2BKxlIKMJ5UnkrFMYohy8JLo7DjJKYGx8R9dJpjRzFUTzHlTeV/qz4Lx4?=
 =?us-ascii?Q?KVYVIB1/1dJ4Ue/lOJxArPO6HoBoIr6bcgRzy7Ojf48QzuEK9kGawSH13EKm?=
 =?us-ascii?Q?wFBKHQ/By2/JOo0zZPn49AAexN5Gl0Pi1zCbVQs4BaGS+h2/+FayItat8q0r?=
 =?us-ascii?Q?9XFZsbgdfdjITpQhWb2D885YziTCdq9xLDsfjBgNeMKFdNGUggb8sJPWxnQC?=
 =?us-ascii?Q?NwUQACI1xwVnaeM/5HlYvOKoIhj8PD6CYr0zwMCXvv7GSFmfcOCKmjNP/R9f?=
 =?us-ascii?Q?kRv+NDToiksf7fCaJz1m2RFC7FMyjvEz+B/SJHuT3wHc5XHthZ8IdvmkQRWT?=
 =?us-ascii?Q?fTYQT6tyskWMZKNAzeNrCHm06ldki4rlpXKjl5DljxQh9sckpg4e/eKKfUW5?=
 =?us-ascii?Q?AutQGCqDJ5WihXVxh/Q1FI3BBv01UoFzEcYLZdHaBxDOB5VmRSkJSrurrI0c?=
 =?us-ascii?Q?ioNwbVGFn6wdVmgjHXJFIuG0o4oylHmRxO8OcKSD2mk27vKahl1keIS0YF6B?=
 =?us-ascii?Q?deJ7GPsyIZABzt7IIl6idmosVPmy8Lwgu7DMywGa7tZywPPmS3rP9HyEkXmO?=
 =?us-ascii?Q?xv/vqpJ2I0R4/VhdRQDXDk/et/dpDXvs59l0IwnAOeyDAKMXNixhJXJF/O8F?=
 =?us-ascii?Q?c6VLrr68eQDM9jDB0DUFd2kgQhP4m5RCa+4hICSzlxCx5fUGFis8tvZ2y/7m?=
 =?us-ascii?Q?LvRZ05ugDvCm4reaQjCdup05bKIxcbqKr4mSKIpo+E9/NKIij+ofi8QCNX/+?=
 =?us-ascii?Q?ghYoDBa/TsG8zwwhOaPf947l0tY482ydRIr0sGCIOwKnA3fbpwdlQwbRE6DX?=
 =?us-ascii?Q?hSR8xatEh+5jGm2HTGPDJP9cuElN46DtCQvXqiFIRahiOUjElsJDqA9vcxBC?=
 =?us-ascii?Q?fCYov5fWWoYlPVYxPIokQ6G8RpUCAYoMhGFUNjP3lPc0bDHb9bnmGaiC5U+J?=
 =?us-ascii?Q?G5coaq9aogrRUoYFPmr5GKvmzNJu5Pqanl7LKfpTCh5lRXVmyjuxDHzN/TjR?=
 =?us-ascii?Q?h3/Vgp07oMXzTeOk3m4jSciLrpK9iTcZ2empggcNppkkNFZRO/GzLJhdZIkl?=
 =?us-ascii?Q?UzMMhmNGn30AhJSO/JlNGIwN6QN6666nnbiWmalEobqdWQ4wbiFRjHRdmC2X?=
 =?us-ascii?Q?CVF3DaOQ011WtqDxymhjj9X1f1s9jOCtTesm+kRcCKSk1iqPktEoGqCuOZ03?=
 =?us-ascii?Q?Dx6RbAO2fHcjz/Y=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 14:36:01.1246 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f16411a1-09d6-49e0-0f88-08dd4784be65
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP195MB1759
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH v2 09/11] ARM: dts: stm32mp15: phycore:
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
