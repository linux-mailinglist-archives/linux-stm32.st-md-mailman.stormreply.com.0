Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B59CB2A60
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Dec 2025 11:16:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8962FC5F1FE;
	Wed, 10 Dec 2025 10:16:18 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11022116.outbound.protection.outlook.com
 [52.101.66.116])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8131FC5F1FA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Dec 2025 10:16:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcSYg+geZY6m63OG4ldP2+umY8CkIdouNGYSmpykCAhMGepjfqd7PEJTwLsoIvdEjxiseIR+lzjoUNMC9gbPKM1wu78U10HCWwLUwEJhkZXIrVDB4wJF9LvcPDC5De6Pv/lvsp+du6CZP63IPku+GWK2jRQm9IkNZmB4eZMrjKjrFx2hnNCSgy3T+PaS12O1CbENW8SOQy+hP003lyCrfoTDeKWXudSbNsJRUJt0VWAdas+6hGp3u+hs68N5+DP/PizlZtm0TjSGiWJOHLkUCRhaz2ZAvmMZbuesdoKNDJbPZa4O59TtDRm6UAc1+AWDSC1VkB2kkoU1PEw5kSfvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+04es0m6ApEgTx7oicnrSBXGMamroZDVNqZl5wmGJh8=;
 b=d5s7i6Qh9wjEEm7cWJtfDAuqUBZfBSTktJ55BZ1/8v5C6WDIuivIpbUo8s9OhbDnxDC8xaveTeFVWWFrMXbnkzrii/QIq9qr0rKGKgMWZ9HkhG3LwW2mTxEFaaawQEKexFhBP2XMeOoFtm4Wv6WoJBRjzXBVsdHxbW7g6xb+Cl6n4Yz2PcQaBD8fkRPHKY+ZjaifOBAvfG6LbD3Kfqq0FPHAFhDdMifGiddQa0QHmFZIKF1Yc2oE7ZX3VN8OWfRdcvm2tiP+VfO3SbVdEflNEwXKDZxwxRKbe99JNXIe3tbvins2kuX7evAbrC81pJeoBhjj7jzuQyk04M/ECmc5rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+04es0m6ApEgTx7oicnrSBXGMamroZDVNqZl5wmGJh8=;
 b=DYxumWJf4IO/CPfXBEX5MDAF6Hw4t6/LbUp68hxf2bOcqErkTUhuBqW4uWEDZOptn1eBEUrSEYHrHD8P9e9VEKF4Te3hN37TMGKLKphxpiP169e44zvbcG/J7+HM/z5FPZrKIW5qGv3Aw3BpOQijCvmtPnm8CCJC/N02CQy7PbE=
Received: from DB9PR01CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::9) by PAWP195MB2606.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:46a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 10:16:13 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::d9) by DB9PR01CA0004.outlook.office365.com
 (2603:10a6:10:1d8::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Wed,
 10 Dec 2025 10:16:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 10 Dec 2025 10:16:12 +0000
Received: from Postix.phytec.de (172.25.0.11) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 10 Dec
 2025 11:16:12 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.11) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Wed, 10 Dec 2025 11:16:12 +0100
