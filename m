Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE688AD67E2
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 08:21:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B173C36B24;
	Thu, 12 Jun 2025 06:21:03 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F607C36B16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 06:21:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILjHp5vbDFkPmZgdl5W5+NVBrce2/lHOIXnQ6tLTQ1P12BCymvSUwSx/GVl15JqZDwM78m2xGWqRyWyVXBg+FE/DvKiUiCmXRNYWvgiCy40xazifZzB9FJMs2aZIBeKYlPQmp3nFujDwOdEoL8VpvZ4kNVIwedGemNKFSWubFgTdCN7ibIml/A44SvsPFcbE/DMp/BCKrFgHg2ZXiy+ykCsLiaolTSeH/9DMRamdDy8FAieuSsL9eL0kgBs/5OoAgLfnPTYBsCD3/ZuqobmRplg0SvMNKyFuGzZzfcCZQ9sF8C5ydeAYG0Brka92Gf0v+Q65+ZqK4PmpHnipjn3X0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vf3htj/37Nn8PuzXv7xeq7hBiVeRakom7YIGpBCgQas=;
 b=Zi1FTcE5ptBHTdKi5BM0oBfadflaA4lMKDebvC9HLrT8d12Bwl+GFkuPxTBYurDpsStxUw/CZwOcNmuNpjZtiqB86EysYecVOksCEH3FASsYdrvipNNioA4KHnufYAXaMG2nwX/8W2mm+bshLjSf/c5pjC2y2rJv4pKCU7oRYC5WVi2kiLpsrkL+up04skPWFU1hIHVIx8ECnFrtq5qtWqGh6xHt2WxFoCjAUYKAo7uPY2y5V/AU/3NFMsFVLtyC3uv/EKKbwu32/r9qp1j+xwMaMTx7je4IglYWsmqGnoI565mZIS89dsvh6dHlfjj1RvSXl+JlPS6ttW1wbdnj1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lunn.ch smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vf3htj/37Nn8PuzXv7xeq7hBiVeRakom7YIGpBCgQas=;
 b=CqX8p1Zmjfddz/46kgDPxJZq2PQ9rvmdppjm4GXxR/mLdFbGjRJdcVkBnQsY4aPSzmFdpYnXpvn1SaobC8Tbp0dFc+sbAK2bm4lq089ZDBQZc3CW6F0440eJPCEodSfUFtLPE+bNQBazr+1XwH/bbdRBs238sCofchR1ls52MlV/7VXuHofQx6tI0hC1DLaUIccWvXk2NsgfcjpU2NxOsqo9zutS9cjgXbzux3OUvYakZX+14xGe4Kfl8sDH115abzev/EjM5WXF/GKyzclzSARJjJAI8Avtb6KNJcT+c+L2a52M4QBbXtJiqEDfpomNNRcqEEhOaVeqLa4JuBaCXQ==
