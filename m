Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF743ED13E
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Aug 2021 11:48:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDF2DC5A4D9;
	Mon, 16 Aug 2021 09:48:18 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0751C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Aug 2021 06:19:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="215832421"
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="215832421"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2021 23:19:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="678986860"
Received: from vijay.png.intel.com ([10.88.229.73])
 by fmsmga005.fm.intel.com with ESMTP; 15 Aug 2021 23:19:36 -0700
From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
To: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 davem@davemloft.net, kuba@kernel.org, mcoquelin.stm32@gmail.com
Date: Mon, 16 Aug 2021 14:16:00 +0800
Message-Id: <5c956016465b688a2679bd02da1f751046be189c.1629092894.git.vijayakannan.ayyathurai@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1629092894.git.vijayakannan.ayyathurai@intel.com>
References: <cover.1629092894.git.vijayakannan.ayyathurai@intel.com>
In-Reply-To: <cover.1629092894.git.vijayakannan.ayyathurai@intel.com>
References: <cover.1629092894.git.vijayakannan.ayyathurai@intel.com>
X-Mailman-Approved-At: Mon, 16 Aug 2021 09:48:14 +0000
Cc: weifeng.voon@intel.com, vee.khee.wong@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, vijayakannan.ayyathurai@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1 3/3] net: stmmac: add ethtool
	per-queue irq statistic support
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

Adding ethtool per-queue statistics support to show number of interrupts
generated at DMA tx and DMA rx. All the counters are incremented at
dwmac4_dma_interrupt function.

Signed-off-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h         | 2 ++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c     | 2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 79333deef2e2..b6d945ea903d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -60,10 +60,12 @@
 
 struct stmmac_txq_stats {
 	unsigned long tx_pkt_n;
+	unsigned long tx_normal_irq_n;
 };
 
 struct stmmac_rxq_stats {
 	unsigned long rx_pkt_n;
+	unsigned long rx_normal_irq_n;
 };
 
 /* Extra statistic and debug information exposed by ethtool */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
index f83db62938dd..9292a1fab7d3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
@@ -170,10 +170,12 @@ int dwmac4_dma_interrupt(void __iomem *ioaddr,
 		x->normal_irq_n++;
 	if (likely(intr_status & DMA_CHAN_STATUS_RI)) {
 		x->rx_normal_irq_n++;
+		x->rxq_stats[chan].rx_normal_irq_n++;
 		ret |= handle_rx;
 	}
 	if (likely(intr_status & DMA_CHAN_STATUS_TI)) {
 		x->tx_normal_irq_n++;
+		x->txq_stats[chan].tx_normal_irq_n++;
 		ret |= handle_tx;
 	}
 	if (unlikely(intr_status & DMA_CHAN_STATUS_TBU))
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 10c0895d0b43..595c3ccdcbb7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -263,11 +263,13 @@ static const struct stmmac_stats stmmac_mmc[] = {
 
 static const char stmmac_qstats_tx_string[][ETH_GSTRING_LEN] = {
 	"tx_pkt_n",
+	"tx_irq_n",
 #define STMMAC_TXQ_STATS ARRAY_SIZE(stmmac_qstats_tx_string)
 };
 
 static const char stmmac_qstats_rx_string[][ETH_GSTRING_LEN] = {
 	"rx_pkt_n",
+	"rx_irq_n",
 #define STMMAC_RXQ_STATS ARRAY_SIZE(stmmac_qstats_rx_string)
 };
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
