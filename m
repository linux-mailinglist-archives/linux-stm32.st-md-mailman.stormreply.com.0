Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E58A24C2B0E
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Feb 2022 12:38:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0C81C5F1D7;
	Thu, 24 Feb 2022 11:38:39 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD90FC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Feb 2022 11:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1645702719;
 x=1677238719;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JrRPEFKeXWcc6jAXtUVnif+wj03hnZPozhAYD5BNe3k=;
 b=VGwmMRijotrG5JJNV/qL5V5u1pOCwSq0i9H/02lBW7m7CDNy/Dmrl0sK
 f+9JGtrFmrZCSneF2TgyZWy2Iq8VxL0M0JwMZnEeYP3D0TrnEibxO5XZo
 KVO8CvVhUcAwdj+acTdF1EBOYN7dzwpkvK9qnp15bANnSZEsVUgxP3hUD
 xzM/HgKWZMHlVEWpofW6dxDmU6N6DgbuwnKqJFxixHkLIETX/w9FNEYZE
 9WvmrzrHGmMaWls9sU6C5p3G4kTYn0mQxwsNeuqYpfuDKvdirnjZwj0uE
 9WMIW3LVE2+BzE/f4dzqvu79kIPdknCTMJJTzyAGBe/ltZIgps83HkPdi w==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu, 24 Feb 2022 12:38:29 +0100
Message-ID: <20220224113829.1092859-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Srinivas Kandagatla <srinivas.kandagatla@st.com>, netdev@vger.kernel.org,
 Vincent Whitchurch <vincent.whitchurch@axis.com>, linux-kernel@vger.kernel.org,
 kernel@axis.com, Lars Persson <larper@axis.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] net: stmmac: only enable DMA interrupts
	when ready
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

In this driver's ->ndo_open() callback, it enables DMA interrupts,
starts the DMA channels, then requests interrupts with request_irq(),
and then finally enables napi.

If RX DMA interrupts are received before napi is enabled, no processing
is done because napi_schedule_prep() will return false.  If the network
has a lot of broadcast/multicast traffic, then the RX ring could fill up
completely before napi is enabled.  When this happens, no further RX
interrupts will be delivered, and the driver will fail to receive any
packets.

Fix this by only enabling DMA interrupts after all other initialization
is complete.

Fixes: 523f11b5d4fd72efb ("net: stmmac: move hardware setup for stmmac_open to new function")
Reported-by: Lars Persson <larper@axis.com>
Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6708ca2aa4f7..43978558d6c0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2260,6 +2260,23 @@ static void stmmac_stop_tx_dma(struct stmmac_priv *priv, u32 chan)
 	stmmac_stop_tx(priv, priv->ioaddr, chan);
 }
 
+static void stmmac_enable_all_dma_irq(struct stmmac_priv *priv)
+{
+	u32 rx_channels_count = priv->plat->rx_queues_to_use;
+	u32 tx_channels_count = priv->plat->tx_queues_to_use;
+	u32 dma_csr_ch = max(rx_channels_count, tx_channels_count);
+	u32 chan;
+
+	for (chan = 0; chan < dma_csr_ch; chan++) {
+		struct stmmac_channel *ch = &priv->channel[chan];
+		unsigned long flags;
+
+		spin_lock_irqsave(&ch->lock, flags);
+		stmmac_enable_dma_irq(priv, priv->ioaddr, chan, 1, 1);
+		spin_unlock_irqrestore(&ch->lock, flags);
+	}
+}
+
 /**
  * stmmac_start_all_dma - start all RX and TX DMA channels
  * @priv: driver private structure
@@ -2902,8 +2919,10 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 		stmmac_axi(priv, priv->ioaddr, priv->plat->axi);
 
 	/* DMA CSR Channel configuration */
-	for (chan = 0; chan < dma_csr_ch; chan++)
+	for (chan = 0; chan < dma_csr_ch; chan++) {
 		stmmac_init_chan(priv, priv->ioaddr, priv->plat->dma_cfg, chan);
+		stmmac_disable_dma_irq(priv, priv->ioaddr, chan, 1, 1);
+	}
 
 	/* DMA RX Channel Configuration */
 	for (chan = 0; chan < rx_channels_count; chan++) {
@@ -3759,6 +3778,7 @@ static int stmmac_open(struct net_device *dev)
 
 	stmmac_enable_all_queues(priv);
 	netif_tx_start_all_queues(priv->dev);
+	stmmac_enable_all_dma_irq(priv);
 
 	return 0;
 
@@ -6508,8 +6528,10 @@ int stmmac_xdp_open(struct net_device *dev)
 	}
 
 	/* DMA CSR Channel configuration */
-	for (chan = 0; chan < dma_csr_ch; chan++)
+	for (chan = 0; chan < dma_csr_ch; chan++) {
 		stmmac_init_chan(priv, priv->ioaddr, priv->plat->dma_cfg, chan);
+		stmmac_disable_dma_irq(priv, priv->ioaddr, chan, 1, 1);
+	}
 
 	/* Adjust Split header */
 	sph_en = (priv->hw->rx_csum > 0) && priv->sph;
@@ -6570,6 +6592,7 @@ int stmmac_xdp_open(struct net_device *dev)
 	stmmac_enable_all_queues(priv);
 	netif_carrier_on(dev);
 	netif_tx_start_all_queues(dev);
+	stmmac_enable_all_dma_irq(priv);
 
 	return 0;
 
@@ -7447,6 +7470,7 @@ int stmmac_resume(struct device *dev)
 	stmmac_restore_hw_vlan_rx_fltr(priv, ndev, priv->hw);
 
 	stmmac_enable_all_queues(priv);
+	stmmac_enable_all_dma_irq(priv);
 
 	mutex_unlock(&priv->lock);
 	rtnl_unlock();
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
