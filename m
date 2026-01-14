Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 904D6D20B1A
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 18:58:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C409C8F273;
	Wed, 14 Jan 2026 17:58:47 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A92D9C8F261
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 17:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CMrcDmPGftWX4lzl5mXX46jAy7LO9GU7b1EdpEz0imo=; b=WqFYeThMebzFQDzueOx+gnKT1A
 s/lLuoJXFBu6enNaDVJAYg4+FBM2XEZlFTa/rvy1XS3J/W5SS4UIOScLPUMC/1uyAJDvouErxtW6Z
 X6BtElxQXnd0qUDEIWmiIENcdv9jUxLUttrHrNeJpUzkvrNOPlbJZA4m0sMy04lDtHOuVcipHzW5V
 P00HksKLtJ5tIzNwPp0O3rWkQFonwwreJT+sVLP0iC2cAtM9XmiJYUi3ss0w6tBOONULF+cpK7sIQ
 UjvCiCNDGLnoKtVL0BORfxXGpSoYJqtmvSMHU0V9Ac5qPgk3KvnpSdZt07kOkLDq83hQDfyakg4lo
 7K4lEhTw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41104 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vg4wm-000000000WE-1G3X;
 Wed, 14 Jan 2026 17:46:20 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vg4wh-00000003SGr-26ZJ; Wed, 14 Jan 2026 17:46:15 +0000
In-Reply-To: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vg4wh-00000003SGr-26ZJ@rmk-PC.armlinux.org.uk>
Date: Wed, 14 Jan 2026 17:46:15 +0000
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 13/14] net: stmmac: configure SGMII
 AN control according to phylink
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

Provide phylink with the integrated PCS autonegotiation capabilities,
and configure the PCS's AN settings according to phylink's requested
requirements.

This may cause regressions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 12fc5038d913..44f82e6c1edb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -65,7 +65,8 @@ static int dwmac_integrated_pcs_validate(struct phylink_pcs *pcs,
 static unsigned int dwmac_integrated_pcs_inband_caps(struct phylink_pcs *pcs,
 						     phy_interface_t interface)
 {
-	if (phy_interface_mode_is_8023z(interface))
+	if (phy_interface_mode_is_8023z(interface) ||
+	    interface == PHY_INTERFACE_MODE_SGMII)
 		return LINK_INBAND_ENABLE | LINK_INBAND_DISABLE;
 
 	return 0;
@@ -160,8 +161,9 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 				       bool permit_pause_to_mac)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
-	bool changed = false, ane = true;
-	u32 adv;
+	void __iomem *an_control = spcs->base + GMAC_AN_CTRL(0);
+	bool changed = false;
+	u32 adv, ctrl;
 	int ret;
 
 	if (spcs->interface != interface) {
@@ -178,12 +180,16 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 		if (readl(spcs->base + GMAC_ANE_ADV) != adv)
 			changed = true;
 		writel(adv, spcs->base + GMAC_ANE_ADV);
-
-		ane = neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
 	}
 
-	dwmac_ctrl_ane(spcs->base, 0, ane,
-		       spcs->priv->hw->reverse_sgmii_enable);
+	ctrl = readl(an_control) & ~(GMAC_AN_CTRL_ANE | GMAC_AN_CTRL_SGMRAL);
+	if (spcs->priv->hw->reverse_sgmii_enable)
+		ctrl |= GMAC_AN_CTRL_SGMRAL | GMAC_AN_CTRL_ANE;
+	else if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
+		ctrl |= GMAC_AN_CTRL_ANE;
+	else
+		ctrl |= GMAC_AN_CTRL_SGMRAL;
+	writel(ctrl, an_control);
 
 	return changed;
 }
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
