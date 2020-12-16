Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A302DCD55
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Dec 2020 09:05:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFC7DC3089F
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Dec 2020 08:05:42 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9F44C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Dec 2020 11:35:23 +0000 (UTC)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <has@pengutronix.de>)
 id 1kpV5N-00008t-S2; Wed, 16 Dec 2020 12:35:13 +0100
Received: from has by dude03.red.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <has@pengutronix.de>)
 id 1kpV5I-00CVWc-IM; Wed, 16 Dec 2020 12:35:08 +0100
From: Holger Assmann <h.assmann@pengutronix.de>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rayagond Kokatanur <rayagond@vayavyalabs.com>
Date: Wed, 16 Dec 2020 12:32:38 +0100
Message-Id: <20201216113239.2980816-1-h.assmann@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: has@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Thu, 17 Dec 2020 08:05:41 +0000
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Michael Olbrich <m.olbrich@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] net: stmmac: retain PTP-clock at
	hwtstamp_set
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

As it is, valid SIOCSHWTSTAMP ioctl calls - i.e. enable/disable time
stamping or changing filter settings - lead to synchronization of the
NIC's hardware clock with CLOCK_REALTIME. This might be necessary
during system initialization, but at runtime, when the PTP clock has
already been synchronized to a grand master, a reset of the timestamp
settings might result in a clock jump.

This further differs from how drivers like IGB and FEC behave: Those
initialize the PTP system time less frequently - on interface up and
at probe time, respectively.

We consequently introduce the new function stmmac_init_hwtstamp(), which
gets called during ndo_open(). It contains the code snippet moved
from stmmac_hwtstamp_set() that manages the time synchronization. Besides,
the sub second increment configuration is also moved here since the
related values are hardware dependent and do not change during runtime.

Furthermore, the hardware clock must be kept running even when no time
stamping mode is selected in order to retain the once synced time basis.
That way, time stamping can be enabled again at any time only with the
need for compensation of the clock's natural drifting.

As a side effect, this patch fixes a potential race between SIOCSHWTSTAMP
and ptp_clock_info::enable regarding priv->systime_flags. Subsequently,
since this variable becomes deprecated by this commit, it should be
removed completely in a follow-up patch.

