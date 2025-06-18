Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02612ADE992
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jun 2025 13:06:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 912D5C36B30;
	Wed, 18 Jun 2025 11:06:01 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E7F2C36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jun 2025 11:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0FtSwqCoG1msMXua6u5n/l3M96NDt+D8zynwIuxQY18=; b=oYi7t4eUUgqA9X/LKQQQjb0B8Y
 2voagUW4WpphDfgL6QLIe5/vM8kM3E/KeH/aqO5XKh3OnpGgvkeZvqA39qm/HrOxc1z0N/eQ8LK+U
 bLKOvvlVyo1YS5/sCRZuTitH3LfuO6z83S2ThIWAYDQFgGfwrVVs/lhcdHyUowomZZSPs28EuiJYH
 9QIf7fe+ojKLpbYzWh4XO1/k0zLMYVUrP4NIw9eg8tgOs9VItwM9CY+gr/KSmIoDMcWQ/l3px7bkx
 FmziY8svNBEAj0Y7GYBAVsQ6JC/KZqBxBdSUq0dXNtZJIfVX9ToqXpjjalSWu+JLAurYhZInDRls+
 yiTzuh8Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37278 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1uRqc4-0006Km-1c;
 Wed, 18 Jun 2025 12:05:52 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uRqbQ-004djP-1l; Wed, 18 Jun 2025 12:05:12 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uRqbQ-004djP-1l@rmk-PC.armlinux.org.uk>
Date: Wed, 18 Jun 2025 12:05:12 +0100
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: replace ioaddr with
 stmmac_priv for pcs_set_ane() method
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

Pass the stmmac_priv structure into the pcs_set_ane() MAC method rather
than having callers dereferencing this structure for the IO address.

Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org> # sa8775p-ride-r3
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c    | 6 +++---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c       | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/hwif.h              | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c    | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c       | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 2e398574c7a7..d8fd4d8f6ced 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -624,7 +624,7 @@ static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 
 static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
 {
-	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, 0, 0);
+	stmmac_pcs_ctrl_ane(priv, enable, 0, 0);
 }
 
 /* On interface toggle MAC registers gets reset.
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 38875c832bb8..fe776ddf6889 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -393,10 +393,10 @@ static void dwmac1000_set_eee_timer(struct mac_device_info *hw, int ls, int tw)
 	writel(value, ioaddr + LPI_TIMER_CTRL);
 }
 
-static void dwmac1000_ctrl_ane(void __iomem *ioaddr, bool ane, bool srgmi_ral,
-			       bool loopback)
+static void dwmac1000_ctrl_ane(struct stmmac_priv *priv, bool ane,
+			       bool srgmi_ral, bool loopback)
 {
-	dwmac_ctrl_ane(ioaddr, GMAC_PCS_BASE, ane, srgmi_ral, loopback);
+	dwmac_ctrl_ane(priv->ioaddr, GMAC_PCS_BASE, ane, srgmi_ral, loopback);
 }
 
 static void dwmac1000_debug(struct stmmac_priv *priv, void __iomem *ioaddr,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index bc06b24fc611..d85bc0bb5c3c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -583,10 +583,10 @@ static void dwmac4_flow_ctrl(struct mac_device_info *hw, unsigned int duplex,
 	}
 }
 
-static void dwmac4_ctrl_ane(void __iomem *ioaddr, bool ane, bool srgmi_ral,
+static void dwmac4_ctrl_ane(struct stmmac_priv *priv, bool ane, bool srgmi_ral,
 			    bool loopback)
 {
-	dwmac_ctrl_ane(ioaddr, GMAC_PCS_BASE, ane, srgmi_ral, loopback);
+	dwmac_ctrl_ane(priv->ioaddr, GMAC_PCS_BASE, ane, srgmi_ral, loopback);
 }
 
 /* RGMII or SMII interface */
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index e1ac9a245bfe..14dbe0685997 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -374,7 +374,7 @@ struct stmmac_ops {
 		      struct stmmac_extra_stats *x, u32 rx_queues,
 		      u32 tx_queues);
 	/* PCS calls */
-	void (*pcs_ctrl_ane)(void __iomem *ioaddr, bool ane, bool srgmi_ral,
+	void (*pcs_ctrl_ane)(struct stmmac_priv *priv, bool ane, bool srgmi_ral,
 			     bool loopback);
 	/* Safety Features */
 	int (*safety_feat_config)(void __iomem *ioaddr, unsigned int asp,
@@ -464,7 +464,7 @@ struct stmmac_ops {
 #define stmmac_mac_debug(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, debug, __priv, __args)
 #define stmmac_pcs_ctrl_ane(__priv, __args...) \
-	stmmac_do_void_callback(__priv, mac, pcs_ctrl_ane, __args)
+	stmmac_do_void_callback(__priv, mac, pcs_ctrl_ane, __priv, __args)
 #define stmmac_safety_feat_config(__priv, __args...) \
 	stmmac_do_callback(__priv, mac, safety_feat_config, __args)
 #define stmmac_safety_feat_irq_status(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 72f1724af037..77758a7299b4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -380,7 +380,7 @@ stmmac_ethtool_set_link_ksettings(struct net_device *dev,
 			return -EINVAL;
 
 		mutex_lock(&priv->lock);
-		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, priv->hw->ps, 0);
+		stmmac_pcs_ctrl_ane(priv, 1, priv->hw->ps, 0);
 		mutex_unlock(&priv->lock);
 
 		return 0;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c3845ec62fbd..f350a6662880 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3586,7 +3586,7 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 	}
 
 	if (priv->hw->pcs)
-		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, priv->hw->ps, 0);
+		stmmac_pcs_ctrl_ane(priv, 1, priv->hw->ps, 0);
 
 	/* set TX and RX rings length */
 	stmmac_set_rings_length(priv);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
