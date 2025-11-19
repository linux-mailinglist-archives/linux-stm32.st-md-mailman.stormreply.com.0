Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 113ACC6DF51
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Nov 2025 11:23:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D40D2C62D46;
	Wed, 19 Nov 2025 10:23:49 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97A21C62D37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 10:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Oc+BTgkWw06Qe/U/Krb8/5WErjmRQg/o4qCGvVNYK7A=; b=a4hoDT8dRM4AfR/LBhnIZEl8qk
 vRiWKtEtNgWJYLhgtXoaCo2X/WymyyJg1w2ryKE0weBsDj455cz4rWeze3xa6z5xJ70meHIocgTrK
 MTJu1F/1nEytjwNBa+rK5nK9Ow+GfcuLHkV7Id6aWotrAP/QndqWVUyALw/13OBCd3OUjdJzZfePW
 Sct2mKF7uJpho2BWd5zyvUhkNXrBcNMUn6bJ8wfXWLOg2GLC7x7wDj7jNXLfYBNl0caDkjQvkRgGy
 aTL86/aUWyqPJPU2Ly9ZDpnR3t5nkcc0Iw5tXOjcgECtM+PQgQNvbEpzPlNWbGW/s4G+ytPafonIa
 IUMhiIMg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41866 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vLfLi-000000004Vy-0x0m;
 Wed, 19 Nov 2025 10:23:42 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vLfLg-0000000FMbD-1vmh; Wed, 19 Nov 2025 10:23:40 +0000
In-Reply-To: <aR2aaDs6rqfu32B-@shell.armlinux.org.uk>
References: <aR2aaDs6rqfu32B-@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vLfLg-0000000FMbD-1vmh@rmk-PC.armlinux.org.uk>
Date: Wed, 19 Nov 2025 10:23:40 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 6/6] net: stmmac: remove axi_blen
	array
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

Remove the axi_blen array from struct stmmac_axi as we set this array,
and then immediately convert it ot the register value, never looking at
the array again. Thus, the array can be function local rather than part
of a run-time allocated long-lived struct.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c   | 11 ++---------
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c     |  3 ---
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c      |  4 ----
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c |  5 +++--
 include/linux/stmmac.h                                |  1 -
 5 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index bd06f26a27b4..d043bad4a862 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -38,8 +38,6 @@ static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
 {
 	struct device *dev = &pdev->dev;
 	u32 burst_map = 0;
-	u32 bit_index = 0;
-	u32 a_index = 0;
 
 	if (!plat_dat->axi) {
 		plat_dat->axi = devm_kzalloc(&pdev->dev,
@@ -83,13 +81,8 @@ static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
 	}
 	device_property_read_u32(dev, "snps,burst-map", &burst_map);
 
-	/* converts burst-map bitmask to burst array */
-	for (bit_index = 0; bit_index < 7; bit_index++)
-		if (burst_map & (1 << bit_index))
-			plat_dat->axi->axi_blen[a_index++] = 4 << bit_index;
-
-	stmmac_axi_blen_to_mask(&plat_dat->axi->axi_blen_regval,
-				plat_dat->axi->axi_blen, a_index);
+	plat_dat->axi->axi_blen_regval = FIELD_PREP(DMA_AXI_BLEN_MASK,
+						    burst_map);
 
 	/* dwc-qos needs GMAC4, AAL, TSO and PMT */
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index e94605d3d185..aad1be1ec4c1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -652,9 +652,6 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	plat->axi->axi_rd_osr_lmt = 1;
 	plat->axi->axi_blen_regval = DMA_AXI_BLEN4 | DMA_AXI_BLEN8 |
 				     DMA_AXI_BLEN16;
-	plat->axi->axi_blen[0] = 4;
-	plat->axi->axi_blen[1] = 8;
-	plat->axi->axi_blen[2] = 16;
 
 	plat->ptp_max_adj = plat->clk_ptp_rate;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index e1036150fae2..afb1c53ca6f8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -94,10 +94,6 @@ static int snps_gmac5_default_data(struct pci_dev *pdev,
 	plat->axi->axi_fb = false;
 	plat->axi->axi_blen_regval = DMA_AXI_BLEN4 | DMA_AXI_BLEN8 |
 				     DMA_AXI_BLEN16 | DMA_AXI_BLEN32;
-	plat->axi->axi_blen[0] = 4;
-	plat->axi->axi_blen[1] = 8;
-	plat->axi->axi_blen[2] = 16;
-	plat->axi->axi_blen[3] = 32;
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 656d4adedabe..8979a50b5507 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -95,6 +95,7 @@ static struct stmmac_axi *stmmac_axi_setup(struct platform_device *pdev)
 {
 	struct device_node *np;
 	struct stmmac_axi *axi;
+	u32 axi_blen[AXI_BLEN];
 
 	np = of_parse_phandle(pdev->dev.of_node, "snps,axi-config", 0);
 	if (!np)
@@ -117,8 +118,8 @@ static struct stmmac_axi *stmmac_axi_setup(struct platform_device *pdev)
 		axi->axi_wr_osr_lmt = 1;
 	if (of_property_read_u32(np, "snps,rd_osr_lmt", &axi->axi_rd_osr_lmt))
 		axi->axi_rd_osr_lmt = 1;
-	of_property_read_u32_array(np, "snps,blen", axi->axi_blen, AXI_BLEN);
-	stmmac_axi_blen_to_mask(&axi->axi_blen_regval, axi->axi_blen, AXI_BLEN);
+	of_property_read_u32_array(np, "snps,blen", axi_blen, AXI_BLEN);
+	stmmac_axi_blen_to_mask(&axi->axi_blen_regval, axi_blen, AXI_BLEN);
 	of_node_put(np);
 
 	return axi;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index d1a41fe0825f..f1054b9c2d8a 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -114,7 +114,6 @@ struct stmmac_axi {
 	u32 axi_rd_osr_lmt;
 	bool axi_kbbe;
 	u32 axi_blen_regval;
-	u32 axi_blen[AXI_BLEN];
 	bool axi_fb;
 	bool axi_mb;
 	bool axi_rb;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
