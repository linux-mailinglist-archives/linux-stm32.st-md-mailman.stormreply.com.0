Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B47BCA09495
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 16:02:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E982C78F75;
	Fri, 10 Jan 2025 15:02:54 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2116.outbound.protection.outlook.com [40.107.104.116])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7279AC78F71
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 15:02:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IpBh1qEm7I4eD+KIyVlhE6bfn7/om4qK0QW4A+Fj9MnbRTYp9Mtdnqz4j6vERc7/AkCI/OJvbKzT6q7/pP9jUk3mqLpchK/m6CGIingcH+zchh8y55hYCstUbq4zaZnyy9uxkTbnSbr0klTWdvQzMlX4zE/qMEfIUMABrFyrnJQMjJwWY1CTx14enYpFDfcMdAtdkzx3tOsisrAFzq+Z86aF+X0xy4TdSg8009Z484YZMkrfsXZL9SgKRQ3Yq90Xq6n2NNKg2md/X8igq/5XNXk15yZ7MioHu1zKBt7Mk0fVZFCUyl++J2glJO6z9XvGM7MXHByzwI5hoKBTnyi7oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XF7Y/gUpZDKo4afF/NEy2SsFnRBtaE0iHQrt+F1Dhhs=;
 b=LGj4By6mYFU2fJC6G5qx46+EXc8nYYNP5htEWMtUKrSszDSumpbUXetEeEIQ1OciZOWujLeGr3TTsWtBD18WDWmGUiRR5GDabckcAunaZ6dmvwh6edwWYk/lonqEQSFzmL5tzHzCNsh6eIo6pym/qs+Wpx5EEJU7PjFVVgitDNFLaCBE/20ZXyEm+zoheQT9IiU3jBbm+C5Udj2/XUAGfIyDdpZOInJ6D0jg+0959vl3sLkV8K10t+ppDX50s6s8stS0VJ44sK+AUNeLr88pETdVa5Mykg/mgAkae0pI1LFddFt3hUzjPcIbcMTKWvYIgPyNv7CfkZncwsXt3LFC9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=phytec.fr; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XF7Y/gUpZDKo4afF/NEy2SsFnRBtaE0iHQrt+F1Dhhs=;
 b=T92ThfZEhEeRM1+PPFDzuNI3MVRvL4firrxZzNXJPqSSFiHKa9YpcDW9r6MJC1QIyZZXOB2LWmCPw1QPznOuMBWr4ehttbB9cDnOwxJLixPyft38K+/FwHY+9vaKjeRlBwXfHjw7f0oyqY2GZhGcBZayfuFpuBaXO18LSaWmLbo=
