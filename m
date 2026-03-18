Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AD+XLnDuuml0dAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 19:26:56 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6DC2C13BC
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 19:26:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EE73C8F262;
	Wed, 18 Mar 2026 18:26:56 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D483C87ED8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 18:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PSwFlWBNCnfkLPqu9SlfOdkms5iUPC43AY1hv4lA+8A=; b=l1osFTwwIDvtSDGyILlfVKlsgG
 a+HfDLMmIkcYX5iV6n4lWi9+vB7KYJvYW/Qljq3nOxbqjqJTfejBqVOtOEtytPdig8/0sFM2KNKlW
 u5RtMZ5zZTjkOwGzYkNSChdtYu6hACmrh4vr1nNETOgFBod1xsIU4q8dDLMQUT+fL64y3eKrOLWeR
 FBx9wDOjHpMlRmzQ8EUKdIs+jpl0U/1wVf1KOb1czFJYz6jN3/pfprWwF+KvJJ9UaYwctWcbXSXTN
 3+/9NIwXUCNDA5RqrocBrmjEkcOUXQPUVqj5fFNjkQDhG0T2BbezxMQtr/cb4ytigN4PFF6FAKD8N
 QmwGpR2w==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39140 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1w2vbW-000000003pl-0kSV;
 Wed, 18 Mar 2026 18:26:50 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1w2vbV-0000000DbWi-1O80; Wed, 18 Mar 2026 18:26:49 +0000
In-Reply-To: <abruRQpjLyMkoUEP@shell.armlinux.org.uk>
References: <abruRQpjLyMkoUEP@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1w2vbV-0000000DbWi-1O80@rmk-PC.armlinux.org.uk>
Date: Wed, 18 Mar 2026 18:26:49 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 4/5] net: stmmac: use more
 descriptive names in stmmac_xmit()
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[kernel];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.471];
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
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 4C6DC2C13BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use "frag_size" rather than "len", correcting its type to be
unsigned int. Rename "des" to "dma_addr" since that's what it is.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 45 ++++++++++---------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8a84fdd4577d..3c0206278081 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4684,12 +4684,12 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	unsigned int first_entry, tx_packets;
 	int gso = skb_shinfo(skb)->gso_type;
 	struct stmmac_txq_stats *txq_stats;
+	struct dma_desc *desc, *first_desc;
 	struct dma_edesc *tbs_desc = NULL;
-	struct dma_desc *desc, *first;
 	struct stmmac_tx_queue *tx_q;
 	int i, csum_insertion = 0;
 	int entry, first_tx;
-	dma_addr_t des;
+	dma_addr_t dma_addr;
 	u32 sdu_len;
 
 	tx_q = &priv->dma_conf.tx_queue[queue];
@@ -4756,10 +4756,10 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	}
 
 	desc = stmmac_get_tx_desc(priv, tx_q, entry);
-	first = desc;
+	first_desc = desc;
 
 	if (has_vlan)
-		stmmac_set_desc_vlan(priv, first, STMMAC_VLAN_INSERT);
+		stmmac_set_desc_vlan(priv, first_desc, STMMAC_VLAN_INSERT);
 
 	enh_desc = priv->plat->enh_desc;
 	/* To program the descriptors according to the size of the frame */
