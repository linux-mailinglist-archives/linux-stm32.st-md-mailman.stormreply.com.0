Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 635A779718A
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Sep 2023 12:46:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F034C6B468;
	Thu,  7 Sep 2023 10:46:38 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A55BC6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Sep 2023 10:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1694083596;
 x=1725619596;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=diUzlnvHkwnFRUQDjEqQ8wBxKHMIU3epIc6mBh7MkYE=;
 b=mKrutlD3eHWKHYYZ1lTZFqakTvO2OXDEstLj1hGR7MRiPxZQAHfwjzaT
 RHwtchFXw3R7P/2nv6HtA2eeKXJrmXyUqTNXN1CAy6ekhupFhPGmikoxg
 NUv7IX8MD5dHoeD/wJwrH8XSNTp32X0VvpZr/XYtXw6C1+ZIweVlK6o//
 Xh7bmegUl1cgLNa993uAZqvarxAFvEBtaRS1LiesHJl9OHS4VdvQKkAVh
 M11PYQNRBUqScJ+5Td317exLlCOxqu+cZaMwTgQtd0IrRuzDk3/WM2Flp
 XP5SBbANws8FG4sibxN144/oSPXV4sXuhz855qhXsBfSe+Vc1RKkw+KBo A==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
Date: Thu, 7 Sep 2023 12:46:31 +0200
MIME-Version: 1.0
Message-ID: <20230907-stmmac-coaloff-v2-1-38ccfac548b9@axis.com>
X-B4-Tracking: v=1; b=H4sIAAaq+WQC/12Nyw7CIBREf6W5azEUa9O68j9MFzwu9iZSDBBS0
 /DvEuLK5ZnJnDkgYiCMcOsOCJgpkt8qiFMHepXbExmZyiC4uPCZDywm56Rm2suXt5ZJLUeFVhk
 xKKijd0BLexM+YMMESw1XismHTzvJfat+vuu/L/esZyjmSXCcrB3NXe4Uz9o7WEopX1DdP1mwA
 AAA
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
X-Mailer: b4 0.12.3
Cc: netdev@vger.kernel.org, Vincent Whitchurch <vincent.whitchurch@axis.com>,
 linux-kernel@vger.kernel.org, Maxim Mikityanskiy <maxtram95@gmail.com>,
 kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Subject: [Linux-stm32] [PATCH net v2] net: stmmac: fix handling of zero
 coalescing tx-usecs
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

Setting ethtool -C eth0 tx-usecs 0 is supposed to disable the use of the
coalescing timer but currently it gets programmed with zero delay
instead.

Disable the use of the coalescing timer if tx-usecs is zero by
preventing it from being restarted.  Note that to keep things simple we
don't start/stop the timer when the coalescing settings are changed, but
just let that happen on the next transmit or timer expiry.

Fixes: 8fce33317023 ("net: stmmac: Rework coalesce timer and fix multi-queue races")
Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
Changes in v2:
- Rebased on current net/main.
- Link to v1: https://lore.kernel.org/r/20230905-stmmac-coaloff-v1-1-e29820e8ff6d@axis.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9a3182b9e767..2206789802bf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2704,9 +2704,7 @@ static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue)
 
 	/* We still have pending packets, let's call for a new scheduling */
 	if (tx_q->dirty_tx != tx_q->cur_tx)
-		hrtimer_start(&tx_q->txtimer,
-			      STMMAC_COAL_TIMER(priv->tx_coal_timer[queue]),
-			      HRTIMER_MODE_REL);
+		stmmac_tx_timer_arm(priv, queue);
 
 	flags = u64_stats_update_begin_irqsave(&tx_q->txq_stats.syncp);
 	tx_q->txq_stats.tx_packets += tx_packets;
@@ -2995,9 +2993,13 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 static void stmmac_tx_timer_arm(struct stmmac_priv *priv, u32 queue)
 {
 	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
+	u32 tx_coal_timer = priv->tx_coal_timer[queue];
+
+	if (!tx_coal_timer)
+		return;
 
 	hrtimer_start(&tx_q->txtimer,
-		      STMMAC_COAL_TIMER(priv->tx_coal_timer[queue]),
+		      STMMAC_COAL_TIMER(tx_coal_timer),
 		      HRTIMER_MODE_REL);
 }
 

---
base-commit: 35494b0d61e44b517178aa1c6f5a69168b086940
change-id: 20230904-stmmac-coaloff-aca6befbd24b

Best regards,
-- 
Vincent Whitchurch <vincent.whitchurch@axis.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
