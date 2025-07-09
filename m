Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50135AFED2E
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 17:10:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F05FC36B3C;
	Wed,  9 Jul 2025 15:10:22 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2119.outbound.protection.outlook.com [40.107.241.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F9E8C36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 15:10:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmxKxho2lSBiiQqzNrcmgU1N32j3xCutirZBVgS6EnO5xZw9ZtxqgwDgviIhgb+Ziup5DXq5TMb/KEOErTsmnvs8liZ8aMRPD4+Bk8qe3YdGjxC/QhgXw39CRtJiwiqx/4WOPllcz9Taz+VB4Uq/pXIIy8/H4gV1XJFn/4ATfrfclmFRbtINdFwzmT/omm1pBKWk3DZkAbag13WoCmthjNnthQUYSCIxcTHhqL/HuGrVmQAu/FfAmpS3GysKOThSV93UVKLJ4V3eXAEqpdPzWS8CkRUrPYR1t2ypBFW8aQQBRlXSyxXfjv8ccffNvLe0eACGhTwe1g9yNQ8aJEOlow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYFZcgedsHbKEWgnA4wyqEy83wP02Zn/Bu9CLJkHjjw=;
 b=wZA2RDifY760bSNoYev8OkM1VHhc8RvcS9hCZ2rL/h/mT+8x7flNLWttmnoaMHMu94leielxK92UDjuUeRirI5TydwoXZu/DItSA+l1qeayv4RaZWRxNvw9byovQcskyKNDMD9+cT418bBsQqcPYQ7Xq3Onaugl7InLkp8HTzCn7evUBD221/2gB2XFCFi8MVjvy6WK6Ry/+XV9EUMndL5SP+v/YKRll1sa5FNxKgnubR3Srr3QaUPSezdyy1zchG5iWhoLwaB3VRhmYomG3dRzzM2D2yRo6t4eaiMHPnbHDi4kzkTW0OXZ3+H03nd5S584O4NrtSuJ9p+FpB7gl4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYFZcgedsHbKEWgnA4wyqEy83wP02Zn/Bu9CLJkHjjw=;
 b=ZfoP1crcOWL0NpQHuCTCh55h1jfUqSKOAfIlhwFlS6h79PjBw5rrwU5jPKGDAtx/a5IGjsD7bLGPSDvZGDfeHvnacbO7oPo8ZGhR7Z+7sS2JDWvy5Oz7rxoS4vayZ3JQ2BT0H/038Tl5rAGCAeXtqPjHtIUommgyiAsDM3bbDjo=
Received: from DB7PR02CA0024.eurprd02.prod.outlook.com (2603:10a6:10:52::37)
 by GV1P195MB2638.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:1f3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Wed, 9 Jul
 2025 15:10:14 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:52:cafe::46) by DB7PR02CA0024.outlook.office365.com
 (2603:10a6:10:52::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Wed,
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
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 9 Jul
 2025 17:10:12 +0200
Received: from Diagnostix.phytec.de (172.25.0.14) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 9 Jul
 2025 17:10:12 +0200
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.57 via Frontend
 Transport; Wed, 9 Jul 2025 17:10:12 +0200
Received: from pc.home ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025070917101244-208 ; Wed, 9 Jul 2025 17:10:12 +0200 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 9 Jul 2025 17:10:02 +0200
Message-ID: <20250709151011.366537-3-c.parant@phytec.fr>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509ED:EE_|GV1P195MB2638:EE_
X-MS-Office365-Filtering-Correlation-Id: f2223a7d-4a71-4634-b639-08ddbefab4b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/9rJKIaQ4aZPMgOi4troZAvoJUe9MsjcwKrK5PjT4qZbUrJQiOOibB+KuXsM?=
 =?us-ascii?Q?i716K7jnr3vXvBvk+NSKT9SoJwgoVgWYUaAek6yNpqpMxSKmtV7xr0cU4KEW?=
 =?us-ascii?Q?ARKpDO4TLWsY8YUIbHe6NnOSmAaQjF867FA0fFc8zvLcrz4faUg1KfXInGFv?=
 =?us-ascii?Q?dey89I0NFfxR/HaVeLedcoEpmW/xOZXzhuSeQ8c92JhGyMLZ/XcBBLtCZDOe?=
 =?us-ascii?Q?Tf7cfpPOjvgU1ILz5MJoVrn7uodqxHOpn1YWzBSj+/4gk1SJlIPYEjJoV1TS?=
 =?us-ascii?Q?e1lcwwv3whgyALqPQlWsTG0fD5+j4BJcnVXXQFioQTDo0eKRiS9rQz6tEjwI?=
 =?us-ascii?Q?vlPgwDfVyQMoWWZEXUfZhelY72hrPEkpeBS0R6ulzC2HEfjBjwmGT4mBh4AU?=
 =?us-ascii?Q?/uV9AQjARqjTmv+mMUVYRzRnFOJHwRX27zw01TxmlA0aQVAuEqRWc71eiQSs?=
 =?us-ascii?Q?TiiGkAeRG8wDIIJiOK47fCqbh8SDTBWfwIzAktNQHMU2gbP1Ps9bznFaX6z9?=
 =?us-ascii?Q?wXN+x5Un08HyQVHsxlZkbWWQ9ZlpNmD7DQsep4joXnqTiwVi7dF29YGEeLUT?=
 =?us-ascii?Q?sLgNggOwYVGFVsUhGmlD+9G/hSs3tWN7AZuMXHgn3LCxQWoi2ON0ZfMTwFoy?=
 =?us-ascii?Q?JDqZxHdHAkM8dTXv9MDDBCmsBd4FESoF8U6++BgGzN3dwwy9oD70umFgkF3x?=
 =?us-ascii?Q?Kos2Kk1AeuOKc/Vb+GrUccAwgfNMg6VyBPXSh37MyKx5Qf7cy768xK2nIC+X?=
 =?us-ascii?Q?zQBbP/Oi76utEGAx8k/f1jvashswecMRX/y8CVdi3RxVlugQ1pR2i6M1obed?=
 =?us-ascii?Q?MP3ojB5K2YMHi2nXFQ003uJ2jO8Ar2KF1H3cDhsTJSeTy6dflX7V991ffYnX?=
 =?us-ascii?Q?9qpFssqQle/74gRFaCnPMWC9fQDcghv51GUsS/dmzpMKC+DYAo15KDn6c2Ha?=
 =?us-ascii?Q?h6nsDhP0U/cSqMDGnZ2uJFCoJhKsNduaVR4a989y9X1n1HPmJf+rQ2ui42RH?=
 =?us-ascii?Q?oclMqKUXszqbBOObK+aTi3GltexX5O3ymhDFdr3VpPM8lZDiuueVxUrIUBPt?=
 =?us-ascii?Q?KlbEnhxKRxIC6EpCqqq9Xhcj4pr2rInAfHadUOkJtZqHw/AuH+MiM5r4TIYB?=
 =?us-ascii?Q?V4CYt++mMVcXtRiFt6YYzFjKFz209Ps0yf77slUDWVzBURiE8SxuGtUEh5G/?=
 =?us-ascii?Q?TUqUkJ0KIcbkFlwzbsoesUFFRgPxvmjzt4ypUmmkYNYW40PnfxxxfDgcsda0?=
 =?us-ascii?Q?Msq1/+UkJAokJQkBiDPeLJHJ//Si1nMPvHQjnC7lZgkgXTvAWDNrWGhGtQQa?=
 =?us-ascii?Q?xK58NCT4OL+wZu0AHJrZHy6qew/6LABpzLzHpH9s2jCSGYxniRAaDO0pY6hk?=
 =?us-ascii?Q?bB5tNftqKHGXx8W7K+X91ZDx8ZOzkG30to7ZhPaC4PONHzgZPthJgufplE+D?=
 =?us-ascii?Q?BzN5y4/pBZiPJDbl/HQXS2lyah0ZkDLrsfAp+sOWpY9GpEu8NcuehGHI8eu6?=
 =?us-ascii?Q?8fhbm4+UlspSqnGzV6ibExGABTEiEDGvTeKW?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 15:10:13.8691 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2223a7d-4a71-4634-b639-08ddbefab4b6
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P195MB2638
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [Linux-stm32] [PATCH v2 02/11] ARM: dts: stm32: phyboard-sargas:
	Introduce SoM device tree
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

Add stm32mp15xx-phycore-som.dtsi device tree file to split hardware
features between the phyBOARD (baseboard) and the phyCORE (SoM).

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 .../st/stm32mp157c-phyboard-sargas-rdk.dts    |   2 +-
 .../dts/st/stm32mp15xx-phyboard-sargas.dtsi   | 317 +----------------
 .../boot/dts/st/stm32mp15xx-phycore-som.dtsi  | 329 ++++++++++++++++++
 3 files changed, 331 insertions(+), 317 deletions(-)
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi

diff --git a/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
index 26995eb2a619..48adc3462958 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
@@ -9,7 +9,7 @@
 #include <dt-bindings/pinctrl/stm32-pinfunc.h>
 #include "stm32mp157.dtsi"
 #include "stm32mp15xc.dtsi"
-#include "stm32mp15xxac-pinctrl.dtsi"
+#include "stm32mp15xx-phycore-som.dtsi"
 #include "stm32mp15xx-phyboard-sargas.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
index ebbb82c09a1e..2fdab99fc562 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
@@ -5,23 +5,13 @@
  * Author: Dom VOVARD <dom.vovard@linrt.com>.
  */
 
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/input/input.h>
+
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/leds/leds-pca9532.h>
-#include <dt-bindings/mfd/st,stpmic1.h>
-#include <dt-bindings/net/ti-dp83867.h>
-#include "stm32mp15-pinctrl.dtsi"
 
 / {
-	aliases {
-		ethernet0 = &ethernet0;
-		rtc0 = &i2c4_rtc;
-		rtc1 = &rtc;
-	};
-
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -42,48 +32,6 @@ key-enter {
 		};
 	};
 
-	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
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
-		mcuram2: mcuram2@10000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x10000000 0x40000>;
-			no-map;
-		};
-
-		vdev0vring0: vdev0vring0@10040000 {
-			compatible = "shared-dma-pool";
-			reg = <0x10040000 0x1000>;
-			no-map;
-		};
-
-		vdev0vring1: vdev0vring1@10041000 {
-			compatible = "shared-dma-pool";
-			reg = <0x10041000 0x1000>;
-			no-map;
-		};
-
-		vdev0buffer: vdev0buffer@10042000 {
-			compatible = "shared-dma-pool";
-			reg = <0x10042000 0x4000>;
-			no-map;
-		};
-	};
-
 	sound {
 		compatible = "audio-graph-card";
 		label = "STM32MP1-PHYCORE";
@@ -93,44 +41,6 @@ sound {
 		dais = <&sai2b_port>,
 		       <&sai2a_port>;
 	};
-
-	regulator_vin: regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "vin";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		regulator-always-on;
-	};
-};
-
-&ethernet0 {
-	pinctrl-0 = <&ethernet0_rgmii_pins_d>;
-	pinctrl-1 = <&ethernet0_rgmii_sleep_pins_d>;
-	pinctrl-names = "default", "sleep";
-	phy-mode = "rgmii-id";
-	max-speed = <1000>;
-	phy-handle = <&phy0>;
-	st,eth-clk-sel;
-	status = "okay";
-
-	mdio {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "snps,dwmac-mdio";
-
-		phy0: ethernet-phy@1 {
-			compatible = "ethernet-phy-ieee802.3-c22";
-			reg = <1>;
-			interrupt-parent = <&gpiog>;
-			interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
-			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
-			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
-			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
-			ti,min-output-impedance;
-			enet-phy-lane-no-swap;
-			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
-		};
-	};
 };
 
 &i2c1 {
@@ -222,176 +132,6 @@ led-2 {
 	};
 };
 
