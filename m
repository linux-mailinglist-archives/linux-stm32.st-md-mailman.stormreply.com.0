Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0354330913
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Mar 2021 08:59:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F2A0C58D43;
	Mon,  8 Mar 2021 07:59:10 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66138C56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 04:08:05 +0000 (UTC)
IronPort-SDR: rNOlcpHV3zcntPwLi1/TQ7x7DBit4R1zYR4TFwk8BQNXovZmcpBb2T/ogMYFlfSavOVmljGrSV
 /jgaywFXaa8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174216198"
X-IronPort-AV: E=Sophos;i="5.81,218,1610438400"; d="scan'208";a="174216198"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 20:08:03 -0800
IronPort-SDR: 6JOYJ6aBjXDsTvfNE18IvXvNacFMncaIzyC3On+Kl0FC2bUn/DjHPi2VdCy85nepbya1bbQ1Rx
 /mGjtM9oDFvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,218,1610438400"; d="scan'208";a="407056226"
Received: from intel-z390-ud.iind.intel.com ([10.223.96.21])
 by orsmga008.jf.intel.com with ESMTP; 02 Mar 2021 20:07:59 -0800
From: ramesh.babu.b@intel.com
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Wed,  3 Mar 2021 20:38:40 +0530
Message-Id: <20210303150840.30024-1-ramesh.babu.b@intel.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 08 Mar 2021 07:59:09 +0000
Cc: Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ramesh Babu B <ramesh.babu.b@intel.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/1] net: stmmac: fix incorrect DMA
	channel intr enable setting of EQoS v4.10
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

From: Ong Boon Leong <boon.leong.ong@intel.com>

We introduce dwmac410_dma_init_channel() here for both EQoS v4.10 and
above which use different DMA_CH(n)_Interrupt_Enable bit definitions for
NIE and AIE.

Fixes: 48863ce5940f ("stmmac: add DMA support for GMAC 4.xx")
Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
Signed-off-by: Ramesh Babu B <ramesh.babu.b@intel.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
index bb29bfcd62c3..62aa0e95beb7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
@@ -124,6 +124,23 @@ static void dwmac4_dma_init_channel(void __iomem *ioaddr,
 	       ioaddr + DMA_CHAN_INTR_ENA(chan));
 }
 
+static void dwmac410_dma_init_channel(void __iomem *ioaddr,
+				      struct stmmac_dma_cfg *dma_cfg, u32 chan)
+{
+	u32 value;
+
+	/* common channel control register config */
+	value = readl(ioaddr + DMA_CHAN_CONTROL(chan));
+	if (dma_cfg->pblx8)
+		value = value | DMA_BUS_MODE_PBL;
+
+	writel(value, ioaddr + DMA_CHAN_CONTROL(chan));
+
+	/* Mask interrupts by writing to CSR7 */
+	writel(DMA_CHAN_INTR_DEFAULT_MASK_4_10,
+	       ioaddr + DMA_CHAN_INTR_ENA(chan));
+}
+
 static void dwmac4_dma_init(void __iomem *ioaddr,
 			    struct stmmac_dma_cfg *dma_cfg, int atds)
 {
@@ -523,7 +540,7 @@ const struct stmmac_dma_ops dwmac4_dma_ops = {
 const struct stmmac_dma_ops dwmac410_dma_ops = {
 	.reset = dwmac4_dma_reset,
 	.init = dwmac4_dma_init,
-	.init_chan = dwmac4_dma_init_channel,
+	.init_chan = dwmac410_dma_init_channel,
 	.init_rx_chan = dwmac4_dma_init_rx_chan,
 	.init_tx_chan = dwmac4_dma_init_tx_chan,
 	.axi = dwmac4_dma_axi,
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
