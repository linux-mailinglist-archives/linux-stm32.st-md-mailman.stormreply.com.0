Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 101F48D31BA
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2024 10:41:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CACBAC6C855;
	Wed, 29 May 2024 08:41:04 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D87E4C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2024 08:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ki22ukjJ+Q20qB+nBL6L35jMrJzZTCq6rq/hxq5NThE=; b=zBrWrDbxEm7azr+Cav55JtHI3Z
 h51Bnzltfu0tp6bFUxOB4RPCkQ+uEWBSCMkX4bcE4cHOtkp0ngKDXz4s8mKvssBo281KJWuOVL7Dt
 dDV8leedBjyE1W3IxX3cpgbisS9y/4rv5674lXsf6+dXdO2snBA/7y0UaW68FCFYNr1wzeQi6Oc/M
 NmA6+FaAbpSY2Wi+3JdtivpRtTYo47d6Qli/FmqPDV9dXviTqaWFc+sqa/TfIUkkkZ9UgpyMeKiY0
 4R0cTJQUwLiEnAB4iMk5qe060OS1nDCgQjTCQDxqdHS1biPgPDFR5NjyvoYJ/lPeD8yaM6ik8NdGS
 T5JTq4cA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57986 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1sCErX-0005mH-0a;
 Wed, 29 May 2024 09:40:47 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1sCErZ-00EOPx-PF; Wed, 29 May 2024 09:40:49 +0100
In-Reply-To: <Zlbp7xdUZAXblOZJ@shell.armlinux.org.uk>
References: <Zlbp7xdUZAXblOZJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1sCErZ-00EOPx-PF@rmk-PC.armlinux.org.uk>
Date: Wed, 29 May 2024 09:40:49 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v2 4/6] net: stmmac: remove
 unnecessary netif_carrier_off()
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

It is incorrect to call netif_carrier_off(), or in fact any driver
teardown, before unregister_netdev() has been called.

unregister_netdev() unpublishes the network device from userspace, and
takes the interface down if it was up prior to returning. Therefore,
once the call has returned, we are guaranteed that .ndo_stop() will
have been called for an interface that was up. Phylink will take the
carrier down via phylink_stop(), making any manipulation of the carrier
in the remove path unnecessary.

In the stmmac_release() path, the netif_carrier_off() call follows the
call to phylink_stop(), so this call is redundant.

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3ab93f89be90..ca19b232431a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4088,8 +4088,6 @@ static int stmmac_release(struct net_device *dev)
 	if (priv->plat->serdes_powerdown)
 		priv->plat->serdes_powerdown(dev, priv->plat->bsp_priv);
 
-	netif_carrier_off(dev);
-
 	stmmac_release_ptp(priv);
 
 	pm_runtime_put(priv->device);
@@ -7806,7 +7804,6 @@ void stmmac_dvr_remove(struct device *dev)
 
 	stmmac_stop_all_dma(priv);
 	stmmac_mac_set(priv, priv->ioaddr, false);
-	netif_carrier_off(ndev);
 	unregister_netdev(ndev);
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
