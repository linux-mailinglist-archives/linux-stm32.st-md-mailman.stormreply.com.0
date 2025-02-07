Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8C9A2C59D
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Feb 2025 15:36:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3616C78F90;
	Fri,  7 Feb 2025 14:36:07 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2112.outbound.protection.outlook.com [40.107.249.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D7D2C78F8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Feb 2025 14:36:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUwBWSxKr5qyRkaVYW50OlGlTlYeZYYKOGuejWzmJRZ1iLTUhiwKufDvsDEoMEBdr0zh+9+B1Kg8YQwvDgLToqCUX36EzJrGbV8LCdPZt2i7FeHiQb5IqkYvGsF9rnCPjyG5A9FLBZC+7Ff74YYaeTbZkGsLDvRfsnQHVIqvMVnNxzRn21cX9M30Nj3zn0APke32S0hnSvHZ/YU72Ed3hBaI0Ccn0rdZ35kFh+yYdB+NcpCkOWQqijJwNh7PFucWyDyR4CSiB+SIbVxNAcBswZaUWi93LG6+reVso0AYEmEfc0H5rPJ5xNYZ0SwqMXRioV+SisU5bjMGARAOhZd0og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvqCTD04ulZa588rgjwFuHu4FfJPfOXW7Bl0OEvvnAc=;
 b=sMj1/qGqIDEh+e9RA4IOl+ckTaTiRLkzAaNQlvJIKuX8/QYc3LJ63XfuGC8B66H0dtbG4EKgTp1ofgYy0b24/PAZIFvp7CssN1uJ3SNTIBRxij42QvFVrkcKJKtJLtHTzaqfuXFQFWl5u3JANPvNZQH7aSA2Q5BiEYb105b4UDNoSQr4jONdJn2pXEsNIuieUKUZZ4AH7YFHc/4duFHIl57xYvOcoi4hHsLMKteyu9x4IJhf32Nnj1wGkMsOOqhD/kGf21Bh6ihyHFQ+etgZoZY7LgWJYLQttn+1g76oBnEDKnmJGG7dOY2rXKwo3b7e8axNWEl/UIOCZqH15avPBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=phytec.fr; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.fr; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvqCTD04ulZa588rgjwFuHu4FfJPfOXW7Bl0OEvvnAc=;
 b=QMvpAqUnCpyqtYfZm6cAAwIbFcdHx/jdKE+2RN2XRV2Uk1KqYcZMjVHysJdkHnGSvpp+cH7ixqiNCCJApAuiTBEnuI0QNKM13phMaCnp9mXSLhulgLa5T1Uh2BGm4tSje9xpNn1kYLWdu9mkDPpo32ULN5qxAPH9bu0v0zht4jY=
Received: from DB6PR0301CA0067.eurprd03.prod.outlook.com (2603:10a6:6:30::14)
 by PR3P195MB0815.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:96::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Fri, 7 Feb
 2025 14:36:05 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:6:30:cafe::f1) by DB6PR0301CA0067.outlook.office365.com
 (2603:10a6:6:30::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Fri,
 7 Feb 2025 14:36:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 14:36:05 +0000
Received: from Diagnostix.phytec.de (172.25.0.14) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 7 Feb
 2025 15:35:53 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 7 Feb 2025 15:35:53 +0100
Received: from pc.. ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025020715355355-68 ; Fri, 7 Feb 2025 15:35:53 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 7 Feb 2025 15:35:50 +0100
Message-ID: <20250207143550.432541-12-c.parant@phytec.fr>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C6:EE_|PR3P195MB0815:EE_
X-MS-Office365-Filtering-Correlation-Id: bb6826ab-dc8d-4e77-7f78-08dd4784c0bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MOlL00ODXdE01OmcrSbOAdbg1xo+oZBenhMcVzWj+4xDZRCubLYIzIPXjnJV?=
 =?us-ascii?Q?mGmdE+D2yRAKCzSkON4AH0HXt2trIcDP5qpIjF/q9KcvpAB6I2hpc2LSpcRh?=
 =?us-ascii?Q?2012dPK33U2cpprqwlk+7IVXjC7iZVyv1CibF617bNIGKEbn4GTllyb93ZzT?=
 =?us-ascii?Q?idi2IOW09O6ed48FyfQHyhi9PoTZ0xVX9SWRDS6eNlU/G8BSlYtRRkmM5XQ1?=
 =?us-ascii?Q?l5yGWZAgmhSWI+CZMvZyO0QOnvf7qwhZ13IWArF9sOv2n+dMNb1uW8iy7Xqj?=
 =?us-ascii?Q?j4YUNp9+K1m8a284TItytsKSYkiLZlYodH9VS8ybKHZNcDxz/EirPOa08wzl?=
 =?us-ascii?Q?dYKi1sctWg7LeHnNmq2cFxSDiswFDdwWBeYXL9kdNSd0dMs2gGc5piM+nok3?=
 =?us-ascii?Q?nRDThU3XivXBJB4HUlEF8CgexmnVIrakk4/Jx+MBYIBrqS5Jet42VubVgtD4?=
 =?us-ascii?Q?nhNiL0AOriks4hHniNMP2fSNj+ctZJk07KqGltyChaFgzrG0QGJMggVIcVjS?=
 =?us-ascii?Q?NAk4o95RW0YiIuVc//r/CT8x5ntHAN3cgc982tVjZpFlm1R9sCQzeftReGr8?=
 =?us-ascii?Q?pPS1YCtBU8MUXuRl+BB/z4sLKg/NYUrpo28U6LIUSKEqeNMO2nsvfvSFvsV0?=
 =?us-ascii?Q?/t1UhVYISClzQF2ScjD73ilY8niKhvX7ws/UygTd8wSf3/lO4UBITqsVq9fR?=
 =?us-ascii?Q?fE1oYQOLVGrl8c7QA1BF/2uki5btcrAAR8bitHhZnQc1MKgIuoDzdnYPDx2C?=
 =?us-ascii?Q?HB335b7/uaxrJH3SXQKLNpSGXlkIR0hkrm8suxQbz33NofrGOJ27CheruvGu?=
 =?us-ascii?Q?XMbguuvRteDcjJc0aOMZgsGsPYvZ7U4Z70guly578bPNyqmm2O0vB71KI/X9?=
 =?us-ascii?Q?b8gQoBLBLLsG4beAKYOn1kr76slmsuGFUV8LgvFp6QGhqyFLF08WgJFSIzy6?=
 =?us-ascii?Q?Obx/iKqQ8+OSdqmqAzD8n30+20xqBeQBmQuMnCCPPMwdGEcBsHK8vKPhboj6?=
 =?us-ascii?Q?HqTnV0NnlqV06vhoCOr5vUBdD+mXGePi48sSFf4C7BZ4LI25lvhHCDuMNwky?=
 =?us-ascii?Q?LqJDZknewj2DxF8kHTzIwoVsru4DetFmZH8FpbeeYtVEehdAQLRH5tlM4a14?=
 =?us-ascii?Q?uqPzF0nJv0cVkN7X9exMKzJRvKT3zNBkU5yVP10JG+yOethSWQQ1fVgLV7YF?=
 =?us-ascii?Q?tJqKrI9cQusFg+s0Y92p2CnP7d6of9GYPsvOVecyf4kcGB6oVYHCPIOBke5i?=
 =?us-ascii?Q?ScvoCkIUE1uN7qP/r7FG9qu0degV6p6L4r92OfkHMAogr69vTBirI5hDiAOL?=
 =?us-ascii?Q?erETWwmvT858RbrzggK2pXo6rPY474HYllabqNeLxJyq4jCZzdBCFkgWhRov?=
 =?us-ascii?Q?N9aqqeV94jDfrgql2ypPheTGVKyOYkkByq0xOOaWyE5S3xXJbvOcfEC1fJGR?=
 =?us-ascii?Q?I61dl1nfA59JJ3+pPyur/+DHvwdfgIviRt0FCIN8KGeMxePRLF8K0S/Lld8k?=
 =?us-ascii?Q?3mLCVeuc+VVzoZc=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 14:36:05.0465 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb6826ab-dc8d-4e77-7f78-08dd4784c0bb
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0815
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH v2 11/11] ARM: dts: stm32mp15: phycore and
	phyboard: Add optional interfaces
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

