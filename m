Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AF0A48341
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 16:40:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82A08C7A84D;
	Thu, 27 Feb 2025 15:40:48 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2090.outbound.protection.outlook.com [40.107.20.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB7DFC7A849
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 15:40:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZK4XSuBa8bD7soo3mdeGtY8G+dXev0vehrESdxJx82qyb/nuu3mZIMuS0qigJZLzZofeSBSyzcxxWrXELoprzglf+hXXp2NuP8hRcCnWcI9r/qRGcT7zWEM4BSIjZsCRF+Mdv6lkggHM6bbHohHK4H4y1uELj3ySs6429KHrrLc1AFNHxNDhfRX1zgdUPAKBSptnEclCf17Flndw74IaD1x4Y7eeA7+GzW1sBS7GXRtQhSBLVHfSLsFJV7sral79DzXjhRvh9BbPGoVh5AO8Gpl4zBWCXOBqZblAaUw78TUUHi1rtQcMa7FwWmWOqxe5105buKy6r3IH5fmK84g+GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MHKeVQmckj9LWliyWJoJlMe5edoRVM/MNJ06Otj8SQ=;
 b=sy9JbFSX3zdJMRcTVj3oc+Q5flHxY8nyxpntXNoGKOBgD84RZ9cWOJblEL+6FYLg/zVR5VzBV70iZGUcE2kIwiyR9NfmCLqTxOJm8SNILyqXux3NPCbY9lxNTenSaqw95vYjloWGFsuukK6u1v97fn0sZBfhfiCCGratAAPd54ZzgMMM/iqxkIKRj4wIVysHLFcCb2S7/HJB4PYIFwoh4lCM3LIoHi4SeQKKqCxEDYfOJ/APArNNSyS1571a7n/QAYxRTKxV6iUT6+CJoMM0lovdbwqG62XsBBiJG5vcSG/H38G/HNu2P1/IjUJggw428qoyCN+PIN2wZjjHFMtKxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4MHKeVQmckj9LWliyWJoJlMe5edoRVM/MNJ06Otj8SQ=;
 b=eClDNJsWKnGOKLw5IKE1nezgAZ6XHB6S7dV4m6ECZnODF63oRAvkxeVHdP4BhLHQwe677+tLsxHKfIqYq93HN2Pu2VT/xkmDubVDvAsqtPfrkgqdj1/vI9zWrjPsVHIzjeNdhuA7qsQYiIidOCcsT5ps0HWneBrCliWmcGGVrjk=
Received: from AS9PR06CA0546.eurprd06.prod.outlook.com (2603:10a6:20b:485::7)
 by PAVP195MB2232.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:2ff::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 15:40:44 +0000
Received: from AM2PEPF0001C70C.eurprd05.prod.outlook.com
 (2603:10a6:20b:485:cafe::34) by AS9PR06CA0546.outlook.office365.com
 (2603:10a6:20b:485::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.18 via Frontend Transport; Thu,
 27 Feb 2025 15:40:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AM2PEPF0001C70C.mail.protection.outlook.com (10.167.16.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 15:40:44 +0000
Received: from Berlix.phytec.de (172.25.0.12) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 27 Feb
 2025 16:40:18 +0100
Received: from Florix.phytec.de (172.25.0.13) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 27 Feb
 2025 16:40:18 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.13) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 27 Feb 2025 16:40:18 +0100
Received: from localhost.localdomain ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025022716401798-93 ; Thu, 27 Feb 2025 16:40:17 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 27 Feb 2025 16:40:11 +0100
Message-ID: <20250227154012.259566-11-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227154012.259566-1-c.parant@phytec.fr>
References: <20250227154012.259566-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 27.02.2025 16:40:18,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 27.02.2025 16:40:18
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70C:EE_|PAVP195MB2232:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ad0fd0c-5fcf-4a46-9bba-08dd5745190a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c9wKtLxkhMJ4b4QHYWTxz1wq6j7g1BhAzBX988awGnukFvvK/gD9pqzD7LlS?=
 =?us-ascii?Q?pECn8ojzR+9lTnj8x3mEPmdxSSav9nQQohVkl61/1uIWm1Qel/zKamc4CZKw?=
 =?us-ascii?Q?JP+R0Ib1ON3ejqx9u1p3cQUnmPwFPOUta0X/x7SDZ0Nm8o5yPb7tpmnD7q01?=
 =?us-ascii?Q?XuBqFGwaLWFvFwNqXHlzzrI9mC8Ju7SmwRk86xfu3bZXvONQK58F4grxDBvN?=
 =?us-ascii?Q?ZiuharBAmLQLXE5OhOjMIMct5ZtKJqWHQi3Z+cqxFtC4e9tGwhOrynF+PeTF?=
 =?us-ascii?Q?D0vydimnL2rTHR2N1KLCbq1vbHy51zkaN99LOlLhIOFJKEn4zG/1hYOtppjf?=
 =?us-ascii?Q?acszHs0KMfO74L2+OtdrHi/WwqlrzQ4SrU2H90S3YoygdGr7h+al+WGoQNzR?=
 =?us-ascii?Q?bg/5WSey1CI51rkrqTK4Adx5rdioByv1dmKjNglWDbE7RM3z5fhBK6gRBfLa?=
 =?us-ascii?Q?JuEpcf81OqUaTkrQQ0W5VqVJcSvUxgdbLO7FaG+d1qaLjssIhAfq/x6bZZqw?=
 =?us-ascii?Q?6AtyMcF3JBfiKpkDop8UliBOiZe45KM+i2Yg0URBr6pmLqQLthD22uGjDktH?=
 =?us-ascii?Q?JST6yU7d07mPEC8TwQi8ZKRTeRCq75QZJdEEDzqg01IISJpiRGTuy8km8ya2?=
 =?us-ascii?Q?xOyVD3eEkpttAGAEtn5KQf6vDz5d0KzB1qT58BbwpzidXEoQur2nBZFPxvye?=
 =?us-ascii?Q?qW/kuybAtAoPt9LoQIS2zMjQHmCn0nqYE6wCzAQktkzBcTnWgI212jJRV6aa?=
 =?us-ascii?Q?tMON14aaNaDBWLhhHCETRPIJUzK7EA5u4ZLiy7ayKWqyOjSLJjYugMWJ+5hD?=
 =?us-ascii?Q?wX3Jp20XsSmzKjuMaB6tgSqC1fmATKOHMEdaDU9scOcmYuQabutNCLIR5Zt/?=
 =?us-ascii?Q?dJLyXfH+4RAA6lgq+2peZgbiphYL48ioyovkYjEgiFqe4l0swpMR9WeX0wbl?=
 =?us-ascii?Q?Bg/ggBqFVlbnxOum5+pWVf1O/21vHUzo80V8LVeGdSKDR8oMsGS4DImLRSyp?=
 =?us-ascii?Q?+ZoAHK8GK/kZlNaDObKdwZhuOguDOyXf0NiheXAp6bdM6IGjBzvEC+SCracX?=
 =?us-ascii?Q?HWWaMNjrqn8vtXmXS99z/xjMet7YftXH7E65Amn9xSShQSu6x8VteHrLij8G?=
 =?us-ascii?Q?c45fYrqUR5p8qx2x0NIuyof9/9g2t/7wS1q08wcwtpAeWidT2o0ETvDcprSf?=
 =?us-ascii?Q?5eMTHTG1r36QwabYW2DkxY80hGU11WWlfvmpA/s+gvS3N2HwPBxhJ6Bn5qZj?=
 =?us-ascii?Q?Uzcwzv1lB7YQUd+pIkJbPpiHh65X2ZOFTgCF9bkKE+rfWvlZ5HBMgcyBruhg?=
 =?us-ascii?Q?4h7stnu8R8meQghJwZJeix9Ozja5lo21vSccnTuYfJXOyUaKmtCw6RidePi4?=
 =?us-ascii?Q?/08r1Z4moou/Ep1LL+rXBEhIXHoOx62a1GqGE0/6qFxiTZkgSAQ3nCNvWVNb?=
 =?us-ascii?Q?447m00If/DL6TEMLstuaPkdwGKCtE/4G6qSQUuLXvbGDdzmQy2XGhQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 15:40:44.0651 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad0fd0c-5fcf-4a46-9bba-08dd5745190a
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP195MB2232
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [Linux-stm32] [PATCH 10/11] ARM: dts: stm32: phyboard-sargas and
	phycore: Fix coding style issues
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

- Remove "stm32-pinfunc.h" include as it is already include in
"stm32mp15-pinctrl.dtsi" file.
- reserved-memory: reorder the memory sections (lower to higher
  addresses).
- Move vendor properties (go last).
- Remove useless compatible values:
  - QSPI flash: remove the winbond compatible. jedec is enought as the
    NOR flahses are detectable.
  - EEPROM: "atmel,24c32" is enought.
- Use uppercase for regulator-name properties.
- In pmic node: use the names from the PHYTEC SoM schematics.
- stmpe811 touch: fix dts schema to comply with st,stmpe.yaml.
- Fix one "multiple blank lines" detected by checkpatch.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 .../st/stm32mp157c-phyboard-sargas-rdk.dts    |  1 -
 .../dts/st/stm32mp15xx-phyboard-sargas.dtsi   | 13 ++--
 .../boot/dts/st/stm32mp15xx-phycore-som.dtsi  | 64 +++++++++----------
 3 files changed, 36 insertions(+), 42 deletions(-)

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
index 3d62f9e4d0cd..729a97f82538 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
@@ -5,7 +5,6 @@
  * Author: Dom VOVARD <dom.vovard@linrt.com>.
  */
 
-
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/leds/common.h>
@@ -101,13 +100,13 @@ touch@44 {
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
@@ -159,10 +158,10 @@ &sai2 {
 
 &sai2a {
 	dma-names = "rx";
-	st,sync = <&sai2b 2>;
 	clocks = <&rcc SAI2_K>, <&sai2b>;
 	clock-names = "sai_ck", "MCLK";
 	#clock-cells = <0>;
+	st,sync = <&sai2b 2>;
 
 	sai2a_port: port {
 		sai2a_endpoint: endpoint {
@@ -195,9 +194,9 @@ &sdmmc1 {
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
