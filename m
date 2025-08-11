Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F3EB214E4
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Aug 2025 20:51:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92F4AC32E92;
	Mon, 11 Aug 2025 18:51:47 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 825ECC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 18:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rt9Yy6R8MPl+O9p7xSfuOwLgdGUHQrVEfhCC9Y5SaqU=; b=ZclpzZR87eO8oSI9PCC/xzcO/Q
 4Wf4j71P2pGrb3AqlwoVYrLeUZF6RxH9FMHgdP9oBNpEE3RnXRcYJbZdGtU8oDa1DaPEJ8g3AEDD7
 wyLBrSrm7/jDAzsVfq/7+Gzna6Dk77yKNATBgAOll6rV6EMut8mNIs3Vx81Mq0mREkyvZ+if+OLCQ
 odb5RxfcoqBEYqO2ifMCij0CE+U1nPDARLXmZeF4deWupqUtfM1DPMxspMPOgWrynrTcUNS8D3Fih
 QgmjlcDCDANkNfU34NwT+CUBm3qftjxQyCshORNGBwnoLgnDXvljXvycBilOhbs+SH6AXQwnBC+1N
 1+8dFugA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41012 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1ulXcQ-0003au-1g;
 Mon, 11 Aug 2025 19:51:38 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1ulXbh-008gql-LO; Mon, 11 Aug 2025 19:50:53 +0100
In-Reply-To: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
References: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1ulXbh-008gql-LO@rmk-PC.armlinux.org.uk>
Date: Mon, 11 Aug 2025 19:50:53 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH net-next 3/9] net: stmmac: platform: legacy
 hooks for suspend()/resume() methods
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

Add legacy hooks for the suspend() and resume() methods to forward
these calls to the init() and exit() methods when the platform code
hasn't populated the two former methods. This allows us to get rid
of stmmac_pltfr_suspend() and stmmac_pltfr_resume().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 68 ++++++-------------
 1 file changed, 22 insertions(+), 46 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 21df052eeed0..c849676d98e8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -811,6 +811,22 @@ static void stmmac_pltfr_exit(struct platform_device *pdev,
 		plat->exit(pdev, plat->bsp_priv);
 }
 
+static int stmmac_plat_suspend(struct device *dev, void *bsp_priv)
+{
+	struct stmmac_priv *priv = netdev_priv(dev_get_drvdata(dev));
+
+	stmmac_pltfr_exit(to_platform_device(dev), priv->plat);
+
+	return 0;
+}
+
+static int stmmac_plat_resume(struct device *dev, void *bsp_priv)
+{
+	struct stmmac_priv *priv = netdev_priv(dev_get_drvdata(dev));
+
+	return stmmac_pltfr_init(to_platform_device(dev), priv->plat);
+}
+
 /**
  * stmmac_pltfr_probe
  * @pdev: platform device pointer
@@ -825,6 +841,11 @@ int stmmac_pltfr_probe(struct platform_device *pdev,
 {
 	int ret;
 
+	if (!plat->suspend && plat->exit)
+		plat->suspend = stmmac_plat_suspend;
+	if (!plat->resume && plat->init)
+		plat->resume = stmmac_plat_resume;
+
 	ret = stmmac_pltfr_init(pdev, plat);
 	if (ret)
 		return ret;
@@ -886,51 +907,6 @@ void stmmac_pltfr_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(stmmac_pltfr_remove);
 
-/**
- * stmmac_pltfr_suspend
- * @dev: device pointer
- * Description: this function is invoked when suspend the driver and it direcly
- * call the main suspend function and then, if required, on some platform, it
- * can call an exit helper.
- */
-static int __maybe_unused stmmac_pltfr_suspend(struct device *dev)
-{
-	int ret;
-	struct net_device *ndev = dev_get_drvdata(dev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
-	struct platform_device *pdev = to_platform_device(dev);
-
-	ret = stmmac_suspend(dev);
-
-	if (!priv->plat->suspend)
-		stmmac_pltfr_exit(pdev, priv->plat);
-
-	return ret;
-}
-
-/**
- * stmmac_pltfr_resume
- * @dev: device pointer
- * Description: this function is invoked when resume the driver before calling
- * the main resume function, on some platforms, it can call own init helper
- * if required.
- */
-static int __maybe_unused stmmac_pltfr_resume(struct device *dev)
-{
-	struct net_device *ndev = dev_get_drvdata(dev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
-	struct platform_device *pdev = to_platform_device(dev);
-	int ret;
-
-	if (!priv->plat->resume) {
-		ret = stmmac_pltfr_init(pdev, priv->plat);
-		if (ret)
-			return ret;
-	}
-
-	return stmmac_resume(dev);
-}
-
 static int __maybe_unused stmmac_runtime_suspend(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
@@ -998,7 +974,7 @@ static int __maybe_unused stmmac_pltfr_noirq_resume(struct device *dev)
 }
 
 const struct dev_pm_ops stmmac_pltfr_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(stmmac_pltfr_suspend, stmmac_pltfr_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(stmmac_suspend, stmmac_resume)
 	SET_RUNTIME_PM_OPS(stmmac_runtime_suspend, stmmac_runtime_resume, NULL)
 	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(stmmac_pltfr_noirq_suspend, stmmac_pltfr_noirq_resume)
 };
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
