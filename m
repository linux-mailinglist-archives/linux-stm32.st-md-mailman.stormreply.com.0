Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D31C2A6B066
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Mar 2025 23:11:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98CA9C78F64;
	Thu, 20 Mar 2025 22:11:32 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DDCCC78F60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 22:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fkKG+1uig/gv8dqFUSDCg+KHZ2PnbqdRy0w1E0ZwBhU=; b=wbVA+7oy5foIOmkAEoQU0k7PzL
 zKqNHoIrLmQkBIGbnASdMm1JUjTr9ZFRq1KOcvZeOoaNjHRNJ4z9yZwp0Uhaqu0cSbxI64OQFWwt2
 Zl0SjXkb6YRsinD3AQsEk+pvvNBXfxtaNGjsPYLC9WnHg/UjcPm1wcNcU/UMCYKEclLEgW/uHiDxa
 jVoVI5o1p9uK7g766JAf5+uIKfCWIaxQ6bRYZsaEKr39BjUUhk0ybUpecPSsdskVaCzzj5EeiuBVI
 f0AqWace3lwN/F3RFIA4TIDkhhjWwWsd0O9hmKk5h4Os5mrM+4jxsKF05yKEgYoTG/HeroMu5y5/p
 5nxMpz9w==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56714 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tvO6p-0008Db-2p;
 Thu, 20 Mar 2025 22:11:27 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tvO6V-008Vjb-AP; Thu, 20 Mar 2025 22:11:07 +0000
In-Reply-To: <Z9ySeo61VYTClIJJ@shell.armlinux.org.uk>
References: <Z9ySeo61VYTClIJJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tvO6V-008Vjb-AP@rmk-PC.armlinux.org.uk>
Date: Thu, 20 Mar 2025 22:11:07 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/5] net: phylink: add
	phylink_prepare_resume()
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

When the system is suspended, the PHY may be placed in low-power mode
by setting the BMCR 0.11 Power down bit. IEEE 802.3 states that the
behaviour of the PHY in this state is implementation specific, and
the PHY is not required to meet the RX_CLK and TX_CLK requirements.
Essentially, this means that a PHY may stop the clocks that it is
generating while in power down state.

However, MACs exist which require the clocks from the PHY to be running
in order to properly resume. phylink_prepare_resume() provides them
with a way to clear the Power down bit early.

Note, however, that IEEE 802.3 gives PHYs up to 500ms grace before the
transmit and receive clocks meet the requirements after clearing the
power down bit.

Add a resume preparation function, which will ensure that the receive
clock from the PHY is appropriately configured while resuming.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 25 +++++++++++++++++++++++++
 include/linux/phylink.h   |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 0f70a7f3dfcc..1b76ddc286fe 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2481,6 +2481,31 @@ void phylink_suspend(struct phylink *pl, bool mac_wol)
 }
 EXPORT_SYMBOL_GPL(phylink_suspend);
 
+/**
+ * phylink_prepare_resume() - prepare to resume a network device
+ * @pl: a pointer to a &struct phylink returned from phylink_create()
+ *
+ * Optional, but if called must be called prior to phylink_resume().
+ *
+ * Prepare to resume a network device, preparing the PHY as necessary.
+ */
+void phylink_prepare_resume(struct phylink *pl)
+{
+	struct phy_device *phydev = pl->phydev;
+
+	ASSERT_RTNL();
+
+	/* IEEE 802.3 22.2.4.1.5 allows PHYs to stop their receive clock
+	 * when PDOWN is set. However, some MACs require RXC to be running
+	 * in order to resume. If the MAC requires RXC, and we have a PHY,
+	 * then resume the PHY. Note that 802.3 allows PHYs 500ms before
+	 * the clock meets requirements. We do not implement this delay.
+	 */
+	if (pl->config->mac_requires_rxc && phydev && phydev->suspended)
+		phy_resume(phydev);
+}
+EXPORT_SYMBOL_GPL(phylink_prepare_resume);
+
 /**
  * phylink_resume() - handle a network device resume event
  * @pl: a pointer to a &struct phylink returned from phylink_create()
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 79876c84ae81..06f1b649f173 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -707,6 +707,7 @@ void phylink_start(struct phylink *);
 void phylink_stop(struct phylink *);
 
 void phylink_suspend(struct phylink *pl, bool mac_wol);
+void phylink_prepare_resume(struct phylink *pl);
 void phylink_resume(struct phylink *pl);
 
 void phylink_ethtool_get_wol(struct phylink *, struct ethtool_wolinfo *);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