Received: from pc.home ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025121011161222-310 ; Wed, 10 Dec 2025 11:16:12 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 10 Dec 2025 11:16:01 +0100
Message-ID: <20251210101611.27008-2-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251210101611.27008-1-c.parant@phytec.fr>
References: <20251210101611.27008-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 10.12.2025 11:16:12,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.12.2025 11:16:12
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D09:EE_|PAWP195MB2606:EE_
X-MS-Office365-Filtering-Correlation-Id: ea15f9f6-f59e-4cdd-f4ea-08de37d5258a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MgkipbyAIDJgR1eAbJvVJV1WKjsvM+hKQnQJzI9BmlweOyBx2lrp29YRgqWD?=
 =?us-ascii?Q?kCPINNczKVH3ZjD/tzauJkU8tMXmAHalPB/eJAhbBYjS8GU4hbTrYPzZmYPY?=
 =?us-ascii?Q?B5HfFSU/LEA3ydswKY9g2jgjgz2fv9ExLzqWEwIVnUG7PXbPMRcVOOwKXSOj?=
 =?us-ascii?Q?S0K4lEEUXBZfAPOabXV8n3Yl269FNxqCW8kiqeaxIuG/DO0a7cqaIKgzRKPM?=
 =?us-ascii?Q?u0JXyMus1C4mYntUU4XAGX289vRsky3PlYPdnelkqz0QUqmUVOJvzX6+Lxu7?=
 =?us-ascii?Q?OWTq2voq33qOlXtFEAfMqRJfYEkn7u/lD9G/eJyXg4xQI+JXdNfhiPfWhxLS?=
 =?us-ascii?Q?iOpoTg7QxCqS9o9C2gACSHp3czEzvRfVZu4Jw/y1pmKzsPUcB+WBrNN89tFz?=
 =?us-ascii?Q?qCMltL6ltMpmWPzgPwb35Jr2Ft2+iNNQhxEBPfsjbwmkK8LogsHPvMac2mNw?=
 =?us-ascii?Q?dAJjlTd6eKrFeQ5yLjz5i3sC4nOI/EKO5zVkH6qdeJM0iQjCUEiNtNKMzZOv?=
 =?us-ascii?Q?oA8QYJlzzzAcuoJAX2PukQ60d8MPoF+VkrUBo8Zp/mX8B27fABdHC1TBYTNp?=
 =?us-ascii?Q?YHSo8tTjNWtYnOMtWOtBtfAm+sG4U6q8n6KLzgFyl7JqDIe5NhvyD+gj5VCy?=
 =?us-ascii?Q?rZK2eCtGmN4ShVhWXlhReUHEykiD6P8dVKuVZu1nvJIfXGBrV+SXL4ZjHdQI?=
 =?us-ascii?Q?0mYwmawZeJ/l7mwBhK5DnPecukQWy7ae/0d98N2odVF6YuV3buNk5PNbchku?=
 =?us-ascii?Q?R6t+wtp0k1XrBRsaI3lvZk/TXRj+ECqFltPVPLZopzr0mEPQsM8FJ4UZyHyf?=
 =?us-ascii?Q?bpkEYChlfVPT0E/lUhewiwEbW6uDX+TTRCmJIK1r1rzzH9flVA2iHOQKblFZ?=
 =?us-ascii?Q?xLR0BbjXiUr+CRPODxIG98LHnLYDj6Mofw4jCtcuc4ohxMNudfoq81diPt17?=
 =?us-ascii?Q?anR1DaxGnYVGaq572fz6S9MD8A/UHaDvLDMcV+5qZPDkSZ4BSw3/EjUA3jFN?=
 =?us-ascii?Q?OSRJf9Hkm9x393dqbmCQRNx0nCoya/rydsZjBOOFjATqlIGAAarrda7i5UlQ?=
 =?us-ascii?Q?erYyCuyyW0VN5g4/HUkCYcNSbdOl0/3p3CfXBqO1D0HP+B+wyjjkxBh3dP5O?=
 =?us-ascii?Q?bQ6ng8K+xkYBjYzUsaKa9oFwTHZV+y8LmuR2HCFCiyq7HdJyEgad5RdZtZcq?=
 =?us-ascii?Q?Ii1d1sKFtaieFkmgAibKos/nOdRoNglV3IcZ4755zkNi0jhsBm/zOqtlU48t?=
 =?us-ascii?Q?hXmVEg3yKTeMQp7T7XzBoGmBp/tSCK1FnAR/uvo3J5S0g3kfbqORx73bqySN?=
 =?us-ascii?Q?DjrtCnT5m6frjs2hf0Jpu3wGTx1yd8U7pzzqNpRQgVn/kMGRhD52xq66XgoB?=
 =?us-ascii?Q?c9LkjGLWhPlDDVc/0lQiAeIgxDDnTkPmsdltKI3Q2MQn6XN9ygJatdGECdwI?=
 =?us-ascii?Q?a17/bwqYaNR+VgaxfU1bFmBalGHiVW0uEQ2icBzUGasaeaZppe0QZu5WrbQz?=
 =?us-ascii?Q?Dq+7Ol686SwB+95ErgxJrE8OlWmMe+e8xrzMDoNVrT2/y2W1WEEOhVoJsJde?=
 =?us-ascii?Q?wAjq/1Zf6eRRdaljcSM=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:Postix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 10:16:12.9880 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea15f9f6-f59e-4cdd-f4ea-08de37d5258a
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP195MB2606
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [Linux-stm32] [PATCH RESEND v2 01/11] ARM: dts: stm32:
	phycore-stm32mp15: Rename device tree files
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

