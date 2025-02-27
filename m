Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F6BA48331
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 16:40:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8D2AC7A84D;
	Thu, 27 Feb 2025 15:40:21 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2109.outbound.protection.outlook.com [40.107.21.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60FFEC7A84C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 15:40:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+xoIe8pSkjJwK6i1IiRfsBAzkqHhho+antMHAHP5Y7CY/agXvAt15eBHjkTfMnEmi6yiQQAtZoHw5qCkMYHRUs6aeaGMGGc5TBnRvVzj+fqfuFK3FziFWI3O3K3F4wfbv+vqjNQTZ8xYTBpdiXFNeKFTgSg2vzvqi/435NRjpwdcQzHT5e+hqD9JFE6lUtFSWR/fWCIKx595TI4zDGjZ0f/SM3Yu1QYVXaN++e17Ln/UuLTVUo7cSJy7l2wUMtTmeJe4zwhOZ6doqLsGqDWUy96ztyP1kAL14h069r850/vsDFUyjS5jYzIr8VaoUIhPb3tOSYrCesDezp8k1UsOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQO8uPwiRnegS6YcE6ygHHVuR9M9l9c6CwSIO+xOeZI=;
 b=pBVitUkDArocECuWxDaEWrq463dMhufxICylfdD37mzgHs2NR6+/aRqWWKdpCJrd0KjHVx/Xm7vZiKyUaT9UzOM5wMifB96SzWRkKhftoqze3cXqNVTukRTGW3kP9t4knu9ycjuU5e4FFxIPrfrBQt3ojUG2TirLhKJnNRfKgAuWLCBCoAaA6sufixxZ3Q6PLbEAYfw2KFJZEpoXC1/yd+PJ1OZhbV/TctgN4rhXkt4SFR5ecrPxUGvYAk/jet5/kXeKZI9Yn7oyiqZKUb0BQ9vle/AeDT1EQiO/ldyOXnQXWZaqVmiJ50Sn54dqtj/mHS7+dLDOOh1Wy6bb/1nx/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQO8uPwiRnegS6YcE6ygHHVuR9M9l9c6CwSIO+xOeZI=;
 b=ZJdFZS39jb1r/aFGfG7yZz7IrwPjGZWcwkPGRJEJK9cLyl+51LUfg+Y6rsInH0GgeOMcu1mIHk75HAvCvjv0+hsk+ZtbVQyZc4gI6gOfO+kXUSj0eqrRLX5BiqUWHMCBKuJNCyz4tVZfNqu6aE00imNj+KWgFCqZ+FYAdPPkA3c=
Received: from AS4PR10CA0026.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::20)
 by PAXP195MB1582.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:285::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 15:40:15 +0000
