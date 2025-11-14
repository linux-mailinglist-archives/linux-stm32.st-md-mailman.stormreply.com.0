Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39292C5DDD8
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Nov 2025 16:29:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 078D8C628DB;
	Fri, 14 Nov 2025 15:29:23 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02D58C628DA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 15:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3r9VUXikyV6de7PaLfY3kpgLTq1QMxYWUfuS+c81/nY=; b=yn6gjF/IAbqHZZ6uk0OkX+GYqx
 ghXigzEXPu7VHnf4AHSZz9vOeruq9dDP/t73D6SzdxBv5a78aYbsJXB9Ir0viHPGVPoUk9cyUuatO
 sLXNGfyv/p5NRr39/bndki+29q7yq/Bg3hEJ93bVNfhBrKVJVcdvg41QLUxEmamZPgTMVHs4VFecA
 KKIhwwoWFLXXX+V9nHXC7qfzPZBGkFGJhIc04lUewWmas/lRl7P701qhqjE7kEdfQucFBmNgKcDu2
 uGkJycM3xOwIQu9cy48ys0lGXuHWFhyti9G/t17yX5dXTsKzwr1tBhwDCWs38ruWTWsRHwQ0ttUpu
 eFppM5fw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58386 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vJvjc-00000000795-2RTO;
 Fri, 14 Nov 2025 15:29:12 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vJvja-0000000EVkI-0zUH; Fri, 14 Nov 2025 15:29:10 +0000
In-Reply-To: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
References: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vJvja-0000000EVkI-0zUH@rmk-PC.armlinux.org.uk>
Date: Fri, 14 Nov 2025 15:29:10 +0000
Cc: sophgo@lists.linux.dev, Inochi Amaoto <inochiama@gmail.com>,
 Chen Wang <unicorn_wang@outlook.com>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 10/11] net: stmmac: remove
 unnecessary .prio queue initialisation
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

stmmac_platform.c explicitly sets .prio to zero if the snps,priority
property is not present in DT for the queue. However, as the struct
is allocated using devm_kzalloc(), all members default to zero unless
explicitly initialised, and of_property_read_u32() will not write to
its argument if the property is not found. Thus, explicitly setting
these to zero is unnecessary. Remove these.

$ grep '\.prio =' *.c
stmmac_platform.c: plat->rx_queues_cfg[queue].prio = 0;
stmmac_platform.c: plat->tx_queues_cfg[queue].prio = 0;

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 4750843cf102..e769638586fe 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -181,12 +181,9 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 				     &plat->rx_queues_cfg[queue].chan);
 		/* TODO: Dynamic mapping to be included in the future */
 
-		if (of_property_read_u32(q_node, "snps,priority",
-					&plat->rx_queues_cfg[queue].prio)) {
-			plat->rx_queues_cfg[queue].prio = 0;
-		} else {
+		if (!of_property_read_u32(q_node, "snps,priority",
+					  &plat->rx_queues_cfg[queue].prio))
 			plat->rx_queues_cfg[queue].use_prio = true;
-		}
 
 		/* RX queue specific packet type routing */
 		if (of_property_read_bool(q_node, "snps,route-avcp"))
@@ -257,12 +254,9 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 			plat->tx_queues_cfg[queue].mode_to_use = MTL_QUEUE_DCB;
 		}
 
-		if (of_property_read_u32(q_node, "snps,priority",
-					&plat->tx_queues_cfg[queue].prio)) {
-			plat->tx_queues_cfg[queue].prio = 0;
-		} else {
+		if (!of_property_read_u32(q_node, "snps,priority",
+					  &plat->tx_queues_cfg[queue].prio))
 			plat->tx_queues_cfg[queue].use_prio = true;
-		}
 
 		plat->tx_queues_cfg[queue].coe_unsupported =
 			of_property_read_bool(q_node, "snps,coe-unsupported");
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
