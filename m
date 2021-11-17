Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A164F454A89
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Nov 2021 17:07:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56674C5C82A;
	Wed, 17 Nov 2021 16:07:39 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B550C5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Nov 2021 15:30:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10170"; a="232689751"
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="232689751"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 07:29:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="586680506"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Nov 2021 07:29:33 -0800
Received: from alobakin-mobl.ger.corp.intel.com
 (alobakin-mobl.ger.corp.intel.com [10.237.140.117])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 1AHFTWOf004941; Wed, 17 Nov 2021 15:29:32 GMT
From: Alexander Lobakin <alexandr.lobakin@intel.com>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 17 Nov 2021 16:29:17 +0100
Message-Id: <20211117152917.3739-1-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 17 Nov 2021 16:07:38 +0000
Cc: netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Alexander Lobakin <alexandr.lobakin@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] stmmac: fix build due to brainos in
	trans_start changes
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

txq_trans_cond_update() takes netdev_tx_queue *nq,
not nq->trans_start.

Fixes: 5337824f4dc4 ("net: annotate accesses to queue->trans_start")
Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 389d125310c1..41e9d8838f05 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2356,7 +2356,7 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 	bool work_done = true;
 
 	/* Avoids TX time-out as we are sharing with slow path */
-	txq_trans_cond_update(nq->trans_start);
+	txq_trans_cond_update(nq);
 
 	budget = min(budget, stmmac_tx_avail(priv, queue));
 
@@ -4657,7 +4657,7 @@ static int stmmac_xdp_xmit_back(struct stmmac_priv *priv,
 
 	__netif_tx_lock(nq, cpu);
 	/* Avoids TX time-out as we are sharing with slow path */
-	txq_trans_cond_update(nq->trans_start);
+	txq_trans_cond_update(nq);
 
 	res = stmmac_xdp_xmit_xdpf(priv, queue, xdpf, false);
 	if (res == STMMAC_XDP_TX)
-- 
2.33.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
