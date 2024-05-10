Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 745AA8C1F12
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2024 09:37:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CAC8C6DD6E;
	Fri, 10 May 2024 07:37:40 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5281C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2024 07:37:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7706240006;
 Fri, 10 May 2024 07:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715326653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7rIpZAk8Wec4E2PAYnFztgJW8F7HaR4BB0LLl7tUusw=;
 b=UPl9+D8cgsOH1S+lx1D0pngAsI3a7o768jWCFoQSMDcbS0wWKKGBXQ9QbgrcWDDzhH9O1k
 9orAUeI3HhSJCyW5zxO5osRhozCg94i/0p2mt/jXWRlkPyp/uYwKCpfdIJDKxM5V4m0YPv
 z1kwaukUDu/nRCbcNxAJ33QW0vdjMQi/Oy7oGanz3DwH7uckCjKTaH7Kt8cuqDgyg9HR2B
 NS3nxkh+A2yXhxa4u5/E+/uDaCqspaFHyle81z50twC/r+gHtSaoEswslA4LeyaRviGVCw
 D+XebuO8eKB9osbWdZZBUtKIBPJ4ZTFX+0pGpaJqpqLmJtfWkYmI5oI5/9uYaA==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Fri, 10 May 2024 09:38:09 +0200
MIME-Version: 1.0
Message-Id: <20240510-rzn1-gmac1-v6-2-b63942be334c@bootlin.com>
References: <20240510-rzn1-gmac1-v6-0-b63942be334c@bootlin.com>
In-Reply-To: <20240510-rzn1-gmac1-v6-0-b63942be334c@bootlin.com>
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 2/7] net: stmmac: Add dedicated
 XPCS cleanup method
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

Currently the XPCS handler destruction is performed in the
stmmac_mdio_unregister() method. It doesn't look good because the handler
isn't originally created in the corresponding protagonist
stmmac_mdio_unregister(), but in the stmmac_xpcs_setup() function. In
order to have more coherent MDIO and XPCS setup/cleanup procedures,
let's move the DW XPCS destruction to the dedicated stmmac_pcs_clean()
method.

This method will also be used to cleanup PCS hardware using the
pcs_exit() callback that will be introduced to stmmac in a subsequent
patch.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
Co-developed-by: Romain Gantois <romain.gantois@bootlin.com>
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  6 +++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 14 +++++++++++---
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index dddcaa9220cc3..badfe686a5702 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -361,6 +361,7 @@ int stmmac_mdio_unregister(struct net_device *ndev);
 int stmmac_mdio_register(struct net_device *ndev);
 int stmmac_mdio_reset(struct mii_bus *mii);
 int stmmac_xpcs_setup(struct mii_bus *mii);
+void stmmac_pcs_clean(struct net_device *ndev);
 void stmmac_set_ethtool_ops(struct net_device *netdev);
 
 int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3d828904db0d3..0ac99c132733d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7789,8 +7789,9 @@ int stmmac_dvr_probe(struct device *device,
 
 error_netdev_register:
 	phylink_destroy(priv->phylink);
-error_xpcs_setup:
 error_phy_setup:
+	stmmac_pcs_clean(ndev);
+error_xpcs_setup:
 	if (priv->hw->pcs != STMMAC_PCS_TBI &&
 	    priv->hw->pcs != STMMAC_PCS_RTBI)
 		stmmac_mdio_unregister(ndev);
@@ -7832,6 +7833,9 @@ void stmmac_dvr_remove(struct device *dev)
 	if (priv->plat->stmmac_rst)
 		reset_control_assert(priv->plat->stmmac_rst);
 	reset_control_assert(priv->plat->stmmac_ahb_rst);
+
+	stmmac_pcs_clean(ndev);
+
 	if (priv->hw->pcs != STMMAC_PCS_TBI &&
 	    priv->hw->pcs != STMMAC_PCS_RTBI)
 		stmmac_mdio_unregister(ndev);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 0542cfd1817e6..73ba9901a4439 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -523,6 +523,17 @@ int stmmac_xpcs_setup(struct mii_bus *bus)
 	return 0;
 }
 
+void stmmac_pcs_clean(struct net_device *ndev)
+{
+	struct stmmac_priv *priv = netdev_priv(ndev);
+
+	if (!priv->hw->xpcs)
+		return;
+
+	xpcs_destroy(priv->hw->xpcs);
+	priv->hw->xpcs = NULL;
+}
+
 /**
  * stmmac_mdio_register
  * @ndev: net device structure
@@ -679,9 +690,6 @@ int stmmac_mdio_unregister(struct net_device *ndev)
 	if (!priv->mii)
 		return 0;
 
-	if (priv->hw->xpcs)
-		xpcs_destroy(priv->hw->xpcs);
-
 	mdiobus_unregister(priv->mii);
 	priv->mii->priv = NULL;
 	mdiobus_free(priv->mii);

-- 
2.44.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