Received: from MW4PR03CA0064.namprd03.prod.outlook.com (2603:10b6:303:b6::9)
 by CY5PR12MB6274.namprd12.prod.outlook.com (2603:10b6:930:21::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 06:20:58 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:303:b6:cafe::43) by MW4PR03CA0064.outlook.office365.com
 (2603:10b6:303:b6::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Thu,
 12 Jun 2025 06:20:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 06:20:57 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 11 Jun
 2025 23:20:38 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 11 Jun
 2025 23:20:37 -0700
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 11 Jun 2025 23:20:35 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 12 Jun 2025 07:20:32 +0100
Message-ID: <20250612062032.293275-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-NVConfidentiality: public
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|CY5PR12MB6274:EE_
X-MS-Office365-Filtering-Correlation-Id: c6ac495e-2cbd-47b7-9377-08dda9794b50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|7416014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lpBQwNAQx2IFxOtD6CELvshOgAi88aAL+cy7e26dHdt6FAq+TzFB5XKJeBoM?=
 =?us-ascii?Q?BZrQcPeAVeMJbFDSiBeha8Nokh/j94i0jE7hNH2H1V0YK2JaPv+FD6IcoFDK?=
 =?us-ascii?Q?porkSFGB2UxnPIT+/jE+8fZqjJ934kkgf2szgGVHhAxTaTuUGrpaxjSxd7sE?=
 =?us-ascii?Q?k4HZXvA+ck+PXSWcvfQ0SRbYRBxthvPrHcHoRbn7HCJWOYim8je7WZLRn/yp?=
 =?us-ascii?Q?sQEWtndnxPgkFzqSd8REPKZYOOL6OGU3KKLfKz+G6sHmKzjzweSkUp9+iJ8Q?=
 =?us-ascii?Q?EBdfmWdd0q1CE2Lwn/llvxqKpbvtU1VlBtgIO0vHwQPaRa8lk7HXyY0D11Hv?=
 =?us-ascii?Q?X/wyPC5K9pEG+Yu7CffHpii14E6BoG+jlVKQEqE9Ns+EwQdE0fUXVuzcxcYm?=
 =?us-ascii?Q?SKW2gEpofYbKDwVHqjmWpHAnxDxaxxM7Q1NOo4vNLjLqCSFy0eGJvSYDMAqq?=
 =?us-ascii?Q?b7gX+WGN3ThNln9s6dg18HSZ8YMKLXdjh0HPyAbhOxbidX55RHdwjm0v8AkW?=
 =?us-ascii?Q?s3kwLDsVGlKjb72tvxtRKTQiLrD6bFYwYjdCaMwvHrTgZltb+tcOVqC69gmy?=
 =?us-ascii?Q?9BBrcdtxHaRQREQLs8OIoOJ52OKzcG7N9zG5/1R4+I42rCvrjcEm/deN9wPP?=
 =?us-ascii?Q?opUh81JQTGhUJoWd08f+HavDstwAHcjwqnohYaqxHNkLPyaSOF20vviOxwMH?=
 =?us-ascii?Q?KeEbgwEGWxJtSdHkpetrb/Q7jLu1zKJE3MXvgJXQQDBeGLCXLG8NArLsunIr?=
 =?us-ascii?Q?FRxFYw2KGmf5Ssz5Y91KDc0JRTfiYNAPU7Um/MY5u/e6tdc/4HFKHL4jTflj?=
 =?us-ascii?Q?4FgQlQkJi2l2hMHDjaDw03kUWg5ac3brsjtihtbd0Jmi8ijkH3whl6i5BzLw?=
 =?us-ascii?Q?D6nurr1onB3CW4BhamvO0fo75Z3GscPje8DYqsMSiCNuWvJdeSVjCWtbpd9X?=
 =?us-ascii?Q?T5W4WqyRuN9CWOfTcyRewNCqKWLYgH3lafm0ulgBUTBoKcljlJTcKUKZf4KP?=
 =?us-ascii?Q?qxMLptxt4fKzZBKM7xV43iOqAVvjlRz3Mv9uPUJw4XDDyBZ2uj3vWHs+HwA5?=
 =?us-ascii?Q?8EjFCbN7ZgMsXY41BAnxN3Uml0QUGZa2ypIsjy2Mkxwyqv8Ncmxfo/wLtZTx?=
 =?us-ascii?Q?XfnLJlHxcdVXv+F1073dwzxjIsoXXSAFpsUG/oFDJStjmi8rEh97LAha/tKz?=
 =?us-ascii?Q?XhwvJbIvM/yxyq852/P22bKy6M9VVUlpQ2VJdMNKqs+hmXddwoPdcnVw8Fwa?=
 =?us-ascii?Q?lcp2QCZ+kuIgzwo8tRfbobaDusgEC8eW1HtiaUUrvsv7FOIqd1Gx5bMb/VdD?=
 =?us-ascii?Q?qSQEmtkSvrFWO/HObTKM+t7bdriaemuEQnicZJS0V+nLPqLYOOZ5J64PObgV?=
 =?us-ascii?Q?bVvRjWOOCDvw6JCfA5vFyZeLIb71Fuyua5iLTSByfr+96ismBclz3qTbA4L5?=
 =?us-ascii?Q?I+0mjDuATOyoTxAMgGpIaQRuszvhWOHD1tBWk6RtFEXtQD/CWDRhDUKnPpRW?=
 =?us-ascii?Q?jfXBzpdm40RY0OrrjEFdiw9XMrRoxBpLAMOa?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(7416014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 06:20:57.5764 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6ac495e-2cbd-47b7-9377-08dda9794b50
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6274
Cc: linux-tegra@vger.kernel.org, netdev@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Subject: [Linux-stm32] [PATCH] net: stmmac: Fix PTP ref clock for Tegra234
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

Since commit 030ce919e114 ("net: stmmac: make sure that ptp_rate is not
0 before configuring timestamping") was added the following error is
observed on Tegra234:

 ERR KERN tegra-mgbe 6800000.ethernet eth0: Invalid PTP clock rate
 WARNING KERN tegra-mgbe 6800000.ethernet eth0: PTP init failed

It turns out that the Tegra234 device-tree binding defines the PTP ref
clock name as 'ptp-ref' and not 'ptp_ref' and the above commit now
exposes this and that the PTP clock is not configured correctly.

Ideally, we would rename the PTP ref clock for Tegra234 to fix this but
this will break backward compatibility with existing device-tree blobs.
Therefore, fix this by using the name 'ptp-ref' for devices that are
compatible with 'nvidia,tegra234-mgbe'.

Fixes: d8ca113724e7 ("net: stmmac: tegra: Add MGBE support")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index b80c1efdb323..f82a7d55ea0a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -635,8 +635,12 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	}
 	clk_prepare_enable(plat->pclk);
 
+	if (of_device_is_compatible(np, "nvidia,tegra234-mgbe"))
+		plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp-ref");
+	else
+		plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref");
+
 	/* Fall-back to main clock in case of no PTP ref is passed */
-	plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref");
 	if (IS_ERR(plat->clk_ptp_ref)) {
 		plat->clk_ptp_rate = clk_get_rate(plat->stmmac_clk);
 		plat->clk_ptp_ref = NULL;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
