Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49710C5DDDB
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Nov 2025 16:29:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 145C6C628DB;
	Fri, 14 Nov 2025 15:29:27 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25860C628DA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 15:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qmAr7y1MZIR7+UMwfpzen+bn9PyappMKRUAOO+ujmB0=; b=MLVrMTf4O/qqzJTMxOQnuOj8K0
 cmyBJ65/oaZbjSaRY+CfruCbgSfG9Dze66kdVsNBnMrfsmtHlfmZLv5hUxJQRnPoKpuT1wEfLybk7
 mK7mcfC9K9pJXie7IOkXZL2wLZb/SuE2JigLEVDfF4ByYjg/gb4D5Gr1fZlutfa/cQIlq4bSwPNQF
 RrTCfbZEhJnw/rK+PQOKJfveRVD2Lp2aUMthPwnnMbKCfeDHiWzG/OTGTUqGmTn7F55H7fFYuEOkp
 5b3+A4rATAPtjujPtlb6Qxml3R5BwfGxEVCnhD5EahynJvS8ylhaAHKeWIRSVaQ3gKKRaRcEEl+K+
 SiQNTjBw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58390 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vJvjh-0000000079N-1Iao;
 Fri, 14 Nov 2025 15:29:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vJvjf-0000000EVkO-1ZaO; Fri, 14 Nov 2025 15:29:15 +0000
In-Reply-To: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
References: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vJvjf-0000000EVkO-1ZaO@rmk-PC.armlinux.org.uk>
Date: Fri, 14 Nov 2025 15:29:15 +0000
Cc: sophgo@lists.linux.dev, Inochi Amaoto <inochiama@gmail.com>,
 Chen Wang <unicorn_wang@outlook.com>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 11/11] net: stmmac: remove
 unnecessary .pkt_route queue initialisation
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

PCI drivers explicitly set .pkt_route to zero. However, as the struct
is allocated using devm_kzalloc(), all members default to zero unless
explicitly initialised. Thus, explicitly setting these to zero is
unnecessary. Remove these. This leaves only stmmac_platform.c where
this is explicitly initialised depending on DT properties.

$ grep '\.pkt_route =' *.c
dwmac-intel.c: plat->rx_queues_cfg[0].pkt_route = 0x0;
dwmac-intel.c: plat->rx_queues_cfg[i].pkt_route = 0x0;
dwmac-loongson.c: plat->rx_queues_cfg[0].pkt_route = 0x0;
stmmac_main.c: if (priv->plat->rx_queues_cfg[queue].pkt_route == 0x0)
stmmac_pci.c: plat->rx_queues_cfg[0].pkt_route = 0x0;
stmmac_pci.c: plat->rx_queues_cfg[i].pkt_route = 0x0;
stmmac_platform.c: plat->rx_queues_cfg[queue].pkt_route = PACKET_AVCPQ;
stmmac_platform.c: plat->rx_queues_cfg[queue].pkt_route = PACKET_PTPQ;
stmmac_platform.c: plat->rx_queues_cfg[queue].pkt_route = PACKET_DCBCPQ;
stmmac_platform.c: plat->rx_queues_cfg[queue].pkt_route = PACKET_UPQ;
stmmac_platform.c: plat->rx_queues_cfg[queue].pkt_route = PACKET_MCBCQ;
stmmac_platform.c: plat->rx_queues_cfg[queue].pkt_route = 0x0;

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c     | 9 +--------
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c  | 3 ---
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c      | 7 +------
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 --
 4 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 72f6acde544f..8938e7a59925 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -569,9 +569,6 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 	plat->force_sf_dma_mode = 1;
 
 	plat->mdio_bus_data->needs_reset = true;
-
-	/* Disable RX queues routing by default */
-	plat->rx_queues_cfg[0].pkt_route = 0x0;
 }
 
 static struct phylink_pcs *intel_mgbe_select_pcs(struct stmmac_priv *priv,
@@ -612,13 +609,9 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 
 	plat->rx_sched_algorithm = MTL_RX_ALGORITHM_SP;
 
-	for (i = 0; i < plat->rx_queues_to_use; i++) {
+	for (i = 0; i < plat->rx_queues_to_use; i++)
 		plat->rx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
 
-		/* Disable RX queues routing by default */
-		plat->rx_queues_cfg[i].pkt_route = 0x0;
-	}
-
 	for (i = 0; i < plat->tx_queues_to_use; i++) {
 		plat->tx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index c64a24bb060f..5f9472f47e35 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -98,9 +98,6 @@ static void loongson_default_data(struct pci_dev *pdev,
 	/* Increase the default value for multicast hash bins */
 	plat->multicast_filter_bins = 256;
 
-	/* Disable RX queues routing by default */
-	plat->rx_queues_cfg[0].pkt_route = 0x0;
-
 	plat->clk_ref_rate = 125000000;
 	plat->clk_ptp_rate = 125000000;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 2f45b7986903..2fd4660838bb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -27,9 +27,6 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 	plat->force_sf_dma_mode = 1;
 
 	plat->mdio_bus_data->needs_reset = true;
-
-	/* Disable RX queues routing by default */
-	plat->rx_queues_cfg[0].pkt_route = 0x0;
 }
 
 static int stmmac_default_data(struct pci_dev *pdev,
@@ -77,10 +74,8 @@ static int snps_gmac5_default_data(struct pci_dev *pdev,
 	}
 
 	plat->rx_sched_algorithm = MTL_RX_ALGORITHM_SP;
-	for (i = 0; i < plat->rx_queues_to_use; i++) {
+	for (i = 0; i < plat->rx_queues_to_use; i++)
 		plat->rx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
-		plat->rx_queues_cfg[i].pkt_route = 0x0;
-	}
 
 	plat->bus_id = 1;
 	plat->phy_interface = PHY_INTERFACE_MODE_GMII;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index e769638586fe..1fefa6c55db1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -196,8 +196,6 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 			plat->rx_queues_cfg[queue].pkt_route = PACKET_UPQ;
 		else if (of_property_read_bool(q_node, "snps,route-multi-broad"))
 			plat->rx_queues_cfg[queue].pkt_route = PACKET_MCBCQ;
-		else
-			plat->rx_queues_cfg[queue].pkt_route = 0x0;
 
 		queue++;
 	}
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
