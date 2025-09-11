Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C66D8B52B7F
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Sep 2025 10:23:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EEBAC3089E;
	Thu, 11 Sep 2025 08:23:32 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 003BCC349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 08:23:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9907444B09;
 Thu, 11 Sep 2025 08:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 752B9C4CEF5;
 Thu, 11 Sep 2025 08:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757579009;
 bh=ypoWEn4gEmwpXn2cEWB0XS0dYLbndFFpNSdqJXTOW4Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=LyfXX21pQXJ8sPOmu/nEoHgenMeHVbEWPnevO04aNHJfFWHVHQYCllOtTDzBE+vZe
 sv9BVRDORO/daHD/fSfiXPoqv31NG2VGPRIMMWD5npOm+0zYRXY1J9orIrJAam3ZKp
 VjmoMdl0Jfn44UOfCi+2YVwt489tNkN8wDkn4puRG8xi84YFMHDfXz1eV1GIZ7OFIc
 Pt2t4BYxWLut0BdJq3ut/sMzhOZdceL9unHevQN+b4fmv/Jgs8Dob2SR80f3YJFDPi
 d8npjehLvZR92R6W1ijcUITRR+bARkntqnsZIzzvcVZ9vSk8ULjKH4ubyAieKwczPG
 KV3WOQi+ChMcQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 669FECAC592;
 Thu, 11 Sep 2025 08:23:29 +0000 (UTC)
From: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Thu, 11 Sep 2025 16:23:00 +0800
MIME-Version: 1.0
Message-Id: <20250911-qbv-fixes-v1-2-e81e9597cf1f@altera.com>
References: <20250911-qbv-fixes-v1-0-e81e9597cf1f@altera.com>
In-Reply-To: <20250911-qbv-fixes-v1-0-e81e9597cf1f@altera.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>, 
 Rohan G Thomas <rohan.g.thomas@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757579008; l=2479;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=eTWmL606f3oYOV0qUeKRaPXnGZ0t6qItbR3wWeC6D1c=;
 b=EDvj8phpndTc3hNkoyw7M0iVbCa4P7nqQt6SJ1KQa45vJvvOkJC8WbBXDlreFnKXxieSCVo3x
 kfKcEo9wqWYB19X/Va7sRFb63+luJvaYFcmDC06AF0n9burngz9EWNu
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: netdev@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@altera.com>,
 linux-kernel@vger.kernel.org, Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 2/2] net: stmmac: Consider Tx VLAN offload
 tag length for maxSDU
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

From: Rohan G Thomas <rohan.g.thomas@intel.com>

On hardware with Tx VLAN offload enabled, add the VLAN tag
length to the skb length before checking the Qbv maxSDU.
Add 4 bytes for 802.1Q an add 8 bytes for 802.1AD tagging.

Fixes: c5c3e1bfc9e0 ("net: stmmac: Offload queueMaxSDU from tc-taprio")
Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 25 ++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 419cb49ee5a25519a60a84bae6bcdb0be655384e..c487ce95436c2a1f502f96d00afab6270d77c0bb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4531,6 +4531,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	bool has_vlan, set_ic;
 	int entry, first_tx;
 	dma_addr_t des;
+	u32 sdu_len;
 
 	tx_q = &priv->dma_conf.tx_queue[queue];
 	txq_stats = &priv->xstats.txq_stats[queue];
@@ -4547,13 +4548,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
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
@@ -4569,6 +4563,23 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	/* Check if VLAN can be inserted by HW */
 	has_vlan = stmmac_vlan_insert(priv, skb, tx_q);
 
+	sdu_len = skb->len;
+	if (has_vlan) {
+		/* Add VLAN tag length to sdu length in case of txvlan offload */
+		if (priv->dev->features & NETIF_F_HW_VLAN_CTAG_TX)
+			sdu_len += VLAN_HLEN;
+		if (skb->vlan_proto == htons(ETH_P_8021AD) &&
+		    priv->dev->features & NETIF_F_HW_VLAN_STAG_TX)
+			sdu_len += VLAN_HLEN;
+	}
+
+	if (priv->est && priv->est->enable &&
+	    priv->est->max_sdu[queue] &&
+	    sdu_len > priv->est->max_sdu[queue]) {
+		priv->xstats.max_sdu_txq_drop[queue]++;
+		goto max_sdu_err;
+	}
+
 	entry = tx_q->cur_tx;
 	first_entry = entry;
 	WARN_ON(tx_q->tx_skbuff[first_entry]);

-- 
2.25.1


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
