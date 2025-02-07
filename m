Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FF5A2C59E
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Feb 2025 15:36:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6A06C78F8E;
	Fri,  7 Feb 2025 14:36:09 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2122.outbound.protection.outlook.com [40.107.22.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F92CC78F8C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Feb 2025 14:36:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkhWk50a6tjCwEVVRx3v777cEZIat+du5dGFb+0M28DlicyvwN1+kYpDCz3nbF4OFdPde4i4R/NQR16mLGGjr1vsIDfZj9bJnTs89fHCV2IUUQfLYTq3M9py1aaZcLzL+NMKrypu4yDOVdxTfmwWS9qDwGzvF5q6i4boETU+9U3erVa1D6DBa+FJ8eu+Ezx5Rt1CYIvVJFYiWriuWc9+baaa7+KV4Dvs1WE7Xtd9ZvJMWt0+EWN30B0RmunAaRkrrHiu9FLt9/w7e5iTJDwfMKgA194OFx9/4r6XKemm3JhGvvttEMLF9O94QWPQib5DS4s7HSk4WbwFPk3zfsRXTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuYy5g7YS2QmKNtYFjVIt1GhvUO27qF+gJ7X/C6lnQw=;
 b=R1EXoG1xCKgYgv0VOB1MlNTzMcm7Z3seRkjLhQVHQL2K13V+fSM1brGjhsQp525kx4k0AUKm7AFsnaoCOuDFOHGGbn3RmPaudm3Z4Aa4cYtTEXVAT8COxHWu9jFK6QyBRu209aqQAfWKu99Qz3DaKdA3HBf6K4mAREcDUNHrZzbDxXY7wl0h2SBAzT4KktjDcPcYeVYbqPIt+78DXlakg2WRDq1tqG65CeEiJ+81dj4OlTfK9gpxwjykefDE+NlQVFZJZtAbBUGOCJvSNV//N5mbKth4zVWa3Th5OxlYVRsYQiquKlmibS+dc7DcWFCWHt76BbSNzc89PXukEf5qog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=phytec.fr; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.fr; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuYy5g7YS2QmKNtYFjVIt1GhvUO27qF+gJ7X/C6lnQw=;
 b=aGaUcai+Cazdh5A2DbTmj+AfSrZ3o/rkFYARZ0OHCR6J70mZl4DFAeQ1QUOL1REqVJGcX0vlD1HSFBhiLMQgQ3PF8MTPM4KJJarjcCl6aI4r1wqBynUQAYKrWGnBnEXhhuG2txCibGyrSG1Le5+rkp7LEy6sL+ziAgWYGGGNNZI=
Received: from DB6PR0301CA0080.eurprd03.prod.outlook.com (2603:10a6:6:30::27)
 by PRAP195MB1603.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:29b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 14:36:04 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:6:30:cafe::10) by DB6PR0301CA0080.outlook.office365.com
 (2603:10a6:6:30::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Fri,
 7 Feb 2025 14:36:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 14:36:04 +0000
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
 with ESMTP id 2025020715355338-67 ; Fri, 7 Feb 2025 15:35:53 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 7 Feb 2025 15:35:49 +0100
Message-ID: <20250207143550.432541-11-c.parant@phytec.fr>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C6:EE_|PRAP195MB1603:EE_
X-MS-Office365-Filtering-Correlation-Id: 1decf305-f145-472c-33cb-08dd4784c06f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cq+LgtgYa3oQSaiP0EieWtaSRi83nfuLd7KBf6qmbFxlKabzLn9vUaUh++j/?=
 =?us-ascii?Q?Zv3pFcgdq5H3v/bn1CGVC130g+Bf27FaJ43LoGcV57mpqv7Bj7BtkYkRXefR?=
 =?us-ascii?Q?bLqFHX/jyGAd7Sqi5/kNKS3hN4fll+fAh7LlxWzG94pytIH4dGp6EOyXHm+I?=
 =?us-ascii?Q?EfAt5GfOHNnIxtGPY4vCAJ2Gy/5jR+IqCi9a6IM3AexO4zjT8wFVNyiF8hzG?=
 =?us-ascii?Q?zkoVtAlEMt17MfH295TWyx6oD25lF8XY1Jrm5XKPT/TD3H8o0FqQAyDDvk80?=
 =?us-ascii?Q?ztbtvmuMqueVdUvmOcUgaJmMpu/icX0JBv1CqDJIxOh8hKX78ztgqGG5lOu3?=
 =?us-ascii?Q?MtIh9J0wPSOAqKOiUh7aQffKVGU/JmmPHX66GjBEYa6NY4kiExRd3x0Xo7mq?=
 =?us-ascii?Q?Po5AYJkG5dRGfeFaHXY6UlbmhL+7XuMIsW0wnWwYJBk16+iqWIbtC2juVnrC?=
 =?us-ascii?Q?tZT0JwdLEbXwQtxHU4eF7r6m2RqW/2dLVYrlQMx1/zvcMdSwSvQOrlXu0aN3?=
 =?us-ascii?Q?88dEyEnkalpjzVkfySnRL2vhbjm6rWnfElRVFBjboCsYnB0WdlfhfLmkK08K?=
 =?us-ascii?Q?Ad9NCZLKEZqgyGkB6R+213jYlA6WOqzB+c6v+rx2hUlOGhFwa3bX4QNRFOZW?=
 =?us-ascii?Q?IuF2GitRFA/n03qs5dWxelrlOdWMvSj0HvEg96HXT4Kclroc6uQ5s+zOPFyC?=
 =?us-ascii?Q?CBU9v55GfcPy21KBJHzHQlAn3xCuttJIo29jUka33QJn8Gk7rCUhg37M2dmC?=
 =?us-ascii?Q?B1zd/qcT1H1xMqTYkF/1myi5J44/G4I/n7Lc7QI3OukabM6kC1yNaZiIvXzH?=
 =?us-ascii?Q?eShnVeiADJRZ+cGKfcN78iKhAVvUrj7qf5JpFNLDfbYFPaMwRs4/kaRLTTHJ?=
 =?us-ascii?Q?Qtze2VRLRqKIZLYgv3k3W6Ge9CSNUeGZrkHdmJC617sE1AQ65jYYR5XHH9S3?=
 =?us-ascii?Q?IspdwAnTr1HQJTZfq3LWnX+ALqGKtwrClN47nmtfwk3B13Q3MRzDa46LMnR+?=
 =?us-ascii?Q?yYrOf6B1sgeUkbW6DeyTM+YpdAJpWyox+aOYwCq/HgKdlAZfbU7GYqQFFU0W?=
 =?us-ascii?Q?b0bfBbGIi2Nxri8tP+DFJ4XpvmglFh7V/4D3I3ClkSX3ri2vhSL3qNQeHm8Z?=
 =?us-ascii?Q?cpszwEy6mssBHssvTDdKVY+JobGUR8eRBiZsMUuDO1PatMH9oN4SAzVzciAb?=
 =?us-ascii?Q?+bXsDNenbI9yk6BwScuA8zcDJENEscOaJpl3A1ZbMbn4J+hfHh7b7Cgfkh3n?=
 =?us-ascii?Q?ue5/f0WVKJGYoc41CP1k+ELGyERpgYfBr6oie4hZssi5yCb8bmtw/YtNvb8+?=
 =?us-ascii?Q?AoF/o4kRXcvxCutkVeCPANtZQc7X1+SfCPvNhlndY8n3sBbScCgSVAkrk/Hr?=
 =?us-ascii?Q?Vh/bu6QnmR1jlZPgQRNJ6oQG46KIJOhptdTjSu/5NNi09i81LurpAFjbWkmN?=
 =?us-ascii?Q?fKrHn+1dTvm//KVhGdCPlXt0HXVPq2ZfWeIBrFG2DA9YTUJzCWll7ZE/5WI0?=
 =?us-ascii?Q?TUQR1zxlH3PcooY=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 14:36:04.5621 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1decf305-f145-472c-33cb-08dd4784c06f
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP195MB1603
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH v2 10/11] ARM: dts: stm32mp15: phycore and
	phyboard: Fix coding style issues
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

