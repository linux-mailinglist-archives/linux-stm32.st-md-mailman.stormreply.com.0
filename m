Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1F766AB42
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Jan 2023 13:05:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F1AEC65E55;
	Sat, 14 Jan 2023 12:05:32 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EA5EC03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Jan 2023 12:05:30 +0000 (UTC)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1673697929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZNQUxrexq+SGlCNMDyxm1etQA6NjevWDm17rYmoWxvs=;
 b=yke8jv+LjgkotXSM7PKxqcpHE7qw3XPxnw09flP+XzJBgxC0fTqmZb1q76mm35EbHHBqjz
 2OWsMfxIrxuDvZKMlviaYQwb8TBCEQZgquNdp6fRX4iUaAnufc+omsX6jdtY9WC3M+yVxF
 EhwHjPHl5SW8dLdiIw7zIbwmlqyD0btceCVFfdtd14Bb8AQsp5uWOkneWUshU85wPedLhZ
 4QVoQq4claTUYy6UPeTUsYMGXrjrgqcxV6HxJG/qZcLLXDb0kG+51NS0A+t9+XkO7sjFSc
 QMvf7eiQh+yjZwBktiZ3z6MavUN14L1kYCVXkNTT1nznEznaqjnocHinOE8Cog==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1673697929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZNQUxrexq+SGlCNMDyxm1etQA6NjevWDm17rYmoWxvs=;
 b=+eO09YP07+aMH9J8vYT/wWjcHR0iTrFmLUeVuYmzQzkS+Tlvr/zVCA0+xrbcHPNaqb29qp
 +DoOslFrIAVjssAg==
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Sat, 14 Jan 2023 13:04:37 +0100
Message-Id: <20230114120437.383514-1-kurt@linutronix.de>
MIME-Version: 1.0
Cc: Wong Vee Khee <vee.khee.wong@linux.intel.com>, netdev@vger.kernel.org,
 Kurt Kanzenbach <kurt@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>,
 Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v1] net: stmmac: Fix queue statistics
	reading
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

Correct queue statistics reading. All queue statistics are stored as unsigned
long values. The retrieval for ethtool fetches these values as u64. However, on
some systems the size of the counters are 32 bit. That yields wrong queue
statistic counters e.g., on arm32 systems such as the stm32mp157. Fix it by
using the correct data type.

Tested on Olimex STMP157-OLinuXino-LIME2 by simple running linuxptp for a short
period of time:

Non-patched kernel:
|root@st1:~# ethtool -S eth0 | grep q0
|     q0_tx_pkt_n: 3775276254951 # ???
|     q0_tx_irq_n: 879
|     q0_rx_pkt_n: 1194000908909 # ???
|     q0_rx_irq_n: 278

Patched kernel:
|root@st1:~# ethtool -S eth0 | grep q0
|     q0_tx_pkt_n: 2434
|     q0_tx_irq_n: 1274
|     q0_rx_pkt_n: 1604
|     q0_rx_irq_n: 846

Fixes: 68e9c5dee1cf ("net: stmmac: add ethtool per-queue statistic framework")
Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
Cc: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
Cc: Wong Vee Khee <vee.khee.wong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index f453b0d09366..35c8dd92d369 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -551,16 +551,16 @@ static void stmmac_get_per_qstats(struct stmmac_priv *priv, u64 *data)
 		p = (char *)priv + offsetof(struct stmmac_priv,
 					    xstats.txq_stats[q].tx_pkt_n);
 		for (stat = 0; stat < STMMAC_TXQ_STATS; stat++) {
-			*data++ = (*(u64 *)p);
-			p += sizeof(u64 *);
+			*data++ = (*(unsigned long *)p);
+			p += sizeof(unsigned long);
 		}
 	}
 	for (q = 0; q < rx_cnt; q++) {
 		p = (char *)priv + offsetof(struct stmmac_priv,
 					    xstats.rxq_stats[q].rx_pkt_n);
 		for (stat = 0; stat < STMMAC_RXQ_STATS; stat++) {
-			*data++ = (*(u64 *)p);
-			p += sizeof(u64 *);
+			*data++ = (*(unsigned long *)p);
+			p += sizeof(unsigned long);
 		}
 	}
 }
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
