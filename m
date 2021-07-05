Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEC03BBAFA
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Jul 2021 12:16:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4000C58D78;
	Mon,  5 Jul 2021 10:16:19 +0000 (UTC)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B432C57B60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jul 2021 10:16:17 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 30D55200690;
 Mon,  5 Jul 2021 12:16:17 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C294D2015FC;
 Mon,  5 Jul 2021 12:16:16 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id
 97381183ACDD; Mon,  5 Jul 2021 18:16:14 +0800 (+08)
From: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
To: davem@davemloft.net, joabreu@synopsys.com, kuba@kernel.org,
 alexandre.torgue@st.com, peppe.cavallaro@st.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org
Date: Mon,  5 Jul 2021 18:26:55 +0800
Message-Id: <20210705102655.6280-4-xiaoliang.yang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210705102655.6280-1-xiaoliang.yang_1@nxp.com>
References: <20210705102655.6280-1-xiaoliang.yang_1@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: qiangqing.zhang@nxp.com, weifeng.voon@intel.com, vee.khee.wong@intel.com,
 xiaoliang.yang_1@nxp.com, linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
 mohammad.athari.ismail@intel.com, tee.min.tan@intel.com,
 boon.leong.ong@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, rui.sousa@nxp.com
Subject: [Linux-stm32] [PATCH v2 net-next 3/3] net: stmmac: ptp: update tas
	basetime after ptp adjust
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

After adjusting the ptp time, the Qbv base time may be the past time
of the new current time. dwmac5 hardware limited the base time cannot
be set as past time. This patch add a btr_reserve to store the base
time get from qopt, then calculate the base time and reset the Qbv
configuration after ptp time adjust.

Signed-off-by: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  | 41 ++++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |  6 ++-
 include/linux/stmmac.h                        |  1 +
 3 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 4e86cdf2bc9f..580cc035536b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -62,7 +62,8 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 	u32 sec, nsec;
 	u32 quotient, reminder;
 	int neg_adj = 0;
-	bool xmac;
+	bool xmac, est_rst = false;
+	int ret;
 
 	xmac = priv->plat->has_gmac4 || priv->plat->has_xgmac;
 
@@ -75,10 +76,48 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 	sec = quotient;
 	nsec = reminder;
 
+	/* If EST is enabled, disabled it before adjust ptp time. */
+	if (priv->plat->est && priv->plat->est->enable) {
+		est_rst = true;
+		mutex_lock(&priv->plat->est->lock);
+		priv->plat->est->enable = false;
+		stmmac_est_configure(priv, priv->ioaddr, priv->plat->est,
+				     priv->plat->clk_ptp_rate);
+		mutex_unlock(&priv->plat->est->lock);
+	}
+
 	spin_lock_irqsave(&priv->ptp_lock, flags);
 	stmmac_adjust_systime(priv, priv->ptpaddr, sec, nsec, neg_adj, xmac);
 	spin_unlock_irqrestore(&priv->ptp_lock, flags);
 
+	/* Caculate new basetime and re-configured EST after PTP time adjust. */
+	if (est_rst) {
+		struct timespec64 current_time, time;
+		ktime_t current_time_ns, basetime;
+		u64 cycle_time;
+
+		mutex_lock(&priv->plat->est->lock);
+		priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
+		current_time_ns = timespec64_to_ktime(current_time);
+		time.tv_nsec = priv->plat->est->btr_reserve[0];
+		time.tv_sec = priv->plat->est->btr_reserve[1];
+		basetime = timespec64_to_ktime(time);
+		cycle_time = priv->plat->est->ctr[1] * NSEC_PER_SEC +
+			     priv->plat->est->ctr[0];
+		time = stmmac_calc_tas_basetime(basetime,
+						current_time_ns,
+						cycle_time);
+
+		priv->plat->est->btr[0] = (u32)time.tv_nsec;
+		priv->plat->est->btr[1] = (u32)time.tv_sec;
+		priv->plat->est->enable = true;
+		ret = stmmac_est_configure(priv, priv->ioaddr, priv->plat->est,
+					   priv->plat->clk_ptp_rate);
+		mutex_unlock(&priv->plat->est->lock);
+		if (ret)
+			netdev_err(priv->dev, "failed to configure EST\n");
+	}
+
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index b2a276aac724..c277595341ee 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -741,7 +741,7 @@ static int tc_setup_taprio(struct stmmac_priv *priv,
 {
 	u32 size, wid = priv->dma_cap.estwid, dep = priv->dma_cap.estdep;
 	struct plat_stmmacenet_data *plat = priv->plat;
-	struct timespec64 time, current_time;
+	struct timespec64 time, current_time, qopt_time;
 	ktime_t current_time_ns;
 	bool fpe = false;
 	int i, ret = 0;
@@ -850,6 +850,10 @@ static int tc_setup_taprio(struct stmmac_priv *priv,
 	priv->plat->est->btr[0] = (u32)time.tv_nsec;
 	priv->plat->est->btr[1] = (u32)time.tv_sec;
 
+	qopt_time = ktime_to_timespec64(qopt->base_time);
+	priv->plat->est->btr_reserve[0] = (u32)qopt_time.tv_nsec;
+	priv->plat->est->btr_reserve[1] = (u32)qopt_time.tv_sec;
+
 	ctr = qopt->cycle_time;
 	priv->plat->est->ctr[0] = do_div(ctr, NSEC_PER_SEC);
 	priv->plat->est->ctr[1] = (u32)ctr;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index c38b65aaf8c2..f5ae3cf05918 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -117,6 +117,7 @@ struct stmmac_axi {
 struct stmmac_est {
 	struct mutex lock;
 	int enable;
+	u32 btr_reserve[2];
 	u32 btr_offset[2];
 	u32 btr[2];
 	u32 ctr[2];
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
