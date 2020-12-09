Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DFE2D4E49
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Dec 2020 23:43:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05E0CC3FADB;
	Wed,  9 Dec 2020 22:43:47 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D33A2C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Dec 2020 22:43:44 +0000 (UTC)
IronPort-SDR: d8enOv5/u5aIpg+ceiyPED2S0AmKYV6bmB16B815XOBnlvf7p9840nZCVTbXjRohv9yZ+4Mh4p
 t42Gl6QeQ3zA==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="161210183"
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="161210183"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 14:43:42 -0800
IronPort-SDR: CvYUj1NyjNZmuLu6KhWt70IfCjm+TvOwdSLHpjCAh8vwPJux9UaI0JDKbQtf8RqfdQpQFZoW4+
 cxQHwu3hNmdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="484179333"
Received: from unknown (HELO glass.png.intel.com) ([10.158.65.144])
 by orsmga004.jf.intel.com with ESMTP; 09 Dec 2020 14:43:39 -0800
From: Wong Vee Khee <vee.khee.wong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu, 10 Dec 2020 06:47:00 +0800
Message-Id: <20201209224700.30295-1-vee.khee.wong@intel.com>
X-Mailer: git-send-email 2.17.0
Cc: Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 net-next 1/1] net: stmmac: allow stmmac to
	probe for C45 PHY devices
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

Assign stmmac's mdio_bus probe capabilities to MDIOBUS_C22_C45.
This extended the probing of C45 PHY devices on the MDIO bus.

Signed-off-by: Wong Vee Khee <vee.khee.wong@intel.com>
---
v2 changelog:
- Added conditional check for gmac4.
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index b2a707e2ef43..d64116e0543e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -365,6 +365,9 @@ int stmmac_mdio_register(struct net_device *ndev)
 
 	new_bus->name = "stmmac";
 
+	if (priv->plat->has_gmac4)
+		new_bus->probe_capabilities = MDIOBUS_C22_C45;
+
 	if (priv->plat->has_xgmac) {
 		new_bus->read = &stmmac_xgmac2_mdio_read;
 		new_bus->write = &stmmac_xgmac2_mdio_write;
-- 
2.17.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
