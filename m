Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BE7BA6DDB
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Sep 2025 11:34:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14EADC424BC;
	Sun, 28 Sep 2025 09:34:01 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5AFBC424B9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Sep 2025 09:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ePmBkB5gMR0E9QiKZkfcyLPz5OgBxGNS0OxXic1X5dw=; b=d3erPPVY5+upjvjA/KzIzKJOwr
 ZlVRFcBl68pcG+mjhA9BX7EGhbzeKo5iBrcBTvqyDkjvSl+rkq/7Ih3lckIDfSmCn83MB5YApYdk1
 UYz3ilD9Qce42zAI/hosiCHj6vfqCMD1i6sZdm1AoN1YlEoQgR/atO4M4ytB88iQEgXbv9bW+EMn7
 sudBe+m7+rGe+GXmJ9uMJPvVDnJ6QMp/iy+6Ld36nIxq4ToV6ZIr6XJ9NRqHLk1pP9EgxJR8ePFMS
 oWWhMHkDyk/bmsDYcNIcp8ZZhv0lFZ6Vbgbed7O+vFN1zzND8IoF7oPsTIOS+/lJR1165zC9uDdNY
 pjQc9QEA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45566 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1v2nar-000000005Ic-0V2w;
 Sun, 28 Sep 2025 10:21:21 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1v2naf-00000007oHn-3t3o; Sun, 28 Sep 2025 10:21:09 +0100
In-Reply-To: <aNj8U4xPJ0JepmZs@shell.armlinux.org.uk>
References: <aNj8U4xPJ0JepmZs@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1v2naf-00000007oHn-3t3o@rmk-PC.armlinux.org.uk>
Date: Sun, 28 Sep 2025 10:21:09 +0100
Cc: Song Yoong Siang <yoong.siang.song@intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Kees Cook <kees@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Swathi K S <swathi.ks@samsung.com>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 Mateusz Polchlopek <mateusz.polchlopek@intel.com>,
 Simon Horman <horms@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Huacai Chen <chenhuacai@kernel.org>, Furong Xu <0x1207@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Shenwei Wang <shenwei.wang@nxp.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Daniel Machon <daniel.machon@microchip.com>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>, linux-arm-msm@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Alexis Lothor__ <alexis.lothore@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
 Rohan G Thomas <rohan.g.thomas@altera.com>,
 Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [Linux-stm32] [PATCH RFC net-next v2 13/19] net: stmmac: convert to
 phylink PCS support
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

Now that stmmac's PCS support is much more simple - just a matter of
configuring the control register - the basic conversion to phylink PCS
support becomes straight forward.

Create the infrastructure to setup a phylink_pcs instance for the
integrated PCS:
- add a struct stmmac_pcs to encapsulate the phylink_pcs structure,
  pointer to stmmac_priv, and the core-specific base address of the
  PCS registers.
- modify stmmac_priv and stmmac_mac_select_pcs() to return the
  embedded phylink_pcs structure when setup and STMMAC_PCS_SGMII is
  in use, and move the comment from stmmac_hw_setup() to here.
- create stmmac_pcs.c, which contains the phylink_pcs_ops structure,
  a dummy .pcs_get_state() method which always reports link-down, and
  .pcs_config() method, moving the call to stmmac_pcs_ctrl_ane() here,
  but without indirecting through the dwmac specific core code.

This will ensure that the PCS control register is configured to the
same settings as before, but will now happen when the netdev is
opened or reusmed rather than only during probe time. However, this
will be before the .fix_mac_speed() method is called, which is
critical for the behaviour in dwmac-qcom-ethqos's
ethqos_configure_sgmii() function to be maintained.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/Makefile  |  2 +-
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  4 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 15 +++---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 47 +++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  | 17 +++++++
 7 files changed, 79 insertions(+), 10 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index b591d93f8503..0390d33b4413 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -7,7 +7,7 @@ stmmac-objs:= stmmac_main.o stmmac_ethtool.o stmmac_mdio.o ring_mode.o	\
 	      dwmac4_dma.o dwmac4_lib.o dwmac4_core.o dwmac5.o hwif.o \
 	      stmmac_tc.o dwxgmac2_core.o dwxgmac2_dma.o dwxgmac2_descs.o \
 	      stmmac_xdp.o stmmac_est.o stmmac_fpe.o stmmac_vlan.o \
-	      $(stmmac-y)
+	      stmmac_pcs.o $(stmmac-y)
 
 stmmac-$(CONFIG_STMMAC_SELFTESTS) += stmmac_selftests.o
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index d35db8958be1..b01c0fc822f9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -484,7 +484,7 @@ int dwmac1000_setup(struct stmmac_priv *priv)
 	mac->mii.clk_csr_shift = 2;
 	mac->mii.clk_csr_mask = GENMASK(5, 2);
 
