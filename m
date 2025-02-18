Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3785A39A3D
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 12:15:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6112AC78F87;
	Tue, 18 Feb 2025 11:15:30 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88189C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z6JrrogbArX3EwFwjiBuFp6vVepOdYswoCOinStaIO8=; b=tgNGnRszu7KRQVhPsRSiPbUQnN
 2jqrw/fF1aEgjDY6+hiFyt5hv9Pea+7JKyP9erfYrpn95M2bx2tHzI/zmKJkZpPXvBt+V9ZENGXdy
 jDO9jdH9KiblQ54w5p3mCP6FjT4TEhMDDRWD2hNjTW7UF+p3RDGiEfHt7rzGzkyzoZeDxmtOemDZZ
 MVdl/XSiGYzjO4be4wgFNuF/lEoc3Drx7X+aKLKJr4EmbYdBOrMNpE+FsMaDa9MDSPjQ5gC+aUZJR
 Jjw5XxKKJxs0Bk/MZv7SuIwVo3Tze5qVq4/OowF7HnslVfOTw42rCNUebXHQOR3bC4NUJydKUzxHc
 P8gMRr0g==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51248 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tkLZL-0001j4-1N;
 Tue, 18 Feb 2025 11:15:15 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tkLZ0-004RZH-SL; Tue, 18 Feb 2025 11:14:54 +0000
In-Reply-To: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tkLZ0-004RZH-SL@rmk-PC.armlinux.org.uk>
Date: Tue, 18 Feb 2025 11:14:54 +0000
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jon Hunter <jonathanh@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
 Thierry Reding <treding@nvidia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-arm-kernel@lists.infradead.org,
 Paolo Abeni <pabeni@redhat.com>, Inochi Amaoto <inochiama@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH RFC net-next 4/7] net: stmmac: starfive: use
 generic stmmac_set_clk_tx_rate()
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

Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
clock.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 26 +++----------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index 282c846dad0b..5e31cb3bb4b8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -27,27 +27,9 @@ struct starfive_dwmac_data {
 
 struct starfive_dwmac {
 	struct device *dev;
-	struct clk *clk_tx;
 	const struct starfive_dwmac_data *data;
 };
 
-static void starfive_dwmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
-{
-	struct starfive_dwmac *dwmac = priv;
-	long rate;
-	int err;
-
-	rate = rgmii_clock(speed);
-	if (rate < 0) {
-		dev_err(dwmac->dev, "invalid speed %d\n", speed);
-		return;
-	}
-
-	err = clk_set_rate(dwmac->clk_tx, rate);
-	if (err)
-		dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
-}
-
 static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
 {
 	struct starfive_dwmac *dwmac = plat_dat->bsp_priv;
@@ -122,9 +104,9 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
 
 	dwmac->data = device_get_match_data(&pdev->dev);
 
-	dwmac->clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
-	if (IS_ERR(dwmac->clk_tx))
-		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_tx),
+	plat_dat->clk_tx_i = devm_clk_get_enabled(&pdev->dev, "tx");
+	if (IS_ERR(plat_dat->clk_tx_i))
+		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat->clk_tx_i),
 				     "error getting tx clock\n");
 
 	clk_gtx = devm_clk_get_enabled(&pdev->dev, "gtx");
@@ -139,7 +121,7 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
 	 * internally, because rgmii_rxin will be adaptively adjusted.
 	 */
 	if (!device_property_read_bool(&pdev->dev, "starfive,tx-use-rgmii-clk"))
-		plat_dat->fix_mac_speed = starfive_dwmac_fix_mac_speed;
+		plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
 
 	dwmac->dev = &pdev->dev;
 	plat_dat->bsp_priv = dwmac;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
