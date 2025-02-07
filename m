Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3167A2C599
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Feb 2025 15:36:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 883F6C78F8F;
	Fri,  7 Feb 2025 14:36:04 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2131.outbound.protection.outlook.com [40.107.241.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C045C78F8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Feb 2025 14:36:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sF+l1HDYmtQ/+UwG7pq+8Af5aBisOfoYWjTUWdLe6Zys7tIlMiztBr3HmKTXtqoIeqGDrtvFKqJiUTG2iVYOIRzJkW6MLVYu0cBIJetj9zk1ZPFzXayfy6hfycYxUdwAR8e8xcoDQln19xed4PdccOFNVTStaiijDvqXkKsGWyWyUt9/V7hUiv7Vpkg+m5tkFVxmvXWsX0thseS0B4YWbAnH1HmhE0VD2u/UJ84ALQGX8XLXdvkcvbRV+zW/vXfY/hGfWINrx2BzWQHg4mNdeKaeColnfLrgZanzITQwuySdQjlGH0JPDtAu0V2S+q7rvPvDC74ooPiRQH+K65mPkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GQP4wRF0C9Ayuoe88iWNVNtaLSpaAhjrkZfGNetWnY=;
 b=x4jCmPEymALg0d+tXyMWJPvj7FV7HeOG4RABjw1s1jVOgqozkhOmonfLNHtMM4EbcipCAtux0XLA1OQMsarhewnkEZtoDcGB8LlVq9wIcQW4V8voh5kZVa/dRsLjDSbBv68B3SyJDZJjD955fhMeEeqICCTHvTwFxdyz86PJcU97lCeJNtxgcHd4OChFEPBwITlW56v6UDKMMZHklIx8K9qJayM9zVuuZGRRKfgdXj2wMss+5djKxz9/gX34ZXHgaQjrBnoGTHv/B0WmZS07hdPvBrshNOll3TxrES4tX7OKexON1q043SkuLSpo+cTuUblXsZCoh1M85NxoCRJpLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=phytec.fr; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.fr; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GQP4wRF0C9Ayuoe88iWNVNtaLSpaAhjrkZfGNetWnY=;
 b=hNCzPYuVUNzO/qA++Rvq5SeByneRERXxmoae4vExKF/aMZTOByBnMwLBbHaGUvdUxsechKbQGdBEzGEHISqaQJAjycJ/E/0iLC8yhHtMrzQjPpwUl9UauHDeezKC9QYbq5qJCSzTxXpj1VWqimkU+bm99YjC/V70udJeMJJgvv8=
Received: from DB6PR0301CA0087.eurprd03.prod.outlook.com (2603:10a6:6:30::34)
 by DB8P195MB0486.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Fri, 7 Feb
 2025 14:36:00 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:6:30:cafe::f2) by DB6PR0301CA0087.outlook.office365.com
 (2603:10a6:6:30::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.29 via Frontend Transport; Fri,
 7 Feb 2025 14:36:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 14:36:00 +0000
Received: from Diagnostix.phytec.de (172.25.0.14) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 7 Feb
 2025 15:35:52 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 7 Feb 2025 15:35:52 +0100
Received: from pc.. ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025020715355229-63 ; Fri, 7 Feb 2025 15:35:52 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 7 Feb 2025 15:35:45 +0100
Message-ID: <20250207143550.432541-7-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207143550.432541-1-c.parant@phytec.fr>
References: <20250207143550.432541-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 07.02.2025 15:35:52,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 07.02.2025 15:35:52
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C6:EE_|DB8P195MB0486:EE_
X-MS-Office365-Filtering-Correlation-Id: 993897f3-221f-4c08-ec90-08dd4784be00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mKSsDFkEoqYbJoc6f//wWuG1yZOiWSGH0ZWh8OVu+xJwqSrxnj5llyXBL+h6?=
 =?us-ascii?Q?MEdTnWzKO2MoPOeNlLWLoSm5Z2c2IL98w4vC0bL55FxvolC99ItsD/8pRzFu?=
 =?us-ascii?Q?yV1th4OpcFEAA3DsCR8zuysiQg19k02IgD4NxADBlGqQVIwgd3uKGWnxXt03?=
 =?us-ascii?Q?SPW55lJViz9EwnnWdng5b4mtXNYB/Z9tVTW/42/eDuI6tqwupZ9BV++0U+sh?=
 =?us-ascii?Q?r35DZ/qARw4iAWTMOghG+4cNMwmbILrbmjhczHhGDAtWPZ43Ui3UV1AnKsIL?=
 =?us-ascii?Q?4FFnXMbiGghdoaAuBGayl4cfFpkCKssgbOenp9ibB4UAm//95uadg5Tn2LgW?=
 =?us-ascii?Q?Kt+WAZWZU751SMJkawqhVS7hySh4wEcoryWzuIYggvZSaEiGl8Y9rcNZ29y3?=
 =?us-ascii?Q?kRSYeK77AEKyJqslHofT4TxxQpHO7Dxc5y9dWHPmfhgo2qLf3kZPmetVil7H?=
 =?us-ascii?Q?HOy1rofAEbUV2+NYJUOsRIyfKJ2Y0GdNn49+Jd/w+gSx/HIYs0ijZLyNcRN/?=
 =?us-ascii?Q?EDBk5+cFrwGsYOvL6whnKtLFkeqmsn6UjAsuempGtTjuX38BR0ONC0RXj1OC?=
 =?us-ascii?Q?UhuUfYAoaVdojWCud0OV4iC/rOH1UHLWYLwVoZT91aseoFNbYqpCQxUyUk4l?=
 =?us-ascii?Q?YVzqIQcCFtiO7IRLXR8KYVJ2qQOpTe9N1k6Gs7c1Pr7uPQl43okL5j9T0OgB?=
 =?us-ascii?Q?GeNMd90iEmsy/IrjYRXgWukCS8mMGAhp7q+pw7Pw0yg1qJ/0JR3f9pDVSblQ?=
 =?us-ascii?Q?N80hLTRdYrancYQDq/xs8IqPzRbX6E6sRPhhJGXa3e9jjnlS5TVpSTgOR6J3?=
 =?us-ascii?Q?3XsqAw8EYiS/r4KhUd8UF5wAWrV26SGiO0wPJDm6iukK04A+W9K31Ik2lqOh?=
 =?us-ascii?Q?FYtmbHu7MSrIxuTTmxhh2tnXxBuFSN2pR7cPJahJSrg8rUlBNLHoUenjfNje?=
 =?us-ascii?Q?INQVQYOlhbRc5PHjUyFIJL7ICiPvP3zBfEKR5RLqEpr9hfOkfV+WhfF7m90O?=
 =?us-ascii?Q?OrKOukZRPUPzA34Jl+LQPQ3+qhjyNzPy9X6G/Eslx25Dk7BUYqFD1iMrXvS9?=
 =?us-ascii?Q?3hpNdhKJox4ma8CTAgT049+VRyNwpld71XDm885k3S5wsz3MR+PhSZ6ynOBT?=
 =?us-ascii?Q?w3+Bk41Oy1kGLQ8Bp5iZs8uJwuLMenmMHATIWYwSDwY1qL28tLpUyAjbEUX6?=
 =?us-ascii?Q?1Bt2ow5c84Ms9xdDm3635Q47ve2zwhYe9kYHqtWh9eJJj0KFqeZ5qFt85OTI?=
 =?us-ascii?Q?jy4rBFVvFEKlMzKoKPorGs7f8HLTIbfj3/Ke1rfeSvhuOP0JQAFUNLpAa3Fr?=
 =?us-ascii?Q?fWRR+DhfZi5o0iiok+CVcE8t49iHHOz8+rLjAPrvgFvTuueWvOrXkM4RA6j0?=
 =?us-ascii?Q?VD44Bxpnd+cNjYeTOiHmj1Lkj61v3xPzW3vc3Ux8oqrOaBoQf6Xh9svmU1s9?=
 =?us-ascii?Q?WSs04biTE65zllGVVxN44Vx/eBOSN+xW9lw9WdNKx2SZP0vzgmZ28eaDJ7q8?=
 =?us-ascii?Q?OozheyyPJynbUuY=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 14:36:00.4683 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 993897f3-221f-4c08-ec90-08dd4784be00
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P195MB0486
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH v2 06/11] ARM: dts: stm32mp15: phycore: qspi:
	Fix memory map and pinctrl
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

- Add missing chip select pin group in pinctrl.
- Overwrite the memory map to the Flash device size (16MB) is necessary
to avoid waste of virtual memory that will not be used.
Without this modification, qspi probe fails because of ioremap error.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
index 660cdc260963..72926c3de52c 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
@@ -290,8 +290,14 @@ &pwr_regulators {
 
 &qspi {
 	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a>;
-	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a>;
+	pinctrl-0 = <&qspi_clk_pins_a
+		     &qspi_bk1_pins_a
+		     &qspi_cs1_pins_a>;
+	pinctrl-1 = <&qspi_clk_sleep_pins_a
+		     &qspi_bk1_sleep_pins_a
+		     &qspi_cs1_sleep_pins_a>;
+	reg = <0x58003000 0x1000>,
+	      <0x70000000 0x1000000>;
 	status = "okay";
 
 	flash0: flash@0 {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
