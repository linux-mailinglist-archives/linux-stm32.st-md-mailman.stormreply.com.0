Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CFEA48333
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 16:40:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2808C7A851;
	Thu, 27 Feb 2025 15:40:21 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2104.outbound.protection.outlook.com [40.107.105.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C37AC7A84E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 15:40:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UC5G+KYDctD/d9ZusShTEz+n9wCy9K79a7jqbrH9A6T8ANrKivf4kCL+CDKXD69rk4C69iuyDrZGL4WZSiLP+EUoiklk8ESfVMlhWCzjtMlJ+y2sbDTwryuDTeBBwr9U/NIJl81zg5G6XHzs7EHvjCx0+uGOc4yM2WdkEbhUAilrroxzTW0SqidyaJLEKU6yX9v6F1j8ZLY31ySwtp5YDi5W3HFDhm1bg9lto+cj2zA76Mc9OHYlGEeLRCqJBYeWAx2YJX7LxWwU8cM8+A/HuNkY0/vzZk964RN24QvK4gI35M9+N3ekHroMj4Ibxd/aH0sereym9HDRmxlInKkxPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlkBo13gAAMFxY69YUO/r2kEBTxBz8AgO2heyKDlsH0=;
 b=cxN+QjGfcv6V2a/nEyyY6H4isyyye8aKiCAxlrgPVQBCLtmgUKiqz/3yajsY7sQc+ax9U/P2IJFnjwVT9Xz5z58YGmlcJXB8wKrbQfiMEgTD4HGx6X0A/DX9gWnFx6ZZfTrw45VvQ5apUTUKDrU4KRgB31mJ1ILtLWKLjbS0nFDNKkubhuCUVtPiY/rUK7LySEXRCeUBCgFtdLBLe1js05bxwkyYgyQFTRGEZMWQ3iv4LBOnuyTcS5YAH9Bf2W0W2DBJAEO/dghPHy2808xSPTv6kw+1RfE93skbKkM3rmstE63x6sQNGKBrxCPn0dHEyIfG9ttQieGSsngvmL9VsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlkBo13gAAMFxY69YUO/r2kEBTxBz8AgO2heyKDlsH0=;
 b=sfwcRV5N5WZtlLnLpkZ/BAmNGVYUQ6E2a9C8nzFX+yWpbo4rL8ELOSjpR0s3MHwOX5VdXrQ2pO/jezFCyXgOXY8x+D19zIC22mxt3aEKAKlIJzGm7G195rwG0sR6WrcZGUtY7qc6QcwRMSkCiS3/4CLjnBPmlyrc2u7jDsMxft4=
Received: from CWLP123CA0086.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5b::26)
 by DB8P195MB0677.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:151::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 15:40:17 +0000
