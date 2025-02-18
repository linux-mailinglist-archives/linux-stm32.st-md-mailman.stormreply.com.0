Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B823CA39A3E
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 12:15:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78156C78F87;
	Tue, 18 Feb 2025 11:15:34 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F1C7C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 11:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KSe0c69jHaZowf9s+caWtXk4sDZG6Bn7YtQiiu7h0+0=; b=pv4grxLOfAy1HTamSWjhCAJhnd
 vDFC0rhwnWlZcDfja5x8XaQsRi/2wTZYbHddAcMYqYvgT0GTl8g5vdyX3PASsLLan5wpnyrbLJ9Zj
 qtTcQzKGb4+nMCB5j8uC+3V3Jp+8u5bgJ2PvnykzggWLcbnzSX/d2xW3pSQ26APCp+buv83oT2w3g
 ZbZuLTNK0ZyUz4Cm5LLbzCassiQLRKhlmDifBsCyLTxCFd0PNz5F1qDSoFWFVhPgZ3dV83psZFDMm
 ltndkBeMLWG5DqDZpKJE0l59sUtvQjLEAQtJmVPRqCLKkflVWDFqYe/cHSSUIa/h1fnwvTN7hT33O
 O++gP5yg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51256 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tkLZQ-0001jR-2t;
 Tue, 18 Feb 2025 11:15:21 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tkLZ6-004RZO-0H; Tue, 18 Feb 2025 11:15:00 +0000
In-Reply-To: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tkLZ6-004RZO-0H@rmk-PC.armlinux.org.uk>
Date: Tue, 18 Feb 2025 11:15:00 +0000
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
Subject: [Linux-stm32] [PATCH RFC net-next 5/7] net: stmmac: s32: use
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
 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 22 +++----------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
index 6a498833b8ed..b76bfa41af82 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
@@ -100,24 +100,6 @@ static void s32_gmac_exit(struct platform_device *pdev, void *priv)
 	clk_disable_unprepare(gmac->rx_clk);
 }
 
-static void s32_fix_mac_speed(void *priv, int speed, unsigned int mode)
-{
-	struct s32_priv_data *gmac = priv;
-	long tx_clk_rate;
-	int ret;
-
-	tx_clk_rate = rgmii_clock(speed);
-	if (tx_clk_rate < 0) {
-		dev_err(gmac->dev, "Unsupported/Invalid speed: %d\n", speed);
-		return;
-	}
-
-	dev_dbg(gmac->dev, "Set tx clock to %ld Hz\n", tx_clk_rate);
-	ret = clk_set_rate(gmac->tx_clk, tx_clk_rate);
-	if (ret)
-		dev_err(gmac->dev, "Can't set tx clock\n");
-}
-
 static int s32_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat;
@@ -172,7 +154,9 @@ static int s32_dwmac_probe(struct platform_device *pdev)
 
 	plat->init = s32_gmac_init;
 	plat->exit = s32_gmac_exit;
-	plat->fix_mac_speed = s32_fix_mac_speed;
+
+	plat->clk_tx_i = dmac->tx_clk;
+	plat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
 
 	plat->bsp_priv = gmac;
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
