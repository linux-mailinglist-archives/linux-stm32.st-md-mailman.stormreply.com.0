Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9687F456B56
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Nov 2021 09:10:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B69CC5EC56;
	Fri, 19 Nov 2021 08:10:24 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D93EC5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Nov 2021 08:10:23 +0000 (UTC)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637309422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=u4z4KZzApJAKUjf78C7LiERGFGnsrWpuLIEte2H/AUo=;
 b=xnbMUUndcOMXIhXIk2x14+VSqwdAjEm+AjJBfOwa86kZsGK4MYb0clCJUQuuF31QtAu8iQ
 s4eIvHz8FrNbSte7WY8aR28Q2NON6q02eB+iwMozBNgBR4bh0IXh8JLqS8GSOcFGD8x8BP
 v8QGJ1bkMRblgSf8+VR0UMVwRZ/kOVlcSeJp+6Slf5pY/mkq0fEPJyODvej1sdUOHbIMDi
 tI6jfyM3qP1Sjbvb7U80Oxcp+UZHT/I4bSPWugrmKfjHOa0PV0HPabxGC13mSxW1o/zSZy
 RHVoqNTXySouerzAKVLlbODLThtj6LX0Ynwdukjio4pGjbIWFa5aCMRI7BwSKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637309422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=u4z4KZzApJAKUjf78C7LiERGFGnsrWpuLIEte2H/AUo=;
 b=LQwiCwTf6e7wOVJ9L1LKhW+5InOuprsPGxeXBVonOg6KcuSlMbR1nBol8o94g2/oiopLS3
 0FQLjdYLmd/Yb2AQ==
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Fri, 19 Nov 2021 09:10:10 +0100
Message-Id: <20211119081010.27084-1-kurt@linutronix.de>
MIME-Version: 1.0
Cc: Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 Benedikt Spranger <b.spranger@linutronix.de>,
 Voon Weifeng <weifeng.voon@intel.com>, "Wong,
 Vee Khee" <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 Xiaoliang Yang <xiaoliang.yang_1@nxp.com>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tan Tee Min <tee.min.tan@intel.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1] net: stmmac: Caclucate clock
	domain crossing error only once
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

The clock domain crossing error (CDC) is calculated at every fetch of Tx or Rx
timestamps. It includes a division. Especially on arm32 based systems it is
expensive. It also saves the two conditionals.

Therefore, move the calculation to the PTP initialization code and just use the
cached value in the timestamp retrieval functions.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
---

Bene, would you mind to test this patch on stm32mp1 too?

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 ++----------
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  6 ++++++
 include/linux/stmmac.h                            |  1 +
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 21111df73719..340076b5bb38 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -511,14 +511,6 @@ bool stmmac_eee_init(struct stmmac_priv *priv)
 	return true;
 }
 
-static inline u32 stmmac_cdc_adjust(struct stmmac_priv *priv)
-{
-	/* Correct the clk domain crossing(CDC) error */
-	if (priv->plat->has_gmac4 && priv->plat->clk_ptp_rate)
-		return (2 * NSEC_PER_SEC) / priv->plat->clk_ptp_rate;
-	return 0;
-}
-
 /* stmmac_get_tx_hwtstamp - get HW TX timestamps
  * @priv: driver private structure
  * @p : descriptor pointer
@@ -550,7 +542,7 @@ static void stmmac_get_tx_hwtstamp(struct stmmac_priv *priv,
 	}
 
 	if (found) {
-		ns -= stmmac_cdc_adjust(priv);
+		ns -= priv->plat->cdc_error_adj;
 
 		memset(&shhwtstamp, 0, sizeof(struct skb_shared_hwtstamps));
 		shhwtstamp.hwtstamp = ns_to_ktime(ns);
@@ -587,7 +579,7 @@ static void stmmac_get_rx_hwtstamp(struct stmmac_priv *priv, struct dma_desc *p,
 	if (stmmac_get_rx_timestamp_status(priv, p, np, priv->adv_ts)) {
 		stmmac_get_timestamp(priv, desc, priv->adv_ts, &ns);
 
-		ns -= stmmac_cdc_adjust(priv);
+		ns -= priv->plat->cdc_error_adj;
 
 		netdev_dbg(priv->dev, "get valid RX hw timestamp %llu\n", ns);
 		shhwtstamp = skb_hwtstamps(skb);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 580cc035536b..96b9e4175f08 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -309,6 +309,12 @@ void stmmac_ptp_register(struct stmmac_priv *priv)
 	if (priv->plat->ptp_max_adj)
 		stmmac_ptp_clock_ops.max_adj = priv->plat->ptp_max_adj;
 
+	/* Calculate the clock domain crossing (CDC) error if necessary */
+	priv->plat->cdc_error_adj = 0;
+	if (priv->plat->has_gmac4 && priv->plat->clk_ptp_rate)
+		priv->plat->cdc_error_adj = (2 * NSEC_PER_SEC) /
+			priv->plat->clk_ptp_rate;
+
 	stmmac_ptp_clock_ops.n_per_out = priv->dma_cap.pps_out_num;
 	stmmac_ptp_clock_ops.n_ext_ts = priv->dma_cap.aux_snapshot_n;
 
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index a6f03b36fc4f..89b8e208cd7b 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -241,6 +241,7 @@ struct plat_stmmacenet_data {
 	unsigned int clk_ref_rate;
 	unsigned int mult_fact_100ns;
 	s32 ptp_max_adj;
+	u32 cdc_error_adj;
 	struct reset_control *stmmac_rst;
 	struct reset_control *stmmac_ahb_rst;
 	struct stmmac_axi *axi;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
