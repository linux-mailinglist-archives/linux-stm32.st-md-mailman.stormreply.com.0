Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3004DBDF94F
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Oct 2025 18:11:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0452C57163;
	Wed, 15 Oct 2025 16:11:02 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35D15C5663F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 16:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gb/wZg//idgP0aJjQsDqyZi+MpDmhmg/7WfGvBfMh50=; b=j3X4MWu7b4hQ1UJETH24Z2neRa
 ojTTrMUmEq6CCu2PgjNIr1pMf343ftlBy4+AIBohE11sMULn2XFTc3WS932Y1v0WFEsnP/ZNPKvNP
 j/556CK+p/UAX+i9D0FSngfkZHQd8xAMa57/Vbbeefrd4TgO8ltCRzeMQPtOMQwn04yxvzLJNBIly
 Mf8UdYiLQK4r2oE0acJTHzLZ/FtkNCK7Z3spBcL4HL35paQdkAcSW2bDEtoUkGxBAMRcTCHbnZFIW
 70zdlXhye57aWXXUoZNiu2+eN5rGu6XBOjP9AJE13GNGmcNWj9DlLqa9jDfYU7d1UkzjFEDMcBcuJ
 cEUfLjcg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34166 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1v945U-000000005AH-2gB7;
 Wed, 15 Oct 2025 17:10:52 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1v945T-0000000AmeV-2BvU; Wed, 15 Oct 2025 17:10:51 +0100
In-Reply-To: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
References: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1v945T-0000000AmeV-2BvU@rmk-PC.armlinux.org.uk>
Date: Wed, 15 Oct 2025 17:10:51 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/5] net: stmmac: avoid PHY speed
 change when configuring MTU
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

There is no need to do the speed-down, speed-up dance when changing
the MTU as there is little power saving that can be gained from such
a brief interval between these, and the autonegotiation they cause
takes much longer.

Move the calls to phylink_speed_up() and phylink_speed_down() into
stmmac_open() and stmmac_release() respectively, reducing the work
done in the __-variants of these functions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3728afa701c6..500cfd19e6b5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3963,8 +3963,6 @@ static int __stmmac_open(struct net_device *dev,
 	stmmac_init_coalesce(priv);
 
 	phylink_start(priv->phylink);
-	/* We may have called phylink_speed_down before */
-	phylink_speed_up(priv->phylink);
 
 	ret = stmmac_request_irq(dev);
 	if (ret)
@@ -4015,6 +4013,9 @@ static int stmmac_open(struct net_device *dev)
 
 	kfree(dma_conf);
 
+	/* We may have called phylink_speed_down before */
+	phylink_speed_up(priv->phylink);
+
 	return ret;
 
 err_disconnect_phy:
@@ -4032,13 +4033,6 @@ static void __stmmac_release(struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u32 chan;
 
-	/* If the PHY or MAC has WoL enabled, then the PHY will not be
-	 * suspended when phylink_stop() is called below. Set the PHY
-	 * to its slowest speed to save power.
-	 */
-	if (device_may_wakeup(priv->device))
-		phylink_speed_down(priv->phylink, false);
-
 	/* Stop and disconnect the PHY */
 	phylink_stop(priv->phylink);
 
@@ -4078,6 +4072,13 @@ static int stmmac_release(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
+	/* If the PHY or MAC has WoL enabled, then the PHY will not be
+	 * suspended when phylink_stop() is called below. Set the PHY
+	 * to its slowest speed to save power.
+	 */
+	if (device_may_wakeup(priv->device))
+		phylink_speed_down(priv->phylink, false);
+
 	__stmmac_release(dev);
 
 	phylink_disconnect_phy(priv->phylink);
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