-&i2c4 {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&i2c4_pins_a>;
-	pinctrl-1 = <&i2c4_sleep_pins_a>;
-	i2c-scl-rising-time-ns = <185>;
-	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
-
-	pmic@33 {
-		compatible = "st,stpmic1";
-		reg = <0x33>;
-		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-
-		regulators {
-			compatible = "st,stpmic1-regulators";
-			buck1-supply = <&regulator_vin>;
-			buck2-supply = <&regulator_vin>;
-			buck3-supply = <&regulator_vin>;
-			buck4-supply = <&regulator_vin>;
-			ldo1-supply = <&v3v3>;
-			ldo2-supply = <&v3v3>;
-			ldo3-supply = <&vdd_ddr>;
-			ldo4-supply = <&regulator_vin>;
-			ldo5-supply = <&v3v3>;
-			ldo6-supply = <&v3v3>;
-			boost-supply = <&regulator_vin>;
-			pwr_sw1-supply = <&bst_out>;
-			pwr_sw2-supply = <&bst_out>;
-
-			vddcore: buck1 {
-				regulator-name = "vddcore";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-always-on;
-				regulator-initial-mode = <0>;
-			};
-
-			vdd_ddr: buck2 {
-				regulator-name = "vdd_ddr";
-				regulator-min-microvolt = <1350000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-always-on;
-				regulator-initial-mode = <0>;
-			};
-
-			vdd: buck3 {
-				regulator-name = "vdd";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-always-on;
-				st,mask-reset;
-				regulator-initial-mode = <0>;
-			};
-
-			v3v3: buck4 {
-				regulator-name = "v3v3";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-always-on;
-				regulator-initial-mode = <0>;
-			};
-
-			v1v8_audio: ldo1 {
-				regulator-name = "v1v8_audio";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-always-on;
-				interrupts = <IT_CURLIM_LDO1 0>;
-
-			};
-
-			vdd_eth_2v5: ldo2 {
-				regulator-name = "dd_eth_2v5";
-				regulator-min-microvolt = <2500000>;
-				regulator-max-microvolt = <2500000>;
-				regulator-always-on;
-				interrupts = <IT_CURLIM_LDO2 0>;
-
-			};
-
-			vtt_ddr: ldo3 {
-				regulator-name = "vtt_ddr";
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <750000>;
-				regulator-always-on;
-				regulator-over-current-protection;
-			};
-
-			vdd_usb: ldo4 {
-				regulator-name = "vdd_usb";
-				interrupts = <IT_CURLIM_LDO4 0>;
-			};
-
-			vdda: ldo5 {
-				regulator-name = "vdda";
-				regulator-min-microvolt = <2900000>;
-				regulator-max-microvolt = <2900000>;
-				interrupts = <IT_CURLIM_LDO5 0>;
-				regulator-boot-on;
-			};
-
-			vdd_eth_1v0: ldo6 {
-				regulator-name = "vdd_eth_1v0";
-				regulator-min-microvolt = <1000000>;
-				regulator-max-microvolt = <1000000>;
-				regulator-always-on;
-				interrupts = <IT_CURLIM_LDO6 0>;
-
-			};
-
-			vref_ddr: vref_ddr {
-				regulator-name = "vref_ddr";
-				regulator-always-on;
-			};
-
-			bst_out: boost {
-				regulator-name = "bst_out";
-				interrupts = <IT_OCP_BOOST 0>;
-			};
-
-			vbus_otg: pwr_sw1 {
-				regulator-name = "vbus_otg";
-				interrupts = <IT_OCP_OTG 0>;
-				regulator-active-discharge = <1>;
-			};
-
-			vbus_sw: pwr_sw2 {
-				regulator-name = "vbus_sw";
-				interrupts = <IT_OCP_SWOUT 0>;
-				regulator-active-discharge = <1>;
-			};
-		};
-
-		onkey {
-			compatible = "st,stpmic1-onkey";
-			interrupts = <IT_PONKEY_F 0>,
-				     <IT_PONKEY_R 0>;
-			interrupt-names = "onkey-falling",
-					  "onkey-rising";
-			power-off-time-sec = <10>;
-		};
-
-		watchdog {
-			compatible = "st,stpmic1-wdt";
-		};
-	};
-
-	i2c4_eeprom: eeprom@50 {
-		compatible = "microchip,24c32",
-			     "atmel,24c32";
-		reg = <0x50>;
-	};
-
-	i2c4_rtc: rtc@52 {
-		compatible = "microcrystal,rv3028";
-		reg = <0x52>;
-	};
-};
-
-&ipcc {
-	status = "okay";
-};
-
-&iwdg2 {
-	timeout-sec = <32>;
-	status = "okay";
-};
-
 &m_can2 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&m_can2_pins_a>;
