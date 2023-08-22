Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1727849A3
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 20:50:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2F55C6B44C;
	Tue, 22 Aug 2023 18:50:52 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 856C6C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Aug 2023 18:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nphjihgOb/6ZWNEn5bdh2uvaeqrnXDrlYgYpyu/X48Y=; b=c5TqPRogkTgyX2mtAOV7dKA4QF
 9Nb2U0HplGQv5Om2/s6XztHrEnoLHkisXNAAYcqvJSwUVVKVWLZ3uZnr/4x2ZFtjOun7WxLwca+G8
 tk/G320BIPhvtmykEllqrmVi40NSyelVY4YI6K3wVc64J+OmRRnIXhY07y7ZUAOPs7XLxdnSpR+7j
 eVN6PwvuuRP/tWLG5jTEo8AX5frKWvaco1MXuqgBR8+yqnTf/2l7QOaIfa9E3SKyo09VTISvhWEHF
 TZ05UoqwPkC5JecI/FvT4yMGcAJrJDecV3KZp/9vFQuYiFpIJWDsg4lvNJJnHbVooNiDMFKdse6BH
 KTsuCW4g==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50524 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1qYWSi-0001tG-1j;
 Tue, 22 Aug 2023 19:50:44 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1qYWSi-005fYL-Q0; Tue, 22 Aug 2023 19:50:44 +0100
In-Reply-To: <ZOUDRkBXzY884SJ1@shell.armlinux.org.uk>
References: <ZOUDRkBXzY884SJ1@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qYWSi-005fYL-Q0@rmk-PC.armlinux.org.uk>
Date: Tue, 22 Aug 2023 19:50:44 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Feiyang Chen <chenfeiyang@loongson.cn>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next 9/9] net: stmmac: move
 priv->phylink_config.mac_managed_pm
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

Move priv->phylink_config.mac_managed_pm to be along side the other
phylink initialisations.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5cf8304564c6..7cfc2918c913 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1207,6 +1207,7 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 
 	priv->phylink_config.dev = &priv->dev->dev;
 	priv->phylink_config.type = PHYLINK_NETDEV;
+	priv->phylink_config.mac_managed_pm = true;
 
 	mdio_bus_data = priv->plat->mdio_bus_data;
 	if (mdio_bus_data)
@@ -1231,7 +1232,6 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	if (priv->plat->tx_queues_to_use > 1)
 		priv->phylink_config.mac_capabilities &=
 			~(MAC_10HD | MAC_100HD | MAC_1000HD);
-	priv->phylink_config.mac_managed_pm = true;
 
 	max_speed = priv->plat->max_speed;
 	if (max_speed)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
