Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FD47B560D
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Oct 2023 17:10:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBFEEC6B473;
	Mon,  2 Oct 2023 15:10:43 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C1F4C6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Oct 2023 15:10:42 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-405524e6769so19675945e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Oct 2023 08:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696259442; x=1696864242;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/fVynbOzBohHZKj1GYs9v008j2z0A0+UB2/MZYO9c0s=;
 b=iM4di/EqUwk8ZYtRf6PAg4RXXkFsfK2TjNJ72OOrhPfORUfA+iJffpR4VvZcHcVuqu
 v/7KxL4Rq1LJjFnB4tzBJcAbg3C1NCFoufHW7ts8o0F1nvJ3VqbMLLcH3p/bdEkBr44Y
 xUSmZZmuc65DrbIYImM4kmLBlUhn6ZMMDEfvgJLdYd0dE3KlIXzG34Sxt3cku8c/p2SY
 OyLMF0o6T9lMGOVQanxS5e+uGJH4tv5vPXocvSa/7izz3b+WgVP9B7opJ1tnN9L6/FCw
 nMsKC8cneN6O0ZvGGpPaPqjgNOBfGGLh7FbTA0P32pGMGlp67DVpJG3xa+Ai3Uhd9qKB
 93Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696259442; x=1696864242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/fVynbOzBohHZKj1GYs9v008j2z0A0+UB2/MZYO9c0s=;
 b=kPMoTjCLvQ3c7eti5/TR0Bce4YnRJPzeRScuSJK/e3InhdGjCDhQEaA4d49SO8o+G2
 L3xurFpmaD6aQDeql6MOokRKo3MN6wPJwa1Crgfik3ueO3sZerctxSOLulv2ReQQKklg
 ax8dNMZUErxiDD6bYfTpenAVc4vv06CYCRS3rMsFpUzQSPcJqXac49w77vXYH4AUuv3s
 EqibhIuwBg76OFl+jSNCpUJAI9YKgVXL21YhIMrVl4GFpBELvOH0qntmsP+rTDBKkMBC
 mey4CVOokIJ/z0JrZJqmgXx4A2zVa6ZQdb/IEaDUa5bTUyo4arlSojZ+ucAkd+4hfk9o
 kFwg==
X-Gm-Message-State: AOJu0YzzX1fOnYQp0P72kL7FeB8dmKdzrcGLrNo4RWv5od+qjJbhQTmD
 467XY9LFvEp8q/wjbPNj8s4=
X-Google-Smtp-Source: AGHT+IEbVm27m3yyj+qauVKuGTcsYWZBzlhqJNwaZssJ91Yjfee5eUCceIVYQTXt7bTb36+JWQgvcA==
X-Received: by 2002:a05:600c:ca:b0:3fb:c075:b308 with SMTP id
 u10-20020a05600c00ca00b003fbc075b308mr10043240wmm.12.1696259441710; 
 Mon, 02 Oct 2023 08:10:41 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 t15-20020a1c770f000000b00406408dc788sm7421565wmi.44.2023.10.02.08.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 08:10:41 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Chris Snook <chris.snook@gmail.com>,
 Raju Rangoju <rajur@chelsio.com>, Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>,
 Douglas Miller <dougmill@linux.ibm.com>,
 Nick Child <nnac123@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Haren Myneni <haren@linux.ibm.com>, Rick Lindsley <ricklind@linux.ibm.com>,
 Dany Madden <danymadden@us.ibm.com>,
 Thomas Falcon <tlfalcon@linux.ibm.com>, Tariq Toukan <tariqt@nvidia.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Halasa <khalasa@piap.pl>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Gregory Greenman <gregory.greenman@intel.com>,
 Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
 Intel Corporation <linuxwwan@intel.com>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
 Liu Haijun <haijun.liu@mediatek.com>,
 M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
 Ricardo Martinez <ricardo.martinez@linux.intel.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Yuanjun Gong <ruc_gongyuanjun@163.com>, Wei Fang <wei.fang@nxp.com>,
 Alex Elder <elder@linaro.org>, Simon Horman <horms@kernel.org>,
 Rob Herring <robh@kernel.org>, Bailey Forrest <bcf@google.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Junfeng Guo <junfeng.guo@intel.com>, Ziwei Xiao <ziweixiao@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Rushil Gupta <rushilg@google.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Yuri Karpov <YKarpov@ispras.ru>, Zhengchao Shao <shaozhengchao@huawei.com>,
 Andrew Lunn <andrew@lunn.ch>, Zheng Zengkai <zhengzengkai@huawei.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Lee Jones <lee@kernel.org>, Dawei Li <set_pte_at@outlook.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Benjamin Berg <benjamin.berg@intel.com>,
 Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-can@vger.kernel.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Date: Mon,  2 Oct 2023 17:10:22 +0200
