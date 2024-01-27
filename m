Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D5883EADF
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Jan 2024 05:05:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DEB6C6DD70;
	Sat, 27 Jan 2024 04:05:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B47FCC6DD6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Jan 2024 04:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706328313; x=1737864313;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=arnNZFPeOWnn8Q5oQ59hKd7A7dEFpKto5u5vQcBQRZw=;
 b=UweUYZW4a8vix7R4ZpV8BwbBeByhmxWa6KOFQbUAlluEy+7WbFCx9zwO
 Fg4n6ggUR7d+wCxCJ39bBXiHRAhNb7ShnkLLNz1fFo08eveZ39n5NXYmd
 oWKCFvD72eYTMp13u+n9ATdEn78D5I5ntzbOMimNqHrQZvaEx7X2RxqY9
 0mOu5VdkXEtd20UagexzeWafbst0aPRFJfwtFDJcu5z/9NZ8RK7yOJAK0
 U9XJTupWcoq60+/xkAj90pXbMdqdQiB0Ca9drzwoAZ0JsszBx634Uq2Kk
 icWSPRz1V6h6P5NRx7QMRvlcEjmwEsScX15j6pIPSUMmqIYAysjE4iOa4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="402289700"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="402289700"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 20:05:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="787309871"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="787309871"
Received: from ppglcf2090.png.intel.com ([10.126.160.96])
 by orsmga002.jf.intel.com with ESMTP; 26 Jan 2024 20:05:07 -0800
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
Date: Sat, 27 Jan 2024 12:04:43 +0800
Message-Id: <20240127040443.24835-4-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20240127040443.24835-1-rohan.g.thomas@intel.com>
References: <20240127040443.24835-1-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, bpf@vger.kernel.org,
 Rohan G Thomas <rohan.g.thomas@intel.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: Report taprio
	offload status
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

Report taprio offload status. This includes per txq and global
counters of window_drops and tx_overruns.

Window_drops count include count of frames dropped because of
queueMaxSDU setting and HLBF error. Transmission overrun counter
inform the user application whether any packets are currently being
transmitted on a particular queue during a gate-close event.DWMAC IPs
takes care Transmission overrun won't happen hence this is always 0.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 62 +++++++++++++++++--
 1 file changed, 58 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 07aa3a3089dc..cce00719937d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -937,8 +937,8 @@ static void tc_taprio_map_maxsdu_txq(struct stmmac_priv *priv,
 	}
 }
 
-static int tc_setup_taprio(struct stmmac_priv *priv,
-			   struct tc_taprio_qopt_offload *qopt)
+static int tc_taprio_configure(struct stmmac_priv *priv,
+			       struct tc_taprio_qopt_offload *qopt)
 {
 	u32 size, wid = priv->dma_cap.estwid, dep = priv->dma_cap.estdep;
 	struct plat_stmmacenet_data *plat = priv->plat;
@@ -990,8 +990,6 @@ static int tc_setup_taprio(struct stmmac_priv *priv,
 
 	if (qopt->cmd == TAPRIO_CMD_DESTROY)
 		goto disable;
-	else if (qopt->cmd != TAPRIO_CMD_REPLACE)
-		return -EOPNOTSUPP;
 
 	if (qopt->num_entries >= dep)
 		return -EINVAL;
@@ -1102,6 +1100,11 @@ static int tc_setup_taprio(struct stmmac_priv *priv,
 		priv->plat->est->enable = false;
 		stmmac_est_configure(priv, priv, priv->plat->est,
 				     priv->plat->clk_ptp_rate);
+		/* Reset taprio status */
+		for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
+			priv->xstats.max_sdu_txq_drop[i] = 0;
+			priv->xstats.mtl_est_txq_hlbf[i] = 0;
+		}
 		mutex_unlock(&priv->plat->est->lock);
 	}
 
@@ -1119,6 +1122,57 @@ static int tc_setup_taprio(struct stmmac_priv *priv,
 	return ret;
 }
 
+static void tc_taprio_stats(struct stmmac_priv *priv,
+			    struct tc_taprio_qopt_offload *qopt)
+{
+	u64 window_drops = 0;
+	int i = 0;
+
+	for (i = 0; i < priv->plat->tx_queues_to_use; i++)
+		window_drops += priv->xstats.max_sdu_txq_drop[i] +
+				priv->xstats.mtl_est_txq_hlbf[i];
+	qopt->stats.window_drops = window_drops;
+
+	/* Transmission overrun doesn't happen for stmmac, hence always 0 */
+	qopt->stats.tx_overruns = 0;
+}
+
+static void tc_taprio_queue_stats(struct stmmac_priv *priv,
+				  struct tc_taprio_qopt_offload *qopt)
+{
+	struct tc_taprio_qopt_queue_stats *q_stats = &qopt->queue_stats;
+	int queue = qopt->queue_stats.queue;
+
+	q_stats->stats.window_drops = priv->xstats.max_sdu_txq_drop[queue] +
+				      priv->xstats.mtl_est_txq_hlbf[queue];
+
+	/* Transmission overrun doesn't happen for stmmac, hence always 0 */
+	q_stats->stats.tx_overruns = 0;
+}
+
+static int tc_setup_taprio(struct stmmac_priv *priv,
+			   struct tc_taprio_qopt_offload *qopt)
+{
+	int err = 0;
+
+	switch (qopt->cmd) {
+	case TAPRIO_CMD_REPLACE:
+	case TAPRIO_CMD_DESTROY:
+		err = tc_taprio_configure(priv, qopt);
+		break;
+	case TAPRIO_CMD_STATS:
+		tc_taprio_stats(priv, qopt);
+		break;
+	case TAPRIO_CMD_QUEUE_STATS:
+		tc_taprio_queue_stats(priv, qopt);
+		break;
+	default:
+		err = -EOPNOTSUPP;
+	}
+
+	return err;
+}
+
 static int tc_setup_etf(struct stmmac_priv *priv,
 			struct tc_etf_qopt_offload *qopt)
 {
-- 
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