Received: from AM2PEPF0001C708.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::b0) by AS4PR10CA0026.outlook.office365.com
 (2603:10a6:20b:5d8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.19 via Frontend Transport; Thu,
 27 Feb 2025 15:40:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AM2PEPF0001C708.mail.protection.outlook.com (10.167.16.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 15:40:15 +0000
Received: from Berlix.phytec.de (172.25.0.12) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 27 Feb
 2025 16:40:14 +0100
Received: from Florix.phytec.de (172.25.0.13) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 27 Feb
 2025 16:40:14 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.13) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 27 Feb 2025 16:40:14 +0100
Received: from localhost.localdomain ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025022716401419-86 ; Thu, 27 Feb 2025 16:40:14 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 27 Feb 2025 16:40:04 +0100
Message-ID: <20250227154012.259566-4-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227154012.259566-1-c.parant@phytec.fr>
References: <20250227154012.259566-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 27.02.2025 16:40:14,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 27.02.2025 16:40:14
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C708:EE_|PAXP195MB1582:EE_
X-MS-Office365-Filtering-Correlation-Id: ca7c54ff-f2dc-4f30-a97b-08dd574507e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TWWXbl3xkFlQoeRBu3c3YpKx4ysdcFMqJAHmkrhU1RcEYD3tLit6mJB4Z4QT?=
 =?us-ascii?Q?xoysKcEtr9MTAve/bFDFJ2+imcei7+ogZc++okCFt4e1m9gVuphJ+st4pG8+?=
 =?us-ascii?Q?9SDLkjwd8O1hg8VmbdYf8Zh26bXxewH8bUBwHSirVe8Kg9WjmHo2ROonZVNu?=
 =?us-ascii?Q?RmR9yVOclEDq30n7v2c2zZjCIxdwhUFdxSzIBT7xqjcY2jnkLZuAk/yFpv+n?=
 =?us-ascii?Q?ke6gz0nSyLUX6Ez0H0HWaKc2cDKZD8FRi+OmPELzt6xZ22MUO4smufXZSnI3?=
 =?us-ascii?Q?57U52Av/bucu6n5az11MNDPj6fHr+WuiNN+47WENgGqD8+jg8uAHW1/iC/Fh?=
 =?us-ascii?Q?bjpN8MAAU5Y5b49cwf7n6DtnIFWvdLtCdGnaB0gJMxsA6+aTldo8UL3Q81mm?=
 =?us-ascii?Q?wOtNN9R9ydpSIG4Dyo8dQnBnOU1QWvbS6kZKweOY536WzwN+xAaKIxUi0xEd?=
 =?us-ascii?Q?qXKXaMvczsnI7wjeKU0ZdpKtLW+TYa2tqsmsAurbPhElSQanlnz+sVnNaBF4?=
 =?us-ascii?Q?SzOFtBRtg4aiNq0epAMSUP9NDXPmgS9P0V+X4VoLgYQuD2qB7uD89j5+Ybm5?=
 =?us-ascii?Q?FtLsg/h3fLOqoEBpLsB6TGmRWq/im3VCrv90wwLcWBmrmi/1YlsaVB6a/bzV?=
 =?us-ascii?Q?WCcP9gg7wYggY+nY03Qf3NL/+XskZN8JdfRSJ+95c/EHQpK+hvyGaoksQ52Q?=
 =?us-ascii?Q?U0yexegVPl7GSBaFtmKYXbCwDdRbEy8R4wcsX3DeQ+JBgM3p10pfx7dQJZAr?=
 =?us-ascii?Q?jU6sNhnY6+5G1RovDChvNlAoD4yCYeAcipKZBBVak5+jVjDzDGRW2ZJoCUoi?=
 =?us-ascii?Q?TwedZi7fQXB3ysdY5DWJEIKP9gImRFo5qptqnhLGJVLFPUn/6hIGKSXeXQXD?=
 =?us-ascii?Q?RbM/gdSLGAS7LgWRGIgclGx9o8Pq41VkBDFUyiYexJus/8M/Kohm+3oWYLXa?=
 =?us-ascii?Q?LfSoZR1nKy5NXPup4SN/xw1xzpTndgYcyySXzpREgFKMIbnxJKLOJhSkDJnL?=
 =?us-ascii?Q?7frOJ6bDfyzjUmfarboJWfTUSpIkDqUEsTmIpCNmoksuaxcxv6sTXlIbZdqp?=
 =?us-ascii?Q?6O0LUJI3eC5hfLI8pm+QJPwnujtGxJi/ffFSPSS2Z/v9XwlK+/JZ5BMV8/RS?=
 =?us-ascii?Q?qZoOBZBkkbwlD5mxlv/bbAZQhVwSZixC06o7xyts9Ci7DDJAdbM1FLnLOx5U?=
 =?us-ascii?Q?qI6gUKzBJGLoR/XSzGas5NhVBqdirZkfQQZZmdm7LEXCk47EzT0RNABsRaN+?=
 =?us-ascii?Q?H6xUUDAAWDHcCmyI3DEvhgBIQq9gl4k0jP0M+n83etONva4xOPcpS5Ey4GYl?=
 =?us-ascii?Q?kVJRY457iGKmG2Fuv6Xy590x47OzErCafK3ylQCdO8g7ii1f4jDMLn73ilw8?=
 =?us-ascii?Q?+jMqrvZ/8xrNH0XPLCF4WoLoCUcsG1R7GcAe4YHg3UFmPnLBX2tjghI0jRUD?=
 =?us-ascii?Q?WLPkn00EwacEXom1QxxukQYaRDdyJqnrP9PPezH/o2C5rD7ifZb1wA=3D=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 15:40:15.2533 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7c54ff-f2dc-4f30-a97b-08dd574507e0
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP195MB1582
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
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
index b6c56d4ce6b9..11b3f59ac550 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -169,10 +169,11 @@ properties:
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
