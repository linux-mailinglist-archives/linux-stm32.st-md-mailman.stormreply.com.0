Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF0283EADE
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Jan 2024 05:05:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BE31C6DD70;
	Sat, 27 Jan 2024 04:05:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41C5CC6DD6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Jan 2024 04:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706328308; x=1737864308;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eCcylmKuGhzpjVUqVE5u3nCimW0l3ydQAg3Bgrb9n4U=;
 b=eig9PUYVFdF5WSHTTCCa9EHKFgtRDBKcru9eLlR6/shweepF8hMJ+KBq
 1Jsk/8kLRVMxsVUJBJcZ+DydmkoO/QqrqxOLpQq7hwzvzCERaA+aIx7iY
 dVooGeuBrOplyzBubr/yOrd6F1h5qvgsZ+AT10LU5JrKsLyciqxZY5dNB
 gFzGf1mWXN4TjXoY5B2iMLzgyPLwZcV6MZm9L6TcqaN/4/W0YPPXt5omS
 2K5mrU/2GwmnVa2wrWICXS/XXp0SHhJ5XonnTHur2WdNMQbQho5EqnCEk
 L64o4ucUg3hUnaC33ra596EJxPs71mvGReueu53s9kaQ/iyRP7oyrrrGJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="402289665"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="402289665"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 20:05:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="787309861"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="787309861"
Received: from ppglcf2090.png.intel.com ([10.126.160.96])
 by orsmga002.jf.intel.com with ESMTP; 26 Jan 2024 20:05:00 -0800
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>
Date: Sat, 27 Jan 2024 12:04:42 +0800
Message-Id: <20240127040443.24835-3-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20240127040443.24835-1-rohan.g.thomas@intel.com>
References: <20240127040443.24835-1-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, bpf@vger.kernel.org,
 Rohan G Thomas <rohan.g.thomas@intel.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/3] net: stmmac: est: Per Tx-queue
	error count for HLBF
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

Keep per Tx-queue error count on Head-Of-Line Blocking due to frame
size(HLBF) error. The MAC raises HLBF error on one or more queues
when none of the time Intervals of open-gates in the GCL is greater
than or equal to the duration needed for frame transmission and by
default drops those packets that causes HLBF error. EST_FRM_SZ_ERR
register provides the One Hot encoded Queue numbers that have the
Frame Size related error.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h     | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index d8d2a90fd228..70bef7811c91 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -203,6 +203,7 @@ struct stmmac_extra_stats {
 	unsigned long mtl_est_btre;
 	unsigned long mtl_est_btrlm;
 	unsigned long max_sdu_txq_drop[MTL_MAX_TX_QUEUES];
+	unsigned long mtl_est_txq_hlbf[MTL_MAX_TX_QUEUES];
 	/* per queue statistics */
 	struct stmmac_txq_stats txq_stats[MTL_MAX_TX_QUEUES];
 	struct stmmac_rxq_stats rxq_stats[MTL_MAX_RX_QUEUES];
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
index 4da6ccc17c20..c9693f77e1f6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
@@ -81,6 +81,7 @@ static void est_irq_status(struct stmmac_priv *priv, struct net_device *dev,
 	u32 status, value, feqn, hbfq, hbfs, btrl, btrl_max;
 	void __iomem *est_addr = priv->estaddr;
 	u32 txqcnt_mask = BIT(txqcnt) - 1;
+	int i;
 
 	status = readl(est_addr + EST_STATUS);
 
@@ -125,6 +126,11 @@ static void est_irq_status(struct stmmac_priv *priv, struct net_device *dev,
 
 		x->mtl_est_hlbf++;
 
+		for (i = 0; i < txqcnt; i++) {
+			if (feqn & BIT(i))
+				x->mtl_est_txq_hlbf[i]++;
+		}
+
 		/* Clear Interrupt */
 		writel(feqn, est_addr + EST_FRM_SZ_ERR);
 
-- 
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
