Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5163FB214EE
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Aug 2025 20:52:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14D23C32E92;
	Mon, 11 Aug 2025 18:52:22 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83621C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 18:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M/S0cJbJg5QrypEk+l+ONw5GMA5PTBkjJDdcSmQljP8=; b=t0rlPxPGDH5hefPQCFywuhyeMV
 3u4/KinXn1lXtGJzStGXo0GOzimLzSy82f8lXcrSc5tVYFymIhKAd34+OJpjJQ4FWOTlmurw+RRY8
 19BELTfMZ+RNlXQfwfhMeIyv7zkD+zO/FlSYsKjcKypS1I7usZgMm0mIJzzqS3AXngMYn+NmwZpnI
 V5ius7P0Aff0wDeAXQaeEfkw/Ern8maQTVhqPKw7TwxqlpbjvKnvsBqcutBNx3t0u6cOlyt9V1w16
 +zboN9a7GeydNKBTtJ8GbEkS8ufMyswDWjMkoJkNzasmWLVpHWPC/dFYSqmkhJRu05vBQFpTqc4TY
 Y50M6npQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36320 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1ulXcw-0003cQ-1b;
 Mon, 11 Aug 2025 19:52:10 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1ulXcC-008grN-Hc; Mon, 11 Aug 2025 19:51:24 +0100
In-Reply-To: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
References: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1ulXcC-008grN-Hc@rmk-PC.armlinux.org.uk>
Date: Mon, 11 Aug 2025 19:51:24 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH net-next 9/9] net: stmmac: mediatek: convert
 to resume() method
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

Convert mediatek to use the resume() platform method rather than the
init() platform method as mediatek_dwmac_init() is only called from
the resume paths.

This will ensure that in a future commit, mediatek_dwmac_init() won't
be called when probing the main part of the stmmac driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 39421d6a34e4..f1b36f0a401d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -523,7 +523,7 @@ static int mediatek_dwmac_clk_init(struct mediatek_dwmac_plat_data *plat)
 	return ret;
 }
 
-static int mediatek_dwmac_init(struct platform_device *pdev, void *priv)
+static int mediatek_dwmac_init(struct device *dev, void *priv)
 {
 	struct mediatek_dwmac_plat_data *plat = priv;
 	const struct mediatek_dwmac_variant *variant = plat->variant;
@@ -532,7 +532,7 @@ static int mediatek_dwmac_init(struct platform_device *pdev, void *priv)
 	if (variant->dwmac_set_phy_interface) {
 		ret = variant->dwmac_set_phy_interface(plat);
 		if (ret) {
-			dev_err(plat->dev, "failed to set phy interface, err = %d\n", ret);
+			dev_err(dev, "failed to set phy interface, err = %d\n", ret);
 			return ret;
 		}
 	}
@@ -540,7 +540,7 @@ static int mediatek_dwmac_init(struct platform_device *pdev, void *priv)
 	if (variant->dwmac_set_delay) {
 		ret = variant->dwmac_set_delay(plat);
 		if (ret) {
-			dev_err(plat->dev, "failed to set delay value, err = %d\n", ret);
+			dev_err(dev, "failed to set delay value, err = %d\n", ret);
 			return ret;
 		}
 	}
@@ -589,7 +589,7 @@ static int mediatek_dwmac_common_data(struct platform_device *pdev,
 	plat->maxmtu = ETH_DATA_LEN;
 	plat->host_dma_width = priv_plat->variant->dma_bit_mask;
 	plat->bsp_priv = priv_plat;
-	plat->init = mediatek_dwmac_init;
+	plat->resume = mediatek_dwmac_init;
 	plat->clks_config = mediatek_dwmac_clks_config;
 
 	plat->safety_feat_cfg = devm_kzalloc(&pdev->dev,
@@ -654,7 +654,7 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
 		return PTR_ERR(plat_dat);
 
 	mediatek_dwmac_common_data(pdev, plat_dat, priv_plat);
-	mediatek_dwmac_init(pdev, priv_plat);
+	mediatek_dwmac_init(&pdev->dev, priv_plat);
 
 	ret = mediatek_dwmac_clks_config(priv_plat, true);
 	if (ret)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
