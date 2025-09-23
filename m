Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4974B95A4B
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Sep 2025 13:26:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 766FEC3F92E;
	Tue, 23 Sep 2025 11:26:30 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F9D6C36B20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Sep 2025 11:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iMApgIyGL71JhjcL22dLhUAJuwZE2xcyZ4Sw+gpguC0=; b=0iFrA0cKwsRt1uEBWCM/LVTfp2
 2Y1HbFYhaxFUu5+A4cmGSIL+e/pWhYr+qKSaCb1W3xGfqZzCBuc4F+bvtDgQwh6p51myo8bIHBxsm
 2cuzyw99Xk2ASeXdPUB5nxmzfwC+Px27/QITgoQtK5bbhL89W9mnAuhsBTlvTDrmF8tJwqphshmQl
 erfAYw3KwJJ0q5tkHAo+IhaGWmarj8gL1oKqs6QORVW2HaEYBYkpjTjzguq/GCIjTOSAmWD5szATv
 bVPNpvFmxR/j3v+XlafggW3z3nsZkUlOQVbaZ/rN8uJF3eHMA21Vpyr6UPrhog98gAob8TOjzv4HD
 WHg0oW5w==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39566 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1v11A5-0000000079F-2j99;
 Tue, 23 Sep 2025 12:26:21 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1v11A3-0000000774G-3PKY; Tue, 23 Sep 2025 12:26:19 +0100
In-Reply-To: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1v11A3-0000000774G-3PKY@rmk-PC.armlinux.org.uk>
Date: Tue, 23 Sep 2025 12:26:19 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 5/6] net: stmmac: move PHY handling
 out of __stmmac_open()/release()
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

Move the PHY attachment/detachment from the network driver out of
__stmmac_open() and __stmmac_release() into stmmac_open() and
stmmac_release() where these actions will only happen when the
interface is administratively brought up or down. It does not make
sense to detach and re-attach the PHY during a change of MTU.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 29 +++++++++++--------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4acd180d2da8..4844d563e291 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3937,10 +3937,6 @@ static int __stmmac_open(struct net_device *dev,
 	u32 chan;
 	int ret;
 
-	ret = stmmac_init_phy(dev);
-	if (ret)
-		return ret;
-
 	for (int i = 0; i < MTL_MAX_TX_QUEUES; i++)
 		if (priv->dma_conf.tx_queue[i].tbs & STMMAC_TBS_EN)
 			dma_conf->tx_queue[i].tbs = priv->dma_conf.tx_queue[i].tbs;
@@ -3990,7 +3986,6 @@ static int __stmmac_open(struct net_device *dev,
 
 	stmmac_release_ptp(priv);
 init_error:
-	phylink_disconnect_phy(priv->phylink);
 	return ret;
 }
 
@@ -4010,18 +4005,28 @@ static int stmmac_open(struct net_device *dev)
 
 	ret = pm_runtime_resume_and_get(priv->device);
 	if (ret < 0)
-		goto err;
+		goto err_dma_resources;
+
+	ret = stmmac_init_phy(dev);
+	if (ret)
+		goto err_runtime_pm;
 
 	ret = __stmmac_open(dev, dma_conf);
-	if (ret) {
-		pm_runtime_put(priv->device);
-err:
-		free_dma_desc_resources(priv, dma_conf);
-	}
+	if (ret)
+		goto err_disconnect_phy;
 
 	kfree(dma_conf);
 
 	return ret;
+
+err_disconnect_phy:
+	phylink_disconnect_phy(priv->phylink);
+err_runtime_pm:
+	pm_runtime_put(priv->device);
+err_dma_resources:
+	free_dma_desc_resources(priv, dma_conf);
+	kfree(dma_conf);
+	return ret;
 }
 
 static void __stmmac_release(struct net_device *dev)
@@ -4038,7 +4043,6 @@ static void __stmmac_release(struct net_device *dev)
 
 	/* Stop and disconnect the PHY */
 	phylink_stop(priv->phylink);
-	phylink_disconnect_phy(priv->phylink);
 
 	stmmac_disable_all_queues(priv);
 
@@ -4078,6 +4082,7 @@ static int stmmac_release(struct net_device *dev)
 
 	__stmmac_release(dev);
 
+	phylink_disconnect_phy(priv->phylink);
 	pm_runtime_put(priv->device);
 
 	return 0;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
