Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C9C8D60A9
	for <lists+linux-stm32@lfdr.de>; Fri, 31 May 2024 13:26:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35426C7128F;
	Fri, 31 May 2024 11:26:55 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97583C71288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2024 11:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nYV0iwaM4CrzqivMDUO7NpiYXQHAZmA2iACOt/v5Uqw=; b=mdiCJmxl5lFpKc42IfdPL7sG0Y
 yhaC0eybZDMUUz1JsIXzDRzvGNXhnX3j3BvEWhMqokJ1EsNURsoHOWml8TWUvmRgceh5DWkWctS4r
 CRxeeKrYZwaecnmmBs7Zn3otZIn21hXgeB5Esn3/KTODsfVfUQasQX+2sGn4oJN0wE8uVXiOqLYGA
 Fr1bSIx5dAvOO7YDjxWhP4YrGVdKeoWJWk9BHnllwbzWzumtrmQP49xgoSRMRXjCD58Re2hyxxOrI
 mbcHZ1cbGQk1Hk8KLzAAIsp/+i/nUS4cYH3S5q2+ahY6JeGGwih+BWekAN8GGgbixFkFJc6eB3xqL
 wSsQB7xA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34888 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1sD0P8-0008SZ-2T;
 Fri, 31 May 2024 12:26:38 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1sD0PA-00EzCC-Qb; Fri, 31 May 2024 12:26:40 +0100
In-Reply-To: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1sD0PA-00EzCC-Qb@rmk-PC.armlinux.org.uk>
Date: Fri, 31 May 2024 12:26:40 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH RFC net-next v2 6/8] net: stmmac: dwmac4: move
 PCS interrupt control
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

Control the PCS interrupt mask from the phylink pcs_enable() and
pcs_disable() methods rather than relying on driver variables.

This assumes that GMAC_INT_RGSMIIS, GMAC_INT_PCS_LINK and
GMAC_INT_PCS_ANE are all relevant to the PCS.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 29 +++++++++++++++++--
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index cb99cb69c52b..5cf2a6cb8f66 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -56,9 +56,6 @@ static void dwmac4_core_init(struct mac_device_info *hw,
 	/* Enable GMAC interrupts */
 	value = GMAC_INT_DEFAULT_ENABLE;
 
-	if (hw->pcs)
-		value |= GMAC_PCS_IRQ_DEFAULT;
-
 	/* Enable FPE interrupt */
 	if ((GMAC_HW_FEAT_FPESEL & readl(ioaddr + GMAC_HW_FEATURE3)) >> 26)
 		value |= GMAC_INT_FPE_EN;
@@ -770,6 +767,30 @@ static int dwmac4_mii_pcs_validate(struct phylink_pcs *pcs,
 	return 0;
 }
 
+static int dwmac4_mii_pcs_enable(struct phylink_pcs *pcs)
+{
+	struct mac_device_info *hw = phylink_pcs_to_mac_dev_info(pcs);
+	void __iomem *ioaddr = hw->pcsr;
+	u32 intr_enable;
+
+	intr_enable = readl(ioaddr + GMAC_INT_EN);
+	intr_enable |= GMAC_PCS_IRQ_DEFAULT;
+	writel(intr_enable, ioaddr + GMAC_INT_EN);
+
+	return 0;
+}
+
+static void dwmac4_mii_pcs_disable(struct phylink_pcs *pcs)
+{
+	struct mac_device_info *hw = phylink_pcs_to_mac_dev_info(pcs);
+	void __iomem *ioaddr = hw->pcsr;
+	u32 intr_enable;
+
+	intr_enable = readl(ioaddr + GMAC_INT_EN);
+	intr_enable &= ~GMAC_PCS_IRQ_DEFAULT;
+	writel(intr_enable, ioaddr + GMAC_INT_EN);
+}
+
 static int dwmac4_mii_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
 				 phy_interface_t interface,
 				 const unsigned long *advertising,
@@ -817,6 +838,8 @@ static void dwmac4_mii_pcs_get_state(struct phylink_pcs *pcs,
 
 static const struct phylink_pcs_ops dwmac4_mii_pcs_ops = {
 	.pcs_validate = dwmac4_mii_pcs_validate,
+	.pcs_enable = dwmac4_mii_pcs_enable,
+	.pcs_disable = dwmac4_mii_pcs_disable,
 	.pcs_config = dwmac4_mii_pcs_config,
 	.pcs_get_state = dwmac4_mii_pcs_get_state,
 };
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