Message-Id: <20231002151023.4054-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231002151023.4054-1-ansuelsmth@gmail.com>
References: <20231002151023.4054-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Subject: [Linux-stm32] [net-next PATCH 3/4] netdev: replace napi_reschedule
	with napi_schedule
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

Now that napi_schedule return a bool, we can drop napi_reschedule that
does the same exact function. The function comes from a very old commit
bfe13f54f502 ("ibm_emac: Convert to use napi_struct independent of struct
net_device") and the purpose is actually deprecated in favour of
different logic.

Convert every user of napi_reschedule to napi_schedule.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/infiniband/ulp/ipoib/ipoib_ib.c                |  4 ++--
 drivers/net/can/dev/rx-offload.c                       |  2 +-
 drivers/net/ethernet/chelsio/cxgb4/sge.c               |  2 +-
 drivers/net/ethernet/chelsio/cxgb4vf/sge.c             |  2 +-
 drivers/net/ethernet/ezchip/nps_enet.c                 |  2 +-
 drivers/net/ethernet/google/gve/gve_main.c             |  2 +-
 drivers/net/ethernet/ibm/ehea/ehea_main.c              |  2 +-
 drivers/net/ethernet/ibm/emac/mal.c                    |  2 +-
 drivers/net/ethernet/ibm/ibmveth.c                     |  2 +-
 drivers/net/ethernet/ibm/ibmvnic.c                     |  2 +-
 drivers/net/ethernet/mellanox/mlx4/en_rx.c             |  2 +-
 drivers/net/ethernet/ni/nixge.c                        |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c |  2 +-
 drivers/net/ethernet/xscale/ixp4xx_eth.c               |  4 ++--
 drivers/net/fjes/fjes_main.c                           |  2 +-
 drivers/net/wan/ixp4xx_hss.c                           |  4 ++--
 drivers/net/wireless/ath/ath10k/pci.c                  |  2 +-
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c             |  2 +-
 include/linux/netdevice.h                              | 10 ----------
 19 files changed, 21 insertions(+), 31 deletions(-)

diff --git a/drivers/infiniband/ulp/ipoib/ipoib_ib.c b/drivers/infiniband/ulp/ipoib/ipoib_ib.c
index ed25061fac62..7f84d9866cef 100644
--- a/drivers/infiniband/ulp/ipoib/ipoib_ib.c
+++ b/drivers/infiniband/ulp/ipoib/ipoib_ib.c
@@ -488,7 +488,7 @@ int ipoib_rx_poll(struct napi_struct *napi, int budget)
 		if (unlikely(ib_req_notify_cq(priv->recv_cq,
 					      IB_CQ_NEXT_COMP |
 					      IB_CQ_REPORT_MISSED_EVENTS)) &&
-		    napi_reschedule(napi))
+		    napi_schedule(napi))
 			goto poll_more;
 	}
 
@@ -518,7 +518,7 @@ int ipoib_tx_poll(struct napi_struct *napi, int budget)
 		napi_complete(napi);
 		if (unlikely(ib_req_notify_cq(priv->send_cq, IB_CQ_NEXT_COMP |
 					      IB_CQ_REPORT_MISSED_EVENTS)) &&
-		    napi_reschedule(napi))
+		    napi_schedule(napi))
 			goto poll_more;
 	}
 	return n < 0 ? 0 : n;
