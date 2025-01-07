Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7428FA0463D
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 17:29:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3ACECC78025;
	Tue,  7 Jan 2025 16:29:38 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E32A8C78022
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 16:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AtobVMnr8E5gzN8ZgvrreHjtEy+CmRHbLYgzCHnDnG4=; b=acBQQ+NyHAqjSuSoJzPyYnAk3v
 4n+lmW/UgxASD7sLSNkoXl5EANM5UHgfIZ/2530W9UaVyNDKtpYYbDCkxV2OVfGEeWVSe9r0l8mbn
 5ZVzo81Fpfevfrf0VG4JbcCmBWhk/YkVAURV0xkGoptuC+98Q109QMk8r45FwwjMqsmmxhGFvUuz8
 gbNErKg2ETG1MohLqC8fz768v1Z0iVblTlZTB9qdOiPsq1x+8IPPGVHOjM6/igTRZ8F28hdbLDWnb
 O/KsaNI9PGcG54RwEjKOpNZ7drgrjzvuY4Pe86QZiQLUk7yHj+Y8kKc5XL9D7e8M9d/x6zreSBCIF
 U3+faP8w==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59402 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tVCSR-0007nz-1X;
 Tue, 07 Jan 2025 16:29:31 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tVCSO-007Y43-Fa; Tue, 07 Jan 2025 16:29:28 +0000
In-Reply-To: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
References: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tVCSO-007Y43-Fa@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Jan 2025 16:29:28 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 12/18] net: stmmac: move
 priv->eee_enabled into stmmac_eee_init()
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

All call sites for stmmac_eee_init() assign the return code to
priv->eee_enabled. Rather than having this coded at each call site,
move the assignment inside stmmac_eee_init().

Since stmmac_init_eee() takes priv->lock before checking the state of
priv->eee_enabled, move the assignment within the locked region. Also,
stmmac_suspend() checks the state of this member under the lock. While
two concurrent calls to stmmac_init_eee() aren't possible, there is
a possibility that stmmac_suspend() may run concurrently with a change
of priv->eee_enabled unless we modify it under the lock.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 94bb6b07f96f..b7e0026c271b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -462,11 +462,13 @@ static void stmmac_eee_ctrl_timer(struct timer_list *t)
  *  can also manage EEE, this function enable the LPI state and start related
  *  timer.
  */
-static bool stmmac_eee_init(struct stmmac_priv *priv)
+static void stmmac_eee_init(struct stmmac_priv *priv)
 {
 	/* Check if MAC core supports the EEE feature. */
-	if (!priv->dma_cap.eee)
-		return false;
+	if (!priv->dma_cap.eee) {
+		priv->eee_enabled = false;
+		return;
+	}
 
 	mutex_lock(&priv->lock);
 
@@ -483,8 +485,9 @@ static bool stmmac_eee_init(struct stmmac_priv *priv)
 						priv->plat->mult_fact_100ns,
 						false);
 		}
+		priv->eee_enabled = false;
 		mutex_unlock(&priv->lock);
-		return false;
+		return;
 	}
 
 	if (priv->eee_active && !priv->eee_enabled) {
@@ -507,9 +510,10 @@ static bool stmmac_eee_init(struct stmmac_priv *priv)
 			  STMMAC_LPI_T(priv->tx_lpi_timer));
 	}
 
+	priv->eee_enabled = true;
+
 	mutex_unlock(&priv->lock);
 	netdev_dbg(priv->dev, "Energy-Efficient Ethernet initialized\n");
-	return true;
 }
 
 /* stmmac_get_tx_hwtstamp - get HW TX timestamps
@@ -967,7 +971,7 @@ static void stmmac_mac_link_down(struct phylink_config *config,
 
 	stmmac_mac_set(priv, priv->ioaddr, false);
 	priv->eee_active = false;
-	priv->eee_enabled = stmmac_eee_init(priv);
+	stmmac_eee_init(priv);
 	stmmac_set_eee_pls(priv, priv->hw, false);
 
 	if (stmmac_fpe_supported(priv))
@@ -1080,7 +1084,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 					     STMMAC_FLAG_RX_CLK_RUNS_IN_LPI));
 		priv->tx_lpi_timer = phy->eee_cfg.tx_lpi_timer;
 		priv->eee_active = phy->enable_tx_lpi;
-		priv->eee_enabled = stmmac_eee_init(priv);
+		stmmac_eee_init(priv);
 		stmmac_set_eee_pls(priv, priv->hw, true);
 	}
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
