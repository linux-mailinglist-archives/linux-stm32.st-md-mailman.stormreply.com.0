Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7FD3ED13C
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Aug 2021 11:48:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF41FC5A4D3;
	Mon, 16 Aug 2021 09:48:18 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75AFCC57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Aug 2021 06:19:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="215801228"
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="215801228"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2021 23:19:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="678986775"
Received: from vijay.png.intel.com ([10.88.229.73])
 by fmsmga005.fm.intel.com with ESMTP; 15 Aug 2021 23:19:08 -0700
From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
To: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 davem@davemloft.net, kuba@kernel.org, mcoquelin.stm32@gmail.com
Date: Mon, 16 Aug 2021 14:15:58 +0800
Message-Id: <f82f52076841285309a997f849e2786781548538.1629092894.git.vijayakannan.ayyathurai@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1629092894.git.vijayakannan.ayyathurai@intel.com>
References: <cover.1629092894.git.vijayakannan.ayyathurai@intel.com>
In-Reply-To: <cover.1629092894.git.vijayakannan.ayyathurai@intel.com>
References: <cover.1629092894.git.vijayakannan.ayyathurai@intel.com>
X-Mailman-Approved-At: Mon, 16 Aug 2021 09:48:14 +0000
Cc: weifeng.voon@intel.com, vee.khee.wong@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, vijayakannan.ayyathurai@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1 1/3] net: stmmac: fix INTR TBU
	status affecting irq count statistic
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

From: Voon Weifeng <weifeng.voon@intel.com>

DMA channel status "Transmit buffer unavailable(TBU)" bit is not
considered as a successful dma tx. Hence, it should not affect
all the irq count statistic.

Fixes: 1103d3a5531c ("net: stmmac: dwmac4: Also use TBU interrupt to clean TX path")
Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
Signed-off-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
index e63270267578..f83db62938dd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
@@ -172,11 +172,12 @@ int dwmac4_dma_interrupt(void __iomem *ioaddr,
 		x->rx_normal_irq_n++;
 		ret |= handle_rx;
 	}
-	if (likely(intr_status & (DMA_CHAN_STATUS_TI |
-		DMA_CHAN_STATUS_TBU))) {
+	if (likely(intr_status & DMA_CHAN_STATUS_TI)) {
 		x->tx_normal_irq_n++;
 		ret |= handle_tx;
 	}
+	if (unlikely(intr_status & DMA_CHAN_STATUS_TBU))
+		ret |= handle_tx;
 	if (unlikely(intr_status & DMA_CHAN_STATUS_ERI))
 		x->rx_early_irq++;
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
