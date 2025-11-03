Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF08C2B81B
	for <lists+linux-stm32@lfdr.de>; Mon, 03 Nov 2025 12:50:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25A53C62D32;
	Mon,  3 Nov 2025 11:50:23 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3CE3C62D2D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 11:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CbjiE3yRrQYHEu8s8D+tBXPqnkwgsI3CtvhQkXXPRzA=; b=yITtMUXjG26H2n/Mr982LDhvyf
 WKaKSxb9G17jARSSsPhcBzmQfZHX72t5vsWFakEXzrUeSdAdYAl12hXv9WpkkQVgwEeYHAJmaphva
 IohLp+0Lb9nBcihPhl0cRm6yHmboGYW314eodCQtAPlu+59wUeQSnNKixWqkGs3/cmOLHKzzp6/B9
 S/IHGOep+9Px+rEq4G2F5sfbxfkvd5nVRQ9c+Gf1AqwwsCKHSpBbawKPlwogScTwgynQj2wkwF/5V
 T/vzBd1ORmuDHvH3BGOwrxnqoyLfsukbs9+aRpA0EmMtDnaJHhdaVxHEFgfScovqbR7+QQs3+SR4/
 ZcuirTVg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56282 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vFt4e-000000000g4-0oMe;
 Mon, 03 Nov 2025 11:50:12 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vFt4c-0000000Choe-3SII; Mon, 03 Nov 2025 11:50:10 +0000
In-Reply-To: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vFt4c-0000000Choe-3SII@rmk-PC.armlinux.org.uk>
Date: Mon, 03 Nov 2025 11:50:10 +0000
Cc: imx@lists.linux.dev, s32@nxp.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Fabio Estevam <festevam@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 04/11] net: stmmac: add
	stmmac_get_phy_intf_sel()
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

Provide a function to translate the PHY interface mode to the
phy_intf_sel pin configuration for dwmac1000 and dwmac4 cores that
support multiple interfaces. We currently handle MII, GMII, RGMII,
SGMII, RMII and REVMII, but not TBI, RTBI nor SMII as drivers do not
appear to use these three and the driver doesn't currently support
these.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 3ea680cc63d8..0ea74c88a779 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -396,6 +396,7 @@ void stmmac_ptp_register(struct stmmac_priv *priv);
 void stmmac_ptp_unregister(struct stmmac_priv *priv);
 int stmmac_xdp_open(struct net_device *dev);
 void stmmac_xdp_release(struct net_device *dev);
+int stmmac_get_phy_intf_sel(phy_interface_t interface);
 int stmmac_resume(struct device *dev);
 int stmmac_suspend(struct device *dev);
 void stmmac_dvr_remove(struct device *dev);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1e69c1a7dc6c..95d2cd020a0c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3082,6 +3082,26 @@ static void stmmac_check_ether_addr(struct stmmac_priv *priv)
 	}
 }
 
+int stmmac_get_phy_intf_sel(phy_interface_t interface)
+{
+	int phy_intf_sel = -EINVAL;
+
+	if (interface == PHY_INTERFACE_MODE_MII ||
+	    interface == PHY_INTERFACE_MODE_GMII)
+		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
+	else if (phy_interface_mode_is_rgmii(interface))
+		phy_intf_sel = PHY_INTF_SEL_RGMII;
+	else if (interface == PHY_INTERFACE_MODE_SGMII)
+		phy_intf_sel = PHY_INTF_SEL_SGMII;
+	else if (interface == PHY_INTERFACE_MODE_RMII)
+		phy_intf_sel = PHY_INTF_SEL_RMII;
+	else if (interface == PHY_INTERFACE_MODE_REVMII)
+		phy_intf_sel = PHY_INTF_SEL_REVMII;
+
+	return phy_intf_sel;
+}
+EXPORT_SYMBOL_GPL(stmmac_get_phy_intf_sel);
+
 /**
  * stmmac_init_dma_engine - DMA init.
  * @priv: driver private structure
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
