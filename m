Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C5CB27F34
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Aug 2025 13:32:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1CA3C32EBF;
	Fri, 15 Aug 2025 11:32:50 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39052C32EB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Aug 2025 11:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UVGyduMsGp9jIcV0Q/MypAFdrMixXAG4hD33b4pow40=; b=PNSGHwZ+Z3Ie+P8OzTLhtlVT+3
 9OgjuqQrxIg7OES+48tMdoGksYkXCWxHnnpo5vmFicR/LCozh+eH/kCurym1+Tew2O2NariRAqGc2
 4ImEfAUmTwSkQCFxjxJ5Vsy0f52Z/Gb6Odoks6xY6N72T3Rr38T+SDHN1JuluV/QtgZ9UW3WwFqoe
 TPek0CqlWF/ruFy1dszrx7L4S8Sy1ONqAhQC6AuiL7Y1XZg1skPFRKgChWP+XuwrnvZ7CwNDhSv7m
 liljNt42brDxAK4s/7sAKJe+d8b4qJVERZYv5ZWe8AccuxpYOpeIITJaPQx/3uaUFfePhSr0m1N4r
 RigqdMaQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52750 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1umsft-00011m-0l;
 Fri, 15 Aug 2025 12:32:45 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1umsfA-008vKW-H1; Fri, 15 Aug 2025 12:32:00 +0100
In-Reply-To: <aJ8avIp8DBAckgMc@shell.armlinux.org.uk>
References: <aJ8avIp8DBAckgMc@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1umsfA-008vKW-H1@rmk-PC.armlinux.org.uk>
Date: Fri, 15 Aug 2025 12:32:00 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/7] net: stmmac: remove redundant
 WoL option validation
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

The core ethtool API validates the WoL options passed from userspace
against the support which the driver reports from its get_wol() method,
returning EINVAL if an unsupported mode is requested.

Therefore, there is no need for stmmac to implement its own validation.
Remove this unnecessary code.

See ethnl_set_wol() in net/ethtool/wol.c and ethtool_set_wol() in
net/ethtool/ioctl.c.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index dda7ba1f524d..cd2fb92ac84c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -803,7 +803,6 @@ static void stmmac_get_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 static int stmmac_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	u32 support = WAKE_MAGIC | WAKE_UCAST;
 
 	if (!device_can_wakeup(priv->device))
 		return -EOPNOTSUPP;
@@ -816,15 +815,6 @@ static int stmmac_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 		return ret;
 	}
 
-	/* By default almost all GMAC devices support the WoL via
-	 * magic frame but we can disable it if the HW capability
-	 * register shows no support for pmt_magic_frame. */
-	if ((priv->hw_cap_support) && (!priv->dma_cap.pmt_magic_frame))
-		wol->wolopts &= ~WAKE_MAGIC;
-
-	if (wol->wolopts & ~support)
-		return -EINVAL;
-
 	if (wol->wolopts) {
 		pr_info("stmmac: wakeup enable\n");
 		device_set_wakeup_enable(priv->device, 1);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
