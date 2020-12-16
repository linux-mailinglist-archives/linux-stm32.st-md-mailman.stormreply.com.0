Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B41C82DCD56
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Dec 2020 09:05:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79262C3FAD9
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Dec 2020 08:05:43 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9328C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Dec 2020 11:35:28 +0000 (UTC)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <has@pengutronix.de>)
 id 1kpV5X-0000K6-PS; Wed, 16 Dec 2020 12:35:23 +0100
Received: from has by dude03.red.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <has@pengutronix.de>)
 id 1kpV5X-00CVWp-6B; Wed, 16 Dec 2020 12:35:23 +0100
From: Holger Assmann <h.assmann@pengutronix.de>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Wed, 16 Dec 2020 12:32:39 +0100
Message-Id: <20201216113239.2980816-2-h.assmann@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201216113239.2980816-1-h.assmann@pengutronix.de>
References: <20201216113239.2980816-1-h.assmann@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: has@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Thu, 17 Dec 2020 08:05:41 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] net: stmmac: drop no longer variable priv
	member
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

This follow-up patch removes the member "systime_flags" from
"stmmac_priv" and the affected funtions in stmmac.

Usage of this variable becomes deprecated after the introduction of
"stmmac_init_hwtstamp()", which now takes care of setting the respective
register flags.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Holger Assmann <h.assmann@pengutronix.de>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c        | 7 +++----
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h        | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 7 +++----
 drivers/net/ethernet/stmicro/stmmac/hwif.h          | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h        | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   | 6 +-----
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c    | 3 +--
 7 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
