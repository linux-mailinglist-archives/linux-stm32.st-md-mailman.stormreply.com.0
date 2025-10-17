Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72665BE68DF
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Oct 2025 08:11:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58815C57B7B;
	Fri, 17 Oct 2025 06:11:36 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D9C7C57B71
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 06:11:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 051166420B;
 Fri, 17 Oct 2025 06:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99E9FC4CEE7;
 Fri, 17 Oct 2025 06:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760681492;
 bh=kiZ/E3EReHUX0M1b+8d/q62Wo1VPS2A4vlagRzx83LQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=VV9GcW2BRCikIQ/H/scyfCtOqIlylreOp9hSMMar9qBsNRDjR2FfDavrq1orN+xUv
 iDCpag2j+5thSXgq8CSbVvzzcinNNVzIk82q0zKtQ3cyVB2pTSvpWQJjVyX4MWZy/o
 HNgAKnmZ3qTn9bWZ2myXJoSqNdYI2u9QKeQxFS+krIxmS5NgT9U9QkYdjIKPQmzIpj
 hNqxD7jMhVq1QR1w3YKWdo5tju09UCubQaZVxyhaKcQmIDcgDxkVp7LM3yZ+3nPHj/
 oe3PykmzNnrpP7ysKNuMLGCfHgC9khHuDejK+58Fy54bDqVb2+zUsQiNreIyHP88nX
 i3PNqg0ah3WdA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 90A87CCD199;
 Fri, 17 Oct 2025 06:11:32 +0000 (UTC)
From: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Fri, 17 Oct 2025 14:11:20 +0800
MIME-Version: 1.0
Message-Id: <20251017-qbv-fixes-v3-2-d3a42e32646a@altera.com>
References: <20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com>
In-Reply-To: <20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>, 
 Rohan G Thomas <rohan.g.thomas@intel.com>, 
 Boon Khai Ng <boon.khai.ng@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760681491; l=2216;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=jcxjbVsIAOtq9pkhXrGNK9OcxDQoYMmKdVWnGqUpw8w=;
 b=Sf2ajyE8ADotRUn+QZuwv0vYNgHn1PxaIwhGA+1sNu7EqNI5uMqNDQLYoGjwMAydQpYdRHBmB
 cWANmRpfenMDn0Q5bBFAHqTWti0xS4jdZW2KTBb06OTgtKIwsk+KSni
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: netdev@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@altera.com>,
 linux-kernel@vger.kernel.org, Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v3 2/3] net: stmmac: Consider Tx VLAN
 offload tag length for maxSDU
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
Reply-To: rohan.g.thomas@altera.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Rohan G Thomas <rohan.g.thomas@altera.com>

On hardware with Tx VLAN offload enabled, add the VLAN tag length to
the skb length before checking the Qbv maxSDU if Tx VLAN offload is
requested for the packet. Add 4 bytes for 802.1Q tag.

Fixes: c5c3e1bfc9e0 ("net: stmmac: Offload queueMaxSDU from tc-taprio")
Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index dedaaef3208bfadc105961029f79d0d26c3289d8..23bf4a3d324b7f8e8c3067ed4d47b436a89c97d3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4500,6 +4500,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	bool has_vlan, set_ic;
 	int entry, first_tx;
 	dma_addr_t des;
+	u32 sdu_len;
 
 	tx_q = &priv->dma_conf.tx_queue[queue];
 	txq_stats = &priv->xstats.txq_stats[queue];
@@ -4516,13 +4517,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 			return stmmac_tso_xmit(skb, dev);
 	}
 
-	if (priv->est && priv->est->enable &&
-	    priv->est->max_sdu[queue] &&
-	    skb->len > priv->est->max_sdu[queue]){
-		priv->xstats.max_sdu_txq_drop[queue]++;
-		goto max_sdu_err;
-	}
-
 	if (unlikely(stmmac_tx_avail(priv, queue) < nfrags + 1)) {
 		if (!netif_tx_queue_stopped(netdev_get_tx_queue(dev, queue))) {
 			netif_tx_stop_queue(netdev_get_tx_queue(priv->dev,
@@ -4535,8 +4529,18 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		return NETDEV_TX_BUSY;
 	}
 
+	sdu_len = skb->len;
 	/* Check if VLAN can be inserted by HW */
 	has_vlan = stmmac_vlan_insert(priv, skb, tx_q);
+	if (has_vlan)
+		sdu_len += VLAN_HLEN;
+
+	if (priv->est && priv->est->enable &&
+	    priv->est->max_sdu[queue] &&
+	    skb->len > priv->est->max_sdu[queue]){
+		priv->xstats.max_sdu_txq_drop[queue]++;
+		goto max_sdu_err;
+	}
 
 	entry = tx_q->cur_tx;
 	first_entry = entry;

-- 
2.43.7


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
