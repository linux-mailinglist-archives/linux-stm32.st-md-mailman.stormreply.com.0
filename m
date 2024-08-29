Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C972B9646F9
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Aug 2024 15:41:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74B54C6DD6E;
	Thu, 29 Aug 2024 13:41:07 +0000 (UTC)
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2094.outbound.protection.partner.outlook.cn [139.219.146.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E837C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 13:41:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhSuZH4s57Fu1l6XYoJb8XRtGULElyZspI6VO20VH2jfcaz4vCBGQ1UykmceOKNxw4EQQkDxJPhNj8Fh/NNDEWfETTfNxjCXv9ZQFO3ZuYapmGo06YJXJDG1J7NmgpGOaXPGfYyLRVL7Fv/YN7m7LdNxmJqAudG/3ljEhJ0onKBoeZOlJkloo14t4UF/1JhfRXpm3ZKSdkINtXNY20cQ2xqawNhsSYrg2hYOO1kgGhpPCnoc+OWJhXMACO+Pw9kIlIoFZn4HQevT5ov1Qqvj5feydGoksqx1EJ7pf1yT7XeqpG1zTdYY6Wh4W9BfmvmZcyIWwUc5lUzPd7mXyZV+ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnYGrjHFd3PvE/A1cQgsfLrHi0OkCmeIGAE8NNvlSUA=;
 b=eaH/uNpg0p+8IN2TWV5KPZ1vFUfwRtTeycn1GGJvaNyi+EO+gzKJfeSzHztpoQJMM6bhuojVSf97AQVbNH/59PK2cKIpd2cNlJzvS1tMB50dGomkFRvyeVJ6lvmm8kBul30+AY0rYyYgWTcAj5vyWC7pbWYxkJfOwVxGzeOyBu1G7dmrj7ybk2gPOa3ktNy+muLGRR/rta/0bq80YbAxzPLhMRwrto29YovnD6Kn2c88E6YbcYfJiHZhBVyKQxuF3cpnczvRVQa7w0vppKbnjaGg8JV1cLGP4jiiHtzOpJmcJV9s9R5zIR0fLe7hrpBzurkGXvoSCa4U/v2xhEzhTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::7) by NTZPR01MB1002.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Thu, 29 Aug
 2024 13:40:56 +0000
Received: from NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 ([fe80::e1c4:5bb3:adc:97f5]) by NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 ([fe80::e1c4:5bb3:adc:97f5%3]) with mapi id 15.20.7897.021; Thu, 29 Aug 2024
 13:40:56 +0000
