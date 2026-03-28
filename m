Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEEnIu9JyGlVjgUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Mar 2026 22:36:47 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0D2350039
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Mar 2026 22:36:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11694C8F289;
	Sat, 28 Mar 2026 21:36:47 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B47CC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Mar 2026 21:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nNtWg4ceLvcLhX+8T6DxKpx/r9NSF94wzTpRFt2hnhg=; b=a8dVgHcFyroBpLjgugU1+J3TXi
 tXCgxw94KUMSqvT2EbFfGCWxGxtqe4JiLvOi3mzJmZYIqtxslBHicz175jzlhjSRklTVyS2gugJ3B
 14I23TrDQ9kf+02daCn9oOhSqTC4mF+LCelFni52HDfRa01TxydIQagAYTvvCp65pt1a12zctVC8F
 BlWg2sdDBQ/YJqVDQgoaED6a1lX0Ix2EIaofRFJfcjtllil39QLj7o/iE479GT9Dq326a3CneMb+f
 Obt/GrdZLxNqgzo1/wil7sZVhSw9M8837cGsXVN0Ooz2v1s53X6fn6SLSiInzUuxCUwmjmWmBIFic
 rQvTX7+w==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60848 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1w6bKk-000000007RY-2gvF;
 Sat, 28 Mar 2026 21:36:42 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1w6bKj-0000000ELtf-3md9; Sat, 28 Mar 2026 21:36:41 +0000
In-Reply-To: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
References: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1w6bKj-0000000ELtf-3md9@rmk-PC.armlinux.org.uk>
Date: Sat, 28 Mar 2026 21:36:41 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 01/10] net: stmmac: fix TSO support
 when some channels have TBS available
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[kernel];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:boon.leong.ong@intel.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.087];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,stormreply.com:email,stormreply.com:url,rmk-PC.armlinux.org.uk:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 4E0D2350039
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

According to the STM32MP25xx manual, which is dwmac v5.3, TBS (time
based scheduling) is not permitted for channels which have hardware
TSO enabled. Intel's commit 5e6038b88a57 ("net: stmmac: fix TSO and
TBS feature enabling during driver open") concurs with this, but it
is incomplete.

This commit avoids enabling TSO support on the channels which have
TBS available, which, as far as the hardware is concerned, means we
do not set the TSE bit in the DMA channel's transmit control register.

However, the net device's features apply to all queues(channels), which
means these channels may still be handed TSO skbs to transmit, and the
driver will pass them to stmmac_tso_xmit(). This will generate the
descriptors for TSO, even though the channel has the TSE bit clear.

Fix this by checking whether the queue(channel) has TBS available,
and if it does, fall back to software GSO support.

Fixes: 5e6038b88a57 ("net: stmmac: fix TSO and TBS feature enabling during driver open")
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 35 ++++++++++++++++---
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ce51b9c22129..2957ee4a43db 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3619,6 +3619,13 @@ static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
 	}
 }
 
+static bool stmmac_channel_tso_permitted(struct stmmac_priv *priv,
+					 unsigned int chan)
+{
+	/* TSO and TBS cannot co-exist */
+	return !(priv->dma_conf.tx_queue[chan].tbs & STMMAC_TBS_AVAIL);
+}
+
 /**
  * stmmac_hw_setup - setup mac in a usable state.
  *  @dev : pointer to the device structure.
@@ -3707,10 +3714,7 @@ static int stmmac_hw_setup(struct net_device *dev)
 	/* Enable TSO */
 	if (priv->tso) {
 		for (chan = 0; chan < tx_cnt; chan++) {
-			struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[chan];
-
-			/* TSO and TBS cannot co-exist */
-			if (tx_q->tbs & STMMAC_TBS_AVAIL)
+			if (!stmmac_channel_tso_permitted(priv, chan))
 				continue;
 
 			stmmac_enable_tso(priv, priv->ioaddr, 1, chan);
@@ -4919,6 +4923,28 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	return NETDEV_TX_OK;
 }
 
+static netdev_features_t stmmac_features_check(struct sk_buff *skb,
+					       struct net_device *dev,
+					       netdev_features_t features)
+{
+	u16 queue;
+
+	features = vlan_features_check(skb, features);
+
+	if (skb_is_gso(skb)) {
+		/* STM32MP25xx (dwmac v5.3) states "Do not enable time-based
+		 * scheduling for channels on which the TSO feature is
+		 * enabled." If we have a skb for a channel which has TBS
+		 * enabled, fall back to software GSO.
+		 */
+		queue = skb_get_queue_mapping(skb);
+		if (!stmmac_channel_tso_permitted(netdev_priv(dev), queue))
+			features &= ~NETIF_F_GSO_MASK;
+	}
+
+	return features;
+}
+
 static void stmmac_rx_vlan(struct net_device *dev, struct sk_buff *skb)
 {
 	struct vlan_ethhdr *veth = skb_vlan_eth_hdr(skb);
@@ -7220,6 +7246,7 @@ static void stmmac_get_stats64(struct net_device *dev, struct rtnl_link_stats64
 static const struct net_device_ops stmmac_netdev_ops = {
 	.ndo_open = stmmac_open,
 	.ndo_start_xmit = stmmac_xmit,
+	.ndo_features_check = stmmac_features_check,
 	.ndo_stop = stmmac_release,
 	.ndo_change_mtu = stmmac_change_mtu,
 	.ndo_fix_features = stmmac_fix_features,
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
