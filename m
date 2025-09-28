Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F45BA6C6E
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Sep 2025 10:59:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04A80C32EA8;
	Sun, 28 Sep 2025 08:59:32 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 586A4C36B1E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Sep 2025 08:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2YaJLzurlCfXcfc8Px72NgfNrq2XZEVc2OMspglX/3M=; b=haAs3jFsBNvXmRoBLY8HGisP5R
 NzxlqpB2TVCJ4Rlqr2c5ATKDVebzg1S6dMWLmF9+2LNwXqT+pCUonHnC7Ksv4/zszou4V4aB7WPAM
 tbTSRMuKYkwMBEstIH7xzbEqbay7pNroe+gMLBPKS8oAhfWK8RZ6hDGToobRCWtsJbiYVU8fXXBfX
 1grsVfazI5iPjTI4G0vq7DeGEAi9XamSLvrEX94zk/XwAP9Jegg9E37sA4kRsMEFiv3IW60gnV7TW
 sw3Trj91Z4VzlZJyC2qQgrHWTjXdfuo6N8qr0x5oe5CLq96GIrQG29i5nVbhPar+zifAyDL1BaoEM
 wnljmbjg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54426 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1v2nFO-000000005BG-2e4q;
 Sun, 28 Sep 2025 09:59:10 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1v2nFN-00000007jXb-1kj0; Sun, 28 Sep 2025 09:59:09 +0100
In-Reply-To: <aNj4HY_mk4JDsD_D@shell.armlinux.org.uk>
References: <aNj4HY_mk4JDsD_D@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1v2nFN-00000007jXb-1kj0@rmk-PC.armlinux.org.uk>
Date: Sun, 28 Sep 2025 09:59:09 +0100
Cc: Rob Herring <robh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tristram Ha <Tristram.Ha@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH RFC net-next 4/6] net: phylink: add phylink
 managed wake-on-lan PHY speed control
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

Some drivers, e.g. stmmac, use the speed_up()/speed_down() APIs to
gain additional power saving during Wake-on-LAN where the PHY is
managing the state.

Add support to phylink for this, which can be enabled by the MAC
driver. Only change the PHY speed if the PHY is configured for
wake-up, but without any wake-up on the MAC side, as MAC side
means changing the configuration once the negotiation has
completed.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 12 ++++++++++++
 include/linux/phylink.h   |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 9a3783e719bc..3e48b0319634 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2565,6 +2565,12 @@ void phylink_rx_clk_stop_unblock(struct phylink *pl)
 }
 EXPORT_SYMBOL_GPL(phylink_rx_clk_stop_unblock);
 
+static bool phylink_phy_pm_speed_ctrl(struct phylink *pl)
+{
+	return pl->config->wol_phy_speed_ctrl && !pl->wolopts_mac &&
+	       pl->phydev && phy_may_wakeup(pl->phydev);
+}
+
 /**
  * phylink_suspend() - handle a network device suspend event
  * @pl: a pointer to a &struct phylink returned from phylink_create()
@@ -2614,6 +2620,9 @@ void phylink_suspend(struct phylink *pl, bool mac_wol)
 	} else {
 		phylink_stop(pl);
 	}
+
+	if (phylink_phy_pm_speed_ctrl(pl))
+		phy_speed_down(pl->phydev, false);
 }
 EXPORT_SYMBOL_GPL(phylink_suspend);
 
@@ -2653,6 +2662,9 @@ void phylink_resume(struct phylink *pl)
 {
 	ASSERT_RTNL();
 
+	if (phylink_phy_pm_speed_ctrl(pl))
+		phy_speed_up(pl->phydev);
+
 	if (test_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state)) {
 		/* Wake-on-Lan enabled, MAC handling */
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 59cb58b29d1d..38363e566ac3 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -157,6 +157,7 @@ enum phylink_op_type {
  * @lpi_timer_default: Default EEE LPI timer setting.
  * @eee_enabled_default: If set, EEE will be enabled by phylink at creation time
  * @wol_phy_legacy: Use Wake-on-Lan with PHY even if phy_can_wakeup() is false
+ * @wol_phy_speed_ctrl: Use phy speed control on suspend/resume
  * @wol_mac_support: Bitmask of MAC supported %WAKE_* options
  */
 struct phylink_config {
@@ -178,6 +179,7 @@ struct phylink_config {
 
 	/* Wake-on-Lan support */
 	bool wol_phy_legacy;
+	bool wol_phy_speed_ctrl;
 	u32 wol_mac_support;
 };
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