diff --git a/drivers/net/can/dev/rx-offload.c b/drivers/net/can/dev/rx-offload.c
index 77091f7d1fa7..46e7b6db4a1e 100644
--- a/drivers/net/can/dev/rx-offload.c
+++ b/drivers/net/can/dev/rx-offload.c
@@ -67,7 +67,7 @@ static int can_rx_offload_napi_poll(struct napi_struct *napi, int quota)
 
 		/* Check if there was another interrupt */
 		if (!skb_queue_empty(&offload->skb_queue))
-			napi_reschedule(&offload->napi);
+			napi_schedule(&offload->napi);
 	}
 
 	return work_done;
diff --git a/drivers/net/ethernet/chelsio/cxgb4/sge.c b/drivers/net/ethernet/chelsio/cxgb4/sge.c
index 98dd78551d89..b5ff2e1a9975 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/sge.c
@@ -4261,7 +4261,7 @@ static void sge_rx_timer_cb(struct timer_list *t)
 
 			if (fl_starving(adap, fl)) {
 				rxq = container_of(fl, struct sge_eth_rxq, fl);
-				if (napi_reschedule(&rxq->rspq.napi))
+				if (napi_schedule(&rxq->rspq.napi))
 					fl->starving++;
 				else
 					set_bit(id, s->starving_fl);
diff --git a/drivers/net/ethernet/chelsio/cxgb4vf/sge.c b/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
index 2d0cf76fb3c5..5b1d746e6563 100644
--- a/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
@@ -2094,7 +2094,7 @@ static void sge_rx_timer_cb(struct timer_list *t)
 				struct sge_eth_rxq *rxq;
 
 				rxq = container_of(fl, struct sge_eth_rxq, fl);
-				if (napi_reschedule(&rxq->rspq.napi))
+				if (napi_schedule(&rxq->rspq.napi))
 					fl->starving++;
 				else
 					set_bit(id, s->starving_fl);
diff --git a/drivers/net/ethernet/ezchip/nps_enet.c b/drivers/net/ethernet/ezchip/nps_enet.c
index edf000e7bab4..4d7184d46824 100644
--- a/drivers/net/ethernet/ezchip/nps_enet.c
+++ b/drivers/net/ethernet/ezchip/nps_enet.c
@@ -198,7 +198,7 @@ static int nps_enet_poll(struct napi_struct *napi, int budget)
 		 */
 		if (nps_enet_is_tx_pending(priv)) {
 			nps_enet_reg_set(priv, NPS_ENET_REG_BUF_INT_ENABLE, 0);
-			napi_reschedule(napi);
+			napi_schedule(napi);
 		}
 	}
 
diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
index 83b09dcfafc4..276f996f95dc 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -281,7 +281,7 @@ static int gve_napi_poll(struct napi_struct *napi, int budget)
 		if (block->rx)
 			reschedule |= gve_rx_work_pending(block->rx);
 
-		if (reschedule && napi_reschedule(napi))
+		if (reschedule && napi_schedule(napi))
 			iowrite32be(GVE_IRQ_MASK, irq_doorbell);
 	}
 	return work_done;
diff --git a/drivers/net/ethernet/ibm/ehea/ehea_main.c b/drivers/net/ethernet/ibm/ehea/ehea_main.c
index 251dedd55cfb..1e29e5c9a2df 100644
--- a/drivers/net/ethernet/ibm/ehea/ehea_main.c
+++ b/drivers/net/ethernet/ibm/ehea/ehea_main.c
@@ -900,7 +900,7 @@ static int ehea_poll(struct napi_struct *napi, int budget)
 		if (!cqe && !cqe_skb)
 			return rx;
 
-		if (!napi_reschedule(napi))
+		if (!napi_schedule(napi))
 			return rx;
 
 		cqe_skb = ehea_proc_cqes(pr, EHEA_POLL_MAX_CQES);
