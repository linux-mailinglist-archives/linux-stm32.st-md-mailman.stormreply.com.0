Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C353B6CD0
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jun 2021 05:10:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD3AFC59781;
	Tue, 29 Jun 2021 03:10:39 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1E30C57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jun 2021 03:10:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="208113490"
X-IronPort-AV: E=Sophos;i="5.83,307,1616482800"; d="scan'208";a="208113490"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 20:10:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,307,1616482800"; d="scan'208";a="558597311"
Received: from peileeli.png.intel.com ([172.30.240.12])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2021 20:10:32 -0700
From: Ling Pei Lee <pei.lee.ling@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, davem@davemloft.net,
 Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, weifeng.voon@intel.com,
 boon.leong.ong@intel.com, vee.khee.wong@linux.intel.com,
 vee.khee.wong@intel.com, tee.min.tan@intel.com,
 michael.wei.hong.sit@intel.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 29 Jun 2021 11:08:58 +0800
Message-Id: <20210629030859.1273157-3-pei.lee.ling@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629030859.1273157-1-pei.lee.ling@intel.com>
References: <20210629030859.1273157-1-pei.lee.ling@intel.com>
MIME-Version: 1.0
Cc: pei.lee.ling@intel.com
Subject: [Linux-stm32] [PATCH net-next V2 2/3] stmmac: intel: Enable PHY WOL
	option in EHL
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

Enable PHY Wake On LAN in Intel EHL Intel platform.
PHY Wake on LAN option is enabled due to
Intel EHL Intel platform is designed for
PHY Wake On LAN but not MAC Wake On LAN.

Signed-off-by: Ling Pei Lee <pei.lee.ling@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 2ecf93c84b9d..73be34a10a4c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -567,6 +567,7 @@ static int ehl_common_data(struct pci_dev *pdev,
 	plat->rx_queues_to_use = 8;
 	plat->tx_queues_to_use = 8;
 	plat->clk_ptp_rate = 200000000;
+	plat->use_phy_wol = 1;
 
 	plat->safety_feat_cfg->tsoee = 1;
 	plat->safety_feat_cfg->mrxpee = 1;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
