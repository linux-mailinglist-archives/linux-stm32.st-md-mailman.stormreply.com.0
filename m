Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDHcOp/HzGn5WgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Apr 2026 09:22:07 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCDA375C50
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Apr 2026 09:22:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A892C8F27F;
	Wed,  1 Apr 2026 07:22:07 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C134C8F27D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2026 07:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=savUdynNQeYEd7h5mjaKKtMm1gt1Y/kK7gCSnE5/gVQ=; b=DKQkXiJCaGisM+oe3gHGjQnzDI
 giGBbjJUh3zc0agDIuQRMGAAu/vtPUYBw1ODRzXcAbGqKltXdQH0iqdt8tm10MOcCUJj9Ph3neVYd
 DK01z+W8Xu4p/O8Xs+SWq3m9K2oPm4GZbATUjASW3BUqNN9uvIie7M1QyfHBFsppVHE7zDx56hxet
 /c/yJQc5uDBxjVzfCqOhPtOjFDQ6jUhOz7CpIExiNeVlRKnT9z84bhfZz7GSYMQ+8wGxeP15Ku/mS
 XhIn/IvCLQ95SSBUhXjeNiDoR9c04uPMJf2+caqziTYctGoGKBSVz3XezwEYokEnLQweP6PIQ154g
 d59gDxpQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57418 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1w7ptk-000000002ht-1Lqh;
 Wed, 01 Apr 2026 08:21:56 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1w7ptj-0000000Eatb-11zK; Wed, 01 Apr 2026 08:21:55 +0100
In-Reply-To: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
References: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1w7ptj-0000000Eatb-11zK@rmk-PC.armlinux.org.uk>
Date: Wed, 01 Apr 2026 08:21:55 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 09/14] net: stmmac: simplify
 GSO/TSO test in stmmac_xmit()
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
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:boon.leong.ong@intel.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,rmk-PC.armlinux.org.uk:mid,armlinux.org.uk:email,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: CFCDA375C50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The test in stmmac_xmit() to see whether we should pass the skbuff to
stmmac_tso_xmit() is more complex than it needs to be. This test can
be simplified by storing the mask of GSO types that we will pass, and
setting it according to the enabled features.

Note that "tso" is a mis-nomer since commit b776620651a1 ("net:
stmmac: Implement UDP Segmentation Offload"). Also note that this
commit controls both via the TSO feature. We preserve this behaviour
in this commit.

Also, this commit unconditionally accessed skb_shinfo(skb)->gso_type
for all frames, even when skb_is_gso() was false. This access is
eliminated.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  3 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 28 +++++++++++--------
 2 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 919a93a52390..8ba8f03e1ce0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -265,8 +265,9 @@ struct stmmac_priv {
 	u32 rx_coal_frames[MTL_MAX_RX_QUEUES];
 
 	int hwts_tx_en;
+	/* skb_shinfo(skb)->gso_type types that we handle */
+	unsigned int gso_enabled_types;
 	bool tx_path_in_lpi_mode;
-	bool tso;
 	bool sph_active;
 	bool sph_capable;
 	u32 sarc_type;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d3cbe71b9af1..42e2196e82a4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4373,6 +4373,18 @@ static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue)
 	stmmac_set_queue_tx_tail_ptr(priv, tx_q, queue, tx_q->cur_tx);
 }
 
+static void stmmac_set_gso_types(struct stmmac_priv *priv, bool tso)
+{
+	if (!tso) {
+		priv->gso_enabled_types = 0;
+	} else {
+		/* Manage oversized TCP frames for GMAC4 device */
+		priv->gso_enabled_types = SKB_GSO_TCPV4 | SKB_GSO_TCPV6;
+		if (priv->plat->core_type == DWMAC_CORE_GMAC4)
+			priv->gso_enabled_types |= SKB_GSO_UDP_L4;
+	}
+}
+
 static size_t stmmac_tso_header_size(struct sk_buff *skb)
 {
 	size_t size;
@@ -4706,7 +4718,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	u32 queue = skb_get_queue_mapping(skb);
 	int nfrags = skb_shinfo(skb)->nr_frags;
 	unsigned int first_entry, tx_packets;
-	int gso = skb_shinfo(skb)->gso_type;
 	struct stmmac_txq_stats *txq_stats;
 	struct dma_desc *desc, *first_desc;
 	struct stmmac_tx_queue *tx_q;
@@ -4718,14 +4729,9 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (priv->tx_path_in_lpi_mode && priv->eee_sw_timer_en)
 		stmmac_stop_sw_lpi(priv);
 
-	/* Manage oversized TCP frames for GMAC4 device */
-	if (skb_is_gso(skb) && priv->tso) {
-		if (gso & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6))
-			return stmmac_tso_xmit(skb, dev);
-		if (priv->plat->core_type == DWMAC_CORE_GMAC4 &&
-		    (gso & SKB_GSO_UDP_L4))
-			return stmmac_tso_xmit(skb, dev);
-	}
+	if (skb_is_gso(skb) &&
+	    skb_shinfo(skb)->gso_type & priv->gso_enabled_types)
+		return stmmac_tso_xmit(skb, dev);
 
 	if (priv->est && priv->est->enable &&
 	    priv->est->max_sdu[queue]) {
@@ -6151,7 +6157,7 @@ static int stmmac_set_features(struct net_device *netdev,
 			stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
 	}
 
-	priv->tso = !!(features & NETIF_F_TSO);
+	stmmac_set_gso_types(priv, features & NETIF_F_TSO);
 
 	if (features & NETIF_F_HW_VLAN_CTAG_RX)
 		priv->hw->hw_vlan_en = true;
@@ -7886,7 +7892,7 @@ static int __stmmac_dvr_probe(struct device *device,
 		ndev->hw_features |= NETIF_F_TSO | NETIF_F_TSO6;
 		if (priv->plat->core_type == DWMAC_CORE_GMAC4)
 			ndev->hw_features |= NETIF_F_GSO_UDP_L4;
-		priv->tso = true;
+		stmmac_set_gso_types(priv, true);
 		dev_info(priv->device, "TSO feature enabled\n");
 	}
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