From: ende.tan@starfivetech.com
To: netdev@vger.kernel.org
Date: Thu, 29 Aug 2024 21:40:43 +0800
Message-Id: <20240829134043.323855-1-ende.tan@starfivetech.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: BJXPR01CA0069.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::36) To NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NTZPR01MB1018:EE_|NTZPR01MB1002:EE_
X-MS-Office365-Filtering-Correlation-Id: 71698778-d297-4cce-5db7-08dcc8303590
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|41320700013|1800799024|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: 5jM23HdLLZ92EzBUocYc9vNQj+h1M9/AfovCUGqGyAEGPh4koNNjPduy4s2SbviRO9lgsp639cK4nY1sbIOCz1wRQwxrMQVpAMZubjBfXEApxWno4lMiekcD3PcPeNldEPBxcyGVFcFRxVD1jXAzFWP7B8+uvJjk4tlWrFxMDzqZIMeFd2MlvhIJ/P6nKIcBBToOhbTVLF5b7YxV9Zs8brf9X90ap2Ygsqjkv1n3gfedKgoOubThGjkgdmkwq/eXc8LMglAgvKrrDU9HO4t0DGmxe1Z8BQrHTHo1UbxrMnHut6mZFUUwFXyeMNMqqJQPwWqv/DKQvKxMkJ28pxyxT8gpT54nJnFE6dqlSNU3n44G67Gux+Llf4ypHCWJqirNg+IHhQ0PsofmpfsdMx047m1pzqMh2q/2bUscRflAX7NiDmIe2Ofx+SfxGcj1ksEdmL8Ux/K9naYFOIofSBiNW+7DePK0MMzUxM/PboS9bKI+d4Fjjqp78OUCnWmuda8DgjtBWVqskhW2xzFfBa3SxSEViErv6RWUxwDVwrJS85m3KmtwxD8DI5wk87DjfXquk49YHaQO8mgD3fOofhR1r1194mp8iomLJ1/BqQNFzY6bMQbkmCTyPyTT/LLx3X5G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(366016)(41320700013)(1800799024)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kb8RZkyKCh8vr9pGSdPcGDGO/uKqO83vxeR8zLXcB5skwlaRlx9fk0Jwqgdb?=
 =?us-ascii?Q?75mmJvvP9df+yvOtU26x3gRynIv7F4zSCs7AvvpwpPJcWoRLgnj8RBBcgiAy?=
 =?us-ascii?Q?mJDCUvJO25x8XHWdm2OIWCrkA21rgmZBT5VPLAns9CfkgJsWuZgy/27ZddH5?=
 =?us-ascii?Q?nylcvtSbgugGBfLzC3brOj3sUcWmt+06+1M8VYXlM4gd7PjM3dcswFP323lg?=
 =?us-ascii?Q?PVwKxujTd1aC1HYej2kY1l0Yarqv/NxWPcyvaaAotgIncYS9LRGSt+GvUllI?=
 =?us-ascii?Q?EIivdFgCEgb/jQ/iKs35lqY7rt8Iob8Vb+cFpsSkjwW3xdDKUfqNPNBBzMPC?=
 =?us-ascii?Q?RzWp0h3FRH7zka9Od2d8P0qKEMQkCPF1m5VWQhqXvpWfZVGE+ZOIUbLBA0Bn?=
 =?us-ascii?Q?qA+DwK7MTPchFV9T4qWzakLV4E4uFm7d2YqCWDUGF3Oid/5YIut+nTErHJn2?=
 =?us-ascii?Q?MelCmYM2/ga4ZnlFd1pAe/uC2QGVb27xljOwviQSDYoVCJIP4FZ/IMAT6hG7?=
 =?us-ascii?Q?RoVIfentrVs8PzA+DK8PGcxvr99NB/6oezthpmIXwKnq+iGz3KRxv2lA9zK/?=
 =?us-ascii?Q?YWFwN2D++FjZ4IuYPu5zBxX9fD96Y1oa9hM3FsivfYPqpUrJl6Zsc/Sw1vQu?=
 =?us-ascii?Q?tLbzEVeV/8FlN3wcqsiUstJofUoLeLmAqSGbz3vw2nObzlmrTli/uA4siJgP?=
 =?us-ascii?Q?+smy8MQgznt0Cdv3itt+wyIiDeDRwCcuKPFVVu5bTdMoGdgOMcY/JOm1IIqW?=
 =?us-ascii?Q?5pNommJz6yEhmO9NqUbRvLrIAZJKN8hXkytc1vLXzQ1mMaJqyrAeFeMQspaY?=
 =?us-ascii?Q?m0C1Foua2aqikkzGT5x5nEAbu/r5AyXyOIZl5DYttmqVk41w2Mvyi7sjrUIE?=
 =?us-ascii?Q?VtmGm/H6zRkVIogQHLp/HNM1wGVQur6fNJ7a7s4Ey8kpyQ0nHROYBi/6KMby?=
 =?us-ascii?Q?9B4OpNqFAfvfEeA+D6BVS8ly6QCQK28MwMjvnmm3JHPCa4Z3xm+Jm7Eu4uR0?=
 =?us-ascii?Q?ezm3LFBv5Wjt7Nya+fnW5l5gMlgU7JJgE0RYqHLcuMTswWhblXzKW2B344B2?=
 =?us-ascii?Q?ci2APA2V07UYCjGvOHKB7BUuWBJae4a4HAYYMwmEXlEpw1x8klyvaCrZsOLn?=
 =?us-ascii?Q?xa3awFkjSwQfmbn7iYs7lMF6sWzM5zC3z1+V+i9w6u3pBJVpcrPXtKhVIulV?=
 =?us-ascii?Q?qHeFUzJtUDp6F5Pozs8YedcWsoaPbPurFgNhATqgiyHRyGM7MzKIyhFVb0Ra?=
 =?us-ascii?Q?b3rHK47Rqt/RcL9zG3TDLSXbwqBESXKtnlazPKepFNh5Zn1i5r0+I3XtLhT5?=
 =?us-ascii?Q?SDvwsSfayStrAwyhXCNBcVDIiLx8PwSyeFU0WHqwoOixAKy4gJQAXxyuvGJF?=
 =?us-ascii?Q?SLAaIkDGrK6t4r3WTa1C6VYaTB6co3s6TVlHtvhNuT/OK7YTpJFmub8vwCgk?=
 =?us-ascii?Q?yRPyzSQlmqk5jvvoQlS0qz0utQuXZmlJyMiCZhZkhBneHBO3SR3T2P/GInKB?=
 =?us-ascii?Q?ytYfStZ8KqpQLAvQH2wnyjJR0U/JGeILiGyfmuFe15B8b7gmOfe2Bilwlhvf?=
 =?us-ascii?Q?+rA8AblKKut5NHES8394DaNa2PIuuSrxyL9FcvOsgCOFV1Z0bU6MTocpH5Y9?=
 =?us-ascii?Q?NQ=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71698778-d297-4cce-5db7-08dcc8303590
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 13:40:56.3563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cno8RSzYdfJgjjGwxyeyvitahmZVvy4ALSK7Sot2VQsWT7DkqcwIKG8dyESujY03EMfgmATo8OTmVPPV5u+Wya3jc3dbDnHOi9q3+DHivKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1002
Cc: Tan En De <ende.tan@starfivetech.com>, andrew@lunn.ch,
 leyfoon.tan@starfivetech.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 minda.chen@starfivetech.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, endeneer@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [net-next, v3,
	1/1] net: stmmac: Batch set RX OWN flag and other flags
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

