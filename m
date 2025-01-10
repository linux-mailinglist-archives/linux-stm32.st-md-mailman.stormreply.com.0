Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA23A09493
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 16:02:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FCDBC78F6F;
	Fri, 10 Jan 2025 15:02:54 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2127.outbound.protection.outlook.com [40.107.21.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6F7CC78F71
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 15:02:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qIcJaUUMAvn9jktwLr5uwMUkIwsd5nA7hvxDls64TTsBkIdMGWUtJyNSxpu4QTNcNjklL9w4N1U013AGLwOFyP+d9iHgD6cSEByrKjQSqKX6UvlEvQ6HIXIJWXUNuWadWQr7K6blZ49vqwF8pElsMDL9MmnXWAsS2upWH0Un7dh4wX4M0et3z62lEoeVKccmc0nvXElgbEHu6Dfk2G67ypRXHtXreMUwFbbVbzta2I3SX/1DV0dv5+3A1lDJvkOXL7m9/NqUzatMUQxELUbL7dhrVIDgASm/KjHHHw0eY2RqTdTrfTeGI2aH6OzdsbbI4VEutKfeNnz9geZr+WKZ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCwjYInHoyqUPunp5vf0uOsTeR4hjgjO+zFF0AkFeBo=;
 b=sLaU7qThX+k4BhNzwlZQOE9H3btzMv1LFxvPL6sbMwi0y7hVtF52DU3ZF+3oxgdmR0qJ3QfP/rZSj0CxJlljcBP74c3qPwADQbpGX2o8LtwruR69Dh6smIUCbHSJN6M5VhOf6MKbwS2qTK97KcX4mb8cPQH56dzoMRiw/XhS9nr+AviayDcEtrB+Rx8K20o1qSv+0FaE2QhFczJTOT+DoXcbwVRvvF+j4FMsB9sVZcRD1QsCaHPeWEanzK3Sihdl126TC6tBNv7aY+RrEHNdxmaMeZ6QnnBvAmqYKUYV8NqatYGwBZnzPZYqzB3lpDRoFt2Z9GkvAgpXCyzQ3GWJ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=phytec.fr; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCwjYInHoyqUPunp5vf0uOsTeR4hjgjO+zFF0AkFeBo=;
 b=cYFCmR6s++WeRhnBbZec5awAW75SngDXzNSE1s5EvIPrqX05teyRmcbrk5Eh688Eko1SkFHhyOjiTkZarRcDcL04q88puBXzrG+dhHN1xqakAF1pWBzHRTlNRXgV6mdd3iXQZhvctQZIh5yRztQPgWhxme49otRQ4oL2fjdp2FA=
Received: from DU7P190CA0003.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::16)
 by PAWP195MB2606.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:46a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 15:02:49 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:550:cafe::8b) by DU7P190CA0003.outlook.office365.com
 (2603:10a6:10:550::16) with Microsoft SMTP Server (version=TLS1_3,
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
 2025 16:02:19 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 10 Jan 2025 16:02:19 +0100
Received: from pc.. ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025011016021899-32 ; Fri, 10 Jan 2025 16:02:18 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 10 Jan 2025 16:02:15 +0100
Message-ID: <20250110150216.309760-11-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110150216.309760-1-c.parant@phytec.fr>
References: <20250110150216.309760-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 10.01.2025 16:02:19,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.01.2025 16:02:19
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8D:EE_|PAWP195MB2606:EE_
X-MS-Office365-Filtering-Correlation-Id: 536eb137-4e11-4275-4a30-08dd3187d99f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jZIu2pdHsQcbAt4CaHRQ3pw8hsVeFSFxnj4x1+WyqAb2yraVweGOASX6DwAO?=
 =?us-ascii?Q?YmRp+MKATtO9JyryrVgrlP2roILWoqSu+G/GCcrbeS2z1ul3/klU1A6eWfxC?=
 =?us-ascii?Q?BMHEe2BMSjkQeKVJY/ZJj0aV6ZTRJEyDb9gwpzVD7IMljqBBHmFcnDW3G0oj?=
 =?us-ascii?Q?Dwgqrspt1g59ETRP6KuzK/btcHN83P8dlwnL/4qKBYEqbd8hgiH5iY6MShv+?=
 =?us-ascii?Q?FCjq79xQDM5svPHxI+0U9lZmUMty0SQFk7SVD0uOvq4FlIBnkbUsvztDsBTT?=
 =?us-ascii?Q?hluNljmkLgRc+55EY1JOzgTr5kMYQBjzf6pSp9ynYIo8FZ6fzYelO4jqIopY?=
 =?us-ascii?Q?p0v5+zfS2R41h38/1rGuQPl13QrNfqHSkqqCMplN4zPhPC8iC6f841XGeBGd?=
 =?us-ascii?Q?Xx9msWYD7Z5HVEpbMe8sazQ0MR3jPkQLMOvl76fNqj7Q4l6O4d8TNXhgCTQU?=
 =?us-ascii?Q?9vz1L4QuGZe6AnHET72z9i0l5nNOSW4fSPayTyojpbON4RN2i6ddehGUPhJv?=
 =?us-ascii?Q?7ZhgMqltfnteZfcuCNBQGZlTYXJzuO5d/Llronn8EQiLNrh/J4E0P8Eq1+HJ?=
 =?us-ascii?Q?r50227IB1acVywiXu1aG2oLAd6zaUbznwK8OBOp5FyauLzkTZCkxh250S7Wa?=
 =?us-ascii?Q?L+uJkp9pMZYF5+/9HC4ThuK7itpxpvwJmiYD6JVAiA22lj7qm/2MB52HSwP6?=
 =?us-ascii?Q?doi4br1d7l6Py9hC1PpTAztjl4zuZz9/waeE3IFoNkbgsI2GvnPQFkz4Mhxy?=
 =?us-ascii?Q?lQriP0aRIXPKHoIdTNgZwtZaI9XN1YdPacCe+WrUIEdlTt4kqTQIBK3rUVov?=
 =?us-ascii?Q?wKLi6nnRgS3zGEO2+zRZorYRuIEhf5Q0e5Ct/nA5S/FdKkdbeWBgLqvrZNZw?=
 =?us-ascii?Q?NHJLYkkUGQ0FdIsXvbJGjXt2FrWU7sU7x7vRkTiwgTL7qEKlr24VN2JUzyQb?=
 =?us-ascii?Q?RfkYABU+vX8r9UdQsROuy/JIJfp1Yiy8kOOtu7J8lm/Qggqg8OOQcRuzYvoh?=
 =?us-ascii?Q?xjNm9I0QnmCwGKgtr1bm4MWcm96gtRMOFwVv/zHO/o+DFJV6S475O5zjPnQ4?=
 =?us-ascii?Q?aHe/N4pPyLJYclJrxA3e8ZnY0uSc8dwb2ZoQ5aNQ8c/d8H7J5wiNQcyXyfAb?=
 =?us-ascii?Q?AISM5aX8NQMzrgoH/inmVwxsiWS3iQwxbsQTozPdUSudpnYODk5YGASNGwGF?=
 =?us-ascii?Q?C6RxFRdLWAVYcdDgN+R7Gupnf4ClnGExh0ypUfe8+VdHVfOsiC0Ygjui26BC?=
 =?us-ascii?Q?zL+YxAylso9ckgWR9tu1khdgLAN5hScCycQX1H1lcA9Ow6xuXtBIdqrs8x/g?=
 =?us-ascii?Q?LodNSFPplZOJspN/bwdpv2LqXNOeOffaC1n1SM6lsBuWgAPJx4vM/pYZvSz7?=
 =?us-ascii?Q?AxWh5HFAqVbQ93SmcEFqybMcenjuOFzUqJFfYdLJhLu1PxQ6XPFYi0brGUVL?=
 =?us-ascii?Q?favbOcWNpMeU4yaKiLjWCeKIjVx4fJQY62LQt0QTO9WNo0xyONiM8SGG92LO?=
 =?us-ascii?Q?NDJUZoPA6/wxYEc=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 15:02:49.7294 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 536eb137-4e11-4275-4a30-08dd3187d99f
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP195MB2606
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH 10/11] ARM: dts: stm32mp15: phycore and
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

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 .../st/stm32mp157c-phyboard-sargas-rdk.dts    |  1 -
 .../dts/st/stm32mp15xx-phyboard-sargas.dtsi   |  4 +-
 .../boot/dts/st/stm32mp15xx-phycore-som.dtsi  | 64 +++++++++----------
 3 files changed, 32 insertions(+), 37 deletions(-)

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
index 3d62f9e4d0cd..44cf3b5577af 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
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
index 9987acfc8727..586c93733933 100644
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