Received: from DU7P190CA0017.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::24)
 by PA1P195MB2536.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:467::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 15:02:50 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:550:cafe::31) by DU7P190CA0017.outlook.office365.com
 (2603:10a6:10:550::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.13 via Frontend Transport; Fri,
 10 Jan 2025 15:02:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 15:02:50 +0000
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
 with ESMTP id 2025011016021917-33 ; Fri, 10 Jan 2025 16:02:19 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 10 Jan 2025 16:02:16 +0100
Message-ID: <20250110150216.309760-12-c.parant@phytec.fr>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8D:EE_|PA1P195MB2536:EE_
X-MS-Office365-Filtering-Correlation-Id: bbec30d7-109e-497c-d0e7-08dd3187d9e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jGB+JDuYQ6JOO4uUNw/FUhRhOi7r8ci9rBF7lGoeoNdckcdy5/Hr74r77fNP?=
 =?us-ascii?Q?NfpdAocUvXo1zTOUnF4BOM0n5PsZR0j5hi42UVeGsdbylNuCtwCoZTAj1Oz+?=
 =?us-ascii?Q?CQBZVBz8MWPFSbldQNwYBW8ojRQ8325bAUTUfuLxTolzsQJodL4w/Dgyzppt?=
 =?us-ascii?Q?TUa99aTofh8M2iuK4LzmrW7sC9QoTTeJV34baDmeD+nXaveQyZAfKmXFA6WN?=
 =?us-ascii?Q?I/x0/OH+lORoYDhn0MTU932q+z1+x/bWsNUI7AEdFgDTlSMIbHe+EJLNViSO?=
 =?us-ascii?Q?GsNzpmHyX1/HDw2ByC/9QO/bKGmveWROpQ4uvhgpfp8+PH2IKKxTM+NF/0Yn?=
 =?us-ascii?Q?oZr+E3e7dlG6aluDmqWrYl5m5MlZZ6sHtmgK0txcRxF33fXAsHSWbDEpA3oe?=
 =?us-ascii?Q?9aZOxZftsu6vtCOyInmZVC1PyWCjJTXghJuXSczxe8bDqUd+3F0YYCT6kuAn?=
 =?us-ascii?Q?BLF3k+bcrlrfw38lNPY9VDrVJVo3iv3sGf0Em76lHMHbeoNCR7zZCgB/+beC?=
 =?us-ascii?Q?2vBxEuq8jyCO9lhBsEkfsSPTAzn2jj0khzByrkCR239sdgVXxrIRrVE+tCYa?=
 =?us-ascii?Q?SpTN7QBwR42T4dk1koARQhuRkmI2paU6e51nQqrGubg6pxAR54YhnkF8Y9RO?=
 =?us-ascii?Q?XPIO3favtFakN/0I6v844uNqPy7TSMaVFxHMXpeiaoUUY/T7SRCODrq9llhv?=
 =?us-ascii?Q?c4we1YyfdHPBno02BrSiUKJd3o70+BLShsr+iMULCkEJcR2rciEFNLHhLwlA?=
 =?us-ascii?Q?ysAOQ5ll5mfSaY/bQFLgn/h9g3eLwyqoJT0d7d5r6nHKf7FAdQLesXD+iGjV?=
 =?us-ascii?Q?fNXBNIVkRIT0RB0zCQBNMKGfmpMcgsssCkpaJoAWm5xJckvsgzHhY0gQ49JM?=
 =?us-ascii?Q?lOsONUOt9xcl5yoYiBY43gYceFFuqwIOKe6dJM1Jfi0avzkxhfZhffSypp+l?=
 =?us-ascii?Q?+e8c/gx6sF33uzRwq5C05UmjnQvMeVAoMJMLKTXtnMOikQ24klJl1Lh47q5O?=
 =?us-ascii?Q?8COQz7nd9rk5LqhVUrTkoZI9tluDIwtm7SM0QnX+wxtjtXDnstoQsOYIe43a?=
 =?us-ascii?Q?v/8Dd1AUXFbdHDa6qEMNbhjNE0G+rxVO41+Sk9Ow4pz4tXv2jx1UOtiyUELz?=
 =?us-ascii?Q?M62jUAmkVEHC96qgEYwG07e5TzDsUjCRMHo4cvTUXcI0IQJSzZ3evDm3RzFR?=
 =?us-ascii?Q?s91fmkiyRqZG2gzB65kkp6WvIHDPS4GjMv8v0/BSgrEH9psPI6jJ+v+xjf0F?=
 =?us-ascii?Q?fJvn5hSjr5feflIbd8gPJs5KNU0M2Tccm5mDrdvaF+8OtCYVX6hz77werVKF?=
 =?us-ascii?Q?PoJABWxsQUYOkQYYY4juDIBU9EUe4IxyoqzimkXchx2L/80QXD1qvsZ1OALW?=
 =?us-ascii?Q?ww7sCh74POuZIqU7xOnzpydaMOgKzHsc/N0EUvCL2iPT033XyJ/5RMVNhdhQ?=
 =?us-ascii?Q?bdmf0QC1mPPxQ9FFEO/dMdS7D0YH9bQUXA1ZblWUXApH7mX9ERb2OFiYsxBs?=
 =?us-ascii?Q?YDxPktGL0aEAHPg=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 15:02:50.1825 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbec30d7-109e-497c-d0e7-08dd3187d9e6
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P195MB2536
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH 11/11] ARM: dts: stm32mp15: phycore and
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
index 44cf3b5577af..cc4bb93c69d3 100644
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
index 586c93733933..2c599d4f08a9 100644
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
