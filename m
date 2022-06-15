Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B774B54C3CC
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jun 2022 10:44:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B85FC5EC56;
	Wed, 15 Jun 2022 08:44:06 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D52AEC5E2C6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jun 2022 08:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655282644; x=1686818644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YKMttFBPE2wCzfsgWycExPpf2Tu2U5inMYPLhQKTMdY=;
 b=GsAuWFUWVO2Wt/rUyVT+jqaEIM6K4PDL2BOk/tKWhCiRf5IbsanivMdG
 nKHvfJmzNOJzEq8JvzcKm7njHQ/kdvP32tBbVnUCzdvSRXVMm0E86OeDk
 bgpcDQzaus6re0pzxOzfP8vWkt+BXaZc33RcXlrMJnkAGv2HHIzdM0N3q
 gygdOtvY5Gqn9LfU25UIhAGFPaqpMn2OhWZjEqlwvkpqe17s+MtsniBAR
 TUfNuZ45MXR+q1nVv7+qPEaVEC4uDh4a9o3wSx7zx44lLWaOQxhSQyxvG
 xx6js5BGWsbGXtgCirRJTTKNVf3AmhWWzOYDgBwVWpZXp8r8DJrPMlU/V A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="258736914"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="258736914"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 01:44:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="712849391"
Received: from p12hl98bong5.png.intel.com ([10.158.65.178])
 by orsmga004.jf.intel.com with ESMTP; 15 Jun 2022 01:43:58 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Wed, 15 Jun 2022 16:39:05 +0800
Message-Id: <20220615083908.1651975-3-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220615083908.1651975-1-boon.leong.ong@intel.com>
References: <20220615083908.1651975-1-boon.leong.ong@intel.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Emilio Riva <emilio.riva@ericsson.com>,
 linux-kernel@vger.kernel.org, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v5 2/5] stmmac: intel: prepare to
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

Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 38fe77d1035..675dfb89b76 100644
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
@@ -562,7 +561,8 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
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
