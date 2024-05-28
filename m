Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E6A8D1A27
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2024 13:48:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22FD5C6B47E;
	Tue, 28 May 2024 11:48:46 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0D3CCFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 11:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KVEmjIyZjwAf32hRUX+GaRO6qlU2SBQWPCvlwhyLLVM=; b=qPuJovhSET0wOA68BxvgPKNBSo
 r8BDwHEFlMezlAHYNvAL1uMK+wqvqjzIExn6p2Dycks9qqgD2zrgD9LhNMZZl7RzBmlL4bbnMIy4M
 4h/spUKYF2zOD1fy+3cegYi/sYxbup9ddTkF3IU1E6wlHzfVnPkWzDZY6arRSUtH7LuauEuEMOJb1
 OI4F1Ed0Sytov+9AbYyA4/Eqw5e+eFpeNBqd1hJGRypTnO6GYPxukIlAFt67T4Po0Ok7VurEiU3iQ
 nm62lkxk/XnYjG4JWrf13pjEj1/oVDMTRDIruYZr4r7tZgxBRa+aL+sPHYL5qVB6ZbMl+BeSiDTop
 I6lw8xxw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55014 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1sBvJj-0004hi-0P;
 Tue, 28 May 2024 12:48:35 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1sBvJl-00EHyQ-QG; Tue, 28 May 2024 12:48:37 +0100
In-Reply-To: <ZlXEgl7tgdWMNvoB@shell.armlinux.org.uk>
References: <ZlXEgl7tgdWMNvoB@shell.armlinux.org.uk>
From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1sBvJl-00EHyQ-QG@rmk-PC.armlinux.org.uk>
Date: Tue, 28 May 2024 12:48:37 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/5] net: stmmac: Drop TBI/RTBI PCS
	flags
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

From: Serge Semin <fancer.lancer@gmail.com>

First of all the flags are never set by any of the driver parts. If nobody
have them set then the respective statements will always have the same
result. Thus the statements can be simplified or even dropped with no risk
to break things.

Secondly shall any of the TBI or RTBI flag is set the MDIO-bus
registration will be bypassed. Why? It really seems weird. It's perfectly
fine to have a TBI/RTBI-capable PHY configured over the MDIO bus
interface.

Based on the notes above the TBI/RTBI PCS flags can be freely dropped thus
simplifying the driver code.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b3afc7cb7d72..e01340034d50 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7833,10 +7833,7 @@ void stmmac_dvr_remove(struct device *dev)
 	reset_control_assert(priv->plat->stmmac_ahb_rst);
 
 	stmmac_pcs_clean(ndev);
-
-	if (priv->hw->pcs != STMMAC_PCS_TBI &&
-	    priv->hw->pcs != STMMAC_PCS_RTBI)
-		stmmac_mdio_unregister(ndev);
+	stmmac_mdio_unregister(ndev);
 	destroy_workqueue(priv->wq);
 	mutex_destroy(&priv->lock);
 	bitmap_free(priv->af_xdp_zc_qps);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
