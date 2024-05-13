Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 995AE8C3BDF
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2024 09:24:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 076A1C6C838;
	Mon, 13 May 2024 07:24:47 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0AFA5C6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 07:24:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68D3420013;
 Mon, 13 May 2024 07:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715585083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d8DEnR7Vsu1dYEHLUDLUrKJDthlP0UhWogu5sP7ZpV0=;
 b=atvZ28IOPJ/7gXI9wJ5lOWl7GABpMIq+CO7/O7bl3xETKTRzYg33zdSH/rg665n80gdgNb
 ngFsZZtiLPjQoo7+uPvC/Ty9Rw3zSlQ4P8nRoMFtto6fsS/aicFDFVnhIOJV62dEaNRGwF
 8SkwuWcTCtoGyYCcz4PLxXZvXF9Rizxad+YNhSrQyYzn67Kn86KVJBATjtMLRFmddbF58f
 MxRUZKyLD4tBZ5s1tPMeza3C6znnjzm3sfYNQ3afGfCk5g0WnkHmkRUqJmB8W630wUHwJB
 3cv12XOgg+HI1hGLxbZHJI8xjjnsw8GEyy37wM+tuomQxqsQPfmOisj1a7eLzQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 13 May 2024 09:25:15 +0200
MIME-Version: 1.0
Message-Id: <20240513-rzn1-gmac1-v7-4-6acf58b5440d@bootlin.com>
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
Subject: [Linux-stm32] [PATCH net-next v7 4/7] net: stmmac: introduce
 pcs_init/pcs_exit stmmac operations
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

From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

Introduce a mechanism whereby platforms can create their PCS instances
prior to the network device being published to userspace, but after
some of the core stmmac initialisation has been completed. This means
that the data structures that platforms need will be available.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
Co-developed-by: Romain Gantois <romain.gantois@bootlin.com>
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 8 +++++++-
 include/linux/stmmac.h                            | 2 ++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 54708440e27b8..aa43117134d38 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -505,7 +505,10 @@ int stmmac_pcs_setup(struct net_device *ndev)
 	priv = netdev_priv(ndev);
 	mode = priv->plat->phy_interface;
 
-	if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
+	if (priv->plat->pcs_init) {
+		ret = priv->plat->pcs_init(priv);
+	} else if (priv->plat->mdio_bus_data &&
+		   priv->plat->mdio_bus_data->has_xpcs) {
 		/* Try to probe the XPCS by scanning all addresses */
 		for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
 			xpcs = xpcs_create_mdiodev(priv->mii, addr, mode);
@@ -533,6 +536,9 @@ void stmmac_pcs_clean(struct net_device *ndev)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
 
+	if (priv->plat->pcs_exit)
+		priv->plat->pcs_exit(priv);
+
 	if (!priv->hw->xpcs)
 		return;
 
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index dfa1828cd756a..4a24a246c617d 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -285,6 +285,8 @@ struct plat_stmmacenet_data {
 	int (*crosststamp)(ktime_t *device, struct system_counterval_t *system,
 			   void *ctx);
 	void (*dump_debug_regs)(void *priv);
+	int (*pcs_init)(struct stmmac_priv *priv);
+	void (*pcs_exit)(struct stmmac_priv *priv);
 	void *bsp_priv;
 	struct clk *stmmac_clk;
 	struct clk *pclk;

-- 
2.44.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