- stm32mp15xx-phycore-som: add NAND device on FMC interface to support
the SoM version equipped with NAND flash instead of eMMC.

- stm32mp15xx-phyboard-sargas: define pinctrl for PWM5, LTDC and DCMI
interfaces used on phyBOARD-Sargas. Those interfaces are not enabled by
default as PHYTEC displays and PHYTEC cameras are enabled and configured
throught device tree overlays.
PWM5 is used for LCD backlight command.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 .../dts/st/stm32mp15xx-phyboard-sargas.dtsi   | 23 +++++++++++++++++++
 .../boot/dts/st/stm32mp15xx-phycore-som.dtsi  | 16 +++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
index d55a838683c1..4e091daacc22 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
@@ -261,3 +261,26 @@ &usbphyc_port0 {
 &usbphyc_port1 {
 	phy-supply = <&vdd_usb>;
 };
+
+&timers5 {
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	pwm5: pwm {
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&pwm5_pins_c>;
+		pinctrl-1 = <&pwm5_sleep_pins_c>;
+	};
+};
+
+&ltdc {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&ltdc_pins_f>;
+	pinctrl-1 = <&ltdc_sleep_pins_f>;
+};
+
+&dcmi {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&dcmi_pins_d>;
+	pinctrl-1 = <&dcmi_sleep_pins_d>;
+};
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
index 0689967b8c56..23db635c39a1 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
@@ -345,3 +345,19 @@ &sdmmc2 {
 	st,neg-edge;
 	status = "disabled";
 };
+
+&fmc {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&fmc_pins_a>;
+	pinctrl-1 = <&fmc_sleep_pins_a>;
+	status = "disabled";
+
+	nand-controller@4,0 {
+		nand0: nand@0 {
+			reg = <0>;
+			nand-on-flash-bbt;
+			nand-ecc-strength = <4>;
+			nand-ecc-step-size = <512>;
+		};
+	};
+};
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
