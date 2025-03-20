Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB285A6B06B
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Mar 2025 23:11:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAA56C78F64;
	Thu, 20 Mar 2025 22:11:38 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98C62C78F60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 22:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hcYp9hNRaYo3FHlKzDyc/CZ+B5XrhtdAFoiCibNzyHQ=; b=rcsXQJB2hJJSR1tNFKb+qMkTMH
 lA7xcJQEtbvSZQ6xL+ibPTjFAAkxEVYTkdeq5C1FRmHIG7C2J2aJdsEgUgVm4mqC2sK48oIoGB5JL
 SAbD+Om/vnnDlienlAjJts9zUr3Qc3lWdekxDFAsiVPj9grjunFzNoI6S1XQB8SOFEYAtTEGfAphS
 gIi+MvXRbBngTM1tyI2t/6aAZlSo57lCKmGsQ5G3MPM0K7z+sE/GFDC1SFvzrtQAbq64HE3i6zlDl
 OkdoD7O3CxuzEIyzHdxwk63pRy4npIL5KaR7K2FT0dgz6M/lQgF2K78neCDfWzpTCeY66rKO9GvPp
 r7pGwJTg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60906 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tvO6v-0008Dq-01;
 Thu, 20 Mar 2025 22:11:33 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tvO6a-008Vjh-FG; Thu, 20 Mar 2025 22:11:12 +0000
In-Reply-To: <Z9ySeo61VYTClIJJ@shell.armlinux.org.uk>
References: <Z9ySeo61VYTClIJJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tvO6a-008Vjh-FG@rmk-PC.armlinux.org.uk>
Date: Thu, 20 Mar 2025 22:11:12 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/5] net: stmmac: address non-LPI
 resume failures properly
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

The Synopsys Designware GMAC core databook requires all clocks to be
active in order to complete software reset, which we perform during
resume.

However, IEEE 802.3 allows a PHY to stop its clocks when placed in
low-power mode, which happens when the system is suspended and WoL
is not enabled.

As an attempt to work around this, commit 36d18b5664ef ("net: stmmac:
start phylink instance before stmmac_hw_setup()") started phylink
early, but this has the side effect that the mac_link_up() method may
be called before or during the initialisation of GMAC hardware.

We also have the socfpga glue driver directly calling phy_resume()
also as an attempt to work around this.

In a previous commit, phylink_prepare_resume() has been introduced
to give MAC drivers a way to ensure that the PHY is resumed prior to
their initialisation of their MAC hardware. This commit adds the call,
and moves the phylink_resume() call back to where it should be before
the aforementioned commit.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a6a533d8a45b..860f800cd014 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7936,12 +7936,12 @@ int stmmac_resume(struct device *dev)
 	}
 
 	rtnl_lock();
-	phylink_resume(priv->phylink);
-	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
-		phylink_speed_up(priv->phylink);
-	rtnl_unlock();
 
-	rtnl_lock();
+	/* Prepare the PHY to resume, ensuring that its clocks which are
+	 * necessary for the MAC DMA reset to complete are running
+	 */
+	phylink_prepare_resume(priv->phylink);
+
 	mutex_lock(&priv->lock);
 
 	stmmac_reset_queues_param(priv);
@@ -7959,6 +7959,15 @@ int stmmac_resume(struct device *dev)
 	stmmac_enable_all_dma_irq(priv);
 
 	mutex_unlock(&priv->lock);
+
+	/* phylink_resume() must be called after the hardware has been
+	 * initialised because it may bring the link up immediately in a
+	 * workqueue thread, which will race with initialisation.
+	 */
+	phylink_resume(priv->phylink);
+	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
+		phylink_speed_up(priv->phylink);
+
 	rtnl_unlock();
 
 	netif_device_attach(ndev);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
