Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CB833AAB5
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Mar 2021 06:23:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D2C3C57B55;
	Mon, 15 Mar 2021 05:23:49 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16EA1C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 05:23:46 +0000 (UTC)
IronPort-SDR: K1iQxCYCrCbxmIfUNyu23osZRMHLhz6i2ujaCnpxsg4alpfN7hDzL+AG+CexkGtaSTsSMn0QDP
 DFq8bJu9J9BA==
X-IronPort-AV: E=McAfee;i="6000,8403,9923"; a="274079742"
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; d="scan'208";a="274079742"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2021 22:23:46 -0700
IronPort-SDR: 1/cAsenCU0xICtIZHqEUWJfj1qU+rtF40TXR/wZ2gHHEdcPog4//sxMppSSwzhQ1W68iGh3uAw
 UfKQAPToILQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; d="scan'208";a="373313777"
Received: from glass.png.intel.com ([10.158.65.59])
 by orsmga006.jf.intel.com with ESMTP; 14 Mar 2021 22:23:42 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King i <linux@armlinux.org.uk>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Mon, 15 Mar 2021 13:27:09 +0800
Message-Id: <20210315052711.16728-5-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315052711.16728-1-boon.leong.ong@intel.com>
References: <20210315052711.16728-1-boon.leong.ong@intel.com>
MIME-Version: 1.0
Cc: Fugang Duan <fugang.duan@nxp.com>, Voon Weifeng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 4/6] net: stmmac: make in-band AN
	mode parsing is supported for non-DT
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

Not all platform uses DT, so phylink_parse_mode() will skip in-band setup
of pl->supported and pl->link_config.advertising entirely. So, we add the
setting of ovr_an_inband flag to make it works for non-DT platform.

Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
 include/linux/stmmac.h                            | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 208cae344ffa..b64ee029d41f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1117,6 +1117,8 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	priv->phylink_config.dev = &priv->dev->dev;
 	priv->phylink_config.type = PHYLINK_NETDEV;
 	priv->phylink_config.pcs_poll = true;
+	priv->phylink_config.ovr_an_inband =
+		priv->plat->mdio_bus_data->xpcs_an_inband;
 
 	if (!fwnode)
 		fwnode = dev_fwnode(priv->device);
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index a302982de2d7..722dc167b5c9 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -81,6 +81,7 @@
 struct stmmac_mdio_bus_data {
 	unsigned int phy_mask;
 	unsigned int has_xpcs;
+	unsigned int xpcs_an_inband;
 	int *irqs;
 	int probed_phy_irq;
 	bool needs_reset;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
