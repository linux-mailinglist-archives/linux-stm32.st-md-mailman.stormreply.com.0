Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFV6A1Je/Gm7OwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 11:41:38 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AFC4E625B
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 11:41:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F0CEC8F29E;
	Thu,  7 May 2026 09:41:37 +0000 (UTC)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2093.outbound.protection.partner.outlook.cn [139.219.17.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBB5DC8F283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 09:41:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mvnz5UqMBvL+M5Xr4Jnm8Nk/MNJysnBIbLdhca3LACqD1BoHUdQKxrkK4J92V5rZIgeWmNfV4IBoMM2kFZ/7hL/zwUl5hxyL+OS1OUqxGDfZ/nok6Ssoa/YsxHKG09raNnjh3VMJbQfMMmdl4niiYhW8R6WbBXo15bDmYZ4EtDW1baD+1oS91+vKRfvPc5B0AOTu+aezCgqGPByVdZnY8O+tfMg6hh1yj/IwRhWpQt2bdm52tt52QEEH6hhzpfwLzbNu3M41pmoLuz/r99c/oEzLGKR1AuO/hfeyRJldkHJ7bLmkhjfKYd84jCL9Hf1tLnLYR+pQ0CPsnp1wPTs8iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtpCwbxADNdQXbuBzNH1WWX81KL62HCuG+ENlxQ0Cdk=;
 b=QczSlvX4uyvlybsiXvanY2W+K+OOyzHfQyDCV7WTLYZ2Rfd5B+KsE9vQzFO+L5V9o1wpb0W2RXBO0BYTy41hxVWRhClt/I5ncA/BTEhDh2mruKRTdWNDFOA3vA6WO4D7XKlKFAgoAZFzpCgLNf8Zvp67zFbJ1wMbOsFUJDM1VDuOw1dLD1e7aV//rE3Sk8LiZEjQBUNrZO+L3rWj/JInMiWS/NlYihNLJwf8J87B/stwJZy9TGDsqh4WZC7yPlyZ5EMdj63tWmk5vcdZbH3I8e1C/u5k+v4y2TQElpe5/FHaLE7l6XbLY7LO8fuN2txSU+EhcteGV40+Sg+qgVI9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12) by BJXPR01MB0870.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:14::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 09:41:29 +0000
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 ([fe80::e2de:92aa:4c1c:a829]) by
 BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn ([fe80::e2de:92aa:4c1c:a829%6])
 with mapi id 15.20.9846.025; Thu, 7 May 2026 09:41:29 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor@kernel.org>, netdev@vger.kernel.org
Date: Thu,  7 May 2026 17:41:14 +0800
Message-Id: <20260507094115.8355-5-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260507094115.8355-1-minda.chen@starfivetech.com>
References: <20260507094115.8355-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: SHXPR01CA0013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::22) To BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJXPR01MB0855:EE_|BJXPR01MB0870:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b502456-28d0-495f-22a4-08deac1cd08d
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: HIhJK1YtZ6lp51s+HNi1R3NcgL9tF5ioTL4n1H6A1OrXegdK/B8ve4SYTFBGfWKwhZwvVxf01lZsP9X8zINnVbLqCumWmmKfxoUJv/t7bxqpp/Ho0km5CNGWZaHpJ8xDif/whzg02LN/b7n3i1F37LgcXZNKXhNnGi/w2nF7/liPi7/S2m7GTIpMg6Bhc+S0k7z7mtg6En7ky6GZl+kcQ5QWbxY5eKz/B5YygPt70F/3zjdbXMtoNYLSPhEw3iyqgkpkQGy7q1//Od3gztipqat7332sF1CNY+UiJju8mamGv0aUvBiz3qEuNI9kXca+UMS5uSifoQ5qPQ8vRSiGFplh1wP9ujS1cJU98vWXCx8pxXnXYUHNF2ZyEI+T3HOI3YyfOFdyiKztoZmUSkVCPMa+U92PMZ8iiv+Q+iXsq/3zt5IvVO+Zqk51Pb/XcUA3/p5f25WG+2xhdhNN6ekijXwesyNHBxY3JhPe/C6RQhxldGHS5bt4eQcG7nDFDnr2u9jNWshYrKUCRHnPZsJ20qiYdw77vRB4TvUzYNP+Lw2kZpbXCzENhmPfLFYA5Zo2g+XRot6wrhKvyVR5X5CpBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JH+A4q0si3HNA/T2TmKICAUHfOv6Wpdjw4bnUwQ9JmksHsxoMwvrX3A2ZGwE?=
 =?us-ascii?Q?8YH9RqQY4BDIiZmJCB3ckYU+VYXwaNbU1GxuGAE9Ula8s2squcPN20E4p5OJ?=
 =?us-ascii?Q?bFWiJUB8zCYYWe5Uf6yvKBhDSJny/7wLuWbqY3jJa1Qboiu8dLn1DPF3GAvX?=
 =?us-ascii?Q?V74DkU0XN5CQuwWmXqNaikJmQttZVF+p0iwF1muYkR7auawZjnKrtP1u4PBF?=
 =?us-ascii?Q?xrhtegvFji/jcnnVAq4jnZg04zEa66GfwsFTUdA7pGeO6lCwJKSbkOpUm232?=
 =?us-ascii?Q?cIQtLBJlZ+2A0cY9HQTVScoIFz1x5U4wmHCgEMjRf/+Ntu6ZIsHDkVcPDoRs?=
 =?us-ascii?Q?oUaIZGUsmcmW/rF9Gf/0WaHj/qco0L5vki9qVfZKwDiLVlGJAxOcs/o05uKT?=
 =?us-ascii?Q?eflHfbk8FuHT5u/F8RourqK3lDuG+VlRU0uXkPQzdGWymvRZ4qeQQT0qnLQM?=
 =?us-ascii?Q?7J3t9vzJKyvGfgi1GOA7d6IWpvPQipaJSQNKXbJ7JaKKUgNrZa81qL0N9Pyw?=
 =?us-ascii?Q?QmHMFUc+HB7IqOOTJeFy0kPiUInTLMnvTesaTOpvVzpzz93hPmS82ovdA/+q?=
 =?us-ascii?Q?JtqvPYS4yWM7xCltPuBFZMJ85BIHJeqt2nkSSykTezIFsBHPsWmvRJB2Wd9J?=
 =?us-ascii?Q?6p/l+hfsqlBFLm7VD+vJedhpRNkTRASHlwIkna7aFcu7mMX+K53dbkm1O5p3?=
 =?us-ascii?Q?WROd6ZFyGyTWI+xTMFF2XzVr82NU+NoE247FV1QDuW9G/4IVT8V54F+HhyFt?=
 =?us-ascii?Q?Rt5dgpibxJKTGJXxJR2Ta3ZNCR0jI9uScIHLdnCwyS8Dj9xELXzQErWRUugW?=
 =?us-ascii?Q?6pCFTwBcRUpdgnoZpz/sCS8pNbv33DTUwv55fIC5YkobtaOeF+F7YkQdvDIm?=
 =?us-ascii?Q?4hDco9KFr6Ib9PTCTd6mb//DE0et5z/pOshrjox2QEGT1V9PN+FEKpvlEK3x?=
 =?us-ascii?Q?8qFr0DRvden59hbIMAZFrzFAy95m3CG6CYVth6UGLzEXUQ0UPkQneAp1YAPQ?=
 =?us-ascii?Q?3TOpvydHRGkS56thoISbM4UnbQqmA7iXiNB28/lJ5X8+T97uv3Jx2Oh8fP3q?=
 =?us-ascii?Q?7VqTJOlYm9vHXhOwk8vJa0q0VOhU0lvCCyhKBptK03Dgo4vDbNy92G94fVZ2?=
 =?us-ascii?Q?jCqs63yz7SouR3+G0rmdLcB984woK7qh0wbEfvd0y/TAHdt7F5ABZRNr8yx/?=
 =?us-ascii?Q?sa2QVMR8vFb1IOTDVCWsYyVUqccBJR3AxQrLpJAL+MtjxbMwJBrt9wbmzA29?=
 =?us-ascii?Q?efmpc1JTdgCL05ViFcYOQ0FtrYiM/cPcAXJNYX28Gw9QPoLFA6aKS67PywHl?=
 =?us-ascii?Q?e67iRMp3W8cONM7vzs4MyvsplSiNY4c0EYNvoAvl0m+rbAiBZUjcjj6bAQh6?=
 =?us-ascii?Q?LAfDAmtSAEzU+V8LEZzUAkSAiuppag5NaeglUTpHWryZwfZseSCOACoWtlk8?=
 =?us-ascii?Q?2k0paJ1/Y9uKra5wO/Un33V0DURNXnkLtF4LqYrfxOb/DPglJ4IdrgAhlSF/?=
 =?us-ascii?Q?exCfZ//HGug3XJNhpm7yahtoujNbySvRzTxlymh5+bjc1lNxqO4Woj23ojPc?=
 =?us-ascii?Q?bULHUGSCN0myLuCCRkgkuErxEUi0c/JcjCtxlnDvD9QvESKwOARYIgfIptWE?=
 =?us-ascii?Q?e+3u9+kOTNwXPBMzclerXUvpUqG9NCIpBJiNPmhYYY4H2ed4ekO6gREVMDKS?=
 =?us-ascii?Q?H6jI3IP5U48heYlIvDd2Y2SHGuN029yn5Y/BXYGz2kBIlGX0lCsSL6DO3a4Q?=
 =?us-ascii?Q?mGgcVi4vjFIVLIWA6iFK13/aBVCH02g=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b502456-28d0-495f-22a4-08deac1cd08d
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:41:29.2467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+QIXqgFGzAt6d5HC+LrbqA5LyVOl7CbQq4C9iCnkVxXrIxFgQ5uj4qC5QUzIcb/2UATyMzioMVDEUvVFsVAYzmh8VN6CsVNIux/e/tX93Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0870
Cc: devicetree@vger.kernel.org, Minda Chen <minda.chen@starfivetech.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [net-next v3 4/5] net: stmmac: starfive: Add jhb100
	SGMII interface
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
X-Rspamd-Queue-Id: D0AFC4E625B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:alexandre.torgue@foss.st.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:emil.renner.berthing@canonical.com,m:robh+dt@kernel.org,m:krzk+dt@kernel.org,m:conor@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:minda.chen@starfivetech.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:robh@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,canonical.com,vger.kernel.org];
	FORGED_SENDER(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.236];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,starfivetech.com:mid]