-	return 0;
+	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE);
 }
 
 /* DWMAC 1000 HW Timestaming ops */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index d855ab6b9145..688e45b440dd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -1017,5 +1017,5 @@ int dwmac4_setup(struct stmmac_priv *priv)
 	mac->mii.clk_csr_mask = GENMASK(11, 8);
 	mac->num_vlan = stmmac_get_num_vlan(priv->ioaddr);
 
-	return 0;
+	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE);
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 7ca5477be390..34f62993a4da 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -25,6 +25,8 @@
 #include <net/xdp.h>
 #include <uapi/linux/bpf.h>
 
+struct stmmac_pcs;
+
 struct stmmac_resources {
 	void __iomem *addr;
 	u8 mac[ETH_ALEN];
@@ -273,6 +275,8 @@ struct stmmac_priv {
 	unsigned int pause_time;
 	struct mii_bus *mii;
 
+	struct stmmac_pcs *integrated_pcs;
+
 	struct phylink_config phylink_config;
 	struct phylink *phylink;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ee48991d336d..2cf6e69f3303 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -46,6 +46,7 @@
 #include "stmmac_ptp.h"
 #include "stmmac_fpe.h"
 #include "stmmac.h"
+#include "stmmac_pcs.h"
 #include "stmmac_xdp.h"
 #include <linux/reset.h>
 #include <linux/of_mdio.h>
@@ -850,6 +851,13 @@ static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
 			return pcs;
 	}
 
+	/* The PCS control register is only relevant for SGMII, TBI and RTBI
+	 * modes. We no longer support TBI or RTBI, so only configure this
+	 * register when operating in SGMII mode with the integrated PCS.
+	 */
+	if (priv->hw->pcs & STMMAC_PCS_SGMII && priv->integrated_pcs)
+		return &priv->integrated_pcs->pcs;
+
 	return NULL;
 }
 
@@ -3488,13 +3496,6 @@ static int stmmac_hw_setup(struct net_device *dev)
 		}
 	}
 
-	/* The PCS control register is only relevant for SGMII, TBI and RTBI
-	 * modes. We no longer support TBI or RTBI, so only configure this
-	 * register when operating in SGMII mode with the integrated PCS.
-	 */
-	if (priv->hw->pcs & STMMAC_PCS_SGMII)
-		stmmac_pcs_ctrl_ane(priv, 1, priv->hw->reverse_sgmii_enable);
-
 	/* set TX and RX rings length */
 	stmmac_set_rings_length(priv);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
new file mode 100644
index 000000000000..50ea51d7a1cc
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "stmmac.h"
+#include "stmmac_pcs.h"
+
+static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
+					   unsigned int neg_mode,
+					   struct phylink_link_state *state)
+{
+	state->link = false;
+}
+
+static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
+				       unsigned int neg_mode,
+				       phy_interface_t interface,
+				       const unsigned long *advertising,
+				       bool permit_pause_to_mac)
+{
+	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+
+	dwmac_ctrl_ane(spcs->base, 0, 1, spcs->priv->hw->reverse_sgmii_enable);
+
+	return 0;
+}
+
+static const struct phylink_pcs_ops dwmac_integrated_pcs_ops = {
+	.pcs_get_state = dwmac_integrated_pcs_get_state,
+	.pcs_config = dwmac_integrated_pcs_config,
+};
+
+int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset)
+{
+	struct stmmac_pcs *spcs;
+
+	spcs = devm_kzalloc(priv->device, sizeof(*spcs), GFP_KERNEL);
+	if (!spcs)
+		return -ENOMEM;
+
+	spcs->priv = priv;
+	spcs->base = priv->ioaddr + offset;
+	spcs->pcs.ops = &dwmac_integrated_pcs_ops;
+
+	__set_bit(PHY_INTERFACE_MODE_SGMII, spcs->pcs.supported_interfaces);
+
+	priv->integrated_pcs = spcs;
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index 5778f5b2f313..64397ac8ecab 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -9,6 +9,7 @@
 #ifndef __STMMAC_PCS_H__
 #define __STMMAC_PCS_H__
 
+#include <linux/phylink.h>
 #include <linux/slab.h>
 #include <linux/io.h>
 #include "common.h"
@@ -46,6 +47,22 @@
 #define GMAC_ANE_RFE_SHIFT	12
 #define GMAC_ANE_ACK		BIT(14)
 
+struct stmmac_priv;
+
+struct stmmac_pcs {
+	struct stmmac_priv *priv;
+	void __iomem *base;
+	struct phylink_pcs pcs;
+};
+
+static inline struct stmmac_pcs *
+phylink_pcs_to_stmmac_pcs(struct phylink_pcs *pcs)
+{
+	return container_of(pcs, struct stmmac_pcs, pcs);
+}
+
+int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset);
+
 /**
  * dwmac_pcs_isr - TBI, RTBI, or SGMII PHY ISR
  * @ioaddr: IO registers pointer
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
