Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B51D0822C1
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2019 18:45:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85CCCC10CB2;
	Mon,  5 Aug 2019 16:45:36 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (unknown [198.182.47.102])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60039C32EAB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Aug 2019 16:45:33 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6AEFFC01A4;
 Mon,  5 Aug 2019 16:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1565023530; bh=+VdnwuZAGWVKwnSobbw+sFsG8nzeWPjFkEbLTwBDpGg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=BnY90J3TTSDlveTN0HLoIswv2g2WA+E0Wr6xViyR+Vf7/xFSfRhx1Fsz2+4w80Bs4
 q7AhAl5vYG41tJemqQ40GO3tuqCssgYic7GbXFTdUanWvTTNe0YK090AZBOayDa3CI
 eUyrfSP/jpoG7cy0iOZ0bZNWD5VHtTFcFLoVsdDGbG8oixF3EFsDSptcaW/OMibDA5
 SA225Z4CQZIxy+GYDqYmEx7KknL7gvmNYu1X/AjfAtRsdoCRue/M11WBlTZ/cLScYa
 +qX7an4zZ4nvZ3cw+m5pxwuDqHpttj0ggDSmpy+cFEuRiFeIa9k8Fqk2ZaqoZLIOfC
 bVDPzL8lZUz1A==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 22D3EA006B;
 Mon,  5 Aug 2019 16:45:27 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Mon,  5 Aug 2019 18:44:31 +0200
Message-Id: <3954867cf30aebcc0a86e83b61da48ef32bf645e.1565022597.git.joabreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1565022597.git.joabreu@synopsys.com>
References: <cover.1565022597.git.joabreu@synopsys.com>
In-Reply-To: <cover.1565022597.git.joabreu@synopsys.com>
References: <cover.1565022597.git.joabreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 04/26] net: stmmac: xgmac: Implement
	set_mtl_tx_queue_weight()
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

Implement the TX Queue Weight callback. In order for this to be active
we also need to set ETS algorithm when configuring Queue.

Signed-off-by: Jose Abreu <joabreu@synopsys.com>
---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 85c68b7ee8c6..ce6503dfc86d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -144,7 +144,9 @@ static void dwxgmac2_prog_mtl_tx_algorithms(struct mac_device_info *hw,
 					    u32 tx_alg)
 {
 	void __iomem *ioaddr = hw->pcsr;
+	bool ets = true;
 	u32 value;
+	int i;
 
 	value = readl(ioaddr + XGMAC_MTL_OPMODE);
 	value &= ~XGMAC_ETSALG;
@@ -160,10 +162,28 @@ static void dwxgmac2_prog_mtl_tx_algorithms(struct mac_device_info *hw,
 		value |= XGMAC_DWRR;
 		break;
 	default:
+		ets = false;
 		break;
 	}
 
 	writel(value, ioaddr + XGMAC_MTL_OPMODE);
+
+	/* Set ETS if desired */
+	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
+		value = readl(ioaddr + XGMAC_MTL_TCx_ETS_CONTROL(i));
+		value &= ~XGMAC_TSA;
+		if (ets)
+			value |= XGMAC_ETS;
+		writel(value, ioaddr + XGMAC_MTL_TCx_ETS_CONTROL(i));
+	}
+}
+
+static void dwxgmac2_set_mtl_tx_queue_weight(struct mac_device_info *hw,
+					     u32 weight, u32 queue)
+{
+	void __iomem *ioaddr = hw->pcsr;
+
+	writel(weight, ioaddr + XGMAC_MTL_TCx_QUANTUM_WEIGHT(queue));
 }
 
 static void dwxgmac2_map_mtl_to_dma(struct mac_device_info *hw, u32 queue,
@@ -412,7 +432,7 @@ const struct stmmac_ops dwxgmac210_ops = {
 	.rx_queue_routing = NULL,
 	.prog_mtl_rx_algorithms = dwxgmac2_prog_mtl_rx_algorithms,
 	.prog_mtl_tx_algorithms = dwxgmac2_prog_mtl_tx_algorithms,
-	.set_mtl_tx_queue_weight = NULL,
+	.set_mtl_tx_queue_weight = dwxgmac2_set_mtl_tx_queue_weight,
 	.map_mtl_to_dma = dwxgmac2_map_mtl_to_dma,
 	.config_cbs = dwxgmac2_config_cbs,
 	.dump_regs = NULL,
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
