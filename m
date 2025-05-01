Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA81FAA5DEF
	for <lists+linux-stm32@lfdr.de>; Thu,  1 May 2025 13:46:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70781C78F87;
	Thu,  1 May 2025 11:46:02 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FBD3C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 May 2025 11:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mgop55mX+h2K4OCekjSKKqWx/tXVnI8uvVHWE2m8nL4=; b=HSZjDXus/XrPdX15GGFhHryWw3
 CLU8YBVsc+pgT88LzbN9IwyZT/JROs3dFvEiSKxxh9n4maj3q0Aknh0u9sAnK2OQmZ3rD1ZLy7jIc
 iwHeDFIEc5Ql2rzFuCDcFDIs4HcfacowdDKZa+OESGNUM2DZgqUC4UWdOs0Jj7Tk5FUfnkXz5Zjfa
 kJ8kUiXGKjepcQbGqAMMxdKB8nHoa5+W9XTOqryi+aAh4gFnBVXRB9ogxo/okYtTHb0vKUxwPpxu8
 qU54M+Kp9ox/567yQ83S62pseQ2ru2bEEVVQdzfaYeZH7qYlzhx6fUS5Uey+P4w6E15OoS7+JGKA9
 /L44hUpg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59058 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1uASMU-00005G-2r;
 Thu, 01 May 2025 12:45:54 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uASLn-0021Qd-Mi; Thu, 01 May 2025 12:45:11 +0100
In-Reply-To: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
References: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uASLn-0021Qd-Mi@rmk-PC.armlinux.org.uk>
Date: Thu, 01 May 2025 12:45:11 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/6] net: stmmac: add
 get_interfaces() platform method
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

Add a get_interfaces() platform method to allow platforms to indicate
to phylink which interface modes they support - which then allows
phylink to validate on initialisation that the configured PHY interface
mode is actually supported.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c    | 16 +++++++++++++---
 include/linux/stmmac.h                           |  2 ++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ac6ab121eb33..5f66f816a249 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1283,10 +1283,20 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	if (mdio_bus_data)
 		config->default_an_inband = mdio_bus_data->default_an_inband;
 
-	/* Set the platform/firmware specified interface mode. Note, phylink
-	 * deals with the PHY interface mode, not the MAC interface mode.
+	/* Get the PHY interface modes (at the PHY end of the link) that
+	 * are supported by the platform.
 	 */
-	__set_bit(priv->plat->phy_interface, config->supported_interfaces);
+	if (priv->plat->get_interfaces)
+		priv->plat->get_interfaces(priv, priv->plat->bsp_priv,
+					   config->supported_interfaces);
+
+	/* Set the platform/firmware specified interface mode if the
+	 * supported interfaces have not already been provided using
+	 * phy_interface as a last resort.
+	 */
+	if (phy_interface_empty(config->supported_interfaces))
+		__set_bit(priv->plat->phy_interface,
+			  config->supported_interfaces);
 
 	/* If we have an xpcs, it defines which PHY interfaces are supported. */
 	if (priv->hw->xpcs)
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 8aed09d65b4a..537bced69c46 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -233,6 +233,8 @@ struct plat_stmmacenet_data {
 	u8 tx_sched_algorithm;
 	struct stmmac_rxq_cfg rx_queues_cfg[MTL_MAX_RX_QUEUES];
 	struct stmmac_txq_cfg tx_queues_cfg[MTL_MAX_TX_QUEUES];
+	void (*get_interfaces)(struct stmmac_priv *priv, void *bsp_priv,
+			       unsigned long *interfaces);
 	int (*set_clk_tx_rate)(void *priv, struct clk *clk_tx_i,
 			       phy_interface_t interface, int speed);
 	void (*fix_mac_speed)(void *priv, int speed, unsigned int mode);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
