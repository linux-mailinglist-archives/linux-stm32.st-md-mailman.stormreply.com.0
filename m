Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FAB50B1C6
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Apr 2022 09:39:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC89BC6049A;
	Fri, 22 Apr 2022 07:39:41 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26604C60492
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 07:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650613180; x=1682149180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZAM//25jc969fXPpRmMZdTy2q65l1lpKHITyK900QMQ=;
 b=nTCvGj8tAp3hDxnty5LtFbrs7dgv+tFG7VLnJsjhvEgypm3ZUWR/qhpi
 mbOH0GWG3b3dEy/ziLWdfqmTuK4sJGjd7tGP9/7LZWoFf2v1g8gw234RB
 TFdtUxeZZwq4CcSovSfNrXMRx+7MhH5sIPm1TrPVLhmJaHagg3feJzm0P
 qbbj81vyp6adbBTmOio7leQfqdNMNpIZxsisSGDKjTJovsp7BoTgJJFcF
 Xt/jhbHBinKCfRfQyebQbgS3Ujd9zyiaU1S4PWLYNMbwIe5uKEykyNMwu
 lCVt9We4/K7hEG0j+1IcSuAQrsLrfX5pP/yscnWWctUrDuZJHnl1wQKkI A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="289724700"
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="289724700"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 00:39:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="648516342"
Received: from p12hl98bong5.png.intel.com ([10.158.65.178])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Apr 2022 00:39:36 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Fri, 22 Apr 2022 15:35:04 +0800
Message-Id: <20220422073505.810084-4-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422073505.810084-1-boon.leong.ong@intel.com>
References: <20220422073505.810084-1-boon.leong.ong@intel.com>
MIME-Version: 1.0
Cc: Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 3/4] stmmac: intel: prepare to
	support 1000BASE-X phy interface setting
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

Currently, intel_speed_mode_2500() redundantly fix-up phy_interface to
PHY_INTERFACE_MODE_SGMII if the underlying controller is in 1000Mbps
SGMII mode. The value of phy_interface has been initialized earlier.

This patch removes such redundancy to prepare for setting 1000BASE-X
mode for certain hardware platform configuration.

Also update the intel_mgbe_common_data() to include 1000BASE-X setup.

Tested-by: Emilio Riva <emilio.riva@ericsson.com>
Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 63754a9c4ba..265d39acdd0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -251,7 +251,6 @@ static void intel_speed_mode_2500(struct net_device *ndev, void *intel_data)
 		priv->plat->mdio_bus_data->xpcs_an_inband = false;
 	} else {
 		priv->plat->max_speed = 1000;
-		priv->plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
 		priv->plat->mdio_bus_data->xpcs_an_inband = true;
 	}
 }
@@ -561,7 +560,8 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	plat->vlan_fail_q = plat->rx_queues_to_use - 1;
 
 	/* Intel mgbe SGMII interface uses pcs-xcps */
-	if (plat->phy_interface == PHY_INTERFACE_MODE_SGMII) {
+	if (plat->phy_interface == PHY_INTERFACE_MODE_SGMII ||
+	    plat->phy_interface == PHY_INTERFACE_MODE_1000BASEX) {
 		plat->mdio_bus_data->has_xpcs = true;
 		plat->mdio_bus_data->xpcs_an_inband = true;
 	}
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
