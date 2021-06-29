Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 201C43B6CD1
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jun 2021 05:10:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE2DCC59784;
	Tue, 29 Jun 2021 03:10:45 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F488C59781
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jun 2021 03:10:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="188454199"
X-IronPort-AV: E=Sophos;i="5.83,307,1616482800"; d="scan'208";a="188454199"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 20:10:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,307,1616482800"; d="scan'208";a="558597330"
Received: from peileeli.png.intel.com ([172.30.240.12])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2021 20:10:37 -0700
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
Date: Tue, 29 Jun 2021 11:08:59 +0800
Message-Id: <20210629030859.1273157-4-pei.lee.ling@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629030859.1273157-1-pei.lee.ling@intel.com>
References: <20210629030859.1273157-1-pei.lee.ling@intel.com>
MIME-Version: 1.0
Cc: pei.lee.ling@intel.com
Subject: [Linux-stm32] [PATCH net-next V2 3/3] stmmac: intel: set PCI_D3hot
	in suspend
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

From: Voon Weifeng <weifeng.voon@intel.com>

During suspend, set the Intel mgbe to D3hot state
to save power consumption.

Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
Signed-off-by: Ling Pei Lee <pei.lee.ling@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 73be34a10a4c..69a725b661c2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -1088,6 +1088,7 @@ static int __maybe_unused intel_eth_pci_suspend(struct device *dev)
 		return ret;
 
 	pci_wake_from_d3(pdev, true);
+	pci_set_power_state(pdev, PCI_D3hot);
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
