Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOJvFTpFc2lEuQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 10:54:02 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 342A473AC3
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 10:54:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB5F9C8F264;
	Fri, 23 Jan 2026 09:54:01 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2446AC87EDF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 09:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8wtNVZzkQKBpNdy+ZIM960F0Fcb5mQSZrplDWFeprS0=; b=QGbeOnZ+4V77zxKcd0SjwY4Idz
 cHMhs49tBgJR+nJ+Qib1Hr/N1/ZkPaRKasw21jtuiIp0ZF49p267VsYNSoxZ8rsGa7m5wNtjHHu/J
 9xjkwxA4/HvSeVNtg1dAFmJyFkHCUcRQPVlcyAUphIyody1JV/TzgBPWH/SUN0WnEMIxGJvMlqftf
 iIQkkxKFw/whfgzjtg+3qnnTXQqODB+ehCQYos8c5qkvcdky+eAD3bVkJHceUe8p/96ORInLVBMUI
 5yrnUzrLFO1cuIPXEfenlQtpTKdDikXQAxCPn3mDWxgvF4dC3gIYa0MhEeq8gEDhZyhDhvCBYQuI0
 RCdXap+g==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37526 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vjDrP-000000001bN-1U6w;
 Fri, 23 Jan 2026 09:53:48 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vjDrM-00000005fQR-0rmB; Fri, 23 Jan 2026 09:53:44 +0000
In-Reply-To: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vjDrM-00000005fQR-0rmB@rmk-PC.armlinux.org.uk>
Date: Fri, 23 Jan 2026 09:53:44 +0000
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 05/14] net: stmmac: add stmmac
	core serdes support
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[kernel];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:neil.armstrong@linaro.org,m:mohd.anwar@oss.qualcomm.com,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,kernel.org,vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,redhat.com,gmail.com,lists.infradead.org,davemloft.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	NEURAL_SPAM(0.00)[0.871];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,stormreply.com:url,stormreply.com:email,bootlin.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 342A473AC3
X-Rspamd-Action: no action

Rather than having platform glue implement SerDes PHY support, add it
to the core driver, specifically to the stmmac integrated PCS driver
as the SerDes is connected to the integrated PCS.

Platforms using external PCS can also populate plat->serdes, and the
core driver will call phy_init() and phy_exit() when the administrative
state of the interface changes, but the other phy methods will not be
called.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
--
rfc->v1: avoid calling phy_get_mode() with NULL serdes PHY
v2: add cleanup when dwmac_serdes_set_mode() fails, because AI allegedly
  knows better than the author and phylink maintainer, even though this
  will result in dwmac_serdes_power_off() being called multiple times
  and producing a kernel warning. But if it makes AI happy, then it must
  be a good thing. It'll also make Vladimir happy.
---
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  14 ++-
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  |  40 ++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  |   1 +
 .../ethernet/stmicro/stmmac/stmmac_serdes.c   | 111 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_serdes.h   |  16 +++
 include/linux/stmmac.h                        |   2 +
 7 files changed, 182 insertions(+), 4 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.h

diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index c9263987ef8d..a3c2cd5d0c91 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -7,7 +7,7 @@ stmmac-objs:= stmmac_main.o stmmac_ethtool.o stmmac_mdio.o ring_mode.o	\
 	      dwmac4_dma.o dwmac4_lib.o dwmac4_core.o dwmac5.o hwif.o \
 	      stmmac_tc.o dwxgmac2_core.o dwxgmac2_dma.o dwxgmac2_descs.o \
 	      stmmac_xdp.o stmmac_est.o stmmac_fpe.o stmmac_vlan.o \
-	      stmmac_pcs.o $(stmmac-y)
+	      stmmac_pcs.o stmmac_serdes.o $(stmmac-y)
 
 stmmac-$(CONFIG_STMMAC_SELFTESTS) += stmmac_selftests.o
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 24a2555ca329..6c515f9efbe7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -48,6 +48,7 @@
 #include "stmmac_fpe.h"
 #include "stmmac.h"
 #include "stmmac_pcs.h"
+#include "stmmac_serdes.h"
 #include "stmmac_xdp.h"
 #include <linux/reset.h>
 #include <linux/of_mdio.h>
@@ -3549,12 +3550,16 @@ static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
 
 static void stmmac_clk_rx_i_require(struct stmmac_priv *priv)
 {
+	dwmac_serdes_power_on(priv);
+	/* Only sets the SerDes mode if it wasn't already configured. */
+	dwmac_serdes_init_mode(priv, priv->plat->phy_interface);
 	phylink_rx_clk_stop_block(priv->phylink);
 }
 
 static void stmmac_clk_rx_i_release(struct stmmac_priv *priv)
 {
 	phylink_rx_clk_stop_unblock(priv->phylink);
+	dwmac_serdes_power_off(priv);
 }
 
 /**
@@ -4152,10 +4157,14 @@ static int stmmac_open(struct net_device *dev)
 	if (ret)
 		goto err_runtime_pm;
 
-	ret = __stmmac_open(dev, dma_conf);
+	ret = dwmac_serdes_init(priv);
 	if (ret)
 		goto err_disconnect_phy;
 
+	ret = __stmmac_open(dev, dma_conf);
+	if (ret)
+		goto err_serdes;
+
 	kfree(dma_conf);
 
 	/* We may have called phylink_speed_down before */
