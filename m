Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A838122C1F
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2019 13:46:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38591C36B0F;
	Tue, 17 Dec 2019 12:46:24 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E4ADC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 12:46:21 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5DFE2C00C9;
 Tue, 17 Dec 2019 12:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1576586780; bh=a4OXfOga3Vii2W4f9BAWW9qHV0yF71H2Q7mz9cIL2CY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=hhuB/r3gdCxLxVxxXabia3uuwv2PkbVxIVx1O9VWqro+JcJxxDZsLqyS/Mv3WAUVs
 hJ5A3fbmucDRnqhCiDXKOawpCZrTOAz/4kAXqrHWcfdziXXs7rBWQDguLsP4JIEPbY
 EqLbv1Ub+D+i2xe+zEocR0NUhXykn5HOq1UOjAFq/WxNVAyfBCOTF+uDq4/0+2p7TQ
 5G1dEmA4ENsp46dTLwvOQ00mNskpkf1zA+j5tOvu9boe0FwcgQ0Aw1ei+cP3o808nH
 1ZNYaJ6T0cUiXfN4fNXAlRhuAsAOxtQggxwSx2WeJprlyaBEaJ4pkHQ0Zi1q/m0lQT
 wpZT7CMYXKb+g==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id C29EAA0089;
 Tue, 17 Dec 2019 12:46:17 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Tue, 17 Dec 2019 13:46:06 +0100
Message-Id: <c76b0d51238192f81a52231b214f252b20be55c6.1576586602.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1576586602.git.Jose.Abreu@synopsys.com>
References: <cover.1576586602.git.Jose.Abreu@synopsys.com>
In-Reply-To: <cover.1576586602.git.Jose.Abreu@synopsys.com>
References: <cover.1576586602.git.Jose.Abreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 2/7] net: stmmac: Always arm TX
	Timer at end of transmission start
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

If TX Coalesce timer is enabled we should always arm it, otherwise we
may hit the case where an interrupt is missed and the TX Queue will
timeout.

Arming the timer does not necessarly mean it will run the tx_clean()
because this function is wrapped around NAPI launcher.

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
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3299f5bb02e2..311647cdd672 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3053,8 +3053,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 		tx_q->tx_count_frames = 0;
 		stmmac_set_tx_ic(priv, desc);
 		priv->xstats.tx_set_ic_bit++;
-	} else {
-		stmmac_tx_timer_arm(priv, queue);
 	}
 
 	/* We've used all descriptors we need for this skb, however,
@@ -3125,6 +3123,7 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	tx_q->tx_tail_addr = tx_q->dma_tx_phy + (tx_q->cur_tx * sizeof(*desc));
 	stmmac_set_tx_tail_ptr(priv, priv->ioaddr, tx_q->tx_tail_addr, queue);
+	stmmac_tx_timer_arm(priv, queue);
 
 	return NETDEV_TX_OK;
 
@@ -3276,8 +3275,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		tx_q->tx_count_frames = 0;
 		stmmac_set_tx_ic(priv, desc);
 		priv->xstats.tx_set_ic_bit++;
-	} else {
-		stmmac_tx_timer_arm(priv, queue);
 	}
 
 	/* We've used all descriptors we need for this skb, however,
@@ -3366,6 +3363,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	tx_q->tx_tail_addr = tx_q->dma_tx_phy + (tx_q->cur_tx * sizeof(*desc));
 	stmmac_set_tx_tail_ptr(priv, priv->ioaddr, tx_q->tx_tail_addr, queue);
+	stmmac_tx_timer_arm(priv, queue);
 
 	return NETDEV_TX_OK;
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
