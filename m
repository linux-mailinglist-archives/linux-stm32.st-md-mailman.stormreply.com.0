Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 293C7A4DC5A
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Mar 2025 12:21:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7141C7803D;
	Tue,  4 Mar 2025 11:21:52 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8DC0C7803A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Mar 2025 11:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dbjvadws0kRCNhxtI35nxdB/KtxozDHnbrbbu+M7kRA=; b=SkAybfOkr4oApk1guBPlQyrxVd
 HSuqX+0VFCNYPELvpBdZsDqVSw0tKAo8HkCGDMDkl7wPXXtb8Vscvz4At7CAS9ro7HsPrhTlEhWB7
 nNHlhafnMosLEA/pBOcjd6ngzyjiQUlFLP0Dpb1a90XFo7gVsCD7K3RJy5RazFT8JuKjpps7t4v6L
 u0+RaesHR4UmshqkRfEVW8c350bxz88rWMFi+99db9QN+UZv8FXPLFD/LaEyWf8KF1tx3Z4n2GBXO
 K6KkqATP+Gt5XrABSGgdGp+2fE3KVvFjCkPUREXhnEckO3sDebUzWoaTNWtujBmh7/e0WOEFLWqpd
 C7QYLKDg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42422 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tpQLL-0002YY-1v;
 Tue, 04 Mar 2025 11:21:47 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tpQL1-005St4-Hn; Tue, 04 Mar 2025 11:21:27 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tpQL1-005St4-Hn@rmk-PC.armlinux.org.uk>
Date: Tue, 04 Mar 2025 11:21:27 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: simplify
 phylink_suspend() and phylink_resume() calls
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

Currently, the calls to phylink's suspend and resume functions are
inside overly complex tests, and boil down to:

	if (device_may_wakeup(priv->device) && priv->plat->pmt) {
		call phylink
	} else {
		call phylink and
		if (device_may_wakeup(priv->device))
			do something else
	}

This results in phylink always being called, possibly with differing
arguments for phylink_suspend().

Simplify this code, noting that each site is slightly different due to
the order in which phylink is called and the "something else".

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 +++++++------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index aec230353ac4..fbcba6c71f12 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7831,13 +7831,11 @@ int stmmac_suspend(struct device *dev)
 	mutex_unlock(&priv->lock);
 
 	rtnl_lock();
-	if (device_may_wakeup(priv->device) && priv->plat->pmt) {
-		phylink_suspend(priv->phylink, true);
-	} else {
-		if (device_may_wakeup(priv->device))
-			phylink_speed_down(priv->phylink, false);
-		phylink_suspend(priv->phylink, false);
-	}
+	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
+		phylink_speed_down(priv->phylink, false);
+
+	phylink_suspend(priv->phylink,
+			device_may_wakeup(priv->device) && priv->plat->pmt);
 	rtnl_unlock();
 
 	if (stmmac_fpe_supported(priv))
@@ -7927,13 +7925,9 @@ int stmmac_resume(struct device *dev)
 	}
 
 	rtnl_lock();
-	if (device_may_wakeup(priv->device) && priv->plat->pmt) {
-		phylink_resume(priv->phylink);
-	} else {
-		phylink_resume(priv->phylink);
-		if (device_may_wakeup(priv->device))
-			phylink_speed_up(priv->phylink);
-	}
+	phylink_resume(priv->phylink);
+	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
+		phylink_speed_up(priv->phylink);
 	rtnl_unlock();
 
 	rtnl_lock();
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
