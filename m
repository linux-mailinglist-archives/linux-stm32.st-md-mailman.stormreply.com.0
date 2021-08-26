Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 018073F910C
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Aug 2021 01:46:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABB6FC597B3;
	Thu, 26 Aug 2021 23:46:10 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEC28C57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Aug 2021 23:46:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="278877495"
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="278877495"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 16:46:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="426956326"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga003.jf.intel.com with ESMTP; 26 Aug 2021 16:46:06 -0700
Received: from glass.png.intel.com (glass.png.intel.com [10.158.65.69])
 by linux.intel.com (Postfix) with ESMTP id A38D15808BB;
 Thu, 26 Aug 2021 16:46:02 -0700 (PDT)
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Heiner Kallweit <hkallweit1@gmail.com>
Date: Fri, 27 Aug 2021 07:51:34 +0800
Message-Id: <20210826235134.4051310-3-vee.khee.wong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826235134.4051310-1-vee.khee.wong@linux.intel.com>
References: <20210826235134.4051310-1-vee.khee.wong@linux.intel.com>
MIME-Version: 1.0
Cc: Voon Weifeng <weifeng.voon@intel.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, linux-kernel@vger.kernel.org,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 2/2] stmmac: intel: Enable 2.5Gbps
	on Intel AlderLake-S
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

Intel AlderLake-S platform is capable of 2.5Gbps link speed.

This patch enables the 2.5Gbps link speed by adding the callback
function in the AlderLake-S PCI info struct.

Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 8e8778cfbbad..c1db7e53e78f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -770,6 +770,8 @@ static int adls_sgmii_phy0_data(struct pci_dev *pdev,
 {
 	plat->bus_id = 1;
 	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
+	plat->speed_mode_2500 = intel_speed_mode_2500;
+	plat->skip_xpcs_soft_reset = 1;
 
 	/* SerDes power up and power down are done in BIOS for ADL */
 
@@ -785,6 +787,8 @@ static int adls_sgmii_phy1_data(struct pci_dev *pdev,
 {
 	plat->bus_id = 2;
 	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
+	plat->speed_mode_2500 = intel_speed_mode_2500;
+	plat->skip_xpcs_soft_reset = 1;
 
 	/* SerDes power up and power down are done in BIOS for ADL */
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