From: Tan En De <ende.tan@starfivetech.com>

Minimize access to the RX descriptor by collecting all the flags in a
local variable and then updating the descriptor at once.

Signed-off-by: Tan En De <ende.tan@starfivetech.com>
---
v3:
- Use local variable to batch set the descriptor flags.
- This reduces the number of accesses to the descriptor.
v2: https://patchwork.kernel.org/project/netdevbpf/patch/20240821060307.46350-1-ende.tan@starfivetech.com/
- Avoid introducing a new function just to set the interrupt-on-completion
  bit, as it is wasteful to do so.
- Delegate the responsibility of calling dma_wmb() from main driver code
  to set_rx_owner() callbacks (i.e. let callbacks to manage the low-level
  ordering/barrier rather than cluttering up the main driver code).
v1: https://patchwork.kernel.org/project/netdevbpf/patch/20240814092438.3129-1-ende.tan@starfivetech.com/
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c   | 6 ++++--
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index 1c5802e0d7f4..dfcbe7036988 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -186,10 +186,12 @@ static void dwmac4_set_tx_owner(struct dma_desc *p)
 
 static void dwmac4_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
 {
-	p->des3 |= cpu_to_le32(RDES3_OWN | RDES3_BUFFER1_VALID_ADDR);
+	u32 flags = cpu_to_le32(RDES3_OWN | RDES3_BUFFER1_VALID_ADDR);
 
 	if (!disable_rx_ic)
-		p->des3 |= cpu_to_le32(RDES3_INT_ON_COMPLETION_EN);
+		flags |= cpu_to_le32(RDES3_INT_ON_COMPLETION_EN);
+
+	p->des3 |= flags;
 }
 
 static int dwmac4_get_tx_ls(struct dma_desc *p)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index fc82862a612c..0c7ea939f787 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -56,10 +56,12 @@ static void dwxgmac2_set_tx_owner(struct dma_desc *p)
 
 static void dwxgmac2_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
 {
-	p->des3 |= cpu_to_le32(XGMAC_RDES3_OWN);
+	u32 flags = cpu_to_le32(XGMAC_RDES3_OWN);
 
 	if (!disable_rx_ic)
-		p->des3 |= cpu_to_le32(XGMAC_RDES3_IOC);
+		 flags |= cpu_to_le32(XGMAC_RDES3_IOC);
+
+	p->des3 |= flags;
 }
 
 static int dwxgmac2_get_tx_ls(struct dma_desc *p)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
