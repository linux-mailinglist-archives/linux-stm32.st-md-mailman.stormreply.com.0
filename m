Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A3F30EE2F
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Feb 2021 09:17:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 083E6C57B53;
	Thu,  4 Feb 2021 08:17:57 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 654C5C424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Feb 2021 06:07:39 +0000 (UTC)
IronPort-SDR: JDzDQjgZqW+qeeYDMgdHLbiGnHuSpvQMcAhIpKglpNSbJBcp6p6tQTlRIAdB+J2a164yZSUV+t
 exoriQ2S5SCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="178617422"
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="178617422"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 22:07:37 -0800
IronPort-SDR: GqenepCZ1VqBBEQ87nyq8OetNlRo6vlCyxXo/qqg4n3Jm1A6yowbrtNYPvD95I4kNJ6Zw4xKcw
 1T+3iZ+3Lyfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="583080137"
Received: from ssid-ilbpg3.png.intel.com ([10.88.227.36])
 by fmsmga005.fm.intel.com with ESMTP; 03 Feb 2021 22:07:34 -0800
From: Song Yoong Siang <yoong.siang.song@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu,  4 Feb 2021 22:03:16 +0800
Message-Id: <1612447396-20351-1-git-send-email-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Thu, 04 Feb 2021 08:17:55 +0000
Cc: Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Gomes Vinicius <vinicius.gomes@intel.com>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/1] net: stmmac: set TxQ mode back to DCB
	after disabling CBS
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

From: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>

When disable CBS, mode_to_use parameter is not updated even the operation
mode of Tx Queue is changed to Data Centre Bridging (DCB). Therefore,
when tc_setup_cbs() function is called to re-enable CBS, the operation
mode of Tx Queue remains at DCB, which causing CBS fails to work.

This patch updates the value of mode_to_use parameter to MTL_QUEUE_DCB
after operation mode of Tx Queue is changed to DCB in stmmac_dma_qmode()
callback function.

Fixes: 1f705bc61aee ("net: stmmac: Add support for CBS QDISC")
Suggested-by: Gomes, Vinicius <vinicius.gomes@intel.com>
Signed-off-by: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
Signed-off-by: Song, Yoong Siang <yoong.siang.song@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 8ed3b2c..5698554 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -324,7 +324,12 @@ static int tc_setup_cbs(struct stmmac_priv *priv,
 
 		priv->plat->tx_queues_cfg[queue].mode_to_use = MTL_QUEUE_AVB;
 	} else if (!qopt->enable) {
-		return stmmac_dma_qmode(priv, priv->ioaddr, queue, MTL_QUEUE_DCB);
+		ret = stmmac_dma_qmode(priv, priv->ioaddr, queue,
+				       MTL_QUEUE_DCB);
+		if (ret)
+			return ret;
+
+		priv->plat->tx_queues_cfg[queue].mode_to_use = MTL_QUEUE_DCB;
 	}
 
 	/* Port Transmit Rate and Speed Divider */
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
