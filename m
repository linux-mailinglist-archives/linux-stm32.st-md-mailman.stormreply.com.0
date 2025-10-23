Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDF6C002EE
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Oct 2025 11:16:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4C61C5EC4C;
	Thu, 23 Oct 2025 09:16:45 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCC8EC5EC44
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 09:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SuSMaY7MNOlG0YYGuQqrpd/fTe1RDOR/qBM77ZJNoHI=; b=OugVG+J5prG+LhML3KAld/bi/9
 h+qdx58grUvdJgn/+UUAetp/AM0xRi8T/NLzp6uxswGlbGSbvrZuHS6LMa2ninaTw3BniqedEe6t3
 PdEZWxiNQUiUbzZZ6WSsM5cuieaccgNE3GflevAESupOa7mcoL0wxfjMr2KpoS44Mvf3wiiQ52r/F
 gtV7HS/EkDa4HZuH4qC4t3AFFlrJzYczrR1Lb+OjKePRFvTTU9nwfUUBrV4DXjBMejScdImeBNgXg
 084ZSixR5qHOLm3DaJ4LPOUoXChbvHVcRtrua1hi3Axsm9wn6Km0VC2MzKHA3hWS9Wz3WTISedKyE
 f2e4RtAw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46454 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vBrQy-0000000060u-0xMF;
 Thu, 23 Oct 2025 10:16:36 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vBrQx-0000000BLzO-1RLt; Thu, 23 Oct 2025 10:16:35 +0100
In-Reply-To: <aPnyW54J80h9DmhB@shell.armlinux.org.uk>
References: <aPnyW54J80h9DmhB@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vBrQx-0000000BLzO-1RLt@rmk-PC.armlinux.org.uk>
Date: Thu, 23 Oct 2025 10:16:35 +0100
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Simon Horman <horms@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, Tristram Ha <Tristram.Ha@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 2/6] net: phy: add phy_may_wakeup()
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

Add phy_may_wakeup() which uses the driver model's device_may_wakeup()
when the PHY driver has marked the device as wakeup capable in the
driver model, otherwise use phy_drv_wol_enabled().

Replace the sites that used to call phy_drv_wol_enabled() with this
as checking the driver model will be more efficient than checking the
WoL state.

Export phy_may_wakeup() so that phylink can use it.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
v2: fix kerneldoc description
---
 drivers/net/phy/phy_device.c | 14 ++++++++++++--
 include/linux/phy.h          |  9 +++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 7a67c900e79a..b7feaf0cb1df 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -251,6 +251,16 @@ static bool phy_drv_wol_enabled(struct phy_device *phydev)
 	return wol.wolopts != 0;
 }
 
+bool phy_may_wakeup(struct phy_device *phydev)
+{
+	/* If the PHY is using driver-model based wakeup, use that state. */
+	if (phy_can_wakeup(phydev))
+		return device_may_wakeup(&phydev->mdio.dev);
+
+	return phy_drv_wol_enabled(phydev);
+}
+EXPORT_SYMBOL_GPL(phy_may_wakeup);
+
 static void phy_link_change(struct phy_device *phydev, bool up)
 {
 	struct net_device *netdev = phydev->attached_dev;
@@ -302,7 +312,7 @@ static bool mdio_bus_phy_may_suspend(struct phy_device *phydev)
 	/* If the PHY on the mido bus is not attached but has WOL enabled
 	 * we cannot suspend the PHY.
 	 */
-	if (!netdev && phy_drv_wol_enabled(phydev))
+	if (!netdev && phy_may_wakeup(phydev))
 		return false;
 
 	/* PHY not attached? May suspend if the PHY has not already been
@@ -1909,7 +1919,7 @@ int phy_suspend(struct phy_device *phydev)
 	if (phydev->suspended || !phydrv)
 		return 0;
 
-	phydev->wol_enabled = phy_drv_wol_enabled(phydev) ||
+	phydev->wol_enabled = phy_may_wakeup(phydev) ||
 			      (netdev && netdev->ethtool->wol_enabled);
 	/* If the device has WOL enabled, we cannot suspend the PHY */
 	if (phydev->wol_enabled && !(phydrv->flags & PHY_ALWAYS_CALL_SUSPEND))
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 3eeeaec52832..17a2cdc9f1a0 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1391,6 +1391,15 @@ static inline bool phy_can_wakeup(struct phy_device *phydev)
 	return device_can_wakeup(&phydev->mdio.dev);
 }
 
+/**
+ * phy_may_wakeup() - indicate whether PHY has wakeup enabled
+ * @phydev: The phy_device struct
+ *
+ * Returns: true/false depending on the PHY driver's device_set_wakeup_enabled()
+ * setting if using the driver model, otherwise the legacy determination.
+ */
+bool phy_may_wakeup(struct phy_device *phydev);
+
 void phy_resolve_aneg_pause(struct phy_device *phydev);
 void phy_resolve_aneg_linkmode(struct phy_device *phydev);
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
