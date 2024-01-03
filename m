Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F34F2822F6E
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jan 2024 15:28:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7022C6B476;
	Wed,  3 Jan 2024 14:28:21 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB2ABC6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jan 2024 14:28:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A287E6000E;
 Wed,  3 Jan 2024 14:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1704292100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sIzE85qqMU4ljpuVTgJrBzU9sL9vWxRn1Kuat+K5IJY=;
 b=BhhDi2i820PKEIjVb8tsSUzcTWykZmsBGYRCPClziJp83Ljiftdi+GLvHHUsM81zoCPfvj
 j0jvoSHlZLHTY2rpAaQNLHxC2AwRTzO83Idszu9hHutueS3jT9xXXM6njHBCqcQulKF5pG
 PZUSjxuKU/17lG/oq/NfhBUmaz9N8tPwqY2DCgGZoJxJai23f5JGCsQ2MUNXlh2Dq0/SQq
 0B8htGid8qvasKIwKbxUSHe8HTk4Cz+ZNcy0zYH24MzYobIyrmH8aMOIvg7NpAagQ6J96T
 dAPU9x6DOmeAdyVCgGs2VUmUXrHnukTSjEqX1B6kx6Wy2XxYsz06HPYb8RJBmA==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Date: Wed,  3 Jan 2024 15:28:21 +0100
Message-ID: <20240103142827.168321-2-romain.gantois@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103142827.168321-1-romain.gantois@bootlin.com>
References: <20240103142827.168321-1-romain.gantois@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Marek Vasut <marex@denx.de>, Pascal EBERHARD <pascal.eberhard@se.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/5] net: phy: add PHY_F_RXC_ALWAYS_ON to
	PHY dev flags
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

From: Russell King <linux@armlinux.org.uk>

Some MAC controllers (e.g. stmmac) require their connected PHY to
continuously provide a receive clock signal. This can cause issues in two
cases:

  1. The clock signal hasn't been started yet by the time the MAC driver
     initializes its hardware. This can make the initialization fail, as in
      the case of the rzn1 GMAC1 driver.
  2. The clock signal is cut during a power saving event. By the time the
     MAC is brought back up, the clock signal is still not active since
     phylink_start hasn't been called yet. This brings us back to case 1.

If a PHY driver reads this flag, it should ensure that the receive clock
signal is started as soon as possible, and that it isn't brought down when
the PHY goes into suspend.

Signed-off-by: Russell King <linux@armlinux.org.uk>
[rgantois: commit log]
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/net/phy/phylink.c | 10 +++++++++-
 include/linux/phy.h       |  1 +
 include/linux/phylink.h   |  4 ++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 25c19496a336..f26b13d916d4 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1837,6 +1837,8 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
 			      phy_interface_t interface)
 {
+	u32 flags = 0;
+
 	if (WARN_ON(pl->cfg_link_an_mode == MLO_AN_FIXED ||
 		    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
 		     phy_interface_mode_is_8023z(interface) && !pl->sfp_bus)))
@@ -1845,7 +1847,10 @@ static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
 	if (pl->phydev)
 		return -EBUSY;
 
-	return phy_attach_direct(pl->netdev, phy, 0, interface);
+	if (pl->config->mac_requires_rxc)
+		flags |= PHY_F_RXC_ALWAYS_ON;
+
+	return phy_attach_direct(pl->netdev, phy, flags, interface);
 }
 
 /**
@@ -1948,6 +1953,9 @@ int phylink_fwnode_phy_connect(struct phylink *pl,
 		pl->link_config.interface = pl->link_interface;
 	}
 
+	if (pl->config->mac_requires_rxc)
+		flags |= PHY_F_RXC_ALWAYS_ON;
+
 	ret = phy_attach_direct(pl->netdev, phy_dev, flags,
 				pl->link_interface);
 	phy_device_free(phy_dev);
diff --git a/include/linux/phy.h b/include/linux/phy.h
index bd285950972c..c6cb53412273 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -764,6 +764,7 @@ struct phy_device {
 
 /* Generic phy_device::dev_flags */
 #define PHY_F_NO_IRQ		0x80000000
+#define PHY_F_RXC_ALWAYS_ON	BIT(30)
 
 static inline struct phy_device *to_phy_device(const struct device *dev)
 {
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 875439ab45de..8430ac7ead11 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -204,6 +204,9 @@ enum phylink_op_type {
  * @poll_fixed_state: if true, starts link_poll,
  *		      if MAC link is at %MLO_AN_FIXED mode.
  * @mac_managed_pm: if true, indicate the MAC driver is responsible for PHY PM.
+ * @mac_requires_rxc: if true, the MAC always requires a receive clock from PHY.
+ *                    The PHY driver should start the clock signal as soon as
+ *                    possible and avoid stopping it during suspend events.
  * @ovr_an_inband: if true, override PCS to MLO_AN_INBAND
  * @get_fixed_state: callback to execute to determine the fixed link state,
  *		     if MAC link is at %MLO_AN_FIXED mode.
@@ -216,6 +219,7 @@ struct phylink_config {
 	enum phylink_op_type type;
 	bool poll_fixed_state;
 	bool mac_managed_pm;
+	bool mac_requires_rxc;
 	bool ovr_an_inband;
 	void (*get_fixed_state)(struct phylink_config *config,
 				struct phylink_link_state *state);
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