index 03e79a677c8b..53d14d660220 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
@@ -494,7 +494,7 @@ int dwmac5_rxp_config(void __iomem *ioaddr, struct stmmac_tc_entry *entries,
 
 int dwmac5_flex_pps_config(void __iomem *ioaddr, int index,
 			   struct stmmac_pps_cfg *cfg, bool enable,
-			   u32 sub_second_inc, u32 systime_flags)
+			   u32 sub_second_inc)
 {
 	u32 tnsec = readl(ioaddr + MAC_PPSx_TARGET_TIME_NSEC(index));
 	u32 val = readl(ioaddr + MAC_PPS_CONTROL);
@@ -504,7 +504,7 @@ int dwmac5_flex_pps_config(void __iomem *ioaddr, int index,
 		return -EINVAL;
 	if (tnsec & TRGTBUSY0)
 		return -EBUSY;
-	if (!sub_second_inc || !systime_flags)
+	if (!sub_second_inc)
 		return -EINVAL;
 
 	val &= ~PPSx_MASK(index);
@@ -522,8 +522,7 @@ int dwmac5_flex_pps_config(void __iomem *ioaddr, int index,
 
 	writel(cfg->start.tv_sec, ioaddr + MAC_PPSx_TARGET_TIME_SEC(index));
 
-	if (!(systime_flags & PTP_TCR_TSCTRLSSR))
-		cfg->start.tv_nsec = (cfg->start.tv_nsec * 1000) / 465;
+	/* HW timestamping init always sets PTP_TCR_TSCTRLSSR, so no conversion necessary */
 	writel(cfg->start.tv_nsec, ioaddr + MAC_PPSx_TARGET_TIME_NSEC(index));
 
 	period = cfg->period.tv_sec * 1000000000;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
index 56b0762c1276..f89996cc4403 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
@@ -108,7 +108,7 @@ int dwmac5_rxp_config(void __iomem *ioaddr, struct stmmac_tc_entry *entries,
 		      unsigned int count);
 int dwmac5_flex_pps_config(void __iomem *ioaddr, int index,
 			   struct stmmac_pps_cfg *cfg, bool enable,
-			   u32 sub_second_inc, u32 systime_flags);
+			   u32 sub_second_inc);
 int dwmac5_est_configure(void __iomem *ioaddr, struct stmmac_est *cfg,
 			 unsigned int ptp_rate);
 void dwmac5_fpe_configure(void __iomem *ioaddr, u32 num_txq, u32 num_rxq,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index ad4df9bddcf3..3bf3ce81dbd8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1109,7 +1109,7 @@ static int dwxgmac2_get_mac_tx_timestamp(struct mac_device_info *hw, u64 *ts)
 
 static int dwxgmac2_flex_pps_config(void __iomem *ioaddr, int index,
 				    struct stmmac_pps_cfg *cfg, bool enable,
-				    u32 sub_second_inc, u32 systime_flags)
+				    u32 sub_second_inc)
 {
 	u32 tnsec = readl(ioaddr + XGMAC_PPSx_TARGET_TIME_NSEC(index));
 	u32 val = readl(ioaddr + XGMAC_PPS_CONTROL);
@@ -1119,7 +1119,7 @@ static int dwxgmac2_flex_pps_config(void __iomem *ioaddr, int index,
 		return -EINVAL;
 	if (tnsec & XGMAC_TRGTBUSY0)
 		return -EBUSY;
-	if (!sub_second_inc || !systime_flags)
+	if (!sub_second_inc)
 		return -EINVAL;
 
 	val &= ~XGMAC_PPSx_MASK(index);
@@ -1136,8 +1136,7 @@ static int dwxgmac2_flex_pps_config(void __iomem *ioaddr, int index,
 
 	writel(cfg->start.tv_sec, ioaddr + XGMAC_PPSx_TARGET_TIME_SEC(index));
 
-	if (!(systime_flags & PTP_TCR_TSCTRLSSR))
-		cfg->start.tv_nsec = (cfg->start.tv_nsec * 1000) / 465;
+	/* HW timestamping init always sets PTP_TCR_TSCTRLSSR, so no conversion necessary */
 	writel(cfg->start.tv_nsec, ioaddr + XGMAC_PPSx_TARGET_TIME_NSEC(index));
 
 	period = cfg->period.tv_sec * 1000000000;
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index b40b2e0667bb..7d73d3206068 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -360,7 +360,7 @@ struct stmmac_ops {
 	/* Flexible PPS */
 	int (*flex_pps_config)(void __iomem *ioaddr, int index,
 			       struct stmmac_pps_cfg *cfg, bool enable,
-			       u32 sub_second_inc, u32 systime_flags);
+			       u32 sub_second_inc);
 	/* Loopback for selftests */
 	void (*set_mac_loopback)(void __iomem *ioaddr, bool enable);
 	/* RSS */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index e553b9a1f785..4d0642ae55d6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -217,7 +217,6 @@ struct stmmac_priv {
 	struct ptp_clock_info ptp_clock_ops;
 	unsigned int default_addend;
 	u32 sub_second_inc;
-	u32 systime_flags;
 	u32 adv_ts;
 	int use_riwt;
 	int irq_wake;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 55f5e6cd1cad..a6e4c7c26b4d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -697,9 +697,6 @@ static int stmmac_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
 			 ptp_over_ipv6_udp | ptp_over_ipv4_udp | ts_event_en |
 			 ts_master_en | snap_type_sel);
 		stmmac_config_hw_tstamping(priv, priv->ptpaddr, value);
-		
-		/* Store flags for later use */
-		priv->systime_flags = value;
 	}
 
 	memcpy(&priv->tstamp_config, &config, sizeof(config));
@@ -806,9 +803,8 @@ static int stmmac_init_hwtstamp(struct stmmac_priv *priv)
 			xmac, &sec_inc);
 	temp = div_u64(1000000000ULL, sec_inc);
 
-	/* Store sub second increment and flags for later use */
+	/* Store sub second increment for later use */
 	priv->sub_second_inc = sec_inc;
-	priv->systime_flags = value;
 
 	/* calculate default added value:
 	 * formula is :
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 0989e2bb6ee3..70a113ab4789 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -154,8 +154,7 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
 		spin_lock_irqsave(&priv->ptp_lock, flags);
 		ret = stmmac_flex_pps_config(priv, priv->ioaddr,
 					     rq->perout.index, cfg, on,
-					     priv->sub_second_inc,
-					     priv->systime_flags);
+					     priv->sub_second_inc);
 		spin_unlock_irqrestore(&priv->ptp_lock, flags);
 		break;
 	default:
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
