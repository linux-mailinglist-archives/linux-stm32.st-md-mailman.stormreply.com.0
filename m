Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C69A20D6F
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2025 16:47:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63602C78026;
	Tue, 28 Jan 2025 15:47:35 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99427C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 15:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3YIoH6VA55wVjjgJMjTs7y6r79V9JBvos9FiOPbICR8=; b=iKwRr8ReVs813x0XopkdelSqpD
 cwTu6G2N8BuZZu/v+XLIo1QH1UQho1+KfxKaOzqk1In3rfYsJi7egcVXPf/0OA+Ub74PG0uxfnKYp
 1SOeQGzjQlNiandPGVWe/3fsVw+UJJGNMeSThfhXtSlvXSqxTQheUeGPWEdkLLmLxFfzvK5sH+MNQ
 o04bdkdscv8KOe7nRevoATawh7qCVUQJuPkXQq7gAFbVOhGLno2O8nXcPi1nAzrDWdK+GbWn0Qd8D
 cXiFTdOR4FuwbPq23xECBjzqUjszwXUpMmRqoa4E7nYT5qk5UhsUgBKn3DovNKFCM4ZyKBHMoM2nv
 7xslCfvg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41988 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tcnoH-0007Tu-2t;
 Tue, 28 Jan 2025 15:47:29 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tcnny-0037GW-Eo; Tue, 28 Jan 2025 15:47:10 +0000
In-Reply-To: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
References: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tcnny-0037GW-Eo@rmk-PC.armlinux.org.uk>
Date: Tue, 28 Jan 2025 15:47:10 +0000
Cc: Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 05/22] net: stmmac: remove
 priv->dma_cap.eee test in tx_lpi methods
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

The tests for priv->dma_cap.eee in stmmac_mac_{en,dis}able_tx_lpi()
is useless as these methods will only be called when using phylink
managed EEE, and that will only be enabled if the LPI capabilities
in phylink_config have been populated during initialisation. This
only occurs when priv->dma_cap.eee was true.

As priv->dma_cap.eee remains constant during the lifetime of the driver
instance, there is no need to re-check it in these methods.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3a0f1003f7a8..c2cc75624a8c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1044,12 +1044,6 @@ static void stmmac_mac_disable_tx_lpi(struct phylink_config *config)
 
 	priv->eee_active = false;
 
-	/* Check if MAC core supports the EEE feature. */
-	if (!priv->dma_cap.eee) {
-		priv->eee_enabled = false;
-		return;
-	}
-
 	mutex_lock(&priv->lock);
 
 	/* Check if it needs to be deactivated */
@@ -1079,12 +1073,6 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 	priv->tx_lpi_timer = timer;
 	priv->eee_active = true;
 
-	/* Check if MAC core supports the EEE feature. */
-	if (!priv->dma_cap.eee) {
-		priv->eee_enabled = false;
-		return 0;
-	}
-
 	mutex_lock(&priv->lock);
 
 	if (priv->eee_active && !priv->eee_enabled) {
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
