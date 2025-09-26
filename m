Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3B4BA4CC7
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Sep 2025 19:59:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA3DDC3FADA;
	Fri, 26 Sep 2025 17:59:45 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1520C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 17:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eAJNXK78mKd7OtlQP1vMtMnWkBkndgWhCo7RQEfV9I8=; b=d4j1Y72bdiVryvfjZFl9r+ave7
 kP7LP1VuqoWayubc7byPrNuZ8bQFRJCXoesqBaHMaSjP5hZIpF46DX2J3uBW1fbQVlfNhIQLdHEpw
 6kPGDWvFujNeG38Weq3cztBFrFLV+YKLGcoJspgkdHRbHXmmvsLbn5lf+G0nxK2EaT2bHKOI2s1y2
 vJNi9SFK0zcLOdS4tc4t/Z/gr/9Absf1Jr68CwOH/P09wZdOLupJH2QyOUn8zfSx++0xmja7O51hL
 G2LJDnnWY7hcyk6WwjJnXckCDk4vpfLwNXC8digZnvLno1oASsKSHJLp8k66+APpbbwqfK3yxkxMl
 X21nLgSQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45712)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1v2Cj6-000000003ol-3HHZ;
 Fri, 26 Sep 2025 18:59:24 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1v2Cj1-000000000rU-3svZ; Fri, 26 Sep 2025 18:59:19 +0100
Date: Fri, 26 Sep 2025 18:59:19 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <aNbUdweqsCKAKJKl@shell.armlinux.org.uk>
References: <20250917-wol-smsc-phy-v2-0-105f5eb89b7f@foss.st.com>
 <20250917-wol-smsc-phy-v2-2-105f5eb89b7f@foss.st.com>
 <aMriVDAgZkL8DAdH@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="BpneffLJvKcKfQ39"
