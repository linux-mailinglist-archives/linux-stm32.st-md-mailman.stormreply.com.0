Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD3AA2EA14
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Feb 2025 11:54:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3C37C78F88;
	Mon, 10 Feb 2025 10:54:04 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D9CFC78F85
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2025 10:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jXHt/5Eoh9udL8jpygkO/9L3xb0nJ0bR2NLfWApVjKY=; b=NVZVOAu2F9GcCHcf1iMmevJYjg
 WdIrjH+xP2XlUDw09zzNfDeDwrhDBRLqlF7S+W8Xmh45KGtGBfuh78xPEK4Y5c1Mu/yJPy+7Vs+2i
 Uy3fGcrQd7cw/EKG4MuFOc1qtll0mE+BrIdMgi4T9oCBeY9L/tFF3j2TY6eu+UxPnu7XDoBZPBvGA
 Ui/8fckvxZ6yqiFtCyR6sPWZv+Tj/jmmJc2f+xVMtCpzdlHA+Hu7WHpOBakqfcrBWcKX/ke9uLrNQ
 mepMtKSiQAFAOEdVXZKrEXPQ00+SupQahwrwoH2JnKuho+DCnsIUb9xHHf1P7gSW90vsOeJkslyz5
 ciOefFzg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52020 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1thRQN-0006VJ-1J;
 Mon, 10 Feb 2025 10:53:59 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1thRQ3-003w6u-RH; Mon, 10 Feb 2025 10:53:39 +0000
In-Reply-To: <Z6naiPpxfxGr1Ic6@shell.armlinux.org.uk>
References: <Z6naiPpxfxGr1Ic6@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1thRQ3-003w6u-RH@rmk-PC.armlinux.org.uk>
Date: Mon, 10 Feb 2025 10:53:39 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/8] net: phylink: add support for
 notifying PCS about EEE
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

There are hooks in the stmmac driver into XPCS to control the EEE
settings when LPI is configured at the MAC. This bypasses the layering.
To allow this to be removed from the stmmac driver, add two new
methods for PCS to inform them when the LPI/EEE enablement state
changes at the MAC.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 25 ++++++++++++++++++++++---
 include/linux/phylink.h   | 22 ++++++++++++++++++++++
 2 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 214b62fba991..840af19488d8 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1073,6 +1073,18 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		pcs->ops->pcs_link_up(pcs, neg_mode, interface, speed, duplex);
 }
 
+static void phylink_pcs_disable_eee(struct phylink_pcs *pcs)
+{
+	if (pcs && pcs->ops->pcs_disable_eee)
+		pcs->ops->pcs_disable_eee(pcs);
+}
+
+static void phylink_pcs_enable_eee(struct phylink_pcs *pcs)
+{
+	if (pcs && pcs->ops->pcs_enable_eee)
+		pcs->ops->pcs_enable_eee(pcs);
+}
+
 /* Query inband for a specific interface mode, asking the MAC for the
  * PCS which will be used to handle the interface mode.
  */
@@ -1601,6 +1613,8 @@ static void phylink_deactivate_lpi(struct phylink *pl)
 		phylink_dbg(pl, "disabling LPI\n");
 
 		pl->mac_ops->mac_disable_tx_lpi(pl->config);
+
+		phylink_pcs_disable_eee(pl->pcs);
 	}
 }
 
@@ -1617,13 +1631,18 @@ static void phylink_activate_lpi(struct phylink *pl)
 	phylink_dbg(pl, "LPI timer %uus, tx clock stop %u\n",
 		    pl->mac_tx_lpi_timer, pl->mac_tx_clk_stop);
 
+	phylink_pcs_enable_eee(pl->pcs);
+
 	err = pl->mac_ops->mac_enable_tx_lpi(pl->config, pl->mac_tx_lpi_timer,
 					     pl->mac_tx_clk_stop);
-	if (!err)
-		pl->mac_enable_tx_lpi = true;
-	else
+	if (err) {
+		phylink_pcs_disable_eee(pl->pcs);
 		phylink_err(pl, "%ps() failed: %pe\n",
 			    pl->mac_ops->mac_enable_tx_lpi, ERR_PTR(err));
+		return;
+	}
+
+	pl->mac_enable_tx_lpi = true;
 }
 
 static void phylink_link_up(struct phylink *pl,
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 898b00451bbf..a692d638568f 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -477,6 +477,10 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_disable_eee: optional notification to PCS that EEE has been disabled
+ *		     at the MAC.
+ * @pcs_enable_eee: optional notification to PCS that EEE will be enabled at
+ *		    the MAC.
  * @pcs_pre_init: configure PCS components necessary for MAC hardware
  *                initialization e.g. RX clock for stmmac.
  */
@@ -500,6 +504,8 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
+	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
 	int (*pcs_pre_init)(struct phylink_pcs *pcs);
 };
 
@@ -625,6 +631,22 @@ void pcs_an_restart(struct phylink_pcs *pcs);
 void pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		 phy_interface_t interface, int speed, int duplex);
 
+/**
+ * pcs_disable_eee() - Disable EEE at the PCS
+ * @pcs: a pointer to a &struct phylink_pcs
+ *
+ * Optional method informing the PCS that EEE has been disabled at the MAC.
+ */
+void pcs_disable_eee(struct phylink_pcs *pcs);
+
+/**
+ * pcs_enable_eee() - Enable EEE at the PCS
+ * @pcs: a pointer to a &struct phylink_pcs
+ *
+ * Optional method informing the PCS that EEE is about to be enabled at the MAC.
+ */
+void pcs_enable_eee(struct phylink_pcs *pcs);
+
 /**
  * pcs_pre_init() - Configure PCS components necessary for MAC initialization
  * @pcs: a pointer to a &struct phylink_pcs.
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
