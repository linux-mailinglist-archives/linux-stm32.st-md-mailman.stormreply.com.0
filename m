Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B18C719F6D
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Jun 2023 16:15:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F1FDC6A61E;
	Thu,  1 Jun 2023 14:15:12 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91138C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jun 2023 14:15:10 +0000 (UTC)
X-GND-Sasl: maxime.chevallier@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1685628910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FbF9YiR1UaImGOv/TekzB+7e07IepTmsR1e+tk9jk7k=;
 b=PgLJCyf/9Ceg6ezO92AoOw3M45jJiJpxeHT6se9mGNWfy3rdZ/7POe5sNa709xNJgM9D3L
 Vu0riRXXSojli6ajUMXnXhsUKuc3cfhuYodGJy2x+p9aekpxL0cznTXQ9+AJ+xMLfNR8t0
 9hx1PEtVJ5yyFQeb2K/RchX4ub+yoepPHmF+k9wUsZBclbXskih6rX7b+fB+GWBihnepW4
 VlCaEH6sjw4rJKftp0TS97MFzkjnsSdvagHUkRIITlo0d0aU6NtDg+7gkdwKry3TBvc2q1
 zkL9VhNZNeL1fgJq9mcBeHMCp//pu4B/kwrqPmshuLHcYBOZN9XP50JL2IQOzg==
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 219A62000A;
 Thu,  1 Jun 2023 14:15:07 +0000 (UTC)
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Mark Brown <broonie@kernel.org>,
	davem@davemloft.net
Date: Thu,  1 Jun 2023 16:14:52 +0200
Message-Id: <20230601141454.67858-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601141454.67858-1-maxime.chevallier@bootlin.com>
References: <20230601141454.67858-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 alexis.lothore@bootlin.com, thomas.petazzoni@bootlin.com,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Simon Horman <simon.horman@corigine.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next v4 2/4] net: ethernet: altera-tse:
	Convert to mdio-regmap and use PCS Lynx
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

The newly introduced regmap-based MDIO driver allows for an easy mapping
of an mdiodevice onto the memory-mapped TSE PCS, which is actually a
Lynx PCS.

Convert Altera TSE to use this PCS instead of the pcs-altera-tse, which
is nothing more than a memory-mapped Lynx PCS.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V3->V4 :
 - Use pcs_lynxcreate()/destroy() introduced by Russell
 - Fix the error path
 - Add back misplaced KConfig dependencies
V2->V3 : No changes
V1->V2 : No changes

 drivers/net/ethernet/altera/Kconfig           |  2 +
 drivers/net/ethernet/altera/altera_tse_main.c | 57 ++++++++++++++++---
 2 files changed, 50 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/altera/Kconfig b/drivers/net/ethernet/altera/Kconfig
index dd7fd41ccde5..93533ba03429 100644
--- a/drivers/net/ethernet/altera/Kconfig
+++ b/drivers/net/ethernet/altera/Kconfig
@@ -5,6 +5,8 @@ config ALTERA_TSE
 	select PHYLIB
 	select PHYLINK
 	select PCS_ALTERA_TSE
+	select MDIO_REGMAP
+	select REGMAP_MMIO
 	help
 	  This driver supports the Altera Triple-Speed (TSE) Ethernet MAC.
 
diff --git a/drivers/net/ethernet/altera/altera_tse_main.c b/drivers/net/ethernet/altera/altera_tse_main.c
index 190ff1bcd94e..d866c0f1b503 100644
--- a/drivers/net/ethernet/altera/altera_tse_main.c
+++ b/drivers/net/ethernet/altera/altera_tse_main.c
@@ -27,14 +27,16 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mii.h>
+#include <linux/mdio/mdio-regmap.h>
 #include <linux/netdevice.h>
 #include <linux/of_device.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
 #include <linux/of_platform.h>
-#include <linux/pcs-altera-tse.h>
+#include <linux/pcs-lynx.h>
 #include <linux/phy.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/skbuff.h>
 #include <asm/cacheflush.h>
 