Fixes: 92ba6888510c ("stmmac: add the support for PTP hw clock driver")
Fixes: cc4c9001ce31 ("net: stmmac: Switch stmmac_hwtimestamp to generic
HW Interface Helpers")

Reported-by: Michael Olbrich <m.olbrich@pengutronix.de>
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Holger Assmann <h.assmann@pengutronix.de>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 121 ++++++++++++------
 1 file changed, 80 insertions(+), 41 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5b1c12ff98c0..55f5e6cd1cad 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -46,6 +46,13 @@
 #include "dwxgmac2.h"
 #include "hwif.h"
 
+
+/* As long the interface is active, we keep the timestamping HW enabled with
+ * fine resolution and binary rollover. This avoid non-monotonic behavior
+ * when changing timestamp settings at runtime
+ * */
+#define STMMAC_HWTS_ACTIVE (PTP_TCR_TSENA | PTP_TCR_TSCFUPDT | PTP_TCR_TSCTRLSSR)
+
 #define	STMMAC_ALIGN(x)		ALIGN(ALIGN(x, SMP_CACHE_BYTES), 16)
 #define	TSO_MAX_BUFF_SIZE	(SZ_16K - 1)
 
@@ -509,8 +516,6 @@ static int stmmac_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	struct hwtstamp_config config;
-	struct timespec64 now;
-	u64 temp = 0;
 	u32 ptp_v2 = 0;
 	u32 tstamp_all = 0;
 	u32 ptp_over_ipv4_udp = 0;
@@ -519,7 +524,6 @@ static int stmmac_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
 	u32 snap_type_sel = 0;
 	u32 ts_master_en = 0;
 	u32 ts_event_en = 0;
-	u32 sec_inc = 0;
 	u32 value = 0;
 	bool xmac;
 
@@ -686,39 +690,16 @@ static int stmmac_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
 	priv->hwts_tx_en = config.tx_type == HWTSTAMP_TX_ON;
 
 	if (!priv->hwts_tx_en && !priv->hwts_rx_en)
-		stmmac_config_hw_tstamping(priv, priv->ptpaddr, 0);
+		stmmac_config_hw_tstamping(priv, priv->ptpaddr, STMMAC_HWTS_ACTIVE);
 	else {
-		value = (PTP_TCR_TSENA | PTP_TCR_TSCFUPDT | PTP_TCR_TSCTRLSSR |
+		value = (STMMAC_HWTS_ACTIVE |
 			 tstamp_all | ptp_v2 | ptp_over_ethernet |
 			 ptp_over_ipv6_udp | ptp_over_ipv4_udp | ts_event_en |
 			 ts_master_en | snap_type_sel);
 		stmmac_config_hw_tstamping(priv, priv->ptpaddr, value);
-
-		/* program Sub Second Increment reg */
-		stmmac_config_sub_second_increment(priv,
-				priv->ptpaddr, priv->plat->clk_ptp_rate,
-				xmac, &sec_inc);
-		temp = div_u64(1000000000ULL, sec_inc);
-
-		/* Store sub second increment and flags for later use */
-		priv->sub_second_inc = sec_inc;
+		
+		/* Store flags for later use */
 		priv->systime_flags = value;
-
-		/* calculate default added value:
-		 * formula is :
-		 * addend = (2^32)/freq_div_ratio;
-		 * where, freq_div_ratio = 1e9ns/sec_inc
-		 */
-		temp = (u64)(temp << 32);
-		priv->default_addend = div_u64(temp, priv->plat->clk_ptp_rate);
-		stmmac_config_addend(priv, priv->ptpaddr, priv->default_addend);
-
-		/* initialize system time */
-		ktime_get_real_ts64(&now);
-
-		/* lower 32 bits of tv_sec are safe until y2106 */
-		stmmac_init_systime(priv, priv->ptpaddr,
-				(u32)now.tv_sec, now.tv_nsec);
 	}
 
 	memcpy(&priv->tstamp_config, &config, sizeof(config));
@@ -791,6 +772,63 @@ static void stmmac_release_ptp(struct stmmac_priv *priv)
 	stmmac_ptp_unregister(priv);
 }
 
+/**
+ * stmmac_init_hwtstamp - init Timestamping Hardware
+ * @priv: driver private structure
+ * Description: Initialize hardware for Timestamping use
+ * This is valid as long as the interface is open and not suspended.
+ * Will be rerun after resume from suspension.
+ */
+static int stmmac_init_hwtstamp(struct stmmac_priv *priv)
+{
+	bool xmac = priv->plat->has_gmac4 || priv->plat->has_xgmac;
+	struct timespec64 now;
+	u32 sec_inc = 0;
+	u64 temp = 0;
+	u32 value;
+	int ret;
+
+	ret = clk_prepare_enable(priv->plat->clk_ptp_ref);
+	if (ret < 0) {
+		netdev_warn(priv->dev, "failed to enable PTP reference clock: %d\n", ret);
+		return ret;
+	}
+
+	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp))
+		return -EOPNOTSUPP;
+
+	value = STMMAC_HWTS_ACTIVE;
+	stmmac_config_hw_tstamping(priv, priv->ptpaddr, value);
+
+	/* program Sub Second Increment reg */
+	stmmac_config_sub_second_increment(priv,
+			priv->ptpaddr, priv->plat->clk_ptp_rate,
+			xmac, &sec_inc);
+	temp = div_u64(1000000000ULL, sec_inc);
+
+	/* Store sub second increment and flags for later use */
+	priv->sub_second_inc = sec_inc;
+	priv->systime_flags = value;
+
+	/* calculate default added value:
+	 * formula is :
+	 * addend = (2^32)/freq_div_ratio;
+	 * where, freq_div_ratio = 1e9ns/sec_inc
+	 */
+	temp = (u64)(temp << 32);
+	priv->default_addend = div_u64(temp, priv->plat->clk_ptp_rate);
+	stmmac_config_addend(priv, priv->ptpaddr, priv->default_addend);
+
+	/* initialize system time */
+	ktime_get_real_ts64(&now);
+
+	/* lower 32 bits of tv_sec are safe until y2106 */
+	stmmac_init_systime(priv, priv->ptpaddr,
+			(u32)now.tv_sec, now.tv_nsec);
+
+	return 0;
+}
+
 /**
  *  stmmac_mac_flow_ctrl - Configure flow control in all queues
  *  @priv: driver private structure
@@ -2713,15 +2751,17 @@ static int stmmac_hw_setup(struct net_device *dev, bool init_ptp)
 	stmmac_mmc_setup(priv);
 
 	if (init_ptp) {
-		ret = clk_prepare_enable(priv->plat->clk_ptp_ref);
-		if (ret < 0)
-			netdev_warn(priv->dev, "failed to enable PTP reference clock: %d\n", ret);
-
-		ret = stmmac_init_ptp(priv);
-		if (ret == -EOPNOTSUPP)
-			netdev_warn(priv->dev, "PTP not supported by HW\n");
-		else if (ret)
-			netdev_warn(priv->dev, "PTP init failed\n");
+		ret = stmmac_init_hwtstamp(priv);
+		if (ret) {
+			netdev_warn(priv->dev, "HW Timestamping init failed: %pe\n",
+					ERR_PTR(ret));
+		} else {
+			ret = stmmac_init_ptp(priv);
+			if (ret == -EOPNOTSUPP)
+				netdev_warn(priv->dev, "PTP not supported by HW\n");
+			else if (ret)
+				netdev_warn(priv->dev, "PTP init failed\n");
+		}
 	}
 
 	priv->eee_tw_timer = STMMAC_DEFAULT_TWT_LS;
@@ -5290,8 +5330,7 @@ int stmmac_resume(struct device *dev)
 		/* enable the clk previously disabled */
 		clk_prepare_enable(priv->plat->stmmac_clk);
 		clk_prepare_enable(priv->plat->pclk);
-		if (priv->plat->clk_ptp_ref)
-			clk_prepare_enable(priv->plat->clk_ptp_ref);
+		stmmac_init_hwtstamp(priv);
 		/* reset the phy so that it's ready */
 		if (priv->mii)
 			stmmac_mdio_reset(priv->mii);

base-commit: 3db1a3fa98808aa90f95ec3e0fa2fc7abf28f5c9
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
