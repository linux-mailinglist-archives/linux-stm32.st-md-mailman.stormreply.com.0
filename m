Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C088C3BDE
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2024 09:24:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFBD7C6B476;
	Mon, 13 May 2024 07:24:46 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05618C030CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 07:24:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B13920012;
 Mon, 13 May 2024 07:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715585082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rjvm1N4rOlLPaFBwTCH0gmtHt8LF+Z42yqOPTFZ7WlI=;
 b=ID+rARiIngxxvzk7M9VoU25Vgv3NFdw4HsoU7RoEkmx4aFKNzfzWBy61Nlpx9LXrttcYWR
 JreFlQhQu/73zStBGUaPVVTiaKMYD5yPsRayJCa+hbcsvHOaLVtMh8aYXdiZV9bvuRLVvb
 oX5MrpL7I4JnfHIgRZv7/71xpdj+zLZob5ycmmgcmLYocaKg6DmechSIucr6aLlWMBeHoY
 hCkFYBtIT/2j5RMWvEy+cwYhYEMgvPg5CWYU/6S/kxOT+uTRV9oCrhKX5WaB50WnqYcwBa
 gC277kmPQUa9rozNUkwLAAWUAv+D7OD75j2aLL07pW5UUSUwzfR9EoB/udsmMw==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 13 May 2024 09:25:14 +0200
MIME-Version: 1.0
Message-Id: <20240513-rzn1-gmac1-v7-3-6acf58b5440d@bootlin.com>
References: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com>
In-Reply-To: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>, 
 Serge Semin <fancer.lancer@gmail.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: devicetree@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v7 3/7] net: stmmac: Make
 stmmac_xpcs_setup() generic to all PCS devices
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

From: Serge Semin <fancer.lancer@gmail.com>

A pcs_init() callback will be introduced to stmmac in a future patch. This
new function will be called during the hardware initialization phase.
Instead of separately initializing XPCS and PCS components, let's group all
PCS-related hardware initialization logic in the current
stmmac_xpcs_setup() function.

Rename stmmac_xpcs_setup() to stmmac_pcs_setup() and move the conditional
call to stmmac_xpcs_setup() inside the function itself.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
Co-developed-by: Romain Gantois <romain.gantois@bootlin.com>
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 +++-----
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 30 ++++++++++++++---------
 3 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index badfe686a5702..ed38099ca7406 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -360,7 +360,7 @@ enum stmmac_state {
 int stmmac_mdio_unregister(struct net_device *ndev);
 int stmmac_mdio_register(struct net_device *ndev);
 int stmmac_mdio_reset(struct mii_bus *mii);
-int stmmac_xpcs_setup(struct mii_bus *mii);
+int stmmac_pcs_setup(struct net_device *ndev);
 void stmmac_pcs_clean(struct net_device *ndev);
 void stmmac_set_ethtool_ops(struct net_device *netdev);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 0ac99c132733d..ef285b3c56ab9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7754,11 +7754,9 @@ int stmmac_dvr_probe(struct device *device,
 	if (priv->plat->speed_mode_2500)
 		priv->plat->speed_mode_2500(ndev, priv->plat->bsp_priv);
 
-	if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
-		ret = stmmac_xpcs_setup(priv->mii);
-		if (ret)
-			goto error_xpcs_setup;
-	}
+	ret = stmmac_pcs_setup(ndev);
+	if (ret)
+		goto error_pcs_setup;
 
 	ret = stmmac_phy_setup(priv);
 	if (ret) {
@@ -7791,7 +7789,7 @@ int stmmac_dvr_probe(struct device *device,
 	phylink_destroy(priv->phylink);
 error_phy_setup:
 	stmmac_pcs_clean(ndev);
-error_xpcs_setup:
+error_pcs_setup:
 	if (priv->hw->pcs != STMMAC_PCS_TBI &&
 	    priv->hw->pcs != STMMAC_PCS_RTBI)
 		stmmac_mdio_unregister(ndev);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 73ba9901a4439..54708440e27b8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -495,31 +495,37 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 	return 0;
 }
 
-int stmmac_xpcs_setup(struct mii_bus *bus)
+int stmmac_pcs_setup(struct net_device *ndev)
 {
-	struct net_device *ndev = bus->priv;
+	struct dw_xpcs *xpcs = NULL;
 	struct stmmac_priv *priv;
-	struct dw_xpcs *xpcs;
+	int ret = -ENODEV;
 	int mode, addr;
 
 	priv = netdev_priv(ndev);
 	mode = priv->plat->phy_interface;
 
-	/* Try to probe the XPCS by scanning all addresses. */
-	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
-		xpcs = xpcs_create_mdiodev(bus, addr, mode);
-		if (IS_ERR(xpcs))
-			continue;
+	if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
+		/* Try to probe the XPCS by scanning all addresses */
+		for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
+			xpcs = xpcs_create_mdiodev(priv->mii, addr, mode);
+			if (IS_ERR(xpcs))
+				continue;
 
-		priv->hw->xpcs = xpcs;
-		break;
+			ret = 0;
+			break;
+		}
+	} else {
+		return 0;
 	}
 
-	if (!priv->hw->xpcs) {
+	if (ret) {
 		dev_warn(priv->device, "No xPCS found\n");
-		return -ENODEV;
+		return ret;
 	}
 
+	priv->hw->xpcs = xpcs;
+
 	return 0;
 }
 

-- 
2.44.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
