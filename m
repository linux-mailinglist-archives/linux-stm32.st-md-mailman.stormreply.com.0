Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 367A49C8739
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2024 11:16:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECE24C78F9E;
	Thu, 14 Nov 2024 10:16:46 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B33BAC78F9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2024 10:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UQeUKWqacSfgCW37cA4xUbE+Eq7a4taaKHHUWJFU+2k=; b=EKdxYz4cjDjcDbN/5Eim1cU0zF
 m0Ab8tdmycKewlP4QFRolSJMOyGu2gyQascXJbVJQS2fjLRBP0JkVEGn4kCQWy0cvXF8BSwz6xZTL
 aHzJ8NRFeh518NKW85GgyNAfsBH1/eW8nTyH+9Oo7BD95uFBDgeV6CipZtit3ODL2JK6G+JlzybcW
 wBJRiIXQupbtFsYdCK9Mu1JwSkpOeFiSzHz+TxbqXLNDVMkzKO1J/mxvs9uC8Y3MtK7Cl61H21e0l
 SAfW+CFUDJVcvZAoU8W3eOWbElGWeTAF/zNAU0jq+H0fB7qZlk83x1OrXIk+yuNu8EZ3tqqJ34O4a
 k7zQ6aiQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46564)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tBWtw-0007oh-2N;
 Thu, 14 Nov 2024 10:16:37 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tBWtv-00012F-0T;
 Thu, 14 Nov 2024 10:16:35 +0000
Date: Thu, 14 Nov 2024 10:16:34 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <ZzXOAvc__iQscSb4@shell.armlinux.org.uk>
References: <20241114081653.3939346-1-yong.liang.choong@linux.intel.com>
 <20241114081653.3939346-2-yong.liang.choong@linux.intel.com>
 <ZzXBpEHs0y2_elqK@shell.armlinux.org.uk>
 <ZzXLgEjElnJD1445@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZzXLgEjElnJD1445@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Oleksij Rempel <o.rempel@pengutronix.de>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net v1 1/2] net: phy: set eee_cfg based on
 PHY configuration
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

On Thu, Nov 14, 2024 at 10:05:52AM +0000, Russell King (Oracle) wrote:
> On Thu, Nov 14, 2024 at 09:23:48AM +0000, Russell King (Oracle) wrote:
> > On Thu, Nov 14, 2024 at 04:16:52PM +0800, Choong Yong Liang wrote:
> > > Not all PHYs have EEE enabled by default. For example, Marvell PHYs are
> > > designed to have EEE hardware disabled during the initial state, and it
> > > needs to be configured to turn it on again.
> > > 
> > > This patch reads the PHY configuration and sets it as the initial value for
> > > eee_cfg.tx_lpi_enabled and eee_cfg.eee_enabled instead of having them set to
> > > true by default.
> > 
> > eee_cfg.tx_lpi_enabled is something phylib tracks, and it merely means
> > that LPI needs to be enabled at the MAC if EEE was negotiated:
> > 
> >  * @tx_lpi_enabled: Whether the interface should assert its tx lpi, given
> >  *      that eee was negotiated.
> > 
> > eee_cfg.eee_enabled means that EEE mode was enabled - which is user
> > configuration:
> > 
> >  * @eee_enabled: EEE configured mode (enabled/disabled).
> > 
> > phy_probe() reads the initial PHY state and sets things up
> > appropriately.
> > 
> > However, there is a point where the EEE configuration (advertisement,
> > and therefore eee_enabled state) is written to the PHY, and that should
> > be config_aneg(). Looking at the Marvell driver, it's calling
> > genphy_config_aneg() which eventually calls
> > genphy_c45_an_config_eee_aneg() which does this (via
> > __genphy_config_aneg()).
> > 
> > Please investigate why the hardware state is going out of sync with the
> > software state.
> 
> I think I've found the issue.
> 
> We have phydev->eee_enabled and phydev->eee_cfg.eee_enabled, which looks
> like a bug to me. We write to phydev->eee_cfg.eee_enabled in
> phy_support_eee(), leaving phydev->eee_enabled untouched.
> 
> However, most other places are using phydev->eee_enabled.
> 
> This is (a) confusing and (b) wrong, and having the two members leads
> to this confusion, and makes the code more difficult to follow (unless
> one has already clocked that there are these two different things both
> called eee_enabled).
> 
> This is my untested prototype patch to fix this - it may cause breakage
> elsewhere:

As mentioned in the other thread:

Without a call to phy_support_eee():

EEE settings for eth2:
        EEE status: disabled
        Tx LPI: disabled
        Supported EEE link modes:  100baseT/Full
                                   1000baseT/Full
        Advertised EEE link modes:  Not reported
        Link partner advertised EEE link modes:  100baseT/Full
                                                 1000baseT/Full

With a call to phy_support_eee():

EEE settings for eth2:
        EEE status: enabled - active
        Tx LPI: 0 (us)
        Supported EEE link modes:  100baseT/Full
                                   1000baseT/Full
        Advertised EEE link modes:  100baseT/Full
                                    1000baseT/Full
        Link partner advertised EEE link modes:  100baseT/Full
                                                 1000baseT/Full

So the EEE status is now behaving correctly, and the Marvell PHY is
being programmed with the advertisement correctly.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
