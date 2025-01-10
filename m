Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75647A0948D
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 16:02:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 344C0C78F73;
	Fri, 10 Jan 2025 15:02:36 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2096.outbound.protection.outlook.com [40.107.22.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29949C78F73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 15:02:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVBHbZ+4nUCjRQiw+NzCJO0fby3gIO9qkEFQeZaid+gx/9ygBvTtoTyCb09vyUULi4ryulp14boOTmGAGaopJPZ9zCPLu0ELi2eR0s/oOYorKGrfdSCHCmM0eV9sNfIU/lqNa0fil/207GMZHIjZBt196ugw/Fc6OGow+8bXYnkUbLKg/jqGg/izbfR8T3Og104jUaxXeoBUMBwnitRgLAuUu/nyM2pG1QzsQUQngEgfmOc9sDD3aPfA4EkUlLoSVhXbBs92EtugnpCnRgHndBFBAtra5xZx4Rjr+80/BuAeCbe30HrfIHEjh4Mhequh8OMxy7NCBfLnTvHbKeOo1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxzwLVrrw+kPA6VXI91oJrzdavPUFWWsU/19Ehqxjp8=;
 b=GrnkMmybHwQ13CQCdbHuwIwWh/FGl23x8SRw7q3kUrI4oPOj3W3DdW7AAAa9ZKWyzlFke2qIffmOxRyPctXUTOCqRmTWNmDfXIPBJhG6TgbMVPd8Ha/6dRC8XcB3vsOhCV4cDKPq0yN8LJr4z11iK9cT4D2i1xX5zDD+1/CF7BK8F/S3XV8zWl4eQH3SqXVCpDInKjQFquTigEkR0OTduei32X+xuneMiJs6FmVDJD5AuFJfiB52krLZBSkhXUiAnYZ9/ul3HaOvFivuHiz31yYMfLnxpT22Cwm6l/fInigt8pl/SwGtN7QTQEuWgNfg4CmedgskQn0rOGFQ3XsKyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=phytec.fr; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxzwLVrrw+kPA6VXI91oJrzdavPUFWWsU/19Ehqxjp8=;
 b=aGKTf4OorfTojkrqh6hOdCb6MIgZnq2Zn8xGDJ8a11wD/UZplDxpzmPX889YfNj/akt2iL6hCP8+bf87U2krU92Zs2mErEQKXSyEOh4tQORyzatx7eps+Wud3kNI7IR3CTnoNbcM0Y72W+xxgICEQA3H8rXvi824H6m8dPblImg=
Received: from DUZP191CA0069.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::22)
 by AM9P195MB1283.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:388::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 15:02:30 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::68) by DUZP191CA0069.outlook.office365.com
 (2603:10a6:10:4fa::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.11 via Frontend Transport; Fri,
 10 Jan 2025 15:02:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 15:02:30 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 10 Jan
 2025 16:02:18 +0100
Received: from Diagnostix.phytec.de (172.25.0.14) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 10 Jan
 2025 16:02:17 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 10 Jan 2025 16:02:17 +0100
Received: from pc.. ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025011016021768-27 ; Fri, 10 Jan 2025 16:02:17 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 10 Jan 2025 16:02:10 +0100
Message-ID: <20250110150216.309760-6-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110150216.309760-1-c.parant@phytec.fr>
References: <20250110150216.309760-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 10.01.2025 16:02:17,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.01.2025 16:02:17
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8B:EE_|AM9P195MB1283:EE_
X-MS-Office365-Filtering-Correlation-Id: d62caa8a-0d2b-418a-c75a-08dd3187ce2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+ubxe0J6ZkdUK4HOUTRoTz8R4vyAgWCafAi+kOqF18SHle9okzL+J9w/K6lO?=
 =?us-ascii?Q?JHvfkEuZTIjGTco387RzyVEx2af4ycec7yc5vS8rLNVXWABIluCBIVOTx+G0?=
 =?us-ascii?Q?u1W3p1dyoPkpIlAhlfrrkymsR4DrExAD7VLrYOVKPvdf/cHWclHR3Mpb6Y67?=
 =?us-ascii?Q?4C3fLnqgiUDbRkOLP1cSYArb5NNv3RO3AzsOXvVCw1WwQem+pE7ZAIR0qcIJ?=
 =?us-ascii?Q?AsLt8bK53myHDxVV8UE4h0FNGYbECYII7Soq6J7Lk0TFuyq4wy+zNSsdzRW9?=
 =?us-ascii?Q?u3uklVnSuP3kgbs08t1lF+S5DkxEWS0/JUtfv8ofKhD3jvyiG2hNk7ijfXSS?=
 =?us-ascii?Q?KD9243DK0s2blXhfEa/rv6M8yhCPAB8n7vyvVY4ZHXpyOfT2eY6rbtFlpVZ7?=
 =?us-ascii?Q?FLhuyIWoSrShcW11YzveUHgi1Zawos6Ykzq6SM4g4txc+j4VDKEjg1rjaxWg?=
 =?us-ascii?Q?dvhAGD3wDPS4fbsUvQK/t7ztVSwletwCMeTMQQY3H+jXy1og2wU40Ib9kcxW?=
 =?us-ascii?Q?poSM8rTv6k5QV+Zxl/FRzflmS3YCUb3z/BTF/BfGGDlNpnX6gh8Me3nsosIA?=
 =?us-ascii?Q?1g9dXVyK2ehaMBZO81V/Uu+Odsaie2LKX3VKyukEbYYPPRXi5+E2hp4jsr7c?=
 =?us-ascii?Q?hX2KfZ+Vq25BvdqlUuh3Nn+XNsGT2uPlq9RkSpQ/x9T3w9+GDALGU3D4K93U?=
 =?us-ascii?Q?rumLpy1kcQ1b2gpUCErOB7LDfePal0xsT5hU9UxfKzmKnksM1EAvwXkh57fL?=
 =?us-ascii?Q?RLbPe5gnlu+FpJhoKdRskj1sqOYYci5ie+/lvXN3lxyA2HeZqgzvWGRHbk7N?=
 =?us-ascii?Q?f170tSJBz3G9SJvNSiOxwgFSZjxRzKgqg1sg1ZSz1Zvy1d8jY7URzndSqCSj?=
 =?us-ascii?Q?keQJb+U65rJvIv3m+PQphGMdlIUPwTdrehvVvk11mdlq2oZUtxKBw53B4yP/?=
 =?us-ascii?Q?ZX/VyXLTfjXwfT3bBCkkv8+EREDOAapcLlJftWtkID1p+/P1uYuYXj7jPO/U?=
 =?us-ascii?Q?Cj8T8VldVykpHWGHB7pFtRh6+dmmjw4/D3ivFJixpfHgCtWt9RdLxr9tJ9tL?=
 =?us-ascii?Q?NobbQ0Sj7S4qe1jtFuiMtXLlLpvp95GjN+ncsmjXBgQT6LaPRaQfEOHNd8Nf?=
 =?us-ascii?Q?Fcqv9TFERkhyx6CemJ/nqY5rx6B7mMfdVW4hokHx448nw2f+i6M8NRQsxDGE?=
 =?us-ascii?Q?30UBklDdO8URG1EmWl0fxVnRaIH6CipBbqO6NllYINUTvYSb00g2V6GibjAd?=
 =?us-ascii?Q?g1PSjU3t3KRPPlLnAuzRJi5tcRNqd0+6ZLlKt8uV0Nmbs2a1vctpocjjcNpv?=
 =?us-ascii?Q?ZVlqdE1sJuMHaCUAzhFpqfgFuFdCirScBv2eKU/wxL5d5fSFWMHtzSfoWf/K?=
 =?us-ascii?Q?/WJGXRp6zeueI1vjuczyCMB0HrBgOS8q8ilJwqNTixU5YNf5PpsLVlRlDNsR?=
 =?us-ascii?Q?KciealFvXmW9gB5AicDTU82gixv72mEEQ+FhQSeUdIKUvkkWtRPBcTKoWm/s?=
 =?us-ascii?Q?yKs/jEeUK2oNtwA=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 15:02:30.5215 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d62caa8a-0d2b-418a-c75a-08dd3187ce2e
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB1283
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH 05/11] ARM: dts: stm32mp15: phyboard-sargas:
	Fix uart4 and sai2 pinctrl
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

