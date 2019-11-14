Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C69AEFC580
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2019 12:42:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82D0CC36B17;
	Thu, 14 Nov 2019 11:42:59 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48BBEC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 11:42:57 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D5AFBC04CC;
 Thu, 14 Nov 2019 11:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573731775; bh=vvxIcgTGJMMnHNBi5JJXe6vLAG4/fUQFci2iSCBSPvw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=VadeYVmWYWMrI53TlewnmWmnxb+uCy51vQntrqXcgg8w4E9mVf8iNrZTQSxVMjbpB
 ezN5Q3jjDK/kwIzsJakUaL1GLJXj0Vakk5W6c0alqlQGjfeFZsHikTiyx3ft6bqxy5
 A9TOGyXZDOJPaYD2cm066ZVQoRn9a65UoWPOsQzT1M4lHtLDv5GzcqN5m/SPFcPGHV
 ikrQL/u8PY5xD5rjK3XispyFLsMb3Q8UYCNepMFdjvrVfcnsEnC+BE3y/JjfaIxsiA
 L/Gpy+7aLbIRCkfUtQ+Pu1i/xaZdlF9wqbtjM+JSq6bSvt2hFvVvjeL2KrbsfvXS0z
 E1/gDNwz1ilRA==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 8EA25A0096;
 Thu, 14 Nov 2019 11:42:53 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Thu, 14 Nov 2019 12:42:50 +0100
Message-Id: <38f4e95c85da24c443efeac7cd8823ab99f94d28.1573731453.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573731453.git.Jose.Abreu@synopsys.com>
References: <cover.1573731453.git.Jose.Abreu@synopsys.com>
In-Reply-To: <cover.1573731453.git.Jose.Abreu@synopsys.com>
References: <cover.1573731453.git.Jose.Abreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 net-next 6/7] net: stmmac: Rework TX
	Coalesce logic
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Coalesce logic currently increments the number of packets and sets the
IC bit when the coalesced packets have passed a given limit. This does
not reflect very well what coalesce was meant for as we can have a large
number of packets that are coalesced and then a single one, sent later
on that has the IC bit.

Rework the logic so that it coalesces only upon a limit of packets and
sets the IC bit for large number of packets.

Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 61 ++++++++++++++++-------
 1 file changed, 42 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 400fbb727fd5..4ba250a9008f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2916,16 +2916,17 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	int nfrags = skb_shinfo(skb)->nr_frags;
 	u32 queue = skb_get_queue_mapping(skb);
+	unsigned int first_entry, tx_packets;
+	int tmp_pay_len = 0, first_tx;
 	struct stmmac_tx_queue *tx_q;
-	unsigned int first_entry;
 	u8 proto_hdr_len, hdr;
-	int tmp_pay_len = 0;
+	bool has_vlan, set_ic;
 	u32 pay_len, mss;
 	dma_addr_t des;
-	bool has_vlan;
 	int i;
 
 	tx_q = &priv->tx_queue[queue];
+	first_tx = tx_q->cur_tx;
 
 	/* Compute header lengths */
 	if (skb_shinfo(skb)->gso_type & SKB_GSO_UDP_L4) {
@@ -3033,16 +3034,27 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	tx_q->tx_skbuff[tx_q->cur_tx] = skb;
 
 	/* Manage tx mitigation */
-	tx_q->tx_count_frames += nfrags + 1;
-	if (likely(priv->tx_coal_frames > tx_q->tx_count_frames) &&
-	    !((skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) &&
-	      priv->hwts_tx_en)) {
-		stmmac_tx_timer_arm(priv, queue);
-	} else {
+	tx_packets = (tx_q->cur_tx + 1) - first_tx;
+	tx_q->tx_count_frames += tx_packets;
+
+	if ((skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) && priv->hwts_tx_en)
+		set_ic = true;
+	else if (!priv->tx_coal_frames)
+		set_ic = false;
+	else if (tx_packets > priv->tx_coal_frames)
+		set_ic = true;
+	else if ((tx_q->tx_count_frames % priv->tx_coal_frames) < tx_packets)
+		set_ic = true;
+	else
+		set_ic = false;
+
+	if (set_ic) {
 		desc = &tx_q->dma_tx[tx_q->cur_tx];
 		tx_q->tx_count_frames = 0;
 		stmmac_set_tx_ic(priv, desc);
 		priv->xstats.tx_set_ic_bit++;
+	} else {
+		stmmac_tx_timer_arm(priv, queue);
 	}
 
 	/* We've used all descriptors we need for this skb, however,
@@ -3133,6 +3145,7 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
  */
 static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 {
+	unsigned int first_entry, tx_packets, enh_desc;
 	struct stmmac_priv *priv = netdev_priv(dev);
 	unsigned int nopaged_len = skb_headlen(skb);
 	int i, csum_insertion = 0, is_jumbo = 0;
@@ -3141,13 +3154,12 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	int gso = skb_shinfo(skb)->gso_type;
 	struct dma_desc *desc, *first;
 	struct stmmac_tx_queue *tx_q;
-	unsigned int first_entry;
-	unsigned int enh_desc;
+	bool has_vlan, set_ic;
+	int entry, first_tx;
 	dma_addr_t des;
-	bool has_vlan;
-	int entry;
 
 	tx_q = &priv->tx_queue[queue];
+	first_tx = tx_q->cur_tx;
 
 	if (priv->tx_path_in_lpi_mode)
 		stmmac_disable_eee_mode(priv);
@@ -3241,12 +3253,21 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	 * This approach takes care about the fragments: desc is the first
 	 * element in case of no SG.
 	 */
-	tx_q->tx_count_frames += nfrags + 1;
-	if (likely(priv->tx_coal_frames > tx_q->tx_count_frames) &&
-	    !((skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) &&
-	      priv->hwts_tx_en)) {
-		stmmac_tx_timer_arm(priv, queue);
-	} else {
+	tx_packets = (entry + 1) - first_tx;
+	tx_q->tx_count_frames += tx_packets;
+
+	if ((skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) && priv->hwts_tx_en)
+		set_ic = true;
+	else if (!priv->tx_coal_frames)
+		set_ic = false;
+	else if (tx_packets > priv->tx_coal_frames)
+		set_ic = true;
+	else if ((tx_q->tx_count_frames % priv->tx_coal_frames) < tx_packets)
+		set_ic = true;
+	else
+		set_ic = false;
+
+	if (set_ic) {
 		if (likely(priv->extend_desc))
 			desc = &tx_q->dma_etx[entry].basic;
 		else
@@ -3255,6 +3276,8 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		tx_q->tx_count_frames = 0;
 		stmmac_set_tx_ic(priv, desc);
 		priv->xstats.tx_set_ic_bit++;
+	} else {
+		stmmac_tx_timer_arm(priv, queue);
 	}
 
 	/* We've used all descriptors we need for this skb, however,
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
