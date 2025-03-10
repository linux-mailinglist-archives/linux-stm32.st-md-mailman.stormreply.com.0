Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 450C8A593C5
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Mar 2025 13:11:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AFE6C78F96;
	Mon, 10 Mar 2025 12:11:36 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E13AC78F74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 12:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7WUB85UntcvKc4rtS3U46DOMfeTCvt9STpMBA8SjPKo=; b=hL7aGwgRzwa+oGMgpiItpfadBY
 KcqcqTiCdXW4+KmLgKheS8tMa0vgjmg6OTul6zhfz63amhPcaSglqdDCpv9hgtSbEJmU901fSpGCC
 xjZRLVmGE+agKtMu8zVhZMgP9TeBd2+h6cyeLdFzr57v5uUfO4IbNKnGBD6cAX5KG2JoQAigfEHaD
 PXRatEhEZZwHUly7HRgO+EExJS2IL/KOfh5eGz73s8mpfWaJDt1jye7wVotTcpy1dwNVDfnhqh3yx
 gQO7w4mY6fbE1V9zKzLFgV2qVhXEX3vP0lPeHG76wDLGiW2xqsKNNVrU3jC6OdSmdSzNnhfNAkty9
 WIYKF9Qg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54294 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1trbyX-0002aA-2J;
 Mon, 10 Mar 2025 12:11:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1trbyA-005qYf-Hb; Mon, 10 Mar 2025 12:10:54 +0000
In-Reply-To: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
References: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1trbyA-005qYf-Hb@rmk-PC.armlinux.org.uk>
Date: Mon, 10 Mar 2025 12:10:54 +0000
Cc: Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next 8/9] net: stmmac: sun8i: remove
	of_get_phy_mode()
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

devm_stmmac_probe_config_dt() already gets the PHY mode from firmware,
which is stored in plat_dat->phy_interface. Therefore, we don't need to
get it in platform code.

sun8i was using of_get_phy_mode() to set plat_dat->mac_interface, which
defaults to plat_dat->phy_interface when the mac-mode DT property is
not present. As nothing in arch/*/boot/dts sets the mac-mode property,
it is highly likely that these two will be identical, and thus there
is no need for this glue driver to set plat_dat->mac_interface.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 4b7b2582a120..85723a78793a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -1155,11 +1155,10 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	struct stmmac_resources stmmac_res;
 	struct sunxi_priv_data *gmac;
 	struct device *dev = &pdev->dev;
-	phy_interface_t interface;
-	int ret;
 	struct stmmac_priv *priv;
 	struct net_device *ndev;
 	struct regmap *regmap;
+	int ret;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
 	if (ret)
@@ -1219,10 +1218,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = of_get_phy_mode(dev->of_node, &interface);
-	if (ret)
-		return -EINVAL;
-
 	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
@@ -1230,7 +1225,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	/* platform data specifying hardware features and callbacks.
 	 * hardware features were copied from Allwinner drivers.
 	 */
-	plat_dat->mac_interface = interface;
 	plat_dat->rx_coe = STMMAC_RX_COE_TYPE2;
 	plat_dat->tx_coe = 1;
 	plat_dat->flags |= STMMAC_FLAG_HAS_SUN8I;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
