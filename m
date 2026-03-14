Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLW4IIQuuGmvaAEAu9opvQ:T2
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 17:23:33 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BD429D4AB
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 17:23:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D7C5C8F295;
	Mon, 16 Mar 2026 16:23:33 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA387C35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Mar 2026 09:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sjmjh9LqgSfqY7476rGy7BOUo6MdY+yHA2slM9LQGLY=; b=DpCwnpTuPAvMZIJIjm8NRgFS0q
 j0QnfFaLNfKw02brsuCvBf4Q//jpZ2nQMkdowhgkNedJ2+gCZFUIHUyw3dTs5iEX6gp5JEecRFmKz
 ulrgOk4VvBDRQ5pCcgJYj+ImwBYF9FU2z++ukNANENd0r3POPuco/5bfd59ZTwKH3+q228T13AmfB
 o65HfR8iWn+IdwgfFfbYosw9PnTE8Rn82mUCp+tSlF1mdLolS5JzUoA8Jdf4u9WLNEzNkGAhQUi9M
 jdNs0bHEf55Z9bMBOd7L6d9ZcDmtO0+NUNhkc56egb/h8lp4TxJp31G8SPW2wCUQN8C7Ntq1oNP3E
 10FD7tTQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42924 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1w1LW5-0000000020U-2u7E;
 Sat, 14 Mar 2026 09:42:42 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1w1LW4-0000000DGS3-1J49; Sat, 14 Mar 2026 09:42:40 +0000
In-Reply-To: <abUtGH9KB03PH5Ne@shell.armlinux.org.uk>
References: <abUtGH9KB03PH5Ne@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1w1LW4-0000000DGS3-1J49@rmk-PC.armlinux.org.uk>
Date: Sat, 14 Mar 2026 09:42:40 +0000
X-Mailman-Approved-At: Mon, 16 Mar 2026 16:23:30 +0000
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Alexei Starovoitov <ast@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 04/15] net: stmmac: add helper to
 get hardware receive descriptor
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	DATE_IN_PAST(1.00)[54];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[kernel];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:hawk@kernel.org,m:daniel@iogearbox.net,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:ast@kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:sdf@fomichev.me,m:kuba@kernel.org,m:bpf@vger.kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.252];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rmk-PC.armlinux.org.uk:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 61BD429D4AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Provide a helper to get a hardware receive descriptor that takes
account of whether extended format is being used, but returning the
base struct dma_desc pointer. This avoids multiple instances where
this is open coded.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 76 +++++++------------
 1 file changed, 26 insertions(+), 50 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 765b168df50d..a3dfd3501604 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -362,6 +362,16 @@ static inline u32 stmmac_tx_avail(struct stmmac_priv *priv, u32 queue)
 			  priv->dma_conf.dma_tx_size);
 }
 
