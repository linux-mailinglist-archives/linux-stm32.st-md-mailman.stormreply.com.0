Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70546C300C0
	for <lists+linux-stm32@lfdr.de>; Tue, 04 Nov 2025 09:50:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AF32C62ECF;
	Tue,  4 Nov 2025 08:50:06 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5F2EC62ECD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 08:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GD9/PmM/FWmyHloO+QO6/ZwKLx6kfDA+PsRFEHl+e+M=; b=ddmvZClv++Mm8JUAQBHkW32Do2
 fy2OCqnpW2FDUY0xj0PVlI6C5Yv/PlgwsdLiUyGgaP3yFgAKUchjpPCQDyxCuFgi7IjadKTSUMma6
 bbxyrBJjtCuvgBFreCuqE+ah7EoCI5jFG8c2XKbB4gOmAxM2s0RjGyGT06EBiOsijVljc7KekF8mR
 jzda4iFBjin+F5Z25XOcxTUyZtiHMsGiFovnGZxO8IkF2LWHyp+8Cb+6oQKixEzeHN7lX2RF0LClF
 m2aandSYT3i1cItRpaxjlR5GBM6r4hKNICAispJAixaWMXEnc+lUILTxaWgd19CDPW930GJxg8l/q
 vheYiCcQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33438)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vGCji-000000001tC-3HFr;
 Tue, 04 Nov 2025 08:49:55 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vGCjf-000000004dY-0Anp; Tue, 04 Nov 2025 08:49:51 +0000
Date: Tue, 4 Nov 2025 08:49:50 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <aQm-LnN0LifBvkoz@shell.armlinux.org.uk>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
 <E1vFt4c-0000000Choe-3SII@rmk-PC.armlinux.org.uk>
 <db01f926-d5bb-4317-beac-e6dcc0025a80@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db01f926-d5bb-4317-beac-e6dcc0025a80@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, s32@nxp.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 netdev@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Jan Petrous <jan.petrous@oss.nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Fabio Estevam <festevam@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 04/11] net: stmmac: add
	stmmac_get_phy_intf_sel()
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

On Tue, Nov 04, 2025 at 09:34:31AM +0100, Maxime Chevallier wrote:
> > +int stmmac_get_phy_intf_sel(phy_interface_t interface)
> > +{
> > +	int phy_intf_sel = -EINVAL;
> > +
> > +	if (interface == PHY_INTERFACE_MODE_MII ||
> > +	    interface == PHY_INTERFACE_MODE_GMII)
> > +		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
> > +	else if (phy_interface_mode_is_rgmii(interface))
> > +		phy_intf_sel = PHY_INTF_SEL_RGMII;
> > +	else if (interface == PHY_INTERFACE_MODE_SGMII)
> > +		phy_intf_sel = PHY_INTF_SEL_SGMII;
> > +	else if (interface == PHY_INTERFACE_MODE_RMII)
> > +		phy_intf_sel = PHY_INTF_SEL_RMII;
> > +	else if (interface == PHY_INTERFACE_MODE_REVMII)
> > +		phy_intf_sel = PHY_INTF_SEL_REVMII;
> > +
> > +	return phy_intf_sel;
> > +}
> > +EXPORT_SYMBOL_GPL(stmmac_get_phy_intf_sel);
> 
> Nothng wrong with your code, this is out of curiosity.
> 
> I'm wondering how we are going to support cases like socfpga (and
> probably some other) where the PHY_INTF_SEL_xxx doesn't directly
> translate to the phy_interface, i.e.  when you have a PCS or other
> IP that serialises the MAC interface ?

It also doesn't differentiate between MII and GMII. That's fine for
this - this is about producing the configuration for the dwmac's
phy_intf_sel_i signals. It isn't for configuring the glue hardware
for any other parameters such as RGMII delays.
 
> for socfpga for example, we need to set the PHY_INTF_SEL to GMII_MII
> when we want to use SGMII / 1000BaseX, but we do set it to RGMII when
> we need to output RGMII.

From what I remember for socfpga, you use an external PCS that needs
GMII. This function doesn't take account of external PCS, and thus
platform glue that makes use of an external PCS can't implement
.set_phy_intf_sel() yet. As noted, it also doesn't handle TBI (which,
although we have PHY_INTERFACE_MODE_TBI, Synopsys intended this mode
to be used to connect to a SerDes for 1000BASE-X.)

> Do you have a plan in mind for that ? (maybe a .get_phy_intf_sel() ops ?)

Yes, there will need to be a way to override this when an external
PCS is being used. I suspect that all external 1G PCS will use GMII,
thus we can probably work it out in core code.

Note, however, that socfpga doesn't use the phy_intf_sel encoding:

#define SYSMGR_EMACGRP_CTRL_PHYSEL_ENUM_GMII_MII 0x0
#define SYSMGR_EMACGRP_CTRL_PHYSEL_ENUM_RGMII 0x1
#define SYSMGR_EMACGRP_CTRL_PHYSEL_ENUM_RMII 0x2

#define PHY_INTF_SEL_GMII_MII   0
#define PHY_INTF_SEL_RGMII      1
#define PHY_INTF_SEL_RMII       4

It's close, but it isn't the phy_intf_sel_i[2:0] signal values.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
