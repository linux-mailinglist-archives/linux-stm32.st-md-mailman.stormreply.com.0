Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 988C0A2C595
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Feb 2025 15:35:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DEDAC78F8F;
	Fri,  7 Feb 2025 14:35:58 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2135.outbound.protection.outlook.com [40.107.22.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2348EC78F90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Feb 2025 14:35:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNhS1PoycFz7FV4c2qRXuLyOdEf4duAYQNa3OOL497onU0uTDDjXw+ALka5feRCoMLugxhmeawVs9fh4rrDqGBkOMuQoDvlMuU4wmpMypJvectdmBLX+jifhe1AG16GewZK/pHwJtSOT3cvw7xI8FeRb8bE4IRkrI6MY3Cq+fiXPfCzBSAtvlQuZPFK8jKKOk3txcDEk/hPIG8v+ysvk1/4pyahcqHM9/jK2n1FJD3mB4Wht5+Y0t29crwVecYhwXco0bpvhcTKWMQog+YJRjflB2wm4wT57jl/H77PEKD29exVNuzPX7Y5RTUOzibeOEQw6w1hBSTGN5Urx+tFvyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dl6Ki9DEGT5choe27M1bsc5lfZ/VeCFcHJhhxs6rYGs=;
 b=hMVGhawVmlWlXQBhbaBHnpJ0lywwCMOcdU53I+Fw+6tLrcxWsYuvtvNLBs1QplfXHXA9QXD3JEWvhw9iPjD6K2dWvJcANHELecPYC+x778dbUJpu+AIUrfvsiE7yeCCI75Og/ya9h7+7W4pbZ2mtco84QVxrBE8PhYUxn1oQGp9rQZOwhjU2hYcWk9ziyt/KW70WOCiud1LUm2awwnBRuXX+b0ZdIuTpHPjkWBOtcsyFf63obSQbfroRQizJ28pO7bz0SCc6k8WNdnl/X+ugS5Vg3/sm8TW2DpssSQzCAp4qroXCBEcLtA22Ldb7iNOXgNu7LZ0LjH1jg+XMbE5jpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=phytec.fr; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.fr; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dl6Ki9DEGT5choe27M1bsc5lfZ/VeCFcHJhhxs6rYGs=;
 b=oEPggzbZM9Mk/uBUBvBxqHjTPgRHclfQUAmkhr3WJWiph3+vT0HWFvEsjBUpKynt5/pWM4+xU448k4cnldZE3txpSS3iUMayWfVZXu4RtJIkNrU9rWePpSVuJelmwVI7W8G0pl43j7tAZl6PdkvSbHkjZurZI2+kmQc60hx+0Ro=
Received: from DB6PR0301CA0075.eurprd03.prod.outlook.com (2603:10a6:6:30::22)
 by AM0P195MB0561.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:166::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 14:35:53 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:6:30:cafe::3c) by DB6PR0301CA0075.outlook.office365.com
 (2603:10a6:6:30::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.29 via Frontend Transport; Fri,
 7 Feb 2025 14:35:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 14:35:52 +0000
Received: from Berlix.phytec.de (172.25.0.12) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 7 Feb
 2025 15:35:51 +0100
Received: from Diagnostix.phytec.de (172.25.0.14) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 7 Feb
 2025 15:35:51 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 7 Feb 2025 15:35:51 +0100
Received: from pc.. ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025020715355140-59 ; Fri, 7 Feb 2025 15:35:51 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 7 Feb 2025 15:35:41 +0100
Message-ID: <20250207143550.432541-3-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207143550.432541-1-c.parant@phytec.fr>
References: <20250207143550.432541-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 07.02.2025 15:35:51,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 07.02.2025 15:35:51
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C6:EE_|AM0P195MB0561:EE_
X-MS-Office365-Filtering-Correlation-Id: e4f31d58-f9ea-4d57-f736-08dd4784b97e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9ivhdl6kFsGDs5NOg7mQsKuLgOr/qekRRRHMqs0Dr00dRJ+auMdXw87R4e2M?=
 =?us-ascii?Q?SPORkA9jcT8QaxAtxIjffIMRpk3Aea+0wxKwcl5TRP8ZDm7ecYvKP3m6Ld2e?=
 =?us-ascii?Q?/TXMRQzp2P32BjZeBJvGd1AUDd9YfiuBWsJe0h2sCAUtqyF9EuuR8e2TM4XQ?=
 =?us-ascii?Q?jJvp6GlJroJBfuSheAO+O2hgpt3NTs/2GlAZb6YBMiiQ0xi+BLNyR/VndZsz?=
 =?us-ascii?Q?qsqYjOhHmfoyWcOdeykB2swOZnqDNKWZ68pVotRdCxabhlL/HOB4JIKSQcTZ?=
 =?us-ascii?Q?8QI/F9nG4NLKhFPTnIYZ9CEBu+1YqIlFzn5R1Oo9jhFv0S1qX8YH1dBNijtI?=
 =?us-ascii?Q?PRZrCweUHW+Ya7ZIOe7WiYlmPOZn2AHWQnx8CUeyVa9G1zlD03QVCeEJ6VNR?=
 =?us-ascii?Q?/H0RBa1k5zv/rm4cma/AiIW7k51+JR13gtxNgc+GRhvzkaK9QaqtjcV2hmHm?=
 =?us-ascii?Q?4A3pf29dQmDf2eBuFYkSqeu7hL1zlw2SVLyCKpGKq6fCRo9nLyaudUHAe5vr?=
 =?us-ascii?Q?1eQUI1CfjMnZj+aIcEu4l3m6zYqR3F79a/6t1ry6jih+jkpWgW2y7cMQCaST?=
 =?us-ascii?Q?xtC6CPCB0akwzz5In1mZ4YPS/Apj7lFodg17eXvdWq6kPU20LZ9x4+FWcvIm?=
 =?us-ascii?Q?7daeSZ5vGDQgrC0TxBk54ApqLeJW2cXo8lyIcAOAVK05SKDC6cgJx7060f3v?=
 =?us-ascii?Q?ZVZFneH7659/FsQ/YTfbymch8TeQX31svQc1TPJblOW/2UXSkKVwfAfeXSQw?=
 =?us-ascii?Q?DtN7QQVsl4Zqy8o0ZhFBxy5XOt1f1O7Wx0BVTsYgi8KdVx38bkySgJk47DhL?=
 =?us-ascii?Q?OSsUY2Jp0cs3WtYAQzKDZjKJdAB54zclXddcbsO/9fj6qN5N5x24naF6QGk7?=
 =?us-ascii?Q?UOq4rXeovqfR1E1ZTAjcjIDFnt/W9uch+786rg4CzwUb+aaOhP0tDysYwfJc?=
 =?us-ascii?Q?1c8j6GE3Mn7xrwXua3m3vIcZCNdWac6UQ3PjvUsFsarkMP7FJ62yCyXaiSI+?=
 =?us-ascii?Q?teWCyFEkGqYtRV7ncYDCV3BGcGy9GNjN2lkY/5QRcsLxpdc17NQG7l2mdVVO?=
 =?us-ascii?Q?6L0YJhXF8zRDL6PQvw6cxHhlM+3ejNK6+mbOrqNsAikX/EY7pn99Ao+qvRRq?=
 =?us-ascii?Q?gWGVBfa+Ee/Dhtvc5I0FiyiBiQWq8zhDvV6F8/xW/pOmCGee8izXIqMOU0Fp?=
 =?us-ascii?Q?90l3ikUYjwfhLhkl+g9uLeCJtZYRl9s2icjqeBkIydjPypIsjHQQYg9EHRpG?=
 =?us-ascii?Q?cMqQmCebqGhb+PdT84oOoBrw0FRUGjK+mQ3QxwAYa7J9J4++HoPOegryaCT+?=
 =?us-ascii?Q?VCFgVmC10OJdt3qkt2CQUDTSX4rDUennadWmEtCOdnBhr+WRGRJ144cNRpOn?=
 =?us-ascii?Q?0DiqE7rfMAHchmPJNsCuBAwLZEn2Rgi4lH23UYrdkTG+fGssfM8ioHspPB28?=
 =?us-ascii?Q?KpzmB3qi0+0+reV3iSpugfuyPg5NVBIoaf5EEfElaEOEz29sNwYixp68DDqM?=
 =?us-ascii?Q?PR+D6OdKw7SaUNA=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 14:35:52.9059 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f31d58-f9ea-4d57-f736-08dd4784b97e
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P195MB0561
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH v2 02/11] ARM: dts: stm32mp15:
	phyboard-sargas: Introduce SoM device tree
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

Add stm32mp15xx-phycore-som.dtsi device tree file to slit hardware
features between the phyBOARD (baseboard) and the phyCORE (SoM).

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 .../st/stm32mp157c-phyboard-sargas-rdk.dts    |   2 +-
 .../dts/st/stm32mp15xx-phyboard-sargas.dtsi   | 317 +----------------
 .../boot/dts/st/stm32mp15xx-phycore-som.dtsi  | 329 ++++++++++++++++++
 3 files changed, 331 insertions(+), 317 deletions(-)
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi

diff --git a/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
index cb5a55798036..43592234573c 100644
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
