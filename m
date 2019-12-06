Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BC711504F
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2019 13:23:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CF13C36B0B;
	Fri,  6 Dec 2019 12:23:29 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B45EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2019 11:40:43 +0000 (UTC)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
 by 156.147.23.52 with ESMTP; 6 Dec 2019 20:40:41 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: neidhard.kim@lge.com
Received: from unknown (HELO localhost.localdomain) (10.178.32.48)
 by 156.147.1.121 with ESMTP; 6 Dec 2019 20:40:41 +0900
X-Original-SENDERIP: 10.178.32.48
X-Original-MAILFROM: neidhard.kim@lge.com
From: Jongsung Kim <neidhard.kim@lge.com>
To: netdev@vger.kernel.org
Date: Fri,  6 Dec 2019 20:40:00 +0900
Message-Id: <20191206114000.27283-1-neidhard.kim@lge.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Dec 2019 12:23:28 +0000
Cc: Jongsung Kim <neidhard.kim@lge.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: reset Tx desc base address
	before restarting Tx
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

Refer to the databook of DesignWare Cores Ethernet MAC Universal:

6.2.1.5 Register 4 (Transmit Descriptor List Address Register

If this register is not changed when the ST bit is set to 0, then
the DMA takes the descriptor address where it was stopped earlier.

The stmmac_tx_err() does zero indices to Tx descriptors, but does
not reset HW current Tx descriptor address. To fix inconsistency,
the base address of the Tx descriptors should be rewritten before
restarting Tx.

Signed-off-by: Jongsung Kim <neidhard.kim@lge.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 644cb5d1fd4f..bbc65bd332a8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2009,6 +2009,8 @@ static void stmmac_tx_err(struct stmmac_priv *priv, u32 chan)
 	tx_q->cur_tx = 0;
 	tx_q->mss = 0;
 	netdev_tx_reset_queue(netdev_get_tx_queue(priv->dev, chan));
+	stmmac_init_tx_chan(priv, priv->ioaddr, priv->plat->dma_cfg,
+			    tx_q->dma_tx_phy, chan);
 	stmmac_start_tx_dma(priv, chan);
 
 	priv->dev->stats.tx_errors++;
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
