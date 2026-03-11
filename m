Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGMcHueLsmkKNgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 10:48:23 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5582826FCEC
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 10:48:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3F5EC90093;
	Thu, 12 Mar 2026 09:48:22 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A46A3C90088
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2026 09:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vD9XV3c23C+2JgGGszHzOnaUIWcl3DV5rrl6x+Bs1b8=; b=d/yoTwYAxXOGixf5/HKQnmE4F7
 V98Pd6+wcStbYnzmHaSweyZOLIC8lkzqM6Ey8bHYXm1Lu54gYmnb6O0E42SOFjiJS0JwVSLk7KS9G
 vMzfXZfLRy/+BZTV4x2GbCSkC18pRrAsU5swWCoQ8k+MvBSyrFM5Abpe/kBrvxsjMfGlU1V6zZInX
 4srICa2H7bBoHlee+h6ruAYP79DO4AzwnKRGqCyadTPS9UrH0PNOKC2NxuOCXIZDQGyf40dWNG25/
 mn7IyR3+WHse/jIou9BA/ztMwH8fElCHuuK9AtJDaBCr5Hq7z0nGk4M7/I2aa5gdTaEFiXLdNFw/e
 rTu6mN2A==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37092 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1w0GFT-0000000069k-1aNb;
 Wed, 11 Mar 2026 09:53:04 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1w0GFQ-0000000CiTb-23hf; Wed, 11 Mar 2026 09:53:00 +0000
In-Reply-To: <abE7LWj04-JNxgS2@shell.armlinux.org.uk>
References: <abE7LWj04-JNxgS2@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1w0GFQ-0000000CiTb-23hf@rmk-PC.armlinux.org.uk>
Date: Wed, 11 Mar 2026 09:53:00 +0000
X-Mailman-Approved-At: Thu, 12 Mar 2026 09:48:20 +0000
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Alexei Starovoitov <ast@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 11/15] net: stmmac: add helper to get
 hardware transmit descriptor
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
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:hawk@kernel.org,m:daniel@iogearbox.net,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:ast@kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:sdf@fomichev.me,m:kuba@kernel.org,m:bpf@vger.kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.995];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,armlinux.org.uk:email]
X-Rspamd-Queue-Id: 5582826FCEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Provide a helper to get the hardware transmit descriptor that takes
account of whether extended format and TBS are being used, returning
the base struct dma_desc pointer. This avoids multiple instances where
these tests are open coded.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 87 ++++++-------------
 1 file changed, 25 insertions(+), 62 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 032ef9fba8b4..76e4dcf8f697 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -362,6 +362,18 @@ static inline u32 stmmac_tx_avail(struct stmmac_priv *priv, u32 queue)
 			  priv->dma_conf.dma_tx_size);
 }
 