@@ -399,46 +139,6 @@ &m_can2 {
 	status = "okay";
 };
 
-&m4_rproc {
-	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
-			<&vdev0vring1>, <&vdev0buffer>;
-	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
-	mbox-names = "vq0", "vq1", "shutdown", "detach";
-	interrupt-parent = <&exti>;
-	interrupts = <68 1>;
-	status = "okay";
-};
-
-&pwr_regulators {
-	vdd-supply = <&vdd>;
-	vdd_3v3_usbfs-supply = <&vdd_usb>;
-};
-
-&qspi {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a>;
-	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a>;
-	status = "okay";
-
-	flash0: flash@0 {
-		compatible = "winbond,w25q128", "jedec,spi-nor";
-		reg = <0>;
-		spi-rx-bus-width = <4>;
-		spi-max-frequency = <50000000>;
-		m25p,fast-read;
-		#address-cells = <1>;
-		#size-cells = <1>;
-	};
-};
-
-&rng1 {
-	status = "okay";
-};
-
-&rtc {
-	status = "okay";
-};
-
 &sai2 {
 	clocks = <&rcc SAI2>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
 	clock-names = "pclk", "x8k", "x11k";
@@ -492,21 +192,6 @@ &sdmmc1 {
 	status = "okay";
 };
 
-&sdmmc2 {
-	pinctrl-names = "default", "opendrain", "sleep";
-	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_e>;
-	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_e>;
-	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_e>;
-	non-removable;
-	no-sd;
-	no-sdio;
-	st,neg-edge;
-	bus-width = <8>;
-	vmmc-supply = <&v3v3>;
-	vqmmc-supply = <&v3v3>;
-	mmc-ddr-3_3v;
-};
-
 &spi1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&spi1_pins_a>;
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
new file mode 100644
index 000000000000..660cdc260963
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
@@ -0,0 +1,329 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) Phytec GmbH 2019-2020 - All Rights Reserved
+ * Author: Dom VOVARD <dom.vovard@linrt.com>
+ * Copyright (C) 2022-2023 Steffen Trumtrar <kernel@pengutronix.de>
+ * Copyright (C) 2024 PHYTEC Messtechnik GmbH
+ * Author: Christophe Parant <c.parant@phytec.fr>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/mfd/st,stpmic1.h>
+#include <dt-bindings/net/ti-dp83867.h>
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxac-pinctrl.dtsi"
+
+/ {
+
+	aliases {
+		ethernet0 = &ethernet0;
+		rtc0 = &i2c4_rtc;
+		rtc1 = &rtc;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		retram: retram@38000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x38000000 0x10000>;
+			no-map;
+		};
+
+		mcuram: mcuram@30000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x30000000 0x40000>;
+			no-map;
+		};
+
+		mcuram2: mcuram2@10000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10000000 0x40000>;
+			no-map;
+		};
+
+		vdev0vring0: vdev0vring0@10040000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10040000 0x1000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@10041000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10041000 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@10042000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10042000 0x4000>;
+			no-map;
+		};
+	};
+
+	regulator_vin: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vin";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+};
+
+&ethernet0 {
+	pinctrl-0 = <&ethernet0_rgmii_pins_d>;
+	pinctrl-1 = <&ethernet0_rgmii_sleep_pins_d>;
+	pinctrl-names = "default", "sleep";
+	phy-mode = "rgmii-id";
+	max-speed = <1000>;
+	phy-handle = <&phy0>;
+	st,eth-clk-sel;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		phy0: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			interrupt-parent = <&gpiog>;
+			interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			ti,min-output-impedance;
+			enet-phy-lane-no-swap;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+		};
+	};
+};
+
+&i2c4 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c4_pins_a>;
+	pinctrl-1 = <&i2c4_sleep_pins_a>;
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	status = "okay";
+
+	pmic@33 {
+		compatible = "st,stpmic1";
+		reg = <0x33>;
+		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		regulators {
+			compatible = "st,stpmic1-regulators";
+			buck1-supply = <&regulator_vin>;
+			buck2-supply = <&regulator_vin>;
+			buck3-supply = <&regulator_vin>;
+			buck4-supply = <&regulator_vin>;
+			ldo1-supply = <&v3v3>;
+			ldo2-supply = <&v3v3>;
+			ldo3-supply = <&vdd_ddr>;
+			ldo4-supply = <&regulator_vin>;
+			ldo5-supply = <&v3v3>;
+			ldo6-supply = <&v3v3>;
+			boost-supply = <&regulator_vin>;
+			pwr_sw1-supply = <&bst_out>;
+			pwr_sw2-supply = <&bst_out>;
+
+			vddcore: buck1 {
+				regulator-name = "vddcore";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+				regulator-initial-mode = <0>;
+			};
+
+			vdd_ddr: buck2 {
+				regulator-name = "vdd_ddr";
+				regulator-min-microvolt = <1350000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+				regulator-initial-mode = <0>;
+			};
+
+			vdd: buck3 {
+				regulator-name = "vdd";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				st,mask-reset;
+				regulator-initial-mode = <0>;
+			};
+
+			v3v3: buck4 {
+				regulator-name = "v3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-initial-mode = <0>;
+			};
+
+			v1v8_audio: ldo1 {
+				regulator-name = "v1v8_audio";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				interrupts = <IT_CURLIM_LDO1 0>;
+
+			};
+
+			vdd_eth_2v5: ldo2 {
+				regulator-name = "dd_eth_2v5";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <2500000>;
+				regulator-always-on;
+				interrupts = <IT_CURLIM_LDO2 0>;
+
+			};
+
+			vtt_ddr: ldo3 {
+				regulator-name = "vtt_ddr";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <750000>;
+				regulator-always-on;
+				regulator-over-current-protection;
+			};
+
+			vdd_usb: ldo4 {
+				regulator-name = "vdd_usb";
+				interrupts = <IT_CURLIM_LDO4 0>;
+			};
+
+			vdda: ldo5 {
+				regulator-name = "vdda";
+				regulator-min-microvolt = <2900000>;
+				regulator-max-microvolt = <2900000>;
+				interrupts = <IT_CURLIM_LDO5 0>;
+				regulator-boot-on;
+			};
+
+			vdd_eth_1v0: ldo6 {
+				regulator-name = "vdd_eth_1v0";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-always-on;
+				interrupts = <IT_CURLIM_LDO6 0>;
+
+			};
+
+			vref_ddr: vref_ddr {
+				regulator-name = "vref_ddr";
+				regulator-always-on;
+			};
+
+			bst_out: boost {
+				regulator-name = "bst_out";
+				interrupts = <IT_OCP_BOOST 0>;
+			};
+
+			vbus_otg: pwr_sw1 {
+				regulator-name = "vbus_otg";
+				interrupts = <IT_OCP_OTG 0>;
+				regulator-active-discharge = <1>;
+			};
+
+			vbus_sw: pwr_sw2 {
+				regulator-name = "vbus_sw";
+				interrupts = <IT_OCP_SWOUT 0>;
+				regulator-active-discharge = <1>;
+			};
+		};
+
+		onkey {
+			compatible = "st,stpmic1-onkey";
+			interrupts = <IT_PONKEY_F 0>,
+				     <IT_PONKEY_R 0>;
+			interrupt-names = "onkey-falling",
+					  "onkey-rising";
+			power-off-time-sec = <10>;
+		};
+
+		watchdog {
+			compatible = "st,stpmic1-wdt";
+		};
+	};
+
+	i2c4_eeprom: eeprom@50 {
+		compatible = "microchip,24c32",
+			     "atmel,24c32";
+		reg = <0x50>;
+	};
+
+	i2c4_rtc: rtc@52 {
+		compatible = "microcrystal,rv3028";
+		reg = <0x52>;
+	};
+};
+
+&ipcc {
+	status = "okay";
+};
+
+&iwdg2 {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
+&m4_rproc {
+	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
+			<&vdev0vring1>, <&vdev0buffer>;
+	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
+	mbox-names = "vq0", "vq1", "shutdown", "detach";
+	interrupt-parent = <&exti>;
+	interrupts = <68 1>;
+	status = "okay";
+};
+
+&pwr_regulators {
+	vdd-supply = <&vdd>;
+	vdd_3v3_usbfs-supply = <&vdd_usb>;
+};
+
+&qspi {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a>;
+	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a>;
+	status = "okay";
+
+	flash0: flash@0 {
+		compatible = "winbond,w25q128", "jedec,spi-nor";
+		reg = <0>;
+		spi-rx-bus-width = <4>;
+		spi-max-frequency = <50000000>;
+		m25p,fast-read;
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+};
+
+&rng1 {
+	status = "okay";
+};
+
+&rtc {
+	status = "okay";
+};
+
+&sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_e>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_e>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_e>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	st,neg-edge;
+	bus-width = <8>;
+	vmmc-supply = <&v3v3>;
+	vqmmc-supply = <&v3v3>;
+	mmc-ddr-3_3v;
+};
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
