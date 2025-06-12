Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC4FAD7692
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 17:41:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A4D8C32E8E;
	Thu, 12 Jun 2025 15:41:26 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49C09C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 15:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fwZMOCKfFBVS4iHJPXuDmlM3/1DaYJO0eDoSHbqPtEo=; b=bDhoMlmXYyIkOs26G3MwkhL1SC
 cFTGPHUv+linbYI4GJOTg26WIkzaHxHNzrNaf3lVXIv1J8xkwcQZQQp/dENLnqnYj1epPq/DjSoM1
 NbCTaEKrW6A8R/qare0T8ddvIqepAlSm3VecKPjUcIChlXkyNonzsWU5isyctiEu03990wzyOw1aL
 V+cVjVZ/z2aaLq1bkMzh0b4t6eTwMOMJQv913H3TQ3mC8LRk+3CCAOjGs3ndFd51+RRGmfQ0qdbbm
 qY1TH9dP2LB+ch8frqPfHBP6T/2hT/0umPYAeyHR1IVGAT3DHTw3tpEW+MuwfPpwx/xEmtCYwpZHm
 vm8UD7iA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60382 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1uPk3N-00083N-2Q;
 Thu, 12 Jun 2025 16:41:21 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uPk2j-004CF6-Mf; Thu, 12 Jun 2025 16:40:41 +0100
In-Reply-To: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
References: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uPk2j-004CF6-Mf@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Jun 2025 16:40:41 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/9] net: stmmac: rk: add
 get_interfaces() implementation
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

RK platforms support RGMII and/or RMII depending on the SoC. Detect
whether support for a SoC exists by whether the interface specific
set_to functions have been populated, and set the appropriate bits in
phylink's bitmap of interfaces.

This assumes all dwmac interfaces on a SoC have identical support,
but it should be noted that this is not true for RK3528 which only
supports RGMII on GMAC1. However, the existing code structure
permits RGMII to be configured on GMAC0 without complaint, so
preserve this behaviour even though it is incorrect to avoid
functional change.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 700858ff6f7c..8006424ab027 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1864,6 +1864,18 @@ static void rk_gmac_powerdown(struct rk_priv_data *gmac)
 	gmac_clk_enable(gmac, false);
 }
 
+static void rk_get_interfaces(struct stmmac_priv *priv, void *bsp_priv,
+			      unsigned long *interfaces)
+{
+	struct rk_priv_data *rk = bsp_priv;
+
+	if (rk->ops->set_to_rgmii)
+		phy_interface_set_rgmii(interfaces);
+
+	if (rk->ops->set_to_rmii)
+		__set_bit(PHY_INTERFACE_MODE_RMII, interfaces);
+}
+
 static int rk_set_clk_tx_rate(void *bsp_priv_, struct clk *clk_tx_i,
 			      phy_interface_t interface, int speed)
 {
@@ -1919,6 +1931,7 @@ static int rk_gmac_probe(struct platform_device *pdev)
 		plat_dat->tx_fifo_size = 2048;
 	}
 
+	plat_dat->get_interfaces = rk_get_interfaces;
 	plat_dat->set_clk_tx_rate = rk_set_clk_tx_rate;
 
 	plat_dat->bsp_priv = rk_gmac_setup(pdev, plat_dat, data);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
