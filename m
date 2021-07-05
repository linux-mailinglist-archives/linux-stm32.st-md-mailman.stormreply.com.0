Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BE23BBAF9
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Jul 2021 12:16:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A99EAC57B5F;
	Mon,  5 Jul 2021 10:16:19 +0000 (UTC)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CA0BC57B5B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jul 2021 10:16:15 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4C0381A04B3;
 Mon,  5 Jul 2021 12:16:15 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1043D1A16BD;
 Mon,  5 Jul 2021 12:16:15 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id
 DB0A7183AC98; Mon,  5 Jul 2021 18:16:12 +0800 (+08)
From: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
To: davem@davemloft.net, joabreu@synopsys.com, kuba@kernel.org,
 alexandre.torgue@st.com, peppe.cavallaro@st.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org
Date: Mon,  5 Jul 2021 18:26:54 +0800
Message-Id: <20210705102655.6280-3-xiaoliang.yang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210705102655.6280-1-xiaoliang.yang_1@nxp.com>
References: <20210705102655.6280-1-xiaoliang.yang_1@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: qiangqing.zhang@nxp.com, weifeng.voon@intel.com, vee.khee.wong@intel.com,
 xiaoliang.yang_1@nxp.com, linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
 mohammad.athari.ismail@intel.com, tee.min.tan@intel.com,
 boon.leong.ong@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, rui.sousa@nxp.com
Subject: [Linux-stm32] [PATCH v2 net-next 2/3] net: stmmac: add mutex lock
	to protect est parameters
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

Add a mutex lock to protect est structure parameters so that the
EST parameters can be updated by other threads.

Signed-off-by: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 12 +++++++++++-
 include/linux/stmmac.h                          |  1 +
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index d7d448c5a72b..b2a276aac724 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -798,14 +798,18 @@ static int tc_setup_taprio(struct stmmac_priv *priv,
 					 GFP_KERNEL);
 		if (!plat->est)
 			return -ENOMEM;
+
+		mutex_init(&priv->plat->est->lock);
 	} else {
 		memset(plat->est, 0, sizeof(*plat->est));
 	}
 
 	size = qopt->num_entries;
 
+	mutex_lock(&priv->plat->est->lock);
 	priv->plat->est->gcl_size = size;
 	priv->plat->est->enable = qopt->enable;
+	mutex_unlock(&priv->plat->est->lock);
 
 	for (i = 0; i < size; i++) {
 		s64 delta_ns = qopt->entries[i].interval;
@@ -836,6 +840,7 @@ static int tc_setup_taprio(struct stmmac_priv *priv,
 		priv->plat->est->gcl[i] = delta_ns | (gates << wid);
 	}
 
+	mutex_lock(&priv->plat->est->lock);
 	/* Adjust for real system time */
 	priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
 	current_time_ns = timespec64_to_ktime(current_time);
@@ -849,8 +854,10 @@ static int tc_setup_taprio(struct stmmac_priv *priv,
 	priv->plat->est->ctr[0] = do_div(ctr, NSEC_PER_SEC);
 	priv->plat->est->ctr[1] = (u32)ctr;
 
-	if (fpe && !priv->dma_cap.fpesel)
+	if (fpe && !priv->dma_cap.fpesel) {
+		mutex_unlock(&priv->plat->est->lock);
 		return -EOPNOTSUPP;
+	}
 
 	/* Actual FPE register configuration will be done after FPE handshake
 	 * is success.
@@ -859,6 +866,7 @@ static int tc_setup_taprio(struct stmmac_priv *priv,
 
 	ret = stmmac_est_configure(priv, priv->ioaddr, priv->plat->est,
 				   priv->plat->clk_ptp_rate);
+	mutex_unlock(&priv->plat->est->lock);
 	if (ret) {
 		netdev_err(priv->dev, "failed to configure EST\n");
 		goto disable;
@@ -874,9 +882,11 @@ static int tc_setup_taprio(struct stmmac_priv *priv,
 	return 0;
 
 disable:
+	mutex_lock(&priv->plat->est->lock);
 	priv->plat->est->enable = false;
 	stmmac_est_configure(priv, priv->ioaddr, priv->plat->est,
 			     priv->plat->clk_ptp_rate);
+	mutex_unlock(&priv->plat->est->lock);
 
 	priv->plat->fpe_cfg->enable = false;
 	stmmac_fpe_configure(priv, priv->ioaddr,
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index e14a12df381b..c38b65aaf8c2 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -115,6 +115,7 @@ struct stmmac_axi {
 
 #define EST_GCL		1024
 struct stmmac_est {
+	struct mutex lock;
 	int enable;
 	u32 btr_offset[2];
 	u32 btr[2];
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
