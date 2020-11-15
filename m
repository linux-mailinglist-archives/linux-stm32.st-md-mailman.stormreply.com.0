Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A04872B32D7
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Nov 2020 08:39:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55AB1C3FAD6;
	Sun, 15 Nov 2020 07:39:12 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B3BAC35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Nov 2020 07:39:10 +0000 (UTC)
IronPort-SDR: oAbIUfmn6+mATZaZAcBUzKQ4j59p8zj9yqxhRy1rf88f9osnD+fZy9tBKEZx6mhu1wQsSs5U1b
 RR2Ld0904ZkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9805"; a="150476267"
X-IronPort-AV: E=Sophos;i="5.77,479,1596524400"; d="scan'208";a="150476267"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2020 23:39:08 -0800
IronPort-SDR: 1PWLKPx+ILB4Z7PKdGv3btmqqAenr4VbrHzlnTFWgn38go0Cbgb4borWqG52M6ZoGMt2mFoDkq
 GoXTj+qfzNmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,479,1596524400"; d="scan'208";a="367367170"
Received: from glass.png.intel.com ([172.30.181.98])
 by orsmga007.jf.intel.com with ESMTP; 14 Nov 2020 23:39:04 -0800
From: Wong Vee Khee <vee.khee.wong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Sun, 15 Nov 2020 15:42:10 +0800
Message-Id: <20201115074210.23605-1-vee.khee.wong@intel.com>
X-Mailer: git-send-email 2.17.0
Cc: Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 net 1/1] net: stmmac: Use rtnl_lock/unlock
	on netif_set_real_num_rx_queues() call
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

Fix an issue where dump stack is printed on suspend resume flow due to
netif_set_real_num_rx_queues() is not called with rtnl_lock held().

Fixes: 686cff3d7022 ("net: stmmac: Fix incorrect location to set real_num_rx|tx_queues")
Reported-by: Christophe ROULLIER <christophe.roullier@st.com>
Tested-by: Christophe ROULLIER <christophe.roullier@st.com>
Cc: Alexandre TORGUE <alexandre.torgue@st.com>
Reviewed-by: Ong Boon Leong <boon.leong.ong@intel.com>
Signed-off-by: Wong Vee Khee <vee.khee.wong@intel.com>
---
v2 changelog:
- Move rtnl_lock() before priv->lock and release it after to avoid a
  possible ABBA deadlock scenario.
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ba855465a2db..c8770e9668a1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5272,6 +5272,7 @@ int stmmac_resume(struct device *dev)
 			return ret;
 	}
 
+	rtnl_lock();
 	mutex_lock(&priv->lock);
 
 	stmmac_reset_queues_param(priv);
@@ -5287,6 +5288,7 @@ int stmmac_resume(struct device *dev)
 	stmmac_enable_all_queues(priv);
 
 	mutex_unlock(&priv->lock);
+	rtnl_unlock();
 
 	if (!device_may_wakeup(priv->device) || !priv->plat->pmt) {
 		rtnl_lock();
-- 
2.17.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
