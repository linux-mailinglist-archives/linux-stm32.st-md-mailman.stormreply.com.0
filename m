Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5191A86BC6
	for <lists+linux-stm32@lfdr.de>; Sat, 12 Apr 2025 10:09:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 621ACC78F77;
	Sat, 12 Apr 2025 08:09:15 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB239C78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Apr 2025 08:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T1Mb38BSjKzMqPH9UJFq9q1axHklKlcNwBEoVhdqgOg=; b=svstFTNkQmymYuNbmb76DKR8jj
 KUdMC1U5AIo8ggJDqlkxWgF8MmMloTAw9Rzm1U0GNtI51U2Y5Lc77sTzdLArj+gWXWdvkHSvfM0Ep
 GAP9VQreSQzh4XPLpyCaE68mGNS0s04QQgNt1lQjW+Dn5u7mxT5al2xfmOPMnsgv7qc4jlaThT8Pt
 LhX4CCwntotIoCWeFMs5nctO+wupOvLJT240wxFuIBCWjttTpFT+BMWbddIvRd8MY4A1ZuUvuUCGg
 esQZ03zHo54z2NLRZniWYXZggO/se9cEJKrpJx4i+AW64mgzYCgfIvIF+hEB6Pu3cpPd2yxIVMJeE
 W+zDC5qQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45140 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u3VvH-0004Lt-0f;
 Sat, 12 Apr 2025 09:09:07 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u3Vuf-000E7g-U4; Sat, 12 Apr 2025 09:08:29 +0100
In-Reply-To: <Z_oe0U5E0i3uZbop@shell.armlinux.org.uk>
References: <Z_oe0U5E0i3uZbop@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u3Vuf-000E7g-U4@rmk-PC.armlinux.org.uk>
Date: Sat, 12 Apr 2025 09:08:29 +0100
Cc: Thierry Reding <treding@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 1/5] net: stmmac: dwc-qos: remove
 tegra_eqos_init()
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

tegra_eqos_init() initialises the 1US TIC counter for the EEE timers.
However, the DWGMAC core is reset after this write, which clears
this register to its default.

However, dwmac4_core_init() configures this register using the same
clock, which happens after reset - thus this is the write which
ensures that the register is correctly configured.

Therefore, tegra_eqos_init() is not required and is removed. This also
means eqos->clk_slave can also be removed.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 24 +------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 5db318327d33..583b5c071cd1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -29,7 +29,6 @@ struct tegra_eqos {
 	void __iomem *regs;
 
 	struct reset_control *rst;
-	struct clk *clk_slave;
 
 	struct gpio_desc *reset;
 };
@@ -199,20 +198,6 @@ static void tegra_eqos_fix_speed(void *priv, int speed, unsigned int mode)
 	}
 }
 
-static int tegra_eqos_init(struct platform_device *pdev, void *priv)
-{
-	struct tegra_eqos *eqos = priv;
-	unsigned long rate;
-	u32 value;
-
-	rate = clk_get_rate(eqos->clk_slave);
-
-	value = (rate / 1000000) - 1;
-	writel(value, eqos->regs + GMAC_1US_TIC_COUNTER);
-
-	return 0;
-}
-
 static int tegra_eqos_probe(struct platform_device *pdev,
 			    struct plat_stmmacenet_data *plat_dat,
 			    struct stmmac_resources *res)
@@ -227,7 +212,6 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 
 	eqos->dev = &pdev->dev;
 	eqos->regs = res->addr;
-	eqos->clk_slave = plat_dat->stmmac_clk;
 
 	if (!is_of_node(dev->fwnode))
 		goto bypass_clk_reset_gpio;
@@ -267,17 +251,11 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 bypass_clk_reset_gpio:
 	plat_dat->fix_mac_speed = tegra_eqos_fix_speed;
 	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
-	plat_dat->init = tegra_eqos_init;
 	plat_dat->bsp_priv = eqos;
 	plat_dat->flags |= STMMAC_FLAG_SPH_DISABLE;
 
-	err = tegra_eqos_init(pdev, eqos);
-	if (err < 0)
-		goto reset;
-
 	return 0;
-reset:
-	reset_control_assert(eqos->rst);
+
 reset_phy:
 	gpiod_set_value(eqos->reset, 1);
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
