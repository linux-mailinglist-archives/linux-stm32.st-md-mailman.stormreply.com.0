Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 662F9B13F12
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jul 2025 17:46:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27A8CC36B2E;
	Mon, 28 Jul 2025 15:46:33 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1106C36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jul 2025 15:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qiasyHW8eYHcGSr/FVeeF5VMI/eVubqybz/H7IzQDig=; b=ryFjVsuYIpcaRU2hz/cU1trPw/
 EPHp0HZvGRtqq1aYEOtxMaBjxQO30JQN8+zwKN+uxmJdcMg1iejmnfwbtwwruvOookBFg2RfYBUuY
 CpOQfhGZjSaFVQV2BRsbOpWCIC1SRq2RqVpMm6FtPf8p85Cso+UEOLqJo3+hmSWJWCGN9bmbbEtfP
 JFFD+nlARb5X8QHWjCeXMccaUNOyDLUv7F6upft2xchHmFDnfqjq0zm0Ki55dv/rqns/sUI0eWz9d
 PdwSkCpXMJzO2G48990FIWdRMuyjalrYdtO5VN/WFC6zT9J6GzAWaYJTHwJOEMGqD5vcGpoNYfElm
 hCbsJObA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37866 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1ugQ3W-0000UG-0c;
 Mon, 28 Jul 2025 16:46:26 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1ugQ2o-006KD9-EB; Mon, 28 Jul 2025 16:45:42 +0100
In-Reply-To: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1ugQ2o-006KD9-EB@rmk-PC.armlinux.org.uk>
Date: Mon, 28 Jul 2025 16:45:42 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 3/7] net: stmmac: remove
 redundant WoL option validation
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
