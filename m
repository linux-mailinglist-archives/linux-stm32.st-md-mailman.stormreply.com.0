Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB40AA478D9
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 10:17:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABD56C7A83E;
	Thu, 27 Feb 2025 09:17:29 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 455C4C7A83B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 09:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d0ZbMy4p+KTtbwsU/BR1wCC/2lakW8Pk7WJBqfnp+Fc=; b=gL7xQh5uQB8sVK9zwRoUrMfQrE
 TS6a7qQ7LjwLDqPHwUgbLpD8ahhwwHfl6sn1WxRPBEZxMlqvNg5rGEq8Y9I4afJSfJcFRyL6rIE/U
 N7qey8YHNIdyatVyJPdtVzC35TZXWZbPzta6l/W8TbLYdpnSxAsj2nfMhNPPdlCBaDfbajgrgaZQw
 sF3qB2XMdNU2qkNdLlYNKceIdf4xrjzupOqQZdozGL2a5YpKmAHm+rHRS+pOiNLMAZQtM/dX3dee6
 SmYZD9+vGi/WikR0Vsi+9bbicQ/mM169h2ryEoz5f42+X4kD7UdKj/0O6+g7iBJghsqTcJU48Q/sY
 JqDzVN1w==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38316 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tna1E-0006dl-21;
 Thu, 27 Feb 2025 09:17:24 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tna0u-0052tH-KQ; Thu, 27 Feb 2025 09:17:04 +0000
In-Reply-To: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tna0u-0052tH-KQ@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Feb 2025 09:17:04 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 09/11] net: stmmac: ipq806x: switch
 to use set_clk_tx_rate() hook
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

Switch from using the fix_mac_speed() hook to set_clk_tx_rate() to
manage the transmit clock.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
index 7f4b9c1cc32b..0a9c137cc4e6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
@@ -260,11 +260,12 @@ static int ipq806x_gmac_of_parse(struct ipq806x_gmac *gmac)
 	return PTR_ERR_OR_ZERO(gmac->qsgmii_csr);
 }
 
-static void ipq806x_gmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
+static int ipq806x_gmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
+					phy_interface_t interface, int speed)
 {
-	struct ipq806x_gmac *gmac = priv;
+	struct ipq806x_gmac *gmac = bsp_priv;
 
-	ipq806x_gmac_set_speed(gmac, speed);
+	return ipq806x_gmac_set_speed(gmac, speed);
 }
 
 static int
@@ -478,7 +479,7 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
 
 	plat_dat->has_gmac = true;
 	plat_dat->bsp_priv = gmac;
-	plat_dat->fix_mac_speed = ipq806x_gmac_fix_mac_speed;
+	plat_dat->set_clk_tx_rate = ipq806x_gmac_set_clk_tx_rate;
 	plat_dat->multicast_filter_bins = 0;
 	plat_dat->tx_fifo_size = 8192;
 	plat_dat->rx_fifo_size = 8192;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
