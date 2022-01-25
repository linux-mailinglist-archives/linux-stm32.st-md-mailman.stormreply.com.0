Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD4149B8E8
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jan 2022 17:40:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52551C5F1D6;
	Tue, 25 Jan 2022 16:40:41 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC836C5F1D5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jan 2022 16:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U19cqugfjX+AQvYedy4D0v2k2jykRZ160MoEbsh4D0Y=; b=WGjf0+FjgJ7AklnZmK4NZhfdTJ
 tHfD5O05WMCChz/LOEobRiUkW4sjLtZCChvYP/OU6ITeLyUFRMRuuJ3+3UmZA5e/9a9vgv1j8NDfa
 8l//wGAy9GgRReQDbyqR/qbNyob/a1Elc+LQRaZyklziNAr1AojQ3wbz2ht/b5fl0cQ1Stl4zK8wE
 Rhqr6kNRq5mfvXR4Fp8oO8QwCNWNYN5fmVkewYtlJbB3k1hAaAInsRtcIuzgSocfEgO/tJOU6xFgF
 4rQFa9zswy6ZLo5p8MiBLvpsWAM2SDNMob05iL1B1r8YknXHEY21nqL+Qe9gtOHaQ70ed+EkweVic
 szmw15Yw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57416 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nCOs0-0002BS-0L; Tue, 25 Jan 2022 16:40:36 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nCOrz-005LSj-Dc; Tue, 25 Jan 2022 16:40:35 +0000
In-Reply-To: <YfAnkuhiMoeFcVnb@shell.armlinux.org.uk>
References: <YfAnkuhiMoeFcVnb@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nCOrz-005LSj-Dc@rmk-PC.armlinux.org.uk>
Date: Tue, 25 Jan 2022 16:40:35 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next 3/7] net: stmmac: fill in
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

Tested-by: Wong Vee Khee <vee.khee.wong@linux.intel.com> # Intel EHL            Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index e85ca75d394d..bd20920daf7b 100644
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