Rename "stm32mp157c-phycore-*" device tree for the following reasons:

- The name of the dts should match to the phyBOARD name and not the name
of the SoM ("phycore-stm32mp1-3" was initialy coming from the name of
the yocto machine from meta-phytec).
- PHYTEC manages different SoM configurations with different STM32MP15x
SoC versions, so common dtsi files starting with "stm32mp15xx-*" should
be used (as it is done for ST boards for example).
- Add "-rdk" as suffix (for "Rapid Development Kit") to match our others
phytec boards dts names (imx6, imx6ul,..).
- "model" property is updated to introduce the name "phyBOARD-Sargas".

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 arch/arm/boot/dts/st/Makefile                                 | 2 +-
 ...ore-stm32mp1-3.dts => stm32mp157c-phyboard-sargas-rdk.dts} | 4 ++--
 ...re-stm32mp15-som.dtsi => stm32mp15xx-phyboard-sargas.dtsi} | 3 ---
 3 files changed, 3 insertions(+), 6 deletions(-)
 rename arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp1-3.dts => stm32mp157c-phyboard-sargas-rdk.dts} (89%)
 rename arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp15-som.dtsi => stm32mp15xx-phyboard-sargas.dtsi} (99%)

diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
index cc9948b9870f..099199f3e5f3 100644
--- a/arch/arm/boot/dts/st/Makefile
+++ b/arch/arm/boot/dts/st/Makefile
@@ -71,7 +71,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp157c-lxa-tac-gen2.dtb \
 	stm32mp157c-odyssey.dtb \
 	stm32mp157c-osd32mp1-red.dtb \
-	stm32mp157c-phycore-stm32mp1-3.dtb \
+	stm32mp157c-phyboard-sargas-rdk.dtb \
 	stm32mp157c-ultra-fly-sbc.dtb
 dtb-$(CONFIG_ARCH_U8500) += \
 	ste-snowball.dtb \
diff --git a/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dts b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
similarity index 89%
rename from arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dts
rename to arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
index 28d7203264ce..26995eb2a619 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
@@ -10,10 +10,10 @@
 #include "stm32mp157.dtsi"
 #include "stm32mp15xc.dtsi"
 #include "stm32mp15xxac-pinctrl.dtsi"
-#include "stm32mp157c-phycore-stm32mp15-som.dtsi"
+#include "stm32mp15xx-phyboard-sargas.dtsi"
 
 / {
-	model = "PHYTEC phyCORE-STM32MP1-3 Dev Board";
+	model = "PHYTEC phyBOARD-Sargas STM32MP157C";
 	compatible = "phytec,phycore-stm32mp1-3",
 		     "phytec,phycore-stm32mp157c-som", "st,stm32mp157";
 
diff --git a/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
similarity index 99%
rename from arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi
rename to arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
index bf0c32027baf..ebbb82c09a1e 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
@@ -16,9 +16,6 @@
 #include "stm32mp15-pinctrl.dtsi"
 
 / {
-	model = "PHYTEC phyCORE-STM32MP15 SOM";
-	compatible = "phytec,phycore-stm32mp157c-som", "st,stm32mp157";
-
 	aliases {
 		ethernet0 = &ethernet0;
 		rtc0 = &i2c4_rtc;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
