Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56842A8A427
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 18:30:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C08BC78023;
	Tue, 15 Apr 2025 16:30:13 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 979E1CFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 16:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OSNFXUitTBQmBWJf8ItL/iUtTikNWM/6SKlHYshO2Eo=; b=kzCjuU/B23MPb3sv40S02ftkml
 7OwG1tLDmV/hKnUsmNKynV3BEisSYlOWnS6rJs/4MbUiOXcNHIv9ZxDP1h+zetgB4J/AXcdzwOtYu
 gVQgunW/21kD+KYsjND/tarMIVCjHVm5J74WBIxAlAhn9XZutV8Uww5tzTZPsQlQ90iEy8OUv7I5k
 jvnnRtmT/lIlo9YPCUULADz4Hnta5jFAnrsnE2EVZCEJOBSXboS4kPy69UVBQO4fDZbsFZInOc4/m
 PI2edD1IA+OhzIu+iy6XCTfn542/bmE+aQzorpBayt47Yoo4AkC8HCpvPdu4x0HOe6unBXLt2oSO2
 RS3SG5sg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54230 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u4jAj-0008UJ-0a;
 Tue, 15 Apr 2025 17:30:05 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u4jA7-000r1h-5I; Tue, 15 Apr 2025 17:29:27 +0100
In-Reply-To: <Z_6JaPBiGu_RB4xN@shell.armlinux.org.uk>
References: <Z_6JaPBiGu_RB4xN@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u4jA7-000r1h-5I@rmk-PC.armlinux.org.uk>
Date: Tue, 15 Apr 2025 17:29:27 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 5/5] net: stmmac: socfpga: convert to
 devm_stmmac_pltfr_probe()
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

Convert socfpga to use devm_stmmac_pltfr_probe() to further simplify
the probe function, wrapping the call to the set_phy_mode() method
into socfpga_dwmac_init() which can be called from the plat_dat->init()
method. Also call this from socfpga_dwmac_resume() thereby simplifying
that function.

Using the devm variant also means we can remove the call to
stmmac_pltfr_remove().

Unfortunately, we can't also convert to stmmac_pltfr_pm_ops as there is
extra work done in socfpga_dwmac_resume().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 251d8b72bed5..8e6d780669b9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -501,11 +501,7 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 
 	plat_dat->riwt_off = 1;
 
-	ret = socfpga_dwmac_init(pdev, dwmac);
-	if (ret)
-		return ret;
-
-	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
+	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
 static const struct socfpga_dwmac_ops socfpga_gen5_ops = {
@@ -525,7 +521,6 @@ MODULE_DEVICE_TABLE(of, socfpga_dwmac_match);
 
 static struct platform_driver socfpga_dwmac_driver = {
 	.probe  = socfpga_dwmac_probe,
-	.remove = stmmac_pltfr_remove,
 	.driver = {
 		.name           = "socfpga-dwmac",
 		.pm		= &stmmac_pltfr_pm_ops,
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
