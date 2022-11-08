Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 727F6622462
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Nov 2022 08:05:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23DBAC65051;
	Wed,  9 Nov 2022 07:05:31 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38E68C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Nov 2022 02:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667873304; x=1699409304;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i/dLpV2uFjEVIuCUEjBPXiMF2Qtt/k5JOyenuO0QQz0=;
 b=kKj/ltE7sMRvYr++WGF0S1+TRBUz2+RyI2Kz7PpFPbmuwgiqy/bHS9rs
 9SQakPFGGgJkC39/5TRTewC720rkjZqtlvUJnjOWIr8c/DPJ3ui1mkyBU
 CQU05Uzus8CCBfT0UYGkUG3IueWrpH4n3/ZVjleY6RUsevqTUDV5Yxezw
 gG8py4y9s9TAGLhKSO7rWnJ3XNl2laYXQsWJf8JM64qCAsEq2MuORWFil
 0CQK7QMone9sg7k50pmaGYrX13QFPB7dXAzS+/mteW9qdr7CdK4r/U92P
 UlUDURTOqHHfjq5A1DW137EeSznEYelgO8reTLGp6HeC2iRcASoZkNheB A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="312366736"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="312366736"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 18:08:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="811064706"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="811064706"
Received: from ganyifangubuntu20-ilbpg12.png.intel.com ([10.88.229.31])
 by orsmga005.jf.intel.com with ESMTP; 07 Nov 2022 18:08:17 -0800
From: Gan Yi Fang <yi.fang.gan@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Gan Yi Fang <yi.fang.gan@intel.com>
Date: Mon,  7 Nov 2022 21:08:11 -0500
Message-Id: <20221108020811.12919-1-yi.fang.gan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Nov 2022 07:05:30 +0000
Cc: Voon Weifeng <weifeng.voon@intel.com>,
 Ling Pei Lee <pei.lee.ling@intel.com>, Looi Hong Aun <hong.aun.looi@intel.com>,
 Tan Tee Min <tee.min.tan@intel.com>,
 Zulkifli Muhammad Husaini <muhammad.husaini.zulkifli@intel.com>,
 Sit Michael Wei Hong <michael.wei.hong.sit@intel.com>
Subject: [Linux-stm32] [PATCH net 1/1] stmmac: intel: Update PCH PTP clock
	rate from 200MHz to 204.8MHz
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

From: "Tan, Tee Min" <tee.min.tan@intel.com>

Current Intel platform has an output of ~976ms interval
when probed on 1 Pulse-per-Second(PPS) hardware pin.

The correct PTP clock frequency for PCH GbE should be 204.8MHz
instead of 200MHz. PSE GbE PTP clock rate remains at 200MHz.

Fixes: 58da0cfa6cf1 ("net: stmmac: create dwmac-intel.c to contain all Intel platform")
Signed-off-by: Ling Pei Lee <pei.lee.ling@intel.com>
Signed-off-by: Tan, Tee Min <tee.min.tan@intel.com>
Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
Signed-off-by: Gan Yi Fang <yi.fang.gan@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 0a2afc1a3124..7deb1f817dac 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -629,7 +629,6 @@ static int ehl_common_data(struct pci_dev *pdev,
 {
 	plat->rx_queues_to_use = 8;
 	plat->tx_queues_to_use = 8;
-	plat->clk_ptp_rate = 200000000;
 	plat->use_phy_wol = 1;
 
 	plat->safety_feat_cfg->tsoee = 1;
@@ -654,6 +653,8 @@ static int ehl_sgmii_data(struct pci_dev *pdev,
 	plat->serdes_powerup = intel_serdes_powerup;
 	plat->serdes_powerdown = intel_serdes_powerdown;
 
+	plat->clk_ptp_rate = 204800000;
+
 	return ehl_common_data(pdev, plat);
 }
 
@@ -667,6 +668,8 @@ static int ehl_rgmii_data(struct pci_dev *pdev,
 	plat->bus_id = 1;
 	plat->phy_interface = PHY_INTERFACE_MODE_RGMII;
 
+	plat->clk_ptp_rate = 204800000;
+
 	return ehl_common_data(pdev, plat);
 }
 
@@ -683,6 +686,8 @@ static int ehl_pse0_common_data(struct pci_dev *pdev,
 	plat->bus_id = 2;
 	plat->addr64 = 32;
 
+	plat->clk_ptp_rate = 200000000;
+
 	intel_mgbe_pse_crossts_adj(intel_priv, EHL_PSE_ART_MHZ);
 
 	return ehl_common_data(pdev, plat);
@@ -722,6 +727,8 @@ static int ehl_pse1_common_data(struct pci_dev *pdev,
 	plat->bus_id = 3;
 	plat->addr64 = 32;
 
+	plat->clk_ptp_rate = 200000000;
+
 	intel_mgbe_pse_crossts_adj(intel_priv, EHL_PSE_ART_MHZ);
 
 	return ehl_common_data(pdev, plat);
@@ -757,7 +764,7 @@ static int tgl_common_data(struct pci_dev *pdev,
 {
 	plat->rx_queues_to_use = 6;
 	plat->tx_queues_to_use = 4;
-	plat->clk_ptp_rate = 200000000;
+	plat->clk_ptp_rate = 204800000;
 	plat->speed_mode_2500 = intel_speed_mode_2500;
 
 	plat->safety_feat_cfg->tsoee = 1;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