- remove "stm32-pinfunc.h" include as it is already include in
"stm32mp15-pinctrl.dtsi" file.
- reserved-memory: reorder the memory sections (lower to higher
  addresses).
- move vendor properties (go last).
- remove useless compatible values:
  - QSPI flash: remove the winbond compatible. jedec is enought as the
    NOR flahses are detectable.
  - EEPROM: "atmel,24c32" is enought.
- Use uppercase for regulator-name properties.
- In pmic node: use the names from the PHYTEC SoM schematics.
- stmpe811 touch: fix dts schema to comply with st,stmpe.yaml.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 .../st/stm32mp157c-phyboard-sargas-rdk.dts    |  1 -
 .../dts/st/stm32mp15xx-phyboard-sargas.dtsi   | 12 ++--
 .../boot/dts/st/stm32mp15xx-phycore-som.dtsi  | 64 +++++++++----------
 3 files changed, 36 insertions(+), 41 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
index c9870f94ac1f..9a6270e68c6c 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
@@ -6,7 +6,6 @@
 
 /dts-v1/;
 
-#include <dt-bindings/pinctrl/stm32-pinfunc.h>
 #include "stm32mp157.dtsi"
 #include "stm32mp15xc.dtsi"
 #include "stm32mp15xx-phycore-som.dtsi"
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
index 3d62f9e4d0cd..d55a838683c1 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
@@ -101,13 +101,13 @@ touch@44 {
 		interrupt-parent = <&gpioi>;
 		vio-supply = <&v3v3>;
 		vcc-supply = <&v3v3>;
+		st,sample-time = <4>;
+		st,mod-12b = <1>;
+		st,ref-sel = <0>;
+		st,adc-freq = <1>;
 
 		touchscreen {
 			compatible = "st,stmpe-ts";
-			st,sample-time = <4>;
-			st,mod-12b = <1>;
-			st,ref-sel = <0>;
-			st,adc-freq = <1>;
 			st,ave-ctrl = <1>;
 			st,touch-det-delay = <2>;
 			st,settling = <2>;
@@ -159,10 +159,10 @@ &sai2 {
 
 &sai2a {
 	dma-names = "rx";
-	st,sync = <&sai2b 2>;
 	clocks = <&rcc SAI2_K>, <&sai2b>;
 	clock-names = "sai_ck", "MCLK";
 	#clock-cells = <0>;
+	st,sync = <&sai2b 2>;
 
 	sai2a_port: port {
 		sai2a_endpoint: endpoint {
@@ -195,9 +195,9 @@ &sdmmc1 {
 	pinctrl-2 = <&sdmmc1_b4_sleep_pins_b>;
 	cd-gpios = <&gpiof 3 GPIO_ACTIVE_LOW>;
 	disable-wp;
-	st,neg-edge;
 	bus-width = <4>;
 	vmmc-supply = <&v3v3>;
+	st,neg-edge;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
index 3f60f184978c..0689967b8c56 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
@@ -36,18 +36,6 @@ reserved-memory {
 		#size-cells = <1>;
 		ranges;
 
-		retram: retram@38000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x38000000 0x10000>;
-			no-map;
-		};
-
-		mcuram: mcuram@30000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x30000000 0x40000>;
-			no-map;
-		};
-
 		mcuram2: mcuram2@10000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x10000000 0x40000>;
@@ -71,11 +59,22 @@ vdev0buffer: vdev0buffer@10042000 {
 			reg = <0x10042000 0x4000>;
 			no-map;
 		};
+		mcuram: mcuram@30000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x30000000 0x40000>;
+			no-map;
+		};
+
+		retram: retram@38000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x38000000 0x10000>;
+			no-map;
+		};
 	};
 
 	regulator_vin: regulator {
 		compatible = "regulator-fixed";
-		regulator-name = "vin";
+		regulator-name = "VIN";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
@@ -102,11 +101,11 @@ phy0: ethernet-phy@1 {
 			reg = <1>;
 			interrupt-parent = <&gpiog>;
 			interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+			enet-phy-lane-no-swap;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
 			ti,min-output-impedance;
-			enet-phy-lane-no-swap;
 			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 		};
 	};
@@ -144,7 +143,7 @@ regulators {
 			pwr_sw2-supply = <&bst_out>;
 
 			vddcore: buck1 {
-				regulator-name = "vddcore";
+				regulator-name = "VDD_CORE";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1350000>;
 				regulator-always-on;
@@ -152,7 +151,7 @@ vddcore: buck1 {
 			};
 
 			vdd_ddr: buck2 {
-				regulator-name = "vdd_ddr";
+				regulator-name = "VDD_DDR";
 				regulator-min-microvolt = <1350000>;
 				regulator-max-microvolt = <1350000>;
 				regulator-always-on;
@@ -160,7 +159,7 @@ vdd_ddr: buck2 {
 			};
 
 			vdd: buck3 {
-				regulator-name = "vdd";
+				regulator-name = "VDD";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
@@ -169,7 +168,7 @@ vdd: buck3 {
 			};
 
 			v3v3: buck4 {
-				regulator-name = "v3v3";
+				regulator-name = "VDD_BUCK4";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
@@ -177,7 +176,7 @@ v3v3: buck4 {
 			};
 
 			v1v8_audio: ldo1 {
-				regulator-name = "v1v8_audio";
+				regulator-name = "VDD_LDO1";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
@@ -186,7 +185,7 @@ v1v8_audio: ldo1 {
 			};
 
 			vdd_eth_2v5: ldo2 {
-				regulator-name = "dd_eth_2v5";
+				regulator-name = "VDD_ETH_2V5";
 				regulator-min-microvolt = <2500000>;
 				regulator-max-microvolt = <2500000>;
 				regulator-always-on;
@@ -195,7 +194,7 @@ vdd_eth_2v5: ldo2 {
 			};
 
 			vtt_ddr: ldo3 {
-				regulator-name = "vtt_ddr";
+				regulator-name = "VTT_DDR";
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <750000>;
 				regulator-always-on;
@@ -203,12 +202,12 @@ vtt_ddr: ldo3 {
 			};
 
 			vdd_usb: ldo4 {
-				regulator-name = "vdd_usb";
+				regulator-name = "VDD_USB";
 				interrupts = <IT_CURLIM_LDO4 0>;
 			};
 
 			vdda: ldo5 {
-				regulator-name = "vdda";
+				regulator-name = "VDDA";
 				regulator-min-microvolt = <2900000>;
 				regulator-max-microvolt = <2900000>;
 				interrupts = <IT_CURLIM_LDO5 0>;
@@ -216,7 +215,7 @@ vdda: ldo5 {
 			};
 
 			vdd_eth_1v0: ldo6 {
-				regulator-name = "vdd_eth_1v0";
+				regulator-name = "VDD_ETH_1V0";
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
 				regulator-always-on;
@@ -225,23 +224,23 @@ vdd_eth_1v0: ldo6 {
 			};
 
 			vref_ddr: vref_ddr {
-				regulator-name = "vref_ddr";
+				regulator-name = "VDD_REFDDR";
 				regulator-always-on;
 			};
 
 			bst_out: boost {
-				regulator-name = "bst_out";
+				regulator-name = "BST_OUT";
 				interrupts = <IT_OCP_BOOST 0>;
 			};
 
 			vbus_otg: pwr_sw1 {
-				regulator-name = "vbus_otg";
+				regulator-name = "VBUS_OTG";
 				interrupts = <IT_OCP_OTG 0>;
 				regulator-active-discharge = <1>;
 			};
 
 			vbus_sw: pwr_sw2 {
-				regulator-name = "vbus_sw";
+				regulator-name = "VBUS_SW";
 				interrupts = <IT_OCP_SWOUT 0>;
 				regulator-active-discharge = <1>;
 			};
@@ -262,8 +261,7 @@ watchdog {
 	};
 
 	i2c4_eeprom: eeprom@50 {
-		compatible = "microchip,24c32",
-			     "atmel,24c32";
+		compatible = "atmel,24c32";
 		reg = <0x50>;
 		status = "disabled";
 	};
@@ -312,13 +310,11 @@ &qspi_bk1_sleep_pins_a
 	status = "disabled";
 
 	flash0: flash@0 {
-		compatible = "winbond,w25q128", "jedec,spi-nor";
+		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-rx-bus-width = <4>;
 		spi-max-frequency = <50000000>;
 		m25p,fast-read;
-		#address-cells = <1>;
-		#size-cells = <1>;
 	};
 };
 
@@ -342,10 +338,10 @@ &sdmmc2 {
 	non-removable;
 	no-sd;
 	no-sdio;
-	st,neg-edge;
 	bus-width = <8>;
 	vmmc-supply = <&v3v3>;
 	vqmmc-supply = <&v3v3>;
 	mmc-ddr-3_3v;
+	st,neg-edge;
 	status = "disabled";
 };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
