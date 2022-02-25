Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E13FD4C3BB6
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Feb 2022 03:27:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A0AEC60463;
	Fri, 25 Feb 2022 02:27:13 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05AE3C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Feb 2022 02:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645756032; x=1677292032;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pGMxtqj6fQbBiqvL8b0jEE020+1PJHR6Ska29JmSylg=;
 b=EGgmTW5Be/XjEGt3AqyNcO1SGlorA50UaGvdfdbAK/rgK/qoO9PRwlEy
 x8b/H3LfPwJm1AWu53N2laCdxL2t7ovbfBwpZwx1J6XOh4ed6sf5q023f
 nHjTLv9v3amodZkT/49h8aP8GRsj5oGskoE9pIS9KzxjS/4YpirN2cOTN
 SJ6VA1x0MhKKWoOQnezqVX3PKytBmlCVilYOus+B5rSbvvmW7ZdtoHIlN
 Iu8vZ5TjEfN6zN89IysbOynE8hSUOmfibSaUHDPuO0GXgC3A1hTwA9OYU
 B9pr8dXxPLjrtsDw12mxmvQgA7vYXyYJmcNyqtC9D/htw3UTh3rVBvcqK w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252322840"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="252322840"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 18:27:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="509107432"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga006.jf.intel.com with ESMTP; 24 Feb 2022 18:27:09 -0800
Received: from P12HL01TMIN.png.intel.com (P12HL01TMIN.png.intel.com
 [10.158.65.75])
 by linux.intel.com (Postfix) with ESMTP id CC0B5580A6C;
 Thu, 24 Feb 2022 18:27:06 -0800 (PST)
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri, 25 Feb 2022 10:33:25 +0800
Message-Id: <20220225023325.474242-1-vee.khee.wong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/1] stmmac: intel: Enable 2.5Gbps
	for Intel AlderLake-S
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

Intel AlderLake-S platform is capable of running on 2.5GBps link speed.

This patch enables 2.5Gbps link speed on AlderLake-S platform.

Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 5943ff9f21c2..32ef3df4e266 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -721,6 +721,7 @@ static int tgl_common_data(struct pci_dev *pdev,
 	plat->rx_queues_to_use = 6;
 	plat->tx_queues_to_use = 4;
 	plat->clk_ptp_rate = 200000000;
+	plat->speed_mode_2500 = intel_speed_mode_2500;
 
 	plat->safety_feat_cfg->tsoee = 1;
 	plat->safety_feat_cfg->mrxpee = 0;
@@ -740,7 +741,6 @@ static int tgl_sgmii_phy0_data(struct pci_dev *pdev,
 {
 	plat->bus_id = 1;
 	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
-	plat->speed_mode_2500 = intel_speed_mode_2500;
 	plat->serdes_powerup = intel_serdes_powerup;
 	plat->serdes_powerdown = intel_serdes_powerdown;
 	return tgl_common_data(pdev, plat);
@@ -755,7 +755,6 @@ static int tgl_sgmii_phy1_data(struct pci_dev *pdev,
 {
 	plat->bus_id = 2;
 	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
-	plat->speed_mode_2500 = intel_speed_mode_2500;
 	plat->serdes_powerup = intel_serdes_powerup;
 	plat->serdes_powerdown = intel_serdes_powerdown;
 	return tgl_common_data(pdev, plat);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
