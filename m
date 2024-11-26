Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B90A29D97A8
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 13:54:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80A1AC78023;
	Tue, 26 Nov 2024 12:54:09 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83AA4C78021
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 12:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PEkk5Q5jvaBXDuI8wGcpUVE1aRBTW0jxP9vUWLuWdh8=; b=H70N8FCROgcZxkBg4eilMMlSWp
 yClptKpRLMxal5RGwYAXF9sIjD4WfJkz9Jg0fNt1CkLgkwq+Ry5X/SOB9EzzCXgSEotImvYG192W5
 qF0v+aoibG6xwraUJ0m173AXuKjIcShHjLqWRColocPGPdXw87eix2v0DZhUoJMNI2mV22h5E0e7B
 6/Z2LEzI8ZdmsCj5S5jlIAXVq+hjHXU1TibobFtwNsEB2AtdYY6q4bjnWztvqLzLM5lpPoHcbrhPq
 zCLM1gZFYSVq5L8k6odBe4cs58RgYEjeSFQ/yS6//F8qDd/MAXkkKWdpxb4wpd9WDVj5qWE+htgGd
 NjSxu8GA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42628 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tFv4k-0006xu-1h;
 Tue, 26 Nov 2024 12:53:54 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tFv4j-005yjK-BJ; Tue, 26 Nov 2024 12:53:53 +0000
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tFv4j-005yjK-BJ@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 12:53:53 +0000
Cc: UNGLinuxDriver@microchip.com, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 20/23] net: stmmac: remove
	priv->tx_lpi_enabled
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

Through using phylib's EEE state, priv->tx_lpi_enabled has become a
write-only variable. Remove it.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 1d86439b8a14..77a7a098ebd1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -310,7 +310,6 @@ struct stmmac_priv {
 	int eee_enabled;
 	int eee_active;
 	int tx_lpi_timer;
-	int tx_lpi_enabled;
 	int eee_tw_timer;
 	bool eee_sw_timer_en;
 	unsigned int mode;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8bdf8bc9a728..7924808fec08 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -974,7 +974,6 @@ static void stmmac_mac_link_down(struct phylink_config *config,
 
 	stmmac_mac_set(priv, priv->ioaddr, false);
 	priv->eee_active = false;
-	priv->tx_lpi_enabled = false;
 	priv->eee_enabled = stmmac_eee_init(priv);
 	stmmac_set_eee_pls(priv, priv->hw, false);
 
@@ -1089,7 +1088,6 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 				STMMAC_FLAG_RX_CLK_RUNS_IN_LPI)) >= 0;
 		priv->eee_enabled = stmmac_eee_init(priv);
 		priv->tx_lpi_timer = phy->eee_cfg.tx_lpi_timer;
-		priv->tx_lpi_enabled = priv->eee_enabled;
 		stmmac_set_eee_pls(priv, priv->hw, true);
 	}
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
