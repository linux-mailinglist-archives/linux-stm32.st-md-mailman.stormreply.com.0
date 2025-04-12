Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A65D5A86D83
	for <lists+linux-stm32@lfdr.de>; Sat, 12 Apr 2025 16:10:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64D4FC78F77;
	Sat, 12 Apr 2025 14:10:49 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D05AEC78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Apr 2025 14:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AjpPx4diUTD55faBtP4P4XYjVA7r8a4pIDQt1k+4gFo=; b=W7pGDeRsVYz/bLC54KhffjdXao
 qUE9VUc2SW30decX6bDS+huRGHympzQaT3nviRrKPfsk44bET76kjQxbG8G7gDrG+qBqIRmZfn5Gx
 0302N+RzkVlzUSraDNkrL1JaxkVfjSNT+c6KlnB65appcts3xDojgF4RuTRskmX47OWKZS0FBp9bf
 amIXzlSnEqCdxyzOO3gUIQ8Pf75uxLoLrKq3pZDKYgmAxHdQFtOUHCoYqUIq46nD8rK7Ot9Iyzk5b
 1t7/NSKRES7BJfIoh8y7kyi/n43T3/iJX0myCxCyiipkbeDsuze3Vy69/ye+hOYuWtpvyEQoVyd+3
 L2vw1wHQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43894 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u3bZB-0004az-2M;
 Sat, 12 Apr 2025 15:10:41 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u3bYa-000EcW-H1; Sat, 12 Apr 2025 15:10:04 +0100
In-Reply-To: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
References: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u3bYa-000EcW-H1@rmk-PC.armlinux.org.uk>
Date: Sat, 12 Apr 2025 15:10:04 +0100
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 4/4] net: stmmac: qcom-ethqos: remove
 speed_mode_2500() method
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

qcom-ethqos doesn't need to implement the speed_mode_2500() method as
it is only setting priv->plat->phy_interface to 2500BASE-X, which is
already a pre-condition for assigning speed_mode_2500 in
qcom_ethqos_probe(). So, qcom_ethqos_speed_mode_2500() has no effect.
Remove it.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e8d4925be21c..e30bdf72331a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -672,13 +672,6 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 	return val;
 }
 
-static void qcom_ethqos_speed_mode_2500(struct net_device *ndev, void *data)
-{
-	struct stmmac_priv *priv = netdev_priv(ndev);
-
-	priv->plat->phy_interface = PHY_INTERFACE_MODE_2500BASEX;
-}
-
 static int ethqos_configure(struct qcom_ethqos *ethqos, int speed)
 {
 	return ethqos->configure_func(ethqos, speed);
@@ -800,8 +793,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		ethqos->configure_func = ethqos_configure_rgmii;
 		break;
 	case PHY_INTERFACE_MODE_2500BASEX:
-		plat_dat->speed_mode_2500 = qcom_ethqos_speed_mode_2500;
-		fallthrough;
 	case PHY_INTERFACE_MODE_SGMII:
 		ethqos->configure_func = ethqos_configure_sgmii;
 		break;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
