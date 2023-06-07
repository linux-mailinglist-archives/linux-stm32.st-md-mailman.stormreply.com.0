Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F96725DFE
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 14:08:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 993CFC6A5FB;
	Wed,  7 Jun 2023 12:08:24 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 685D2C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 12:08:23 +0000 (UTC)
X-GND-Sasl: maxime.chevallier@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686139703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JAZzarZqhM2iVjfpFiTJa4PhaSPy8dShUtf29Ng6/6c=;
 b=YxldgSAcYSesTyWKUeEpxssivRO2lMjbEBJ77yE0epqggeY6sbg/z8rajFXfHTPIfYDxVn
 xAYbLzj5wlB7whJ1PQLOhAilmC/Vlo/ZcmyGZSnsQX4INlswuMvHygawRRQY0soXE2Mjog
 saE6hlbl+wJoVkxrgECrIETaMuYVhxV3V2bSOVQc6SpMhAp/aJBSa+7jwLwo7fbeXatvOU
 A4r1AFQ07ul9QDae+xDRZlOXdX87a4TTSJB97ccP82vZHiicGWITB/2TZqgnmCf3OiPWQB
 uHOUkhgFHu0rdG0qnSybOzpx5jeoChUcdrCyaZO+Q3me7uBLGcM0lfhwyWtn7A==
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
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E559CE0012;
 Wed,  7 Jun 2023 12:08:20 +0000 (UTC)
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net
Date: Wed,  7 Jun 2023 15:59:39 +0200
Message-Id: <20230607135941.407054-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607135941.407054-1-maxime.chevallier@bootlin.com>
References: <20230607135941.407054-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Eric Dumazet <edumazet@google.com>, thomas.petazzoni@bootlin.com,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <simon.horman@corigine.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, alexis.lothore@bootlin.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Feiyang Chen <chenfeiyang@loongson.cn>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next v4 3/5] net: stmmac: make the
	pcs_lynx cleanup sequence specific to dwmac_socfpga
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

So far, only the dwmac_socfpga variant of stmmac uses PCS Lynx. Use a
dedicated cleanup sequence for dwmac_socfpga instead of using the
generic stmmac one.

Fixes: 5d1f3fe7d2d5 ("net: stmmac: dwmac-sogfpga: use the lynx pcs driver")
Suggested-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V3->V4 : No changes
V2->V3 : Removed extra whiteline
V1->V2 : New patch

 drivers/net/ethernet/stmicro/stmmac/common.h       |  1 -
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    | 14 +++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c  |  3 ---
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 52c5ec553276..16e67c18b6f7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -16,7 +16,6 @@
 #include <linux/stmmac.h>
 #include <linux/phy.h>
 #include <linux/pcs/pcs-xpcs.h>
-#include <linux/pcs-lynx.h>
 #include <linux/module.h>
 #if IS_ENABLED(CONFIG_VLAN_8021Q)
 #define STMMAC_VLAN_TAG_USED
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index e399fccbafe5..1fb808be843b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -11,6 +11,7 @@
 #include <linux/phy.h>
 #include <linux/regmap.h>
 #include <linux/mdio/mdio-regmap.h>
+#include <linux/pcs-lynx.h>
 #include <linux/reset.h>
 #include <linux/stmmac.h>
 
@@ -494,6 +495,17 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void socfpga_dwmac_remove(struct platform_device *pdev)
+{
+	struct net_device *ndev = platform_get_drvdata(pdev);
+	struct stmmac_priv *priv = netdev_priv(ndev);
+	struct phylink_pcs *pcs = priv->hw->lynx_pcs;
+
+	stmmac_pltfr_remove(pdev);
+
+	lynx_pcs_destroy(pcs);
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int socfpga_dwmac_resume(struct device *dev)
 {
@@ -565,7 +577,7 @@ MODULE_DEVICE_TABLE(of, socfpga_dwmac_match);
 
 static struct platform_driver socfpga_dwmac_driver = {
 	.probe  = socfpga_dwmac_probe,
-	.remove_new = stmmac_pltfr_remove,
+	.remove_new = socfpga_dwmac_remove,
 	.driver = {
 		.name           = "socfpga-dwmac",
 		.pm		= &socfpga_dwmac_pm_ops,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index c784a6731f08..3db1cb0fd160 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -665,9 +665,6 @@ int stmmac_mdio_unregister(struct net_device *ndev)
 	if (priv->hw->xpcs)
 		xpcs_destroy(priv->hw->xpcs);
 
-	if (priv->hw->lynx_pcs)
-		lynx_pcs_destroy(priv->hw->lynx_pcs);
-
 	mdiobus_unregister(priv->mii);
 	priv->mii->priv = NULL;
 	mdiobus_free(priv->mii);
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
