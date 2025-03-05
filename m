Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46654A507D6
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Mar 2025 19:01:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A7FDC78F68;
	Wed,  5 Mar 2025 18:01:08 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECF35C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Mar 2025 18:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9pjvvYJp8ichoRJUtSiiKLOuz012/ax4BEbPrpv6NLs=; b=uKBqHpeTGcB85XoF3h9x+TY4pg
 5N5vTCybXOOkh6oIh/h9iNz9c9mTmL68EoXao2m/KC6fY2lka0DWgHetPF/yFTm6nFuwHNAufQYAe
 gR1N4h1TN8KAc/b8rUZNW9TtF8CpChPZINuZTZHIp+zUdgOgM6RJ56ag5JQ3S72UvgSPQsb+fMGLI
 h6vVrJEUiw2NQNIQLlyYXZSbmmxel8smKyeyXypnYuIUWbbfe04OxU9tQ/4VptoMzS5zc41Jy5CAs
 JUwWQtU0CsGAzOisg7tCnYRzoIqbXWAQMTeU8LJmSbGytdUWjIbIY/9XyHX56N7M0og4fROtVljHv
 vV8yo89A==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45972 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tpt3D-0004gu-2T;
 Wed, 05 Mar 2025 18:00:59 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tpt2t-005UNB-MC; Wed, 05 Mar 2025 18:00:39 +0000
In-Reply-To: <Z8iRM8Q9Sb-y3fR_@shell.armlinux.org.uk>
References: <Z8iRM8Q9Sb-y3fR_@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tpt2t-005UNB-MC@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Mar 2025 18:00:39 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next 1/2] net: phylink: add functions to
 block/unblock rx clock stop
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

Some MACs require the PHY receive clock to be running to complete setup
actions. This may fail if the PHY has negotiated EEE, the MAC supports
receive clock stop, and the link has entered LPI state. Provide a pair
of APIs that MAC drivers can use to temporarily block the PHY disabling
the receive clock.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 50 +++++++++++++++++++++++++++++++++++++++
 include/linux/phylink.h   |  3 +++
 2 files changed, 53 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a3b186ab3854..8f93b597d019 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -88,6 +88,7 @@ struct phylink {
 	bool mac_enable_tx_lpi;
 	bool mac_tx_clk_stop;
 	u32 mac_tx_lpi_timer;
+	u8 mac_rx_clk_stop_blocked;
 
 	struct sfp_bus *sfp_bus;
 	bool sfp_may_have_phy;
@@ -2592,6 +2593,55 @@ void phylink_stop(struct phylink *pl)
 }
 EXPORT_SYMBOL_GPL(phylink_stop);
 
+
+void phylink_rx_clk_stop_block(struct phylink *pl)
+{
+	ASSERT_RTNL();
+
+	if (pl->mac_rx_clk_stop_blocked == U8_MAX) {
+		phylink_warn(pl, "%s called too many times - ignoring\n",
+			     __func__);
+		dump_stack();
+		return;
+	}
+
+	/* Disable PHY receive clock stop if this is the first time this
+	 * function has been called and clock-stop was previously enabled.
+	 */
+	if (pl->mac_rx_clk_stop_blocked++ == 0 &&
+	    pl->mac_supports_eee_ops && pl->phydev)
+	    pl->config->eee_rx_clk_stop_enable)
+		phy_eee_rx_clock_stop(pl->phydev, false);
+}
+
+/**
+ * phylink_rx_clk_stop_unblock() - unblock PHY ability to stop receive clock
+ * @pl: a pointer to a &struct phylink returned from phylink_create()
+ *
+ * All calls to phylink_rx_clk_stop_block() must be balanced with a
+ * corresponding call to phylink_rx_clk_stop_unblock() to restore the PHYs
+ * clock stop ability.
+ */
+void phylink_rx_clk_stop_unblock(struct phylink *pl)
+{
+	ASSERT_RTNL();
+
+	if (pl->mac_rx_clk_stop_blocked == 0) {
+		phylink_warn(pl, "%s called too many times - ignoring\n",
+			     __func__);
+		dump_stack();
+		return;
+	}
+
+	/* Re-enable PHY receive clock stop if the number of unblocks matches
+	 * the number of calls to the block function above.
+	 */
+	if (--pl->mac_rx_clk_stop_blocked == 0 &&
+	    pl->mac_supports_eee_ops && pl->phydev &&
+	    pl->config->eee_rx_clk_stop_enable)
+		phy_eee_rx_clock_stop(pl->phydev, true);
+}
+
 /**
  * phylink_suspend() - handle a network device suspend event
  * @pl: a pointer to a &struct phylink returned from phylink_create()
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 08df65f6867a..249c437d6b7b 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -698,6 +698,9 @@ int phylink_pcs_pre_init(struct phylink *pl, struct phylink_pcs *pcs);
 void phylink_start(struct phylink *);
 void phylink_stop(struct phylink *);
 
+void phylink_rx_clk_stop_block(struct phylink *);
+void phylink_rx_clk_stop_unblock(struct phylink *);
+
 void phylink_suspend(struct phylink *pl, bool mac_wol);
 void phylink_resume(struct phylink *pl);
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
