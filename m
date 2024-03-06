Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4FE874942
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Mar 2024 09:12:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90602C6B46B;
	Thu,  7 Mar 2024 08:12:01 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2067.outbound.protection.outlook.com [40.107.247.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F684C64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Mar 2024 17:24:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJg8zvfR3Wejzc1b0YrH5/W9GbLA6jbDA9KGmndk4T2f/Jr0T/ERqqWt0n5/CYsSisQVAsvrIpjB8kWXTatUCPOzW1mo2KmUH5XGdS/F6he1g/FyM2IQAo8GLbDwDe1/fQFsPirsI3v7L95SHGZkysD/o+STDfWDiJrTDF8aafw+XxBzbKoLIkWxOt06wRffTKykix5QjXBP5QLtvMO6R0zOrgWwCq9VSilbOcIOvLNFGsQgJqM8JKV3G08lndZIQAhOuglw0RNbpuIqfreOaxpkSAhQIItVgqL3v78GAddQLHU3zWNVS+Y8+0AHdJvYYhdjHCGLiBv8KjWXWum6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGaeE1bYJJpRe+mBdhfHv5qwBoRinQKyAbpJJwn88Tk=;
 b=myAY95OjZrVKO85payh30tcikMMw+cgfBTDiVQzKjGgCvoLnocctjonDGURP0kQhpdsa/bSE0wl12fcFUPP91VdGOUZH8Vi2cPLvFrj+ReQX6U14CohpK8Ufv4vBygCHbVL9NtWJcGzKmUNXIMdmnL+CQGh1UYqN12hpw0u9hWJW9iKKk+Ay3/H2lUwCKh3dghDyJ1KCqaJKElAt23LQUGV0P0FxlIGsf1DEkNwLtaEU8FrbDuXhUXp14si7cseiOdQKvRBiMHlPV2f4oIVUJITxDCk+sczg/7uh3fL2l7XOOVOMGXRFQ1ER5GuHQ2STYWd68X820t/w58QdOTdMmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed); 
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGaeE1bYJJpRe+mBdhfHv5qwBoRinQKyAbpJJwn88Tk=;
 b=lU4DMf7byJmChVWyYz7oyfikMizNi5RYReyBqCXWYmKjYyaf8tUTWjhkyhbZSTx02Dw1UEqfdmqlYtSvO4awPTFbPRLptPE86z+EkCy2ORAQvJwOPradRs76ckMda27vyUSO9r6/6UGByM4Femjtl1tPg7pFOFVdtUKxndRrP9c=
