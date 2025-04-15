Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07806A8A420
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 18:29:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4FE8C78023;
	Tue, 15 Apr 2025 16:29:48 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D0B0C7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 16:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z8hTSVnlcCC2WOnj66TO/Zt9nedPd+37sOl0zL+RseU=; b=cv+yuFcdgRsHPbn6xvXd3cs8vi
 54sX8Ma38PHYUmmoHY9kT3b1LiWcyoY2h8dravFRaeA/O0hh0Z3Eph7FKNeb5c+aFHICwA7GC13np
 CqTvKQoUfm0CPY14ofnHiPhfWV7zgvYPk0idwz10fXSzdH/HS3/K70sVamtILY8sHajeiuA+oWTmD
 u83G6tv8IUH4D161dwjGn3k3r/EBUqJCbMlCgfsN8h0eM8vZW0ZZX3JdBol9h9hDcZM1nGXgb3NOs
 NtxsytLX+iQrkgLXNnS1B7M07IPYAUvDBS3MSrSqAy2MIVZxNphM3Lo/aEBE6Wvgm4soFkzYlQzVB
 cw9KEWEQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39600 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u4jAO-0008TK-0P;
 Tue, 15 Apr 2025 17:29:44 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u4j9m-000r1J-Nu; Tue, 15 Apr 2025 17:29:06 +0100
In-Reply-To: <Z_6JaPBiGu_RB4xN@shell.armlinux.org.uk>
References: <Z_6JaPBiGu_RB4xN@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u4j9m-000r1J-Nu@rmk-PC.armlinux.org.uk>
Date: Tue, 15 Apr 2025 17:29:06 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/5] net: stmmac: socfpga: init
 dwmac->stmmac_rst before registration
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

Initialisation/setup after registration is a bug. This is the first of
two patches fixing this in socfpga.

dwmac->stmmac_rst is initialised from the stmmac plat_dat's stmmac_rst
member, which is itself initialised by devm_stmmac_probe_config_dt().
Therefore, this can be initialised before we call stmmac_dvr_probe().
Move it there.

dwmac->stmmac_rst is used by the set_phy_mode() method.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 116855658559..bcdb25ee2a33 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -442,8 +442,6 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 	struct device		*dev = &pdev->dev;
 	int			ret;
 	struct socfpga_dwmac	*dwmac;
-	struct net_device	*ndev;
-	struct stmmac_priv	*stpriv;
 	const struct socfpga_dwmac_ops *ops;
 
 	ops = device_get_match_data(&pdev->dev);
@@ -479,7 +477,13 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* The socfpga driver needs to control the stmmac reset to set the phy
+	 * mode. Create a copy of the core reset handle so it can be used by
+	 * the driver later.
+	 */
+	dwmac->stmmac_rst = plat_dat->stmmac_rst;
 	dwmac->ops = ops;
+
 	plat_dat->bsp_priv = dwmac;
 	plat_dat->fix_mac_speed = socfpga_dwmac_fix_mac_speed;
 	plat_dat->pcs_init = socfpga_dwmac_pcs_init;
@@ -493,15 +497,6 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ndev = platform_get_drvdata(pdev);
-	stpriv = netdev_priv(ndev);
-
-	/* The socfpga driver needs to control the stmmac reset to set the phy
-	 * mode. Create a copy of the core reset handle so it can be used by
-	 * the driver later.
-	 */
-	dwmac->stmmac_rst = stpriv->plat->stmmac_rst;
-
 	ret = ops->set_phy_mode(dwmac);
 	if (ret)
 		goto err_dvr_remove;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
