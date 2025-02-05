Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 693E9A28BF1
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2025 14:40:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E201C78F8E;
	Wed,  5 Feb 2025 13:40:32 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F255C78F8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2025 13:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ilRCh6+tBajH2EHe/j7VXA163CYcQs54iiHX9cjVYLY=; b=MES8Zqi5z2HKfEJWWHPTdMDsx4
 mGKWiRq+No2Gr8dpLRFR3NWGSiUmZQn/RH9uusChGv0viuEw/XsVX68cL/WjQm5iOrsCoImVY1G1W
 mZPpKVMTb5LLYmlG/4SRqdklsllXVBvGttuPleA1XkenH3eiXd6nCXgRhBnc1GZpCsubBbDSOPixT
 MXjhPlT8QL8GixIyqb4TB+rlTpgAgmvDuJv6+zKF6nR+nz2OI7E6HFOmsVm1byZYcesX7hC2e6XAO
 bD/9ipXL6V/jS1tYrDmCwznXz+Fc+XShEixCRQzVD2qkHtmMas+EvHbS2epdcRPEpt7i3lZ5xuH3H
 t9kEk7Zw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50866 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tffdh-0007At-14;
 Wed, 05 Feb 2025 13:40:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tffdN-003ZHt-Mq; Wed, 05 Feb 2025 13:40:05 +0000
In-Reply-To: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
References: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tffdN-003ZHt-Mq@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Feb 2025 13:40:05 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 05/14] net: stmmac: remove
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
index 8f2624de592d..ce527d4ae11f 100644
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