Content-Disposition: inline
In-Reply-To: <aMriVDAgZkL8DAdH@shell.armlinux.org.uk>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tristram Ha <Tristram.Ha@microchip.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/4] net: stmmac: stm32: add
 WoL from PHY support
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
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--BpneffLJvKcKfQ39
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 17, 2025 at 05:31:16PM +0100, Russell King (Oracle) wrote:
> On Wed, Sep 17, 2025 at 05:36:37PM +0200, Gatien Chevallier wrote:
> > If the "st,phy-wol" property is present in the device tree node,
> > set the STMMAC_FLAG_USE_PHY_WOL flag to use the WoL capability of
> > the PHY.
> > 
> > Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> > index 77a04c4579c9dbae886a0b387f69610a932b7b9e..6f197789cc2e8018d6959158b795e4bca46869c5 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> > @@ -106,6 +106,7 @@ struct stm32_dwmac {
> >  	u32 speed;
> >  	const struct stm32_ops *ops;
> >  	struct device *dev;
> > +	bool phy_wol;
> >  };
> >  
> >  struct stm32_ops {
> > @@ -433,6 +434,8 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
> >  		}
> >  	}
> >  
> > +	dwmac->phy_wol = of_property_read_bool(np, "st,phy-wol");
> > +
> >  	return err;
> >  }
> >  
> > @@ -557,6 +560,8 @@ static int stm32_dwmac_probe(struct platform_device *pdev)
> >  	plat_dat->bsp_priv = dwmac;
> >  	plat_dat->suspend = stm32_dwmac_suspend;
> >  	plat_dat->resume = stm32_dwmac_resume;
> > +	if (dwmac->phy_wol)
> > +		plat_dat->flags |= STMMAC_FLAG_USE_PHY_WOL;
> 
> I would much rather we found a different approach, rather than adding
> custom per-driver DT properties to figure this out.
> 
> Andrew has previously suggested that MAC drivers should ask the PHY
> whether WoL is supported, but this pre-supposes that PHY drivers are
> coded correctly to only report WoL capabilities if they are really
> capable of waking the system. As shown in your smsc PHY driver patch,
> this may not be the case.
> 
> Given that we have historically had PHY drivers reporting WoL
> capabilities without being able to wake the system, we can't
> implement Andrew's suggestion easily.
> 
> The only approach I can think that would allow us to transition is
> to add:
> 
> static inline bool phy_can_wakeup(struct phy_device *phy_dev)
> {
> 	return device_can_wakeup(&phy_dev->mdio.dev);
> }
> 
> to include/linux/phy.h, and a corresponding wrapper for phylink.
> This can then be used to determine whether to attempt to use PHY-based
> Wol in stmmac_get_wol() and rtl8211f_set_wol(), falling back to
> PMT-based WoL if supported at the MAC.
> 
> So, maybe something like:
> 
> static u32 stmmac_wol_support(struct stmmac_priv *priv)
> {
> 	u32 support = 0;
> 
> 	if (priv->plat->pmt && device_can_wakeup(priv->device)) {
> 		support = WAKE_UCAST;
> 		if (priv->hw_cap_support && priv->dma_cap.pmt_magic_frame)
> 			support |= WAKE_MAGIC;
> 	}
> 
> 	return support;
> }
> 
> static void stmmac_get_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
> {
> 	struct stmmac_priv *priv = netdev_priv(dev);
> 	int err;
> 
> 	/* Check STMMAC_FLAG_USE_PHY_WOL for legacy */
> 	if (phylink_can_wakeup(priv->phylink) ||
> 	    priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL) {
> 		err = phylink_ethtool_get_wol(priv->phylink, wol);
> 		if (err != 0 && err != -EOPNOTSUPP)
> 			return;
> 	}
> 
> 	wol->supported |= stmmac_wol_support(priv);
> 
> 	/* A read of priv->wolopts is single-copy atomic. Locking
> 	 * doesn't add any benefit.
> 	 */
> 	wol->wolopts |= priv->wolopts;
> }
> 
> static int stmmac_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
> {
> 	struct stmmac_priv *priv = netdev_priv(dev);
> 	u32 support, wolopts;
> 	int err;
> 
> 	wolopts = wol->wolopts;
> 
> 	/* Check STMMAC_FLAG_USE_PHY_WOL for legacy */
> 	if (phylink_can_wakeup(priv->phylink) ||
> 	    priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL) {
> 		struct ethtool_wolinfo w;
> 
> 		err = phylink_ethtool_set_wol(priv->phylink, wol);
> 		if (err != -EOPNOTSUPP)
> 			return err;
> 
> 		/* Remove the WoL modes that the PHY is handling */
> 		if (!phylink_ethtool_get_wol(priv->phylink, &w))
> 			wolopts &= ~w.wolopts;
> 	}
> 
> 	support = stmmac_wol_support(priv);
> 
> 	mutex_lock(&priv->lock);
> 	priv->wolopts = wolopts & support;
> 	device_set_wakeup_enable(priv->device, !!priv->wolopts);
> 	mutex_unlock(&priv->lock);
> 
> 	return 0;
> }
> 
> ... and now I'm wondering whether this complexity is something that
> phylink should handle internally, presenting a mac_set_wol() method
> to configure the MAC-side WoL settings. What makes it difficult to
> just move into phylink is the STMMAC_FLAG_USE_PHY_WOL flag, but
> that could be a "force_phy_wol" flag in struct phylink_config as
> a transitionary measure... so long as PHY drivers get fixed.

I came up with this as an experiment - I haven't tested it beyond
running it through the compiler (didn't let it get to the link stage
yet.) Haven't even done anything with it for stmmac yet.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

--BpneffLJvKcKfQ39
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-net-phy-add-phy_can_wakeup.patch"

From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next 1/2] net: phy: add phy_can_wakeup()

