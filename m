Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9930654A74F
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jun 2022 05:05:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F339C5F1F1;
	Tue, 14 Jun 2022 03:05:28 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5653C5F1F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jun 2022 03:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655175927; x=1686711927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tk/dObL96dn44VuoBZwZZKZdR9ldP5FCMS13exwOSO0=;
 b=MyhJ5lLGX43mxA0PzPGVpk1YrDb4ZcL7cdm0fAqJbUc2yFv+I52EA5O8
 EHp/pRo8vwn4H/URLNCOkdwaSNUi9lLKnL8Op63kiDg5JSOUJ2ZZ52QMC
 frAGsO586ROdlhUY8o9UT4r74FSlTMkn8V3NoMscV3FzC+zz3HFlneNzu
 oETvrvefIn14o8MVJXGH1d5f3V7EZTRMoEApyBtmnY0eMg3qkLyXOyV28
 u0cci2KiYSKWz95DjlmeB1PNg9t6G9zRvmdzp6nQRWDAuOVtKnFoySGKp
 Ag7Eq/Y7M/a6VCEi0tDbm74dzU346wigFnF14W0+DA6FHb65SrBVlWBwx w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="258315697"
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; d="scan'208";a="258315697"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 20:05:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; d="scan'208";a="761787736"
Received: from p12hl98bong5.png.intel.com ([10.158.65.178])
 by orsmga005.jf.intel.com with ESMTP; 13 Jun 2022 20:05:21 -0700
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
Date: Tue, 14 Jun 2022 11:00:29 +0800
Message-Id: <20220614030030.1249850-5-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614030030.1249850-1-boon.leong.ong@intel.com>
References: <20220614030030.1249850-1-boon.leong.ong@intel.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Emilio Riva <emilio.riva@ericsson.com>,
 linux-kernel@vger.kernel.org, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 4/5] stmmac: intel: add phy-mode
	and fixed-link ACPI _DSD setting support
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

Currently, phy_interface for TSN controller instance is set based on its
PCI Device ID. For SGMII PHY interface, phy_interface default to
PHY_INTERFACE_MODE_SGMII. As C37 AN supports both SGMII and 1000BASE-X
mode, we add support for 'phy-mode' ACPI _DSD for port-specific
and customer platform specific customization.

v2:
For platform that sets 'fixed-link' using ACPI _DSD, we will unset
xpcs_an_inband within stmmac. Thanks to Russell King for his comment in
https://patchwork.kernel.org/comment/24890222/

v1:
Thanks to Andrew Lunn's guidance in
https://patchwork.kernel.org/comment/24827101/

Tested-by: Emilio Riva <emilio.riva@ericsson.com>
Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 675dfb89b76..97b357dd468 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -442,6 +442,7 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 static int intel_mgbe_common_data(struct pci_dev *pdev,
 				  struct plat_stmmacenet_data *plat)
 {
+	struct fwnode_handle *fwnode;
 	char clk_name[20];
 	int ret;
 	int i;
@@ -560,6 +561,20 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	/* Use the last Rx queue */
 	plat->vlan_fail_q = plat->rx_queues_to_use - 1;
 
+	/* For fixed-link setup, we allow phy-mode setting */
+	fwnode = dev_fwnode(&pdev->dev);
+	if (fwnode) {
+		const char *phy_mode;
+
+		if (!fwnode_property_read_string(fwnode, "phy-mode",
+						 &phy_mode)) {
+			if (!strcmp(phy_mode, "sgmii"))
+				plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
+			if (!strcmp(phy_mode, "1000base-x"))
+				plat->phy_interface = PHY_INTERFACE_MODE_1000BASEX;
+		}
+	}
+
 	/* Intel mgbe SGMII interface uses pcs-xcps */
 	if (plat->phy_interface == PHY_INTERFACE_MODE_SGMII ||
 	    plat->phy_interface == PHY_INTERFACE_MODE_1000BASEX) {
@@ -567,6 +582,17 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 		plat->mdio_bus_data->xpcs_an_inband = true;
 	}
 
+	/* For fixed-link setup, we clear xpcs_an_inband */
+	if (fwnode) {
+		struct fwnode_handle *fixed_node;
+
+		fixed_node = fwnode_get_named_child_node(fwnode, "fixed-link");
+		if (fixed_node)
+			plat->mdio_bus_data->xpcs_an_inband = false;
+
+		fwnode_handle_put(fixed_node);
+	}
+
 	/* Ensure mdio bus scan skips intel serdes and pcs-xpcs */
 	plat->mdio_bus_data->phy_mask = 1 << INTEL_MGBE_ADHOC_ADDR;
 	plat->mdio_bus_data->phy_mask |= 1 << INTEL_MGBE_XPCS_ADDR;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
