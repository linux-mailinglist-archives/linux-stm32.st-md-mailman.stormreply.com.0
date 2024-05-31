Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F2E8D60A4
	for <lists+linux-stm32@lfdr.de>; Fri, 31 May 2024 13:26:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EB32C6C820;
	Fri, 31 May 2024 11:26:44 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1311DCFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2024 11:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7DUZ/QJwKjlEf/7QUPAOogKJPw017FgEZY7g/VFAZT4=; b=EE8b+sJLsyCTUigJ6jljrYvC+R
 km5VfDG6dRdgm/I1jvHcT3inY98dSTpzOlvHbkkAXGqJLySsVTImSBF22XDESmSShvz/0JKkiNoos
 omMMoWGca6ya0a+rZJXIAJibFibUxdXzS73OOF5m57F8pgw8eyoFg1tOY6ibmLgbZhilMS7qkPUc7
 /AmVzMs5DdbBzoRArO9Ibzhlbw8Ldn9bdGnLEwj78UJ1rNxxx/RqYW7i915crEFxOvQr1ydTnOhml
 wJJ9WmwuKcyafj1Wf9hmhZVyHrjWuYuJueFv0y2nZg2YHxI972Jn5yXAExx6OvAZMI/qzxn9PsuZq
 tD9zOdeA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44044 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1sD0Oy-0008Ry-0B;
 Fri, 31 May 2024 12:26:28 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1sD0P0-00EzC0-J8; Fri, 31 May 2024 12:26:30 +0100
In-Reply-To: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1sD0P0-00EzC0-J8@rmk-PC.armlinux.org.uk>
Date: Fri, 31 May 2024 12:26:30 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH RFC net-next v2 4/8] net: stmmac: dwmac1000:
 move PCS interrupt control
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

Control the PCS interrupt mask from phylink's pcs_enable() and
pcs_disable() methods rather than relying on driver variables.

This assumes that GMAC_INT_DISABLE_RGMII, GMAC_INT_DISABLE_PCSLINK
and GMAC_INT_DISABLE_PCSAN are all relevant to the PCS.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  | 33 +++++++++++++++----
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 4a0572d5f865..3ba65ea3e46f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -56,12 +56,7 @@ static void dwmac1000_core_init(struct mac_device_info *hw,
 	writel(value, ioaddr + GMAC_CONTROL);
 
 	/* Mask GMAC interrupts */
-	value = GMAC_INT_DEFAULT_MASK;
-
-	if (hw->pcs)
-		value &= ~GMAC_INT_DISABLE_PCS;
-
-	writel(value, ioaddr + GMAC_INT_MASK);
+	writel(GMAC_INT_DEFAULT_MASK, ioaddr + GMAC_INT_MASK);
 
 #ifdef STMMAC_VLAN_TAG_USED
 	/* Tag detection without filtering */
@@ -387,6 +382,30 @@ static int dwmac1000_mii_pcs_validate(struct phylink_pcs *pcs,
 	return 0;
 }
 
+static int dwmac1000_mii_pcs_enable(struct phylink_pcs *pcs)
+{
+	struct mac_device_info *hw = phylink_pcs_to_mac_dev_info(pcs);
+	void __iomem *ioaddr = hw->pcsr;
+	u32 intr_mask;
+
+	intr_mask = readl(ioaddr + GMAC_INT_MASK);
+	intr_mask &= ~GMAC_INT_DISABLE_PCS;
+	writel(intr_mask, ioaddr + GMAC_INT_MASK);
+
+	return 0;
+}
+
+static void dwmac1000_mii_pcs_disable(struct phylink_pcs *pcs)
+{
+	struct mac_device_info *hw = phylink_pcs_to_mac_dev_info(pcs);
+	void __iomem *ioaddr = hw->pcsr;
+	u32 intr_mask;
+
+	intr_mask = readl(ioaddr + GMAC_INT_MASK);
+	intr_mask |= GMAC_INT_DISABLE_PCS;
+	writel(intr_mask, ioaddr + GMAC_INT_MASK);
+}
+
 static int dwmac1000_mii_pcs_config(struct phylink_pcs *pcs,
 				    unsigned int neg_mode,
 				    phy_interface_t interface,
@@ -428,6 +447,8 @@ static void dwmac1000_mii_pcs_get_state(struct phylink_pcs *pcs,
 
 static const struct phylink_pcs_ops dwmac1000_mii_pcs_ops = {
 	.pcs_validate = dwmac1000_mii_pcs_validate,
+	.pcs_enable = dwmac1000_mii_pcs_enable,
+	.pcs_disable = dwmac1000_mii_pcs_disable,
 	.pcs_config = dwmac1000_mii_pcs_config,
 	.pcs_get_state = dwmac1000_mii_pcs_get_state,
 };
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