@@ -1132,13 +1134,16 @@ static int request_and_map(struct platform_device *pdev, const char *name,
 static int altera_tse_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *of_id = NULL;
+	struct regmap_config pcs_regmap_cfg;
 	struct altera_tse_private *priv;
+	struct mdio_regmap_config mrc;
 	struct resource *control_port;
+	struct regmap *pcs_regmap;
 	struct resource *dma_res;
 	struct resource *pcs_res;
+	struct mii_bus *pcs_bus;
 	struct net_device *ndev;
 	void __iomem *descmap;
-	int pcs_reg_width = 2;
 	int ret = -ENODEV;
 
 	ndev = alloc_etherdev(sizeof(struct altera_tse_private));
@@ -1255,12 +1260,32 @@ static int altera_tse_probe(struct platform_device *pdev)
 	 * address space, but if it's not the case, we fallback to the mdiophy0
 	 * from the MAC's address space
 	 */
-	ret = request_and_map(pdev, "pcs", &pcs_res,
-			      &priv->pcs_base);
+	ret = request_and_map(pdev, "pcs", &pcs_res, &priv->pcs_base);
 	if (ret) {
+		/* If we can't find a dedicated resource for the PCS, fallback
+		 * to the internal PCS, that has a different address stride
+		 */
 		priv->pcs_base = priv->mac_dev + tse_csroffs(mdio_phy0);
-		pcs_reg_width = 4;
+		pcs_regmap_cfg.reg_bits = 32;
+		/* Values are MDIO-like values, on 16 bits */
+		pcs_regmap_cfg.val_bits = 16;
+		pcs_regmap_cfg.reg_shift = REGMAP_UPSHIFT(2);
+	} else {
+		pcs_regmap_cfg.reg_bits = 16;
+		pcs_regmap_cfg.val_bits = 16;
+		pcs_regmap_cfg.reg_shift = REGMAP_UPSHIFT(1);
+	}
+
+	/* Create a regmap for the PCS so that it can be used by the PCS driver */
+	pcs_regmap = devm_regmap_init_mmio(&pdev->dev, priv->pcs_base,
+					   &pcs_regmap_cfg);
+	if (IS_ERR(pcs_regmap)) {
+		ret = PTR_ERR(pcs_regmap);
+		goto err_free_netdev;
 	}
+	mrc.regmap = pcs_regmap;
+	mrc.parent = &pdev->dev;
+	mrc.valid_addr = 0x0;
 
 	/* Rx IRQ */
 	priv->rx_irq = platform_get_irq_byname(pdev, "rx_irq");
@@ -1384,7 +1409,18 @@ static int altera_tse_probe(struct platform_device *pdev)
 			 (unsigned long) control_port->start, priv->rx_irq,
 			 priv->tx_irq);
 
-	priv->pcs = alt_tse_pcs_create(ndev, priv->pcs_base, pcs_reg_width);
+	snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-pcs-mii", ndev->name);
+	pcs_bus = devm_mdio_regmap_register(&pdev->dev, &mrc);
+	if (IS_ERR(pcs_bus)) {
+		ret = PTR_ERR(pcs_bus);
+		goto err_init_pcs;
+	}
+
+	priv->pcs = lynx_pcs_create_mdiodev(pcs_bus, 0);
+	if (IS_ERR(priv->pcs)) {
+		ret = PTR_ERR(priv->pcs);
+		goto err_init_pcs;
+	}
 
 	priv->phylink_config.dev = &ndev->dev;
 	priv->phylink_config.type = PHYLINK_NETDEV;
@@ -1407,12 +1443,13 @@ static int altera_tse_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->phylink)) {
 		dev_err(&pdev->dev, "failed to create phylink\n");
 		ret = PTR_ERR(priv->phylink);
-		goto err_init_phy;
+		goto err_init_phylink;
 	}
 
 	return 0;
-
-err_init_phy:
+err_init_phylink:
+	lynx_pcs_destroy(priv->pcs);
+err_init_pcs:
 	unregister_netdev(ndev);
 err_register_netdev:
 	netif_napi_del(&priv->napi);
@@ -1433,6 +1470,8 @@ static int altera_tse_remove(struct platform_device *pdev)
 	altera_tse_mdio_destroy(ndev);
 	unregister_netdev(ndev);
 	phylink_destroy(priv->phylink);
+	lynx_pcs_destroy(priv->pcs);
+
 	free_netdev(ndev);
 
 	return 0;
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
