Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41293A8A467
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 18:43:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3911C78023;
	Tue, 15 Apr 2025 16:43:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7C82CFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 16:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3D1RJ0/Ps/DvFGgzYJpHiZKHJVAnkqEv0/IjI/ebBHM=; b=qKUEAxtBHWydPkd/XUkJulqAuq
 USPeyYYN9yYJ+kE4Io4U/4NCtbXseSPJbQh1d855r/jVbfGK5MGB3/LtFBVyGngH4OXZh7XJoFcC8
 +2Jof+xiTsFMEm21T4txvRrZxx0k+UqA+/e/gwF9qmu8A60ILslyaAJyHp8lZu84ALBs6vmAnOLJa
 hMEV+TwLVNttPutLTAULdZ3K1O5VhqkSP+7UjJW1b75ulunlGSFOQ167HfTplV9GbVn8XSFy4psOw
 TtVwrdDuiVvaH6wP1huLvoo05no2pw4wfRSgeRzxVFUDcbu0LF7a1LbDMG5D1XLN7wXui+3fuqIXp
 jfi9uX3Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35474 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u4jNK-0008W4-1c;
 Tue, 15 Apr 2025 17:43:06 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u4jMj-000rCM-31; Tue, 15 Apr 2025 17:42:29 +0100
In-Reply-To: <Z_6Mfx_SrionoU-e@shell.armlinux.org.uk>
References: <Z_6Mfx_SrionoU-e@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u4jMj-000rCM-31@rmk-PC.armlinux.org.uk>
Date: Tue, 15 Apr 2025 17:42:29 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/3] net: stmmac: sti: convert to
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

Convert sti to use the generic devm_stmmac_pltfr_probe() which will
call plat_dat->init()/plat_dat->exit() as appropriate, thus
simplifying the code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-sti.c   | 54 +++++++++----------
 1 file changed, 26 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index c580647ff9dc..b6e09bd33894 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -233,6 +233,29 @@ static int sti_dwmac_parse_data(struct sti_dwmac *dwmac,
 	return 0;
 }
 
+static int sti_dwmac_init(struct platform_device *pdev, void *bsp_priv)
+{
+	struct sti_dwmac *dwmac = bsp_priv;
+	int ret;
+
+	ret = clk_prepare_enable(dwmac->clk);
+	if (ret)
+		return ret;
+
+	ret = sti_dwmac_set_mode(dwmac);
+	if (ret)
+		clk_disable_unprepare(dwmac->clk);
+
+	return ret;
+}
+
+static void sti_dwmac_exit(struct platform_device *pdev, void *bsp_priv)
+{
+	struct sti_dwmac *dwmac = bsp_priv;
+
+	clk_disable_unprepare(dwmac->clk);
+}
+
 static int sti_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -269,34 +292,10 @@ static int sti_dwmac_probe(struct platform_device *pdev)
 
 	plat_dat->bsp_priv = dwmac;
 	plat_dat->fix_mac_speed = data->fix_retime_src;
+	plat_dat->init = sti_dwmac_init;
+	plat_dat->exit = sti_dwmac_exit;
 
-	ret = clk_prepare_enable(dwmac->clk);
-	if (ret)
-		return ret;
-
-	ret = sti_dwmac_set_mode(dwmac);
-	if (ret)
-		goto disable_clk;
-
-	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
-	if (ret)
-		goto disable_clk;
-
-	return 0;
-
-disable_clk:
-	clk_disable_unprepare(dwmac->clk);
-
-	return ret;
-}
-
-static void sti_dwmac_remove(struct platform_device *pdev)
-{
-	struct sti_dwmac *dwmac = get_stmmac_bsp_priv(&pdev->dev);
-
-	stmmac_dvr_remove(&pdev->dev);
-
-	clk_disable_unprepare(dwmac->clk);
+	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
 static int sti_dwmac_suspend(struct device *dev)
@@ -334,7 +333,6 @@ MODULE_DEVICE_TABLE(of, sti_dwmac_match);
 
 static struct platform_driver sti_dwmac_driver = {
 	.probe  = sti_dwmac_probe,
-	.remove = sti_dwmac_remove,
 	.driver = {
 		.name           = "sti-dwmac",
 		.pm		= pm_sleep_ptr(&sti_dwmac_pm_ops),
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
