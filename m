Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EDCA39A3B
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 12:15:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 572CDC78F8B;
	Tue, 18 Feb 2025 11:15:23 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67EF5C78F8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 11:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2/XmkhtAV+FFIrfL1mhnGOI2K1euQozYUfSv7gmJ9co=; b=uv9rtdpwhiejEz7za9uMb8NeEP
 T8sqYCrF2FK1nOq2k3i69Zn4D9jcQdyiUoVFaDyDH341bsUxurlO34kwJY1kwsHEnGdbtsuuB380d
 10cJ0dc1cYBh7NFv9er7l+XjWCZG/Q+XdrQa7ImH/p78W2lMmb7Su3NFOispLhDG4odjaBvftIANj
 mQ2jsO4yfa5oJ3IHKNKonLXN8XrMwn33i/Df21BO/CqUrOvct1lxSk4IwOdVwmkyCZAz8VDB8O0rE
 fTA5/YCgmF7uyWGOqmTn6jth30rYvy2RLC4CeUzPjvUOxR11Jq+8Hnqf+XTXWywftyOFI7ovH+Ste
 7WaWUNdA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42754 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tkLZG-0001iW-1L;
 Tue, 18 Feb 2025 11:15:10 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tkLYv-004RZ7-Ot; Tue, 18 Feb 2025 11:14:49 +0000
In-Reply-To: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tkLYv-004RZ7-Ot@rmk-PC.armlinux.org.uk>
Date: Tue, 18 Feb 2025 11:14:49 +0000
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
Subject: [Linux-stm32] [PATCH RFC net-next 3/7] net: stmmac: dwc-qos-eth:
 use generic stmmac_set_clk_tx_rate()
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
 .../net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 392574bdd4a4..581c0b40db57 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -30,7 +30,6 @@ struct tegra_eqos {
 
 	struct reset_control *rst;
 	struct clk *clk_slave;
-	struct clk *clk_tx;
 
 	struct gpio_desc *reset;
 };
@@ -145,7 +144,6 @@ static void tegra_eqos_fix_speed(void *priv, int speed, unsigned int mode)
 {
 	struct tegra_eqos *eqos = priv;
 	bool needs_calibration = false;
-	long rate = 125000000;
 	u32 value;
 	int err;
 
@@ -156,7 +154,6 @@ static void tegra_eqos_fix_speed(void *priv, int speed, unsigned int mode)
 		fallthrough;
 
 	case SPEED_10:
-		rate = rgmii_clock(speed);
 		break;
 
 	default:
@@ -203,10 +200,6 @@ static void tegra_eqos_fix_speed(void *priv, int speed, unsigned int mode)
 		value &= ~AUTO_CAL_CONFIG_ENABLE;
 		writel(value, eqos->regs + AUTO_CAL_CONFIG);
 	}
-
-	err = clk_set_rate(eqos->clk_tx, rate);
-	if (err < 0)
-		dev_err(eqos->dev, "failed to set TX rate: %d\n", err);
 }
 
 static int tegra_eqos_init(struct platform_device *pdev, void *priv)
@@ -246,7 +239,7 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 			eqos->clk_slave = data->clks[i].clk;
 			data->stmmac_clk = eqos->clk_slave;
 		} else if (strcmp(data->clks[i].id, "tx") == 0) {
-			eqos->clk_tx = data->clks[i].clk;
+			data->clk_tx_i = data->clks[i].clk;
 		}
 	}
 
@@ -282,6 +275,7 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 
 bypass_clk_reset_gpio:
 	data->fix_mac_speed = tegra_eqos_fix_speed;
+	data->set_clk_tx_rate = stmmac_set_clk_tx_rate;
 	data->init = tegra_eqos_init;
 	data->bsp_priv = eqos;
 	data->flags |= STMMAC_FLAG_SPH_DISABLE;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
