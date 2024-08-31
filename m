Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA50966E56
	for <lists+linux-stm32@lfdr.de>; Sat, 31 Aug 2024 03:11:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D626DC6DD9A;
	Sat, 31 Aug 2024 01:11:40 +0000 (UTC)
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2098.outbound.protection.partner.outlook.cn [139.219.146.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72CA1C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Aug 2024 01:11:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqCY2JssGcg69n2G+MDp7ZwETnoRv7srsDJoW9ajhgArxdhRfJlK8lk8kP4TvMK3HyeEb4tUje5nNUQkUFwD/paCFHurS+Xx/dLwms2C9a2FfaysflwiZ8HH/9fI23KpsUSVEbxEd7FU4wAhsRkKMSJU8iLP8TPVMugnAn/BS+F3IFFt/AhCs3zRdw4HC0CXoC8P91hfcaErzfsSAnvVsWRu+eJHmqox6/4CV4xRAO6zGaUf0ZPN4BPtpvW1qSeax8hODWG01KVXznmZQeI8VxSx0WDEgzce8+YJ/7hnctu4JpEdcV9Kix1wLEDC1WfnESid4z5HqyJmxI9uitlMHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MPHX9zImSSAX1HKiwc4rmn4gRL0LKYO6JSRmXkFBVc=;
 b=AA+CZQHFTNqhZN9TFDT4VIoxvntmaFOQS44XwffCJ7IwK7grKs0Dg9WLsiX1LXdyqELGFCRkxF2c2midanjXfBIrHCLD0RQq4yJdbKhXpQ3hkd4B9M8oeF/w4uo2Cw6Z13WOWUH4HrKeyl3d6cZTRYsEx7a44a4qYGfY6wIuYTsXo5Lj8PWfrP7vUo8+4f9gtdqc6woASiwIGYKvLt/bdVlODXqOBYKsmXPLNEizWY21iLJOerC0fMeaLYk8LcGi36HwMf+tMXMvAsRPAvlTZxsmRZjYSj25Ltoe9euy6VceoMf2rKhvpNOYAN+B24oHSRAeinP8bsZ5/D034U4uhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::7) by NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.23; Sat, 31 Aug
 2024 01:11:28 +0000
Received: from NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 ([fe80::e1c4:5bb3:adc:97f5]) by NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 ([fe80::e1c4:5bb3:adc:97f5%3]) with mapi id 15.20.7897.021; Sat, 31 Aug 2024
 01:11:28 +0000
