Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9558259E8
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jan 2024 19:18:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80356C6C83C;
	Fri,  5 Jan 2024 18:18:29 +0000 (UTC)
Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A29C2C6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jan 2024 18:18:28 +0000 (UTC)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id 8FD9A1A7FB3;
 Fri,  5 Jan 2024 19:18:27 +0100 (CET)
Authentication-Results: mail.tesarici.cz;
 dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
 t=1704478707; bh=V6jqxL1/0Rwi+XfoYiFSK5tUjtt5ttIj+0WycUW5aJE=;
 h=From:To:Cc:Subject:Date:From;
 b=VYoSzag7gI/sN1O/jNGFulge62i35RfaYf0k85MDkIsu7eevgsMX92G3xpfGLxf5W
 WBqDr91bVCNUtPKepn5vSPghxoiniLNarw4mH2/yACDxyx0ezS0D1/6p8mPcAUhuIB
 AuGpnkOOo04jW0Bq6xK5PJ7SVO1E819hXcyH9XWNDiXf0VcnW0egOJD8gXIJhni/3J
 IlCjemGuuvv/sAxmgUNG9P0v5hSNdV7oQu0RZiaGwwLVNklrHqJTeToUozgLlXOu/4
 XBrdjURImORfuofX3jMpTLGQEejQ7lbxChRjuOWk8Nmtjuejk8pd0FHbzVVp+yAH3N
 H1RAkBm6CmQYw==
From: Petr Tesarik <petr@tesarici.cz>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER),
 linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32
 ARCHITECTURE), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE), 
 linux-kernel@vger.kernel.org (open list)
Date: Fri,  5 Jan 2024 19:10:24 +0100
Message-ID: <20240105181024.14418-1-petr@tesarici.cz>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Petr Tesarik <petr@tesarici.cz>
Subject: [Linux-stm32] [PATCH] net: stmmac: fix ethtool per-queue statistics
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

Fix per-queue statistics for devices with more than one queue.

The output data pointer is currently reset in each loop iteration,
effectively summing all queue statistics in the first four u64 values.

The summary values are not even labeled correctly. For example, if eth0 has
2 queues, ethtool -S eth0 shows:

     q0_tx_pkt_n: 374 (actually tx_pkt_n over all queues)
     q0_tx_irq_n: 23  (actually tx_normal_irq_n over all queues)
     q1_tx_pkt_n: 462 (actually rx_pkt_n over all queues)
     q1_tx_irq_n: 446 (actually rx_normal_irq_n over all queues)
     q0_rx_pkt_n: 0
     q0_rx_irq_n: 0
     q1_rx_pkt_n: 0
     q1_rx_irq_n: 0

While touching this code, change the pointer type to u64 and get rid of the
weird pointer arithmetic.

Signed-off-by: Petr Tesarik <petr@tesarici.cz>
Fixes: 133466c3bbe1 ("net: stmmac: use per-queue 64 bit statistics where necessary")
---
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 23 ++++++-------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index f628411ae4ae..023876fc4da7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -543,43 +543,34 @@ static void stmmac_get_per_qstats(struct stmmac_priv *priv, u64 *data)
 	u32 rx_cnt = priv->plat->rx_queues_to_use;
 	unsigned int start;
 	int q, stat;
-	u64 *pos;
-	char *p;
+	u64 *p;
 
-	pos = data;
 	for (q = 0; q < tx_cnt; q++) {
 		struct stmmac_txq_stats *txq_stats = &priv->xstats.txq_stats[q];
 		struct stmmac_txq_stats snapshot;
 
-		data = pos;
 		do {
 			start = u64_stats_fetch_begin(&txq_stats->syncp);
 			snapshot = *txq_stats;
 		} while (u64_stats_fetch_retry(&txq_stats->syncp, start));
 
-		p = (char *)&snapshot + offsetof(struct stmmac_txq_stats, tx_pkt_n);
-		for (stat = 0; stat < STMMAC_TXQ_STATS; stat++) {
-			*data++ += (*(u64 *)p);
-			p += sizeof(u64);
-		}
+		p = &snapshot.tx_pkt_n;
+		for (stat = 0; stat < STMMAC_TXQ_STATS; stat++)
+			*data++ = *p++;
 	}
 
-	pos = data;
 	for (q = 0; q < rx_cnt; q++) {
 		struct stmmac_rxq_stats *rxq_stats = &priv->xstats.rxq_stats[q];
 		struct stmmac_rxq_stats snapshot;
 
-		data = pos;
 		do {
 			start = u64_stats_fetch_begin(&rxq_stats->syncp);
 			snapshot = *rxq_stats;
 		} while (u64_stats_fetch_retry(&rxq_stats->syncp, start));
 
-		p = (char *)&snapshot + offsetof(struct stmmac_rxq_stats, rx_pkt_n);
-		for (stat = 0; stat < STMMAC_RXQ_STATS; stat++) {
-			*data++ += (*(u64 *)p);
-			p += sizeof(u64);
-		}
+		p = &snapshot.rx_pkt_n;
+		for (stat = 0; stat < STMMAC_RXQ_STATS; stat++)
+			*data++ = *p++;
 	}
 }
 
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
