Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E516DA54EDB
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 16:24:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FAB5C7801E;
	Thu,  6 Mar 2025 15:24:22 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAAD6C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 15:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1osmxLM0JPtN1QjPJqhrKT1uQMk9kT2l9BrM2YTPnUY=; b=RTn0a8A+Hzq3+ziFUCBoaSW9Ed
 2wAN0+i9k/4vAN13PesmIcZsX697ts0SgZZWVEy4QPZnEKbutgeLeOOVIabcKi2C5WPrQ7uXGbBll
 Eh5MlD84xnyWZgJggLlRcIY1pO/Cq978SmslVCWWqnzD6nCCsRz+TJ8wOP4RzYWNwKl3oogfCI/p5
 sy1fO16BhgEuLRFPbR09VHOXYeKimQO81p6r7nw0kdTXKs5CjDI7BfLA9L65pxdus4JciLViUbmgQ
 KPKLf732a+ZBpfM48oOCssNNAY9KgOOnLZUn1OGwsTM7wZw15LCaJkgmMkX0falSDih6rtJC4Un1H
 Uypn+EeQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58532 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tqD57-00065S-0l;
 Thu, 06 Mar 2025 15:24:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tqD4n-005Xx6-3l; Thu, 06 Mar 2025 15:23:57 +0000
In-Reply-To: <Z8m-CRucPxDW5zZK@shell.armlinux.org.uk>
References: <Z8m-CRucPxDW5zZK@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tqD4n-005Xx6-3l@rmk-PC.armlinux.org.uk>
Date: Thu, 06 Mar 2025 15:23:57 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next v2 2/2] net: stmmac: block PHY rx
 clock-stop over reset
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

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6924df893e42..037039a9a33b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3096,7 +3096,10 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 	if (priv->extend_desc && (priv->mode == STMMAC_RING_MODE))
 		priv->plat->dma_cfg->atds = 1;
 
+	/* Note that the PHY clock must be running for reset to complete. */
+	phylink_rx_clk_stop_block(priv->phylink);
 	ret = stmmac_reset(priv, priv->ioaddr);
+	phylink_rx_clk_stop_unblock(priv->phylink);
 	if (ret) {
 		netdev_err(priv->dev, "Failed to reset the dma\n");
 		return ret;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
