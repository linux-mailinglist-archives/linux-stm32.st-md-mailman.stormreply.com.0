Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IewEmLuuml0dAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 19:26:42 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0489F2C139D
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 19:26:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B910BC87ED8;
	Wed, 18 Mar 2026 18:26:41 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0885C87EC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 18:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6F5RbYjwrweXgBMfc/nBuLz5ZDj05fkoaWvuU8RxfYs=; b=N7KHpjJ63v5uOrdTgBQ9CEaRLM
 mSLN3weBTgC9gkefZZnoPSk7We9TdYWp0S9ed3YTVRXtpddB8OSU0edDVrdNY46tPLdv8gZ0mwpZ+
 biQawgKjNf0+a1B+MbnBM+/zGjZIumDo0bzgkuhWVuF6OrmQ/4Djr2mFAXnKO1aSDTN5Sqe92vaHS
 04emqyua+Nfx1bGSj/EiwOWxqQCdD1dUoytoDi7OMqf1ZnXyi9QRpn9aDO+nqPajKbCQULH5R1nP3
 6HTnq5oixTJUKuKDliyscVecSlZ3e+bHJF09miDwLHa/K6QV2vnmvTg1g+dGyXmIj94lhMv3IwGS3
 JnSpcOcA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56022 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1w2vbG-000000003p3-3H0v;
 Wed, 18 Mar 2026 18:26:34 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1w2vbF-0000000DbWQ-4674; Wed, 18 Mar 2026 18:26:34 +0000
In-Reply-To: <abruRQpjLyMkoUEP@shell.armlinux.org.uk>
References: <abruRQpjLyMkoUEP@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1w2vbF-0000000DbWQ-4674@rmk-PC.armlinux.org.uk>
Date: Wed, 18 Mar 2026 18:26:33 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/5] net: stmmac: rename "mode" to
	"descriptor_mode"
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[kernel];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.457];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,armlinux.org.uk:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 0489F2C139D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