Add phy_can_wakeup() to report whether the PHY driver has marked the
PHY device as being wake-up capable as far as the driver model is
concerned.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 include/linux/phy.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index b377dfaa6801..7f6758198948 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1379,6 +1379,18 @@ static inline void phy_disable_eee_mode(struct phy_device *phydev, u32 link_mode
 	linkmode_clear_bit(link_mode, phydev->advertising_eee);
 }
 
+/**
+ * phy_can_wakeup() - indicate whether PHY has driver model wakeup capabilities
+ * @phydev: The phy_device struct
+ *
+ * Returns: true/false depending on the PHY driver's device_set_wakeup_capable()
+ * setting.
+ */
+static inline bool phy_can_wakeup(struct phy_device *phydev)
+{
+	return device_can_wakeup(&phydev->mdio.dev);
+}
+
 void phy_resolve_aneg_pause(struct phy_device *phydev);
 void phy_resolve_aneg_linkmode(struct phy_device *phydev);
 
-- 
2.47.3


--BpneffLJvKcKfQ39
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0002-net-phylink-add-Wake-on-Lan-MAC-support.patch"

From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next 2/2] net: phylink: add Wake-on-Lan MAC support

Add core phylink Wake-on-Lan support.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 66 ++++++++++++++++++++++++++++++++++++---
 include/linux/phylink.h   | 20 ++++++++++++
 2 files changed, 82 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 9d7799ea1c17..e857a147f76b 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -93,6 +93,9 @@ struct phylink {
 	u8 sfp_port;
 
 	struct eee_config eee_cfg;
+
+	u32 wolopts_mac;
+	u8 wol_sopass[SOPASS_MAX];
 };
 
 #define phylink_printk(level, pl, fmt, ...) \
@@ -2673,6 +2676,17 @@ void phylink_resume(struct phylink *pl)
 }
 EXPORT_SYMBOL_GPL(phylink_resume);
 
+static bool phylink_mac_supports_wol(struct phylink *pl)
+{
+	return !!pl->mac_ops->mac_wol_set;
+}
+
+static bool phylink_phy_supports_wol(struct phylink *pl,
+				     struct phy_device *phydev)
+{
+	return phydev && (pl->config->wol_phy_legacy || phy_can_wakeup(phydev));
+}
+
 /**
  * phylink_ethtool_get_wol() - get the wake on lan parameters for the PHY
  * @pl: a pointer to a &struct phylink returned from phylink_create()
@@ -2689,8 +2703,21 @@ void phylink_ethtool_get_wol(struct phylink *pl, struct ethtool_wolinfo *wol)
 	wol->supported = 0;
 	wol->wolopts = 0;
 
-	if (pl->phydev)
-		phy_ethtool_get_wol(pl->phydev, wol);
+	if (phylink_mac_supports_wol(pl)) {
+		if (phylink_phy_supports_wol(pl, pl->phydev))
+			phy_ethtool_get_wol(pl->phydev, wol);
+
+		/* Where the MAC augments the WoL support, merge its support and
+		 * current configuration.
+		 */
+		wol->supported |= pl->config->wol_mac_support;
+		wol->wolopts |= pl->wolopts_mac;
+		memcpy(wol->sopass, pl->wol_sopass, sizeof(wol->sopass));
+	} else {
+		/* Legacy */
+		if (pl->phydev)
+			phy_ethtool_get_wol(pl->phydev, wol);
+	}
 }
 EXPORT_SYMBOL_GPL(phylink_ethtool_get_wol);
 
