Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2568B95A54
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Sep 2025 13:26:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8609BC3F92E;
	Tue, 23 Sep 2025 11:26:36 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 648B5C36B20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Sep 2025 11:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q24K7de5jaqh0rHllgz2My1TxD+1mvaZiPDKkSvAA3Q=; b=wvvoM4eue0TfQLiDWTqBwk1u4u
 AsxrfAUxyL7D6hjK6sPr6Geqd2HnXq+KNGvlv1HLDZxk3OgvpFN7fZ/LWRINV+3T4+xru0eBdC2lT
 ugsvxuDIsfBYn+hLyY1Lpi31onpgDakqrHKKZsRUv4TOz+thtDHi5psMT1uFTew16u1XdXQHzV8TB
 qOtKTopPDI39RhjAk8o7NwFpjWdnQCkcF8/8trnhh/looSHN5cyhm+zQsl8Wyqh1lTPovM1v+Rayi
 sRLv+EL9+lW1UVqIlZIbX5QjeaAQRyKKsZ6LCgSu/Jgov2mt/Ugaqx28qDO8VLjRwL6p0AykjbtBP
 plq2/Oig==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39568 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1v11AB-0000000079Z-0c1x;
 Tue, 23 Sep 2025 12:26:27 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1v11A8-0000000774M-3pmH; Tue, 23 Sep 2025 12:26:24 +0100
In-Reply-To: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1v11A8-0000000774M-3pmH@rmk-PC.armlinux.org.uk>
Date: Tue, 23 Sep 2025 12:26:24 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 6/6] net: stmmac: simplify
	stmmac_init_phy()
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

If we fail to attach a PHY, there is no point trying to configure WoL
settings. Exit the function after printing the "cannot attach to PHY"
error, and remove the now unnecessary code indentation for configuring
the LPI timer in phylink. Since we know that "ret" must be zero at this
point, change the final return to use a constant rather than "ret".

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 25 +++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4844d563e291..be064f240895 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1115,6 +1115,7 @@ static int stmmac_init_phy(struct net_device *dev)
 	int mode = priv->plat->phy_interface;
 	struct fwnode_handle *phy_fwnode;
 	struct fwnode_handle *fwnode;
+	struct ethtool_keee eee;
 	int ret;
 
 	if (!phylink_expects_phy(priv->phylink))
@@ -1160,19 +1161,17 @@ static int stmmac_init_phy(struct net_device *dev)
 	if (ret) {
 		netdev_err(priv->dev, "cannot attach to PHY (error: %pe)\n",
 			   ERR_PTR(ret));
-	} else {
-		struct ethtool_keee eee;
+		return ret;
+	}
 
-		/* Configure phylib's copy of the LPI timer. Normally,
-		 * phylink_config.lpi_timer_default would do this, but there is
-		 * a chance that userspace could change the eee_timer setting
-		 * via sysfs before the first open. Thus, preserve existing
-		 * behaviour.
-		 */
-		if (!phylink_ethtool_get_eee(priv->phylink, &eee)) {
-			eee.tx_lpi_timer = priv->tx_lpi_timer;
-			phylink_ethtool_set_eee(priv->phylink, &eee);
-		}
+	/* Configure phylib's copy of the LPI timer. Normally,
+	 * phylink_config.lpi_timer_default would do this, but there is a
+	 * chance that userspace could change the eee_timer setting via sysfs
+	 * before the first open. Thus, preserve existing behaviour.
+	 */
+	if (!phylink_ethtool_get_eee(priv->phylink, &eee)) {
+		eee.tx_lpi_timer = priv->tx_lpi_timer;
+		phylink_ethtool_set_eee(priv->phylink, &eee);
 	}
 
 	if (!priv->plat->pmt) {
@@ -1183,7 +1182,7 @@ static int stmmac_init_phy(struct net_device *dev)
 		device_set_wakeup_enable(priv->device, !!wol.wolopts);
 	}
 
-	return ret;
+	return 0;
 }
 
 static int stmmac_phy_setup(struct stmmac_priv *priv)
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
