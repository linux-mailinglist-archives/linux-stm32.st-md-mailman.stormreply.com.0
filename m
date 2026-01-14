Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A02D209C7
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 18:46:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5286EC8F273;
	Wed, 14 Jan 2026 17:46:22 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 210EDC8F261
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 17:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2h/tSYyo8iu5oqYURY/nNiWSh/Bd6u+p5RGNHyXJOyE=; b=xAEvDUhRd+Anb0dQa+ELuClTQD
 lL0d/P8Afx70fCx5tSucw47PCSSBKCBM4B7vSCpGXeYybC9vXc3toKFNrk6CSHUFzkVvwMZnafvBP
 80Mherll5eudfpMlFCglaiFKNXn2iLvx1fuHN5ZM2VVND6fUhD6pum0v1yxOZTUyOjLOBSW7Q92HD
 6C1jfxIoYV1Ce3hxXf+6Ky8nnFFze3p2sw+4riXp91FGgvYLs0fFypsZMLOYfjhtmF9EgemmNUEZe
 AptgvPLv6IIbddpFb5tCwYR0sABxj+Ez11Z4BouAFwFRAfytiSnIHHuxxGZb5HcLwO6VxWX9lMBfQ
 rTwIhXag==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35822 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vg4wP-000000000VJ-2Rym;
 Wed, 14 Jan 2026 17:45:58 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vg4wN-00000003SGU-02i7; Wed, 14 Jan 2026 17:45:55 +0000
In-Reply-To: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vg4wN-00000003SGU-02i7@rmk-PC.armlinux.org.uk>
Date: Wed, 14 Jan 2026 17:45:55 +0000
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 09/14] net: stmmac: add BASE-X
 support to integrated PCS
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

The integrated PCS supports 802.3z (BASE-X) modes when the Synopsys
IP is coupled with an appropriate SerDes to provide the electrical
interface. The PCS presents a TBI interface to the SerDes for this.
Thus, the BASE-X related registers are only present when TBI mode is
supported.

dwmac-qcom-ethqos added support for using 2.5G with the integrated PCS
by calling dwmac_ctrl_ane() directly.

Add support for 1000BASE-X mode to the integrated PCS support if the
PCS supports TBI, and 2500BASE-X if we have a SerDes that supports
this mode.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 95 ++++++++++++++++++-
 1 file changed, 92 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index cf7337e9ed3e..edcf36083806 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -17,6 +17,50 @@
 #define GMAC_ANE_LPA	0x0c	/* ANE link partener ability */
 #define GMAC_TBI	0x14	/* TBI extend status */
 
