Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8894772C9
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 14:12:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C17A5C5F1E6;
	Thu, 16 Dec 2021 13:12:37 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70B19C5F1E4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 13:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=16J6ZskC05afcfr8d2+o4lK/doQ1eaSsQnwDTeGF+ec=; b=VlGIVKF4hzlD5znqSeTCRfhSuC
 dXS7pQcoXyqhZfKjqPcPl0+KehlIMBYl4LSrJ62qqheNsSXflSCj2N2eDfQN/JsZNDzkwfsbhRpCI
 H9U67Lha7htHY4MWFtCLgMHj/sGvkU0R3xX1M172B7W4fzsxYk3ffr2p3HKKiRJmNZ8Op0MwWymrU
 hEqbxIUc/Jgn36HkXbY0ugCeFlowxWbUPJ2oS0q7ClY93qYjHjF32NLPK0z5IJOvh4VNLmqJovVeb
 PpB6H9ZVcuf/zUxW6OBU88rSoQUvge+bFIHsehOXdJJXJsHKKISrMby1EuLSm8jx4V3M7iZgGnNZp
 fN2FFyeg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49906 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mxqYj-0007t3-3I; Thu, 16 Dec 2021 13:12:33 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mxqYi-00GYYo-LL; Thu, 16 Dec 2021 13:12:32 +0000
In-Reply-To: <Ybs7DNDkBrf73jDi@shell.armlinux.org.uk>
References: <Ybs7DNDkBrf73jDi@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1mxqYi-00GYYo-LL@rmk-PC.armlinux.org.uk>
Date: Thu, 16 Dec 2021 13:12:32 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH CFT net-next 4/6] net: stmmac/xpcs: convert to
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

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  4 ---
 drivers/net/pcs/pcs-xpcs.c                    | 27 ++++++++-----------
 include/linux/pcs/pcs-xpcs.h                  |  2 --
 3 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b8ec8afb95a6..6f35ea30823c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -958,10 +958,6 @@ static void stmmac_validate(struct phylink_config *config,
 
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
