Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5387AA0255A
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jan 2025 13:26:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E56EC78013;
	Mon,  6 Jan 2025 12:26:10 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD948C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jan 2025 12:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ELZbe4ORBYcEswjWnSIgUcJQUopY3ta7DtPy0O6ILXg=; b=HTaQmiyv/4hw5y/kzU6bO4IjPu
 uXVM+N6K2D93jwmxZhnwvcjNdsqSfr63+NF6iyDmTO4Tu4qqMeOIlwvQzJdvMo22VCZwLUNJ1Jnyw
 8kauy6V8nu4n/mwuOyoC8+ptLx7kVAlh8PylcQuh7DuCH3cbR1kxPYNBCgY2xHyUCfKpf8ePWvWd4
 7p/cohbKmL5SrM0enUXvGBiu2NvdIJERuGa1EIjcwnIctYtRbZMhn+QiJWFx43mQ//QzovckSnTRe
 SvYgxp7LM0KxsMHVrCqwIqTVUOg/RD6PnRpts8LEw89CZ/sqCWkul3nbn8kIv+DUyynKT6+Nz2eud
 vVPQSxeA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36916 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tUmBH-0005uC-1e;
 Mon, 06 Jan 2025 12:26:03 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tUmBE-007VY5-DJ; Mon, 06 Jan 2025 12:26:00 +0000
In-Reply-To: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tUmBE-007VY5-DJ@rmk-PC.armlinux.org.uk>
Date: Mon, 06 Jan 2025 12:26:00 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 15/17] net: stmmac: remove
 unnecessary EEE handling in stmmac_release()
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

phylink_stop() will cause phylink to call the mac_link_down() operation
before phylink_stop() returns. As mac_link_down() will call
stmmac_eee_init(false), this will set both priv->eee_active and
priv->eee_enabled to be false, deleting the eee_ctrl_timer if
priv->eee_enabled was previously set.

As stmmac_release() calls phylink_stop() before checking whether
priv->eee_enabled is true, this is a condition that can never be
satisfied, and thus the code within this if() block will never be
executed. Remove it.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index aac45c16d7b5..7ba3c7a8f535 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4027,11 +4027,6 @@ static int stmmac_release(struct net_device *dev)
 	/* Free the IRQ lines */
 	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
 
-	if (priv->eee_enabled) {
-		priv->tx_path_in_lpi_mode = false;
-		del_timer_sync(&priv->eee_ctrl_timer);
-	}
-
 	/* Stop TX/RX DMA and clear the descriptors */
 	stmmac_stop_all_dma(priv);
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
