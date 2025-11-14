Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9D7C5DDD0
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Nov 2025 16:29:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D812CC628DB;
	Fri, 14 Nov 2025 15:29:12 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2529EC628DA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 15:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a0WNm/k80ZdUbTFrY4lhhjuU7jTScXWOul74/Cv3Qjw=; b=L2KH/+3pp+bS+m0JW0xqQpSlhr
 OGtFaHtn1XwuMozy66DQeK/6ixM4TFazIuPUTl8E9eUK95pPoSN3XKXmuG6Gg6k9g9xWwsMp5N6HY
 N4aWRoRv30pUbf2+j5ds5exFy33xw/cVkOzmXtUPjXXalhvDBNOgNSeeCTGdmpXXPmjGrEWZBnTlX
 FRdIKS78RF4Uv7Z/BE0wAfvt4iaDNY8bwEL20OVED1uxskzjVInb1u3tqE+FEii/E1DfAFwwHBR+O
 qUs8wO08298tSXn4t02YUVHxcLwyxcpc0VygN6hDPyCvHGQoQiOXoJPhkG5NK3IEbfL9T0VrEI3AE
 5CNjGvsw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54260 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vJvjR-0000000078P-2f3b;
 Fri, 14 Nov 2025 15:29:01 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vJvjQ-0000000EVk6-05z7; Fri, 14 Nov 2025 15:29:00 +0000
In-Reply-To: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
References: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vJvjQ-0000000EVk6-05z7@rmk-PC.armlinux.org.uk>
Date: Fri, 14 Nov 2025 15:29:00 +0000
Cc: sophgo@lists.linux.dev, Inochi Amaoto <inochiama@gmail.com>,
 Chen Wang <unicorn_wang@outlook.com>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 08/11] net: stmmac: setup default RX
 channel map in stmmac_plat_dat_alloc()
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

Setup the default 1:1 RX channel map in stmmac_plat_dat_alloc() and
remove 1:1 initialisations from platform glue drivers.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c     | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 5 +++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c      | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 5 ++---
 4 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 55f97b2f4e04..1fd6faa0c70c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -618,7 +618,6 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 
 	for (i = 0; i < plat->rx_queues_to_use; i++) {
 		plat->rx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
-		plat->rx_queues_cfg[i].chan = i;
 
 		/* Disable Priority config by default */
 		plat->rx_queues_cfg[i].use_prio = false;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c7763db011d6..d08ff8f5ff15 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7558,6 +7558,7 @@ static void stmmac_unregister_devlink(struct stmmac_priv *priv)
 struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev)
 {
 	struct plat_stmmacenet_data *plat_dat;
+	int i;
 
 	plat_dat = devm_kzalloc(dev, sizeof(*plat_dat), GFP_KERNEL);
 	if (!plat_dat)
@@ -7580,6 +7581,10 @@ struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev)
 	plat_dat->tx_queues_to_use = 1;
 	plat_dat->rx_queues_to_use = 1;
 
+	/* Setup the default RX queue channel map */
+	for (i = 0; i < ARRAY_SIZE(plat_dat->rx_queues_cfg); i++)
+		plat_dat->rx_queues_cfg[i].chan = i;
+
 	return plat_dat;
 }
 EXPORT_SYMBOL_GPL(stmmac_plat_dat_alloc);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 8c7188ff658b..ded44846f74a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -86,7 +86,6 @@ static int snps_gmac5_default_data(struct pci_dev *pdev,
 		plat->rx_queues_cfg[i].use_prio = false;
 		plat->rx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
 		plat->rx_queues_cfg[i].pkt_route = 0x0;
-		plat->rx_queues_cfg[i].chan = i;
 	}
 
 	plat->bus_id = 1;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index e1e23ee0b48e..7eb22511acf5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -177,9 +177,8 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 		else
 			plat->rx_queues_cfg[queue].mode_to_use = MTL_QUEUE_DCB;
 
-		if (of_property_read_u32(q_node, "snps,map-to-dma-channel",
-					 &plat->rx_queues_cfg[queue].chan))
-			plat->rx_queues_cfg[queue].chan = queue;
+		of_property_read_u32(q_node, "snps,map-to-dma-channel",
+				     &plat->rx_queues_cfg[queue].chan);
 		/* TODO: Dynamic mapping to be included in the future */
 
 		if (of_property_read_u32(q_node, "snps,priority",
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
