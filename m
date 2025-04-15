Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 455CBA8A469
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 18:43:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0ACF3C78023;
	Tue, 15 Apr 2025 16:43:18 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF163CFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 16:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6j3qmk+PLNPRkwcbnRoXCkpFbV5l4jb32cwoTVChRAA=; b=dWVPmuqLkjRgDS4eABop1SUB+d
 j1kPQn2IN8b3fUtMYxTdiwHgw7Vj4k6Lt+pS4fofFOMk+VeOhohtBPX0PFbrbPJNiBNP53l0zz51g
 RQ6lAp2vQNgK+9RAXIKc9C8kOaGRWSyRgqYZOaaOaTsHYsqkJ5JWAGuRqjnaHioFFGivvPx0nYybZ
 uG2cC+17xP5j7/9/al5rBM0ztUnWyFzT5VgfpThJLlqFJWEdfkfvLYMbGiH/92jAIoyU9oF1a3DHJ
 zZKQJbh2Yrn4sjb9+mw2N+jdkjHj3EAcmjaSN7PwkDLJNDnFPNGffIK0NITKYeYC7axug2SJL226q
 KRPpytgA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44024 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u4jNP-0008WK-2D;
 Tue, 15 Apr 2025 17:43:11 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u4jMo-000rCS-6f; Tue, 15 Apr 2025 17:42:34 +0100
In-Reply-To: <Z_6Mfx_SrionoU-e@shell.armlinux.org.uk>
References: <Z_6Mfx_SrionoU-e@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u4jMo-000rCS-6f@rmk-PC.armlinux.org.uk>
Date: Tue, 15 Apr 2025 17:42:34 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: sti: convert to
	stmmac_pltfr_pm_ops
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

As we now have the plat_dat->init()/plat_dat->exit() populated which
have the required functionality on suspend/resume, we can now use
stmmac_pltfr_pm_ops which has methods that call these two functions.
Switch over to use this.

Doing so also fills in the runtime PM ops and _noirq variants as well.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-sti.c   | 25 +------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index b6e09bd33894..53d5ce1f6dc6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -298,29 +298,6 @@ static int sti_dwmac_probe(struct platform_device *pdev)
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
-static int sti_dwmac_suspend(struct device *dev)
-{
-	struct sti_dwmac *dwmac = get_stmmac_bsp_priv(dev);
-	int ret = stmmac_suspend(dev);
-
-	clk_disable_unprepare(dwmac->clk);
-
-	return ret;
-}
-
-static int sti_dwmac_resume(struct device *dev)
-{
-	struct sti_dwmac *dwmac = get_stmmac_bsp_priv(dev);
-
-	clk_prepare_enable(dwmac->clk);
-	sti_dwmac_set_mode(dwmac);
-
-	return stmmac_resume(dev);
-}
-
-static DEFINE_SIMPLE_DEV_PM_OPS(sti_dwmac_pm_ops, sti_dwmac_suspend,
-						  sti_dwmac_resume);
-
 static const struct sti_dwmac_of_data stih4xx_dwmac_data = {
 	.fix_retime_src = stih4xx_fix_retime_src,
 };
@@ -335,7 +312,7 @@ static struct platform_driver sti_dwmac_driver = {
 	.probe  = sti_dwmac_probe,
 	.driver = {
 		.name           = "sti-dwmac",
-		.pm		= pm_sleep_ptr(&sti_dwmac_pm_ops),
+		.pm		= &stmmac_pltfr_pm_ops,
 		.of_match_table = sti_dwmac_match,
 	},
 };
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
