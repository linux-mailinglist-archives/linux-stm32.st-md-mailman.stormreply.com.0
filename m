Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FA7C68991
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Nov 2025 10:42:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 585A8C628CF;
	Tue, 18 Nov 2025 09:42:00 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86876C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 09:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L/ZuUtKm2/sE7cdwEXicDQSkRQeYVOM81nL04//AKHk=; b=q5RkO1pIO7C1OVj6+a49cmpyYO
 iVx2KoZZ4jKybKEtiooSFVLVxvLTkIx4nXvT5ajVqjWxLz3ahG6tO1KR+0P+wRQ45CL+1Oz8G71ig
 n31ZdPzfl9ykipOXAbtielIuUjwamg5cpIRG0UcOLyvd0V1ifmi7bawhA2iH+CFc1OAmWCjjlx3Ho
 hX/vdT6NHy2foLpU0WtD3V9FdCmtGIYt25TKhI35YkKn6vHwCBSCeFS/urqy9Ptl+6+e4/DMbG+p+
 O/SMUbFQUfbJ5OnGVKT6een5YWCvy7A97FlbJFyMCpp4hiuspiVESXUY9oYqsjJ9zzJnrzrKKjZkZ
 kj/Q3KKA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57002 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vLIDO-0000000030R-1bJs;
 Tue, 18 Nov 2025 09:41:34 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vLIDN-0000000Evur-2NLU; Tue, 18 Nov 2025 09:41:33 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vLIDN-0000000Evur-2NLU@rmk-PC.armlinux.org.uk>
Date: Tue, 18 Nov 2025 09:41:33 +0000
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: convert priv->sph* to
 boolean and rename
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

priv->sph* only have 'true' and 'false' used with them, yet they are an
int. Change their type to a bool, and rename to make their usage more
clear.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  4 +--
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 26 +++++++++----------
 .../stmicro/stmmac/stmmac_selftests.c         |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_xdp.c  |  2 +-
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index e9ed5086c049..012b0a477255 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -254,8 +254,8 @@ struct stmmac_priv {
 	int hwts_tx_en;
 	bool tx_path_in_lpi_mode;
 	bool tso;
-	int sph;
-	int sph_cap;
+	bool sph_active;
+	bool sph_capable;
 	u32 sarc_type;
 	u32 rx_riwt[MTL_MAX_RX_QUEUES];
 	int hwts_rx_en;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d08ff8f5ff15..db68c89316ec 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1523,7 +1523,7 @@ static int stmmac_init_rx_buffers(struct stmmac_priv *priv,
 		buf->page_offset = stmmac_rx_offset(priv);
 	}
 
-	if (priv->sph && !buf->sec_page) {
+	if (priv->sph_active && !buf->sec_page) {
 		buf->sec_page = page_pool_alloc_pages(rx_q->page_pool, gfp);
 		if (!buf->sec_page)
 			return -ENOMEM;
@@ -2109,7 +2109,7 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 	pp_params.offset = stmmac_rx_offset(priv);
 	pp_params.max_len = dma_conf->dma_buf_sz;
 
-	if (priv->sph) {
+	if (priv->sph_active) {
 		pp_params.offset = 0;
 		pp_params.max_len += stmmac_rx_offset(priv);
 	}
@@ -3603,7 +3603,7 @@ static int stmmac_hw_setup(struct net_device *dev)
 	}
 
 	/* Enable Split Header */
-	sph_en = (priv->hw->rx_csum > 0) && priv->sph;
+	sph_en = (priv->hw->rx_csum > 0) && priv->sph_active;
 	for (chan = 0; chan < rx_cnt; chan++)
 		stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
 
@@ -4895,7 +4895,7 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
 				break;
 		}
 
-		if (priv->sph && !buf->sec_page) {
+		if (priv->sph_active && !buf->sec_page) {
 			buf->sec_page = page_pool_alloc_pages(rx_q->page_pool, gfp);
 			if (!buf->sec_page)
 				break;
@@ -4906,7 +4906,7 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
 		buf->addr = page_pool_get_dma_addr(buf->page) + buf->page_offset;
 
 		stmmac_set_desc_addr(priv, p, buf->addr);
-		if (priv->sph)
+		if (priv->sph_active)
 			stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, true);
 		else
 			stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, false);
@@ -4941,12 +4941,12 @@ static unsigned int stmmac_rx_buf1_len(struct stmmac_priv *priv,
 	int coe = priv->hw->rx_csum;
 
 	/* Not first descriptor, buffer is always zero */
-	if (priv->sph && len)
+	if (priv->sph_active && len)
 		return 0;
 
 	/* First descriptor, get split header length */
 	stmmac_get_rx_header_len(priv, p, &hlen);
-	if (priv->sph && hlen) {
+	if (priv->sph_active && hlen) {
 		priv->xstats.rx_split_hdr_pkt_n++;
 		return hlen;
 	}
@@ -4969,7 +4969,7 @@ static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
 	unsigned int plen = 0;
 
 	/* Not split header, buffer is not available */
-	if (!priv->sph)
+	if (!priv->sph_active)
 		return 0;
 
 	/* Not last descriptor */
@@ -6037,8 +6037,8 @@ static int stmmac_set_features(struct net_device *netdev,
 	 */
 	stmmac_rx_ipc(priv, priv->hw);
 
-	if (priv->sph_cap) {
-		bool sph_en = (priv->hw->rx_csum > 0) && priv->sph;
+	if (priv->sph_capable) {
+		bool sph_en = (priv->hw->rx_csum > 0) && priv->sph_active;
 		u32 chan;
 
 		for (chan = 0; chan < priv->plat->rx_queues_to_use; chan++)
@@ -6987,7 +6987,7 @@ int stmmac_xdp_open(struct net_device *dev)
 	}
 
 	/* Adjust Split header */
-	sph_en = (priv->hw->rx_csum > 0) && priv->sph;
+	sph_en = (priv->hw->rx_csum > 0) && priv->sph_active;
 
 	/* DMA RX Channel Configuration */
 	for (chan = 0; chan < rx_cnt; chan++) {
@@ -7736,8 +7736,8 @@ int stmmac_dvr_probe(struct device *device,
 	if (priv->dma_cap.sphen &&
 	    !(priv->plat->flags & STMMAC_FLAG_SPH_DISABLE)) {
 		ndev->hw_features |= NETIF_F_GRO;
-		priv->sph_cap = true;
-		priv->sph = priv->sph_cap;
+		priv->sph_capable = true;
+		priv->sph_active = priv->sph_capable;
 		dev_info(priv->device, "SPH feature enabled\n");
 	}
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index a01bc394d1ac..e90a2c469b9a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -1721,7 +1721,7 @@ static int stmmac_test_sph(struct stmmac_priv *priv)
 	struct stmmac_packet_attrs attr = { };
 	int ret;
 
-	if (!priv->sph)
+	if (!priv->sph_active)
 		return -EOPNOTSUPP;
 
 	/* Check for UDP first */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
index aa6f16d3df64..d7e4db7224b0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
@@ -129,7 +129,7 @@ int stmmac_xdp_set_prog(struct stmmac_priv *priv, struct bpf_prog *prog,
 		bpf_prog_put(old_prog);
 
 	/* Disable RX SPH for XDP operation */
-	priv->sph = priv->sph_cap && !stmmac_xdp_is_enabled(priv);
+	priv->sph_active = priv->sph_capable && !stmmac_xdp_is_enabled(priv);
 
 	if (if_running && need_update)
 		stmmac_xdp_open(dev);
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
