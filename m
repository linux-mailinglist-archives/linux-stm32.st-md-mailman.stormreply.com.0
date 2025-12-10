Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E78CB2A80
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Dec 2025 11:16:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 693AAC628AC;
	Wed, 10 Dec 2025 10:16:30 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11023132.outbound.protection.outlook.com
 [40.107.159.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61D34C628B0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Dec 2025 10:16:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhYTkXOV+ZfNBob3C/zMcc+CcmEfxjECvTiDySjcDEqReU4A7+F1j3jSl28uGytQpDD3foCRVshzOiJtazX1+baXFN0bDjXM6BoUfOn0ZbsdWBScCFDES6LGrI4gvzy9M0kcBE7i5ssvE4m3egE6aEugHO+PAr5G4u8CaJMI4+cyiZRgkf/78FJw3ZHfwgj/aGC9YcQTwRG4onpT2uafGhnzasfmbdxs60PbQ+xfVJQuP8M12o3T3Oj0t6wfQOSdJ51OnBGYVWI0LLYzCCIBf8dimPA1j1LvtPnMCwiCArMP3V5+JA352v+OD3b1DYdn5eq/bzDxd9hfMmyC09ZXog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpfOP6nVzFQd8td4sEBfBVUt3CSkiSnlTBSJ6IZIjG8=;
 b=D2e/RHohI/1fvbKNSur9x2szNVB8J1hV17ClmvJORbh6TW3N46lPlFfaIS9c8Z61M7pFEkUy72o0o0UPAZWh9yMWj4K7/9r52TiM+tTAVU2Lo71guWr2Z/uCAqGVj699wE5IAb5ImfK0GAB5PIvs1a+r5ZvYNk7K3QSoJAw/0DOCPdXxx9n+2gl1ChSEBy4MILhJkqbvBUZYyp5DH8BXd2a2/Swq/Zbs/JGI5V9BCzYPA/skMM64WGtUq5cWM6RluN1rkj2MIeGlJIYtqQm+OyB5EAE2I3Vj57EKXBN474gtfH4Ir0ST8KRojA3KUVS4KIb7d1Co2t4Cql/xjT8xQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpfOP6nVzFQd8td4sEBfBVUt3CSkiSnlTBSJ6IZIjG8=;
 b=KXolupK9rO98ho0Yb7AWn8m4j6PeeSBxFt7EZls7SSO4QQoNiZdhUaZ84j8Xg7ui8/41jqkbMjXE3CXYRWXGsv32XVai37gVrEcmO0+Bm2Ecg5Od0ds7dBF1u7NuUspPmF4ptkAdcBDBBlFp3J9uH44E6fPqPsFPnqnQJfhG5B4=
Received: from DB9PR01CA0014.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::19) by AM0P195MB0756.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:165::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 10:16:22 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::89) by DB9PR01CA0014.outlook.office365.com
 (2603:10a6:10:1d8::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Wed,
 10 Dec 2025 10:16:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 10 Dec 2025 10:16:21 +0000
Received: from Postix.phytec.de (172.25.0.11) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 10 Dec
 2025 11:16:16 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.11) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Wed, 10 Dec 2025 11:16:16 +0100