priv->mode doesn't describe what it refers to, it is whether we operate
the DMA descriptors as a ring or chain. It is also difficult to grep for
as there are several "mode" struct members. Add "descriptor_" prefix.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  4 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  5 +++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 24 ++++++++++---------
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 71dac8c1a3ca..511b0fd5e834 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -57,11 +57,11 @@ static void stmmac_dwmac_mode_quirk(struct stmmac_priv *priv)
 
 	if (priv->chain_mode) {
 		dev_info(priv->device, "Chain mode enabled\n");
-		priv->mode = STMMAC_CHAIN_MODE;
+		priv->descriptor_mode = STMMAC_CHAIN_MODE;
 		mac->mode = &chain_mode_ops;
 	} else {
 		dev_info(priv->device, "Ring mode enabled\n");
-		priv->mode = STMMAC_RING_MODE;
+		priv->descriptor_mode = STMMAC_RING_MODE;
 		mac->mode = &ring_mode_ops;
 	}
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index b9d849a3f06e..919a93a52390 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -323,7 +323,10 @@ struct stmmac_priv {
 	bool extend_desc;
 	/* chain_mode: requested descriptor mode */
 	bool chain_mode;
-	unsigned int mode;
+	/* descriptor_mode: actual descriptor mode,
+	 * see STMMAC_CHAIN_MODE or STMMAC_RING_MODE
+	 */
+	u8 descriptor_mode;
 	struct kernel_hwtstamp_config tstamp_config;
 	struct ptp_clock *ptp_clock;
 	struct ptp_clock_info ptp_clock_ops;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 0a933aac3f03..567499e74917 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1589,7 +1589,8 @@ static void stmmac_clear_rx_descriptors(struct stmmac_priv *priv,
 	for (i = 0; i < dma_conf->dma_rx_size; i++) {
 		desc = stmmac_get_rx_desc(priv, rx_q, i);
 
-		stmmac_init_rx_desc(priv, desc, priv->use_riwt, priv->mode,
+		stmmac_init_rx_desc(priv, desc, priv->use_riwt,
+				    priv->descriptor_mode,
 				    (i == dma_conf->dma_rx_size - 1),
 				    dma_conf->dma_buf_sz);
 	}
@@ -1616,7 +1617,7 @@ static void stmmac_clear_tx_descriptors(struct stmmac_priv *priv,
 		struct dma_desc *p;
 
 		p = stmmac_get_tx_desc(priv, tx_q, i);
-		stmmac_init_tx_desc(priv, p, priv->mode, last);
+		stmmac_init_tx_desc(priv, p, priv->descriptor_mode, last);
 	}
 }
 
@@ -1925,7 +1926,7 @@ static int __init_dma_rx_desc_rings(struct stmmac_priv *priv,
 	}
 
 	/* Setup the chained descriptor addresses */
-	if (priv->mode == STMMAC_CHAIN_MODE) {
+	if (priv->descriptor_mode == STMMAC_CHAIN_MODE) {
 		if (priv->extend_desc)
 			stmmac_mode_init(priv, rx_q->dma_erx,
 					 rx_q->dma_rx_phy,
@@ -2027,7 +2028,7 @@ static int __init_dma_tx_desc_rings(struct stmmac_priv *priv,
 		  (u32)tx_q->dma_tx_phy);
 
 	/* Setup the chained descriptor addresses */
-	if (priv->mode == STMMAC_CHAIN_MODE) {
+	if (priv->descriptor_mode == STMMAC_CHAIN_MODE) {
 		if (priv->extend_desc)
 			stmmac_mode_init(priv, tx_q->dma_etx,
 					 tx_q->dma_tx_phy,
@@ -2774,7 +2775,7 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 		}
 
 		stmmac_prepare_tx_desc(priv, tx_desc, 1, xdp_desc.len,
-				       csum, priv->mode, true, true,
+				       csum, priv->descriptor_mode, true, true,
 				       xdp_desc.len);
 
 		stmmac_enable_dma_transmission(priv, priv->ioaddr, queue);
@@ -2948,7 +2949,7 @@ static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue,
 			}
 		}
 
-		stmmac_release_tx_desc(priv, p, priv->mode);
+		stmmac_release_tx_desc(priv, p, priv->descriptor_mode);
 
 		entry = STMMAC_GET_ENTRY(entry, priv->dma_conf.dma_tx_size);
 	}
@@ -4794,7 +4795,8 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 
 		/* Prepare the descriptor and set the own bit too */
 		stmmac_prepare_tx_desc(priv, desc, 0, len, csum_insertion,
-				priv->mode, 1, last_segment, skb->len);
+				       priv->descriptor_mode, 1, last_segment,
+				       skb->len);
 	}
 
 	stmmac_set_tx_dma_last_segment(tx_q, entry);
@@ -4890,8 +4892,8 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 
 		/* Prepare the first descriptor setting the OWN bit too */
 		stmmac_prepare_tx_desc(priv, first, 1, nopaged_len,
-				csum_insertion, priv->mode, 0, last_segment,
-				skb->len);
+				       csum_insertion, priv->descriptor_mode,
+				       0, last_segment, skb->len);
 	}
 
 	if (tx_q->tbs & STMMAC_TBS_EN) {
@@ -5119,7 +5121,7 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 	stmmac_set_desc_addr(priv, tx_desc, dma_addr);
 
 	stmmac_prepare_tx_desc(priv, tx_desc, 1, xdpf->len,
-			       csum, priv->mode, true, true,
+			       csum, priv->descriptor_mode, true, true,
 			       xdpf->len);
 
 	tx_q->tx_count_frames++;
@@ -7432,7 +7434,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	 * is not expected to change this.
 	 */
 	priv->plat->dma_cfg->atds = priv->extend_desc &&
-				    priv->mode == STMMAC_RING_MODE;
+				    priv->descriptor_mode == STMMAC_RING_MODE;
 
 	/* Rx Watchdog is available in the COREs newer than the 3.40.
 	 * In some case, for example on bugged HW this feature
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
