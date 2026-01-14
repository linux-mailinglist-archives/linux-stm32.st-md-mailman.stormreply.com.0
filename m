Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BB8D209C4
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 18:46:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 452FCC8F273;
	Wed, 14 Jan 2026 17:46:18 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1EA2C8F261
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 17:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tDh4p51oLv7FOb/arX7mMuMExGy4+nCEFyLLly8x3eE=; b=onaLIZHP8Si2JXl7kNOsY/eU5g
 KiwxSyPi0fwQTo192AuTA2gzctuDRYFWMk7qNtAgShYpa10/nRG6sYwAIWNPFjfIPk0uxHSvoZBCF
 fkY0ecHoMvhdiztZxIdmsBd7v9gq/CfCE2GYiCSUGT14ec4VimrlOTh63vw44W8T7ypgmhtqWtl+r
 ulJSBeA8tQxnxb5NWsuPdp6ZcGwNS0X/OUmwiMMLGYgzY2EH3bhmP4iUZPXUsWBPGCeL64/mziVGY
 Pg99l8WPHXkUaxIghmwAcO+E81r3O+zD2fOp4KYOj20sxyhGpSf9wI+/0Dtlx0JTGH+Yh3OAputH7
 TQjTBrag==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35818 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vg4wL-000000000V2-02IK;
 Wed, 14 Jan 2026 17:45:53 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vg4wH-00000003SGO-3kVz; Wed, 14 Jan 2026 17:45:49 +0000
In-Reply-To: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vg4wH-00000003SGO-3kVz@rmk-PC.armlinux.org.uk>
Date: Wed, 14 Jan 2026 17:45:49 +0000
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 08/14] net: stmmac: handle integrated
 PCS phy_intf_sel separately
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

The dwmac core has no support for SGMII without using its integrated
PCS. Thus, PHY_INTF_SEL_SGMII is only supported when this block is
present, and it makes no sense for stmmac_get_phy_intf_sel() to decode
this.

None of the platform glue users that use stmmac_get_phy_intf_sel()
directly accept PHY_INTF_SEL_SGMII as a valid mode.

Check whether a PCS will be used by the driver for the interface mode,
and if it is the integrated PCS, query the integrated PCS for the
phy_intf_sel_i value to use.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 15 ++++++++++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c  |  9 +++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h  |  2 ++
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6c515f9efbe7..5254d9d19ffe 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3135,8 +3135,6 @@ int stmmac_get_phy_intf_sel(phy_interface_t interface)
 		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 	else if (phy_interface_mode_is_rgmii(interface))
 		phy_intf_sel = PHY_INTF_SEL_RGMII;
-	else if (interface == PHY_INTERFACE_MODE_SGMII)
-		phy_intf_sel = PHY_INTF_SEL_SGMII;
 	else if (interface == PHY_INTERFACE_MODE_RMII)
 		phy_intf_sel = PHY_INTF_SEL_RMII;
 	else if (interface == PHY_INTERFACE_MODE_REVMII)
@@ -3150,13 +3148,24 @@ static int stmmac_prereset_configure(struct stmmac_priv *priv)
 {
 	struct plat_stmmacenet_data *plat_dat = priv->plat;
 	phy_interface_t interface;
+	struct phylink_pcs *pcs;
 	int phy_intf_sel, ret;
 
 	if (!plat_dat->set_phy_intf_sel)
 		return 0;
 
 	interface = plat_dat->phy_interface;
-	phy_intf_sel = stmmac_get_phy_intf_sel(interface);
+
+	/* Check whether this mode uses a PCS */
+	pcs = stmmac_mac_select_pcs(&priv->phylink_config, interface);
+	if (priv->integrated_pcs && pcs == &priv->integrated_pcs->pcs) {
+		/* Request the phy_intf_sel from the integrated PCS */
+		phy_intf_sel = stmmac_integrated_pcs_get_phy_intf_sel(priv,
+								    interface);
+	} else {
+		phy_intf_sel = stmmac_get_phy_intf_sel(interface);
+	}
+
 	if (phy_intf_sel < 0) {
 		netdev_err(priv->dev,
 			   "failed to get phy_intf_sel for %s: %pe\n",
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 718e5360fca3..cf7337e9ed3e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -106,6 +106,15 @@ void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
 	}
 }
 
+int stmmac_integrated_pcs_get_phy_intf_sel(struct stmmac_priv *priv,
+					   phy_interface_t interface)
+{
+	if (interface == PHY_INTERFACE_MODE_SGMII)
+		return PHY_INTF_SEL_SGMII;
+
+	return -EINVAL;
+}
+
 int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
 			       u32 int_mask)
 {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index 887c4ff302aa..845bcad9d0f7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -43,6 +43,8 @@ phylink_pcs_to_stmmac_pcs(struct phylink_pcs *pcs)
 
 void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
 			       struct stmmac_extra_stats *x);
+int stmmac_integrated_pcs_get_phy_intf_sel(struct stmmac_priv *priv,
+					   phy_interface_t interface);
 int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
 			       u32 int_mask);
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
