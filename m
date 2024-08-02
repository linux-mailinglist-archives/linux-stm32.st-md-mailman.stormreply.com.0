Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B714A945C53
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 12:47:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 731D1C78015;
	Fri,  2 Aug 2024 10:47:54 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54950C712A2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 10:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0ROxeCV42WFqA6mDcBR75RvMM2/Y1MHX653bKx9WiT8=; b=elL+3TNSn+9x7T3N9KEHN+P8e/
 YhgHuNgdOu3Y5FuHQbc/pBkLJzhCMIjpl8QOZ2pEYNQR5a/ZNySUAihDz4AM/y9z8I3dRID50/9HU
 Nl5KyJ/vawETVaRTOw3rtdsX91jfsO5QvEoBQ+BhIDGkASe/Zzw+XEhqhx8FA8zm3soiZQeS2ChBB
 ojGc0gWADBtOis69n2lHEcmdhXyCCRXf2xX8ZgGXEyINlBeHRJQiA0eqXyJIlkc1y/uNhUHSpqr0A
 xExNm6P03M2xqSCY9WXIA8ie8eNUrSpinUIsPy8W1T522OISz4w4q0T7wEnSppxyzoMZAWstfzF6I
 w99fDlPg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40364 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1sZpoF-0006ES-28;
 Fri, 02 Aug 2024 11:47:00 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1sZpo6-000eH7-Aa; Fri, 02 Aug 2024 11:46:46 +0100
In-Reply-To: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1sZpo6-000eH7-Aa@rmk-PC.armlinux.org.uk>
Date: Fri, 02 Aug 2024 11:46:46 +0100
Cc: Vinod Koul <vkoul@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next 04/14] net: stmmac: add
 infrastructure for hwifs to provide PCS
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

Allow hwifs to provide a phylink_select_pcs() implementation via struct
stmmac_ops, which can be used to provide a phylink PCS.

Code analysis shows that when STMMAC_FLAG_HAS_INTEGRATED_PCS is set,
then:

	stmmac_common_interrupt()
	stmmac_ethtool_set_link_ksettings()
	stmmac_ethtool_get_link_ksettings()

will all ignore the presence of the PCS. The latter two will pass the
ethtool commands to phylink. The former will avoid manipulating the
netif carrier state behind phylink's back based on the PCS status.

This flag is only set by the ethqos driver. From what I can tell,
amongst the current kernel DT files that use the ethqos driver, only
sa8775p-ride.dts enables ethernet, and this defines a SGMII-mode link
to its PHYs without the "managed" property. Thus, phylink will be
operating in MLO_AN_PHY mode, and inband mode will not be used.

Therefore, it is safe to ignore the STMMAC_FLAG_HAS_INTEGRATED_PCS
flag in stmmac_mac_select_pcs().

Further code analysis shows that XPCS is used by Intel for Cisco
SGMII and 1000base-X modes. In this case, we do not want to provide
the integrated PCS, but the XPCS. The same appears to also be true
of the Lynx PCS.

Therefore, it seems that the integrated PCS provided by the hwif MAC
code should only be used when an external PCS is not being used, so
give priority to the external PCS.

Provide a phylink_pcs instance in struct mac_device_info for hwifs to
use to provide their phylink PCS.

Omit the non-phylink PCS code paths when a hwif provides a
phylink_select_pcs() method (in other words, when they are converted to
use a phylink PCS.) This provides a way to transition parts of the
driver in the subsequent patches.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/common.h  | 15 ++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    | 19 +++++++++++++++++--
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 10 ++++++----
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  7 ++++---
 4 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index cd36ff4da68c..9e8f1659377e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -14,7 +14,7 @@
 #include <linux/etherdevice.h>
 #include <linux/netdevice.h>
 #include <linux/stmmac.h>
-#include <linux/phy.h>
+#include <linux/phylink.h>
 #include <linux/pcs/pcs-xpcs.h>
 #include <linux/module.h>
 #if IS_ENABLED(CONFIG_VLAN_8021Q)
@@ -582,6 +582,18 @@ struct mii_regs {
 	unsigned int clk_csr_mask;
 };
 
+struct stmmac_pcs {
+	struct stmmac_priv *priv;
+	void __iomem *pcs_base;
+	struct phylink_pcs pcs;
+};
+
+static inline struct stmmac_pcs *
+phylink_pcs_to_stmmac_pcs(struct phylink_pcs *pcs)
+{
+	return container_of(pcs, struct stmmac_pcs, pcs);
+}
+
 struct mac_device_info {
 	const struct stmmac_ops *mac;
 	const struct stmmac_desc_ops *desc;
@@ -591,6 +603,7 @@ struct mac_device_info {
 	const struct stmmac_tc_ops *tc;
 	const struct stmmac_mmc_ops *mmc;
 	const struct stmmac_est_ops *est;
+	struct stmmac_pcs mac_pcs;
 	struct dw_xpcs *xpcs;
 	struct phylink_pcs *phylink_pcs;
 	struct mii_regs mii;	/* MII register Addresses */
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 1711d8072cd2..06284aee4088 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -5,6 +5,7 @@
 #ifndef __STMMAC_HWIF_H__
 #define __STMMAC_HWIF_H__
 
+#include <linux/err.h>
 #include <linux/netdevice.h>
 #include <linux/stmmac.h>
 
@@ -17,13 +18,17 @@
 	} \
 	__result; \
 })
