Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4002D8D60A1
	for <lists+linux-stm32@lfdr.de>; Fri, 31 May 2024 13:26:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C878C6C820;
	Fri, 31 May 2024 11:26:35 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78A52CFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2024 11:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jj7AcYEJSvX8DA6Efl2MBL0SU/0tAK+cClfs48CxxHo=; b=FcF+3s6ukj7zNSKLyCLVdDN5Tw
 AIzF6t+uVVlGf4UDE2zFMI+FacTEu7JeR2lUrjFeIYZXm+61Dec5MXncFX3KUnyPQD11dp+LAYc+2
 iuDX+NSu77AXY22P7m9U3GJcjTVf7V2En5q3+Sw6yYuVxpVD1vLixLc7fp387MpXrAsOe/U7Qc/FL
 tDQXC4E7M7HIH8RQyFvqueBQ8iAycuSXS+F+ugKea+8nFPsCROzKcJmH4rq95CkXqlQul0kq9Qw/I
 lLEDQFpSDgPZBVcBZXy/o7kXirsjspv83WsKCBpU1UiZ2eaBdk3UAR8SVhmHDR3bQu4xwjkC0tkp1
 bfFjP44w==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59324 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1sD0On-0008RU-1m;
 Fri, 31 May 2024 12:26:17 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1sD0Oq-00EzBo-7r; Fri, 31 May 2024 12:26:20 +0100
In-Reply-To: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1sD0Oq-00EzBo-7r@rmk-PC.armlinux.org.uk>
Date: Fri, 31 May 2024 12:26:20 +0100
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH RFC net-next v2 2/8] net: stmmac: provide core
 phylink PCS infrastructure
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

There are some common operations shared between the dwmac hwifs, the
only difference is where they are located within the device. These
are already present in the form of dwmac_rane(), dwmac_ctrl_ane() and
dwmac_get_adv_lp(). Rather than use these (which don't quite fit with
phylink PCS, provide phylink PCS specific versions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/Makefile  |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 58 +++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  | 10 ++++
 3 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index c2f0e91f6bf8..9e15f7615ff4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -6,7 +6,7 @@ stmmac-objs:= stmmac_main.o stmmac_ethtool.o stmmac_mdio.o ring_mode.o	\
 	      mmc_core.o stmmac_hwtstamp.o stmmac_ptp.o dwmac4_descs.o	\
 	      dwmac4_dma.o dwmac4_lib.o dwmac4_core.o dwmac5.o hwif.o \
 	      stmmac_tc.o dwxgmac2_core.o dwxgmac2_dma.o dwxgmac2_descs.o \
-	      stmmac_xdp.o stmmac_est.o \
+	      stmmac_xdp.o stmmac_est.o stmmac_pcs.o \
 	      $(stmmac-y)
 
 stmmac-$(CONFIG_STMMAC_SELFTESTS) += stmmac_selftests.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
new file mode 100644
index 000000000000..849e6f121505
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -0,0 +1,58 @@
+#include "common.h"
+#include "stmmac_pcs.h"
+
+int dwmac_pcs_config(struct mac_device_info *hw, unsigned int neg_mode,
+		     phy_interface_t interface,
+		     const unsigned long *advertising,
+		     unsigned int reg_base)
+{
+	u32 val;
+
+	val = readl(hw->pcsr + GMAC_AN_CTRL(reg_base));
+
+	val |= GMAC_AN_CTRL_ANE | GMAC_AN_CTRL_RAN;
+
+	if (hw->ps)
+		val |= GMAC_AN_CTRL_SGMRAL;
+
+	writel(val, hw->pcsr + GMAC_AN_CTRL(reg_base));
+
+	return 0;
+}
+
+void dwmac_pcs_get_state(struct mac_device_info *hw,
+			 struct phylink_link_state *state,
+			 unsigned int reg_base)
+{
+	u32 val;
+
+	val = readl(hw->pcsr + GMAC_ANE_LPA(reg_base));
+
+	linkmode_set_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
+			 state->lp_advertising);
+
+	if (val & GMAC_ANE_FD) {
+		linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT,
+				 state->lp_advertising);
+		linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Full_BIT,
+				 state->lp_advertising);
+		linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Full_BIT,
+				 state->lp_advertising);
+	}
+
+	if (val & GMAC_ANE_HD) {
+		linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Half_BIT,
+				 state->lp_advertising);
+		linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT,
+				 state->lp_advertising);
+		linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Half_BIT,
+				 state->lp_advertising);
+	}
+
+	linkmode_mod_bit(ETHTOOL_LINK_MODE_Pause_BIT,
+			 state->lp_advertising,
+			 FIELD_GET(GMAC_ANE_PSE, val) & STMMAC_PCS_PAUSE);
+	linkmode_mod_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT,
+			 state->lp_advertising,
+			 FIELD_GET(GMAC_ANE_PSE, val) & STMMAC_PCS_ASYM_PAUSE);
+}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index 1bdf87b237c4..888485fa2761 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -137,4 +137,14 @@ static inline void dwmac_get_adv_lp(void __iomem *ioaddr, u32 reg,
 
 	adv_lp->lp_pause = (value & GMAC_ANE_PSE) >> GMAC_ANE_PSE_SHIFT;
 }
+
+int dwmac_pcs_config(struct mac_device_info *hw, unsigned int neg_mode,
+		     phy_interface_t interface,
+		     const unsigned long *advertising,
+		     unsigned int reg_base);
+
+void dwmac_pcs_get_state(struct mac_device_info *hw,
+			 struct phylink_link_state *state,
+			 unsigned int reg_base);
+
 #endif /* __STMMAC_PCS_H__ */
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
