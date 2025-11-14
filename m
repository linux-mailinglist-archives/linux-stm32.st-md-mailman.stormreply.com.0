Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F65C5DDAC
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Nov 2025 16:28:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CE7AC628DD;
	Fri, 14 Nov 2025 15:28:45 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F931C06935
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 15:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Twus3sbrBSG7NY/CIFTfFSuDbIZ0IfgbuuTAgR3/MuY=; b=f+2PkKjcyy0ZBt+PQ+qC5DuZpm
 LR6aELWhmN121eH9u1WrcaH/3M/jFdUpLigQfEJ8XMHbBrHs1c/NNqiMx78+jEiZk9G0Dgx69YWNz
 VAKW/s9wYIBiHm6YHuQNgzWcBEXYy9+Qy6dFZnF4NQuAnfqOP6D8PZMBCcTfq7QNd69KuGiGBIdNa
 FEMulAkxlJMI85h+oDOmTp3TGH8z6maWTvKgp3IeFMDvYpdbDkypgZWn0pAlea+4zg2GwL3jYc/ty
 08MsZ6zwcnhZIoVoAG312whj+SsMjKxfrP7JeAb505AI2lJLJSvCtXy2FpZwBxqv7BMsEBNNk0ctj
 aM0DcADA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36184 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vJvj1-0000000076b-2knP;
 Fri, 14 Nov 2025 15:28:35 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vJvj0-0000000EVjb-1jDh; Fri, 14 Nov 2025 15:28:34 +0000
In-Reply-To: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
References: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vJvj0-0000000EVjb-1jDh@rmk-PC.armlinux.org.uk>
Date: Fri, 14 Nov 2025 15:28:34 +0000
Cc: sophgo@lists.linux.dev, Inochi Amaoto <inochiama@gmail.com>,
 Chen Wang <unicorn_wang@outlook.com>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 03/11] net: stmmac: move
 initialisation of clk_csr to stmmac_plat_dat_alloc()
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

Move the default initialisation of plat_dat->clk_csr to
stmmac_plat_dat_alloc().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 5 -----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1851f7d0702d..a36e8a90fcaa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7565,8 +7565,10 @@ struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev)
 
 	/* Set the defaults:
 	 * - phy autodetection
+	 * - determine GMII_Address CR field from CSR clock
 	 */
 	plat_dat->phy_addr = -1;
+	plat_dat->clk_csr = -1;
 
 	return plat_dat;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 745032fd46ce..fe3d95274fd6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -480,11 +480,6 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		plat->bus_id = ++bus_id;
 	}
 
-
-	/* Default to get clk_csr from stmmac_clk_csr_set(),
-	 * or get clk_csr from device tree.
-	 */
-	plat->clk_csr = -1;
 	if (of_property_read_u32(np, "snps,clk-csr", &plat->clk_csr))
 		of_property_read_u32(np, "clk_csr", &plat->clk_csr);
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