@@ -2707,12 +2734,43 @@ EXPORT_SYMBOL_GPL(phylink_ethtool_get_wol);
  */
 int phylink_ethtool_set_wol(struct phylink *pl, struct ethtool_wolinfo *wol)
 {
+	struct ethtool_wolinfo w;
 	int ret = -EOPNOTSUPP;
+	bool changed;
+	u32 wolopts;
 
 	ASSERT_RTNL();
 
-	if (pl->phydev)
-		ret = phy_ethtool_set_wol(pl->phydev, wol);
+	if (phylink_mac_supports_wol(pl)) {
+		wolopts = wol->wolopts;
+
+		if (phylink_phy_supports_wol(pl, pl->phydev)) {
+			ret = phy_ethtool_set_wol(pl->phydev, wol);
+			if (ret != 0 && ret != -EOPNOTSUPP)
+				return ret;
+
+			phy_ethtool_get_wol(pl->phydev, &w);
+
+			/* Any Wake-on-Lan modes which the PHY is handling
+			 * should not be passed on to the MAC.
+			 */
+			wolopts &= ~w.wolopts;
+		}
+
+		wolopts &= pl->config->wol_mac_support;
+		changed = pl->wolopts_mac != wolopts;
+		if (wolopts & WAKE_MAGIC)
+			changed |= !!memcmp(wol->sopass, pl->wol_sopass,
+					    sizeof(wol->sopass));
+		memcpy(pl->wol_sopass, wol->sopass, sizeof(pl->wol_sopass));
+
+		if (changed)
+			ret = pl->mac_ops->mac_wol_set(pl->config, wolopts,
+						       wol->sopass);
+	} else {
+		if (pl->phydev)
+			ret = phy_ethtool_set_wol(pl->phydev, wol);
+	}
 
 	return ret;
 }
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 9af0411761d7..26ff099c32cb 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -156,6 +156,8 @@ enum phylink_op_type {
  * @lpi_capabilities: MAC speeds which can support LPI signalling
  * @lpi_timer_default: Default EEE LPI timer setting.
  * @eee_enabled_default: If set, EEE will be enabled by phylink at creation time
+ * @wol_phy_legacy: Use Wake-on-Lan with PHY even if phy_can_wakeup() is false
+ * @wol_mac_support: Bitmask of MAC supported %WAKE_* options
  */
 struct phylink_config {
 	struct device *dev;
@@ -173,6 +175,10 @@ struct phylink_config {
 	unsigned long lpi_capabilities;
 	u32 lpi_timer_default;
 	bool eee_enabled_default;
+
+	/* Wake-on-Lan support */
+	bool wol_phy_legacy;
+	u32 wol_mac_support;
 };
 
 void phylink_limit_mac_speed(struct phylink_config *config, u32 max_speed);
@@ -188,6 +194,7 @@ void phylink_limit_mac_speed(struct phylink_config *config, u32 max_speed);
  * @mac_link_up: allow the link to come up.
  * @mac_disable_tx_lpi: disable LPI.
  * @mac_enable_tx_lpi: enable and configure LPI.
+ * @mac_wol_set: configure Wake-on-Lan settings at the MAC.
  *
  * The individual methods are described more fully below.
  */
@@ -211,6 +218,9 @@ struct phylink_mac_ops {
 	void (*mac_disable_tx_lpi)(struct phylink_config *config);
 	int (*mac_enable_tx_lpi)(struct phylink_config *config, u32 timer,
 				 bool tx_clk_stop);
+
+	int (*mac_wol_set)(struct phylink_config *config, u32 wolopts,
+			   u8 *sopass);
 };
 
 #if 0 /* For kernel-doc purposes only. */
@@ -440,6 +450,16 @@ void mac_disable_tx_lpi(struct phylink_config *config);
  */
 int mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 		      bool tx_clk_stop);
+
+/**
+ * mac_wol_set() - configure the Wake-on-Lan parameters
+ * @config: a pointer to a &struct phylink_config.
+ * @wolopts: Bitmask of %WAKE_* flags for enabled Wake-On-Lan modes.
+ * @sopass: SecureOn(tm) password; meaningful only for %WAKE_MAGICSECURE
+ *
+ * Returns: 0 on success.
+ */
+int (*mac_wol_set)(struct phylink_config *config, u32 wolopts, u8 *sopass);
 #endif
 
 struct phylink_pcs_ops;
-- 
2.47.3


--BpneffLJvKcKfQ39
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--BpneffLJvKcKfQ39--