From: ende.tan@starfivetech.com
To: netdev@vger.kernel.org
Date: Sat, 31 Aug 2024 09:11:14 +0800
Message-Id: <20240831011114.2065912-1-ende.tan@starfivetech.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: BJSPR01CA0002.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::14) To NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NTZPR01MB1018:EE_
X-MS-Office365-Filtering-Correlation-Id: 219f205b-570e-4bde-0dfd-08dcc959d774
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|366016|41320700013|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: Na8LEw5/rg9nVlZ73USLzd9Wij1GqdwqRh0Qyg1uhR67ExEjEihYTrREsvVHMPeT3HVM2ZPsHWW4vrGCw0kfdko2gAL+RKiNlRsN8tYEGs6zi48tEnzR3UhfDTGleziJ+eLFMxwOxop2uzsV3EqGZ/mH3llbAfH+Mz9ESw2SGxOopB2orPhr+V6yb4EMCc3zc1zoreGb6gZlPbk/MeIFaAt3Tlz0RudJPWNCPiF6bc8D8jkmHkGnuFCmT1tnY5t32qFQMsQwVNsum4fA35iydEPT1SnaovGbzmAc0s+e5oSZxbgO0rXaQekFHk7SIvv0bB++dycyVWIHXN+h5VWslGpMV2gAg+IFcmzrnI26/G4KVhHE8sJJVxoGetkbibhjDkA4iaXtk7YWb0DlDyl1EK32ENcXbZIKDSEOpkHfyD0GG91anmPMPmwDDTEdOpKmjcObFZm2NquGtDgNEjcMnALmcIsyNekJWQL+AXMTFgVxgxJA/GjbEXfbYZEC++taWVOYD4bm25l6+dy32J1PypUhJeQmDLd6w3unTPRpe7tCdPoE89BxFUuZ+IseXBzJ2zKrmAiPTJTaZ9TrNh5e1Udm1Fmn5yTYXOIdVhxogV1ym0n5mnXBAgKCP/NyTVVf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(366016)(41320700013)(1800799024)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RQfbzHU5rEVw4jm8pXTsXXyI2Zm/N/nhFDQs7ymokGMR+dCL6meBdQz6y6F7?=
 =?us-ascii?Q?PlXnxrh/rip2XTWNRI4UvUVpqvQhljQrJuP5oTVrmPvbMyv7IzziqkTDazED?=
 =?us-ascii?Q?YSqcAHZuKg4bynk7IvdiiylAmPtPELSQEVG4NL9uW37icjh2ckYymAXlTi4G?=
 =?us-ascii?Q?Yx495BKr40UAcnXcGup3c0I//dUlcbYNjAjkdK1JKyILHSsRGXFZISfRLHY+?=
 =?us-ascii?Q?lw7xwN4Ef2hOUwYVhrCXUcsCIkPp3tvpuVNGMN3x70AEkwU77UlJQ0+TNIRx?=
 =?us-ascii?Q?OsnHbUP741OTnPjcBt3kNIhUyFV9vcfDtqGz/RYfNEyPiEe22GCS4vtn37vN?=
 =?us-ascii?Q?N+icvufs3fKkjfcJr21wSpblHjloHH2rrCjgExAUuqRIzSWCEPEWmujLcFV4?=
 =?us-ascii?Q?9oln6v+ktTsMK5d8mYu3sl5jJKEMA2CRx26yQE2zMI/lV+iT+PCZL95N40vs?=
 =?us-ascii?Q?SNqVQoQw0TG8IAHYWcGRfjIaPOUCMXnVg0ExzjJ4Uj1JTxzifzg3cvx7mVoE?=
 =?us-ascii?Q?0TUE4tTwZFzZKF22jNR/Py+UdXGx4zWUoLF+Mr+ZVrc/d+aPwJXt1rGyyQaW?=
 =?us-ascii?Q?A1pvt/FlPYDNxKefVeLw2Vm3rRkJ+02P8wUABjp8ax/TEiVgihCLwI30Ysw2?=
 =?us-ascii?Q?Ob3X5OcFPWRB6FLb5ViX2oYCChRMdm//cBczZT8xt11zZwf/RayGKN8gzOkp?=
 =?us-ascii?Q?kFG7ZhLGIuS6/79Ww46eiZ8zT0rl02bkxbLlDLiA1UXTR17jZYPR503olJqj?=
 =?us-ascii?Q?e9hMVe+s86usOTFDxw8RvQMKrLkA53jPyUu1utsL9Ejz40ptmET7hhALRN/u?=
 =?us-ascii?Q?9/bzw6hrQ8anhc021mcnLpw6ILjGeXsRtbQG+3cMcxksTXqiHxGVzkPc1JFo?=
 =?us-ascii?Q?hfRtV04dTKdoFyLt/eL7Aesc9bvCS/69ewVY+9UfCxRBdJhTusxovaGNUxzA?=
 =?us-ascii?Q?GcYvGrZqHGgOVe6vCllUjzzcgqoi2UlkxsE0CSpO3DHNfuZqumTNCFsVCTvZ?=
 =?us-ascii?Q?tUCGUgPFzVtWKeHCXCy9yxfrk6KR3J+o2wr9nmC3CpNdgrFnamGkc7NiGGcx?=
 =?us-ascii?Q?ddFTgf2hvFxQOoG/lPe49ZddDgDd56zFpGLHTyPSt+I1s5E6j3M4SifKV9lF?=
 =?us-ascii?Q?D/cJDqOeHlEeX319Y9SBNEeJkmFY+BG/pBvThqnyZHqY5UXWnrHLHw8lQ/xp?=
 =?us-ascii?Q?MEvi2xERuByE9FF4euS+vdd6C9iqx1p59YqxxQ2iVhxKCbrVvny45+dg9Bo5?=
 =?us-ascii?Q?w+Z1g9G9s4VbL4EeZXdVahfrvwlBZyufxl26Jb5XzPXfRoCckRWGnYcxwHbi?=
 =?us-ascii?Q?L68+7q4N1kraTWB3Bou8Jvz/7u34g+uYUwaDtkZmHGyk4/AhJwgSSJhLbY7K?=
 =?us-ascii?Q?TZZyHI+ukDW5FH4rw0JOn0hHPNSA3YgeB6QH1rzdJQgTAqwu7LgD9rAvzGxP?=
 =?us-ascii?Q?pcrKNi2eB3ZPFQDlxQTT7f1mzUAuOkgZUeguZ14ZRMPt8RfRmp7WqhTaS3/f?=
 =?us-ascii?Q?XQ1rSnmRqFIk7x6qWQKmiHME+iH1Mks34i9aLoJogeFvzkS6o1SRqt6BtnTJ?=
 =?us-ascii?Q?1X9+IFawCgxhd/klk1Id75AEMFcjnOr1ERXqIZsA4h+ygR3rHgLpaKeQmELr?=
 =?us-ascii?Q?NA=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 219f205b-570e-4bde-0dfd-08dcc959d774
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2024 01:11:28.5421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ql23xFgrJiefYanIDNpkG4lMU6OmorShxlmIdyHyNR252Y+z8bwfB5mohKrle+aSLq7TOIYgDsk2eBRZEOOIb3BXUfXI/s80YfJWeMbZ1bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1018
Cc: Tan En De <ende.tan@starfivetech.com>, andrew@lunn.ch, f.fainelli@gmail.com,
 leyfoon.tan@starfivetech.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 minda.chen@starfivetech.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, endeneer@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [net-next, v4,
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
v4:
- Batch the endian conversion cpu_to_le32()
v3: https://patchwork.kernel.org/project/netdevbpf/patch/20240829134043.323855-1-ende.tan@starfivetech.com/
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
index 1c5802e0d7f4..e99401bcc1f8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -186,10 +186,12 @@ static void dwmac4_set_tx_owner(struct dma_desc *p)
 
 static void dwmac4_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
 {
-	p->des3 |= cpu_to_le32(RDES3_OWN | RDES3_BUFFER1_VALID_ADDR);
+	u32 flags = (RDES3_OWN | RDES3_BUFFER1_VALID_ADDR);
 
 	if (!disable_rx_ic)
-		p->des3 |= cpu_to_le32(RDES3_INT_ON_COMPLETION_EN);
+		flags |= RDES3_INT_ON_COMPLETION_EN;
+
+	p->des3 |= cpu_to_le32(flags);
 }
 
 static int dwmac4_get_tx_ls(struct dma_desc *p)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index fc82862a612c..389aad7b5c1e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -56,10 +56,12 @@ static void dwxgmac2_set_tx_owner(struct dma_desc *p)
 
 static void dwxgmac2_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
 {
-	p->des3 |= cpu_to_le32(XGMAC_RDES3_OWN);
+	u32 flags = XGMAC_RDES3_OWN;
 
 	if (!disable_rx_ic)
-		p->des3 |= cpu_to_le32(XGMAC_RDES3_IOC);
+		flags |= XGMAC_RDES3_IOC;
+
+	p->des3 |= cpu_to_le32(flags);
 }
 
 static int dwxgmac2_get_tx_ls(struct dma_desc *p)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
