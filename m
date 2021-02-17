Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F55831D71E
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Feb 2021 10:53:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FE51C5718D;
	Wed, 17 Feb 2021 09:53:26 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 626A2C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Feb 2021 09:53:19 +0000 (UTC)
IronPort-SDR: layHwtQl45GOjj7olA00NZNkIxN39tUkGinn2TO56+L24E3bwuZfA13Tk8KhbakKFnmsfEtTpo
 Lg5tHlSJJ3ZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="183279701"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="183279701"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 01:53:16 -0800
IronPort-SDR: dX9qS/mBPVuRlhyR92/GwDld8pE4SCeO/Q2gieLHME5cB1d7vIm6tSK+qkyus4IgLVk5ZsZ7A/
 0cQlIXue7ivA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="589549452"
Received: from glass.png.intel.com ([10.158.65.51])
 by fmsmga006.fm.intel.com with ESMTP; 17 Feb 2021 01:53:13 -0800
From: Wong Vee Khee <vee.khee.wong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Wed, 17 Feb 2021 17:57:05 +0800
Message-Id: <20210217095705.13806-1-vee.khee.wong@intel.com>
X-Mailer: git-send-email 2.17.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: Add PCI bus info to
	ethtool driver query output
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

This patch populates the PCI bus info in the ethtool driver query data.

Users will be able to view PCI bus info using 'ethtool -i <interface>'.

Signed-off-by: Wong Vee Khee <vee.khee.wong@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c    | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 4 ++++
 include/linux/stmmac.h                               | 1 +
 3 files changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 1c9c67b641a2..751dfdeec41c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -236,6 +236,7 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	int ret;
 	int i;
 
+	plat->pdev = pdev;
 	plat->phy_addr = -1;
 	plat->clk_csr = 5;
 	plat->has_gmac = 0;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 9e54f953634b..c5642985ef95 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -268,6 +268,10 @@ static void stmmac_ethtool_getdrvinfo(struct net_device *dev,
 		strlcpy(info->driver, MAC100_ETHTOOL_NAME,
 			sizeof(info->driver));
 
+	if (priv->plat->pdev) {
+		strlcpy(info->bus_info, pci_name(priv->plat->pdev),
+			sizeof(info->bus_info));
+	}
 	strlcpy(info->version, DRV_MODULE_VERSION, sizeof(info->version));
 }
 
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 15ca6b4167cc..a302982de2d7 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -202,5 +202,6 @@ struct plat_stmmacenet_data {
 	bool vlan_fail_q_en;
 	u8 vlan_fail_q;
 	unsigned int eee_usecs_rate;
+	struct pci_dev *pdev;
 };
 #endif
-- 
2.17.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