Received: from pc.home ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025121011161644-319 ; Wed, 10 Dec 2025 11:16:16 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 10 Dec 2025 11:16:10 +0100
Message-ID: <20251210101611.27008-11-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251210101611.27008-1-c.parant@phytec.fr>
References: <20251210101611.27008-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 10.12.2025 11:16:16,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.12.2025 11:16:16
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D09:EE_|AM0P195MB0756:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b95ad7e-c22d-4066-8f30-08de37d52ae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oDOZTP2oYNUMFGRIwpcpM7zxopt5SqM141dMLVezN5QTPhzwoHaqmT+7KcD8?=
 =?us-ascii?Q?meEDtLbj5B+PwoTiydhojVuuVuJovKEELeW2LmIon+N7XF3pEf975yb8nBb9?=
 =?us-ascii?Q?nYqIJNqLY1b7fTATibhDmbTZJjhXTcP2r90ZrsjvWkUkyKhP1DNeXdB6kLwS?=
 =?us-ascii?Q?xBg/9bW9YorNXDxW2E5h7yJCi8BpQM49g5KezwqmytboQ7irkxRS3ldOpFkW?=
 =?us-ascii?Q?RIGQkFTG+ut0z+37cP9ZmhmLXeUoqFfAVkn3DuRsVdR3s3eBCHv9rDNrnv08?=
 =?us-ascii?Q?WSzP44CDSHo8DRC6uI41ZeDprlLWQASqrLHLg38wSn9dr+VhebBpSUjOR3q9?=
 =?us-ascii?Q?3Zhjr2ukTu7Z6kYo74w77OfSuQcWB8hx1zmgnWa+BIPDxHkMBjXpwWBl0MRN?=
 =?us-ascii?Q?cwOjwg355j2qiFrVcrvR8n9jVrmNjKDJqzeLLhPdnbIIluUpBB/nzSgYQRE/?=
 =?us-ascii?Q?m38PuUuw1LE7zJk5FnCmQlIeTjkjdAKMbP+8OGdjCerbhgjiyYwPUn6b888u?=
 =?us-ascii?Q?XqkAHLRfKstu2J+6OOx3zdGPpGY8HzHIK0HNNj9dcZQyOjk0dOx6ApnWo1jQ?=
 =?us-ascii?Q?2iIu7dVVtJZYNE7nc4RrhBmCkBFL9UMWlIAV10bZ9iNlqh1lK8h3fXefFo66?=
 =?us-ascii?Q?6njPvhxyHpQwhXmJwEE1qvk+0XvpPsUJCllAAHIrqcdqho5is/O4JVLuSNyp?=
 =?us-ascii?Q?sjx4WAM2TKi6LxnYzEkh/etV+ZWNsKIz1Npt2ktZ+WHFIqAaB19/KSGcZ3Eb?=
 =?us-ascii?Q?7vOCWjOkdjmWQPCS/5GhemQBuhQjzcStBxQgyhgXEqzTjtpRIFt30psv+i5L?=
 =?us-ascii?Q?03zSXCUpRhHpGP0aAox9RYKfsXBUDx9Lbao3iCkwc90TB7NpmyOZ670+qsCv?=
 =?us-ascii?Q?BtOA0OuETfTxSY6MjDgJqpfRn4LorZ92LfWtZeHGgQqTiNc3W27zbxXBdMCa?=
 =?us-ascii?Q?uXAA4iCZxkUTd739hKZ/vachVmIQNXLJ/hEmOfPGyhrzGae8akh6ft9EFAZd?=
 =?us-ascii?Q?ElPKtuPnNyGI2pMtDaQtXyDuJnqrVkkqjWrmTxPPMVS0FLvInj+D9ENW9N7+?=
 =?us-ascii?Q?XIFdPYAwTAHcUwA3yBhTeOhCZ22FxeQ6wElAe7t2wFnzp2eEf4WGuRei/360?=
 =?us-ascii?Q?gbEwl2hTNWe0706VpIb52q8pMsiucXhSsAU9QOT86VQrYVRVlwDwgd3Q17aL?=
 =?us-ascii?Q?9mGTmSMrmR9Q9x7O2XJoJH/3zR8vN1CccOSED5j1IcEtyTmYoSKv0cboXK0P?=
 =?us-ascii?Q?eoCSSrJEscdcFdvxVChBHAwUYK9k1eyk4Y+sg0fm4PnC3AvtQlC0vjAqcQDr?=
 =?us-ascii?Q?zL1q2OePMDG15+xLDxw/uCvu6RU2FKeE7Q2GFur8zhKPjkQSllXuX85DAwIh?=
 =?us-ascii?Q?EucUy1S87sPUU6nr7Q+TJltL+fi4FNf2+nO63l5u3Piyjsm4LxNwHTs1vi7n?=
 =?us-ascii?Q?jWpqZe+Woplu6FxRkaCGPnBeYM/l36RPRvYqLY+K0ZTlT/wjA+eDI0Nn07pY?=
 =?us-ascii?Q?KmcUktGNxawE9BYX6bB60/wptFO5O/m8UVffvpaqNl6NCLzGDLA4Tc+6Vbnf?=
 =?us-ascii?Q?o9LroVrKH3S7DKV98Ss=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:Postix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 10:16:21.9717 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b95ad7e-c22d-4066-8f30-08de37d52ae5
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P195MB0756
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [Linux-stm32] [PATCH RESEND v2 10/11] ARM: dts: stm32:
	phyboard-sargas and phycore: Fix coding style issues
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
index c90b12a479c9..c18a37266083 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
@@ -6,7 +6,6 @@
 
 /dts-v1/;
 
-#include <dt-bindings/pinctrl/stm32-pinfunc.h>
 #include "stm32mp157.dtsi"
 #include "stm32mp15xc.dtsi"
 #include "stm32mp15xx-phycore-som.dtsi"
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
index 9578e78bcc1d..20684b497c99 100644
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
