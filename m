Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E36ACA4832F
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 16:40:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A44F2C7A84C;
	Thu, 27 Feb 2025 15:40:18 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2119.outbound.protection.outlook.com [40.107.241.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C339C78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 15:40:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wEQllIyRdANxQNueQPF0kNT6tlftvErL+j41nx6GrcKA39HVsq98UewZpx+zWlBt5zwFYTK43Vh45yr23eicJOuHRU3xHKkOVEk7CkZww7BHwVM3w8o6MMQw6w7LI9n/oy5RypTMFC6QSSvatg6jTs1S5y/O/bDTwcenUvE5Z906YGq/YFoZFEsBaw2E6RoY0oI0/eXgBNaNkACX+cduXy0tW9+37B4LdFZq5w5wh2UoH8iooy23+o1/+pIsTHTkr9EZ7qM9aSjl2/PEfBb5G2EeWhQT9W8IJwzgVg28ecN58lgMivZRPSM/hHoaGiJ4Eoml1xkDAMNpvC3Kz3ajRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxzwLVrrw+kPA6VXI91oJrzdavPUFWWsU/19Ehqxjp8=;
 b=HDxZkbZGcogNPT8dA1+WcaJPMAGIiA0pVnCwwKqG8YbkAHu3u9xavF7WX91vJhbnt0qWoT+gQbmIKT0zm18dg4R51Csbn5+lZeZ4hrpvEEverOjjvBXAGw1quPBByVyMcioA/eXH5Twb3io3EL2tRMJt3cJlJScOQ8MlGf5pag+Kg2iF3ZAfIJZ10Bv+pTURxx9xYRiz0gxqeb69VXRQznYRRh6nLllmAX6gfkscoSGJlT7LUgMZHYJtPDFyzcRyzX/NgMhCvQEyhMAxFnmqEFLfCZ66Oc+5OdIAAFKJAcUvgXWoQC2JQzTojQIGt5XNDQMgZWEbl4uyWNr77lmRnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxzwLVrrw+kPA6VXI91oJrzdavPUFWWsU/19Ehqxjp8=;
 b=nePNAK1SUC5DQrIVf0a2PCNVxFN6W/kQ8UGEV+MSjAJ1iIE5GqDsiqOb+PJO5zifspuTvi/RW9v/OZv6Iw9ZKs2VbQJ4xP1Xrc7xnNvphmpvibgLlHoeIXCnVD7LkYOZDOu2vdzr4aWOhE3ccCeyIoVf2HCFD8HpeFFfJ1u37ok=
Received: from AS4PR10CA0016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::8)
 by AM9P195MB0853.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:1ce::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Thu, 27 Feb
 2025 15:40:16 +0000
