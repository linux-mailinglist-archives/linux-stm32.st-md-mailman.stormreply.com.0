Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D255C9D9781
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 13:52:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92CDFC78021;
	Tue, 26 Nov 2024 12:52:31 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DD64C78021
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 12:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RM45E2RyeGgWmHoLgnNlNxoB8BWudpg068BttE0fp4M=; b=Xp3QzuFnWm49I8N/BBG+PZE8s3
 pkE5+cxFtQAXX7vyvPF25qhB/KAOgZcXGKvO4dCV7GIZW2DMNv14rn6uDNT3NTpC0WtVhE2pt/dW4
 L0mOQcl/mw9yiniEIzNaJPve2nk4aOyvcirf5/ZHwho+zqQFBU188aWUlZAfRtjbUhXkXIWxywB2L
 W+Er7sArdulAnW8ITwLHke89ZtoKDV6jQsnVevu7n9VGk1R0h8i2NLXmJ40/jAZ6lAxSlV62h9I/1
 mZqYgul2QhUSamKdwwHKprbr/udKOi5/4aGF/jJJ6S/wbz4lIh9ML9bgwdvKkE7zLkRXDwzZC8zsq
 +uzwXpjw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48716 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tFv3G-0006rc-17;
 Tue, 26 Nov 2024 12:52:22 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tFv3F-005yhT-AA; Tue, 26 Nov 2024 12:52:21 +0000
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tFv3F-005yhT-AA@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 12:52:21 +0000
Cc: UNGLinuxDriver@microchip.com, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 02/23] net: phy: fix
 phy_ethtool_set_eee() incorrectly enabling LPI
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

When phy_ethtool_set_eee_noneg() detects a change in the LPI
parameters, it attempts to update phylib state and trigger the link
to cycle so the MAC sees the updated parameters.

However, in doing so, it sets phydev->enable_tx_lpi depending on
whether the EEE configuration allows the MAC to generate LPI without
taking into account the result of negotiation.

This can be demonstrated with a 1000base-T FD interface by:

 # ethtool --set-eee eno0 advertise 8   # cause EEE to be not negotiated
 # ethtool --set-eee eno0 tx-lpi off
 # ethtool --set-eee eno0 tx-lpi on

This results in being true, despite EEE not having been negotiated and:
 # ethtool --show-eee eno0
	EEE status: enabled - inactive
	Tx LPI: 250 (us)
	Supported EEE link modes:  100baseT/Full
	                           1000baseT/Full
	Advertised EEE link modes:  100baseT/Full
	                                         1000baseT/Full

Fix this by keeping track of whether EEE was negotiated via a new
eee_active member in struct phy_device, and include this state in
the decision whether phydev->enable_tx_lpi should be set.

Fixes: 3e43b903da04 ("net: phy: Immediately call adjust_link if only tx_lpi_enabled changes")
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phy-c45.c |  2 +-
 drivers/net/phy/phy.c     | 30 ++++++++++++++++++------------
 include/linux/phy.h       |  2 ++
 3 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/net/phy/phy-c45.c b/drivers/net/phy/phy-c45.c
index 96d0b3a5a9d3..944ae98ad110 100644
--- a/drivers/net/phy/phy-c45.c
+++ b/drivers/net/phy/phy-c45.c
@@ -1530,7 +1530,7 @@ int genphy_c45_ethtool_get_eee(struct phy_device *phydev,
 		return ret;
 
 	data->eee_enabled = is_enabled;
-	data->eee_active = ret;
+	data->eee_active = phydev->eee_active;
 	linkmode_copy(data->supported, phydev->supported_eee);
 
 	return 0;
diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index a660a80f34b7..0d20b534122b 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -990,14 +990,14 @@ static int phy_check_link_status(struct phy_device *phydev)
 		phydev->state = PHY_RUNNING;
 		err = genphy_c45_eee_is_active(phydev,
 					       NULL, NULL, NULL);
-		if (err <= 0)
-			phydev->enable_tx_lpi = false;
-		else
-			phydev->enable_tx_lpi = phydev->eee_cfg.tx_lpi_enabled;
+		phydev->eee_active = err > 0;
+		phydev->enable_tx_lpi = phydev->eee_cfg.tx_lpi_enabled &&
+					phydev->eee_active;
 
 		phy_link_up(phydev);
 	} else if (!phydev->link && phydev->state != PHY_NOLINK) {
 		phydev->state = PHY_NOLINK;
+		phydev->eee_active = false;
 		phydev->enable_tx_lpi = false;
 		phy_link_down(phydev);
 	}
@@ -1685,15 +1685,21 @@ EXPORT_SYMBOL(phy_ethtool_get_eee);
 static void phy_ethtool_set_eee_noneg(struct phy_device *phydev,
 				      const struct eee_config *old_cfg)
 {
-	if (phydev->eee_cfg.tx_lpi_enabled != old_cfg->tx_lpi_enabled ||
+	bool enable_tx_lpi;
+
+	if (!phydev->link)
+		return;
+
+	enable_tx_lpi = phydev->eee_cfg.tx_lpi_enabled && phydev->eee_active;
+
+	if (phydev->enable_tx_lpi != enable_tx_lpi ||
 	    phydev->eee_cfg.tx_lpi_timer != old_cfg->tx_lpi_timer) {
-		phydev->enable_tx_lpi = eeecfg_mac_can_tx_lpi(&phydev->eee_cfg);
-		if (phydev->link) {
-			phydev->link = false;
-			phy_link_down(phydev);
-			phydev->link = true;
-			phy_link_up(phydev);
-		}
+		phydev->enable_tx_lpi = false;
+		phydev->link = false;
+		phy_link_down(phydev);
+		phydev->enable_tx_lpi = enable_tx_lpi;
+		phydev->link = true;
+		phy_link_up(phydev);
 	}
 }
 
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 77c6d6451638..563c46205685 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -602,6 +602,7 @@ struct macsec_ops;
  * @supported_eee: supported PHY EEE linkmodes
  * @advertising_eee: Currently advertised EEE linkmodes
  * @enable_tx_lpi: When True, MAC should transmit LPI to PHY
+ * @eee_active: phylib private state, indicating that EEE has been negotiated
  * @eee_cfg: User configuration of EEE
  * @lp_advertising: Current link partner advertised linkmodes
  * @host_interfaces: PHY interface modes supported by host
@@ -723,6 +724,7 @@ struct phy_device {
 	/* Energy efficient ethernet modes which should be prohibited */
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(eee_broken_modes);
 	bool enable_tx_lpi;
+	bool eee_active;
 	struct eee_config eee_cfg;
 
 	/* Host supported PHY interface types. Should be ignored if empty. */
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
