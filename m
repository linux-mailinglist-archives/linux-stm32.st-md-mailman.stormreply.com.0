Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EE0A2C59A
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Feb 2025 15:36:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EF98C78F8E;
	Fri,  7 Feb 2025 14:36:06 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2114.outbound.protection.outlook.com [40.107.21.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5353DC78F92
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Feb 2025 14:36:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k6A/FjGgwEVLK254irYivbjTEOeIJm67zm2jTn42GWlr5tP4IjoWtaIuJ70/JV9Vnrjt9JRaYs681BElLVHCzjAoRl5PcUUVwcIyfipsV7tC65IGyDI+nCoyh/Ejesuuz42SF4o0EAocx0yLIiw9KPuSAZbFAJlNdurpvK4dBYhBaX7L3PpqsbyiBxAj85fj9Zs95SdIrTQT4kKaa4cQkyIrUpCVgP0RryX2YSV+eiMq6L0iN9wEXYhLcQKj4GQYqP/1tSryGSH3wY+LMBYgkaGpMzm2S8ZAgJa2G0YsVXKhZM1ZMz3Thjwq9FkuBQQbLZzSSdu5iLWVWGfqzvdjAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlkBo13gAAMFxY69YUO/r2kEBTxBz8AgO2heyKDlsH0=;
 b=IvDPNA5+MS3z7x5v+0KSg7xPcF7Ajm3TJQmeoalXQi395/TMI/5wc3ow8jipgFS+7n+Vvph9PytPQ97GkufoexhOpQO1kMiTuX+0guNeuZTd4H1TrBwJ/ZX1t2HnLFyTm54tco4CIQgb8Irju7NBLDmTUtocYRRwjeFCGgEnIlnCis0bm5rA3hGmKzptwQTvMcYtMEITr4EenDiJK0dXrD8uQTUd429qLodEOzMUWfEK6hDdYKOhshkpCMdi4t9qNIRTAxltZIY8leQzasAURSs/mOiCpU7Ha+UFz86JFCHNt+7nUWWaZnWIV2A9fnSwPpl2pVLoDMvlzWmFXHrBsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=phytec.fr; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.fr; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlkBo13gAAMFxY69YUO/r2kEBTxBz8AgO2heyKDlsH0=;
 b=J0cvQnJDYjFGm9kEbk5LUostWM1UcqUuqcYy9QNRgg1JnnIG57+PY8H0brNByFgeqc3/sKt+4LrhguP5FiOR0OVhs2gmyyUXkXjyffbL7+tLVqOlugVOou7HMHHuIVqpRTVz7lsWbFI4h+xqoxcZ1+9BqDO/39TXwCvRNe7jx4M=
Received: from DB6PR0301CA0077.eurprd03.prod.outlook.com (2603:10a6:6:30::24)
 by DB3P195MB2228.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:434::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Fri, 7 Feb
 2025 14:36:00 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:6:30:cafe::31) by DB6PR0301CA0077.outlook.office365.com
 (2603:10a6:6:30::24) with Microsoft SMTP Server (version=TLS1_3,
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
 with ESMTP id 2025020715355266-64 ; Fri, 7 Feb 2025 15:35:52 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 7 Feb 2025 15:35:46 +0100
Message-ID: <20250207143550.432541-8-c.parant@phytec.fr>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C6:EE_|DB3P195MB2228:EE_
X-MS-Office365-Filtering-Correlation-Id: a55f245a-eef1-400a-9ba2-08dd4784be30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uEI2G0ukdd7RgzuYz/0Kq7IPM/3pyXR+eupv5bqPFa6Nm8lYcnh0HP87JmDD?=
 =?us-ascii?Q?eO+ecmENGDJUf741135kUYORHH8zxi/klGfXpRpOorOxF45ovq/GwmQ83AK6?=
 =?us-ascii?Q?xA4Up8kC8rTpUT0OYL54wKcg+gtcy/p9KbXZPKPVxoUUu8o3YYkRvfRuKp78?=
 =?us-ascii?Q?3kRI24jP5u/FpAWK7a0QejP9G4ErTVQqsTevcTCGsMnnMbdekJ6P0Da5ROe5?=
 =?us-ascii?Q?LQWC5wrZ3tfHEu0oAL8z+j7pST4wBCQL+s9ezeXVXUMd9GhscWEQMn5OdaQT?=
 =?us-ascii?Q?SkGpbO7JKWBeV6S525rtfyVCl+nmC078eZK31zCCUE/03zsTjFb1mOC6ya+6?=
 =?us-ascii?Q?4QYSJBs2YNBwak527CqZd1/UTzCkX9KIACkzRj9bhRtvL6h3q+pPEt6j0JDR?=
 =?us-ascii?Q?YdIy8di1PKs95e497L9OEQSgtf1sZ5T0U7bGgc23so5iJWngQyp+SlXZMlYa?=
 =?us-ascii?Q?Mf5RGDhST+HLGJJNpiDp+Lb6DIccLWLp4IB+++EXDPBsYzkz5ffaM+ik5bK7?=
 =?us-ascii?Q?EMjTb0TFFR3t7Jr0S7lx70SCy1YoaKwQuBMW/ENqx10WUlpfSt2tDqMC+HW+?=
 =?us-ascii?Q?EC2HBz52P6MSR9zl3QewCggG9H3i7uWmzVnS/BY6P/F53DGogQWor7smJ5Kd?=
 =?us-ascii?Q?PPOvcstu2vUFXwVaC0zwoes6Dv8e35mfUCWXIZ9eiiwTgWpRRtEO4MMQ8DUE?=
 =?us-ascii?Q?jbJsS0te4YQO7xoYtPPMn22TxWoFXI8ESP/GDaYdvgJgBfIKAznbS6FlX0Oc?=
 =?us-ascii?Q?P9xUv5YqzlF2HydN/A/4p75IMo6vLkVNRO3J47FiQhSFOJV80EvIj2MqjNzk?=
 =?us-ascii?Q?fF53xSe8G4WRlOBXwGOwPzZrmItz9rfJM7gcZPh0goMfYrgqFQua1UoRcf88?=
 =?us-ascii?Q?yG61bO6LP4Gv5lcXlIOiLwy16rrwUzzHLfscuQMvf1jTIojg12TtjT4dwToV?=
 =?us-ascii?Q?KK5nknj6RqqO/f5P3mi6sOZwdA5uFNWUaVzBjR4G95f8V/x9IMDabYmBVScx?=
 =?us-ascii?Q?PO7bLyPMCyH9eCANZacl6XvQlumIEDGoSM0pAh/7xoImoibGkQK9RY+ZScF9?=
 =?us-ascii?Q?+CCZ+lNtB4KyuvN3e2djxeyBh0UnVbd31tRhDa6x0u5NbQ3CSjHaRWGRGL2J?=
 =?us-ascii?Q?Af4TOIJla6VV4m1qWeJJSmCbspHbH5WSBeZxSdepuMyye70OIWwtqh/XGDQW?=
 =?us-ascii?Q?3z39Oa7MZb7mFkXmCDlBqr9rz3RL+sPgsvk8kDrIWqb2UwwsCzWT0MNIv7rU?=
 =?us-ascii?Q?z38Y2uKMYCtbXgGQeZlIX9AINGDDUMoclh0XyZaAABp5Vz81MePRJrbMtF3b?=
 =?us-ascii?Q?wRt7l1tAFglhyHLOx85v//fOnFNU4LnJlvuaZedypk8tT325SrZf3sDM1K2H?=
 =?us-ascii?Q?1eX70+wBHEWcG7Q0tdonUFFvEd8ATTIFsVpeJrk9f5d38VtFRjdhov2Ol7FV?=
 =?us-ascii?Q?n9VcWgH6hmDcklzlOd1VUvr+s9hCvI5M25N3Bq20JZDx3KR9VgYhbegrgpKJ?=
 =?us-ascii?Q?J+6hWd3r8jMa1RU=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 14:36:00.7809 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a55f245a-eef1-400a-9ba2-08dd4784be30
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3P195MB2228
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH v2 07/11] ARM: dts: stm32mp15: phycore: Add
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
