Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBR3M4QuuGm1aAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 17:23:32 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EEC29D47A
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 17:23:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42AFBC8F273;
	Mon, 16 Mar 2026 16:23:32 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAD4FC8F29C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 09:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KjJZ1TJUP695UiAqPL6BoRhgzyhmumeRsrpDvBHs/Po=; b=r0oEGgP5C/qUlhv8cEClHAYim6
 Vcq2JcpGGIgaKAprjWSIbtChtf1RLlvTrXXlhwzDoakXqwITj+8lYFMk5OPijeRPk5/82Y7snjFSN
 5DzUIISzNuv9sKMxlGbAVbgQbwiWC2i4dgvHsI8zojMuPHgexFeH/vLJMebbSQAISjHb4Iu56ATsJ
 p3NrVrSAXj6qBtSUPB0dRfMQfOihNl5j/Sjj4eZhw3rzhKUqq8VQiO7Cy0SdgXAMhh/r0GB7on14G
 057thgtHDBwBCtw+srtyvf/Z3FG/lOEnywrLVay689YIYay0QLMjdkmo5NvWd0Q7HGg1hn05Ga8xN
 kSNkTGBA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53630 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1w0zBg-000000000gQ-2kPm;
 Fri, 13 Mar 2026 09:52:08 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1w0zBc-0000000D4G9-0hz2; Fri, 13 Mar 2026 09:52:04 +0000
In-Reply-To: <abPdzyXJHqt5v3bi@shell.armlinux.org.uk>
References: <abPdzyXJHqt5v3bi@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1w0zBc-0000000D4G9-0hz2@rmk-PC.armlinux.org.uk>
Date: Fri, 13 Mar 2026 09:52:04 +0000
X-Mailman-Approved-At: Mon, 16 Mar 2026 16:23:30 +0000
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Alexei Starovoitov <ast@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 13/15] net: stmmac: add helper to
 set transmit tail pointer
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
	DATE_IN_PAST(1.00)[78];
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
	NEURAL_HAM(-0.00)[-0.242];
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
X-Rspamd-Queue-Id: B0EEC29D47A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Setting the queue transmit tail pointer follows a common pattern:
calculate the DMA address, and then call stmmac_set_tx_tail_ptr().
The only difference between all the call sites is the index used.

Factor this out into a static function.

We need to update dwmac4_display_ring() to cope the passed head
pointer always pointing at the struct dma_desc by using
dma_desc_to_edesc() to convert it to struct dma_edesc. This is the
only stmmac_display_ring() implementation that this affects.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/descs.h   |  2 ++
 .../ethernet/stmicro/stmmac/dwmac4_descs.c    |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 30 ++++++++++---------
 3 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/descs.h b/drivers/net/ethernet/stmicro/stmmac/descs.h
index e62e2ebcf273..846007cc245f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/descs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/descs.h
@@ -173,6 +173,8 @@ struct dma_edesc {
 	struct dma_desc basic;
 };
 
+#define dma_desc_to_edesc(x) container_of(x, struct dma_edesc, basic)
+
 /* Transmit checksum insertion control */
 #define	TX_CIC_FULL	3	/* Include IP header and pseudoheader */
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index 1bbf02504dad..d5c003f3fbbc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -427,7 +427,7 @@ static void dwmac4_display_ring(void *head, unsigned int size, bool rx,
 			extp++;
 		}
 	} else if (desc_size == sizeof(struct dma_edesc)) {
-		struct dma_edesc *ep = (struct dma_edesc *)head;
+		struct dma_edesc *ep = dma_desc_to_edesc(head);
 
 		for (i = 0; i < size; i++) {
 			dma_addr = dma_rx_phy + i * sizeof(*ep);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index da1726b887f3..4521469c5e1d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -385,6 +385,18 @@ static struct dma_desc *stmmac_get_tx_desc(struct stmmac_priv *priv,
 		return &tx_q->dma_tx[index];
 }
 
+static void stmmac_set_queue_tx_tail_ptr(struct stmmac_priv *priv,
+					 struct stmmac_tx_queue *tx_q,
+					 unsigned int chan, unsigned int index)
+{
+	int desc_size;
+
+	desc_size = stmmac_get_tx_desc_size(priv, tx_q);
+
+	tx_q->tx_tail_addr = tx_q->dma_tx_phy + index * desc_size;
+	stmmac_set_tx_tail_ptr(priv, priv->ioaddr, tx_q->tx_tail_addr, chan);
+}
+
 static size_t stmmac_get_rx_desc_size(struct stmmac_priv *priv)
 {
 	if (priv->extend_desc)
@@ -3311,9 +3323,7 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 		stmmac_init_tx_chan(priv, priv->ioaddr, priv->plat->dma_cfg,
 				    tx_q->dma_tx_phy, chan);
 
-		tx_q->tx_tail_addr = tx_q->dma_tx_phy;
-		stmmac_set_tx_tail_ptr(priv, priv->ioaddr,
-				       tx_q->tx_tail_addr, chan);
+		stmmac_set_queue_tx_tail_ptr(priv, tx_q, chan, 0);
 	}
 
 	return ret;
@@ -4326,9 +4336,6 @@ static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
 static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue)
 {
 	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
-	int desc_size;
-
-	desc_size = stmmac_get_tx_desc_size(priv, tx_q);
 
 	/* The own bit must be the latest setting done when prepare the
 	 * descriptor and then barrier is needed to make sure that
@@ -4336,8 +4343,7 @@ static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue)
 	 */
 	wmb();
 
-	tx_q->tx_tail_addr = tx_q->dma_tx_phy + (tx_q->cur_tx * desc_size);
-	stmmac_set_tx_tail_ptr(priv, priv->ioaddr, tx_q->tx_tail_addr, queue);
+	stmmac_set_queue_tx_tail_ptr(priv, tx_q, queue, tx_q->cur_tx);
 }
 
 /**
@@ -6967,9 +6973,7 @@ void stmmac_enable_tx_queue(struct stmmac_priv *priv, u32 queue)
 	if (tx_q->tbs & STMMAC_TBS_AVAIL)
 		stmmac_enable_tbs(priv, priv->ioaddr, 1, tx_q->queue_index);
 
-	tx_q->tx_tail_addr = tx_q->dma_tx_phy;
-	stmmac_set_tx_tail_ptr(priv, priv->ioaddr,
-			       tx_q->tx_tail_addr, tx_q->queue_index);
+	stmmac_set_queue_tx_tail_ptr(priv, tx_q, tx_q->queue_index, 0);
 
 	stmmac_start_tx_dma(priv, queue);
 
@@ -7070,9 +7074,7 @@ int stmmac_xdp_open(struct net_device *dev)
 		stmmac_init_tx_chan(priv, priv->ioaddr, priv->plat->dma_cfg,
 				    tx_q->dma_tx_phy, chan);
 
-		tx_q->tx_tail_addr = tx_q->dma_tx_phy;
-		stmmac_set_tx_tail_ptr(priv, priv->ioaddr,
-				       tx_q->tx_tail_addr, chan);
+		stmmac_set_queue_tx_tail_ptr(priv, tx_q, chan, 0);
 
 		hrtimer_setup(&tx_q->txtimer, stmmac_tx_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 	}
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