@@ -4163,6 +4172,8 @@ static int stmmac_open(struct net_device *dev)
 
 	return ret;
 
+err_serdes:
+	dwmac_serdes_exit(priv);
 err_disconnect_phy:
 	phylink_disconnect_phy(priv->phylink);
 err_runtime_pm:
@@ -4226,6 +4237,7 @@ static int stmmac_release(struct net_device *dev)
 
 	__stmmac_release(dev);
 
+	dwmac_serdes_exit(priv);
 	phylink_disconnect_phy(priv->phylink);
 	pm_runtime_put(priv->device);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 2f826fe7229b..10a2eb903d2a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -1,12 +1,27 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include "stmmac.h"
 #include "stmmac_pcs.h"
+#include "stmmac_serdes.h"
 
 static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	struct stmmac_priv *priv = spcs->priv;
+	int ret;
+
+	ret = dwmac_serdes_power_on(priv);
+	if (ret)
+		return ret;
+
+	if (spcs->interface != PHY_INTERFACE_MODE_NA) {
+		ret = dwmac_serdes_set_mode(priv, spcs->interface);
+		if (ret) {
+			dwmac_serdes_power_off(priv);
+			return ret;
+		}
+	}
 
-	stmmac_mac_irq_modify(spcs->priv, 0, spcs->int_mask);
+	stmmac_mac_irq_modify(priv, 0, spcs->int_mask);
 
 	return 0;
 }
@@ -14,8 +29,11 @@ static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
 static void dwmac_integrated_pcs_disable(struct phylink_pcs *pcs)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	struct stmmac_priv *priv = spcs->priv;
+
+	stmmac_mac_irq_modify(priv, spcs->int_mask, 0);
 
-	stmmac_mac_irq_modify(spcs->priv, spcs->int_mask, 0);
+	dwmac_serdes_power_off(priv);
 }
 
 static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
@@ -32,6 +50,15 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 				       bool permit_pause_to_mac)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	int ret;
+
+	if (spcs->interface != interface) {
+		ret = dwmac_serdes_set_mode(spcs->priv, interface);
+		if (ret)
+			return ret;
+
+		spcs->interface = interface;
+	}
 
 	dwmac_ctrl_ane(spcs->base, 0, 1, spcs->priv->hw->reverse_sgmii_enable);
 
