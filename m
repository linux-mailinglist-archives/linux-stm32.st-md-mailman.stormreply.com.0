Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E95C31E5CF
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Feb 2021 06:45:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55E79C5718D;
	Thu, 18 Feb 2021 05:45:20 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23F5AC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Feb 2021 05:45:16 +0000 (UTC)
IronPort-SDR: DcZv/m+P9OxUfVOldy/ZoXB0BQbAl7uqKIzUnH+afd1Sq+DhzrNgUcJ37xVop/Ng2HEqTZ1Rkz
 5msMkATQlCVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="171082787"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="171082787"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 21:45:14 -0800
IronPort-SDR: 6KtFZd6YYDrNte8uKj3D5WEvS5GCUEtB1bob9HGjlT49/TS5TPigfZfCY5dNMk0QJYPWAnw3Ni
 xvVbwiXkEY4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="378290130"
Received: from ssid-ilbpg3.png.intel.com ([10.88.227.36])
 by orsmga002.jf.intel.com with ESMTP; 17 Feb 2021 21:45:10 -0800
From: Song Yoong Siang <yoong.siang.song@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu, 18 Feb 2021 21:40:53 +0800
Message-Id: <1613655653-11755-1-git-send-email-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Song Yoong Siang <yoong.siang.song@intel.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/1] net: stmmac: fix CBS idleslope and
	sendslope calculation
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

From: "Song, Yoong Siang" <yoong.siang.song@intel.com>

When link speed is not 100 Mbps, port transmit rate and speed divider
are set to 8 and 1000000 respectively. These values are incorrect for
CBS idleslope and sendslope HW values calculation if the link speed is
not 1 Gbps.

This patch adds switch statement to set the values of port transmit rate
and speed divider for 10 Gbps, 5 Gbps, 2.5 Gbps, 1 Gbps, and 100 Mbps.
Note that CBS is not supported at 10 Mbps.

Fixes: bc41a6689b30 ("net: stmmac: tc: Remove the speed dependency")
Fixes: 1f705bc61aee ("net: stmmac: Add support for CBS QDISC")
Signed-off-by: Song, Yoong Siang <yoong.siang.song@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 30 +++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 5698554..44bb133 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -316,6 +316,32 @@ static int tc_setup_cbs(struct stmmac_priv *priv,
 	if (!priv->dma_cap.av)
 		return -EOPNOTSUPP;
 
+	/* Port Transmit Rate and Speed Divider */
+	switch (priv->speed) {
+	case SPEED_10000:
+		ptr = 32;
+		speed_div = 10000000;
+		break;
+	case SPEED_5000:
+		ptr = 32;
+		speed_div = 5000000;
+		break;
+	case SPEED_2500:
+		ptr = 8;
+		speed_div = 2500000;
+		break;
+	case SPEED_1000:
+		ptr = 8;
+		speed_div = 1000000;
+		break;
+	case SPEED_100:
+		ptr = 4;
+		speed_div = 100000;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
 	mode_to_use = priv->plat->tx_queues_cfg[queue].mode_to_use;
 	if (mode_to_use == MTL_QUEUE_DCB && qopt->enable) {
 		ret = stmmac_dma_qmode(priv, priv->ioaddr, queue, MTL_QUEUE_AVB);
@@ -332,10 +358,6 @@ static int tc_setup_cbs(struct stmmac_priv *priv,
 		priv->plat->tx_queues_cfg[queue].mode_to_use = MTL_QUEUE_DCB;
 	}
 
-	/* Port Transmit Rate and Speed Divider */
-	ptr = (priv->speed == SPEED_100) ? 4 : 8;
-	speed_div = (priv->speed == SPEED_100) ? 100000 : 1000000;
-
 	/* Final adjustments for HW */
 	value = div_s64(qopt->idleslope * 1024ll * ptr, speed_div);
 	priv->plat->tx_queues_cfg[queue].idle_slope = value & GENMASK(31, 0);
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
