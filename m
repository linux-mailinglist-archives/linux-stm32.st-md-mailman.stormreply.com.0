Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A26846C10
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Feb 2024 10:34:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2B12C71281;
	Fri,  2 Feb 2024 09:34:31 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C84AC6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Feb 2024 09:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vf7BGNl9i42pdxz8Gl6B1J2fWwi9YHL54zIOUUkQn3A=; b=MOfTxRYFoSRiWJObPmMTl7GlQK
 qYxjPpPDJS/Z9J2jScs4o5Z3IHEJuC74nVyreC6jomiZMDGhTF4ZlliEGll/dI3oCB4u5l2wT6AqY
 UwsU/y/Wh0C0I+gevrg5/lmLH0ffrXGHnnDjxgODAegyQUulG7YZi9zEMsWx3VaDzONEXhLs5M0N9
 qrGK37CxUb1hk7bodP4OjJ0CYp2i+NROytIkKAOeQy8jySwdcZVgA3hUJCmmyO92vMWyJ8NR3U7jz
 IoOjzfsXzU8mnzRaa8xW5lSNEA73DqGRPatHBlo+yQlFz/K7fnPE01yxeVcJ7dl5q+Tk8r6rVWNpz
 uFUfArtQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38142 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1rVpvw-0005jK-1m;
 Fri, 02 Feb 2024 09:34:04 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1rVpvs-002Pe6-1w; Fri, 02 Feb 2024 09:34:00 +0000
In-Reply-To: <Zby24IKSgzpvRDNF@shell.armlinux.org.uk>
References: <Zby24IKSgzpvRDNF@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1rVpvs-002Pe6-1w@rmk-PC.armlinux.org.uk>
Date: Fri, 02 Feb 2024 09:34:00 +0000
Cc: Vladimir Oltean <olteanv@gmail.com>, Doug Berger <opendmb@gmail.com>,
 Byungho An <bh74.an@samsung.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Justin Chen <justin.chen@broadcom.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Clark Wang <xiaoning.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
 Wei Fang <wei.fang@nxp.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 4/6] net: bcmgenet: remove
 eee_enabled/eee_active in bcmgenet_get_eee()
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

bcmgenet_get_eee() sets edata->eee_active and edata->eee_enabled from
its own copy, and then calls phy_ethtool_get_eee() which in turn will
call genphy_c45_ethtool_get_eee().

genphy_c45_ethtool_get_eee() will overwrite eee_enabled and eee_active
with its own interpretation from the PHYs settings and negotiation
result.

Therefore, setting these members in bcmgenet_get_eee() is redundant,
and can be removed. This also makes priv->eee.eee_active unnecessary,
so remove this and use a local variable where appropriate.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 8 +++-----
 drivers/net/ethernet/broadcom/genet/bcmmii.c   | 5 +++--
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index 051c31fb17c2..7396e2823e32 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -1313,7 +1313,6 @@ void bcmgenet_eee_enable_set(struct net_device *dev, bool enable,
 	}
 
 	priv->eee.eee_enabled = enable;
-	priv->eee.eee_active = enable;
 	priv->eee.tx_lpi_enabled = tx_lpi_enabled;
 }
 
@@ -1328,8 +1327,6 @@ static int bcmgenet_get_eee(struct net_device *dev, struct ethtool_keee *e)
 	if (!dev->phydev)
 		return -ENODEV;
 
-	e->eee_enabled = p->eee_enabled;
-	e->eee_active = p->eee_active;
 	e->tx_lpi_enabled = p->tx_lpi_enabled;
 	e->tx_lpi_timer = bcmgenet_umac_readl(priv, UMAC_EEE_LPI_TIMER);
 
@@ -1340,6 +1337,7 @@ static int bcmgenet_set_eee(struct net_device *dev, struct ethtool_keee *e)
 {
 	struct bcmgenet_priv *priv = netdev_priv(dev);
 	struct ethtool_keee *p = &priv->eee;
+	bool active;
 
 	if (GENET_IS_V1(priv))
 		return -EOPNOTSUPP;
@@ -1352,9 +1350,9 @@ static int bcmgenet_set_eee(struct net_device *dev, struct ethtool_keee *e)
 	if (!p->eee_enabled) {
 		bcmgenet_eee_enable_set(dev, false, false);
 	} else {
-		p->eee_active = phy_init_eee(dev->phydev, false) >= 0;
+		active = phy_init_eee(dev->phydev, false) >= 0;
 		bcmgenet_umac_writel(priv, e->tx_lpi_timer, UMAC_EEE_LPI_TIMER);
-		bcmgenet_eee_enable_set(dev, p->eee_active, e->tx_lpi_enabled);
+		bcmgenet_eee_enable_set(dev, active, e->tx_lpi_enabled);
 	}
 
 	return phy_ethtool_set_eee(dev->phydev, e);
diff --git a/drivers/net/ethernet/broadcom/genet/bcmmii.c b/drivers/net/ethernet/broadcom/genet/bcmmii.c
index 97ea76d443ab..cbbe004621bc 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmmii.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmmii.c
@@ -30,6 +30,7 @@ static void bcmgenet_mac_config(struct net_device *dev)
 	struct bcmgenet_priv *priv = netdev_priv(dev);
 	struct phy_device *phydev = dev->phydev;
 	u32 reg, cmd_bits = 0;
+	bool active;
 
 	/* speed */
 	if (phydev->speed == SPEED_1000)
@@ -88,9 +89,9 @@ static void bcmgenet_mac_config(struct net_device *dev)
 	}
 	bcmgenet_umac_writel(priv, reg, UMAC_CMD);
 
-	priv->eee.eee_active = phy_init_eee(phydev, 0) >= 0;
+	active = phy_init_eee(phydev, 0) >= 0;
 	bcmgenet_eee_enable_set(dev,
-				priv->eee.eee_enabled && priv->eee.eee_active,
+				priv->eee.eee_enabled && active,
 				priv->eee.tx_lpi_enabled);
 }
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