+static struct dma_desc *stmmac_get_rx_desc(struct stmmac_priv *priv,
+					   struct stmmac_rx_queue *rx_q,
+					   unsigned int index)
+{
+	if (priv->extend_desc)
+		return &rx_q->dma_erx[index].basic;
+	else
+		return &rx_q->dma_rx[index];
+}
+
 /**
  * stmmac_rx_dirty - Get RX queue dirty
  * @priv: driver private structure
@@ -1421,13 +1431,11 @@ static void stmmac_display_rx_rings(struct stmmac_priv *priv,
 
 		pr_info("\tRX Queue %u rings\n", queue);
 
-		if (priv->extend_desc) {
-			head_rx = (void *)rx_q->dma_erx;
+		head_rx = stmmac_get_rx_desc(priv, rx_q, 0);
+		if (priv->extend_desc)
 			desc_size = sizeof(struct dma_extended_desc);
-		} else {
-			head_rx = (void *)rx_q->dma_rx;
+		else
 			desc_size = sizeof(struct dma_desc);
-		}
 
 		/* Display RX ring */
 		stmmac_display_ring(priv, head_rx, dma_conf->dma_rx_size, true,
@@ -1519,10 +1527,7 @@ static void stmmac_clear_rx_descriptors(struct stmmac_priv *priv,
 
 	/* Clear the RX descriptors */
 	for (i = 0; i < dma_conf->dma_rx_size; i++) {
-		if (priv->extend_desc)
-			desc = &rx_q->dma_erx[i].basic;
-		else
-			desc = &rx_q->dma_rx[i];
+		desc = stmmac_get_rx_desc(priv, rx_q, i);
 
 		stmmac_init_rx_desc(priv, desc, priv->use_riwt, priv->mode,
 				    (i == dma_conf->dma_rx_size - 1),
@@ -1731,10 +1736,7 @@ static int stmmac_alloc_rx_buffers(struct stmmac_priv *priv,
 		struct dma_desc *p;
 		int ret;
 
-		if (priv->extend_desc)
-			p = &((rx_q->dma_erx + i)->basic);
-		else
-			p = rx_q->dma_rx + i;
+		p = stmmac_get_rx_desc(priv, rx_q, i);
 
 		ret = stmmac_init_rx_buffers(priv, dma_conf, p, i, flags,
 					     queue);
@@ -1789,10 +1791,7 @@ static int stmmac_alloc_rx_buffers_zc(struct stmmac_priv *priv,
 		dma_addr_t dma_addr;
 		struct dma_desc *p;
 
-		if (priv->extend_desc)
-			p = (struct dma_desc *)(rx_q->dma_erx + i);
-		else
-			p = rx_q->dma_rx + i;
+		p = stmmac_get_rx_desc(priv, rx_q, i);
 
 		buf = &rx_q->buf_pool[i];
 
@@ -4954,10 +4953,7 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
 		struct dma_desc *p;
 		bool use_rx_wd;
 
-		if (priv->extend_desc)
-			p = (struct dma_desc *)(rx_q->dma_erx + entry);
-		else
-			p = rx_q->dma_rx + entry;
+		p = stmmac_get_rx_desc(priv, rx_q, entry);
 
 		if (!buf->page) {
 			buf->page = page_pool_alloc_pages(rx_q->page_pool, gfp);
@@ -5355,10 +5351,7 @@ static bool stmmac_rx_refill_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 			}
 		}
 
-		if (priv->extend_desc)
-			rx_desc = (struct dma_desc *)(rx_q->dma_erx + entry);
-		else
-			rx_desc = rx_q->dma_rx + entry;
+		rx_desc = stmmac_get_rx_desc(priv, rx_q, entry);
 
 		dma_addr = xsk_buff_xdp_get_dma(buf->xdp);
 		stmmac_set_desc_addr(priv, rx_desc, dma_addr);
@@ -5416,14 +5409,12 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 	int status = 0;
 
 	if (netif_msg_rx_status(priv)) {
-		void *rx_head;
+		void *rx_head = stmmac_get_rx_desc(priv, rx_q, 0);
 
 		netdev_dbg(priv->dev, "%s: descriptor ring:\n", __func__);
 		if (priv->extend_desc) {
-			rx_head = (void *)rx_q->dma_erx;
 			desc_size = sizeof(struct dma_extended_desc);
 		} else {
-			rx_head = (void *)rx_q->dma_rx;
 			desc_size = sizeof(struct dma_desc);
 		}
 
@@ -5461,10 +5452,7 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 			dirty = 0;
 		}
 
-		if (priv->extend_desc)
-			p = (struct dma_desc *)(rx_q->dma_erx + entry);
-		else
-			p = rx_q->dma_rx + entry;
+		p = stmmac_get_rx_desc(priv, rx_q, entry);
 
 		/* read the status of the incoming frame */
 		status = stmmac_rx_status(priv, &priv->xstats, p);
@@ -5477,10 +5465,7 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 						priv->dma_conf.dma_rx_size);
 		next_entry = rx_q->cur_rx;
 
-		if (priv->extend_desc)
-			np = (struct dma_desc *)(rx_q->dma_erx + next_entry);
-		else
-			np = rx_q->dma_rx + next_entry;
+		np = stmmac_get_rx_desc(priv, rx_q, next_entry);
 
 		prefetch(np);
 
@@ -5616,16 +5601,13 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	limit = min(priv->dma_conf.dma_rx_size - 1, (unsigned int)limit);
 
 	if (netif_msg_rx_status(priv)) {
-		void *rx_head;
+		void *rx_head = stmmac_get_rx_desc(priv, rx_q, 0);
 
 		netdev_dbg(priv->dev, "%s: descriptor ring:\n", __func__);
-		if (priv->extend_desc) {
-			rx_head = (void *)rx_q->dma_erx;
+		if (priv->extend_desc)
 			desc_size = sizeof(struct dma_extended_desc);
-		} else {
-			rx_head = (void *)rx_q->dma_rx;
+		else
 			desc_size = sizeof(struct dma_desc);
-		}
 
 		stmmac_display_ring(priv, rx_head, priv->dma_conf.dma_rx_size, true,
 				    rx_q->dma_rx_phy, desc_size);
@@ -5658,10 +5640,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		entry = next_entry;
 		buf = &rx_q->buf_pool[entry];
 
-		if (priv->extend_desc)
-			p = (struct dma_desc *)(rx_q->dma_erx + entry);
-		else
-			p = rx_q->dma_rx + entry;
+		p = stmmac_get_rx_desc(priv, rx_q, entry);
 
 		/* read the status of the incoming frame */
 		status = stmmac_rx_status(priv, &priv->xstats, p);
@@ -5673,10 +5652,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 						priv->dma_conf.dma_rx_size);
 		next_entry = rx_q->cur_rx;
 
-		if (priv->extend_desc)
-			np = (struct dma_desc *)(rx_q->dma_erx + next_entry);
-		else
-			np = rx_q->dma_rx + next_entry;
+		np = stmmac_get_rx_desc(priv, rx_q, next_entry);
 
 		prefetch(np);
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
