Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 553AFA86D9C
	for <lists+linux-stm32@lfdr.de>; Sat, 12 Apr 2025 16:17:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B197C78F77;
	Sat, 12 Apr 2025 14:17:55 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC200C78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Apr 2025 14:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PRH5oh1QX3s2+jHLBPnvV1CmrUbx5sVHTAOGvwTjYkg=; b=mW5fhlfdh7UKr3dxkZPwaozsLP
 2ZqHku6BZBa6k2qgLhoEYGOlWQB00oGi/7ZmlzaxMHgUduhYmX++kl9o7fpIs2SV/4OEC8xzbRTaz
 RyWjrCHRUe9bZR1rVHadPSKex9os7+PTCbomKbS96vPOI8ihDbQuWuraxIDnHYLsbxsJJuZ+uKACC
 osGJ+nomAW2PSaP/cd0Hxs/LWNpMj+gdpdyuHa3M82eqMNFLvy9BATcJxM/g1Mxo+31AU0ZzbozXp
 tphp5SFNZsVHyJLkKFjXIyyS/JO9st971tD78FTdvSVBgdG18i78kGn02JzR7CeVTqBxBrUPiToHi
 HZRpafZw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33250 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u3bg6-0004co-00;
 Sat, 12 Apr 2025 15:17:50 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u3bfU-000Em3-Mh; Sat, 12 Apr 2025 15:17:12 +0100
In-Reply-To: <Z_p16taXJ1sOo4Ws@shell.armlinux.org.uk>
References: <Z_p16taXJ1sOo4Ws@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u3bfU-000Em3-Mh@rmk-PC.armlinux.org.uk>
Date: Sat, 12 Apr 2025 15:17:12 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 4/4] net: stmmac: anarion: use
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

Convert anarion to use devm_stmmac_pltfr_probe() which allows the
removal of an explicit call to stmmac_pltfr_remove().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
index 8bbedf32d512..84072c8ed741 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
@@ -113,7 +113,7 @@ static int anarion_dwmac_probe(struct platform_device *pdev)
 	plat_dat->exit = anarion_gmac_exit;
 	plat_dat->bsp_priv = gmac;
 
-	return stmmac_pltfr_probe(&pdev->dev, plat_dat, &stmmac_res);
+	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
 static const struct of_device_id anarion_dwmac_match[] = {
@@ -124,7 +124,6 @@ MODULE_DEVICE_TABLE(of, anarion_dwmac_match);
 
 static struct platform_driver anarion_dwmac_driver = {
 	.probe  = anarion_dwmac_probe,
-	.remove = stmmac_pltfr_remove,
 	.driver = {
 		.name           = "anarion-dwmac",
 		.pm		= &stmmac_pltfr_pm_ops,
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
