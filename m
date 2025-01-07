Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82000A0463F
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 17:29:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 434A5C78025;
	Tue,  7 Jan 2025 16:29:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E787C78022
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 16:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j7GTEfja/07m/dxB/a0CmEMLPjybqsk6izUSl+b/tGQ=; b=NehBVLUzKnsWVryZjHikpQFsFc
 SP4CIefwSQ7PZaqxSlnyZI+mGSaYqNjOLu0MMub8lkZAKpvZcBZZuolgCtQBGGbOxEW1WfFLrnrCv
 KKpZSF3yQEtViR/VZka8uwtJ3Izj/zbg854NgsBgzOyOP9mG19PTGf4INZcks8QRYHYsP7sh5f0fc
 ihhkcVnU8NlbWX7LfUthgvqf14V05TCjgNClIVz9v0WdlsJhfn/nMMhyAxu4GpgkhbKD5R6jwGW1l
 Tr6an33e/hrWFtnM/fnFcVtmxP1ioD2qlbRFPXZI1GNpHGKJDEZfn56rByFkhLxBBajkIiZL0N0Ma
 0pjrDNig==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59408 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tVCSW-0007oH-1t;
 Tue, 07 Jan 2025 16:29:36 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tVCST-007Y49-In; Tue, 07 Jan 2025 16:29:33 +0000
In-Reply-To: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
References: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tVCST-007Y49-In@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Jan 2025 16:29:33 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 13/18] net: stmmac: move
 priv->eee_active into stmmac_eee_init()
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

Since all call sites of stmmac_eee_init() assign priv->eee_active
immediately before, pass this state into stmmac_eee_init() and
assign priv->eee_active within this function.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b7e0026c271b..7c1dbc5fa84b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -457,13 +457,16 @@ static void stmmac_eee_ctrl_timer(struct timer_list *t)
 /**
  * stmmac_eee_init - init EEE
  * @priv: driver private structure
+ * @active: indicates whether EEE should be enabled.
  * Description:
  *  if the GMAC supports the EEE (from the HW cap reg) and the phy device
  *  can also manage EEE, this function enable the LPI state and start related
  *  timer.
  */
-static void stmmac_eee_init(struct stmmac_priv *priv)
+static void stmmac_eee_init(struct stmmac_priv *priv, bool active)
 {
+	priv->eee_active = active;
+
 	/* Check if MAC core supports the EEE feature. */
 	if (!priv->dma_cap.eee) {
 		priv->eee_enabled = false;
@@ -970,8 +973,7 @@ static void stmmac_mac_link_down(struct phylink_config *config,
 	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
 
 	stmmac_mac_set(priv, priv->ioaddr, false);
-	priv->eee_active = false;
-	stmmac_eee_init(priv);
+	stmmac_eee_init(priv, false);
 	stmmac_set_eee_pls(priv, priv->hw, false);
 
 	if (stmmac_fpe_supported(priv))
@@ -1083,8 +1085,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 		phy_eee_rx_clock_stop(phy, !(priv->plat->flags &
 					     STMMAC_FLAG_RX_CLK_RUNS_IN_LPI));
 		priv->tx_lpi_timer = phy->eee_cfg.tx_lpi_timer;
-		priv->eee_active = phy->enable_tx_lpi;
-		stmmac_eee_init(priv);
+		stmmac_eee_init(priv, phy->enable_tx_lpi);
 		stmmac_set_eee_pls(priv, priv->hw, true);
 	}
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
