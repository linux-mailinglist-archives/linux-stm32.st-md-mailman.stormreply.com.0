Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFC7A87B78
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Apr 2025 11:07:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60154C78028;
	Mon, 14 Apr 2025 09:07:26 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01D6CC71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Apr 2025 09:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Px4QFGrKJWtbtdsi+c1vt/WEwND1NnX28cuVBKiVNEk=; b=xcSBKWI5TmOKz5Gxr4tNMhNkFJ
 ZhioFfRMcU/hVAvkR85LhHSFVEQCvlffVyrCyVtrSvPveuN6lqePKWqa8Qkd9tWVNpYsjUh0DzoLq
 9FXkDibIBeIXB+2QcCRDpZhWhWGtii2O2WpusvjsbMg13FLWSZt++7E2U+m3Ym6hNbinzhIy46dZP
 pmmkbyzsoVt81xYlkVeNpP3xpV2Z9dkyP5Q1a05Gzq/FAPT65pcFqqdrxH8LspqVgGAhsXv2DRLs3
 k99CQoicutHze6S4rlcZihKhweeoIKaLB1ncAsGnHqfLjbQLu314UVuM/8r9IhQmH0BfoYnXUovCI
 McJVv1iQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57824 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u4Fmc-0006Da-1k;
 Mon, 14 Apr 2025 10:07:14 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u4Flp-000XlM-Tb; Mon, 14 Apr 2025 10:06:25 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u4Flp-000XlM-Tb@rmk-PC.armlinux.org.uk>
Date: Mon, 14 Apr 2025 10:06:25 +0100
Cc: imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 netdev@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Fabio Estevam <festevam@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2] net: stmmac: imx: use
	stmmac_pltfr_probe()
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

Using stmmac_pltfr_probe() simplifies the probe function. This will not
only call plat_dat->init (imx_dwmac_init), but also plat_dat->exit
(imx_dwmac_exit) appropriately if stmmac_dvr_probe() fails. This
results in an overall simplification of the glue driver.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 5d279fa54b3e..889e2bb6f7f5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -379,10 +379,6 @@ static int imx_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = imx_dwmac_init(pdev, dwmac);
-	if (ret)
-		goto err_dwmac_init;
-
 	if (dwmac->ops->fix_mac_speed) {
 		plat_dat->fix_mac_speed = dwmac->ops->fix_mac_speed;
 	} else if (!dwmac->ops->mac_rgmii_txclk_auto_adj) {
@@ -392,16 +388,10 @@ static int imx_dwmac_probe(struct platform_device *pdev)
 
 	dwmac->plat_dat->fix_soc_reset = dwmac->ops->fix_soc_reset;
 
-	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
+	ret = stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 	if (ret)
-		goto err_drv_probe;
-
-	return 0;
+		imx_dwmac_clks_config(dwmac, false);
 
-err_drv_probe:
-	imx_dwmac_exit(pdev, plat_dat->bsp_priv);
-err_dwmac_init:
-	imx_dwmac_clks_config(dwmac, false);
 	return ret;
 }
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
