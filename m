Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOE2EISVrmnRGQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 10:40:20 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AD9236533
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 10:40:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAE36C8F280;
	Mon,  9 Mar 2026 09:40:19 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94516C8F27F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Mar 2026 09:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rb/EL+ezeQrS78OpMW6WHBRGNWy12ObztGzPIs+46Uo=; b=v4G7RkRmx4Jjw+TF283B4kYROV
 hIbQR9+SisWfrlA7U5oO3011nFVHQmYi9Qox+/onh8rQ67gf1eU1CDcfLX6G2Mang24ALU8lW4jtv
 J6BSMmDU814yRA8uUHJ0E6a3jde1pFqVlRbLgS0G5K05/lIQ53fCURSU+8JgJ5rrgaz1oxD7PdU5G
 iDORomrBL9g9PrJCVH2aeacu3bqTOtZL/tKYDOrm0ly0Pk9vVdFulhy6Bx/lC36+/5RxHQFr+J7tF
 CkNx6aBHgoC5FTp8RhoC2OdFU6fQykPxx5hGFdVxOryuoAfG+zT8G/xugHxkNIW5z8rjr33WKTEyr
 iq20IHqA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60972 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vzX5S-000000003Uy-1YJn;
 Mon, 09 Mar 2026 09:39:42 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vzX5P-0000000CVsK-0iwX; Mon, 09 Mar 2026 09:39:39 +0000
In-Reply-To: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vzX5P-0000000CVsK-0iwX@rmk-PC.armlinux.org.uk>
Date: Mon, 09 Mar 2026 09:39:39 +0000
Cc: imx@lists.linux.dev, s32@nxp.com, Yao Zi <me@ziyao.cc>,
 Frank Li <Frank.Li@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Samuel Holland <samuel@sholland.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Jan Petrous <jan.petrous@oss.nxp.com>, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v2 5/7] net: stmmac: use u8 for
 host_dma_width and similar struct members
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
X-Rspamd-Queue-Id: 17AD9236533
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[kernel];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:imx@lists.linux.dev,m:s32@nxp.com,m:me@ziyao.cc,m:Frank.Li@nxp.com,m:edumazet@google.com,m:jonathanh@nvidia.com,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:samuel@sholland.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-sunxi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:jan.petrous@oss.nxp.com,m:linux-mediatek@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:netdev@vger.kernel.org,m:andrew+netdev@lunn.ch,m:kernel@pengutronix.de,m:davem@davemloft.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.432];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,rmk-PC.armlinux.org.uk:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:email]
X-Rspamd-Action: no action

We aren't going to see >= 256-bit address busses soon, so reduce
host_dma_width and associated other struct members that initialise
this from u32 to u8.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c         | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c    | 6 +++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 include/linux/stmmac.h                                  | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 9f5a15b81f8a..9d1bd72ffb73 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -42,8 +42,8 @@
 struct imx_priv_data;
 
 struct imx_dwmac_ops {
-	u32 addr_width;
 	u32 flags;
+	u8 addr_width;
 	bool mac_rgmii_txclk_auto_adj;
 
 	int (*fix_soc_reset)(struct stmmac_priv *priv);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index a139db6a8cbb..30ae0dba7fff 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -93,9 +93,9 @@ struct mediatek_dwmac_variant {
 	const char * const *clk_list;
 	int num_clks;
 
-	u32 dma_bit_mask;
 	u32 rx_delay_max;
 	u32 tx_delay_max;
+	u8 dma_bit_mask;
 };
 
 /* list of clocks required for mac */
@@ -268,9 +268,9 @@ static const struct mediatek_dwmac_variant mt2712_gmac_variant = {
 		.dwmac_set_delay = mt2712_set_delay,
 		.clk_list = mt2712_dwmac_clk_l,
 		.num_clks = ARRAY_SIZE(mt2712_dwmac_clk_l),
-		.dma_bit_mask = 33,
 		.rx_delay_max = 17600,
 		.tx_delay_max = 17600,
+		.dma_bit_mask = 33,
 };
 
 static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
@@ -418,9 +418,9 @@ static const struct mediatek_dwmac_variant mt8195_gmac_variant = {
 	.dwmac_set_delay = mt8195_set_delay,
 	.clk_list = mt8195_dwmac_clk_l,
 	.num_clks = ARRAY_SIZE(mt8195_dwmac_clk_l),
-	.dma_bit_mask = 35,
 	.rx_delay_max = 9280,
 	.tx_delay_max = 9280,
+	.dma_bit_mask = 35,
 };
 
 static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *plat)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 388e9fdeb86c..3ccf20fdf52a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -91,8 +91,8 @@ struct ethqos_emac_driver_data {
 	unsigned int num_rgmii_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
+	u8 dma_addr_width;
 	const char *link_clk_name;
-	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 03fd85060a73..11886189bf51 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -243,7 +243,7 @@ struct plat_stmmacenet_data {
 	int unicast_filter_entries;
 	int tx_fifo_size;
 	int rx_fifo_size;
-	u32 host_dma_width;
+	u8 host_dma_width;
 	u8 rx_queues_to_use;
 	u8 tx_queues_to_use;
 	u8 rx_sched_algorithm;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
