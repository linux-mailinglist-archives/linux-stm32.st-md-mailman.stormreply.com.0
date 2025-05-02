Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19176AA73DA
	for <lists+linux-stm32@lfdr.de>; Fri,  2 May 2025 15:36:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD954C78F83;
	Fri,  2 May 2025 13:36:25 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91D3FC7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 May 2025 13:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O9ohtHnmOIl7u93HcZyBYwH6Cqu/+kupWqZ4QCzt0ZI=; b=PvKh08TvSkmZOeHKvC5o+PCP2t
 vvyWSy67sqf3Ohw1yKQ//2g4/OC1xbqRyKYZMAFlv2OUcAmcKy1S3N6ezWl75mnQL1v6caf5ahTlC
 KoUaB9s3m+IMrnaXVoIwPh9Ieo/eW8yz8465JxXwVjxapXHrxRKEqeoRdAHyRPLhMdpRHn6hSEvi/
 Ey1O655njlSi9Py68eklClN1zqEGeyuESk3EXkUvTIRygNUIveeHjDywiB4qSvjXnMlwI+UzwEj+a
 N5mfR7mGVUWVYCahPku4mf3jD9GVCdwcOhOZ7So09bSX6VXqqdV1yWddqUX5RHJ+0KvX1hR5R4HiN
 9KS79M6w==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44032 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1uAqYk-0001OV-02;
 Fri, 02 May 2025 14:36:10 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uAqY7-002D3e-R3; Fri, 02 May 2025 14:35:31 +0100
In-Reply-To: <aBTKOBKnhoz3rrlQ@shell.armlinux.org.uk>
References: <aBTKOBKnhoz3rrlQ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uAqY7-002D3e-R3@rmk-PC.armlinux.org.uk>
Date: Fri, 02 May 2025 14:35:31 +0100
Cc: Thierry Reding <treding@nvidia.com>, Paolo Abeni <pabeni@redhat.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 1/4] net: phylink: add ability to
	block carrier up
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

Network drivers such as stmmac need to quiesce the network device prior
to changing the DMA configuration. Currently, they do this by calling
netif_carrier_off() to stop the network stack pushing packets, but this
is incompatible with phylink.

Provide a pair of functions to allow the software link state to be
blocked and brought down if necessary, and restored afterwards.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 50 +++++++++++++++++++++++++++++++++++++++
 include/linux/phylink.h   |  3 +++
 2 files changed, 53 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 0faa3d97e06b..d522e12f89e8 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -26,6 +26,7 @@
 
 enum {
 	PHYLINK_DISABLE_STOPPED,
+	PHYLINK_DISABLE_CARRIER,
 	PHYLINK_DISABLE_LINK,
 	PHYLINK_DISABLE_MAC_WOL,
 
@@ -83,6 +84,7 @@ struct phylink {
 	bool mac_tx_clk_stop;
 	u32 mac_tx_lpi_timer;
 	u8 mac_rx_clk_stop_blocked;
+	u8 mac_carrier_blocked;
 
 	struct sfp_bus *sfp_bus;
 	bool sfp_may_have_phy;
@@ -2456,6 +2458,54 @@ void phylink_stop(struct phylink *pl)
 }
 EXPORT_SYMBOL_GPL(phylink_stop);
 
+/**
+ * phylink_carrier_block() - unblock carrier state
+ * @pl: a pointer to a &struct phylink returned from phylink_create()
+ *
+ * Disable the software link, which will call mac_link_down(). This is to
+ * allow network drivers to safely adjust e.g. DMA settings with the
+ * device idle. All calls to phylink_carrier_block() must be balanced by
+ * the appropriate number of calls to phylink_carrier_unblock().
+ */
+void phylink_carrier_block(struct phylink *pl)
+{
+	ASSERT_RTNL();
+
+	if (pl->mac_carrier_blocked == U8_MAX) {
+		phylink_warn(pl, "%s called too many times - ignoring\n",
+			     __func__);
+		dump_stack();
+		return;
+	}
+
+	if (pl->mac_carrier_blocked++ == 0)
+		phylink_run_resolve_and_disable(pl, PHYLINK_DISABLE_CARRIER);
+}
+EXPORT_SYMBOL_GPL(phylink_carrier_block);
+
+/**
+ * phylink_carrier_unblock() - unblock carrier state
+ * @pl: a pointer to a &struct phylink returned from phylink_create()
+ *
+ * All calls to phylink_carrier_block() must be balanced with a corresponding
+ * call to phylink_carrier_unblock() to restore the carrier state.
+ */
+void phylink_carrier_unblock(struct phylink *pl)
+{
+	ASSERT_RTNL();
+
+	if (pl->mac_carrier_blocked == 0) {
+		phylink_warn(pl, "%s called too many times - ignoring\n",
+			     __func__);
+		dump_stack();
+		return;
+	}
+
+	if (--pl->mac_carrier_blocked == 0)
+		phylink_enable_and_run_resolve(pl, PHYLINK_DISABLE_CARRIER);
+}
+EXPORT_SYMBOL_GPL(phylink_carrier_unblock);
+
 /**
  * phylink_rx_clk_stop_block() - block PHY ability to stop receive clock in LPI
  * @pl: a pointer to a &struct phylink returned from phylink_create()
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 30659b615fca..a48032561183 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -715,6 +715,9 @@ int phylink_pcs_pre_init(struct phylink *pl, struct phylink_pcs *pcs);
 void phylink_start(struct phylink *);
 void phylink_stop(struct phylink *);
 
+void phylink_carrier_block(struct phylink *);
+void phylink_carrier_unblock(struct phylink *);
+
 void phylink_rx_clk_stop_block(struct phylink *);
 void phylink_rx_clk_stop_unblock(struct phylink *);
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
