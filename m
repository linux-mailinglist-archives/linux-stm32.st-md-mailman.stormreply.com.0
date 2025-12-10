Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21474CB2A63
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Dec 2025 11:16:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 798A4C5F1FB;
	Wed, 10 Dec 2025 10:16:17 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11022099.outbound.protection.outlook.com [52.101.66.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91A10C5F1FA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Dec 2025 10:16:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9PPsIt7gAXO0sUwubrv0E9hYyd0vzw8yNImj6D6/WFx4evXJg8CvSY4zNSW2YJ7Zk3jq529yamcKJsztvTnM06izA+kqxDkpAqt4uUB8M2UaQ3j3O5cSVN1P1nLIiQVPNgjjuxa6WAjGsHpEQ+y1yTSgspeegZ3vC9yVcwuUAJBkl+Ax0xKD1wfRrm0vXrFKP60oZDc+2p/bFps2wyeEifF1UyRTMVHIwrRhVtfJBKiEkP1hAWswzlpv8vd3pMMN9zhOghr/Qi3+qZhI2oHCFNUzeP30eVlZcxRYHOtALkQYjZ7AlkQHPe98nLRuiW8RiwuHTO/2Q8mihZIsbxKGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6T7w0eYNfTYqc4qhSaU/I8/p9X2ebFodkFIaOfiUhY=;
 b=TozD29/HduC6abfu6KBuRk0lzbQbJbL4vkYY56TtRQl/127tPej7X5JR8Ph/710OLcJKBCYL3UIIilEWfP5ZqgIqvwu8+iOaPp39ttafcFnniGIGJteQTiX2lg4S5Ih1vtQL2qC1nTnPM0HkiHlzWby4xAbKhpUxE2MdzDQkbjJZRzIoNG7v9PeaDevZHnYTL5Me9tXTBPSZ0d91FhghcimpkTuEYw+3ntmDYl0Cs075A6StrIXKk3dX6efr2a9no3vj1Cbh7CLqyQxajIKuKuJwXintxrDnek19OYRINtMsNjBtKZJl6yiG3zAi6gXmMF08FrqgXUi+piLvz2Axrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6T7w0eYNfTYqc4qhSaU/I8/p9X2ebFodkFIaOfiUhY=;
 b=DzLF3ANF14j2anGjwvXOP5GCRg6cEseYc7wk72wqvXbc70R9lgk4cu64qlOHX5u2Tk3g55qF4GgHXJnpgxW/L+8SXHwQlmPlGZOWjZhpSKkXDTtOp5v8kkFotsYhjC5gvHEfJN4yEASZOy99q/Z37wZcr1o/TYBJwbRpQEr0pCs=
Received: from DB9PR01CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::27) by DB9P195MB1492.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:33a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 10:16:12 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::8d) by DB9PR01CA0022.outlook.office365.com
 (2603:10a6:10:1d8::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Wed,
 10 Dec 2025 10:16:16 +0000
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
 2025 11:16:11 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.11) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Wed, 10 Dec 2025 11:16:11 +0100
