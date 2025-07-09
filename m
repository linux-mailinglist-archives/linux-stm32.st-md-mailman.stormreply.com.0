Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA278AFED34
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 17:10:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94158C36B2A;
	Wed,  9 Jul 2025 15:10:26 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2104.outbound.protection.outlook.com [40.107.21.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86F2DC36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 15:10:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcNbfPVn8SMB7UjHG/qVk8wY0n1VUxn9wP/MA5RpLGxYjUxypW2SE1FFccbaVsgH8Ua3A8I1+IqjhbLpLm6HEVdAij/BQ+x0fSi4p9df88DIhs1+0C2ox2SqxHkMNAOajFNh1MXeCnNpqYfij4eztzz7fKxk4VYsTtO9HkQGUVUBMdcWnAX34TsaaHOiHHyQYnU/e/JlaRaplG97qNuZ0pP2y7m/bAX6BmVMiw1F1qQwva/LscQAyeG+2OOxGYSnxNqrWHWlds2owASqlrSgG1bXaWiIvBJLtiFlMpx9eE7xJY5niAGeuccJSAEGzsVqppNCGawFpmSipj+RYHWw5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpfOP6nVzFQd8td4sEBfBVUt3CSkiSnlTBSJ6IZIjG8=;
 b=NcTrihkWZtQhYbmVGEp+l+fP2PTj4eX1hBW/wdWH2Etyssx1FrJTPzjscNFB6Cgp3yhZE7OhxC3Pywgh6UOWmOBX1jyCx1MmpdInGIpczlqgdcrIlYH47lRwVEEsGFhZ7S9vXHqnb2td0glO8igzj8KKxnQpZ3Ur5sO/yfpqtl6rgA4AIShavDc6X6LhpD5wjU1vv1OMdVLJtB9eP/SlgoWxayyA53J/yogtDxyXT86ma3Vju+8eGMcT9G0+OkYJkpAUJgzpl2eXk4n6MVnXGA1QYxvK/KHbIB2IfQ64k0oTd8a5xCtmZdRH3bCHqMHS6CsXdR5nm0ATjg7o7VXXNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpfOP6nVzFQd8td4sEBfBVUt3CSkiSnlTBSJ6IZIjG8=;
 b=zWYZLf8qCdJN63Q6OEml2c8urOTX5mVChBiQEUya3cStBC/b7Tf7WDVnoZ+3PMa2sKU9HoETwSCMl9RqKwSFdh+djggiAjtIwo0ebtECrcLulEJuqhfxgO6v9HNFVZl5gUVGPYZMJBlxwuecQIeOVlCWTvJps0L/w78e2yOMHrc=
Received: from DB7PR02CA0007.eurprd02.prod.outlook.com (2603:10a6:10:52::20)
 by DB8P195MB0535.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:158::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Wed, 9 Jul
 2025 15:10:21 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:52:cafe::c8) by DB7PR02CA0007.outlook.office365.com
 (2603:10a6:10:52::20) with Microsoft SMTP Server (version=TLS1_3,
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
 2025 17:10:16 +0200
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.57 via Frontend
 Transport; Wed, 9 Jul 2025 17:10:16 +0200
Received: from pc.home ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025070917101623-216 ; Wed, 9 Jul 2025 17:10:16 +0200 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 9 Jul 2025 17:10:10 +0200
Message-ID: <20250709151011.366537-11-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709151011.366537-1-c.parant@phytec.fr>
References: <20250709151011.366537-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 09.07.2025 17:10:16,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 09.07.2025 17:10:16
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509ED:EE_|DB8P195MB0535:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e1e2e4d-d4f6-4e87-f1c0-08ddbefab944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R+7AoQGNHyBaoNMtoeMrjstZt6B5szFcS8n8IoC6x4IG8r1rodFCekcUfcxl?=
 =?us-ascii?Q?Yh/s3nm9Zo9cD3Qnh3l56RyQcrBn/4kgf6Zz3k1w9AhtqgtY2ZSRQL5TLra8?=
 =?us-ascii?Q?CDQRr88VBGr4vw5TxHYm+wiXuVXVk1sx/+nVTUZkFdnnODhnaGMmvkR00ctk?=
 =?us-ascii?Q?LZf6KI1j2nnMEM91M7WjOo/bNIgP1mKGX/zhdxxEelrtL4jO2mEZ5ptL8jCj?=
 =?us-ascii?Q?hPwtVi4wDAvTQuHKIFdFQhAwDL/dTf16R51o0J9/ezMkL0qv2mb/8Cc14bsU?=
 =?us-ascii?Q?SOE/6tuakckLo4F6H+6igTg6bg5PF/shVkExY5VISQg76erMKPmGtjARasXL?=
 =?us-ascii?Q?E5SIBa8yxTtWm1PgInvKurrO8sz+aItnjaUAOVfHtzVeUhAP461QdXLtWYy/?=
 =?us-ascii?Q?neAkjUJZkdpeU/r8tnd+PttEbRqtdkFQPVyrRn8W1eTLiWVGuESRGtVb/hWX?=
 =?us-ascii?Q?0c+xqfAbIQTzqWLSUtlIL0Kc3vHQjapSPp3PDuJuV1SL2Temi3pRS5neeE5d?=
 =?us-ascii?Q?OFYHEi4hDKf73MyCZ+lKHP+uNfO+2fyhT1ZXPUsJX/9wNBKTGJwpK6GssStU?=
 =?us-ascii?Q?G6OgjHpfN0h0EB0z4wZsuQ0FHLhQgqjsa8/ONnJuWXVVWuroR8wuK/rrYLOJ?=
 =?us-ascii?Q?MNRGQcR/N3cm71wsj5CTi8wlYRwlY9Qh7m6d6M3XdmGTZrMz6YGcEEMRTTCp?=
 =?us-ascii?Q?Wt+rbfhGPZ4luR/2SB4ypy3TBO3TWeEIyEYdsYvvzvRdG3TrPE1kMRsIV/7S?=
 =?us-ascii?Q?nC+rj7157MJOuzAOOre7/VyrtgSIy9jC1V4Of8m30rvYetojTXObHN0snVmk?=
 =?us-ascii?Q?e6fzJs0W4EozpsJ3Y2+I1AVLPZot4Dzj3cRmt+7eeCvY8J364VJodFYY7gYr?=
 =?us-ascii?Q?FlKtd/p6BBNdnnB/EeiZYW2cLowJDxo7S7CrDhhWrP4eF/SVX1Bw/X/yhAB8?=
 =?us-ascii?Q?/bTWwkQicHhsnh4baY3kxWIGMzTMMLewSG2//mWxS7wXpyerx9xyazMY4O48?=
 =?us-ascii?Q?2g22ufMv5e780Br6MWIxDzrIiM/D5dDDUI1WNwmcFQuISEuMNv4+I0VZ+0ys?=
 =?us-ascii?Q?uyWV1+0UsIQyIGSk/scBDI9x9TA5p5ptvPXuJpICitzRNVPof+6Mf5so10Be?=
 =?us-ascii?Q?wNHCdYL1pDiouUIj6yZ7rK9AH5GhORlCSpy2PX0CalswlKfnV42M63sq1HdQ?=
 =?us-ascii?Q?rtJUOBUZwkPxxyt2rzwEwfqdpXSl5XBbKsOOAv1fmtIniU0QbSUTnkg/E4ie?=
 =?us-ascii?Q?NBFkTUEBDgPKnd2jDGJJwSQ74FKeh/KrcLomjs++MXzYo7JQ83R+W4z8iRYI?=
 =?us-ascii?Q?OE5aBBS80yXYwyTbnz8gE+nK/r4eM5qUnHSfoPVIewmHWviIM23u9IhE294G?=
 =?us-ascii?Q?37mx0r9L4R83VNu6cCAeDEFEqKodI+3m/t+O0HdjYKSt6Lq6JIDHPKahDqA5?=
 =?us-ascii?Q?erH0Z/9TMIoAsRCvCXSERqt1QLd8FM6xjQGs1AJFLfYj2T5JsEth+YWYKUb9?=
 =?us-ascii?Q?736NEaEY7BiML07yJZMchqO80mBdm4BgxWcJ?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 15:10:21.5162 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e1e2e4d-d4f6-4e87-f1c0-08ddbefab944
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P195MB0535
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [Linux-stm32] [PATCH v2 10/11] ARM: dts: stm32: phyboard-sargas and
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
