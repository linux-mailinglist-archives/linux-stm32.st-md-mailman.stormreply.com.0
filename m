Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0241AA887C7
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Apr 2025 17:51:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B62D9C78028;
	Mon, 14 Apr 2025 15:51:49 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69E06C78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Apr 2025 15:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HhFzwgkdtFig+wSBVpbiTQ6PyiK1BHIb2bxLfvyCxnQ=; b=Wbl8gfonUQZznefGkRxyfoZSbu
 XayvzADa8sqk88ah+QtUcvFL0yjtwd9Uh8eyEICwpjndetOBUPoDA0JBnK4iKMsdfOhNmM+un+VDJ
 IxpfD2jYyC/FI2WoAOJVh46fjXy0oCffACU1we/+Fc78LhkyzpI/YHsuDjM+AqUpKACcVGUWQ8tgD
 N4LUjaBK5Xnyzdk8qCA0j9ZrXYWNTiZ9bziBUdzLxlHi+KNKjTE7BgH4RoB7bPogmnEaVwts6pamj
 SzCmSR5Q/qUUg7d997Ieid+JzBHU29ho1a8znibPA4M16MD3jsL40Hn1ZrMrrLBftNeY6oP769Aqs
 vLI5vW+g==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47062 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u4M63-0006oO-2G;
 Mon, 14 Apr 2025 16:51:43 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u4M5S-000YGJ-9K; Mon, 14 Apr 2025 16:51:06 +0100
In-Reply-To: <Z_0u9pA0Ziop-BuU@shell.armlinux.org.uk>
References: <Z_0u9pA0Ziop-BuU@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u4M5S-000YGJ-9K@rmk-PC.armlinux.org.uk>
Date: Mon, 14 Apr 2025 16:51:06 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: ingenic: convert to
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

As Ingenic now uses the stmmac platform PM ops, convert it to use
devm_stmmac_pltfr_probe() which will call the plat_dat->init() method
before stmmac_drv_probe() and appropriately cleaning up via the
->exit() method, thus simplifying the code. Using the devm_*()
variant also allows removal of the explicit call to
stmmac_pltfr_remove().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index 607e467324a4..15abe214131f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -290,11 +290,7 @@ static int ingenic_mac_probe(struct platform_device *pdev)
 	plat_dat->bsp_priv = mac;
 	plat_dat->init = ingenic_mac_init;
 
-	ret = ingenic_mac_init(pdev, mac);
-	if (ret)
-		return ret;
-
-	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
+	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
 static struct ingenic_soc_info jz4775_soc_info = {
@@ -345,7 +341,6 @@ MODULE_DEVICE_TABLE(of, ingenic_mac_of_matches);
 
 static struct platform_driver ingenic_mac_driver = {
 	.probe		= ingenic_mac_probe,
-	.remove		= stmmac_pltfr_remove,
 	.driver		= {
 		.name	= "ingenic-mac",
 		.pm		= &stmmac_pltfr_pm_ops,
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
