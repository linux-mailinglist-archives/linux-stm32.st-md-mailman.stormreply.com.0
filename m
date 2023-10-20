Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D16D7D06D6
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Oct 2023 05:28:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2A0DC6907A;
	Fri, 20 Oct 2023 03:28:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4681C65068
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Oct 2023 03:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697772531; x=1729308531;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=96Gky6mpZZHpzgNi964Tps4EK4L+Pft4fZHmTBB7PZs=;
 b=coa3sqdvkAoHGze7qCd6Z+oxy4efl3DjUTgPW2x3CneLKUu4/HanJXZ2
 SZgNzQS8ozjAkmEGzeo2mLSudcqqy6Z4LNPPsGd+t26dPYZcOTY+wlNWH
 dh8Kzy4fQgicrlbSBL+s+1dm0rPZyashRV9LLE08IEM+hZhQMSEQdi9ma
 seZa/oBY/ZmMxlM+tS5cfGd9Ksv/LecVsRQ7gpwnMoM+RUDm2+qWhUnfD
 YI6LSc1J6YsSVcJtxoxw9R9hiy+vCbvHHE4nK+g5UkwCoLpxTkW+1wgaP
 /k90F0oPvzk2oJtvPGme+cKwNCmPLPorMf+VUrVBxWEB+99suSNvUD6JV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="472645909"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="472645909"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 20:28:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="827592040"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="827592040"
Received: from ssid-ilbpg3-teeminta.png.intel.com ([10.88.227.74])
 by fmsmga004.fm.intel.com with ESMTP; 19 Oct 2023 20:28:45 -0700
From: Gan Yi Fang <yi.fang.gan@intel.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 20 Oct 2023 11:25:35 +0800
Message-Id: <20231020032535.1777746-1-yi.fang.gan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Gan Yi Fang <yi.fang.gan@intel.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>
Subject: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: update MAC
	capabilities when tx queues are updated
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

From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>

Upon boot up, the driver will configure the MAC capabilities based on
the maximum number of tx and rx queues. When the user changes the
tx queues to single queue, the MAC should be capable of supporting Half
Duplex, but the driver does not update the MAC capabilities when it is
configured so.

Using the stmmac_reinit_queues() to check the number of tx queues
and set the MAC capabilities accordingly.

Fixes: 0366f7e06a6b ("net: stmmac: add ethtool support for get/set channels")
Cc: <stable@vger.kernel.org> # 5.17+
Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Signed-off-by: Gan, Yi Fang <yi.fang.gan@intel.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c   | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ed1a5a31a491..5801f4d50f95 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1197,6 +1197,17 @@ static int stmmac_init_phy(struct net_device *dev)
 	return ret;
 }
 
+static void stmmac_set_half_duplex(struct stmmac_priv *priv)
+{
+	/* Half-Duplex can only work with single tx queue */
+	if (priv->plat->tx_queues_to_use > 1)
+		priv->phylink_config.mac_capabilities &=
+			~(MAC_10HD | MAC_100HD | MAC_1000HD);
+	else
+		priv->phylink_config.mac_capabilities |=
+			(MAC_10HD | MAC_100HD | MAC_1000HD);
+}
+
 static int stmmac_phy_setup(struct stmmac_priv *priv)
 {
 	struct stmmac_mdio_bus_data *mdio_bus_data;
@@ -1228,10 +1239,7 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 						MAC_10FD | MAC_100FD |
 						MAC_1000FD;
 
-	/* Half-Duplex can only work with single queue */
-	if (priv->plat->tx_queues_to_use <= 1)
-		priv->phylink_config.mac_capabilities |= MAC_10HD | MAC_100HD |
-							 MAC_1000HD;
+	stmmac_set_half_duplex(priv);
 
 	/* Get the MAC specific capabilities */
 	stmmac_mac_phylink_get_caps(priv);
@@ -7172,6 +7180,7 @@ int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt)
 			priv->rss.table[i] = ethtool_rxfh_indir_default(i,
 									rx_cnt);
 
+	stmmac_set_half_duplex(priv);
 	stmmac_napi_add(dev);
 
 	if (netif_running(dev))
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
