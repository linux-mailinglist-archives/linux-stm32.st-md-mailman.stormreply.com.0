Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF27B3667A4
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Apr 2021 11:09:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BD8AC5719E;
	Wed, 21 Apr 2021 09:09:09 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E189BC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 09:09:04 +0000 (UTC)
IronPort-SDR: betn2SF964IracC6pzOltKFWdPK6AfSUVt/h1zspAR6SXox5vCwj9RbKPBsp8H5YgKwiwNEnFw
 NTTs01949HYA==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="195693581"
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; d="scan'208";a="195693581"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 02:09:00 -0700
IronPort-SDR: DN8SoSXKp7r6nZp8rCRIndx7m90PfocgTMR3O5IwKANU6meiFXTRRMXFLk1N6fR4xx8+8VFK4X
 JbBc86WAjgKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; d="scan'208";a="463517768"
Received: from glass.png.intel.com ([10.158.65.59])
 by orsmga001.jf.intel.com with ESMTP; 21 Apr 2021 02:08:57 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 21 Apr 2021 17:11:49 +0800
Message-Id: <20210421091149.5035-1-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/1] net: stmmac: fix TSO and TBS feature
	enabling during driver open
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

TSO and TBS cannot co-exist and current implementation requires two
fixes:

 1) stmmac_open() does not need to call stmmac_enable_tbs() because
    the MAC is reset in stmmac_init_dma_engine() anyway.
 2) Inside stmmac_hw_setup(), we should call stmmac_enable_tso() for
    TX Q that is _not_ configured for TBS.

Fixes: 579a25a854d4 ("net: stmmac: Initial support for TBS")
Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4749bd0af160..c6f24abf6432 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2757,8 +2757,15 @@ static int stmmac_hw_setup(struct net_device *dev, bool init_ptp)
 
 	/* Enable TSO */
 	if (priv->tso) {
-		for (chan = 0; chan < tx_cnt; chan++)
+		for (chan = 0; chan < tx_cnt; chan++) {
+			struct stmmac_tx_queue *tx_q = &priv->tx_queue[chan];
+
+			/* TSO and TBS cannot co-exist */
+			if (tx_q->tbs & STMMAC_TBS_AVAIL)
+				continue;
+
 			stmmac_enable_tso(priv, priv->ioaddr, 1, chan);
+		}
 	}
 
 	/* Enable Split Header */
@@ -2850,9 +2857,8 @@ static int stmmac_open(struct net_device *dev)
 		struct stmmac_tx_queue *tx_q = &priv->tx_queue[chan];
 		int tbs_en = priv->plat->tx_queues_cfg[chan].tbs_en;
 
+		/* Setup per-TXQ tbs flag before TX descriptor alloc */
 		tx_q->tbs |= tbs_en ? STMMAC_TBS_AVAIL : 0;
-		if (stmmac_enable_tbs(priv, priv->ioaddr, tbs_en, chan))
-			tx_q->tbs &= ~STMMAC_TBS_AVAIL;
 	}
 
 	ret = alloc_dma_desc_resources(priv);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
