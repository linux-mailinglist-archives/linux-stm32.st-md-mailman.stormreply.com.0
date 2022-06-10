Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDE3545A8E
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jun 2022 05:34:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E154C5F1D7;
	Fri, 10 Jun 2022 03:34:55 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9F58C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 03:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654832093; x=1686368093;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5EE9Irt/xFP6OZxqCU9pzSV6Tdyhia7NhlBMrgRnlk4=;
 b=IbOR9fCNTTsS0xGeiD6r4L2nz2UO887A8t2rvztFzJVjl0iA57dHYHtE
 46Luqn0zFffkR86Si8naaRwh/QKh3fq1BTA45FphGYPzMM/weiuUJ5yYJ
 e9PhDV/kYSXnkavPtSPKdM7Zd534wdMx46lCMu5ho+5mcLrhRdfSg+l1P
 I00W6cl0IUGjMilaU71tqTuqGHb76mWXYqMQ94+JoKaMtOsHeYmhtfj8D
 /YZ8mCB/lvbaVUPH9Yp2ttLFchMZ/7XOT/I6o+iJzUUF6mrBjZJUb3hQP
 g97Fxf3PYOVizO/i0fQIrUkqt+1RdW6I8EpoNDGdYt6MShMtLcdagqkeq A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278304373"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="278304373"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 20:34:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="585971667"
Received: from p12hl98bong5.png.intel.com ([10.158.65.178])
 by fmsmga007.fm.intel.com with ESMTP; 09 Jun 2022 20:34:49 -0700
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
Date: Fri, 10 Jun 2022 11:29:40 +0800
Message-Id: <20220610032941.113690-6-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610032941.113690-1-boon.leong.ong@intel.com>
References: <20220610032941.113690-1-boon.leong.ong@intel.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Emilio Riva <emilio.riva@ericsson.com>,
 linux-kernel@vger.kernel.org, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 5/6] stmmac: intel: add phy-mode
	ACPI _DSD setting support
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

Thanks to Andrew Lunn's guidance in
https://patchwork.kernel.org/comment/24827101/

Tested-by: Emilio Riva <emilio.riva@ericsson.com>
Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 675dfb89b76..e5f3d7deec3 100644
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
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