@@ -4774,7 +4774,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	for (i = 0; i < nfrags; i++) {
 		const skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
-		int len = skb_frag_size(frag);
+		unsigned int frag_size = skb_frag_size(frag);
 		bool last_segment = (i == (nfrags - 1));
 
 		entry = STMMAC_GET_ENTRY(entry, priv->dma_conf.dma_tx_size);
@@ -4782,16 +4782,17 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 
 		desc = stmmac_get_tx_desc(priv, tx_q, entry);
 
-		des = skb_frag_dma_map(priv->device, frag, 0, len,
-				       DMA_TO_DEVICE);
-		if (dma_mapping_error(priv->device, des))
+		dma_addr = skb_frag_dma_map(priv->device, frag, 0, frag_size,
+					    DMA_TO_DEVICE);
+		if (dma_mapping_error(priv->device, dma_addr))
 			goto dma_map_err; /* should reuse desc w/o issues */
 
-		stmmac_set_tx_skb_dma_entry(tx_q, entry, des, len, true);
-		stmmac_set_desc_addr(priv, desc, des);
+		stmmac_set_tx_skb_dma_entry(tx_q, entry, dma_addr, frag_size,
+					    true);
+		stmmac_set_desc_addr(priv, desc, dma_addr);
 
 		/* Prepare the descriptor and set the own bit too */
-		stmmac_prepare_tx_desc(priv, desc, 0, len, csum_insertion,
+		stmmac_prepare_tx_desc(priv, desc, 0, frag_size, csum_insertion,
 				       priv->descriptor_mode, 1, last_segment,
 				       skb->len);
 	}
@@ -4839,7 +4840,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		netdev_dbg(priv->dev,
 			   "%s: curr=%d dirty=%d f=%d, e=%d, first=%p, nfrags=%d",
 			   __func__, tx_q->cur_tx, tx_q->dirty_tx, first_entry,
-			   entry, first, nfrags);
+			   entry, first_desc, nfrags);
 
 		netdev_dbg(priv->dev, ">>> frame to be transmitted: ");
 		print_pkt(skb->data, skb->len);
@@ -4858,7 +4859,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	u64_stats_update_end(&txq_stats->q_syncp);
 
 	if (priv->sarc_type)
-		stmmac_set_desc_sarc(priv, first, priv->sarc_type);
+		stmmac_set_desc_sarc(priv, first_desc, priv->sarc_type);
 
 	/* Ready to fill the first descriptor and set the OWN bit w/o any
 	 * problems because all the descriptors are actually ready to be
@@ -4867,15 +4868,15 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (likely(!is_jumbo)) {
 		bool last_segment = (nfrags == 0);
 
-		des = dma_map_single(priv->device, skb->data,
-				     nopaged_len, DMA_TO_DEVICE);
-		if (dma_mapping_error(priv->device, des))
+		dma_addr = dma_map_single(priv->device, skb->data,
+					  nopaged_len, DMA_TO_DEVICE);
+		if (dma_mapping_error(priv->device, dma_addr))
 			goto dma_map_err;
 
-		stmmac_set_tx_skb_dma_entry(tx_q, first_entry, des, nopaged_len,
-					    false);
+		stmmac_set_tx_skb_dma_entry(tx_q, first_entry, dma_addr,
+					    nopaged_len, false);
 
-		stmmac_set_desc_addr(priv, first, des);
+		stmmac_set_desc_addr(priv, first_desc, dma_addr);
 
 		if (last_segment)
 			stmmac_set_tx_dma_last_segment(tx_q, first_entry);
@@ -4884,11 +4885,11 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 			     priv->hwts_tx_en)) {
 			/* declare that device is doing timestamping */
 			skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
-			stmmac_enable_tx_timestamp(priv, first);
+			stmmac_enable_tx_timestamp(priv, first_desc);
 		}
 
 		/* Prepare the first descriptor setting the OWN bit too */
-		stmmac_prepare_tx_desc(priv, first, 1, nopaged_len,
+		stmmac_prepare_tx_desc(priv, first_desc, 1, nopaged_len,
 				       csum_insertion, priv->descriptor_mode,
 				       0, last_segment, skb->len);
 	}
@@ -4900,7 +4901,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		stmmac_set_desc_tbs(priv, tbs_desc, ts.tv_sec, ts.tv_nsec);
 	}
 
-	stmmac_set_tx_owner(priv, first);
+	stmmac_set_tx_owner(priv, first_desc);
 
 	netdev_tx_sent_queue(netdev_get_tx_queue(dev, queue), skb->len);
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
