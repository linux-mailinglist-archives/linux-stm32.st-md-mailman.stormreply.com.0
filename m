Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB6F3BBAF8
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Jul 2021 12:16:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16F88C57B5F;
	Mon,  5 Jul 2021 10:16:17 +0000 (UTC)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CD77C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jul 2021 10:16:14 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C17FD1A040B;
 Mon,  5 Jul 2021 12:16:13 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 545D51A26EA;
 Mon,  5 Jul 2021 12:16:13 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id
 2AD73183ACDD; Mon,  5 Jul 2021 18:16:11 +0800 (+08)
From: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
To: davem@davemloft.net, joabreu@synopsys.com, kuba@kernel.org,
 alexandre.torgue@st.com, peppe.cavallaro@st.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org
Date: Mon,  5 Jul 2021 18:26:53 +0800
Message-Id: <20210705102655.6280-2-xiaoliang.yang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210705102655.6280-1-xiaoliang.yang_1@nxp.com>
References: <20210705102655.6280-1-xiaoliang.yang_1@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: qiangqing.zhang@nxp.com, weifeng.voon@intel.com, vee.khee.wong@intel.com,
 xiaoliang.yang_1@nxp.com, linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
 mohammad.athari.ismail@intel.com, tee.min.tan@intel.com,
 boon.leong.ong@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, rui.sousa@nxp.com
Subject: [Linux-stm32] [PATCH v2 net-next 1/3] net: stmmac: separate the tas
	basetime calculation function
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

Separate the TAS basetime calculation function so that it can be
called by other functions.

Signed-off-by: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  3 ++
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 38 ++++++++++++-------
 2 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index b6cd43eda7ac..17cbf4b26b34 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -348,6 +348,9 @@ void stmmac_enable_rx_queue(struct stmmac_priv *priv, u32 queue);
 void stmmac_disable_tx_queue(struct stmmac_priv *priv, u32 queue);
 void stmmac_enable_tx_queue(struct stmmac_priv *priv, u32 queue);
 int stmmac_xsk_wakeup(struct net_device *dev, u32 queue, u32 flags);
+struct timespec64 stmmac_calc_tas_basetime(ktime_t old_base_time,
+					   ktime_t current_time,
+					   u64 cycle_time);
 
 #if IS_ENABLED(CONFIG_STMMAC_SELFTESTS)
 void stmmac_selftest_run(struct net_device *dev,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 4e70efc45458..d7d448c5a72b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -713,6 +713,29 @@ static int tc_setup_cls(struct stmmac_priv *priv,
 	return ret;
 }
 
+struct timespec64 stmmac_calc_tas_basetime(ktime_t old_base_time,
+					   ktime_t current_time,
+					   u64 cycle_time)
+{
+	struct timespec64 time;
+
+	if (ktime_after(old_base_time, current_time)) {
+		time = ktime_to_timespec64(old_base_time);
+	} else {
+		s64 n;
+		ktime_t base_time;
+
+		n = div64_s64(ktime_sub_ns(current_time, old_base_time),
+			      cycle_time);
+		base_time = ktime_add_ns(old_base_time,
+					 (n + 1) * cycle_time);
+
+		time = ktime_to_timespec64(base_time);
+	}
+
+	return time;
+}
+
 static int tc_setup_taprio(struct stmmac_priv *priv,
 			   struct tc_taprio_qopt_offload *qopt)
 {
@@ -816,19 +839,8 @@ static int tc_setup_taprio(struct stmmac_priv *priv,
 	/* Adjust for real system time */
 	priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
 	current_time_ns = timespec64_to_ktime(current_time);
-	if (ktime_after(qopt->base_time, current_time_ns)) {
-		time = ktime_to_timespec64(qopt->base_time);
-	} else {
-		ktime_t base_time;
-		s64 n;
-
-		n = div64_s64(ktime_sub_ns(current_time_ns, qopt->base_time),
-			      qopt->cycle_time);
-		base_time = ktime_add_ns(qopt->base_time,
-					 (n + 1) * qopt->cycle_time);
-
-		time = ktime_to_timespec64(base_time);
-	}
+	time = stmmac_calc_tas_basetime(qopt->base_time, current_time_ns,
+					qopt->cycle_time);
 
 	priv->plat->est->btr[0] = (u32)time.tv_nsec;
 	priv->plat->est->btr[1] = (u32)time.tv_sec;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
