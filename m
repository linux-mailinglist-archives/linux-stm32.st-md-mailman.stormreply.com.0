Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 281FB712453
	for <lists+linux-stm32@lfdr.de>; Fri, 26 May 2023 12:14:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5178C6A615;
	Fri, 26 May 2023 10:14:46 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96E4BC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 May 2023 10:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=djvnifhvkv7qAufnKosk+gWEJUW9i+XXOBBka2xo+yo=; b=Uqecxvis8aZ/HgE72Q2sx8Ikqu
 bo8+zaE7aVY7ZesJMQfMxmlxn+U0Rggkkj0gse4H4MtT3P7kw4Aq2ibnU6usEGd65FqYfJ5wXOyzM
 FPltHldoQIdIu/dnrF0FWObE1bPCze9xHwqitHCYBNeIAG9SxBDFwKfk9G28QlZp01A875wIpSIIv
 MgSjvP/GAfIiqOCR5mGi5KwboZcrMlGJgLlDc32N1WH5HvCfe6rTLa0tJNkn7wPj8bf1+p1RGDFJ2
 gWVyLPn7E0ORDQAcnf59B2UHzIgrMTtQnveugghycMB6qNfz01VMsbbJZqbY7dg3OFEEMcBbR1d9w
 bOXtNhFg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36948 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1q2USx-0005PS-Br; Fri, 26 May 2023 11:14:35 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1q2USw-008PAa-Nl; Fri, 26 May 2023 11:14:34 +0100
In-Reply-To: <ZHCGZ8IgAAwr8bla@shell.armlinux.org.uk>
References: <ZHCGZ8IgAAwr8bla@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1q2USw-008PAa-Nl@rmk-PC.armlinux.org.uk>
Date: Fri, 26 May 2023 11:14:34 +0100
Cc: Jose Abreu <joabreu@synopsys.com>, Simon Horman <simon.horman@corigine.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/6] net: stmmac: use
	xpcs_create_mdiodev()
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

Use the new xpcs_create_mdiodev() creator, which simplifies the
creation and destruction of the mdio device associated with xpcs.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 6807c4c1a0a2..3db1cb0fd160 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -491,7 +491,6 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 int stmmac_xpcs_setup(struct mii_bus *bus)
 {
 	struct net_device *ndev = bus->priv;
-	struct mdio_device *mdiodev;
 	struct stmmac_priv *priv;
 	struct dw_xpcs *xpcs;
 	int mode, addr;
@@ -501,16 +500,10 @@ int stmmac_xpcs_setup(struct mii_bus *bus)
 
 	/* Try to probe the XPCS by scanning all addresses. */
 	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
-		mdiodev = mdio_device_create(bus, addr);
-		if (IS_ERR(mdiodev))
+		xpcs = xpcs_create_mdiodev(bus, addr, mode);
+		if (IS_ERR(xpcs))
 			continue;
 
-		xpcs = xpcs_create(mdiodev, mode);
-		if (IS_ERR_OR_NULL(xpcs)) {
-			mdio_device_free(mdiodev);
-			continue;
-		}
-
 		priv->hw->xpcs = xpcs;
 		break;
 	}
@@ -669,10 +662,8 @@ int stmmac_mdio_unregister(struct net_device *ndev)
 	if (!priv->mii)
 		return 0;
 
-	if (priv->hw->xpcs) {
-		mdio_device_free(priv->hw->xpcs->mdiodev);
+	if (priv->hw->xpcs)
 		xpcs_destroy(priv->hw->xpcs);
-	}
 
 	mdiobus_unregister(priv->mii);
 	priv->mii->priv = NULL;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