@@ -71,6 +98,7 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
 			       u32 int_mask)
 {
 	struct stmmac_pcs *spcs;
+	int ret;
 
 	spcs = devm_kzalloc(priv->device, sizeof(*spcs), GFP_KERNEL);
 	if (!spcs)
@@ -81,6 +109,14 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
 	spcs->int_mask = int_mask;
 	spcs->pcs.ops = &dwmac_integrated_pcs_ops;
 
+	if (priv->plat->serdes) {
+		ret = dwmac_serdes_validate(priv, PHY_INTERFACE_MODE_SGMII);
+		if (ret)
+			dev_warn(priv->device,
+				 "serdes does not support SGMII: %pe\n",
+				 ERR_PTR(ret));
+	}
+
 	__set_bit(PHY_INTERFACE_MODE_SGMII, spcs->pcs.supported_interfaces);
 
 	priv->integrated_pcs = spcs;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index c4e6b242d390..36bf75fdf478 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -53,6 +53,7 @@ struct stmmac_pcs {
 	struct stmmac_priv *priv;
 	void __iomem *base;
 	u32 int_mask;
+	phy_interface_t interface;
 	struct phylink_pcs pcs;
 };
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c
new file mode 100644
index 000000000000..d46a071bc383
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c
@@ -0,0 +1,111 @@
+#include <linux/phy/phy.h>
+
+#include "stmmac.h"
+#include "stmmac_serdes.h"
+
+static phy_interface_t dwmac_serdes_phy_modes[] = {
+	PHY_INTERFACE_MODE_SGMII,
+	PHY_INTERFACE_MODE_1000BASEX,
+	PHY_INTERFACE_MODE_2500BASEX
+};
+
+int dwmac_serdes_validate(struct stmmac_priv *priv, phy_interface_t interface)
+{
+	return phy_validate(priv->plat->serdes, PHY_MODE_ETHERNET, interface,
+			    NULL);
+}
+
+int dwmac_serdes_init(struct stmmac_priv *priv)
+{
+	size_t i;
+	int ret;
+
+	if (!priv->plat->serdes)
+		return 0;
+
+	/* Encourage good implementation of the SerDes PHY driver, so that
+	 * we can discover which Ethernet modes the SerDes supports.
+	 * Unfortunately, some implementations are noisy (bad), others
+	 * require phy_set_speed() to select the correct speed first
+	 * (which then reprograms the SerDes, negating the whole point of
+	 * phy_validate().) Weed out these incompatible implementations.
+	 */
+	for (i = 0; i < ARRAY_SIZE(dwmac_serdes_phy_modes); i++) {
+		ret = phy_validate(priv->plat->serdes, PHY_MODE_ETHERNET,
+				   dwmac_serdes_phy_modes[i], NULL);
+		if (ret == 0 || ret == -EOPNOTSUPP)
+			break;
+	}
+
+	if (ret == -EOPNOTSUPP)
+		dev_warn(priv->device,
+			 "SerDes driver does not implement phy_validate()\n");
+	if (ret) {
+		/* The SerDes PHY failed validation, refuse to use it. */
+		dev_warn(priv->device,
+			 "SerDes driver fails to validate SGMII, 1000BASE-X nor 2500BASE-X\n");
+		return -EINVAL;
+	}
+
+	ret = phy_init(priv->plat->serdes);
+	if (ret)
+		dev_err(priv->device, "failed to initialize SerDes: %pe\n",
+			ERR_PTR(ret));
+
+	return ret;
+}
+
+int dwmac_serdes_power_on(struct stmmac_priv *priv)
+{
+	int ret;
+
+	ret = phy_power_on(priv->plat->serdes);
+	if (ret)
+		dev_err(priv->device, "failed to power on SerDes: %pe\n",
+			ERR_PTR(ret));
+
+	return ret;
+}
+
+int dwmac_serdes_init_mode(struct stmmac_priv *priv, phy_interface_t interface)
+{
+	struct phy *serdes = priv->plat->serdes;
+
+	if (!serdes || phy_get_mode(serdes) == PHY_MODE_ETHERNET)
+		return 0;
+
+	return dwmac_serdes_set_mode(priv, interface);
+}
+
+int dwmac_serdes_set_mode(struct stmmac_priv *priv, phy_interface_t interface)
+{
+	struct phy *serdes = priv->plat->serdes;
+	int ret;
+
+	ret = phy_set_mode_ext(serdes, PHY_MODE_ETHERNET, interface);
+	if (ret)
+		dev_err(priv->device,
+			"failed to set SerDes mode %s: %pe\n",
+			phy_modes(interface), ERR_PTR(ret));
+
+	return ret;
+}
+
+void dwmac_serdes_power_off(struct stmmac_priv *priv)
+{
+	int ret;
+
+	ret = phy_power_off(priv->plat->serdes);
+	if (ret)
+		dev_err(priv->device, "failed to power off SerDes: %pe\n",
+			ERR_PTR(ret));
+}
+
+void dwmac_serdes_exit(struct stmmac_priv *priv)
+{
+	int ret = phy_exit(priv->plat->serdes);
+
+	if (ret)
+		dev_err(priv->device, "failed to shutdown SerDes: %pe\n",
+			ERR_PTR(ret));
+}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.h
new file mode 100644
index 000000000000..a31e6c9e0570
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.h
@@ -0,0 +1,16 @@
+#ifndef STMMAC_SERDES_H
+#define STMMAC_SERDES_H
+
+#include <linux/phy.h>
+
+struct stmmac_priv;
+
+int dwmac_serdes_validate(struct stmmac_priv *priv, phy_interface_t interface);
+int dwmac_serdes_init(struct stmmac_priv *priv);
+int dwmac_serdes_power_on(struct stmmac_priv *priv);
+int dwmac_serdes_init_mode(struct stmmac_priv *priv, phy_interface_t interface);
+int dwmac_serdes_set_mode(struct stmmac_priv *priv, phy_interface_t interface);
+void dwmac_serdes_power_off(struct stmmac_priv *priv);
+void dwmac_serdes_exit(struct stmmac_priv *priv);
+
+#endif
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index f1054b9c2d8a..4db506e5cf13 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -193,6 +193,7 @@ enum dwmac_core_type {
 #define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
 
 struct mac_device_info;
+struct phy;
 
 struct plat_stmmacenet_data {
 	enum dwmac_core_type core_type;
@@ -222,6 +223,7 @@ struct plat_stmmacenet_data {
 	 * that phylink uses.
 	 */
 	phy_interface_t phy_interface;
+	struct phy *serdes;
 	struct stmmac_mdio_bus_data *mdio_bus_data;
 	struct device_node *phy_node;
 	struct fwnode_handle *port_node;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
