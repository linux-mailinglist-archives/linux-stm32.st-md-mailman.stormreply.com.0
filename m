Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C681A02552
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jan 2025 13:25:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA25FC78F6E;
	Mon,  6 Jan 2025 12:25:50 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13AFDC78F6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jan 2025 12:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SvAOfuk/gG22WA/IG+mdfXq2MSJzE4kmQ+mvTvKuMFY=; b=HQj0GLqH4EYc6NFoSFE+2c/JYV
 eKetogjHxORanqxFGxIReDq6aegl3nXWj1xosQAhOD52WiVzOdGQhXX3DXmxLPw4Mb2rHdPpjxW8t
 K3AnpGIh/qNWRuaFvy53W1HFqCW+Lzp/WPtIwmyy4BTXqKYkbrzc1WW/HZ5rN3nuDjkpFWU67jilG
 bM4GICGWUC9B4fV1uQUHIqR2XJmzHF8GZN5OJXC/Dc0+6zyozrrwiaMkMx2pmWBCHT2CKglX+wtuc
 CKg+VcRobxAqq17cvQsgyj75zamooZbofNkWNJoSAuniBTUWuH1qpQYdnOV2TphtU/4D9+RtAcnED
 RtcNRcXA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37410 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tUmAw-0005t1-2k;
 Mon, 06 Jan 2025 12:25:42 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tUmAt-007VXh-TZ; Mon, 06 Jan 2025 12:25:39 +0000
In-Reply-To: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tUmAt-007VXh-TZ@rmk-PC.armlinux.org.uk>
Date: Mon, 06 Jan 2025 12:25:39 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 11/17] net: stmmac: move
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

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7cce2eb3d82e..cf294fe3f726 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -464,11 +464,13 @@ static void stmmac_eee_ctrl_timer(struct timer_list *t)
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
 
@@ -485,8 +487,9 @@ static bool stmmac_eee_init(struct stmmac_priv *priv)
 						priv->plat->mult_fact_100ns,
 						false);
 		}
+		priv->eee_enabled = false;
 		mutex_unlock(&priv->lock);
-		return false;
+		return;
 	}
 
 	if (priv->eee_active && !priv->eee_enabled) {
@@ -509,9 +512,10 @@ static bool stmmac_eee_init(struct stmmac_priv *priv)
 			  STMMAC_LPI_T(priv->tx_lpi_timer));
 	}
 
+	priv->eee_enabled = true;
+
 	mutex_unlock(&priv->lock);
 	netdev_dbg(priv->dev, "Energy-Efficient Ethernet initialized\n");
-	return true;
 }
 
 /* stmmac_get_tx_hwtstamp - get HW TX timestamps
@@ -969,7 +973,7 @@ static void stmmac_mac_link_down(struct phylink_config *config,
 
 	stmmac_mac_set(priv, priv->ioaddr, false);
 	priv->eee_active = false;
-	priv->eee_enabled = stmmac_eee_init(priv);
+	stmmac_eee_init(priv);
 	stmmac_set_eee_pls(priv, priv->hw, false);
 
 	if (stmmac_fpe_supported(priv))
@@ -1082,7 +1086,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
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
