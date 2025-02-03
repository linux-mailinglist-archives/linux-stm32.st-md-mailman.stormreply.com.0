Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2B1A255F2
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2025 10:34:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B917C78F7C;
	Mon,  3 Feb 2025 09:34:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96B48CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2025 09:34:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22B201063;
 Mon,  3 Feb 2025 01:35:02 -0800 (PST)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com
 [10.1.34.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CCE63F5A1;
 Mon,  3 Feb 2025 01:34:33 -0800 (PST)
From: Steven Price <steven.price@arm.com>
To: "David S. Miller" <davem@davemloft.net>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Paolo Abeni <pabeni@redhat.com>
Date: Mon,  3 Feb 2025 09:34:18 +0000
Message-ID: <20250203093419.25804-1-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, Petr Tesarik <petr@tesarici.cz>,
 netdev@vger.kernel.org, Yanteng Si <si.yanteng@linux.dev>,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Steven Price <steven.price@arm.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Xi Ruoyao <xry111@xry111.site>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: Allow zero for [tr]x_fifo_size
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

Commit 8865d22656b4 ("net: stmmac: Specify hardware capability value
when FIFO size isn't specified") modified the behaviour to bail out if
both the FIFO size and the hardware capability were both set to zero.
However devices where has_gmac4 and has_xgmac are both false don't use
the fifo size and that commit breaks platforms for which these values
were zero.

Only warn and error out when (has_gmac4 || has_xgmac) where the values
are used and zero would cause problems, otherwise continue with the zero
values.

Fixes: 8865d22656b4 ("net: stmmac: Specify hardware capability value when FIFO size isn't specified")
Tested-by: Xi Ruoyao <xry111@xry111.site>
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d04543e5697b..821404beb629 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7222,7 +7222,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	if (!priv->plat->rx_fifo_size) {
 		if (priv->dma_cap.rx_fifo_size) {
 			priv->plat->rx_fifo_size = priv->dma_cap.rx_fifo_size;
-		} else {
+		} else if (priv->plat->has_gmac4 || priv->plat->has_xgmac) {
 			dev_err(priv->device, "Can't specify Rx FIFO size\n");
 			return -ENODEV;
 		}
@@ -7236,7 +7236,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	if (!priv->plat->tx_fifo_size) {
 		if (priv->dma_cap.tx_fifo_size) {
 			priv->plat->tx_fifo_size = priv->dma_cap.tx_fifo_size;
-		} else {
+		} else if (priv->plat->has_gmac4 || priv->plat->has_xgmac) {
 			dev_err(priv->device, "Can't specify Tx FIFO size\n");
 			return -ENODEV;
 		}
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