diff --git a/drivers/net/ethernet/ibm/emac/mal.c b/drivers/net/ethernet/ibm/emac/mal.c
index 462646d1b817..2439f7e96e05 100644
--- a/drivers/net/ethernet/ibm/emac/mal.c
+++ b/drivers/net/ethernet/ibm/emac/mal.c
@@ -442,7 +442,7 @@ static int mal_poll(struct napi_struct *napi, int budget)
 		if (unlikely(mc->ops->peek_rx(mc->dev) ||
 			     test_bit(MAL_COMMAC_RX_STOPPED, &mc->flags))) {
 			MAL_DBG2(mal, "rotting packet" NL);
-			if (!napi_reschedule(napi))
+			if (!napi_schedule(napi))
 				goto more_work;
 
 			spin_lock_irqsave(&mal->lock, flags);
diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
index 832a2ae01950..9490272c0421 100644
--- a/drivers/net/ethernet/ibm/ibmveth.c
+++ b/drivers/net/ethernet/ibm/ibmveth.c
@@ -1433,7 +1433,7 @@ static int ibmveth_poll(struct napi_struct *napi, int budget)
 		BUG_ON(lpar_rc != H_SUCCESS);
 
 		if (ibmveth_rxq_pending_buffer(adapter) &&
-		    napi_reschedule(napi)) {
+		    napi_schedule(napi)) {
 			lpar_rc = h_vio_signal(adapter->vdev->unit_address,
 					       VIO_IRQ_DISABLE);
 		}
diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index cdf5251e5679..2094f413cbe4 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -3519,7 +3519,7 @@ static int ibmvnic_poll(struct napi_struct *napi, int budget)
 		if (napi_complete_done(napi, frames_processed)) {
 			enable_scrq_irq(adapter, rx_scrq);
 			if (pending_scrq(adapter, rx_scrq)) {
-				if (napi_reschedule(napi)) {
+				if (napi_schedule(napi)) {
 					disable_scrq_irq(adapter, rx_scrq);
 					goto restart_poll;
 				}
diff --git a/drivers/net/ethernet/mellanox/mlx4/en_rx.c b/drivers/net/ethernet/mellanox/mlx4/en_rx.c
index 332472fe4990..a09b6e05337d 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_rx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_rx.c
@@ -400,7 +400,7 @@ void mlx4_en_recover_from_oom(struct mlx4_en_priv *priv)
 	for (ring = 0; ring < priv->rx_ring_num; ring++) {
 		if (mlx4_en_is_ring_empty(priv->rx_ring[ring])) {
 			local_bh_disable();
-			napi_reschedule(&priv->rx_cq[ring]->napi);
+			napi_schedule(&priv->rx_cq[ring]->napi);
 			local_bh_enable();
 		}
 	}
diff --git a/drivers/net/ethernet/ni/nixge.c b/drivers/net/ethernet/ni/nixge.c
index f71a4f8bbb89..fa1f78b03cb2 100644
--- a/drivers/net/ethernet/ni/nixge.c
+++ b/drivers/net/ethernet/ni/nixge.c
@@ -683,7 +683,7 @@ static int nixge_poll(struct napi_struct *napi, int budget)
 		if (status & (XAXIDMA_IRQ_IOC_MASK | XAXIDMA_IRQ_DELAY_MASK)) {
 			/* If there's more, reschedule, but clear */
 			nixge_dma_write_reg(priv, XAXIDMA_RX_SR_OFFSET, status);
-			napi_reschedule(napi);
+			napi_schedule(napi);
 		} else {
 			/* if not, turn on RX IRQs again ... */
 			cr = nixge_dma_read_reg(priv, XAXIDMA_RX_CR_OFFSET);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index f9e43fc32ee8..3ca1c2a816ff 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -802,7 +802,7 @@ static int stmmac_test_flowctrl(struct stmmac_priv *priv)
 		stmmac_start_rx(priv, priv->ioaddr, i);
 
 		local_bh_disable();
-		napi_reschedule(&ch->rx_napi);
+		napi_schedule(&ch->rx_napi);
 		local_bh_enable();
 	}
 
diff --git a/drivers/net/ethernet/xscale/ixp4xx_eth.c b/drivers/net/ethernet/xscale/ixp4xx_eth.c
index b242aa61d8ab..64dea4ad2ad3 100644
--- a/drivers/net/ethernet/xscale/ixp4xx_eth.c
+++ b/drivers/net/ethernet/xscale/ixp4xx_eth.c
@@ -714,9 +714,9 @@ static int eth_poll(struct napi_struct *napi, int budget)
 			napi_complete(napi);
 			qmgr_enable_irq(rxq);
 			if (!qmgr_stat_below_low_watermark(rxq) &&
-			    napi_reschedule(napi)) { /* not empty again */
+			    napi_schedule(napi)) { /* not empty again */
 #if DEBUG_RX
-				netdev_debug(dev, "eth_poll napi_reschedule succeeded\n");
+				netdev_debug(dev, "eth_poll napi_schedule succeeded\n");
 #endif
 				qmgr_disable_irq(rxq);
 				continue;
diff --git a/drivers/net/fjes/fjes_main.c b/drivers/net/fjes/fjes_main.c
index 2513be6d4e11..cd8cf08477ec 100644
--- a/drivers/net/fjes/fjes_main.c
+++ b/drivers/net/fjes/fjes_main.c
@@ -1030,7 +1030,7 @@ static int fjes_poll(struct napi_struct *napi, int budget)
 		}
 
 		if (((long)jiffies - (long)adapter->rx_last_jiffies) < 3) {
-			napi_reschedule(napi);
+			napi_schedule(napi);
 		} else {
 			spin_lock(&hw->rx_status_lock);
 			for (epidx = 0; epidx < hw->max_epid; epidx++) {
diff --git a/drivers/net/wan/ixp4xx_hss.c b/drivers/net/wan/ixp4xx_hss.c
index e46b7f5ee49e..b09f4c235142 100644
--- a/drivers/net/wan/ixp4xx_hss.c
+++ b/drivers/net/wan/ixp4xx_hss.c
@@ -687,10 +687,10 @@ static int hss_hdlc_poll(struct napi_struct *napi, int budget)
 			napi_complete(napi);
 			qmgr_enable_irq(rxq);
 			if (!qmgr_stat_empty(rxq) &&
-			    napi_reschedule(napi)) {
+			    napi_schedule(napi)) {
 #if DEBUG_RX
 				printk(KERN_DEBUG "%s: hss_hdlc_poll"
-				       " napi_reschedule succeeded\n",
+				       " napi_schedule succeeded\n",
 				       dev->name);
 #endif
 				qmgr_disable_irq(rxq);
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 23f366221939..2f8c785277af 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3148,7 +3148,7 @@ static int ath10k_pci_napi_poll(struct napi_struct *ctx, int budget)
 		 * immediate servicing.
 		 */
 		if (ath10k_ce_interrupt_summary(ar)) {
-			napi_reschedule(ctx);
+			napi_schedule(ctx);
 			goto out;
 		}
 		ath10k_pci_enable_legacy_irq(ar);
diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
index f4ff2198b5ef..210d84c67ef9 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
@@ -852,7 +852,7 @@ int t7xx_dpmaif_napi_rx_poll(struct napi_struct *napi, const int budget)
 	if (!ret) {
 		napi_complete_done(napi, work_done);
 		rxq->sleep_lock_pending = true;
-		napi_reschedule(napi);
+		napi_schedule(napi);
 		return work_done;
 	}
 
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 2bead8e2a14d..bbf9038f2afd 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -516,16 +516,6 @@ static inline void napi_schedule_irqoff(struct napi_struct *n)
 		__napi_schedule_irqoff(n);
 }
 
-/* Try to reschedule poll. Called by dev->poll() after napi_complete().  */
-static inline bool napi_reschedule(struct napi_struct *napi)
-{
-	if (napi_schedule_prep(napi)) {
-		__napi_schedule(napi);
-		return true;
-	}
-	return false;
-}
-
 /**
  * napi_complete_done - NAPI processing complete
  * @n: NAPI context
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
