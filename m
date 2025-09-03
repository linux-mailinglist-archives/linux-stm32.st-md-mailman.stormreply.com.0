Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E40C2B41F59
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 14:40:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA982C3FAC8;
	Wed,  3 Sep 2025 12:40:16 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EC9CC3FAC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 12:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R+OIhPT15cRLCNkKMY1zwgni+1n9JXivTyEzbTPisXU=; b=j5APxs9d1R7JNWgFSfjgGtXVre
 mizQZQPdTsVJRgovGuNWKsTzbRmqQqsWSyHpVAxdoe/aAGWlyHzMlS4jQ4i4JcQEB+TLzgieCoNy6
 QQb3lgb8mKUVEwOUDWgx9pjBAxnPJlqzjPkKCGckaiLqgckK5ZDQbuy/EhlGQX5h0b8nkma2f/ZAG
 oX6GupfEodkkk+xu/TMln2+lndJ6KctkhgiYldKYI3nvznHy99NW6K9EMlDdYZ1vX14gZQw3DULGv
 6YQUSckgatlQsFXcZY6yOWsoxrNeagt/NqZ8fQwEb/6x7lqekI3Hih7W20+XPDxOENr8oYOyJ6+G0
 zjdbkA4A==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56278 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1utmmZ-000000000XR-0BSS;
 Wed, 03 Sep 2025 13:40:11 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1utmmY-00000001s13-0v5M; Wed, 03 Sep 2025 13:40:10 +0100
In-Reply-To: <aLg24RZ6hodr711j@shell.armlinux.org.uk>
References: <aLg24RZ6hodr711j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1utmmY-00000001s13-0v5M@rmk-PC.armlinux.org.uk>
Date: Wed, 03 Sep 2025 13:40:10 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 11/11] net: stmmac: use
 STMMAC_CSR_xxx definitions in platform glue
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

Use the STMMAC_CSR_xxx definitions to initialise plat->clk_csr in the
platform glue drivers to make the integer values meaningful.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c    | 5 +++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 3 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c     | 5 +++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 3fac3945cbfa..d900b93f46ce 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -566,7 +566,8 @@ static int intel_mac_finish(struct net_device *ndev,
 
 static void common_default_data(struct plat_stmmacenet_data *plat)
 {
-	plat->clk_csr = 2;	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
+	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
+	plat->clk_csr = STMMAC_CSR_20_35M;
 	plat->has_gmac = 1;
 	plat->force_sf_dma_mode = 1;
 
@@ -613,7 +614,7 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 
 	plat->pdev = pdev;
 	plat->phy_addr = -1;
-	plat->clk_csr = 5;
+	plat->clk_csr = STMMAC_CSR_250_300M;
 	plat->has_gmac = 0;
 	plat->has_gmac4 = 1;
 	plat->force_sf_dma_mode = 0;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 6fca0fca4892..dd82dc2189e9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -90,7 +90,8 @@ static void loongson_default_data(struct pci_dev *pdev,
 	/* Get bus_id, this can be overwritten later */
 	plat->bus_id = pci_dev_id(pdev);
 
-	plat->clk_csr = 2;	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
+	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
+	plat->clk_csr = STMMAC_CSR_20_35M;
 	plat->has_gmac = 1;
 	plat->force_sf_dma_mode = 1;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index e6a7d0ddac2a..4e3aa611fda8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -21,7 +21,8 @@ struct stmmac_pci_info {
 
 static void common_default_data(struct plat_stmmacenet_data *plat)
 {
-	plat->clk_csr = 2;	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
+	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
+	plat->clk_csr = STMMAC_CSR_20_35M;
 	plat->has_gmac = 1;
 	plat->force_sf_dma_mode = 1;
 
@@ -74,7 +75,7 @@ static int snps_gmac5_default_data(struct pci_dev *pdev,
 {
 	int i;
 
-	plat->clk_csr = 5;
+	plat->clk_csr = STMMAC_CSR_250_300M;
 	plat->has_gmac4 = 1;
 	plat->force_sf_dma_mode = 1;
 	plat->flags |= STMMAC_FLAG_TSO_EN;
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
