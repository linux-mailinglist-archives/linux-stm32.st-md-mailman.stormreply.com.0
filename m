Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 506EB313484
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 15:08:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A994C57B5B;
	Mon,  8 Feb 2021 14:08:38 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D197DC57B5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 14:08:31 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 8 Feb 2021 17:08:14 +0300
Message-ID: <20210208140820.10410-11-Sergey.Semin@baikalelectronics.ru>
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
Subject: [Linux-stm32] [PATCH 10/16] net: stmmac: Convert STMMAC_DOWN flag
	to STMMAC_UP
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

The flag name and semantics are misleading. Judging by the code the flag
will be set only if the networking is requested for being reset, while
logically in order to correctly reflect the device state the flag needs to
be also set when the network device isn't opened. Let's convert the flag
to having a positive meaning instead of keeping it being set all the time
the interface is down.

This modification will be also helpful for the case of the IRQs request
being performed in the device probe method. So the driver could
enable/disable the network-related IRQs handlers by synchronous flag
switching together with the IRQs unmasking and masking. Luckily the IRQs
are normally enabled/disable in the late/early network initialization
stages respectively.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index d88bc8af8eaa..ab8b1e04ed22 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -246,7 +246,7 @@ struct stmmac_priv {
 };
 
 enum stmmac_state {
-	STMMAC_DOWN,
+	STMMAC_UP,
 	STMMAC_RESET_REQUESTED,
 };
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fcd59a647b02..f458d728825c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4151,6 +4151,8 @@ static void stmmac_enable_irq(struct stmmac_priv *priv)
 
 	stmmac_enable_mac_irq(priv, priv->hw);
 
+	set_bit(STMMAC_UP, &priv->state);
+
 	enable_irq(priv->dev->irq);
 }
 
@@ -4165,6 +4167,8 @@ static void stmmac_disable_irq(struct stmmac_priv *priv)
 
 	disable_irq(priv->dev->irq);
 
+	clear_bit(STMMAC_UP, &priv->state);
+
 	stmmac_disable_mac_irq(priv, priv->hw);
 
 	maxq = max(priv->plat->rx_queues_to_use, priv->plat->tx_queues_to_use);
@@ -4213,7 +4217,7 @@ static irqreturn_t stmmac_interrupt(int irq, void *dev_id)
 		pm_wakeup_event(priv->device, 0);
 
 	/* Check if adapter is up */
-	if (test_bit(STMMAC_DOWN, &priv->state))
+	if (!test_bit(STMMAC_UP, &priv->state))
 		return IRQ_HANDLED;
 	/* Check if a fatal error happened */
 	if (stmmac_safety_feat_interrupt(priv))
@@ -4739,7 +4743,7 @@ static const struct net_device_ops stmmac_netdev_ops = {
 
 static void stmmac_reset_subtask(struct stmmac_priv *priv)
 {
-	if (test_bit(STMMAC_DOWN, &priv->state))
+	if (!test_bit(STMMAC_UP, &priv->state))
 		return;
 
 	netdev_err(priv->dev, "Reset adapter.\n");
@@ -4747,10 +4751,8 @@ static void stmmac_reset_subtask(struct stmmac_priv *priv)
 	rtnl_lock();
 	netif_trans_update(priv->dev);
 
-	set_bit(STMMAC_DOWN, &priv->state);
 	dev_close(priv->dev);
 	dev_open(priv->dev, NULL);
-	clear_bit(STMMAC_DOWN, &priv->state);
 	rtnl_unlock();
 }
 
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
