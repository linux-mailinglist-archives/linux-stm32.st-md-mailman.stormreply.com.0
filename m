Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF579CDD49
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Nov 2024 12:12:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC528C78021;
	Fri, 15 Nov 2024 11:12:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3B41C78021
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2024 11:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731669156; x=1763205156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B5LeEIlYNpdmfHj8eX/PzUHRSW/wGsPyx6FjWG0dlLA=;
 b=jwlJz0gLCc8b3mF7WYZO6JidNCSLL8YLImhIDBSyKc19/+IA5gN61XDZ
 8NJpOK9JL33UmJ7v8MAsluyzAOlOOynQxVR6ALqijhPYP358LHgUhkNyQ
 fPHrt7YvxtN7CkojHXvS231AVvT+bUrxcsrv5fj9txWbTPdZ2ZAD+PXnk
 3qLboAkL01129QV5RIdEG0nPlf1v+7qT4f0LKIrmM+ZBNdnCaQXhafo5S
 agCfXxkHz+m2WUh/pb48k+5go/31jsjkkz/K7XTtY5gfhDp3LSndOVAtb
 wukgko5eXhAzVw4beMNg7lEJU1XEkp5a9ggWkR+B+CTl6NiYjFEoMTeY6 A==;
X-CSE-ConnectionGUID: 022B9MACTaiXQFXaaZixcA==
X-CSE-MsgGUID: MJhV7kX0TzmavM26v4yC4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="34543468"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="34543468"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 03:12:33 -0800
X-CSE-ConnectionGUID: UCFsvvZmToeJ5JHd+tMD9g==
X-CSE-MsgGUID: 6N7EzlmcSfO4vtFCaDZ+Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="88112372"
Received: from unknown (HELO YongLiang-Ubuntu20-iLBPG12.png.intel.com)
 ([10.88.229.33])
 by fmviesa006.fm.intel.com with ESMTP; 15 Nov 2024 03:12:29 -0800
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>
Date: Fri, 15 Nov 2024 19:11:50 +0800
Message-Id: <20241115111151.183108-2-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
References: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH net v2 1/2] net: phy: replace
	phydev->eee_enabled with eee_cfg.eee_enabled
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

Not all PHYs have EEE enabled by default. For example, Marvell PHYs are
designed to have EEE hardware disabled during the initial state.

In the initial stage, phy_probe() sets phydev->eee_enabled to be disabled.
Then, the MAC calls phy_support_eee() to set eee_cfg.eee_enabled to be
enabled. However, when phy_start_aneg() is called,
genphy_c45_an_config_eee_aneg() still refers to phydev->eee_enabled.
This causes the 'ethtool --show-eee' command to show that EEE is enabled,
but in actuality, the driver side is disabled.

This patch will remove phydev->eee_enabled and replace it with
eee_cfg.eee_enabled. When performing genphy_c45_an_config_eee_aneg(),
it will follow the master configuration to have software and hardware
in sync.

Fixes: 3eeca4e199ce ("net: phy: do not force EEE support")
Cc: stable@vger.kernel.org
Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Suggested-by: Russell King <linux@armlinux.org.uk>
---
 drivers/net/phy/phy-c45.c    | 11 +++++------
 drivers/net/phy/phy_device.c |  6 +++---
 include/linux/phy.h          |  5 ++---
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/net/phy/phy-c45.c b/drivers/net/phy/phy-c45.c
index 5695935fdce9..fa42158eff83 100644
--- a/drivers/net/phy/phy-c45.c
+++ b/drivers/net/phy/phy-c45.c
@@ -272,7 +272,7 @@ int genphy_c45_an_config_aneg(struct phy_device *phydev)
 	linkmode_and(phydev->advertising, phydev->advertising,
 		     phydev->supported);
 
-	ret = genphy_c45_an_config_eee_aneg(phydev);
+	ret = genphy_c45_an_config_eee_aneg(phydev, phydev->eee_cfg.eee_enabled);
 	if (ret < 0)
 		return ret;
 	else if (ret)