Received: from AM6PR10CA0029.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::42)
 by PAXPR06MB8435.eurprd06.prod.outlook.com (2603:10a6:102:2bb::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 17:24:12 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:209:89:cafe::67) by AM6PR10CA0029.outlook.office365.com
 (2603:10a6:209:89::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24 via Frontend
 Transport; Wed, 6 Mar 2024 17:24:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.11 via Frontend Transport; Wed, 6 Mar 2024 17:24:12 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com
 with Microsoft SMTPSVC(10.0.17763.1697); 
 Wed, 6 Mar 2024 18:24:11 +0100
From: Catalin Popescu <catalin.popescu@leica-geosystems.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, xiaoning.wang@nxp.com,
 linux-imx@nxp.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com
Date: Wed,  6 Mar 2024 18:24:09 +0100
Message-Id: <20240306172409.878928-2-catalin.popescu@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306172409.878928-1-catalin.popescu@leica-geosystems.com>
References: <20240306172409.878928-1-catalin.popescu@leica-geosystems.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 06 Mar 2024 17:24:11.0885 (UTC)
 FILETIME=[1AD279D0:01DA6FEB]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E0:EE_|PAXPR06MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: c8286f58-2068-4353-b6f4-08dc3e023d6c
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IyWE2vJLJR6nmPl++kPGXNpl3CyNaoQZAVHlPZc+eW91VJow6PrDTUx4JAkmOjjoRX4m8l912gjWx9a0n175tVp/P9nrtoFrYj1Dql2aLtzaB1XvpmpLyHWHeMvoKkY8eGw/9/Q4KDR7lZb7sKQKlNNcRuqZh3Z3XW+fbDhOjoMBwkMKBdBgm+pc8NjUzcOQq6uKFsroAg8OEdodGDBEjvZPiZwY0HMpY+eRF9Ap1BQqoxKeA9wXeKBt6oCrhO+AN6rS+gd/YLD5/GJeE9AO+Y6UeM7fRHD3uVnI2LNYxzyZ0gdrHyb7haf9it0EDbdOmZV4QlOJdtIKhCCCGsdQiAxw/Z1+N9ryDv187LJdiMs+HuvHQ0rnjAxHnd7zkQGNRJArkcd7hvj+EA42aYlY8MIByiRudNwzrLZnYKRHBjqDvcG4osr/3Yaeh8TyCDLQbrzlNE5FcvV0CsP4EZQi4iogh5d9lAwN19ksTCw8dN6H380hb1/ikRvO862FqNl9vDS1H/Df/GVDlauvuNQP7Z/PSIsc8x3fNv9pZzc/XmhNCpbHJ08psEHSNR2+FBJybBSQvM4UGxDs82BpUpT3O83BMWX2uqmDiIL/Dzk9hZxHyH8N9GSfvApb/C4YOabm2OCSemGPefXvYtEXuswJ01e0sr3/6nSv1wlF8qnE76bXPbZabDzsSF9g0ZdnM9rAjmx3jFEYvfqzZXM3sdDxcwOMV3K4Vm+L2hGBft8XeW135LgGV9EKpLP9fLYl8o0K9q5RnD4e0Fa0ymuQEOI6Tw==
X-Forefront-Antispam-Report: CIP:193.8.40.94; CTRY:CH; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:hexagon.com; PTR:ahersrvdom50.leica-geosystems.com;
 CAT:NONE; SFS:(13230031)(82310400014)(36860700004)(376005)(921011); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 17:24:12.0846 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8286f58-2068-4353-b6f4-08dc3e023d6c
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a; Ip=[193.8.40.94];
 Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB8435
X-Mailman-Approved-At: Thu, 07 Mar 2024 08:12:00 +0000
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 bsp-development.geo@leica-geosystems.com, linux-kernel@vger.kernel.org,
 m.felsch@pengutronix.de,
 Catalin Popescu <catalin.popescu@leica-geosystems.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: dwmac-imx: add
	support for PHY WOL
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

Add support for PHY WOL capability into dwmac-imx MAC driver.
This is required to enable WOL feature on a platform where MAC
WOL capability is not sufficient and WOL capability built into
the PHY is actually needed.

Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 6b65420e11b5..9d7278c083bf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -59,6 +59,7 @@ struct imx_priv_data {
 	struct regmap *intf_regmap;
 	u32 intf_reg_off;
 	bool rmii_refclk_ext;
+	bool phy_wol;
 	void __iomem *base_addr;
 
 	const struct imx_dwmac_ops *ops;
@@ -312,6 +313,8 @@ imx_dwmac_parse_dt(struct imx_priv_data *dwmac, struct device *dev)
 		}
 	}
 
+	dwmac->phy_wol = of_property_read_bool(np, "nxp,phy-wol");
+
 	return err;
 }
 
@@ -353,6 +356,11 @@ static int imx_dwmac_probe(struct platform_device *pdev)
 	if (data->flags & STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY)
 		plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY;
 
+	if (dwmac->phy_wol)
+		plat_dat->flags |= STMMAC_FLAG_USE_PHY_WOL;
+	else
+		plat_dat->flags &= ~STMMAC_FLAG_USE_PHY_WOL;
+
 	/* Default TX Q0 to use TSO and rest TXQ for TBS */
 	for (int i = 1; i < plat_dat->tx_queues_to_use; i++)
 		plat_dat->tx_queues_cfg[i].tbs_en = 1;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
