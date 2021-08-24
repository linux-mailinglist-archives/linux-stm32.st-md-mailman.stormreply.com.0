Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C381A3F6230
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Aug 2021 18:05:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51AA4C57B60;
	Tue, 24 Aug 2021 16:05:07 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2AF0C57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Aug 2021 16:05:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="217346363"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; d="scan'208";a="217346363"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 09:03:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; d="scan'208";a="493592392"
Received: from siang-ilbpg0.png.intel.com ([10.88.227.28])
 by fmsmga008.fm.intel.com with ESMTP; 24 Aug 2021 09:03:06 -0700
From: Song Yoong Siang <yoong.siang.song@intel.com>
To: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>
Date: Tue, 24 Aug 2021 23:56:12 +0800
Message-Id: <20210824155612.978529-1-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Song Yoong Siang <yoong.siang.song@intel.com>, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/1] net: stmmac: fix kernel panic due to
	NULL pointer dereference of xsk_pool
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

After free xsk_pool, there is possibility that napi polling is still
running in the middle, thus causes a kernel crash due to kernel NULL
pointer dereference of rx_q->xsk_pool and tx_q->xsk_pool.

Fix this by changing the XDP pool setup sequence to:
 1. disable napi before free xsk_pool
 2. enable napi after init xsk_pool

The following kernel panic is observed without this patch:

RIP: 0010:xsk_uses_need_wakeup+0x5/0x10
Call Trace:
stmmac_napi_poll_rxtx+0x3a9/0xae0 [stmmac]
__napi_poll+0x27/0x130
net_rx_action+0x233/0x280
__do_softirq+0xe2/0x2b6
run_ksoftirqd+0x1a/0x20
smpboot_thread_fn+0xac/0x140
? sort_range+0x20/0x20
kthread+0x124/0x150
? set_kthread_struct+0x40/0x40
ret_from_fork+0x1f/0x30
---[ end trace a77c8956b79ac107 ]---

Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Cc: <stable@vger.kernel.org> # 5.13.x
Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
index 105821b53020..2a616c6f7cd0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
@@ -34,18 +34,18 @@ static int stmmac_xdp_enable_pool(struct stmmac_priv *priv,
 	need_update = netif_running(priv->dev) && stmmac_xdp_is_enabled(priv);
 
 	if (need_update) {
-		stmmac_disable_rx_queue(priv, queue);
-		stmmac_disable_tx_queue(priv, queue);
 		napi_disable(&ch->rx_napi);
 		napi_disable(&ch->tx_napi);
+		stmmac_disable_rx_queue(priv, queue);
+		stmmac_disable_tx_queue(priv, queue);
 	}
 
 	set_bit(queue, priv->af_xdp_zc_qps);
 
 	if (need_update) {
-		napi_enable(&ch->rxtx_napi);
 		stmmac_enable_rx_queue(priv, queue);
 		stmmac_enable_tx_queue(priv, queue);
+		napi_enable(&ch->rxtx_napi);
 
 		err = stmmac_xsk_wakeup(priv->dev, queue, XDP_WAKEUP_RX);
 		if (err)
@@ -72,10 +72,10 @@ static int stmmac_xdp_disable_pool(struct stmmac_priv *priv, u16 queue)
 	need_update = netif_running(priv->dev) && stmmac_xdp_is_enabled(priv);
 
 	if (need_update) {
+		napi_disable(&ch->rxtx_napi);
 		stmmac_disable_rx_queue(priv, queue);
 		stmmac_disable_tx_queue(priv, queue);
 		synchronize_rcu();
-		napi_disable(&ch->rxtx_napi);
 	}
 
 	xsk_pool_dma_unmap(pool, STMMAC_RX_DMA_ATTR);
@@ -83,10 +83,10 @@ static int stmmac_xdp_disable_pool(struct stmmac_priv *priv, u16 queue)
 	clear_bit(queue, priv->af_xdp_zc_qps);
 
 	if (need_update) {
-		napi_enable(&ch->rx_napi);
-		napi_enable(&ch->tx_napi);
 		stmmac_enable_rx_queue(priv, queue);
 		stmmac_enable_tx_queue(priv, queue);
+		napi_enable(&ch->rx_napi);
+		napi_enable(&ch->tx_napi);
 	}
 
 	return 0;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