+static enum ethtool_link_mode_bit_indices dwmac_hd_mode_bits[] = {
+	ETHTOOL_LINK_MODE_10baseT_Half_BIT,
+	ETHTOOL_LINK_MODE_100baseT_Half_BIT,
+	ETHTOOL_LINK_MODE_1000baseT_Half_BIT,
+	ETHTOOL_LINK_MODE_100baseFX_Half_BIT,
+	ETHTOOL_LINK_MODE_10baseT1S_Half_BIT,
+	ETHTOOL_LINK_MODE_10baseT1S_P2MP_Half_BIT,
+};
+
+static int dwmac_integrated_pcs_validate(struct phylink_pcs *pcs,
+					 unsigned long *supported,
+					 const struct phylink_link_state *state)
+{
+	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	size_t i;
+	u32 val;
+
+	if (phy_interface_mode_is_8023z(state->interface)) {
+		/* ESTATUS_1000_XFULL is always set, so full duplex is
+		 * supported. ESTATUS_1000_XHALF depends on core configuration.
+		 */
+		val = readl(spcs->base + GMAC_TBI);
+		if (~val & ESTATUS_1000_XHALF)
+			for (i = 0; i < ARRAY_SIZE(dwmac_hd_mode_bits); i++)
+				linkmode_clear_bit(dwmac_hd_mode_bits[i],
+						   supported);
+
+		return 0;
+	} else if (state->interface == PHY_INTERFACE_MODE_SGMII) {
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static unsigned int dwmac_integrated_pcs_inband_caps(struct phylink_pcs *pcs,
+						     phy_interface_t interface)
+{
+	if (phy_interface_mode_is_8023z(interface))
+		return LINK_INBAND_ENABLE | LINK_INBAND_DISABLE;
+
+	return 0;
+}
+
 static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
@@ -52,7 +96,23 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
 					   unsigned int neg_mode,
 					   struct phylink_link_state *state)
 {
-	state->link = false;
+	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	u32 status, lpa;
+
+	status = readl(spcs->base + GMAC_AN_STATUS);
+
+	if (phy_interface_mode_is_8023z(state->interface)) {
+		/* For 802.3z modes, the PCS block supports the advertisement
+		 * and link partner advertisement registers using standard
+		 * 802.3 format. The status register also has the link status
+		 * and AN complete bits in the same bit location.
+		 */
+		lpa = readl(spcs->base + GMAC_ANE_LPA);
+
+		phylink_mii_c22_pcs_decode_state(state, neg_mode, status, lpa);
+	} else {
+		state->link = false;
+	}
 }
 
 static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
@@ -62,6 +122,8 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 				       bool permit_pause_to_mac)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	bool changed = false, ane = true;
+	u32 adv;
 	int ret;
 
 	if (spcs->interface != interface) {
@@ -72,12 +134,25 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 		spcs->interface = interface;
 	}
 
-	dwmac_ctrl_ane(spcs->base, 0, 1, spcs->priv->hw->reverse_sgmii_enable);
+	if (phy_interface_mode_is_8023z(interface)) {
+		adv = phylink_mii_c22_pcs_encode_advertisement(interface,
+							       advertising);
+		if (readl(spcs->base + GMAC_ANE_ADV) != adv)
+			changed = true;
+		writel(adv, spcs->base + GMAC_ANE_ADV);
 
-	return 0;
+		ane = neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
+	}
+
+	dwmac_ctrl_ane(spcs->base, 0, ane,
+		       spcs->priv->hw->reverse_sgmii_enable);
+
+	return changed;
 }
 
 static const struct phylink_pcs_ops dwmac_integrated_pcs_ops = {
+	.pcs_validate = dwmac_integrated_pcs_validate,
+	.pcs_inband_caps = dwmac_integrated_pcs_inband_caps,
 	.pcs_enable = dwmac_integrated_pcs_enable,
 	.pcs_disable = dwmac_integrated_pcs_disable,
 	.pcs_get_state = dwmac_integrated_pcs_get_state,
@@ -112,6 +187,9 @@ int stmmac_integrated_pcs_get_phy_intf_sel(struct stmmac_priv *priv,
 	if (interface == PHY_INTERFACE_MODE_SGMII)
 		return PHY_INTF_SEL_SGMII;
 
+	if (phy_interface_mode_is_8023z(interface))
+		return PHY_INTF_SEL_TBI;
+
 	return -EINVAL;
 }
 
@@ -140,6 +218,17 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
 
 	__set_bit(PHY_INTERFACE_MODE_SGMII, spcs->pcs.supported_interfaces);
 
+	if (readl(spcs->base + GMAC_AN_STATUS) & BMSR_ESTATEN) {
+		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
+			  spcs->pcs.supported_interfaces);
+
+		/* Only allow 2500Base-X if the SerDes has support. */
+		ret = dwmac_serdes_validate(priv, PHY_INTERFACE_MODE_2500BASEX);
+		if (ret == 0)
+			__set_bit(PHY_INTERFACE_MODE_2500BASEX,
+				  spcs->pcs.supported_interfaces);
+	}
+
 	priv->integrated_pcs = spcs;
 
 	return 0;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
