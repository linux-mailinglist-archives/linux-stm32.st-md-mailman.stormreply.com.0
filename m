Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEC2906A1F
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jun 2024 12:36:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71734C78011;
	Thu, 13 Jun 2024 10:36:21 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AE6BC71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jun 2024 10:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8L8QyfpuiZFMdW6OsHVgqikLpYCiyZtYL1ehm4gdEmI=; b=sz32prVvSD34cRh7bwcK2e9SyK
 0i766/63Hfr7jJgSYIQzI44lC3zynCAVQA0rg9UKTcel7wjjoyxpD2BVjV/2YglvZYvcEnmuk+nAp
 FUmc+hsx4FKIkzBQ+DMTGcpj9ryEIzwZAY+L0X96Vx8XiymzFBsA1GDF24daP0WaQnATglkz21CFI
 VoNJdgTJwQC0qqbRQ358Z9kVS6l4A9OJ91VNR4OvBkThrBiVUvSzBdKUb76u6U127+YoBJB6Ttuwt
 Z6h3/DoEeB/6mnoL66BonPkRFZK8S+iZSPOVN2GMYhzAUzyBwjutVaJ0apuKPAo1caR8T9vWXdHX7
 aFKq6YJw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39576 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1sHhoO-00065R-0y;
 Thu, 13 Jun 2024 11:36:08 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1sHhoR-00FetB-CP; Thu, 13 Jun 2024 11:36:11 +0100
In-Reply-To: <ZmrLbdwv6ALoy+gs@shell.armlinux.org.uk>
References: <ZmrLbdwv6ALoy+gs@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1sHhoR-00FetB-CP@rmk-PC.armlinux.org.uk>
Date: Thu, 13 Jun 2024 11:36:11 +0100
Cc: Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v2 2/5] net: stmmac: dwmac-intel:
 provide a select_pcs() implementation
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

Move the code returning the XPCS into dwmac-intel, which is the only
user of XPCS. Fill in the select_pcs() implementation only when we are
going to setup the XPCS, thus when it should be present.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 11 +++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  3 ---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 56649edb18cd..094d34c4193c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -443,6 +443,16 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 	plat->rx_queues_cfg[0].pkt_route = 0x0;
 }
 
+static struct phylink_pcs *intel_mgbe_select_pcs(struct stmmac_priv *priv,
+						 phy_interface_t interface)
+{
+	/* plat->mdio_bus_data->has_xpcs has been set true, so there
+	 * should always be an XPCS. The original code would always
+	 * return this if present.
+	 */
+	return &priv->hw->xpcs->pcs;
+}
+
 static int intel_mgbe_common_data(struct pci_dev *pdev,
 				  struct plat_stmmacenet_data *plat)
 {
@@ -587,6 +597,7 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	    plat->phy_interface == PHY_INTERFACE_MODE_1000BASEX) {
 		plat->mdio_bus_data->has_xpcs = true;
 		plat->mdio_bus_data->default_an_inband = true;
+		plat->select_pcs = intel_mgbe_select_pcs;
 	}
 
 	/* Ensure mdio bus scan skips intel serdes and pcs-xpcs */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 302aa4080de3..e9e2a95c91a3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -957,9 +957,6 @@ static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
 			return pcs;
 	}
 
-	if (priv->hw->xpcs)
-		return &priv->hw->xpcs->pcs;
-
 	return priv->hw->phylink_pcs;
 }
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
