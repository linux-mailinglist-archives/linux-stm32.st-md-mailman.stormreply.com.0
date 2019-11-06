Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0886F195E
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2019 16:03:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 766E4C36B2D;
	Wed,  6 Nov 2019 15:03:16 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc8-smtprelay2.synopsys.com
 [198.182.47.102])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F099C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 15:03:14 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 50588C0F54;
 Wed,  6 Nov 2019 15:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573052592; bh=orkA0OJGVviH22JL3eQ4nAhgpmWxuQSkZ3UgLXnjgm0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=bIYJgrEhHrAHDP8W8EOKXHDUEzWGAV9bnUFIYw2M8abdWkMiwibuCwgM8pBfGPxQ7
 c3GCuceKCwc7LkqaHSzue0qOB+CcdFlGQeCFFURgQGEnv+OLfASjx6wrVKYjdIeCnF
 NPFt8AuTAxxNMtYYMt2yBGL4ICrcGhLjRAwdEoFMZIhyCSpVxWUwe5O3QeNU98aIVg
 yCXebNikdqOP8o4jS25TGUn7MCWlwjKT+LZuiOK+ZijQSiFHz0YUO6Arz3C5AnK3nK
 EuvOAYw2YiuAXnUMZVNaWqOmLAAJzWsDp59BaeqQuoIjWvj79rvEWpoRGZd0fLPt9B
 sX6xx9aoLo+xg==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 0E724A0089;
 Wed,  6 Nov 2019 15:03:11 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Wed,  6 Nov 2019 16:03:05 +0100
Message-Id: <b8d2676910857e8cede306c3fb140bd8fccf9ad3.1573052379.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573052378.git.Jose.Abreu@synopsys.com>
References: <cover.1573052378.git.Jose.Abreu@synopsys.com>
In-Reply-To: <cover.1573052378.git.Jose.Abreu@synopsys.com>
References: <cover.1573052378.git.Jose.Abreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 11/11] net: stmmac: Fix the TX IOC in xmit
	path
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

IOC bit must be only set in the last descriptor. Move the logic up a
little bit to make sure it's set in the correct descriptor.

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
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 64 ++++++++++++-----------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b0a16d7c6e3d..f826365c979d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3024,6 +3024,19 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	/* Only the last descriptor gets to point to the skb. */
 	tx_q->tx_skbuff[tx_q->cur_tx] = skb;
 
+	/* Manage tx mitigation */
+	tx_q->tx_count_frames += nfrags + 1;
+	if (likely(priv->tx_coal_frames > tx_q->tx_count_frames) &&
+	    !((skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) &&
+	      priv->hwts_tx_en)) {
+		stmmac_tx_timer_arm(priv, queue);
+	} else {
+		desc = &tx_q->dma_tx[tx_q->cur_tx];
+		tx_q->tx_count_frames = 0;
+		stmmac_set_tx_ic(priv, desc);
+		priv->xstats.tx_set_ic_bit++;
+	}
+
 	/* We've used all descriptors we need for this skb, however,
 	 * advance cur_tx so that it references a fresh descriptor.
 	 * ndo_start_xmit will fill this descriptor the next time it's
@@ -3041,19 +3054,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	priv->xstats.tx_tso_frames++;
 	priv->xstats.tx_tso_nfrags += nfrags;
 
-	/* Manage tx mitigation */
-	tx_q->tx_count_frames += nfrags + 1;
-	if (likely(priv->tx_coal_frames > tx_q->tx_count_frames) &&
-	    !(priv->synopsys_id >= DWMAC_CORE_4_00 &&
-	    (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) &&
-	    priv->hwts_tx_en)) {
-		stmmac_tx_timer_arm(priv, queue);
-	} else {
-		tx_q->tx_count_frames = 0;
-		stmmac_set_tx_ic(priv, desc);
-		priv->xstats.tx_set_ic_bit++;
-	}
-
 	if (priv->sarc_type)
 		stmmac_set_desc_sarc(priv, first, priv->sarc_type);
 
@@ -3225,6 +3225,27 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	/* Only the last descriptor gets to point to the skb. */
 	tx_q->tx_skbuff[entry] = skb;
 
+	/* According to the coalesce parameter the IC bit for the latest
+	 * segment is reset and the timer re-started to clean the tx status.
+	 * This approach takes care about the fragments: desc is the first
+	 * element in case of no SG.
+	 */
+	tx_q->tx_count_frames += nfrags + 1;
+	if (likely(priv->tx_coal_frames > tx_q->tx_count_frames) &&
+	    !((skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) &&
+	      priv->hwts_tx_en)) {
+		stmmac_tx_timer_arm(priv, queue);
+	} else {
+		if (likely(priv->extend_desc))
+			desc = &tx_q->dma_etx[entry].basic;
+		else
+			desc = &tx_q->dma_tx[entry];
+
+		tx_q->tx_count_frames = 0;
+		stmmac_set_tx_ic(priv, desc);
+		priv->xstats.tx_set_ic_bit++;
+	}
+
 	/* We've used all descriptors we need for this skb, however,
 	 * advance cur_tx so that it references a fresh descriptor.
 	 * ndo_start_xmit will fill this descriptor the next time it's
@@ -3260,23 +3281,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	dev->stats.tx_bytes += skb->len;
 
-	/* According to the coalesce parameter the IC bit for the latest
-	 * segment is reset and the timer re-started to clean the tx status.
-	 * This approach takes care about the fragments: desc is the first
-	 * element in case of no SG.
-	 */
-	tx_q->tx_count_frames += nfrags + 1;
-	if (likely(priv->tx_coal_frames > tx_q->tx_count_frames) &&
-	    !(priv->synopsys_id >= DWMAC_CORE_4_00 &&
-	    (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) &&
-	    priv->hwts_tx_en)) {
-		stmmac_tx_timer_arm(priv, queue);
-	} else {
-		tx_q->tx_count_frames = 0;
-		stmmac_set_tx_ic(priv, desc);
-		priv->xstats.tx_set_ic_bit++;
-	}
-
 	if (priv->sarc_type)
 		stmmac_set_desc_sarc(priv, first, priv->sarc_type);
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