- UART4:
  "uart4_pins_a" pinmux option does not apply here, as PB9 should be
  used for UART4_TX instead of PG11 (PG11 is LCD_B3 on Sargas).
  Use "uart4_pins_e" instead.
  Also remove "pinctrl-3" which is useless (identical to "pinctrl-1").

- SAI2 A:
  "sai2a_pins_b" pinmux option does not apply here, as only PI6 is used
  for SAI2 A ("SAI2_SD_A"). Other pins of this group (PI7 and PD13) are
  not used for audio.
  Use "sai2a_sleep_pins_d" instead.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
index 2fdab99fc562..564b2607bb9d 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
@@ -143,8 +143,8 @@ &sai2 {
 	clocks = <&rcc SAI2>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
 	clock-names = "pclk", "x8k", "x11k";
 	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&sai2a_pins_b>, <&sai2b_pins_d>;
-	pinctrl-1 = <&sai2a_sleep_pins_b>, <&sai2b_sleep_pins_d>;
+	pinctrl-0 = <&sai2a_pins_d>, <&sai2b_pins_d>;
+	pinctrl-1 = <&sai2a_sleep_pins_d>, <&sai2b_sleep_pins_d>;
 	status = "okay";
 };
 
@@ -202,10 +202,9 @@ &spi1 {
 
 &uart4 {
 	pinctrl-names = "default", "sleep", "idle";
-	pinctrl-0 = <&uart4_pins_a>;
-	pinctrl-1 = <&uart4_sleep_pins_a>;
-	pinctrl-2 = <&uart4_idle_pins_a>;
-	pinctrl-3 = <&uart4_pins_a>;
+	pinctrl-0 = <&uart4_pins_e>;
+	pinctrl-1 = <&uart4_sleep_pins_e>;
+	pinctrl-2 = <&uart4_idle_pins_e>;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
