Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C543532E1CD
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Mar 2021 06:46:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBD6EC57B75;
	Fri,  5 Mar 2021 05:46:37 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AED4C56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Mar 2021 05:46:35 +0000 (UTC)
IronPort-SDR: BsSn0dKXZL0ptdVNqd3XQN49LoH9qqFu2i7qhM7nNVGEKTSICNuGNEBph/SElIYdACJD69aJWb
 jHPji24qD/KA==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="207305440"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; d="scan'208";a="207305440"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 21:46:33 -0800
IronPort-SDR: 2oWlfv1RIMS0G3hZt0P+/X/dqBMO+h83Ek/AfL+kLozvNggpjXeGNFtR32vYnA1/B6RCuf+v8I
 VWoCrYH5BfZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; d="scan'208";a="446070894"
Received: from glass.png.intel.com ([10.158.65.59])
 by orsmga001.jf.intel.com with ESMTP; 04 Mar 2021 21:46:30 -0800
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Fri,  5 Mar 2021 13:49:30 +0800
Message-Id: <20210305054930.7434-1-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.17.0
Cc: Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/1] net: stmmac: Fix VLAN filter delete
	timeout issue in Intel mGBE SGMII
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

For Intel mGbE controller, MAC VLAN filter delete operation will time-out
if serdes power-down sequence happened first during driver remove() with
below message.

[82294.764958] intel-eth-pci 0000:00:1e.4 eth2: stmmac_dvr_remove: removing driver
[82294.778677] intel-eth-pci 0000:00:1e.4 eth2: Timeout accessing MAC_VLAN_Tag_Filter
[82294.779997] intel-eth-pci 0000:00:1e.4 eth2: failed to kill vid 0081/0
[82294.947053] intel-eth-pci 0000:00:1d.2 eth1: stmmac_dvr_remove: removing driver
[82295.002091] intel-eth-pci 0000:00:1d.1 eth0: stmmac_dvr_remove: removing driver

Therefore, we delay the serdes power-down to be after unregister_netdev()
which triggers the VLAN filter delete.

Fixes: b9663b7ca6ff ("net: stmmac: Enable SERDES power up/down sequence")
Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 0eba44e9c1f8..208cae344ffa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5249,13 +5249,16 @@ int stmmac_dvr_remove(struct device *dev)
 	netdev_info(priv->dev, "%s: removing driver", __func__);
 
 	stmmac_stop_all_dma(priv);
+	stmmac_mac_set(priv, priv->ioaddr, false);
+	netif_carrier_off(ndev);
+	unregister_netdev(ndev);
 
+	/* Serdes power down needs to happen after VLAN filter
+	 * is deleted that is triggered by unregister_netdev().
+	 */
 	if (priv->plat->serdes_powerdown)
 		priv->plat->serdes_powerdown(ndev, priv->plat->bsp_priv);
 
-	stmmac_mac_set(priv, priv->ioaddr, false);
-	netif_carrier_off(ndev);
-	unregister_netdev(ndev);
 #ifdef CONFIG_DEBUG_FS
 	stmmac_exit_fs(ndev);
 #endif
-- 
2.17.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