@@ -940,9 +940,10 @@ EXPORT_SYMBOL_GPL(genphy_c45_read_eee_abilities);
  * genphy_c45_an_config_eee_aneg - configure EEE advertisement
  * @phydev: target phy_device struct
  */
-int genphy_c45_an_config_eee_aneg(struct phy_device *phydev)
+int genphy_c45_an_config_eee_aneg(struct phy_device *phydev,
+				  bool is_eee_enabled)
 {
-	if (!phydev->eee_enabled) {
+	if (!is_eee_enabled) {
 		__ETHTOOL_DECLARE_LINK_MODE_MASK(adv) = {};
 
 		return genphy_c45_write_eee_adv(phydev, adv);
@@ -1575,9 +1576,7 @@ int genphy_c45_ethtool_set_eee(struct phy_device *phydev,
 		linkmode_copy(phydev->advertising_eee, adv);
 	}
 
-	phydev->eee_enabled = data->eee_enabled;
-
-	ret = genphy_c45_an_config_eee_aneg(phydev);
+	ret = genphy_c45_an_config_eee_aneg(phydev, data->eee_enabled);
 	if (ret > 0) {
 		ret = phy_restart_aneg(phydev);
 		if (ret < 0)
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 499797646580..97e835ad4544 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -2421,7 +2421,7 @@ int __genphy_config_aneg(struct phy_device *phydev, bool changed)
 	unsigned long *advert;
 	int err;
 
-	err = genphy_c45_an_config_eee_aneg(phydev);
+	err = genphy_c45_an_config_eee_aneg(phydev, phydev->eee_cfg.eee_enabled);
 	if (err < 0)
 		return err;
 	else if (err)
@@ -3595,12 +3595,12 @@ static int phy_probe(struct device *dev)
 	/* There is no "enabled" flag. If PHY is advertising, assume it is
 	 * kind of enabled.
 	 */
-	phydev->eee_enabled = !linkmode_empty(phydev->advertising_eee);
+	phydev->eee_cfg.eee_enabled = !linkmode_empty(phydev->advertising_eee);
 
 	/* Some PHYs may advertise, by default, not support EEE modes. So,
 	 * we need to clean them.
 	 */
-	if (phydev->eee_enabled)
+	if (phydev->eee_cfg.eee_enabled)
 		linkmode_and(phydev->advertising_eee, phydev->supported_eee,
 			     phydev->advertising_eee);
 
diff --git a/include/linux/phy.h b/include/linux/phy.h
index a98bc91a0cde..fde9f1f868bb 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -601,7 +601,6 @@ struct macsec_ops;
  * @adv_old: Saved advertised while power saving for WoL
  * @supported_eee: supported PHY EEE linkmodes
  * @advertising_eee: Currently advertised EEE linkmodes
- * @eee_enabled: Flag indicating whether the EEE feature is enabled
  * @enable_tx_lpi: When True, MAC should transmit LPI to PHY
  * @eee_cfg: User configuration of EEE
  * @lp_advertising: Current link partner advertised linkmodes
@@ -721,7 +720,6 @@ struct phy_device {
 	/* used for eee validation and configuration*/
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_eee);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising_eee);
-	bool eee_enabled;
 
 	/* Host supported PHY interface types. Should be ignored if empty. */
 	DECLARE_PHY_INTERFACE_MASK(host_interfaces);
@@ -1952,7 +1950,8 @@ int genphy_c45_ethtool_get_eee(struct phy_device *phydev,
 int genphy_c45_ethtool_set_eee(struct phy_device *phydev,
 			       struct ethtool_keee *data);
 int genphy_c45_write_eee_adv(struct phy_device *phydev, unsigned long *adv);
-int genphy_c45_an_config_eee_aneg(struct phy_device *phydev);
+int genphy_c45_an_config_eee_aneg(struct phy_device *phydev,
+				  bool is_eee_enabled);
 int genphy_c45_read_eee_adv(struct phy_device *phydev, unsigned long *adv);
 
 /* Generic C45 PHY driver */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