Received: from pc.home ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025121011161178-309 ; Wed, 10 Dec 2025 11:16:11 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 10 Dec 2025 11:16:00 +0100
Message-ID: <20251210101611.27008-1-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 10.12.2025 11:16:11,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.12.2025 11:16:11
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D09:EE_|DB9P195MB1492:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e30ad56-64f5-45ac-d435-08de37d5253a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/p/f2P8pGRcRcSUohDRqEeG8Yv83z0M0ZBi4Bp5JqSuXLFiOykEaeAKJZ/Sg?=
 =?us-ascii?Q?IopXI33rieo9NVvIGRY/yvpcCAUiPOXUsgGJ8zsmu8a0KfsK8oXec8Huz+ST?=
 =?us-ascii?Q?dWg8MTNvebjndd6ofF3Tr0gVGYUtMBgLLzV99U2wmwW6NqL7fImCM6ukT/en?=
 =?us-ascii?Q?XZxXDiOdx6P3x8om9kZUmmLYFVmO0lQq721RRqlHp7WaXBPUnvBLSXMQ84sF?=
 =?us-ascii?Q?kflbb6bOmPm3GN5Uz1jHBxyT5BA6vIMa4XJA0pi3K3wqauRh45uIUHeAuc/0?=
 =?us-ascii?Q?EO+mZOT5gPv17nOIjC1uxW+IaPgKSqeBGRwovufCYkQEguxz7QCKOMyNTaLL?=
 =?us-ascii?Q?yDDWFugtBvYB5ioH47H2HIst+gq+7QZqojYpkSBKJwZvt/aOsp0YCpiL73ou?=
 =?us-ascii?Q?mrYQ4saZRy+qeG87AViKNIotJimT3vHh/M/BdrpIZgfdRrjGXKsg6w2qpMAp?=
 =?us-ascii?Q?14xvpNDutA7uphSjtGXcd66gRFs2yl2ADnf5oAEVCgwMYTSnYwFXjnfpgPhz?=
 =?us-ascii?Q?/Iq0ZD9Z/tkN00R6sPBKUVCIwljEVwxXnmxlTrHivQkq/GfZ97bM/j2MHmoj?=
 =?us-ascii?Q?4/gwZ6dwNH67POgD22E0Y++z+Q9PKhITU4gtOEDaaRQEz5AnB3pMp5EAxUrA?=
 =?us-ascii?Q?zVoFrzX1yNaN4K+oT780pSRgVhMv/OQlO8fn0t9cG6yxiePw4vWp+4AcFSWU?=
 =?us-ascii?Q?6lSnrOeujX+lBn7x7TPPqoSzY6qkxfQtDZiEcesTQ2gnoyRTIyQGdxmJr/j9?=
 =?us-ascii?Q?aDGIv8UC2bhS6HuWeWYC0ztOQraaYgXSB5GJxR4gPheYjpMXQ+wo2NLaHB7t?=
 =?us-ascii?Q?2a3ldvHoM+rQ/tQ8yHZCxBFap0kSk7iNSThlC/fz8boSGENfW1u+G5edJWzR?=
 =?us-ascii?Q?KRb1f4LvVDk8hjdlc+wn8NjSO5faqspfQQ6BlW7U46GfEwwuN1rDPytMBa1f?=
 =?us-ascii?Q?fYcZ0pHs98yG5W6ynTIqGQZxe5hd5B/9V1R8ndPQc/mmpnPGyuCY4utB81rh?=
 =?us-ascii?Q?LBM4jUPrrlVWZxQdXUeye47LMboiSoCAGGkOksYHAm7siD+kB3Bw9XQp6O2q?=
 =?us-ascii?Q?A5PrI3pjBBYwwww3xOrlOKLrEs5VIWGsLFZJUqg4n/0I6oHDvoET3xqdFK7w?=
 =?us-ascii?Q?//IflvSr+jJcNjwrQ0j7ewAkez+r+qGEx4U2Q77tMkH6ai4MVaFZ/KEZUHhl?=
 =?us-ascii?Q?JAqKuwSKfrwYU3jbMmm7ZiN4Q2oF9jvI2n2tTq1FHxNF92cVxAqSSYSufD6C?=
 =?us-ascii?Q?VQiCMPzvpsrOmmijsnqUiQ9JXrIzOnnmHt22EFiyMw14eKRh339yJeXGHPE3?=
 =?us-ascii?Q?SzPIyDUWUoZcrx7ujyRTDGo+C2WOVJ/qUWqO4MjX3A750Z8pGrFBDumFt8ug?=
 =?us-ascii?Q?AhXUn5vAvMZwlgrOBl70kkIAPalAzJUxHoUxBMjDPhLeHbxEBaYpfVQQdtY4?=
 =?us-ascii?Q?HhwK2ZOJVcrYdFyztiR6jL+owkl0lcnsvqZ5fbwUD8Sn2npmrUcfYRbLgmok?=
 =?us-ascii?Q?Gf0mPxV6qptLcvZkC4GXvASb2VdNGrU96shthP5mw4afTVC6fdmAZwff0qEO?=
 =?us-ascii?Q?mquKlA3FS8yIyl1i1xo=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:Postix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 10:16:12.4633 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e30ad56-64f5-45ac-d435-08de37d5253a
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1492
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [Linux-stm32] [PATCH RESEND v2 00/11] Rework and fix STM32MP15x
	PHYTEC dts
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

This patch series rename and reorganize the STM32MP15x PHYTEC
baseboard (phyBOARD-Sargas) and SoM (phyCORE-STM32MP15x) device tree
files.
Indeed, the current device tree naming and organization is not really
consistent as it does not align with others STM32MP boards (use common
dtsi file as much as possible, use one dtsi for SoM and one dtsi for
baseboard).

The series also fixes some important pinctrl issues and minor one (coding
style). Additional pinctrl is also added for the optionnal interfaces
that are not enabled by default (FMC, LTDC, DCMI, PWM).

Changes in v2:
- Rebase on v6.16-rc5
- Rework Patch 3 (stm32.yaml): for board description, keep "compatible"
string identifiers as before to not break ABI. But use "enum" type
instead of "const" for the SoM and phyBOARD indentifiers.

Christophe Parant (11):
  ARM: dts: stm32: phycore-stm32mp15: Rename device tree files
  ARM: dts: stm32: phyboard-sargas: Introduce SoM device tree
  dt-bindings: arm: stm32: Modify STM32MP15x Phytec board items types
  ARM: dts: stm32: Add new pinmux groups for phyboard-sargas and phycore
  ARM: dts: stm32: phyboard-sargas: Fix uart4 and sai2 pinctrl
  ARM: dts: stm32: phycore-stm32mp15: qspi: Fix memory map and pinctrl
  ARM: dts: stm32: phycore-stm32mp15: Add dummy memory-node
  ARM: dts: stm32: phyboard-sargas: Move aliases from dts to dtsi
  ARM: dts: stm32: phycore-stm32mp15: Disable optional SoM peripherals
  ARM: dts: stm32: phyboard-sargas and phycore: Fix coding style issues
  ARM: dts: stm32: phyboard-sargas and phycore: Add optional interfaces

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   8 +-
 arch/arm/boot/dts/st/Makefile                 |   2 +-
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi   | 164 +++++++++
 ...ts => stm32mp157c-phyboard-sargas-rdk.dts} |  24 +-
 .../dts/st/stm32mp15xx-phyboard-sargas.dtsi   | 285 +++++++++++++++
 ...-som.dtsi => stm32mp15xx-phycore-som.dtsi} | 344 ++++--------------
 6 files changed, 525 insertions(+), 302 deletions(-)
 rename arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp1-3.dts => stm32mp157c-phyboard-sargas-rdk.dts} (58%)
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
 rename arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp15-som.dtsi => stm32mp15xx-phycore-som.dtsi} (53%)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
