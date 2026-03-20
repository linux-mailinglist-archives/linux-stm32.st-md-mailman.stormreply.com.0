Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iE31GxZ6vWmt9wIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 17:47:18 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 181D42DDF28
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 17:47:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEB4BC87EBD;
	Fri, 20 Mar 2026 16:47:17 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85377C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Mar 2026 16:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Az6gClnSnQ8RxIwpwc72dRxBvEVtZ9+6YP9Xv0iblKI=; b=YWjHKvrhkkOBk4yQEyCntMOlFU
 2Kf5FC6Go90A3Kdex5kZX7lwckqHksaMQMFME4XRxZDu0U3Ma1v1bKbbQw/s2rgO6TPWnb0PT+b7s
 w5mKjUZ/s+vq+QBWZLMjV9C+OwKN2tM083JKNRt3EXTNjGJR5nhjYJ15KgNhWXDsxO5q1zFt8cU5Y
 7vu9ZcjITmuWLSbggVSBVhGVkFif3jxGXfHKIFLQqG08UnaCP4xo8Jdn5HO92WQPBEYe/Zlj7sqW0
 g04K4qwZ+cHD6lKN1QTpNQYildx8FIMTXCJIw8T9028QPHB6WGoFNXDAteX4E0TLuQweYmhSOz7BJ
 dmwJ4ZlA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36256 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1w3d0C-000000006LG-3Eu3;
 Fri, 20 Mar 2026 16:47:12 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1w3d0C-0000000DfLj-0BLb; Fri, 20 Mar 2026 16:47:12 +0000
In-Reply-To: <ab15_JvLGFtUH_3x@shell.armlinux.org.uk>
References: <ab15_JvLGFtUH_3x@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1w3d0C-0000000DfLj-0BLb@rmk-PC.armlinux.org.uk>
Date: Fri, 20 Mar 2026 16:47:12 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/6] net: stmmac: move stmmac_xmit()
 skb head handling
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
	NEURAL_HAM(-0.00)[-0.394];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,armlinux.org.uk:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 181D42DDF28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The skb head buffer handling is delayed in stmmac_xmit() until after
the skb fragments have been populated into the descriptors. The reason
is this code used to set the OWN bit on the first descriptor, which
then allows the TX DMA to process the first and subsequent descriptors.
However, as of commit 579a25a854d4 ("net: stmmac: Initial support for
TBS") this is now separated, but the comments weren't updated.

Move the code populating the first descriptor along side the jumbo code
which also populates the first descriptor. This gives a consistent
location where we populate the descriptor(s) for the SKB head.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 63 +++++++++----------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5062537f79e9..0586ab13cc48 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4770,6 +4770,33 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		entry = stmmac_jumbo_frm(priv, tx_q, skb, csum_insertion);
 		if (unlikely(entry < 0) && (entry != -EINVAL))
 			goto dma_map_err;
+	} else {
+		bool last_segment = (nfrags == 0);
+
+		dma_addr = dma_map_single(priv->device, skb->data,
+					  nopaged_len, DMA_TO_DEVICE);
+		if (dma_mapping_error(priv->device, dma_addr))
+			goto dma_map_err;
+
+		stmmac_set_tx_skb_dma_entry(tx_q, first_entry, dma_addr,
+					    nopaged_len, false);
+
+		stmmac_set_desc_addr(priv, first_desc, dma_addr);
+
+		if (last_segment)
+			stmmac_set_tx_dma_last_segment(tx_q, first_entry);
+
+		if (unlikely((skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) &&
+			     priv->hwts_tx_en)) {
+			/* declare that device is doing timestamping */
+			skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
+			stmmac_enable_tx_timestamp(priv, first_desc);
+		}
+
+		/* Prepare the first descriptor without setting the OWN bit */
+		stmmac_prepare_tx_desc(priv, first_desc, 1, nopaged_len,
+				       csum_insertion, priv->descriptor_mode,
+				       0, last_segment, skb->len);
 	}
 
 	for (i = 0; i < nfrags; i++) {
@@ -4861,39 +4888,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (priv->sarc_type)
 		stmmac_set_desc_sarc(priv, first_desc, priv->sarc_type);
 
-	/* Ready to fill the first descriptor and set the OWN bit w/o any
-	 * problems because all the descriptors are actually ready to be
-	 * passed to the DMA engine.
-	 */
-	if (likely(!is_jumbo)) {
-		bool last_segment = (nfrags == 0);
-
-		dma_addr = dma_map_single(priv->device, skb->data,
-					  nopaged_len, DMA_TO_DEVICE);
-		if (dma_mapping_error(priv->device, dma_addr))
-			goto dma_map_err;
-
-		stmmac_set_tx_skb_dma_entry(tx_q, first_entry, dma_addr,
-					    nopaged_len, false);
-
-		stmmac_set_desc_addr(priv, first_desc, dma_addr);
-
-		if (last_segment)
-			stmmac_set_tx_dma_last_segment(tx_q, first_entry);
-
-		if (unlikely((skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) &&
-			     priv->hwts_tx_en)) {
-			/* declare that device is doing timestamping */
-			skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
-			stmmac_enable_tx_timestamp(priv, first_desc);
-		}
-
-		/* Prepare the first descriptor setting the OWN bit too */
-		stmmac_prepare_tx_desc(priv, first_desc, 1, nopaged_len,
-				       csum_insertion, priv->descriptor_mode,
-				       0, last_segment, skb->len);
-	}
-
 	if (tx_q->tbs & STMMAC_TBS_EN) {
 		struct timespec64 ts = ns_to_timespec64(skb->tstamp);
 
@@ -4901,6 +4895,9 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		stmmac_set_desc_tbs(priv, tbs_desc, ts.tv_sec, ts.tv_nsec);
 	}
 
+	/* Set the OWN bit on the first descriptor now that all descriptors
+	 * for this skb are populated.
+	 */
 	stmmac_set_tx_owner(priv, first_desc);
 
 	netdev_tx_sent_queue(netdev_get_tx_queue(dev, queue), skb->len);
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