-#define stmmac_do_callback(__priv, __module, __cname,  __arg0, __args...) \
+#define stmmac_do_typed_callback(__type, __fail_ret, __priv, __module, \
+				 __cname,  __arg0, __args...) \
 ({ \
-	int __result = -EINVAL; \
+	__type __result = __fail_ret; \
 	if ((__priv)->hw->__module && (__priv)->hw->__module->__cname) \
 		__result = (__priv)->hw->__module->__cname((__arg0), ##__args); \
 	__result; \
 })
+#define stmmac_do_callback(__priv, __module, __cname,  __arg0, __args...) \
+	stmmac_do_typed_callback(int, -EINVAL, __priv, __module, __cname, \
+				 __arg0, ##__args)
 
 struct stmmac_extra_stats;
 struct stmmac_priv;
@@ -310,6 +315,9 @@ struct stmmac_ops {
 	void (*core_init)(struct mac_device_info *hw, struct net_device *dev);
 	/* Update MAC capabilities */
 	void (*update_caps)(struct stmmac_priv *priv);
+	/* Get phylink PCS (for MAC) */
+	struct phylink_pcs *(*phylink_select_pcs)(struct stmmac_priv *priv,
+						  phy_interface_t interface);
 	/* Enable the MAC RX/TX */
 	void (*set_mac)(void __iomem *ioaddr, bool enable);
 	/* Enable and verify that the IPC module is supported */
@@ -430,6 +438,10 @@ struct stmmac_ops {
 	stmmac_do_void_callback(__priv, mac, core_init, __args)
 #define stmmac_mac_update_caps(__priv) \
 	stmmac_do_void_callback(__priv, mac, update_caps, __priv)
+#define stmmac_mac_phylink_select_pcs(__priv, __interface) \
+	stmmac_do_typed_callback(struct phylink_pcs *, ERR_PTR(-EOPNOTSUPP), \
+				 __priv, mac, phylink_select_pcs, __priv,\
+				 __interface)
 #define stmmac_mac_set(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, set_mac, __args)
 #define stmmac_rx_ipc(__priv, __args...) \
@@ -527,6 +539,9 @@ struct stmmac_ops {
 #define stmmac_fpe_irq_status(__priv, __args...) \
 	stmmac_do_callback(__priv, mac, fpe_irq_status, __args)
 
+#define stmmac_has_mac_phylink_select_pcs(__priv) \
+	((__priv)->hw->mac->phylink_select_pcs != NULL)
+
 /* PTP and HW Timer helpers */
 struct stmmac_hwtimestamp {
 	void (*config_hw_tstamping) (void __iomem *ioaddr, u32 data);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index fbf71d0af9bc..3c8ae3753205 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -323,7 +323,8 @@ static int stmmac_ethtool_get_link_ksettings(struct net_device *dev,
 
 	if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
 	    (priv->hw->pcs & STMMAC_PCS_RGMII ||
-	     priv->hw->pcs & STMMAC_PCS_SGMII)) {
+	     priv->hw->pcs & STMMAC_PCS_SGMII) &&
+	    !stmmac_has_mac_phylink_select_pcs(priv)) {
 		u32 supported, advertising, lp_advertising;
 
 		if (!priv->xstats.pcs_link) {
@@ -373,7 +374,8 @@ stmmac_ethtool_set_link_ksettings(struct net_device *dev,
 
 	if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
 	    (priv->hw->pcs & STMMAC_PCS_RGMII ||
-	     priv->hw->pcs & STMMAC_PCS_SGMII)) {
+	     priv->hw->pcs & STMMAC_PCS_SGMII) &&
+	    !stmmac_has_mac_phylink_select_pcs(priv)) {
 		/* Only support ANE */
 		if (cmd->base.autoneg != AUTONEG_ENABLE)
 			return -EINVAL;
@@ -485,7 +487,7 @@ stmmac_get_pauseparam(struct net_device *netdev,
 {
 	struct stmmac_priv *priv = netdev_priv(netdev);
 
-	if (priv->hw->pcs) {
+	if (priv->hw->pcs && !stmmac_has_mac_phylink_select_pcs(priv)) {
 		pause->autoneg = 1;
 	} else {
 		phylink_ethtool_get_pauseparam(priv->phylink, pause);
@@ -498,7 +500,7 @@ stmmac_set_pauseparam(struct net_device *netdev,
 {
 	struct stmmac_priv *priv = netdev_priv(netdev);
 
-	if (priv->hw->pcs) {
+	if (priv->hw->pcs && !stmmac_has_mac_phylink_select_pcs(priv)) {
 		pause->autoneg = 1;
 		return 0;
 	} else {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 12689774d755..a08dccad0ff2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -957,7 +957,7 @@ static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
 			return pcs;
 	}
 
-	return NULL;
+	return stmmac_mac_phylink_select_pcs(priv, interface);
 }
 
 static void stmmac_mac_config(struct phylink_config *config, unsigned int mode,
@@ -3486,7 +3486,7 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 		}
 	}
 
-	if (priv->hw->pcs)
+	if (priv->hw->pcs && !stmmac_has_mac_phylink_select_pcs(priv))
 		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, priv->hw->ps, 0);
 
 	/* set TX and RX rings length */
@@ -6064,7 +6064,8 @@ static void stmmac_common_interrupt(struct stmmac_priv *priv)
 
 		/* PCS link status */
 		if (priv->hw->pcs &&
-		    !(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS)) {
+		    !(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
+		    !stmmac_has_mac_phylink_select_pcs(priv)) {
 			if (priv->xstats.pcs_link)
 				netif_carrier_on(priv->dev);
 			else
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
