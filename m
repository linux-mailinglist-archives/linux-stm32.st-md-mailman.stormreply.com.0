Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EC5A0948E
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 16:02:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46D48C78F75;
	Fri, 10 Jan 2025 15:02:39 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2101.outbound.protection.outlook.com [40.107.249.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D0C0C78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 15:02:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ocm1kfjmyhkSRrM9wmvjYwKxXsfeLQhEf+Fnsn3/2yZzIs452Lx1h1kiR8fXBJY5oWFbHGDIABDwi8hgceSKxw/voHrUPOMZZgUoU5FPxbnTfI0dPDq4LqdPfslFX8B43h/DkWRQ1SJkmJlJy/teMEkqmjdupJO2rf5bFsKpUTk8oqj1q4X2imxP0YGg8aWCRPaUzIZqSVwsbzgnoBrkrLsRWHHfh/9Vvch2zuNF2eXDPGZCa3tk1LsXKB8kdIQumZJSaSy/GNaFZAfSBwE2FwQ/GmPdHULD1qf5klJv1LEgfCEQB3FFpHJ6EpdoeAkx7iGHV5j38X1t4/nQ7Eg6tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3QoQlPwN6QB83eUX7vLduNKq41iwTpYvufrM4Of/Aw=;
 b=L4j19BvpI+MSnpi2d4zCULEjeGeBIrouhSrSQgRx3VZMJhmKz79vM7sNVu0mk4IgQOOwV8dqU3lDHubtbgCD1A/3xssGz12d9APN/of88E2xrjc8JWXOFCXqDih265hp3w4nQQffEpCagLHrZiVa47Bs0AlaWMwEqswBlm3nS3ZqcrPBWBmrPk7TfbzGb02kQ+bsuTdqNJwEOpCkTJWGwpyr3KKBDBLza1oylbqC1OBfm2x4rrnUVkfI85Vr9eX0X4psjLM3NUK/dqCR8TD7dmoJQVaaHf8qcvWvdIhoMT0nYHxQg767hZ5BbdevKKYEnVtHxayto/K5tV4tTPtHkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=phytec.fr; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3QoQlPwN6QB83eUX7vLduNKq41iwTpYvufrM4Of/Aw=;
 b=LjpH6MoIT1BHxY/qjXH6cL+caRySTSP34HxnOgipu2mv2oZ/D4xifxNALt7fe4xK1ivtZ54HwU+pXx5N8FuMJ3OuUGvqFLUHkLHurSk3Qx03CnzJO2wijPjtz9ufA7NEmMmVSK0HVRZkm10yJl+wWrhl0KdItQW97VDNeMBGASI=
Received: from DUZP191CA0065.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::6) by
 GV1P195MB1619.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:62::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.11; Fri, 10 Jan 2025 15:02:31 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::80) by DUZP191CA0065.outlook.office365.com
 (2603:10a6:10:4fa::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.12 via Frontend Transport; Fri,
 10 Jan 2025 15:02:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 15:02:31 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 10 Jan
 2025 16:02:18 +0100
Received: from Diagnostix.phytec.de (172.25.0.14) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 10 Jan
 2025 16:02:18 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 10 Jan 2025 16:02:18 +0100
Received: from pc.. ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025011016021821-29 ; Fri, 10 Jan 2025 16:02:18 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 10 Jan 2025 16:02:12 +0100
Message-ID: <20250110150216.309760-8-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110150216.309760-1-c.parant@phytec.fr>
References: <20250110150216.309760-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 10.01.2025 16:02:18,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.01.2025 16:02:18
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8B:EE_|GV1P195MB1619:EE_
X-MS-Office365-Filtering-Correlation-Id: f1a83b93-b262-4d22-3837-08dd3187cea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YSvP3fgykGu+VCEpaHItJn+wqn+JeQY77B5llDGhlAT7F/pwrlUp03pvjsAZ?=
 =?us-ascii?Q?a67MofBuNkHJ8RyV0C9ADoRzgntNvAgo+irCze9HOwId7roWwLFHILOj2Iml?=
 =?us-ascii?Q?xF0DMZzRNz6uJ2slxR3x1tibPZB0nbJaSIkv8TOiK7DW8BXuNg7qKcmU3KW4?=
 =?us-ascii?Q?daKyYutxX1/ovivF2NRzPdMlNtc7IZvvW4axaGNDq44HqbDW7ojpxAakVpNt?=
 =?us-ascii?Q?lgzOJH90COyMUs9PYHEAHIzgyQgZrbO2K93uhj3Em2P0KDQMvc5ih4qwEdd2?=
 =?us-ascii?Q?/xzlF72KSsAfOj/hq6gpd4m4dMSj4K1CIUrYguyhJQEk9faT767PhamyrlEN?=
 =?us-ascii?Q?0dzEFA+8NUVworchprWKDmvmVoPmx3MobAsmXl2E7NGSQel7eOZS0jFi7zO8?=
 =?us-ascii?Q?IUM4bI8el8rj/jPm6iAjRvURt7n2brYshgq361kSoTfgVq63U5ko10Lcs+aE?=
 =?us-ascii?Q?mV7F9ATnnGK0d8n2M28/LvA3iQl1n81Opeq25OzMIJ1iRq3+KiLFn2v11mRS?=
 =?us-ascii?Q?L7M8EqyCJvouXntSZjQcIb/l199oBUcZzyyO5xe41ElShy5Xdub6z4gRndI9?=
 =?us-ascii?Q?eh86SE0ka2eyt17McW/dX9Z/2N8HQhuoEmShxRDlvfd/H19ns5Otjv1CkoCi?=
 =?us-ascii?Q?p5cdI4cbezhvGb4g8vSfyG4nCTv6CB7g6R1us2hVm54yzdqxRNXgNnIfCxyH?=
 =?us-ascii?Q?nohIWolOqLpXxUasMCS88aAucvruXnCkDI3U04dLH15Dw3e8yzqy3tPpkxxp?=
 =?us-ascii?Q?ocuLAQhslpdAR+Zgo6jU2iJZTnPDnGlUwTz/tJybYlvVuNjWhqu/tkItGL7f?=
 =?us-ascii?Q?YwHu/dwXt3DPxJEkX3+5JsYb829Tchcy+3e71xCe6Vcj76bt1Ag+iBvinTXo?=
 =?us-ascii?Q?WVwRC+SILbOd9Fg6lwxi3qmYFFtVJfBdW8t3ZmsJK0WbEsXyNw/1TQ8/frmw?=
 =?us-ascii?Q?fTzykdAJk+nQSI6AD8qUmCUlEthDYLu17EJ7DK+HSwLu2RrvF4M/GZlnOzDy?=
 =?us-ascii?Q?Vk0rQXYPiuFEf64URF2D1u2Nt4J0Ak3QT51cYN7OfYeXlhVdPypPESjal/si?=
 =?us-ascii?Q?YOr6+GFsiFzp4O33I/hmYGD6P+JsjZe9Aj6tRKLO9McJaB0Cbp73oZrJMKXL?=
 =?us-ascii?Q?Yp7gX//ir2IqQm0DYUqHx0E18x8zQmJhtaYSq5BgmowpREXfDk5J+GVzU5aO?=
 =?us-ascii?Q?+chTilAsyx6okX5u7GVtG5O06W5S6w0L8gltrBOmyeaI8v1VhYclkRVtHN/3?=
 =?us-ascii?Q?akqXAZcv4EXlXwu9NPiuiCtwFOKcLnAgnRMuaKejtqGtXx6y+n95PqiRrgcx?=
 =?us-ascii?Q?rA+w7eyV1chEg5CElXakkjV0VNykeSA7xLSJNuWWjNO66eutD/cCChGg/kqH?=
 =?us-ascii?Q?sRJmfClorJ8J0LMDWgx1rn27qTgp1w5WQDq6GmNz2uTq6vYkpDHQQMyFCrN0?=
 =?us-ascii?Q?xbrBmS8oE5h1joFxLnq6Xho3Ys1x5P2sy5gELbScavqdpU3taSvaAVnSCpRG?=
 =?us-ascii?Q?R9d9xZ5AY1N7dgM=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 15:02:31.2871 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a83b93-b262-4d22-3837-08dd3187cea1
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P195MB1619
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH 07/11] ARM: dts: stm32mp15: phycore: Add dummy
	memory-node
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
index f8808eee6a22..1dcd5e4249ee 100644
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
