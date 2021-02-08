Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 380DB313483
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 15:08:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1B7FC57B58;
	Mon,  8 Feb 2021 14:08:37 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E974C57B59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 14:08:31 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 8 Feb 2021 17:08:13 +0300
Message-ID: <20210208140820.10410-10-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20210208140820.10410-1-Sergey.Semin@baikalelectronics.ru>
References: <20210208140820.10410-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 09/16] net: stmmac: Disable MMC IRQs in the
	generic IRQs disable method
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

MMC IRQs aren't handled by the main ISR, so for the sake of the code
coherency let's move the MMC IRQs disabling procedure to the generic IRQs
de-activating method. By doing so we've finally finished filling the
generic IRQs enable/disable functions up with the individual
MAC/MTL/DMA/etc interrupt control methods.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ddcd82d02c27..fcd59a647b02 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2274,8 +2274,6 @@ static void stmmac_mmc_setup(struct stmmac_priv *priv)
 	unsigned int mode = MMC_CNTRL_RESET_ON_READ | MMC_CNTRL_COUNTER_RESET |
 			    MMC_CNTRL_PRESET | MMC_CNTRL_FULL_HALF_PRESET;
 
-	stmmac_mmc_intr_all_mask(priv, priv->mmcaddr);
-
 	if (priv->dma_cap.rmon) {
 		stmmac_mmc_ctrl(priv, priv->mmcaddr, mode);
 		memset(&priv->mmc, 0, sizeof(struct stmmac_counters));
@@ -4182,6 +4180,8 @@ static void stmmac_disable_irq(struct stmmac_priv *priv)
 	if (priv->dma_cap.asp)
 		stmmac_disable_safety_feat_irq(priv, priv->ioaddr);
 
+	stmmac_mmc_intr_all_mask(priv, priv->mmcaddr);
+
 	enable_irq(priv->dev->irq);
 }
 
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