+static struct dma_desc *stmmac_get_tx_desc(struct stmmac_priv *priv,
+					   struct stmmac_tx_queue *tx_q,
+					   unsigned int index)
+{
+	if (priv->extend_desc)
+		return &tx_q->dma_etx[index].basic;
+	else if (tx_q->tbs & STMMAC_TBS_AVAIL)
+		return &tx_q->dma_entx[index].basic;
+	else
+		return &tx_q->dma_tx[index];
+}
+
 static size_t stmmac_get_rx_desc_size(struct stmmac_priv *priv)
 {
 	if (priv->extend_desc)
@@ -1489,16 +1501,14 @@ static void stmmac_display_tx_rings(struct stmmac_priv *priv,
 
 		pr_info("\tTX Queue %d rings\n", queue);
 
-		if (priv->extend_desc) {
-			head_tx = (void *)tx_q->dma_etx;
+		if (priv->extend_desc)
 			desc_size = sizeof(struct dma_extended_desc);
-		} else if (tx_q->tbs & STMMAC_TBS_AVAIL) {
-			head_tx = (void *)tx_q->dma_entx;
+		else if (tx_q->tbs & STMMAC_TBS_AVAIL)
 			desc_size = sizeof(struct dma_edesc);
-		} else {
-			head_tx = (void *)tx_q->dma_tx;
+		else
 			desc_size = sizeof(struct dma_desc);
-		}
+
+		head_tx = stmmac_get_tx_desc(priv, tx_q, 0);
 
 		stmmac_display_ring(priv, head_tx, dma_conf->dma_tx_size, false,
 				    tx_q->dma_tx_phy, desc_size);
@@ -1587,13 +1597,7 @@ static void stmmac_clear_tx_descriptors(struct stmmac_priv *priv,
 		int last = (i == (dma_conf->dma_tx_size - 1));
 		struct dma_desc *p;
 
-		if (priv->extend_desc)
-			p = &tx_q->dma_etx[i].basic;
-		else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-			p = &tx_q->dma_entx[i].basic;
-		else
-			p = &tx_q->dma_tx[i];
-
+		p = stmmac_get_tx_desc(priv, tx_q, i);
 		stmmac_init_tx_desc(priv, p, priv->mode, last);
 	}
 }
@@ -2021,13 +2025,7 @@ static int __init_dma_tx_desc_rings(struct stmmac_priv *priv,
 	for (i = 0; i < dma_conf->dma_tx_size; i++) {
 		struct dma_desc *p;
 
-		if (priv->extend_desc)
-			p = &((tx_q->dma_etx + i)->basic);
-		else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-			p = &((tx_q->dma_entx + i)->basic);
-		else
-			p = tx_q->dma_tx + i;
-
+		p = stmmac_get_tx_desc(priv, tx_q, i);
 		stmmac_clear_desc(priv, p);
 		stmmac_set_tx_skb_dma_entry(tx_q, i, 0, 0, false);
 
@@ -2730,13 +2728,7 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 			continue;
 		}
 
-		if (likely(priv->extend_desc))
-			tx_desc = (struct dma_desc *)(tx_q->dma_etx + entry);
-		else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-			tx_desc = &tx_q->dma_entx[entry].basic;
-		else
-			tx_desc = tx_q->dma_tx + entry;
-
+		tx_desc = stmmac_get_tx_desc(priv, tx_q, entry);
 		dma_addr = xsk_buff_raw_get_dma(pool, xdp_desc.addr);
 		meta = xsk_buff_get_metadata(pool, xdp_desc.addr);
 		xsk_buff_raw_dma_sync_for_device(pool, dma_addr, xdp_desc.len);
@@ -2863,13 +2855,7 @@ static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue,
 			skb = NULL;
 		}
 
-		if (priv->extend_desc)
-			p = (struct dma_desc *)(tx_q->dma_etx + entry);
-		else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-			p = &tx_q->dma_entx[entry].basic;
-		else
-			p = tx_q->dma_tx + entry;
-
+		p = stmmac_get_tx_desc(priv, tx_q, entry);
 		status = stmmac_tx_status(priv,	&priv->xstats, p, priv->ioaddr);
 		/* Check if the descriptor is owned by the DMA */
 		if (unlikely(status & tx_dma_own))
@@ -4752,13 +4738,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		csum_insertion = !csum_insertion;
 	}
 
-	if (likely(priv->extend_desc))
-		desc = (struct dma_desc *)(tx_q->dma_etx + entry);
-	else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-		desc = &tx_q->dma_entx[entry].basic;
-	else
-		desc = tx_q->dma_tx + entry;
-
+	desc = stmmac_get_tx_desc(priv, tx_q, entry);
 	first = desc;
 
 	if (has_vlan)
@@ -4783,12 +4763,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		entry = STMMAC_GET_ENTRY(entry, priv->dma_conf.dma_tx_size);
 		WARN_ON(tx_q->tx_skbuff[entry]);
 
-		if (likely(priv->extend_desc))
-			desc = (struct dma_desc *)(tx_q->dma_etx + entry);
-		else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-			desc = &tx_q->dma_entx[entry].basic;
-		else
-			desc = tx_q->dma_tx + entry;
+		desc = stmmac_get_tx_desc(priv, tx_q, entry);
 
 		des = skb_frag_dma_map(priv->device, frag, 0, len,
 				       DMA_TO_DEVICE);
@@ -4829,13 +4804,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		set_ic = false;
 
 	if (set_ic) {
-		if (likely(priv->extend_desc))
-			desc = &tx_q->dma_etx[entry].basic;
-		else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-			desc = &tx_q->dma_entx[entry].basic;
-		else
-			desc = &tx_q->dma_tx[entry];
-
+		desc = stmmac_get_tx_desc(priv, tx_q, entry);
 		tx_q->tx_count_frames = 0;
 		stmmac_set_tx_ic(priv, desc);
 	}
@@ -5103,13 +5072,7 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 		return STMMAC_XDP_CONSUMED;
 	}
 
-	if (likely(priv->extend_desc))
-		tx_desc = (struct dma_desc *)(tx_q->dma_etx + entry);
-	else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-		tx_desc = &tx_q->dma_entx[entry].basic;
-	else
-		tx_desc = tx_q->dma_tx + entry;
-
+	tx_desc = stmmac_get_tx_desc(priv, tx_q, entry);
 	if (dma_map) {
 		dma_addr = dma_map_single(priv->device, xdpf->data,
 					  xdpf->len, DMA_TO_DEVICE);
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
