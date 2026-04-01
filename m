Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAZvN5bHzGn5WgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Apr 2026 09:21:58 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B09D375C42
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Apr 2026 09:21:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59D39C8F27F;
	Wed,  1 Apr 2026 07:21:58 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E4CBC8F27D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2026 07:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r3zNFXyOKF+BLz89Sva1o0uRJQ4NNntdmHQyPfgJhJ4=; b=YPWoPzivQBHQrro+coYNy2DvvG
 jQyG8o4qVCZbJgTTipRgxggrJAz2LZCbyyb0/bR8tGDIVB8+iCFnvP4T7984cOt9VH8p5xG8P1yap
 AokkJp34dL0o/0J14ojiqEqfXLg9R2jWZ7QtKc9EF1bvD6DH30BXpAwA/QLt1dTVwshx/rur9IO+A
 0hFfKB2Vd+nUFnnZTjsYRyl44AQYp9tbiXKN8mWZF/jeABZA3nl+XbP41FA2YULN1dEDohu3Dbwku
 3p0m4D0fDLXBdfOxVIGpjlBhz2EhQnzMzhsOQhG7g2XxEpIMPyd6JwTKbjy4+5BcWJ4mUB4e7lCRj
 LSBf5m8Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57410 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1w7ptf-000000002hX-1Ygn;
 Wed, 01 Apr 2026 08:21:51 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1w7pte-0000000EatU-0ILt; Wed, 01 Apr 2026 08:21:50 +0100
In-Reply-To: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
References: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1w7pte-0000000EatU-0ILt@rmk-PC.armlinux.org.uk>
Date: Wed, 01 Apr 2026 08:21:50 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 08/14] net: stmmac: move check for
 hardware checksum supported
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
	NEURAL_HAM(-0.00)[-0.996];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[rmk-PC.armlinux.org.uk:mid,armlinux.org.uk:email,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 9B09D375C42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a check in .ndo_features_check() to indicate whether hardware
checksum can be performed on the skbuff. Where hardware checksum is
not supported - either because the channel does not support Tx COE
or the skb isn't suitable (stmmac uses a tighter test than
can_checksum_protocol()) we also need to disable TSO, which will be
done by harmonize_features() in net/core/dev.c

This fixes a bug where a channel which has COE disabled may still
receive TSO skbuffs.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 38 +++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c67f042a90af..d3cbe71b9af1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4757,22 +4757,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	/* Check if VLAN can be inserted by HW */
 	has_vlan = stmmac_vlan_insert(priv, skb, tx_q);
 
-	csum_insertion = (skb->ip_summed == CHECKSUM_PARTIAL);
-	/* DWMAC IPs can be synthesized to support tx coe only for a few tx
-	 * queues. In that case, checksum offloading for those queues that don't
-	 * support tx coe needs to fallback to software checksum calculation.
-	 *
-	 * Packets that won't trigger the COE e.g. most DSA-tagged packets will
-	 * also have to be checksummed in software.
-	 */
-	if (csum_insertion &&
-	    (priv->plat->tx_queues_cfg[queue].coe_unsupported ||
-	     !stmmac_has_ip_ethertype(skb))) {
-		if (unlikely(skb_checksum_help(skb)))
-			goto dma_map_err;
-		csum_insertion = !csum_insertion;
-	}
-
 	entry = tx_q->cur_tx;
 	first_entry = entry;
 	WARN_ON(tx_q->tx_skbuff[first_entry]);
@@ -4788,6 +4772,8 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (enh_desc)
 		is_jumbo = stmmac_is_jumbo_frm(priv, skb->len, enh_desc);
 
+	csum_insertion = skb->ip_summed == CHECKSUM_PARTIAL;
+
 	if (unlikely(is_jumbo)) {
 		entry = stmmac_jumbo_frm(priv, tx_q, skb, csum_insertion);
 		if (unlikely(entry < 0) && (entry != -EINVAL))
@@ -4949,11 +4935,25 @@ static netdev_features_t stmmac_features_check(struct sk_buff *skb,
 					       struct net_device *dev,
 					       netdev_features_t features)
 {
-	u16 queue;
+	struct stmmac_priv *priv = netdev_priv(dev);
+	u16 queue = skb_get_queue_mapping(skb);
+
+	/* DWMAC IPs can be synthesized to support tx coe only for a few tx
+	 * queues. In that case, checksum offloading for those queues that don't
+	 * support tx coe needs to fallback to software checksum calculation.
+	 *
+	 * Packets that won't trigger the COE e.g. most DSA-tagged packets will
+	 * also have to be checksummed in software.
+	 *
+	 * Note that disabling hardware checksumming also disables TSO. See
+	 * harmonize_features() in net/core/dev.c
+	 */
+	if (priv->plat->tx_queues_cfg[queue].coe_unsupported ||
+	    !stmmac_has_ip_ethertype(skb))
+		features &= ~(NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM);
 
 	if (skb_is_gso(skb)) {
-		queue = skb_get_queue_mapping(skb);
-		if (!stmmac_tso_channel_permitted(netdev_priv(dev), queue) ||
+		if (!stmmac_tso_channel_permitted(priv, queue) ||
 		    !stmmac_tso_valid_packet(skb))
 			features &= ~NETIF_F_GSO_MASK;
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
