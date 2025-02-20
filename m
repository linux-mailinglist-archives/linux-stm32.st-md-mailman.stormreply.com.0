Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF50FA3DA5B
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Feb 2025 13:48:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1795C7A827;
	Thu, 20 Feb 2025 12:48:14 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4428EC7A824
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Feb 2025 12:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E5+2puAdJcLcm7GiCQlmphHj1Zhoat9wHQNBgpT3Vbo=; b=yYaw0wopL4OQ7X2EZN1jO6ypLE
 p5HCBBxPl7aE7LDFuHH0XICq1NJRStUIbQvlvqVe7IrRMGv0BjX5rUpVBOWVTmVmBFPzLzwm01F9q
 PcRBWmvgBJ6g04OakL0xBgXxW4O7qTY6r4NaQPuzXNbu9cRjzU2wF7unTUT3CaPlv8GPRjmeuL5MQ
 vh+q7LWxMGUwFkuOhVu5uhH09ZhXekiRslfykjY0b2Gtw1WTJFOdGlpZnLZnpAUrzFkgOnXG3jkvL
 H71apd62aQzGVmuVJ1RSM0l6vXZ5OuM38iUuywjHyx+CkVp5UXl0eTu1yR8drfckJYeWLVkM4e0cC
 18nukHeQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33726 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tl5yK-00010I-3D;
 Thu, 20 Feb 2025 12:48:09 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tl5y1-004UgG-8X; Thu, 20 Feb 2025 12:47:49 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tl5y1-004UgG-8X@rmk-PC.armlinux.org.uk>
Date: Thu, 20 Feb 2025 12:47:49 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: print
 stmmac_init_dma_engine() errors using netdev_err()
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

stmmac_init_dma_engine() uses dev_err() which leads to errors being
reported as e.g:

dwc-eth-dwmac 2490000.ethernet: Failed to reset the dma
dwc-eth-dwmac 2490000.ethernet eth0: stmmac_hw_setup: DMA engine initialization failed

stmmac_init_dma_engine() is only called from stmmac_hw_setup() which
itself uses netdev_err(), and we will have a net_device setup. So,
change the dev_err() to netdev_err() to give consistent error
messages.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4d542f482ecb..218ecc945e9e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3034,7 +3034,7 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 	int ret = 0;
 
 	if (!priv->plat->dma_cfg || !priv->plat->dma_cfg->pbl) {
-		dev_err(priv->device, "Invalid DMA configuration\n");
+		netdev_err(priv->dev, "Invalid DMA configuration\n");
 		return -EINVAL;
 	}
 
@@ -3043,7 +3043,7 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 
 	ret = stmmac_reset(priv, priv->ioaddr);
 	if (ret) {
-		dev_err(priv->device, "Failed to reset the dma\n");
+		netdev_err(priv->dev, "Failed to reset the dma\n");
 		return ret;
 	}
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
