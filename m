Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 269BA33E847
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Mar 2021 05:05:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA0C6C57B79;
	Wed, 17 Mar 2021 04:05:03 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F6D2C56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Mar 2021 04:05:00 +0000 (UTC)
IronPort-SDR: iMm3CCDIozsoqvVMngh+RBB2SO3HHsN5EDNytZmxKGiH7e5LA24vhFzN3ooypxWZeWRXgHitfb
 A9le1fcfUQ/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="187011954"
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; d="scan'208";a="187011954"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2021 21:04:58 -0700
IronPort-SDR: JR5srjP4tj6jWm31Pkt3ES5OUH9IOul5aCJypO7tlEQwKSN+D+iuiw2soM3TdOS0ckFpS56XDZ
 dargmXMdPgdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; d="scan'208";a="412486779"
Received: from glass.png.intel.com ([10.158.65.59])
 by orsmga008.jf.intel.com with ESMTP; 16 Mar 2021 21:04:55 -0700
From: Wong Vee Khee <vee.khee.wong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Wed, 17 Mar 2021 12:09:04 +0800
Message-Id: <20210317040904.816-1-vee.khee.wong@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: add timestamp
	correction to rid CDC sync error
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

From: Voon Weifeng <weifeng.voon@intel.com>

According to Synopsis DesignWare EQoS Databook, the Clock Domain Cross
synchronization error is introduced tue to the clock(GMII Tx/Rx clock)
being different at the capture as compared to the PTP
clock(clk_ptp_ref_i) that is used to generate the time.

The CDC synchronization error is almost equal to 2 times the clock
period of the PTP clock(clk_ptp_ref_i).

On a Intel Tigerlake platform (with Marvell 88E2110 external PHY):

Before applying this patch (with CDC synchronization error):
ptp4l[64.044]: rms    8 max   13 freq +30877 +/-  11 delay   216 +/-   0
ptp4l[65.047]: rms   13 max   20 freq +30869 +/-  17 delay   213 +/-   0
ptp4l[66.050]: rms   12 max   20 freq +30857 +/-  11 delay   213 +/-   0
ptp4l[67.052]: rms   11 max   22 freq +30849 +/-  10 delay   215 +/-   0
ptp4l[68.055]: rms   10 max   16 freq +30853 +/-  13 delay   215 +/-   0
ptp4l[69.057]: rms    7 max   13 freq +30848 +/-   9 delay   216 +/-   0
ptp4l[70.060]: rms    8 max   13 freq +30846 +/-  10 delay   216 +/-   0
ptp4l[71.063]: rms    9 max   15 freq +30836 +/-   8 delay   218 +/-   0

After applying this patch (CDC syncrhonization error is taken care of):
ptp4l[61.516]: rms  773 max  824 freq +31526 +/- 158 delay   200 +/-   0
ptp4l[62.519]: rms  427 max  596 freq +31668 +/-  39 delay   198 +/-   0
ptp4l[63.522]: rms  113 max  206 freq +31482 +/-  57 delay   198 +/-   0
ptp4l[64.525]: rms   40 max   56 freq +31316 +/-  29 delay   200 +/-   0
ptp4l[65.528]: rms   47 max   56 freq +31255 +/-  17 delay   200 +/-   0
ptp4l[66.531]: rms   26 max   36 freq +31246 +/-   9 delay   200 +/-   0
ptp4l[67.534]: rms   12 max   18 freq +31254 +/-  12 delay   202 +/-   0
ptp4l[68.537]: rms    7 max   12 freq +31263 +/-  10 delay   202 +/-   0

Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
Signed-off-by: Wong Vee Khee <vee.khee.wong@intel.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a10704d8e3c6..ddf54b8ad75d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -466,6 +466,7 @@ static void stmmac_get_tx_hwtstamp(struct stmmac_priv *priv,
 {
 	struct skb_shared_hwtstamps shhwtstamp;
 	bool found = false;
+	s64 adjust = 0;
 	u64 ns = 0;
 
 	if (!priv->hwts_tx_en)
@@ -484,6 +485,13 @@ static void stmmac_get_tx_hwtstamp(struct stmmac_priv *priv,
 	}
 
 	if (found) {
+		/* Correct the clk domain crossing(CDC) error */
+		if (priv->plat->has_gmac4 && priv->plat->clk_ptp_rate) {
+			adjust += -(2 * (NSEC_PER_SEC /
+					 priv->plat->clk_ptp_rate));
+			ns += adjust;
+		}
+
 		memset(&shhwtstamp, 0, sizeof(struct skb_shared_hwtstamps));
 		shhwtstamp.hwtstamp = ns_to_ktime(ns);
 
@@ -507,6 +515,7 @@ static void stmmac_get_rx_hwtstamp(struct stmmac_priv *priv, struct dma_desc *p,
 {
 	struct skb_shared_hwtstamps *shhwtstamp = NULL;
 	struct dma_desc *desc = p;
+	u64 adjust = 0;
 	u64 ns = 0;
 
 	if (!priv->hwts_rx_en)
@@ -518,6 +527,13 @@ static void stmmac_get_rx_hwtstamp(struct stmmac_priv *priv, struct dma_desc *p,
 	/* Check if timestamp is available */
 	if (stmmac_get_rx_timestamp_status(priv, p, np, priv->adv_ts)) {
 		stmmac_get_timestamp(priv, desc, priv->adv_ts, &ns);
+
+		/* Correct the clk domain crossing(CDC) error */
+		if (priv->plat->has_gmac4 && priv->plat->clk_ptp_rate) {
+			adjust += 2 * (NSEC_PER_SEC / priv->plat->clk_ptp_rate);
+			ns -= adjust;
+		}
+
 		netdev_dbg(priv->dev, "get valid RX hw timestamp %llu\n", ns);
 		shhwtstamp = skb_hwtstamps(skb);
 		memset(shhwtstamp, 0, sizeof(struct skb_shared_hwtstamps));
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
