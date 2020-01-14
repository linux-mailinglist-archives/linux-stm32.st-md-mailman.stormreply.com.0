Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F77138EA6
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2020 11:13:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BF8AC36B0D;
	Mon, 13 Jan 2020 10:13:31 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B3B3C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 10:13:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 02:13:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,428,1571727600"; d="scan'208";a="397116758"
Received: from bong5-hp-z440.png.intel.com ([10.221.118.136])
 by orsmga005.jf.intel.com with ESMTP; 13 Jan 2020 02:13:24 -0800
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: netdev@vger.kernel.org
Date: Tue, 14 Jan 2020 10:01:10 +0800
Message-Id: <1578967276-55956-2-git-send-email-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578967276-55956-1-git-send-email-boon.leong.ong@intel.com>
References: <1578967276-55956-1-git-send-email-boon.leong.ong@intel.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Voon Weifeng <weifeng.voon@intel.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tan Tee Min <tee.min.tan@intel.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/7] net: stmmac: fix error in updating rx
	tail pointer to last free entry
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

DMA_CH(#i)_RxDesc_Tail_Pointer points to an offset from the base and
indicates the location of the last valid descriptor.

The change introduced by "net: stmmac: Update RX Tail Pointer to last
free entry" incorrectly updates the RxDesc_Tail_Pointer and causess
Rx operation to freeze in corner case. The issue is explained as
follow:-

Say, cur_rx=1 and dirty_rx=0, then we have dirty=1 and entry=0 before
the while (dirty-- > 0) loop of stmmac_rx_refill() is entered. When
the while loop is 1st entered, Rx buffer[entry=0] is refilled and after
entry++, then, entry=1. Now, the while loop condition check "dirty-- > 0"
and the while loop bails out because dirty=0. Up to this point, the
driver code works correctly.

However, the current implementation sets the Rx Tail Pointer to the
location pointed by dirty_rx, just updated to the value of entry(=1).
This is incorrect because the last Rx buffer that is refileld with empty
buffer is with entry=0. In another words, the current logics always sets
Rx Tail Pointer to the next Rx buffer to be refilled (too early).

So, we fix this by tracking the index of the most recently refilled Rx
buffer by using "last_refill" and use "last_refill" to update the Rx Tail
Pointer instead of using "entry" which points to the next dirty_rx to be
refilled in future.

Fixes: 858a31ffc3d9 ("net: stmmac: Update RX Tail Pointer to last free entry")

Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 80d59b7..a317f67 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3417,6 +3417,7 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
 	struct stmmac_rx_queue *rx_q = &priv->rx_queue[queue];
 	int len, dirty = stmmac_rx_dirty(priv, queue);
 	unsigned int entry = rx_q->dirty_rx;
+	unsigned int last_refill = entry;
 
 	len = DIV_ROUND_UP(priv->dma_buf_sz, PAGE_SIZE) * PAGE_SIZE;
 
@@ -3471,12 +3472,13 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
 
 		dma_wmb();
 		stmmac_set_rx_owner(priv, p, use_rx_wd);
-
+		last_refill = entry;
 		entry = STMMAC_GET_ENTRY(entry, DMA_RX_SIZE);
 	}
+
 	rx_q->dirty_rx = entry;
 	rx_q->rx_tail_addr = rx_q->dma_rx_phy +
-			    (rx_q->dirty_rx * sizeof(struct dma_desc));
+			     (last_refill * sizeof(struct dma_desc));
 	stmmac_set_rx_tail_ptr(priv, priv->ioaddr, rx_q->rx_tail_addr, queue);
 }
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
