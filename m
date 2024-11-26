Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6359D9786
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 13:52:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F698C78021;
	Tue, 26 Nov 2024 12:52:38 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE4F5C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 12:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LdW5Yx0SG3F8/WfyoFPcGHNk+kX/hW5pThNLPaZ3wWw=; b=wiVdL77/UavYrTh6C+a8AncCcR
 DOgwH9iZjeWOUj/8r9oCIq59JaKtilDrTJxehVLDoETTim5ARKuQSKYZvLEOhMyXl5ntSPeAcG3+f
 UjgjyAGxvaVCv+vF9KBstpBKD0u8QXSuvsW9owh4StGO8VqzlXfnIZh2paYneO2tF3TSYxpkKG+cA
 RR5NilUmrYekuDqcjsNRJLOZF+yElgL68/VKSvxVLi27bcD6t9KPG7qAmXJAWlcUbDWqHl/w+hSxl
 DCgJcE/Y+KqFiumwm5fD0yWUnTAd3EUspAFu7BULQ1n0vjz0OoF0I2PnapksmYDOGUJGOuHPtbejX
 RtdPikIg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48726 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tFv3L-0006rx-2B;
 Tue, 26 Nov 2024 12:52:28 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tFv3K-005yhZ-E8; Tue, 26 Nov 2024 12:52:26 +0000
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tFv3K-005yhZ-E8@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 12:52:26 +0000
Cc: UNGLinuxDriver@microchip.com, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 03/23] net: phy: marvell: use
 phydev->eee_cfg.eee_enabled
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

Rather than calling genphy_c45_ethtool_get_eee() to retrieve whether
EEE is enabled, use the value stored in the phy_device eee_cfg
structure.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/marvell.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index cd50cd6a7f75..1d117fa8c564 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -1508,7 +1508,6 @@ static int m88e1540_get_fld(struct phy_device *phydev, u8 *msecs)
 
 static int m88e1540_set_fld(struct phy_device *phydev, const u8 *msecs)
 {
-	struct ethtool_keee eee;
 	int val, ret;
 
 	if (*msecs == ETHTOOL_PHY_FAST_LINK_DOWN_OFF)
@@ -1518,8 +1517,7 @@ static int m88e1540_set_fld(struct phy_device *phydev, const u8 *msecs)
 	/* According to the Marvell data sheet EEE must be disabled for
 	 * Fast Link Down detection to work properly
 	 */
-	ret = genphy_c45_ethtool_get_eee(phydev, &eee);
-	if (!ret && eee.eee_enabled) {
+	if (phydev->eee_cfg.eee_enabled) {
 		phydev_warn(phydev, "Fast Link Down detection requires EEE to be disabled!\n");
 		return -EBUSY;
 	}
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
