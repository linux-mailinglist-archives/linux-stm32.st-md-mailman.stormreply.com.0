Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2C4350390
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Mar 2021 17:37:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A7BBC57B5B;
	Wed, 31 Mar 2021 15:37:36 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34E3DC5662E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 15:37:34 +0000 (UTC)
IronPort-SDR: GV1HqGd7zlKk7ztoU8nAv15HmOYCa8TrCS4t2GAOHBKZ4d2VXMdJz55WS80K+bt9AilX0VD4el
 0L+hqA7WDaQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="188773891"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="188773891"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 08:37:31 -0700
IronPort-SDR: f+UNYbwVpv1LZThj+euRf0Q2IXnXTA69W7mGnsSyEcnKUFSelpJWH4Tchcn2b8VckpNVG/uL0K
 bFpvbttAwkSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="418729057"
Received: from glass.png.intel.com ([10.158.65.59])
 by orsmga008.jf.intel.com with ESMTP; 31 Mar 2021 08:37:26 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>
Date: Wed, 31 Mar 2021 23:41:30 +0800
Message-Id: <20210331154135.8507-2-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210331154135.8507-1-boon.leong.ong@intel.com>
References: <20210331154135.8507-1-boon.leong.ong@intel.com>
MIME-Version: 1.0
Cc: Song Liu <songliubraving@fb.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 KP Singh <kpsingh@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Yonghong Song <yhs@fb.com>,
 bpf@vger.kernel.org, Martin KaFai Lau <kafai@fb.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 1/6] net: stmmac: set IRQ affinity
	hint for multi MSI vectors
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

Certain platform likes Intel mGBE has independent hardware IRQ resources
for TX and RX DMA operation. In preparation to support XDP TX, we add IRQ
affinity hint to group both RX and TX queue of the same queue ID to the
same CPU.

Changes in v2:
 - IRQ affinity hint need to set to null before IRQ is released.
   Thanks to issue reported by Song, Yoong Siang.

Reported-by: Song, Yoong Siang <yoong.siang.song@intel.com>
Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d34388b1ffcc..9d63e8c365ae 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3005,15 +3005,19 @@ static void stmmac_free_irq(struct net_device *dev,
 		fallthrough;
 	case REQ_IRQ_ERR_TX:
 		for (j = irq_idx - 1; j >= 0; j--) {
-			if (priv->tx_irq[j] > 0)
+			if (priv->tx_irq[j] > 0) {
+				irq_set_affinity_hint(priv->tx_irq[j], NULL);
 				free_irq(priv->tx_irq[j], &priv->tx_queue[j]);
+			}
 		}
 		irq_idx = priv->plat->rx_queues_to_use;
 		fallthrough;
 	case REQ_IRQ_ERR_RX:
 		for (j = irq_idx - 1; j >= 0; j--) {
-			if (priv->rx_irq[j] > 0)
+			if (priv->rx_irq[j] > 0) {
+				irq_set_affinity_hint(priv->rx_irq[j], NULL);
 				free_irq(priv->rx_irq[j], &priv->rx_queue[j]);
+			}
 		}
 
 		if (priv->sfty_ue_irq > 0 && priv->sfty_ue_irq != dev->irq)
@@ -3045,6 +3049,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 {
 	enum request_irq_err irq_err = REQ_IRQ_ERR_NO;
 	struct stmmac_priv *priv = netdev_priv(dev);
+	cpumask_t cpu_mask;
 	int irq_idx = 0;
 	char *int_name;
 	int ret;
@@ -3153,6 +3158,9 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 			irq_idx = i;
 			goto irq_error;
 		}
+		cpumask_clear(&cpu_mask);
+		cpumask_set_cpu(i % num_online_cpus(), &cpu_mask);
+		irq_set_affinity_hint(priv->rx_irq[i], &cpu_mask);
 	}
 
 	/* Request Tx MSI irq */
@@ -3173,6 +3181,9 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 			irq_idx = i;
 			goto irq_error;
 		}
+		cpumask_clear(&cpu_mask);
+		cpumask_set_cpu(i % num_online_cpus(), &cpu_mask);
+		irq_set_affinity_hint(priv->tx_irq[i], &cpu_mask);
 	}
 
 	return 0;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
