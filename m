Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C74BBA6C53
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Sep 2025 10:59:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7AB7C32EA8;
	Sun, 28 Sep 2025 08:59:07 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDCB3C36B1E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Sep 2025 08:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gu5CfNLtZRXzS+mClkrGSXL7Px/goHLl4BLV18Mh0Lw=; b=VzPMhNExNUWP+FCng16dWadnLb
 rCCms0cjwIpnVk0fA2RHBml+ZbMaUREyrvU/mXsA7thyGkWIhYw2/YcWsWUxoJJAftljeAtEeN1Fq
 zcC/IUiubpcp3Flrm6jBrv9Qws+eO61JuzavWg6CVRHExbQsSDEQcF+y4WH09JWixdbZ5pBTqlH1F
 Ft2pjM22N1aXSic6KUSVI035S5goKprqqhEJtwjdMXxPCgwOBMaJWpin46Dny7lJa+0cRDCKgOJqC
 wMiwffI1ueh5dMsHcdJ2py/S0Av1ZTL32I/XLJCcJe9/2ljuwdZKr06bmb4nlkwDjA2vzmefFsh8M
 O4PUJV6w==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53250 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1v2nF8-000000005Ab-426O;
 Sun, 28 Sep 2025 09:58:55 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1v2nF8-00000007jXJ-0BUZ; Sun, 28 Sep 2025 09:58:54 +0100
In-Reply-To: <aNj4HY_mk4JDsD_D@shell.armlinux.org.uk>
References: <aNj4HY_mk4JDsD_D@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1v2nF8-00000007jXJ-0BUZ@rmk-PC.armlinux.org.uk>
Date: Sun, 28 Sep 2025 09:58:54 +0100
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
Subject: [Linux-stm32] [PATCH RFC net-next 1/6] net: phy: add
	phy_can_wakeup()
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

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