X-Rspamd-Action: no action

Add jhb100 compatible and SGMII support. jhb100 soc contains
2 SGMII interfaces and integrated with serdes PHY. SGMII with
split TX/RX MAC clock and need to set 2.5M/25M/125M TX/RX clock
rate in 10M/100M/1000M speed mode.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
Reviewed-by: Sai Krishna <saikrishnag@marvell.com>
---
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 59 ++++++++++++++-----
 1 file changed, 45 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index 16b955a6d77b..bd86a39b79f0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -26,6 +26,7 @@ struct starfive_dwmac_data {
 struct starfive_dwmac {
 	struct device *dev;
 	const struct starfive_dwmac_data *data;
+	struct clk *sgmii_rx;
 };
 
 static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
@@ -68,6 +69,25 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	return 0;
 }
 
+static int stmmac_starfive_sgmii_set_clk_rate(void *bsp_priv, struct clk *clk_tx_i,
+					      phy_interface_t __maybe_unused interface,
+					      int speed)
+{
+	struct starfive_dwmac *dwmac = (void *)bsp_priv;
+	long rate = rgmii_clock(speed);
+	int ret;
+
+	/* MAC clock rate the same as RGMII */
+	if (rate < 0)
+		return 0;
+
+	ret = clk_set_rate(clk_tx_i, rate);
+	if (ret)
+		return ret;
+
+	return clk_set_rate(dwmac->sgmii_rx, rate);
+}
+
 static int starfive_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -102,23 +122,33 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(clk_gtx),
 				     "error getting gtx clock\n");
 
