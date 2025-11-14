Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F018C5DDD5
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Nov 2025 16:29:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAE21C628DB;
	Fri, 14 Nov 2025 15:29:17 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E6FDC628DA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 15:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SFW/LxPmEG2Xn38+3bKdfD6oKQAadYeIexKVs/kjmvQ=; b=kIAE1ioYjOhffRl7lu/A/BhEZw
 jwOvfQT4kl0fAOfdGjWZ4syRTgpLaCtlTqMOBpvDhWYJxqSZ/yHKwNZzxXONLPGFRlxdRVyg/sUBz
 tU7XXLpYgm/ZrSS+e10YGeHCg9M1waYz6+kAV+w0ysb7OklKpjuQKQ87ZS48+yL19z9HzOwz+boWr
 9ngGskL1uQ8w0bKxrAnkQsvBBlswmYZSkle+RQGa2IFbnzxoDmZnoCUwogMt45gZX4ZMJFuUAryOY
 L2S01CUqyLYOIvhM3nFxVzOOEn3N66jXXK+HhP2odsdXRu50XiRZ1e0LG9FQJ6tEKuRjA5OpkYO44
 VkF4+02Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54276 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vJvjW-0000000078g-1XAT;
 Fri, 14 Nov 2025 15:29:06 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vJvjV-0000000EVkC-0WAV; Fri, 14 Nov 2025 15:29:05 +0000
In-Reply-To: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
References: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vJvjV-0000000EVkC-0WAV@rmk-PC.armlinux.org.uk>
Date: Fri, 14 Nov 2025 15:29:05 +0000
Cc: sophgo@lists.linux.dev, Inochi Amaoto <inochiama@gmail.com>,
 Chen Wang <unicorn_wang@outlook.com>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 09/11] net: stmmac: remove
 unnecessary .use_prio queue initialisation
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

Several drivers (see below) explicitly set the queue .use_prio
configuration to false. However, as this structure is allocated using
devm_kzalloc(), all members default to zero unless otherwise explicitly
initialised. .use_prio isn't, so defaults to false. Remove these
unnecessary initialisations, leaving stmmac_platform.c as the only
file that .use_prio is set true.

$ grep 'use_prio =' *.c
dwmac-intel.c: plat->tx_queues_cfg[0].use_prio = false;
dwmac-intel.c: plat->rx_queues_cfg[0].use_prio = false;
dwmac-intel.c: plat->rx_queues_cfg[i].use_prio = false;
dwmac-intel.c: plat->tx_queues_cfg[i].use_prio = false;
dwmac-loongson.c: plat->tx_queues_cfg[0].use_prio = false;
dwmac-loongson.c: plat->rx_queues_cfg[0].use_prio = false;
stmmac_pci.c: plat->tx_queues_cfg[0].use_prio = false;
stmmac_pci.c: plat->rx_queues_cfg[0].use_prio = false;
stmmac_pci.c: plat->tx_queues_cfg[i].use_prio = false;
stmmac_pci.c: plat->rx_queues_cfg[i].use_prio = false;
stmmac_platform.c: plat->rx_queues_cfg[queue].use_prio = false;
stmmac_platform.c: plat->rx_queues_cfg[queue].use_prio = true;
stmmac_platform.c: plat->tx_queues_cfg[queue].use_prio = false;
stmmac_platform.c: plat->tx_queues_cfg[queue].use_prio = true;

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c     | 9 ---------
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c  | 4 ----
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c      | 6 ------
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 --
 4 files changed, 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 1fd6faa0c70c..72f6acde544f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -570,10 +570,6 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 
 	plat->mdio_bus_data->needs_reset = true;
 
-	/* Disable Priority config by default */
-	plat->tx_queues_cfg[0].use_prio = false;
-	plat->rx_queues_cfg[0].use_prio = false;
-
 	/* Disable RX queues routing by default */
 	plat->rx_queues_cfg[0].pkt_route = 0x0;
 }
@@ -619,9 +615,6 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	for (i = 0; i < plat->rx_queues_to_use; i++) {
 		plat->rx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
 
-		/* Disable Priority config by default */
-		plat->rx_queues_cfg[i].use_prio = false;
-
 		/* Disable RX queues routing by default */
 		plat->rx_queues_cfg[i].pkt_route = 0x0;
 	}
@@ -629,8 +622,6 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	for (i = 0; i < plat->tx_queues_to_use; i++) {
 		plat->tx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
 
-		/* Disable Priority config by default */
-		plat->tx_queues_cfg[i].use_prio = false;
 		/* Default TX Q0 to use TSO and rest TXQ for TBS */
 		if (i > 0)
 			plat->tx_queues_cfg[i].tbs_en = 1;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index ed5e9ca738bf..c64a24bb060f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -98,10 +98,6 @@ static void loongson_default_data(struct pci_dev *pdev,
 	/* Increase the default value for multicast hash bins */
 	plat->multicast_filter_bins = 256;
 
-	/* Disable Priority config by default */
-	plat->tx_queues_cfg[0].use_prio = false;
-	plat->rx_queues_cfg[0].use_prio = false;
-
 	/* Disable RX queues routing by default */
 	plat->rx_queues_cfg[0].pkt_route = 0x0;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index ded44846f74a..2f45b7986903 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -28,10 +28,6 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 
 	plat->mdio_bus_data->needs_reset = true;
 
-	/* Disable Priority config by default */
-	plat->tx_queues_cfg[0].use_prio = false;
-	plat->rx_queues_cfg[0].use_prio = false;
-
 	/* Disable RX queues routing by default */
 	plat->rx_queues_cfg[0].pkt_route = 0x0;
 }
@@ -74,7 +70,6 @@ static int snps_gmac5_default_data(struct pci_dev *pdev,
 
 	plat->tx_sched_algorithm = MTL_TX_ALGORITHM_WRR;
 	for (i = 0; i < plat->tx_queues_to_use; i++) {
-		plat->tx_queues_cfg[i].use_prio = false;
 		plat->tx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
 		plat->tx_queues_cfg[i].weight = 25;
 		if (i > 0)
@@ -83,7 +78,6 @@ static int snps_gmac5_default_data(struct pci_dev *pdev,
 
 	plat->rx_sched_algorithm = MTL_RX_ALGORITHM_SP;
 	for (i = 0; i < plat->rx_queues_to_use; i++) {
-		plat->rx_queues_cfg[i].use_prio = false;
 		plat->rx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
 		plat->rx_queues_cfg[i].pkt_route = 0x0;
 	}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 7eb22511acf5..4750843cf102 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -184,7 +184,6 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 		if (of_property_read_u32(q_node, "snps,priority",
 					&plat->rx_queues_cfg[queue].prio)) {
 			plat->rx_queues_cfg[queue].prio = 0;
-			plat->rx_queues_cfg[queue].use_prio = false;
 		} else {
 			plat->rx_queues_cfg[queue].use_prio = true;
 		}
@@ -261,7 +260,6 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 		if (of_property_read_u32(q_node, "snps,priority",
 					&plat->tx_queues_cfg[queue].prio)) {
 			plat->tx_queues_cfg[queue].prio = 0;
-			plat->tx_queues_cfg[queue].use_prio = false;
 		} else {
 			plat->tx_queues_cfg[queue].use_prio = true;
 		}
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
