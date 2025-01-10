Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4113EA09487
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 16:02:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2A3EC78F72;
	Fri, 10 Jan 2025 15:02:26 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2138.outbound.protection.outlook.com [40.107.22.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98425C78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 15:02:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWzzEEaSHUM4pfurzVBb56V9RVAeepNErmkLCXShGB3MfxBmxaiD1pWDoFBfxjo0b/gXqku5AhQt+QLanxjBt0xn8avCXEQ6uCf3WSjPp/biCX+BVk3vGni9miYz7KH5YTLj6BV2IzKFz4u4laybmhCM/Z/Q4YfyoeYC0HiRS6VcOARi3escaP5W0aJ1+47+WA6RCugOuiC5uZsuY/TZ3VdNwltR6dLFgL485CKIitgg6OFdhH4BOkGLjirYoV/343bKadabvT/0iU7VrMY1BO1KuVvTg8xXYDMgbJqGzIrQOuHkRz09Ih2sPVg1GIQMKztWPLWFGsiLfnhdjWIkvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=618aVCeqqxOhFEOhyAaT5uxIcpZHp+h1MBKM0qNLDYE=;
 b=kUdTzD53FbHFfOvC8oV5TS1fhwGmJqqE6GifftIfcrGLIuFMhV126J9fxwkxhLHYPZjl8O5FBCY0c82Bktt29g+xII5OXM6E7xTnya+BTtgi5qLPe9jMxn8Buc0jU3ahns6PaNtRumIh++u9nxH9XOodSE0FtWNZ+FtKDPmzJHoDAjzIkNLEkfON5EPY0WGp18NQrH+3dcGdjB1Ev+lqTcurHkcyI9zTosOdsaoYgXu0or58PQjLLXuoWbrzkAQJ70JcgheK1WSzeNUoirxEsApvNU8+yjwjvQfly/1DlkZ0bJywea1P9/CZ28CqBBKb7VrfyuaEI1QVygRajW/Umg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=phytec.fr; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=618aVCeqqxOhFEOhyAaT5uxIcpZHp+h1MBKM0qNLDYE=;
 b=o0CUHm44fcEx5thDf37+o78YgcOuJaPmFv3xKbnru0IEE+YgnY/xWoUjoOf9fG6YOHjG3pRIipX+KleauREiPxTS87/LaXjBBKAR42C3RilnK/CFbB4aOZsQcKwLsTZ0LHFH4wPhtrFUhm5NbMyO6iXrgjdYpXVOBRLY7Whbqs8=
Received: from DUZP191CA0054.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::27)
 by PAXP195MB1261.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 15:02:19 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::83) by DUZP191CA0054.outlook.office365.com
 (2603:10a6:10:4fa::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.11 via Frontend Transport; Fri,
 10 Jan 2025 15:02:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 15:02:18 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 10 Jan
 2025 16:02:17 +0100
Received: from Diagnostix.phytec.de (172.25.0.14) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 10 Jan
 2025 16:02:17 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 10 Jan 2025 16:02:17 +0100
Received: from pc.. ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025011016021714-25 ; Fri, 10 Jan 2025 16:02:17 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 10 Jan 2025 16:02:08 +0100
Message-ID: <20250110150216.309760-4-c.parant@phytec.fr>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8B:EE_|PAXP195MB1261:EE_
X-MS-Office365-Filtering-Correlation-Id: 18341029-1e4d-42e9-67b3-08dd3187c737
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OyN9R1qU6gPzQEz84VzD7heRfo5GwSygWFcVRLbT9eD7m8Q9DQA2lByT9yzJ?=
 =?us-ascii?Q?soiD4Pye9Vwq5vgnCH+kDMLYFllT488SCgbl9IpvSisFBqVeVFsJ9aJu6tq1?=
 =?us-ascii?Q?o1xjmSPp0kN5Reg3NfiVLCQ/Drq4G/SwYI9lHE7/yXjn0RCgT8vADykkbuor?=
 =?us-ascii?Q?s9hn1OP/QQhRWHj3CWJVI0I7kOMXS8CLmZVdi+qfm/gR57+iuErTum5/WcAQ?=
 =?us-ascii?Q?pAIyd/SkuhQz42lh5oYEHTLBWYcR2sI8d62BmWNtfevoHwiJ93MMBhtRZtGc?=
 =?us-ascii?Q?40lmxW0/SBDEPjlhkAg3XMW73HXrbPYnaemmigh/uEY2n+z0kCkZcxu/OGvN?=
 =?us-ascii?Q?J9yFfmPlD8+WSorYy9AU5iSKhIfrJL9NrUD01Q76gm+xwLNjOpVE1Aj7cs2T?=
 =?us-ascii?Q?AhCjcAqqg23MFqDFIdyD4cBWmgSc0/NinZ4yujRyms+fIqqImyZd5FPK7JEB?=
 =?us-ascii?Q?9s4wh5tCDIv+9VcmU48j7As2ySRQtcArirQYWfi7VAENHVqDduUgHDRX9V8k?=
 =?us-ascii?Q?TMUPCLLAXB43CaMA6GXIgXQqJIx5RBjS9NO+Wz7Jphujl9a6sDftX3Kh3Bpv?=
 =?us-ascii?Q?rZL0kGD3lUy2RmfyvS8eV2sIhEGAhXR/GB2EQwX1zIwWcFAtqHLUmAN4oK4X?=
 =?us-ascii?Q?iXr8DMYnoviMjUZtHO7Wd1cP8s3GdtAtXWU648RhwX3aR1yRhATk8DIQQQYs?=
 =?us-ascii?Q?uxMRKwiZcUxkqlpAyIwSbzUUkzveCLAiTrjgKGl7NqGDLo1tzltbTXTkxQ+o?=
 =?us-ascii?Q?IPHg54B39TSsmxi6A4LGD1nubfPPMeI1aMLqdaZFYLLyAbinDzpg7Ypdu/A6?=
 =?us-ascii?Q?dUJgNnMyAbSHju8ATyr3y0D6NeKm/wtg6hJB+KtuqcGXY+sxegln+Vxx0bBp?=
 =?us-ascii?Q?p447lft9bSr4xSn4c6XUp3dBscBYst5xsg95FGK4D1WZRcNkdm4tTQHr9usm?=
 =?us-ascii?Q?tApeoTkcWwFRJnD3B78zKhQZ++o79AuxNFolWlsDmHBco9uwdm4Pir+cLtVM?=
 =?us-ascii?Q?YHKahZwOV0QOuaG81RGU+JckrO9DAgblFQn1ksCU2CANibwKNntCIW+hW1Y4?=
 =?us-ascii?Q?eFmY6IvFR/xEggOTUP5W3Bys+DlfmFy0yYN22HeFGFRZJxOo+NHp7n2szRaN?=
 =?us-ascii?Q?p2bsKjCrnHv7jgI2wH8D67Qmv7fy4lxqi2b/5CPADdxGFcA7+9/boW8xRm31?=
 =?us-ascii?Q?2bDNpnBIrInAOMqgKkiq72EpQaH6pQDZ00qP75RwnXRnxjgf8WcO53HxMeq1?=
 =?us-ascii?Q?+Wq5A6vvnKNn2d8whPGr5lDznrsyGYOv8hS8Ybv0I75I4+/RWImtr2uVc3Gy?=
 =?us-ascii?Q?a09ev1MWaePk7sRkVI+TUcyM0STVbpCwrHVa1oF3f/Yey/EsCCeqjSLE5pgg?=
 =?us-ascii?Q?ijoFVxJ1qNT5p3GhP1paebtYAAQlsZXgK7EPnOhSQLPz186aEtOF064rU7bf?=
 =?us-ascii?Q?JeWQgw2YQmXDTNtvTxeFwxGdlbgqLevdiVO/Sk1ryeZhTcQO2Hj7R2gwO6qh?=
 =?us-ascii?Q?Q9xKA4vBoEB6abY=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 15:02:18.8340 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18341029-1e4d-42e9-67b3-08dd3187c737
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP195MB1261
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH 03/11] dt-bindings: arm: stm32: Rename
	STM32MP15x Phytec board and SoM
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

Modifications following new PHYTEC stm32mp15x SoM and board device tree
naming.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 703d4b574398..e633a1cd8a63 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -162,10 +162,11 @@ properties:
           - const: seeed,stm32mp157c-odyssey-som
           - const: st,stm32mp157
 
-      - description: Phytec STM32MP1 SoM based Boards
+      - description: Phytec STM32MP15x SoM based Boards
         items:
-          - const: phytec,phycore-stm32mp1-3
-          - const: phytec,phycore-stm32mp157c-som
+          - enum:
+              - phytec,stm32mp157c-phyboard-sargas-rdk
+          - const: phytec,stm32mp157c-phycore-som
           - const: st,stm32mp157
 
       - description: ST STM32MP257 based Boards
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