Received: from AM2PEPF0001C708.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::b3) by AS4PR10CA0016.outlook.office365.com
 (2603:10a6:20b:5d8::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.21 via Frontend Transport; Thu,
 27 Feb 2025 15:40:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AM2PEPF0001C708.mail.protection.outlook.com (10.167.16.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 15:40:16 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 27 Feb
 2025 16:40:15 +0100
Received: from Florix.phytec.de (172.25.0.13) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 27 Feb
 2025 16:40:15 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.13) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 27 Feb 2025 16:40:15 +0100
Received: from localhost.localdomain ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025022716401527-88 ; Thu, 27 Feb 2025 16:40:15 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 27 Feb 2025 16:40:06 +0100
Message-ID: <20250227154012.259566-6-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227154012.259566-1-c.parant@phytec.fr>
References: <20250227154012.259566-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 27.02.2025 16:40:15,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 27.02.2025 16:40:15
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C708:EE_|AM9P195MB0853:EE_
X-MS-Office365-Filtering-Correlation-Id: da4b68d9-fa60-4f4e-4180-08dd5745085a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x1jEERz4HRKXZMfTRHhjQnJa6KPwi8SwYogbiOs3iPMrsRMWqfI/cpSRmIrP?=
 =?us-ascii?Q?eNTcMC/Sh6Qa6YH2bED5s8llRUKOT7a1XdGXWg0NrNezFL+ITUSMqIgId1Yr?=
 =?us-ascii?Q?hVQOP72FGQrSvlspZPZQy7zI6qVGV+MzEk2pQvoL4X8OByEkLzSMH3l0Mx+v?=
 =?us-ascii?Q?58M3IxoF4U7Uc98i85soBsrOIt1aevMLT5LTx7i5MKEQRD+PbdKTA/4iZ9/K?=
 =?us-ascii?Q?XG1FthORyV0dMEcWXxiU2k/34qFbTgC3ozaS5fm5Cxl5re7lgUkOzbz9IG8d?=
 =?us-ascii?Q?wJ5DTrEpjS//fXAGo//i+N00OQlkz5B6CHpF35ANq/pj9xSJ+YzL7ZFUnpbQ?=
 =?us-ascii?Q?qIEB9nJCGYHKU7Hu4u6w0q7d3yglBNADlekiADFUFFLcQ+URz0M6sz5Pgspz?=
 =?us-ascii?Q?TmX7jlLrNqcNON/ruYtgF9xXiUTqZHGgGch1Xnc1BK4k3ptIphar+TqLWpIJ?=
 =?us-ascii?Q?EqXB/AFERp5Pvf6fGTBp+BiTlCrrbIMJ91PAB3mk+BrsCpnjGF8ihzM0E9pB?=
 =?us-ascii?Q?/WULBj9byUUoIBu4MmMsfeRtRBeDM0hVn3vgTH3OB1olQZtRPHltL8jfvMCr?=
 =?us-ascii?Q?AtdkqIU7upIpYPBPlFBOoaiemEl4m9gKXiTkkFvoO8XFfeLatBzo8csq7skj?=
 =?us-ascii?Q?hu1bIL/ASKzggmhJAvPPfSArOhIH8sKI9pXUgtR9fsb6zlLeyF38VCr0z4aO?=
 =?us-ascii?Q?4phcQCX+ZgrFvP/E+Rqv9ZmHflDLuDrRQk1JAzYKdlEY6wLoWTTjMz29qruN?=
 =?us-ascii?Q?PJj0ZUZkeHsL2aDKQzlzekbi4Ygm0PI3oerrWzpPnjW3urWLZvhY8k9OMDXh?=
 =?us-ascii?Q?eaPx0+rG7jg6Tc5+b18vpMdiEkstTVMPOIGJ7dboth3eoIPmNZo9ln7JZFJc?=
 =?us-ascii?Q?4AU7vvcwRrlP9dMbl3eM0dUtM7V56plXnQuvplIcbHZXVgKuBEmVclYWWU3p?=
 =?us-ascii?Q?Mas5ZHWHuUQ+zMMZuNAP7NeaYX5Q0EVuqzAQtO/9Rjz+yNpVGoRPK+4bHUX0?=
 =?us-ascii?Q?upH+ajA1rOcrMs9aB29Hi4AF62Ow4Gr+rFJhQLEbQB+gvKw9l6fIG0O4JkaO?=
 =?us-ascii?Q?2J8zWj9Bv8VE2Znls+mIeQsMbdIGmnhS+1hEA4tuZoiaXloLZ6s5V6GA7ue1?=
 =?us-ascii?Q?WLpDC8FsPSjjvs4vT5B8DoirQqWIjPWEfdtCJFbojhIbfNcKS2GkbhC7Q5oo?=
 =?us-ascii?Q?RcrahF0iXu1KldvYXXvtF4O3n6RoWDaAj56JX64/fr1wF5HwejhSSvbSJuK/?=
 =?us-ascii?Q?cAv8AyvPjkMa8Q6ajHf3DDRN3pcKRtryDV7F9KzXsPb9UpFy+9G40HW1ntYw?=
 =?us-ascii?Q?k6pr80crpuFEC+ExwAs+Bg/eTeVv2wqJkUNRYok+naYp5GxDsmUeTHJ47jr/?=
 =?us-ascii?Q?eZkBukUJUmslVzwBoe8fksugLm3+I5+FUVFtKcGvQ40Kuyb+mOcIsjhl8WXH?=
 =?us-ascii?Q?sym5AwQ66zyFn3WYSZsiQTnfQiGF1zmLzIgkV3GJcGG9jyhx29hoRA=3D=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 15:40:16.0658 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da4b68d9-fa60-4f4e-4180-08dd5745085a
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB0853
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [Linux-stm32] [PATCH 05/11] ARM: dts: stm32: phyboard-sargas: Fix
	uart4 and sai2 pinctrl
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
