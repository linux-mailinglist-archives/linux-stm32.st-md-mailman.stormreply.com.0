Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBDC49C76B
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jan 2022 11:26:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 905C5C5F1D6;
	Wed, 26 Jan 2022 10:26:16 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3413CC5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jan 2022 10:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gfL1VzFUiN7ngjYEJ+1jdb7SZDqapb4ttTv8ClhWj+4=; b=T4FRWGbc4R67u4UPkUMWqd0oJZ
 9fmOYY/lAckeFbxZz4My1aUrbzAJqO6CcglswNWFlLrVvXW+0hDaMt/zZKyKYbBGioq8MKnkegXy7
 z+yi+pshRFN5apAS6+Beq3sT0KDWm9A8H90hCzPXRPYJBQqS07D5XPcjpUsOSsXmtT2+gxKXFsTar
 pvZpDjbG5kxzZnJQTZrvRMqrlYMjjF68W5vXl/L2FqWs0sVP7lLVf238GrLb/A0LXtxBsS89GPIXr
 GOlFYE11W0tcExKCYVPEWM248BiGJmSI/1S4rmBo+B2Db3N5ETqVt9HJ1TzULGfMXpyPaX62L0D7P
 DBMN6ufQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35158 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nCfVD-000397-2C; Wed, 26 Jan 2022 10:26:11 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nCfVC-005RdF-FZ; Wed, 26 Jan 2022 10:26:10 +0000
In-Reply-To: <YfEhaK7VtJ4oru03@shell.armlinux.org.uk>
References: <YfEhaK7VtJ4oru03@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nCfVC-005RdF-FZ@rmk-PC.armlinux.org.uk>
Date: Wed, 26 Jan 2022 10:26:10 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next v2 4/7] net: stmmac/xpcs: convert to
	pcs_validate()
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

stmmac explicitly calls the xpcs driver to validate the ethtool
linkmodes. This is no longer necessary as phylink now supports
validation through a PCS method. Convert both drivers to use this
new mechanism.

Tested-by: Wong Vee Khee <vee.khee.wong@linux.intel.com> # Intel EHL
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  5 ----
 drivers/net/pcs/pcs-xpcs.c                    | 27 ++++++++-----------
 include/linux/pcs/pcs-xpcs.h                  |  2 --
 3 files changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index bd20920daf7b..029f21b9d452 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -940,7 +940,6 @@ static void stmmac_validate(struct phylink_config *config,
 			    unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(mac_supported) = { 0, };
 
 	/* This is very similar to phylink_generic_validate() except that
@@ -958,10 +957,6 @@ static void stmmac_validate(struct phylink_config *config,
 
 	linkmode_and(supported, supported, mac_supported);
 	linkmode_and(state->advertising, state->advertising, mac_supported);
-
-	/* If PCS is supported, check which modes it supports. */
-	if (priv->hw->xpcs)
-		xpcs_validate(priv->hw->xpcs, supported, state);
 }
 
 static void stmmac_mac_config(struct phylink_config *config, unsigned int mode,
diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index f45821524fab..61418d4dc0cd 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -632,35 +632,29 @@ static void xpcs_resolve_pma(struct dw_xpcs *xpcs,
 	}
 }
 
-void xpcs_validate(struct dw_xpcs *xpcs, unsigned long *supported,
-		   struct phylink_link_state *state)
+static int xpcs_validate(struct phylink_pcs *pcs, unsigned long *supported,
+			 const struct phylink_link_state *state)
 {
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(xpcs_supported);
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(xpcs_supported) = { 0, };
 	const struct xpcs_compat *compat;
+	struct dw_xpcs *xpcs;
 	int i;
 
-	/* phylink expects us to report all supported modes with
-	 * PHY_INTERFACE_MODE_NA, just don't limit the supported and
-	 * advertising masks and exit.
-	 */
-	if (state->interface == PHY_INTERFACE_MODE_NA)
-		return;
-
-	linkmode_zero(xpcs_supported);
-
+	xpcs = phylink_pcs_to_xpcs(pcs);
 	compat = xpcs_find_compat(xpcs->id, state->interface);
 
-	/* Populate the supported link modes for this
-	 * PHY interface type
+	/* Populate the supported link modes for this PHY interface type.
+	 * FIXME: what about the port modes and autoneg bit? This masks
+	 * all those away.
 	 */
 	if (compat)
 		for (i = 0; compat->supported[i] != __ETHTOOL_LINK_MODE_MASK_NBITS; i++)
 			set_bit(compat->supported[i], xpcs_supported);
 
 	linkmode_and(supported, supported, xpcs_supported);
-	linkmode_and(state->advertising, state->advertising, xpcs_supported);
+
+	return 0;
 }
-EXPORT_SYMBOL_GPL(xpcs_validate);
 
 void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
 {
@@ -1120,6 +1114,7 @@ static const struct xpcs_id xpcs_id_list[] = {
 };
 
 static const struct phylink_pcs_ops xpcs_phylink_ops = {
+	.pcs_validate = xpcs_validate,
 	.pcs_config = xpcs_config,
 	.pcs_get_state = xpcs_get_state,
 	.pcs_link_up = xpcs_link_up,
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index 3126a4924d92..266eb26fb029 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -31,8 +31,6 @@ void xpcs_link_up(struct phylink_pcs *pcs, unsigned int mode,
 		  phy_interface_t interface, int speed, int duplex);
 int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
 		   unsigned int mode);
-void xpcs_validate(struct dw_xpcs *xpcs, unsigned long *supported,
-		   struct phylink_link_state *state);
 void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces);
 int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
 		    int enable);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