Received: from AM2PEPF0001C70E.eurprd05.prod.outlook.com
 (2603:10a6:401:5b:cafe::78) by CWLP123CA0086.outlook.office365.com
 (2603:10a6:401:5b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.21 via Frontend Transport; Thu,
 27 Feb 2025 15:40:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AM2PEPF0001C70E.mail.protection.outlook.com (10.167.16.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 15:40:17 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 27 Feb
 2025 16:40:16 +0100
Received: from Florix.phytec.de (172.25.0.13) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 27 Feb
 2025 16:40:16 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.13) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 27 Feb 2025 16:40:16 +0100
Received: from localhost.localdomain ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025022716401639-90 ; Thu, 27 Feb 2025 16:40:16 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 27 Feb 2025 16:40:08 +0100
Message-ID: <20250227154012.259566-8-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227154012.259566-1-c.parant@phytec.fr>
References: <20250227154012.259566-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 27.02.2025 16:40:16,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 27.02.2025 16:40:16
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70E:EE_|DB8P195MB0677:EE_
X-MS-Office365-Filtering-Correlation-Id: d1aa5a89-598e-49d2-622c-08dd57450934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Aojs5x7NVBRHhKVRfKuWRHNy7Hy2a/P44a42NSTXH3w/6+8l5y9je5FM6ldf?=
 =?us-ascii?Q?Ttae+Rfn+ttRL9Tr4QFqqBEjZwq5Q2UJANUpmJ5M/9L5h+MrnnNne/iM9ZW1?=
 =?us-ascii?Q?gnp7EIWWS6wIjIadq2OSTgqxeZZlHvbz1e0i5LKoCkW26UewUlcd23vH3IyN?=
 =?us-ascii?Q?TEZv3OsS27wgBLIvO5Mr/y8EfKMIEFu5OxDy2Fb61TUFU+I0/jne5LGolKPy?=
 =?us-ascii?Q?KWKrWNEqbVhQNE1AC/HzPKaDt2ATNpH0cPlhU+O9nRPbvUGPX1S4kCjW0Wi3?=
 =?us-ascii?Q?zX7SoUkuX7y4GVh2BX0tx3bRoPxLn+ksR9rAI4j2k8lRwFYYbG5bB7/V87cs?=
 =?us-ascii?Q?O6aepL+1kEPQTQdhfrMbUFmMn/tkb6wfufEdA7uHDBihG1cL/ad0j2LxML9X?=
 =?us-ascii?Q?JphlgDfoTF2WpKieU7c1nd9+5uOhWcutlbZJELiOsAEtUWaxR30OABAPGNVE?=
 =?us-ascii?Q?AR9Im+Ram8NZq6QWatGYlcJseUBqNMyyp962719fEvxHu/KRZH+KkzjcGo7q?=
 =?us-ascii?Q?y5mJzZhoWkdC+HPkPDes0q3zOj2kEyQYDYiWJjc53+UxotaxZeJJEpGjDNu2?=
 =?us-ascii?Q?RJEfegHe0A2skW4CA1A1NdZ1/+X68/wGXoDuar5HNYhhExx/WTFxen0CfNAr?=
 =?us-ascii?Q?PE48vIDXurkBpDLBOScbo4P9KQrrw17Lkx1FV1X6dd/rTaHfATKQrKXdIiq9?=
 =?us-ascii?Q?yrF4I2UwBkUcJj35Gx+YwbWLbHDOAOC2j0/gx189cWRxM1SNDkoMCTQ9MAN2?=
 =?us-ascii?Q?wCFy/gvxO44/e/slmCO3dC1qi6MrHomfevPN/IDokcVFCdEcxm64i/VKshkS?=
 =?us-ascii?Q?OV2j6XP65qJqbAjG7TPefa+S7BFohRNgDL0Zd6aC93p4GSWtSdQagWZBBBp4?=
 =?us-ascii?Q?SHptUl+nf75RY5/MFQVPaGz7xNvOVwYElOgb5fVnmvmfbRWWpLoqCTUjCpPa?=
 =?us-ascii?Q?/1W9p6en39YVAJDTGXdKfbrYDu6ih7ZEh5CsKASVXc/ELB0yQ7dgfMt0CYjF?=
 =?us-ascii?Q?dzLD89jPpnxdiKTr6YFjxss5jxOGyVLHEamPAJPbWVvMVYWyMXqOwUSoc4AF?=
 =?us-ascii?Q?wNdEybdRXa4KIPdRT/NWqOiCcP8McK066ySnCaNvIQF9k+GG/5pIc/P5ECau?=
 =?us-ascii?Q?9TlsMEUErXVK6r/aJKHbQ42VdLKuoVkdYy+yvseFUi3QPA3oDBcQQ4TErtYs?=
 =?us-ascii?Q?sRlxJwUa4RSdd9qrcfhkS3yQ6eQH4OaofhRLRpQcpaDjiho5wCI7z0IFMeCc?=
 =?us-ascii?Q?r9vKfXx/QjmG6VNl5Xl36JlEkDz7Tom9PNlr1SPkD5uoRRiG2hYAR96k3iGq?=
 =?us-ascii?Q?uw7TO/Cad8SA35l3hKf544VYwgZOAkfbn3rNaqXBx8q6Ohob8eD8EqUXM/q9?=
 =?us-ascii?Q?ziwhBobyz2lhK03jrK1Wa1B769Vo1ZHBhzGh35nCEblAiDYHQvW9rA1+y/3W?=
 =?us-ascii?Q?42jazPogXZoW+80rD/vyFHrnOOqgSXRzEqPbad8LKmM6uDfbUOQFMw=3D=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 15:40:17.4797 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1aa5a89-598e-49d2-622c-08dd57450934
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P195MB0677
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [Linux-stm32] [PATCH 07/11] ARM: dts: stm32: phycore-stm32mp15: Add
	dummy memory-node
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

"memory" node is not necessary as the bootloader is taking care of
passing the correct DDR size.
However keep a dummy memory node with the minimum DDR size (512MB) with
comment explaining that.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
index 72926c3de52c..ce859b94ae26 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
@@ -22,6 +22,15 @@ aliases {
 		rtc1 = &rtc;
 	};
 
+	/*
+	 * Set the minimum memory size here and
+	 * let the bootloader set the real size.
+	 */
+	memory@c0000000 {
+		device_type = "memory";
+		reg = <0xc0000000 0x20000000>;
+	};
+
 	reserved-memory {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
