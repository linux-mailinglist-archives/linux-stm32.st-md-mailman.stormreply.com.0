Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC99FA04628
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 17:28:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2C2CC78022;
	Tue,  7 Jan 2025 16:28:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14BF3C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 16:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CT43NNJbVwdfAfypfZGQdJlroOFKN88S2LgKWnUbjeQ=; b=e6EJzdYz+0XEXOiTNoCBaEjosb
 jL7sqlVEZwnuiz200R35bre/yBGiRv/seyh2Jgdy/Xv/Poh6E3rqnyVobE/FfkGesEJ15kzJL/A0u
 7U1mO7IjwcSIPeJpktqShxEht9AMXHY3Nqx7t3R5e8+C85mEMMMaP0pSzizzJ7b52U4DV8oD1rt29
 wwkbiNKjGMVcVqrkrA+FIlml/501+bQYo3yeyWEpTuKnU0fEN30NUt5EZpUL7Y4lhNEE/3COV365Z
 LGCQnewx29KAO18+hPc6AkTwrN6DdhaKdhD/k6M/Bj5k7u64eMikVMPSKkO9krXvTGvCTtL4UQNRm
 tW14n48g==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53834 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tVCRX-0007kp-0W;
 Tue, 07 Jan 2025 16:28:35 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tVCRU-007Y2z-5b; Tue, 07 Jan 2025 16:28:32 +0000
In-Reply-To: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
References: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tVCRU-007Y2z-5b@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Jan 2025 16:28:32 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 01/18] net: phy: add configuration
 of rx clock stop mode
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

Add a function to allow configuration of the PCS's clock stop enable
bit, used to configure whether the xMII receive clock can be stopped
during LPI mode.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phy.c | 27 ++++++++++++++++++++++-----
 include/linux/phy.h   |  1 +
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index e4b04cdaa995..a4b9fcc2503a 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -1640,6 +1640,27 @@ void phy_mac_interrupt(struct phy_device *phydev)
 }
 EXPORT_SYMBOL(phy_mac_interrupt);
 
+/**
+ * phy_eee_rx_clock_stop() - configure PHY receive clock in LPI
+ * @phydev: target phy_device struct
+ * @clk_stop_enable: flag to indicate whether the clock can be stopped
+ *
+ * Configure whether the PHY can disable its receive clock during LPI mode,
+ * See IEEE 802.3 sections 22.2.2.2, 35.2.2.10, and 45.2.3.1.4.
+ *
+ * Returns: 0 or negative error.
+ */
+int phy_eee_rx_clock_stop(struct phy_device *phydev, bool clk_stop_enable)
+{
+	/* Configure the PHY to stop receiving xMII
+	 * clock while it is signaling LPI.
+	 */
+	return phy_modify_mmd(phydev, MDIO_MMD_PCS, MDIO_CTRL1,
+			      MDIO_PCS_CTRL1_CLKSTOP_EN,
+			      clk_stop_enable ? MDIO_PCS_CTRL1_CLKSTOP_EN : 0);
+}
+EXPORT_SYMBOL_GPL(phy_eee_rx_clock_stop);
+
 /**
  * phy_init_eee - init and check the EEE feature
  * @phydev: target phy_device struct
@@ -1664,11 +1685,7 @@ int phy_init_eee(struct phy_device *phydev, bool clk_stop_enable)
 		return -EPROTONOSUPPORT;
 
 	if (clk_stop_enable)
-		/* Configure the PHY to stop receiving xMII
-		 * clock while it is signaling LPI.
-		 */
-		ret = phy_set_bits_mmd(phydev, MDIO_MMD_PCS, MDIO_CTRL1,
-				       MDIO_PCS_CTRL1_CLKSTOP_EN);
+		ret = phy_eee_rx_clock_stop(phydev, true);
 
 	return ret < 0 ? ret : 0;
 }
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 5bc71d59910c..4875465653ca 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2096,6 +2096,7 @@ int phy_unregister_fixup(const char *bus_id, u32 phy_uid, u32 phy_uid_mask);
 int phy_unregister_fixup_for_id(const char *bus_id);
 int phy_unregister_fixup_for_uid(u32 phy_uid, u32 phy_uid_mask);
 
+int phy_eee_rx_clock_stop(struct phy_device *phydev, bool clk_stop_enable);
 int phy_init_eee(struct phy_device *phydev, bool clk_stop_enable);
 int phy_get_eee_err(struct phy_device *phydev);
 int phy_ethtool_set_eee(struct phy_device *phydev, struct ethtool_keee *data);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
