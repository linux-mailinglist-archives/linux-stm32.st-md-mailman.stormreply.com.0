Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EF2A0B5FD
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 12:46:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BF6CC78024;
	Mon, 13 Jan 2025 11:46:40 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FD14C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 11:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GEgZ/SvmKDS++MiOXpGxNiPvw6lP1RjmRHXTj59mUno=; b=UzuOxMvTAtG53wSYLB9oUkGFls
 0rdlR3mVUqQ5GeDjecci/PdH1Oe6/DtNZDKkXASsZRzNygPm42/To8o7qYkgSfdbtcx08lY25/ZrN
 hjfhQZJBLUGfRUelbeL5NL+bGjX6pmNXrUKU/9G6PJi4dMVgXdU8CPlnz/ImrwGVp04rZmxPafuw8
 9SehgNL4lnFstOOuELO1LBX5s/1fbFyhTER+/1Ue7/7VB5if5o9Gvls1vCWu74/nh9yWsxk6QZtbb
 mLcvTRhxWgXXslab5EJObH47SZHpUGpI6lrKF2WQyGc5fyfTeDz16l56JG8ibY7LrB1lRKg8eKVq6
 Csr5FThA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38262 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tXItu-0006Wn-2f;
 Mon, 13 Jan 2025 11:46:34 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tXItb-000MBa-OU; Mon, 13 Jan 2025 11:46:15 +0000
In-Reply-To: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
References: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tXItb-000MBa-OU@rmk-PC.armlinux.org.uk>
Date: Mon, 13 Jan 2025 11:46:15 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eric Woudstra <ericwouds@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 8/9] net: stmmac: combine
	stmmac_enable_eee_mode()
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

Combine stmmac_enable_eee_mode() with stmmac_try_to_start_sw_lpi()
which makes the code easier to read and the flow more logical. We
can now trivially see that if the transmit queues are busy, we
(re-)start the eee_ctrl_timer. Otherwise, if the transmit path is
not already in LPI mode, we ask the hardware to enter LPI mode.

I believe that now we can see better what is going on here, this
shows that there is a bug with the software LPI timer implementation.

The LPI timer is supposed to define how long after the last
transmittion completed before we start signalling LPI. However,
this code structure shows that if all transmit queues are empty,
and stmmac_try_to_start_sw_lpi() is called immediately after cleaning
the transmit queue, we will instruct the hardware to start signalling
LPI immediately.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c   | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 677a2172a85f..72f270013086 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -422,27 +422,22 @@ static void stmmac_restart_sw_lpi_timer(struct stmmac_priv *priv)
 }
 
 /**
- * stmmac_enable_eee_mode - check and enter in LPI mode
+ * stmmac_try_to_start_sw_lpi - check and enter in LPI mode
  * @priv: driver private structure
  * Description: this function is to verify and enter in LPI mode in case of
  * EEE.
  */
-static int stmmac_enable_eee_mode(struct stmmac_priv *priv)
+static void stmmac_try_to_start_sw_lpi(struct stmmac_priv *priv)
 {
-	if (stmmac_eee_tx_busy(priv))
-		return -EBUSY; /* still unfinished work */
+	if (stmmac_eee_tx_busy(priv)) {
+		stmmac_restart_sw_lpi_timer(priv);
+		return;
+	}
 
 	/* Check and enter in LPI mode */
 	if (!priv->tx_path_in_lpi_mode)
 		stmmac_set_eee_mode(priv, priv->hw,
 			priv->plat->flags & STMMAC_FLAG_EN_TX_LPI_CLOCKGATING);
-	return 0;
-}
-
-static void stmmac_try_to_start_sw_lpi(struct stmmac_priv *priv)
-{
-	if (stmmac_enable_eee_mode(priv))
-		stmmac_restart_sw_lpi_timer(priv);
 }
 
 /**
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
