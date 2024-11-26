Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C959D9790
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 13:53:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E266EC78021;
	Tue, 26 Nov 2024 12:53:03 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C437DC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 12:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j/WHhBv4xxgr6XWS8+/JmuNDDhZZJPZcPHo5FRq2Fs4=; b=lZLC1NwUbkqrR8bgsgVE5vp7I/
 NAaHMrqMiAwDBnW/NxnO4o5QAw7BX8eMrRjJdtrlsWF/CMsRlqKcuOe4d5ONdci5t7OtXgAgapVGL
 LqnydNucmVhx/5HQqIhiS06tBbkxj0p7YknOvpUE/nHESEFDFAe/GbzMuKS/z2WfDjkKJ5oA7X54k
 GWeK1R7uN3L5lFRnLrFw6EOtStGvtx9LUJp6gw7y6e2BwPriS0ELL1a3jp0G2QfZyO4anw3AqiidI
 6IHhrKM8cU+dR6fPtCjOH4u6vMXms8fvl3yjkAXk7Xj9vAhcoWW3gBDQcM9+8o/IN7HGbrvTrKC3z
 EZguWCZQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58812 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tFv3l-0006tc-1C;
 Tue, 26 Nov 2024 12:52:53 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tFv3j-005yi3-W2; Tue, 26 Nov 2024 12:52:52 +0000
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tFv3j-005yi3-W2@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 12:52:51 +0000
Cc: UNGLinuxDriver@microchip.com, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 08/23] net: phy: add support for
 querying PHY clock stop capability
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

Add support for querying whether the PHY allows the transmit xMII clock
to be stopped while in LPI mode. This will be used by phylink to pass
to the MAC driver so it can configure the generation of the xMII clock
appropriately.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phy.c | 20 ++++++++++++++++++++
 include/linux/phy.h   |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index 8caef54a60e0..21e0fc9a6f09 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -1587,6 +1587,26 @@ void phy_mac_interrupt(struct phy_device *phydev)
 }
 EXPORT_SYMBOL(phy_mac_interrupt);
 
+/**
+ * phy_eee_tx_clock_stop_capable() - indicate whether the MAC can stop tx clock
+ * @phydev: target phy_device struct
+ *
+ * Indicate whether the MAC can disable the transmit xMII clock while in LPI
+ * state. Returns 1 if the MAC may stop the transmit clock, 0 if the MAC must
+ * not stop the transmit clock, or negative error.
+ */
+int phy_eee_tx_clock_stop_capable(struct phy_device *phydev)
+{
+	int stat1;
+
+	stat1 = phy_read_mmd(phydev, MDIO_MMD_PCS, MDIO_STAT1);
+	if (stat1 < 0)
+		return stat1;
+
+	return !!(stat1 & MDIO_PCS_STAT1_CLKSTOP_CAP);
+}
+EXPORT_SYMBOL_GPL(phy_eee_tx_clock_stop_capable);
+
 /**
  * phy_init_eee - init and check the EEE feature
  * @phydev: target phy_device struct
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 09a47116994c..d0491cdf54b6 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2038,6 +2038,7 @@ int phy_unregister_fixup(const char *bus_id, u32 phy_uid, u32 phy_uid_mask);
 int phy_unregister_fixup_for_id(const char *bus_id);
 int phy_unregister_fixup_for_uid(u32 phy_uid, u32 phy_uid_mask);
 
+int phy_eee_tx_clock_stop_capable(struct phy_device *phydev);
 int phy_init_eee(struct phy_device *phydev, bool clk_stop_enable);
 int phy_get_eee_err(struct phy_device *phydev);
 int phy_ethtool_set_eee(struct phy_device *phydev, struct ethtool_keee *data);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
