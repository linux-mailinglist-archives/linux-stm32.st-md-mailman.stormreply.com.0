Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F543C24B45
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Oct 2025 12:10:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 683F7C62D9F;
	Fri, 31 Oct 2025 11:10:39 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAE75C62D99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Oct 2025 11:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F9+uCkTTPZNitcXoasL3jxbNQG9cxbs2rnefJEzDKW0=; b=joABAYhGrqXg1LpCJ/57xmaHzs
 Joy9pfh00DUTWJrxapt5IQ8iU/TrR3I0S+p4RMyUwSRI27Nf/Sddz3PZkFJLMuww3lIuTL14iKaFE
 V6g/09pEEIq/s1Rl86FgEwnsWjvWhd7h+lqsghtMTAsqztSQBuiBIYp4RIlQ2wwPZ4ABkxSqJzU1z
 T7l4aMuhpDI/TP3n35qtkYnVosxfwUXg9p7b1rIA9Y/mys6xLnGXffOhaPrlXxGIY50UwpUORc2SF
 I35kWcofuGvmy/rCJNyNtRf/kqiogoDbWBCfmefc58OTUnIUxnKK2WTVNp4ilIKjIDqGPO5WiqD8I
 qqOlOtCQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35954 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vEn1X-000000006oz-1kl6;
 Fri, 31 Oct 2025 11:10:27 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vEn1W-0000000CHoi-2koP; Fri, 31 Oct 2025 11:10:26 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vEn1W-0000000CHoi-2koP@rmk-PC.armlinux.org.uk>
Date: Fri, 31 Oct 2025 11:10:26 +0000
Cc: imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 netdev@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Fabio Estevam <festevam@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: imx: use phylink's
 interface mode for set_clk_tx_rate()
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

imx_dwmac_set_clk_tx_rate() is passed the interface mode from phylink
which will be the same as plat_dat->phy_interface. Use the passed-in
interface mode rather than plat_dat->phy_interface.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 4268b9987237..147fa08d5b6e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -195,9 +195,6 @@ static void imx_dwmac_exit(struct platform_device *pdev, void *priv)
 static int imx_dwmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 				     phy_interface_t interface, int speed)
 {
-	struct imx_priv_data *dwmac = bsp_priv;
-
-	interface = dwmac->plat_dat->phy_interface;
 	if (interface == PHY_INTERFACE_MODE_RMII ||
 	    interface == PHY_INTERFACE_MODE_MII)
 		return 0;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