-	/* Generally, the rgmii_tx clock is provided by the internal clock,
-	 * which needs to match the corresponding clock frequency according
-	 * to different speeds. If the rgmii_tx clock is provided by the
-	 * external rgmii_rxin, there is no need to configure the clock
-	 * internally, because rgmii_rxin will be adaptively adjusted.
-	 */
-	if (!device_property_read_bool(&pdev->dev, "starfive,tx-use-rgmii-clk"))
-		plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
-
 	dwmac->dev = &pdev->dev;
-	plat_dat->flags |= STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP;
 	plat_dat->bsp_priv = dwmac;
-	plat_dat->dma_cfg->dche = true;
+	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_SGMII) {
+		dwmac->sgmii_rx = devm_clk_get_enabled(&pdev->dev, "sgmii_rx");
+		if (IS_ERR(dwmac->sgmii_rx))
+			return dev_err_probe(&pdev->dev,
+					     PTR_ERR(dwmac->sgmii_rx),
+					     "error getting sgmii rx clock\n");
+		plat_dat->set_clk_tx_rate = stmmac_starfive_sgmii_set_clk_rate;
+	} else {
+		/*
+		 * Generally, the rgmii_tx clock is provided by the internal clock,
+		 * which needs to match the corresponding clock frequency according
+		 * to different speeds. If the rgmii_tx clock is provided by the
+		 * external rgmii_rxin, there is no need to configure the clock
+		 * internally, because rgmii_rxin will be adaptively adjusted.
+		 */
+		if (!device_property_read_bool(&pdev->dev, "starfive,tx-use-rgmii-clk"))
+			plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
+
+		err = starfive_dwmac_set_mode(plat_dat);
+		if (err)
+			return err;
+	}
 
-	err = starfive_dwmac_set_mode(plat_dat);
-	if (err)
-		return err;
+	plat_dat->flags |= STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP;
+	plat_dat->dma_cfg->dche = true;
 
 	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 }
@@ -130,6 +160,7 @@ static const struct starfive_dwmac_data jh7100_data = {
 static const struct of_device_id starfive_dwmac_match[] = {
 	{ .compatible = "starfive,jh7100-dwmac", .data = &jh7100_data },
 	{ .compatible = "starfive,jh7110-dwmac" },
+	{ .compatible = "starfive,jhb100-dwmac" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, starfive_dwmac_match);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
