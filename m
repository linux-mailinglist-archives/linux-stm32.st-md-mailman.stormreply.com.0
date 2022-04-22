Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0974850B1C7
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Apr 2022 09:39:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1CDAC6049A;
	Fri, 22 Apr 2022 07:39:46 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6584DC60492
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 07:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650613184; x=1682149184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nEPLMdPCwdmEFgscrfAJ4fkH252LE7MCcUu/Flr5Wyo=;
 b=KRL6b1c08o3WhP49iFpvxZvh/oo27ktqvdonf1eDV7zNspTgrycVHkYi
 jeW3/ddCNkBNaglWiceu0c8WcNHPJ77iOCul4gAzOFJ30Gbd2IEYLGyVF
 svfkDSyUm37olkbPG7N3svStxqbjrkbTGJ7mTHSXtKjE5afP/gWpXlDVv
 hvV9YvUmEWzJSLwHstq5z+hnhUwl1kcBx+E+byaHPbyqhPYKiAVTnEyPS
 JgDUkUBapDcbh7Jtl+48bu+l/eFQslDfMTrVbzfHqUJH3ISWKyvGeWVPT
 /l8e+DHyg7uguixFjsfKcomWBNofITErHRNtZsTRDMtHd1e4sVqTjJUNB A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="289724706"
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="289724706"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 00:39:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="648516353"
Received: from p12hl98bong5.png.intel.com ([10.158.65.178])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Apr 2022 00:39:39 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Fri, 22 Apr 2022 15:35:05 +0800
Message-Id: <20220422073505.810084-5-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422073505.810084-1-boon.leong.ong@intel.com>
References: <20220422073505.810084-1-boon.leong.ong@intel.com>
MIME-Version: 1.0
Cc: Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 4/4] stmmac: intel: introduce
	platform data phyless setting for Ericsson system
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

Certain platform wants specific GbE controller instance to be in PHY-less
mode, i.e. to be used for 1000BASE-X connection for network switch.

Tested-by: Emilio Riva <emilio.riva@ericsson.com>
Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 265d39acdd0..9c9577fc15d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -24,6 +24,8 @@ struct intel_priv_data {
 struct stmmac_pci_func_data {
 	unsigned int func;
 	int phy_addr;
+	phy_interface_t phy_interface;
+	unsigned int phyless;
 };
 
 struct stmmac_pci_dmi_data {
@@ -439,10 +441,65 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 	plat->rx_queues_cfg[0].pkt_route = 0x0;
 }
 
+static const struct stmmac_pci_func_data ericsson_phyless_func_data[] = {
+	{
+		.func = 2,
+		.phy_interface = PHY_INTERFACE_MODE_1000BASEX,
+		.phyless = true,
+	},
+};
+
+static const struct stmmac_pci_dmi_data ericsson_phyless_dmi_data = {
+	.func = ericsson_phyless_func_data,
+	.nfuncs = ARRAY_SIZE(ericsson_phyless_func_data),
+};
+
+static const struct dmi_system_id intel_mgbe_pci_dmi[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Ericsson"),
+			DMI_MATCH(DMI_BOARD_NAME, "SMARC-SXEL"),
+		},
+		.driver_data = (void *)&ericsson_phyless_dmi_data,
+	},
+	{}
+};
+
+static bool stmmac_pci_find_phyless(struct pci_dev *pdev,
+				    const struct dmi_system_id *dmi_list,
+				    phy_interface_t *phy_interface,
+				    unsigned int *phyless)
+{
+	const struct stmmac_pci_func_data *func_data;
+	const struct stmmac_pci_dmi_data *dmi_data;
+	const struct dmi_system_id *dmi_id;
+	int func = PCI_FUNC(pdev->devfn);
+	size_t n;
+
+	dmi_id = dmi_first_match(dmi_list);
+	if (!dmi_id)
+		return false;
+
+	dmi_data = dmi_id->driver_data;
+	func_data = dmi_data->func;
+
+	for (n = 0; n < dmi_data->nfuncs; n++, func_data++)
+		if (func_data->func == func) {
+			*phy_interface = func_data->phy_interface;
+			*phyless = func_data->phyless;
+			return true;
+		}
+
+	return false;
+}
+
 static int intel_mgbe_common_data(struct pci_dev *pdev,
 				  struct plat_stmmacenet_data *plat)
 {
+	phy_interface_t phy_interface;
+	unsigned int phyless;
 	char clk_name[20];
+	bool found;
 	int ret;
 	int i;
 
@@ -559,6 +616,13 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	/* Use the last Rx queue */
 	plat->vlan_fail_q = plat->rx_queues_to_use - 1;
 
+	found = stmmac_pci_find_phyless(pdev, intel_mgbe_pci_dmi,
+					&phy_interface, &phyless);
+	if (found) {
+		plat->mdio_bus_data->phyless = phyless;
+		plat->phy_interface = phy_interface;
+	}
+
 	/* Intel mgbe SGMII interface uses pcs-xcps */
 	if (plat->phy_interface == PHY_INTERFACE_MODE_SGMII ||
 	    plat->phy_interface == PHY_INTERFACE_MODE_1000BASEX) {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
