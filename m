Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF5F49B8EA
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jan 2022 17:40:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79D0BC5F1D6;
	Tue, 25 Jan 2022 16:40:52 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4EC7C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jan 2022 16:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sgQTf3Bfl9cn09Ojhu07RwFf7vIlmxYLBPzINy2DEi0=; b=jgXgRtVOrV+Z+14OpQo2cGWl9j
 Vw6SJ0YiHm+zshJQxjaEKN4JUMEonW7wPwYRgNE6q+fwUVnADJpYKD++GWE1VE6xuoQEln/+0HQfO
 hiIn+aRS0VO90Mff5w2ob+OV5E53TG6PuKfIyzcjB9ycaXD3KcRqg+fvP5luv8wKXrP5duyQ+W8ch
 Hc07BTsrW7boMmXoYzFUMcfjUTqAJzK+ce62L/qiis3dodqCJhP1NBQd0sXqlpII62jgK1261bhcu
 NJm/LcIgG3GJHoAbXdYhHGLcDT+dUfKwSbRS96YlDPnIiVmjIF5GDVgrnqo8aJeNyM4HJw3bc2T57
 SePXxODQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57420 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nCOsA-0002C1-6m; Tue, 25 Jan 2022 16:40:46 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nCOs9-005LSz-KX; Tue, 25 Jan 2022 16:40:45 +0000
In-Reply-To: <YfAnkuhiMoeFcVnb@shell.armlinux.org.uk>
References: <YfAnkuhiMoeFcVnb@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nCOs9-005LSz-KX@rmk-PC.armlinux.org.uk>
Date: Tue, 25 Jan 2022 16:40:45 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next 5/7] net: stmmac: remove
 phylink_config.pcs_poll usage
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

Phylink will use PCS polling whenever the PCS's poll member is set, so
setting phylink_config.pcs_poll as well is redundant.

Tested-by: Wong Vee Khee <vee.khee.wong@linux.intel.com> # Intel EHL            Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6c270785cf68..243016400aba 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1182,7 +1182,6 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 
 	priv->phylink_config.dev = &priv->dev->dev;
 	priv->phylink_config.type = PHYLINK_NETDEV;
-	priv->phylink_config.pcs_poll = true;
 	if (priv->plat->mdio_bus_data)
 		priv->phylink_config.ovr_an_inband =
 			mdio_bus_data->xpcs_an_inband;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
