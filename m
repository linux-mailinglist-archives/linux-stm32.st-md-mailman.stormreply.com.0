Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 249246B70C7
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 09:02:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1D5DC6A5E7;
	Mon, 13 Mar 2023 08:02:40 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64183C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 08:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678694558; x=1710230558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uhBtqsa1AIy5YV1rBDSt/rXxAQ/955DS3N8XQfdem04=;
 b=bLH847Fnt36QB0/bxOPCo1Fv15WiJM0zP8udmCjx0lX9QEPqfX/WRdYw
 +nPlER2K9xNrsWIyhgTNB5Ib0Asx2jTH3p2C6aqk5cqBNdaoAh6DkErvU
 +XhBhSnKSRjoG6R+YaMVpJk5qim/Y8mWol3pqg6gRQ9Wo9cgW5I5eZvNX
 kfhTp3avWM57zvEOq417jCeF8v6o72zok6zIl/wzUvKFunWr4Dh6c6KDw
 rGb8+39GNjLkygNFUYNZKedVlpKV6R3yJg9yksOu8epchiGcUpxEblXKz
 yngrdny8UcITxcGWRLu8pRJQI3PUI91pDX0t4PkahS5hj/Cb/SSYTBM6h w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="337107426"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="337107426"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 01:02:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="747518016"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="747518016"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by fmsmga004.fm.intel.com with ESMTP; 13 Mar 2023 01:02:14 -0700
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 13 Mar 2023 16:01:35 +0800
Message-Id: <20230313080135.2952774-3-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230313080135.2952774-1-michael.wei.hong.sit@intel.com>
References: <20230313080135.2952774-1-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Cc: Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Voon Weifeng <weifeng.voon@intel.com>
Subject: [Linux-stm32] [PATCH net 2/2] net: stmmac: move fixed-link support
	fixup code
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

xpcs_an_inband value is updated in the speed_mode_2500 function
which turns on the xpcs_an_inband mode.

Moving the fixed-link fixup code to right before phylink setup to
ensure no more fixup will affect the fixed-link mode configurations.

Fixes: 72edaf39fc65 ("stmmac: intel: add phy-mode and fixed-link ACPI _DSD setting support")
Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 11 -----------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 7deb1f817dac..d02db2b529b9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -592,17 +592,6 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 		plat->mdio_bus_data->xpcs_an_inband = true;
 	}
 
-	/* For fixed-link setup, we clear xpcs_an_inband */
-	if (fwnode) {
-		struct fwnode_handle *fixed_node;
-
-		fixed_node = fwnode_get_named_child_node(fwnode, "fixed-link");
-		if (fixed_node)
-			plat->mdio_bus_data->xpcs_an_inband = false;
-
-		fwnode_handle_put(fixed_node);
-	}
-
 	/* Ensure mdio bus scan skips intel serdes and pcs-xpcs */
 	plat->mdio_bus_data->phy_mask = 1 << INTEL_MGBE_ADHOC_ADDR;
 	plat->mdio_bus_data->phy_mask |= 1 << INTEL_MGBE_XPCS_ADDR;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 398adcd68ee8..5a9abafba490 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7064,6 +7064,7 @@ int stmmac_dvr_probe(struct device *device,
 		     struct stmmac_resources *res)
 {
 	struct net_device *ndev = NULL;
+	struct fwnode_handle *fwnode;
 	struct stmmac_priv *priv;
 	u32 rxq;
 	int i, ret = 0;
@@ -7306,6 +7307,20 @@ int stmmac_dvr_probe(struct device *device,
 			goto error_xpcs_setup;
 	}
 
+	/* For fixed-link setup, we clear xpcs_an_inband */
+	if (!fwnode)
+		fwnode = dev_fwnode(priv->device);
+
+	if (fwnode) {
+		struct fwnode_handle *fixed_node;
+
+		fixed_node = fwnode_get_named_child_node(fwnode, "fixed-link");
+		if (fixed_node)
+			priv->plat->mdio_bus_data->xpcs_an_inband = false;
+
+		fwnode_handle_put(fixed_node);
+	}
+
 	ret = stmmac_phy_setup(priv);
 	if (ret) {
 		netdev_err(ndev, "failed to setup phy (%d)\n", ret);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
