Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E714FC5DDCC
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Nov 2025 16:29:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5225C628DB;
	Fri, 14 Nov 2025 15:29:04 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA4F2C628DA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 15:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AquconHEIJAwbiIZH5fqQ151rEPqPKiiSR5CO6WNK3k=; b=qeYYC9YCDFLglLR0jkUfXPziRK
 vpOdHJ+ZXzM48FRjqtW82Bp6/9tHqWxC9Zv02FAvjEmJx44HC6KkkQPZNk5lsTLU5qIG/aQNGUK9q
 ASZ0KkWQhlxoZdvGLXgb2qqGnEZp6dZDaDd0HddWb4tH8VjYaAYP3wTuyo8qPC5DpgL4nyBPVCI90
 1vIA0JPBLYmaLC2YLzy/F04bLHfT6lX6w32OC16kMwS2p8yECwC7wtmh9cmHptW+Y0u1aoVklbhVl
 J3jI8y9ExNUOpICSiGj3x+Us46PTRWWwIAkWPp/tT/lGf/d5GqcTfX204fT5crkueCQDe58hKAp2x
 an85qAAQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39552 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vJvjM-00000000782-0LRY;
 Fri, 14 Nov 2025 15:28:56 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vJvjK-0000000EVk0-3qb2; Fri, 14 Nov 2025 15:28:54 +0000
In-Reply-To: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
References: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vJvjK-0000000EVk0-3qb2@rmk-PC.armlinux.org.uk>
Date: Fri, 14 Nov 2025 15:28:54 +0000
Cc: sophgo@lists.linux.dev, Inochi Amaoto <inochiama@gmail.com>,
 Chen Wang <unicorn_wang@outlook.com>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 07/11] net: stmmac: move
 initialisation of queues_to_use to stmmac_plat_dat_alloc()
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

Move the default initialisation of plat_dat->tx_queues_to_use and
plat_dat->rx_queues_to_use to 1 to stmmac_plat_dat_alloc(). This means
platform glue only needs to override this if different.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c   |  4 ----
 .../ethernet/stmicro/stmmac/dwmac-loongson.c    |  2 --
 .../net/ethernet/stmicro/stmmac/stmmac_main.c   |  4 ++++
 .../net/ethernet/stmicro/stmmac/stmmac_pci.c    |  4 ----
 .../ethernet/stmicro/stmmac/stmmac_platform.c   | 17 ++++-------------
 5 files changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index de07cca2e625..55f97b2f4e04 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -570,10 +570,6 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 
 	plat->mdio_bus_data->needs_reset = true;
 
-	/* Set default number of RX and TX queues to use */
-	plat->tx_queues_to_use = 1;
-	plat->rx_queues_to_use = 1;
-
 	/* Disable Priority config by default */
 	plat->tx_queues_cfg[0].use_prio = false;
 	plat->rx_queues_cfg[0].use_prio = false;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 99b2d2deaceb..ed5e9ca738bf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -131,8 +131,6 @@ static void loongson_default_data(struct pci_dev *pdev,
 		break;
 	default:
 		ld->multichan = 0;
-		plat->tx_queues_to_use = 1;
-		plat->rx_queues_to_use = 1;
 		break;
 	}
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1d12835d14ce..c7763db011d6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7576,6 +7576,10 @@ struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev)
 	plat_dat->multicast_filter_bins = HASH_TABLE_SIZE;
 	plat_dat->unicast_filter_entries = 1;
 
+	/* Set the mtl defaults */
+	plat_dat->tx_queues_to_use = 1;
+	plat_dat->rx_queues_to_use = 1;
+
 	return plat_dat;
 }
 EXPORT_SYMBOL_GPL(stmmac_plat_dat_alloc);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index aea615e76dac..8c7188ff658b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -28,10 +28,6 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 
 	plat->mdio_bus_data->needs_reset = true;
 
-	/* Set default number of RX and TX queues to use */
-	plat->tx_queues_to_use = 1;
-	plat->rx_queues_to_use = 1;
-
 	/* Disable Priority config by default */
 	plat->tx_queues_cfg[0].use_prio = false;
 	plat->rx_queues_cfg[0].use_prio = false;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 314cb3e720fd..e1e23ee0b48e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -137,13 +137,6 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 	u8 queue = 0;
 	int ret = 0;
 
-	/* For backwards-compatibility with device trees that don't have any
-	 * snps,mtl-rx-config or snps,mtl-tx-config properties, we fall back
-	 * to one RX and TX queues each.
-	 */
-	plat->rx_queues_to_use = 1;
-	plat->tx_queues_to_use = 1;
-
 	/* First Queue must always be in DCB mode. As MTL_QUEUE_DCB = 1 we need
 	 * to always set this, otherwise Queue will be classified as AVB
 	 * (because MTL_QUEUE_AVB = 0).
@@ -162,9 +155,8 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 	}
 
 	/* Processing RX queues common config */
-	if (of_property_read_u32(rx_node, "snps,rx-queues-to-use",
-				 &plat->rx_queues_to_use))
-		plat->rx_queues_to_use = 1;
+	of_property_read_u32(rx_node, "snps,rx-queues-to-use",
+			     &plat->rx_queues_to_use);
 
 	if (of_property_read_bool(rx_node, "snps,rx-sched-sp"))
 		plat->rx_sched_algorithm = MTL_RX_ALGORITHM_SP;
@@ -221,9 +213,8 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 	}
 
 	/* Processing TX queues common config */
-	if (of_property_read_u32(tx_node, "snps,tx-queues-to-use",
-				 &plat->tx_queues_to_use))
-		plat->tx_queues_to_use = 1;
+	of_property_read_u32(tx_node, "snps,tx-queues-to-use",
+			     &plat->tx_queues_to_use);
 
 	if (of_property_read_bool(tx_node, "snps,tx-sched-wrr"))
 		plat->tx_sched_algorithm = MTL_TX_ALGORITHM_WRR;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
