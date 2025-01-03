Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E93A00879
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Jan 2025 12:17:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40554C78F67;
	Fri,  3 Jan 2025 11:17:10 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 250ACC78F66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jan 2025 11:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4s396obXaI1f8Yz3z+7hU/+8e3s2TBg9V0/XcDUux8s=; b=P7wgdPrI4AcqfEfWWuDx1a/tNT
 0Ax1clrro5GRgNFgLC8VP3GtrZYGo/YJNafuQ01+Lgv6h+TC4LRtbGfBunbBWoEXzV/2KoggfwLiv
 vwD/IHr0bV/PVYwuhdIeTG9jn4q4zxkOemjdPO0SLtPXymx4W8tEc3dBKRPr0XPU4IPRBK+W/LEOf
 tbwCumzIj9YiwFyYiKT8B3f0k/sK9OGW98C+ZCEReksBwvdTd3RoJD9VNpvQLkiFxv/QqAF2wcC7q
 /cLRRUFbHMIbpVPX3o9AiUubFdmaMScAPhUYMH0aAx68R83LfavnW39ixzTxTK0c0/QJdt/iDPcfv
 EDLSZ1iw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38368 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tTffj-00031K-0s;
 Fri, 03 Jan 2025 11:16:55 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tTfff-007Roc-Ff; Fri, 03 Jan 2025 11:16:51 +0000
In-Reply-To: <Z3fG9oTY9F9fCYHv@shell.armlinux.org.uk>
References: <Z3fG9oTY9F9fCYHv@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tTfff-007Roc-Ff@rmk-PC.armlinux.org.uk>
Date: Fri, 03 Jan 2025 11:16:51 +0000
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Alexander Couzens <lynxis@fe80.eu>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH net-next 5/6] net: stmmac: use PCS
	supported_interfaces
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

Use the PCS' supported_interfaces member to build the MAC level
supported_interfaces bitmap.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6bc10ffe7a2b..fcb5649fb738 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1203,6 +1203,7 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	struct stmmac_mdio_bus_data *mdio_bus_data;
 	int mode = priv->plat->phy_interface;
 	struct fwnode_handle *fwnode;
+	struct phylink_pcs *pcs;
 	struct phylink *phylink;
 
 	priv->phylink_config.dev = &priv->dev->dev;
@@ -1224,8 +1225,14 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 
 	/* If we have an xpcs, it defines which PHY interfaces are supported. */
 	if (priv->hw->xpcs)
-		xpcs_get_interfaces(priv->hw->xpcs,
-				    priv->phylink_config.supported_interfaces);
+		pcs = xpcs_to_phylink_pcs(priv->hw->xpcs);
+	else
+		pcs = priv->hw->phylink_pcs;
+
+	if (pcs)
+		phy_interface_or(priv->phylink_config.supported_interfaces,
+				 priv->phylink_config.supported_interfaces,
+				 pcs->supported_interfaces);
 
 	fwnode = priv->plat->port_node;
 	if (!fwnode)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
