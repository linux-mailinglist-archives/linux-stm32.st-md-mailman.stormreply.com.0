Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B3BB95A36
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Sep 2025 13:26:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B50FC3F92E;
	Tue, 23 Sep 2025 11:26:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B17DC36B20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Sep 2025 11:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S1UnBS/udUDw2oFqICie23zcbp8kBYeEaJ1ff4koAi4=; b=icr6MKXc7MHzrUWRDtWH6tq4er
 FCpPaZnDzajBGYQNNuvgiOQqc65bxFEajXzGbbW9IBDwOsKM0ai3NnpIVzQ169FPGfgr3Vr2Ort2S
 Mxi61kFMG0ZqyHaKAGhU77QtOi5rm6F7KP0Q2KHK4My9U7X8zqMnI+DT0bhBipZM7alHgXl/FyR5m
 6wtMtmDAcr4gV7a4nE0V/6HbxeXem2ElBlFTm8dbqHFNYzaC4s6q4d3AvFnony8FXw2/bEIIPijDX
 DHDeozJIBLS/bI5MAF2GoVT+wUgkDa0fxDUIQfxx7Y1vd+rJi4e4b0BiXCbGYpoZI3oDAtXYCybkF
 EpafMbsQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38072 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1v119p-0000000078L-1iX6;
 Tue, 23 Sep 2025 12:26:05 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1v119o-0000000773y-21gs; Tue, 23 Sep 2025 12:26:04 +0100
In-Reply-To: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1v119o-0000000773y-21gs@rmk-PC.armlinux.org.uk>
Date: Tue, 23 Sep 2025 12:26:04 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/6] net: stmmac: move xpcs clause 73
 test into stmmac_init_phy()
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

We avoid binding a PHY if the XPCS is using clause 73 negotiation.
Rather than having this complexity in __stmmac_open(), move it to
stmmac_init_phy() instead. There is no point checking the XPCS
state this unless phylink wants a PHY, so place this appropriately.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 517b25b2bcae..3b47d4ca24ca 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1112,6 +1112,7 @@ static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
 static int stmmac_init_phy(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
+	int mode = priv->plat->phy_interface;
 	struct fwnode_handle *phy_fwnode;
 	struct fwnode_handle *fwnode;
 	int ret;
@@ -1119,6 +1120,10 @@ static int stmmac_init_phy(struct net_device *dev)
 	if (!phylink_expects_phy(priv->phylink))
 		return 0;
 
+	if (priv->hw->xpcs &&
+	    xpcs_get_an_mode(priv->hw->xpcs, mode) == DW_AN_C73)
+		return 0;
+
 	fwnode = priv->plat->port_node;
 	if (!fwnode)
 		fwnode = dev_fwnode(priv->device);
@@ -3926,7 +3931,6 @@ static int __stmmac_open(struct net_device *dev,
 			 struct stmmac_dma_conf *dma_conf)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	int mode = priv->plat->phy_interface;
 	u32 chan;
 	int ret;
 
@@ -3934,15 +3938,12 @@ static int __stmmac_open(struct net_device *dev,
 	if (!priv->tx_lpi_timer)
 		priv->tx_lpi_timer = eee_timer * 1000;
 
-	if ((!priv->hw->xpcs ||
-	     xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73)) {
-		ret = stmmac_init_phy(dev);
-		if (ret) {
-			netdev_err(priv->dev,
-				   "%s: Cannot attach to PHY (error: %d)\n",
-				   __func__, ret);
-			return ret;
-		}
+	ret = stmmac_init_phy(dev);
+	if (ret) {
+		netdev_err(priv->dev,
+			   "%s: Cannot attach to PHY (error: %d)\n",
+			   __func__, ret);
+		return ret;
 	}
 
 	for (int i = 0; i < MTL_MAX_TX_QUEUES; i++)
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
