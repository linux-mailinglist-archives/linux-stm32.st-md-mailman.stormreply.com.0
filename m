Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B426085BB45
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Feb 2024 13:00:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F578C69067;
	Tue, 20 Feb 2024 12:00:38 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2047.outbound.protection.outlook.com [40.107.13.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FE30C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 12:00:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOfnnk0Rn3Lr4+DmRVuZOuq0GyL59GF4xxwv6t0q91dyEKLNytruOaCK8UWaiSVSkzjJ//tbY0E7MGkKnXeRryD88vBvr8mOADLIFPi7Y1VtbCcS6V3IgogHDO/5Owqu7EMmvmuydPtMDFafCnEMW38zL2DV3MULh0f0nIgKoV7nvjUdKdIu1NFziLJrSi9RYxfGpx0WkxtmrQ2dw0ISzkht4Ea3mU1CAxtfznvL4UZEkV7I184AZk66o8F5qgG7yifA1GT3rFYU+uTe2Oo/ZNllO9CASOT+EghE6fvyK8LA+4JjAIGmJqrg31bT2sCy5jJDWgqOYRFrCsYBjnS0sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qzzdcudvdkHNgi4N8pigKYmK//NqwWyKzJKnYOQOFw0=;
 b=SVn1AlX3aaKT2+ofGlnsYNs8ZqHgpTQWrdhuUhNc7N6FWRa2aq9P143jBTB34LbZ1Z0PO+YvqRwCDvgrcWxDlg1mI8OMMLiti7einQpHOahq0C6vSN1FMXbsCVMBh10ow4eNDtShAVwXTh5Y1mdGw2Z7GoSlHO19Mt1BeWjvMZSy9QS4MT0FNvm3TXtnPwR7q1i+D13zL/TyVRZrxnp75Lh3PJTjtWuO8W4INaNcCUN/PxhbYmp4NkWleDGtwwFTn3qn64z92Dk0TpJF2fJbhND9fkXxhE8g0RUkGuEWPgnVHJVNPH7CRw1rCJh58BaRt2I/8fywPQrYJo2kO+/Cbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=davemloft.net smtp.mailfrom=axis.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzzdcudvdkHNgi4N8pigKYmK//NqwWyKzJKnYOQOFw0=;
 b=G3HImeI5iuJLz5Bi/rz2WbCv4/5s/2m9zRHR1v03wX5gCMrvsXKGLjujdwRsjXsuepzHQU9yj/8Hcb06iMC0Y+8JHGreNSgykQ9hrSKR+3FGchtROyaQpIgVN+Ypuw7/BRpkjD9bYnikJCLbGRu5jmhY05woT1Ra+OCqa4xno1I=
Received: from AS9PR06CA0282.eurprd06.prod.outlook.com (2603:10a6:20b:45a::26)
 by PAXPR02MB7213.eurprd02.prod.outlook.com (2603:10a6:102:1bd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 12:00:34 +0000
Received: from AM3PEPF0000A78F.eurprd04.prod.outlook.com
 (2603:10a6:20b:45a:cafe::b7) by AS9PR06CA0282.outlook.office365.com
 (2603:10a6:20b:45a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38 via Frontend
 Transport; Tue, 20 Feb 2024 12:00:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com; 
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A78F.mail.protection.outlook.com (10.167.16.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 20 Feb 2024 12:00:33 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 20 Feb
 2024 13:00:33 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 20 Feb
 2024 13:00:33 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 20 Feb 2024 13:00:33 +0100
Received: from pc55637-2337.se.axis.com (pc55637-2337.se.axis.com [10.88.4.11])
 by se-intmail01x.se.axis.com (Postfix) with ESMTP id 2265314AC1;
 Tue, 20 Feb 2024 13:00:33 +0100 (CET)
Received: by pc55637-2337.se.axis.com (Postfix, from userid 363)
 id 1E5C8236949A; Tue, 20 Feb 2024 13:00:33 +0100 (CET)
From: Jesper Nilsson <jesper.nilsson@axis.com>
Date: Tue, 20 Feb 2024 13:00:22 +0100
MIME-Version: 1.0
Message-ID: <20240220-stmmac_stats-v2-1-0a78863bec70@axis.com>
X-B4-Tracking: v=1; b=H4sIAFWU1GUC/3XMQQrCMBCF4auUWRvJpGkUV95DioRmYmeRVjKhV
 Ervbuze5f/gfRsIZSaBW7NBpoWF56mGOTUwjH56keJQG4w2Vht0SkpKfnhK8UUUtZ3DYJ0OmqB
 e3pkirwf36GuPLGXOn0Nf8Lf+gRZUqC7addFbh2283v3Kch7mBP2+719HGxKTpwAAAA==
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708430433; l=3666;
 i=jesper.nilsson@axis.com; s=20240216; h=from:subject:message-id;
 bh=hBJYtvzCqK4bjtjNskkAyjPrNCbW87eKF+Joa4yX2AA=;
 b=iiesv1bp0is9dBFTNZZGyIE6OLENAt4pTnbzaEuncAR8hAQMVAGSQMVzg2nva7X55AEu4roew
 30a4X5PIGN6AWUWKhqsCUmCaVzbPLRQq+g6KVPZ+Enp+zaXzbP3GWmz
X-Developer-Key: i=jesper.nilsson@axis.com; a=ed25519;
 pk=RDobTFVrTaE8iMP112Wk0CDiLdcV7I+OkaCECzhr/bI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78F:EE_|PAXPR02MB7213:EE_
X-MS-Office365-Filtering-Correlation-Id: ec25a5f5-4f43-4896-931c-08dc320b8afb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rdpyOHJUWVgtuYB273Zk0GCVxknZziDIaIbU/q1sHQwVZ3JWm9FkDW3HS0bkFhBWPsG9qO2uZFgQTfHC8YHjJmTJsavrwCZZcCIKtiuOyzy2/qBAVUJ8UCKUM9/kaoHzmba3G9V7RvJv0WwOwB2XzOG+PfhCLPo6d6hH+NK1+K6vRaf2I6W/WnLP1TjDcOIyLIERb9IgeBSVbKD3dODICYzlH2kNiCfQ0bWTOqpkLLtK9OX2O7qPbjhNWaCyHfKjXQGwE59OWBJ6e/QzV+kdYm7JRL2fwFunv5IPfu7fPfoUdTpjm6K4+lwQaa20mCTE5zSCSCEd5CfYUQGXy1C1w/5kMijkCHUX/B7HiB3HUoScQY0Fh2oE11HBTtu5pqeH7eQiqrCAm/NfuyqehZMjhM+fF4IB3Y34H2Shkzag5ZjugVWx56Zsl9WvyRG9Bv7rnfD2jGn7ZyY/q+N0mfMiMifFRLywM4tKgXHmTgyINZs+u/HtdVHwPO9QkHGzlgxkoXl94AawHfpBg/esh54VJi7jIwqVLckC9L7mj/pnUrgM5Y4awze4YScN6aq73MeJmQsXbTVcE39tRipVzDe54TD6t016y4bbyvjxiNGyAkOdBVEgjIJwRcGV/3iLhTjKO/ol44L5sI+Ww12dTEFwWw==
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(40470700004)(46966006); DIR:OUT; SFP:1101; 
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 12:00:33.7227 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec25a5f5-4f43-4896-931c-08dc320b8afb
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7213
Cc: Jesper Nilsson <jesper.nilsson@axis.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@axis.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] net: stmmac: mmc_core: Drop interrupt
 registers from stats
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

The MMC IPC interrupt status and interrupt mask registers are
of little use as Ethernet statistics, but incrementing counters
based on the current interrupt and interrupt mask registers
makes them actively misleading.

For example, if the interrupt mask is set to 0x08420842,
the current code will increment by that amount each iteration,
leading to the following sequence of nonsense:

mmc_rx_ipc_intr_mask: 969816526
mmc_rx_ipc_intr_mask: 1108361744

These registers have been included in the Ethernet statistics
since the first version of MMC back in 2011 (commit 1c901a46d57).
That commit also mentions the MMC interrupts as
"something to add later (if actually useful)".

If the registers are actually useful, they should probably
be part of the Ethernet register dump instead of statistics,
but for now, drop the counters for mmc_rx_ipc_intr and
mmc_rx_ipc_intr_mask completely.

Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>
---
Changes in v2:
- Drop the misleading registers completely
- Link to v1: https://lore.kernel.org/r/20240216-stmmac_stats-v1-1-7065fa4613f8@axis.com
---
 drivers/net/ethernet/stmicro/stmmac/mmc.h            | 3 ---
 drivers/net/ethernet/stmicro/stmmac/mmc_core.c       | 3 ---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 2 --
 3 files changed, 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc.h b/drivers/net/ethernet/stmicro/stmmac/mmc.h
index a0c05925883e..8cfba817491b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/mmc.h
+++ b/drivers/net/ethernet/stmicro/stmmac/mmc.h
@@ -78,9 +78,6 @@ struct stmmac_counters {
 	unsigned int mmc_rx_fifo_overflow;
 	unsigned int mmc_rx_vlan_frames_gb;
 	unsigned int mmc_rx_watchdog_error;
-	/* IPC */
-	unsigned int mmc_rx_ipc_intr_mask;
-	unsigned int mmc_rx_ipc_intr;
 	/* IPv4 */
 	unsigned int mmc_rx_ipv4_gd;
 	unsigned int mmc_rx_ipv4_hderr;
diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
index 6a7c1d325c46..ab3b7770f62d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
@@ -279,9 +279,6 @@ static void dwmac_mmc_read(void __iomem *mmcaddr, struct stmmac_counters *mmc)
 	mmc->mmc_rx_fifo_overflow += readl(mmcaddr + MMC_RX_FIFO_OVERFLOW);
 	mmc->mmc_rx_vlan_frames_gb += readl(mmcaddr + MMC_RX_VLAN_FRAMES_GB);
 	mmc->mmc_rx_watchdog_error += readl(mmcaddr + MMC_RX_WATCHDOG_ERROR);
-	/* IPC */
-	mmc->mmc_rx_ipc_intr_mask += readl(mmcaddr + MMC_RX_IPC_INTR_MASK);
-	mmc->mmc_rx_ipc_intr += readl(mmcaddr + MMC_RX_IPC_INTR);
 	/* IPv4 */
 	mmc->mmc_rx_ipv4_gd += readl(mmcaddr + MMC_RX_IPV4_GD);
 	mmc->mmc_rx_ipv4_hderr += readl(mmcaddr + MMC_RX_IPV4_HDERR);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index f628411ae4ae..28accdc98282 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -236,8 +236,6 @@ static const struct stmmac_stats stmmac_mmc[] = {
 	STMMAC_MMC_STAT(mmc_rx_fifo_overflow),
 	STMMAC_MMC_STAT(mmc_rx_vlan_frames_gb),
 	STMMAC_MMC_STAT(mmc_rx_watchdog_error),
-	STMMAC_MMC_STAT(mmc_rx_ipc_intr_mask),
-	STMMAC_MMC_STAT(mmc_rx_ipc_intr),
 	STMMAC_MMC_STAT(mmc_rx_ipv4_gd),
 	STMMAC_MMC_STAT(mmc_rx_ipv4_hderr),
 	STMMAC_MMC_STAT(mmc_rx_ipv4_nopay),

---
base-commit: 0dd3ee31125508cd67f7e7172247f05b7fd1753a
change-id: 20240216-stmmac_stats-e3561d460d0e

Best regards,
-- 

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
