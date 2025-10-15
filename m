Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A7DBDF95B
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Oct 2025 18:11:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29067C57167;
	Wed, 15 Oct 2025 16:11:14 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFBCDC5663F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 16:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eplxvysfx85LPhdZ5hWcUUD0i0J3w274wHdDz18TaWo=; b=HMbUq3eIlPgCK522VNy2nopUYq
 bQGaUVC9JCVn8ftCRCvjxzbPLuQVr0BInbCKKAINI9eipgUEdzA1LAJ4Ak9GXzR4Gvc5YGjufyWIT
 WuSyNHpllPjvr9KXB4GDd/rQOpVNDYr75tlRHAc1YPiajIzKp7IcrzsDRAVtUAzBIDUZkcwd6KLo0
 UR/ghtOA18pTwvk0u/0zSO6cxDIJBbPwqaNp1VN00Usvt0kbsloAe4HPQG4BM27zjSzDyopkcYcNj
 JWcpXCi3QT0vw19qmqOp+R2ivohoAbvoNgn1tSVfu2v3AiX5ynLyg4EtXfQUX8NyCh/wu/PKgYbod
 BCXzzslg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42348 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1v945g-000000005Ar-3gCO;
 Wed, 15 Oct 2025 17:11:05 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1v945d-0000000Ameh-3Bs7; Wed, 15 Oct 2025 17:11:01 +0100
In-Reply-To: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
References: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1v945d-0000000Ameh-3Bs7@rmk-PC.armlinux.org.uk>
Date: Wed, 15 Oct 2025 17:11:01 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 5/5] net: stmmac: rename
 stmmac_phy_setup() to include phylink
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

stmmac_phy_setup() does not set up any PHY, but does setup phylink.
Rename this function to stmmac_phylink_setup() to reflect more what
it is doing.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 500cfd19e6b5..c9fa965c8566 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1185,7 +1185,7 @@ static int stmmac_init_phy(struct net_device *dev)
 	return 0;
 }
 
-static int stmmac_phy_setup(struct stmmac_priv *priv)
+static int stmmac_phylink_setup(struct stmmac_priv *priv)
 {
 	struct stmmac_mdio_bus_data *mdio_bus_data;
 	struct phylink_config *config;
@@ -7642,7 +7642,7 @@ int stmmac_dvr_probe(struct device *device,
 	if (ret)
 		goto error_pcs_setup;
 
-	ret = stmmac_phy_setup(priv);
+	ret = stmmac_phylink_setup(priv);
 	if (ret) {
 		netdev_err(ndev, "failed to setup phy (%d)\n", ret);
 		goto error_phy_setup;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
