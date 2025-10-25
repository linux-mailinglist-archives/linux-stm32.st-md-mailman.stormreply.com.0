Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9156C09FD6
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Oct 2025 22:49:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9C9AC5A4C0;
	Sat, 25 Oct 2025 20:49:03 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFA6AC57B70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Oct 2025 20:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MNOZmw3HtaFRWdz6EHC2zGJXiMWEH1txyyxtpZBUbwg=; b=DrHfgI7iFyFCBXadB9ayVD+w8O
 Ku2BQXwwaKJU44bL1yHL3lRcOFkd74UuUPYiHGDndhg41VUAPFimnBwMSSrwm1TaqkVY1ctn+GiSH
 pfwjoyWVd/EhYiZcDErmc1+9vpXy3KEuDyu8Dfw802Eb+87ZwnWdeJauUOUwbaauiM8zz37imOKcT
 lAsly1fNFCB0/XTwABTNh6DPdIasnm9boNYdL+B7ugING3Z1hWW8IIGlKZQx8wVMuSRAOuq8Qa1Be
 TamWi88Es3gwCI1Y5rGHIfzqZ4MjDvr8De1Z7lDE8tFuFPHVT87n0/ea1MjdKh5gOjK+OGx1LhTdC
 b815BCsg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41846 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vClC1-000000000Pv-0BZ2;
 Sat, 25 Oct 2025 21:48:53 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vClC0-0000000BcbV-0zYp; Sat, 25 Oct 2025 21:48:52 +0100
In-Reply-To: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vClC0-0000000BcbV-0zYp@rmk-PC.armlinux.org.uk>
Date: Sat, 25 Oct 2025 21:48:52 +0100
Cc: Yu-Chun Lin <eleanor15x@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Daniel Machon <daniel.machon@microchip.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Furong Xu <0x1207@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org,
 Alexis Lothor__ <alexis.lothore@bootlin.com>
Subject: [Linux-stm32] [PATCH net-next 2/3] net: stmmac: report PCS
	configuration changes
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

Report if/when qcom-ethqos changes the PCS configuration. With phylink
now setting the PCS configuration, there should be no need for drivers
to change this.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index cda93894168e..e42a98162c2b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -109,6 +109,7 @@ static inline void dwmac_ctrl_ane(void __iomem *ioaddr, u32 reg, bool ane,
 				  bool srgmi_ral)
 {
 	u32 value = readl(ioaddr + GMAC_AN_CTRL(reg));
+	u32 old = value;
 
 	/* Enable and restart the Auto-Negotiation */
 	if (ane)
@@ -122,6 +123,10 @@ static inline void dwmac_ctrl_ane(void __iomem *ioaddr, u32 reg, bool ane,
 	if (srgmi_ral)
 		value |= GMAC_AN_CTRL_SGMRAL;
 
+	if (old != value)
+		pr_warn("dwmac: PCS configuration changed from phylink by glue, please report: 0x%08x -> 0x%08x\n",
+			old, value);
+
 	writel(value, ioaddr + GMAC_AN_CTRL(reg));
 }
 #endif /* __STMMAC_PCS_H__ */
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
