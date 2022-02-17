Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B867B4BA3BF
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Feb 2022 15:55:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7043FC6046C;
	Thu, 17 Feb 2022 14:55:45 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F36EC6046A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Feb 2022 14:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1645109743;
 x=1676645743;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QxcUKmOttRZJLYW7ut8tqGGUV1itp+JVUMIR7K85mzc=;
 b=HZo3dqhi8avz6UUYJM96zEZgIW8fyEDdcL2LU/5ndSXSKXH8rczCDKOI
 gZJ8iDUMd+SNtk2OZfxsHSHSblBnU2cTDZAyXgsKj2CMK0wULce+IGeEK
 jLr26JBl6w/CKbAcNMLckOqbL2C5BRsHtOXdO6a1zkFL6OUBvquXp6erV
 7gmre4p6ZIT++/pp/DQWST6kZNuMqBUigRHf6omXKywddAs2fVaBbBbun
 SlxBxiniY+XF2O0QJerf88EySF6ZNEwfubSQQSU13NgRTM5sByFIkFeKb
 atQwVqmyCqopFavK6mLB5cBl0ZQc8msuj1NKVy1BCF6ZE3VDiUD/7ogIb g==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu, 17 Feb 2022 15:55:26 +0100
Message-ID: <20220217145527.2696444-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Srinivas Kandagatla <srinivas.kandagatla@st.com>, netdev@vger.kernel.org,
 Vincent Whitchurch <vincent.whitchurch@axis.com>, linux-kernel@vger.kernel.org,
 kernel@axis.com, Lars Persson <larper@axis.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: Enable NAPI before interrupts go
	live
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

From: Lars Persson <larper@axis.com>

The stmmac_open function has a race window between enabling the RX
path and its interrupt to the point where napi_enabled is called.

A chatty network with plenty of broadcast/multicast traffic has the
potential to completely fill the RX ring before the interrupt handler
is installed. In this scenario the single interrupt taken will find
napi disabled and the RX ring will not be processed. No further RX
interrupt will be delivered because the ring is full.

The RX stall could eventually clear because the TX path will trigger a
DMA interrupt once the tx_coal_frames threshold is reached and then
NAPI becomes scheduled.

Fixes: 523f11b5d4fd72efb ("net: stmmac: move hardware setup for stmmac_open to new function")
Signed-off-by: Lars Persson <larper@axis.com>
[vincent.whitchurch@axis.com: Forward-port to mainline, change xdp_open too]
Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6708ca2aa4f7..8bd4123515b0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3753,11 +3753,12 @@ static int stmmac_open(struct net_device *dev)
 	/* We may have called phylink_speed_down before */
 	phylink_speed_up(priv->phylink);
 
+	stmmac_enable_all_queues(priv);
+
 	ret = stmmac_request_irq(dev);
 	if (ret)
 		goto irq_error;
 
-	stmmac_enable_all_queues(priv);
 	netif_tx_start_all_queues(priv->dev);
 
 	return 0;
@@ -3768,6 +3769,7 @@ static int stmmac_open(struct net_device *dev)
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->tx_queue[chan].txtimer);
 
+	stmmac_disable_all_queues(priv);
 	stmmac_hw_teardown(dev);
 init_error:
 	free_dma_desc_resources(priv);
@@ -6562,12 +6564,13 @@ int stmmac_xdp_open(struct net_device *dev)
 	/* Start Rx & Tx DMA Channels */
 	stmmac_start_all_dma(priv);
 
+	/* Enable NAPI process*/
+	stmmac_enable_all_queues(priv);
+
 	ret = stmmac_request_irq(dev);
 	if (ret)
 		goto irq_error;
 
-	/* Enable NAPI process*/
-	stmmac_enable_all_queues(priv);
 	netif_carrier_on(dev);
 	netif_tx_start_all_queues(dev);
 
@@ -6577,6 +6580,7 @@ int stmmac_xdp_open(struct net_device *dev)
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->tx_queue[chan].txtimer);
 
+	stmmac_disable_all_queues(priv);
 	stmmac_hw_teardown(dev);
 init_error:
 	free_dma_desc_resources(priv);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
