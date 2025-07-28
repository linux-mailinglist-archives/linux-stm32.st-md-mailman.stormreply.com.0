Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87830B13F15
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jul 2025 17:46:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 415E3C36B2E;
	Mon, 28 Jul 2025 15:46:42 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0632C36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jul 2025 15:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hvpIuIYR+OFZWfZ+noueKHmU0ee5RQLXv8mbWGSuBsw=; b=Z1lR3FYIP49Z9k1MorzRPnrMHG
 CedRUGtvJDyzN4J0cYnbsqxGHDkT00bZ17ACNq3UKY9mBOqKSmZb6ZuB6IXYxjVrNyid1gEBUCZoF
 L3oYho/a15hewwVtueD3UQ3meSqfuRhM6W0xpf/LIWskSPZ81b9xw92ajbeEzpGasraOlOHALwxaj
 dVLNaj1MJ3q4Y6QmskK03YtIZkt5I+jSYUWrQ6K753ExCycbclR6v157vNWsEOhwpZI6bPR89yMBR
 TDefZq0uuk57ZpqmkUwDxuJz+4JReRHsVd9KdOc/DT3srMeYtPvrvk49F2TrGRAorItQcNIja6myi
 lwQPS3Ag==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54450 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1ugQ3g-0000Up-11;
 Mon, 28 Jul 2025 16:46:36 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1ugQ2y-006KDL-K7; Mon, 28 Jul 2025 16:45:52 +0100
In-Reply-To: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1ugQ2y-006KDL-K7@rmk-PC.armlinux.org.uk>
Date: Mon, 28 Jul 2025 16:45:52 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 5/7] net: stmmac: use core wake
	IRQ support
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

The PM core provides management of wake IRQs along side setting the
device wake enable state. In order to use this, we need to register
the interrupt used to wakeup the system using devm_pm_set_wake_irq()
or dev_pm_set_wake_irq(). The core will then enable or disable IRQ
wake state on this interrupt as appropriate.

Make use of this functionality, rather than explicitly managing the
IRQ enable state in the set_wol() ethtool op. This removes the IRQ
wake state management from stmmac.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  1 -
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   | 14 +-------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  4 ++--
 3 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index cda09cf5dcca..e1df59a643e3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -289,7 +289,6 @@ struct stmmac_priv {
 	u32 msg_enable;
 	int wolopts;
 	int wol_irq;
-	bool wol_irq_disabled;
 	int clk_csr;
 	struct timer_list eee_ctrl_timer;
 	int lpi_irq;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 58542b72cc01..39fa1ec92f82 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -815,19 +815,7 @@ static int stmmac_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 		return ret;
 	}
 
-	if (wol->wolopts) {
-		device_set_wakeup_enable(priv->device, 1);
-		/* Avoid unbalanced enable_irq_wake calls */
-		if (priv->wol_irq_disabled)
-			enable_irq_wake(priv->wol_irq);
-		priv->wol_irq_disabled = false;
-	} else {
-		device_set_wakeup_enable(priv->device, 0);
-		/* Avoid unbalanced disable_irq_wake calls */
-		if (!priv->wol_irq_disabled)
-			disable_irq_wake(priv->wol_irq);
-		priv->wol_irq_disabled = true;
-	}
+	device_set_wakeup_enable(priv->device, !!wol->wolopts);
 
 	mutex_lock(&priv->lock);
 	priv->wolopts = wol->wolopts;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6a4ef32f57ec..7d467b494685 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -29,6 +29,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/slab.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/prefetch.h>
 #include <linux/pinctrl/consumer.h>
 #ifdef CONFIG_DEBUG_FS
@@ -3724,7 +3725,6 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 	/* Request the Wake IRQ in case of another line
 	 * is used for WoL
 	 */
-	priv->wol_irq_disabled = true;
 	if (priv->wol_irq > 0 && priv->wol_irq != dev->irq) {
 		int_name = priv->int_name_wol;
 		sprintf(int_name, "%s:%s", dev->name, "wol");
@@ -3885,7 +3885,6 @@ static int stmmac_request_irq_single(struct net_device *dev)
 	/* Request the Wake IRQ in case of another line
 	 * is used for WoL
 	 */
-	priv->wol_irq_disabled = true;
 	if (priv->wol_irq > 0 && priv->wol_irq != dev->irq) {
 		ret = request_irq(priv->wol_irq, stmmac_interrupt,
 				  IRQF_SHARED, dev->name, dev);
@@ -7277,6 +7276,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	if (priv->plat->pmt) {
 		dev_info(priv->device, "Wake-Up On Lan supported\n");
 		device_set_wakeup_capable(priv->device, 1);
+		devm_pm_set_wake_irq(priv->device, priv->wol_irq);
 	}
 
 	if (priv->dma_cap.tsoen)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
