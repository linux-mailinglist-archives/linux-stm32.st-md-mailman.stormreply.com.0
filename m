Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A4C725E00
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 14:08:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB219C6A5FB;
	Wed,  7 Jun 2023 12:08:29 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45464C6A608
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 12:08:28 +0000 (UTC)
X-GND-Sasl: maxime.chevallier@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686139708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GrgFo3H2q3uXB3KxPepXLazZqm3F9wUP/Ceq11kw4Q8=;
 b=nm3p9FV59L0k4MrGfuiIlocHxtlxOZzyPfwuLhO6PHUtoWG0jIeVTzi63C4dLmHlIzmhWP
 HC4I3WsB1dkwCA37y5K9fl2xlurC93+5OeM7N9Hc9mamvRkgaElDfx846Rbhu39HgBoPnN
 eoU+89Wdvfu06pVv6cDMjU9DtJQ6vMpPDlIdOjhi+WuMfGwGQxRtKljK+tMB7YExKjjmKf
 IZg0cjpAgq8eazVFhPUh3vHZy1fsravHOhrgVo6zhIA7Zl6oauZcN7bf8T0X3+ymndnRHO
 6/BN+g5frqE7XVHKTSlsbV7ggCya8VnZlWSs2CoA/OL6ZcWWBRuMYFOtprcezA==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94C32E0007;
 Wed,  7 Jun 2023 12:08:25 +0000 (UTC)
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net
Date: Wed,  7 Jun 2023 15:59:41 +0200
Message-Id: <20230607135941.407054-6-maxime.chevallier@bootlin.com>
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
Subject: [Linux-stm32] [PATCH net-next v4 5/5] net: dwmac_socfpga:
	initialize local data for mdio regmap configuration
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

Explicitely zero-ize the local mdio_regmap_config data, and explicitely
set the .autoscan parameter, as we only have a PCS on this bus.

Fixes: 5d1f3fe7d2d5 ("net: stmmac: dwmac-sogfpga: use the lynx pcs driver")
Suggested-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Suggested-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V3->V4 : Move pcs_regmap_cfg into a more local block, and zeroize mrc
V2->V3 : New patch

 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c   | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 1fb808be843b..6267bcb60206 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -389,7 +389,6 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 	struct net_device	*ndev;
 	struct stmmac_priv	*stpriv;
 	const struct socfpga_dwmac_ops *ops;
-	struct regmap_config pcs_regmap_cfg;
 
 	ops = device_get_match_data(&pdev->dev);
 	if (!ops) {
@@ -447,19 +446,22 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_dvr_remove;
 
-	memset(&pcs_regmap_cfg, 0, sizeof(pcs_regmap_cfg));
-	pcs_regmap_cfg.reg_bits = 16;
-	pcs_regmap_cfg.val_bits = 16;
-	pcs_regmap_cfg.reg_shift = REGMAP_UPSHIFT(1);
-
 	/* Create a regmap for the PCS so that it can be used by the PCS driver,
 	 * if we have such a PCS
 	 */
 	if (dwmac->tse_pcs_base) {
+		struct regmap_config pcs_regmap_cfg;
 		struct mdio_regmap_config mrc;
 		struct regmap *pcs_regmap;
 		struct mii_bus *pcs_bus;
 
+		memset(&pcs_regmap_cfg, 0, sizeof(pcs_regmap_cfg));
+		memset(&mrc, 0, sizeof(mrc));
+
+		pcs_regmap_cfg.reg_bits = 16;
+		pcs_regmap_cfg.val_bits = 16;
+		pcs_regmap_cfg.reg_shift = REGMAP_UPSHIFT(1);
+
 		pcs_regmap = devm_regmap_init_mmio(&pdev->dev, dwmac->tse_pcs_base,
 						   &pcs_regmap_cfg);
 		if (IS_ERR(pcs_regmap)) {
@@ -470,6 +472,7 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 		mrc.regmap = pcs_regmap;
 		mrc.parent = &pdev->dev;
 		mrc.valid_addr = 0x0;
+		mrc.autoscan = false;
 
 		snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-pcs-mii", ndev->name);
 		pcs_bus = devm_mdio_regmap_register(&pdev->dev, &mrc);
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
