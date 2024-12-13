Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2B59F0C24
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Dec 2024 13:23:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E908C78015;
	Fri, 13 Dec 2024 12:23:12 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BC59C78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2024 12:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8o62DSx4bVg4R+vubTqLz/49UYeh2IHQsgoBXnPSoeY=; b=nm/VgZJaaGNr3qq3O2J2BpfjOy
 zAxxKNtWRr5bjL8YFcYmb7sVk3TEZEI3BfnL9VDeLRh5JJCPeDkqQdUZnanAqpQRvGEM0gB8Toi8o
 L5cWUv2bnjpZO3hEVRdzaQQhovHZ/sHuy1cXwHGJ/MUo2kv6LZmQSG6OZAU4xbDHfEAKF5khexb65
 Jynpcj6Gvpk4R+isbCAyEbVFi8MVmU3h3MSM7LKTTuMhwF7iIUewsfVJTx0IGdRLt6iAagplGxgn6
 Gk6g6lxO4ipv+GQ5L2j92NTaVUGqcCiIFUZszetmcGRCC/8C3zP5FhRD+tGsn/BIMd3E3fKRytJ3p
 Op5ULE4Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53938)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tM4h0-0006gB-13;
 Fri, 13 Dec 2024 12:22:50 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tM4gv-0006J0-2R;
 Fri, 13 Dec 2024 12:22:45 +0000
Date: Fri, 13 Dec 2024 12:22:45 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <Z1wnFXlgEU84VX8F@shell.armlinux.org.uk>
References: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
 <20241213090526.71516-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241213090526.71516-3-maxime.chevallier@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: dwmac-socfpga:
 Set interface modes from Lynx PCS as supported
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

On Fri, Dec 13, 2024 at 10:05:25AM +0100, Maxime Chevallier wrote:
> On Socfpga, the dwmac controller uses a variation of the Lynx PCS to get
> additional support for SGMII and 1000BaseX. The switch between these
> modes may occur at runtime (e.g. when the interface is wired to an SFP
> cage). In such case, phylink will validate the newly selected interface
> between the MAC and SFP based on the internal "supported_interfaces"
> field.
> 
> For now in stmmac, this field is populated based on :
>  - The interface specified in firmware (DT)
>  - The interfaces supported by XPCS, when XPCS is in use.
> 
> In our case, the PCS in Lynx and not XPCS.
> 
> This commit makes so that the .pcs_init() implementation of
> dwmac-socfpga populates the supported_interface when the Lynx PCS was
> successfully initialized.

I think it would also be worth adding this to Lynx, so phylink also
gets to know (via its validation) which PHY interface modes the PCS
can support.

However, maybe at this point we need to introduce an interface bitmap
into struct phylink_pcs so that these kinds of checks can be done in
phylink itself when it has the PCS, and it would also mean that stmmac
could do something like:

	struct phylink_pcs *pcs;

	if (priv->hw->xpcs)
		pcs = xpcs_to_phylink_pcs(priv->hw->xpcs);
	else
		pcs = priv->hw->phylink_pcs;

	if (pcs)
		phy_interface_or(priv->phylink_config.supported_interfaces,
				 priv->phylink_config.supported_interfaces,
				 pcs->supported_interfaces);

and not have to worry about this from individual PCS or platform code.

8<===
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next] net: pcs: lynx: implement pcs_validate()

Implement .pcs_validate() to restrict the interfaces to those which the
Lynx PCS supports.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-lynx.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/pcs/pcs-lynx.c b/drivers/net/pcs/pcs-lynx.c
index 767a8c0714ac..fd2e06dba92e 100644
--- a/drivers/net/pcs/pcs-lynx.c
+++ b/drivers/net/pcs/pcs-lynx.c
@@ -326,7 +326,22 @@ static void lynx_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 	}
 }
 
+static int lynx_pcs_validate(struct phylink_pcs *pcs, unsigned long *supported,
+			     const struct phylink_link_state *state)
+{
+	if (state->interface != PHY_INTERFACE_MODE_SGMII &&
+	    state->interface != PHY_INTERFACE_MODE_QSGMII &&
+	    state->interface != PHY_INTERFACE_MODE_1000BASEX &&
+	    state->interface != PHY_INTERFACE_MODE_2500BASEX &&
+	    state->interface != PHY_INTERFACE_MODE_10GBASER &&
+	    state->interface != PHY_INTERFACE_MODE_USXGMII)
+		return -EINVAL;
+
+	return 0;
+}
+
 static const struct phylink_pcs_ops lynx_pcs_phylink_ops = {
+	.pcs_validate = lynx_pcs_validate,
 	.pcs_inband_caps = lynx_pcs_inband_caps,
 	.pcs_get_state = lynx_pcs_get_state,
 	.pcs_config = lynx_pcs_config,
-- 
2.30.2

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
