Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0D74772C7
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 14:12:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF1CBC5F1E0;
	Thu, 16 Dec 2021 13:12:35 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 523E9C5F1D8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 13:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I7p7qWB1CvF3K3PC5KtQwYzw4iKptOC1jBzUIZS8nuQ=; b=Vc/djmSmMUBtB/W7WZKM9cEyNU
 PNehhar7fgg9sW6TtWL/SvHKYywa2ZRjTkbuExSNY713InKWpQFL/NmM7I48wfIFA4+b+WDCzAvfO
 gb00IkzRZrSctP76AWEFeW+LXdyXLeAn7ofUlinY7QPysJd0yeut6vTWMurlZXEjy0AaW+AqKe5KC
 uTnDqLfyBVogM30lMn3YkSOXmgERHJkWXa/MU4Nahp713AfYej3Ww6zqJ1XdWV5dHXtqahN3UDSjk
 z8vD2/nRRj4FGskGZlQJX0eEl7NpD9zZ3shkNnsxXcycKlJpQpg5L8lIT2iHZNv9UC12bHhMvkcVU
 iwf9GM2g==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49904 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mxqYd-0007ss-VT; Thu, 16 Dec 2021 13:12:28 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mxqYd-00GYYi-IA; Thu, 16 Dec 2021 13:12:27 +0000
In-Reply-To: <Ybs7DNDkBrf73jDi@shell.armlinux.org.uk>
References: <Ybs7DNDkBrf73jDi@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1mxqYd-00GYYi-IA@rmk-PC.armlinux.org.uk>
Date: Thu, 16 Dec 2021 13:12:27 +0000
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH CFT net-next 3/6] net: stmmac: fill in
	supported_interfaces
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

Fill in phylink's supported_interfaces bitmap with the PHY interface
modes which can be used to talk to the PHY.

We indicate that the PHY interface mode passed in platform data is
always supported, as this is the initial mode passed into phylink.
When there is no PCS specified, we assume that this is the only mode
that is supported - indeed, the driver appears not to support dynamic
switching of interface types at present.

When a xpcs is present, it defines the PHY interface modes that the
stmmac driver can support. Request the supported interfaces from the
xpcs driver, and pass them to phylink.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 09bef8310360..b8ec8afb95a6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1194,6 +1194,14 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	if (!fwnode)
 		fwnode = dev_fwnode(priv->device);
 
+	/* Set the platform/firmware specified interface mode */
+	__set_bit(mode, priv->phylink_config.supported_interfaces);
+
+	/* If we have an xpcs, it defines which PHY interfaces are supported. */
+	if (priv->hw->xpcs)
+		xpcs_get_interfaces(priv->hw->xpcs,
+				    priv->phylink_config.supported_interfaces);
+
 	priv->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
 		MAC_10 | MAC_100;
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
