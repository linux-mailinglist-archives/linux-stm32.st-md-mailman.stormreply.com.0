Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FB49C85B7
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2024 10:12:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F07BDC78F9D;
	Thu, 14 Nov 2024 09:12:26 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A498C78F9C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2024 09:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hUnkAXCEYyWhwqu2Ap7JAT2p1h1b8+9Y1xqlGsEdk38=; b=RDkKWExwPhrgX3aYe5B32yxGK8
 IqIHixh0BHo4a8oa8eEAdCICIsPU+UkMN3XX9rrKT6jdgWPJFqyoZQWhWL9dpreSjHM8twJPG7q3A
 V6UtO1JmkfqE4sDoOTdAD1vD4op74dN2g6Tir/DMWbesEEMznSgYsiDRpR8J9AqGuTRTAMRKvTHPc
 nU2I8OP3TNbiX0FJBe6wM2skax5S9rUPC8ySxgCfpfEr5gxJOTtMjViUEQFg7sqKsU2yaput+XC0Q
 dschMRkuOyhkvzrB21aZYqq0OrtCREcUYhcaLm89J1aJYAwi/avmiUYW2a6GbxxdGN3rbfSoWGcSs
 zbfoZMuA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50080)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tBVtZ-0007he-0J;
 Thu, 14 Nov 2024 09:12:09 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tBVtW-0000zI-2c;
 Thu, 14 Nov 2024 09:12:06 +0000
Date: Thu, 14 Nov 2024 09:12:06 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <ZzW-5gj0cdbwdwZv@shell.armlinux.org.uk>
References: <20241112072447.3238892-1-yong.liang.choong@linux.intel.com>
 <20241112072447.3238892-2-yong.liang.choong@linux.intel.com>
 <f8ec2c77-33fa-45a8-9b6b-4be15e5f3658@gmail.com>
 <71b6be0e-426f-4fb4-9d28-27c55d5afa51@lunn.ch>
 <eb937669-d4ce-4b72-bcae-0660e1345b76@linux.intel.com>
 <ZzW8t2bCTXJCP7-_@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZzW8t2bCTXJCP7-_@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net v1 1/2] net: phy: Introduce
 phy_update_eee() to update eee_cfg values
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

On Thu, Nov 14, 2024 at 09:02:47AM +0000, Russell King (Oracle) wrote:
> On Wed, Nov 13, 2024 at 06:10:55PM +0800, Choong Yong Liang wrote:
> > On 12/11/2024 9:04 pm, Andrew Lunn wrote:
> > > On Tue, Nov 12, 2024 at 12:03:15PM +0100, Heiner Kallweit wrote:
> > > > In stmmac_ethtool_op_get_eee() you have the following:
> > > > 
> > > > edata->tx_lpi_timer = priv->tx_lpi_timer;
> > > > edata->tx_lpi_enabled = priv->tx_lpi_enabled;
> > > > return phylink_ethtool_get_eee(priv->phylink, edata);
> > > > 
> > > > You have to call phylink_ethtool_get_eee() first, otherwise the manually
> > > > set values will be overridden. However setting tx_lpi_enabled shouldn't
> > > > be needed if you respect phydev->enable_tx_lpi.
> > > 
> > > I agree with Heiner here, this sounds like a bug somewhere, not
> > > something which needs new code in phylib. Lets understand why it gives
> > > the wrong results.
> > > 
> > > 	Andrew
> > Hi Russell, Andrew, and Heiner, thanks a lot for your valuable feedback.
> > 
> > The current implementation of the 'ethtool --show-eee' command heavily
> > relies on the phy_ethtool_get_eee() in phy.c. The eeecfg values are set by
> > the 'ethtool --set-eee' command and the phy_support_eee() during the initial
> > state. The phy_ethtool_get_eee() calls eeecfg_to_eee(), which returns the
> > eeecfg containing tx_lpi_timer, tx_lpi_enabled, and eee_enable for the
> > 'ethtool --show-eee' command.
> 
> These three members you mention are user configuration members.
> 
> > The tx_lpi_timer and tx_lpi_enabled values stored in the MAC or PHY driver
> > are not retrieved by the 'ethtool --show-eee' command.
> 
> tx_lpi_timer is the only thing that the MAC driver should be concerned
> with - it needs to program the MAC according to the timer value
> specified. Whether LPI is enabled or not is determined by
> phydev->enable_tx_lpi. The MAC should be using nothing else.
> 
> > Currently, we are facing 3 issues:
> > 1. When we boot up our system and do not issue the 'ethtool --set-eee'
> > command, and then directly issue the 'ethtool --show-eee' command, it always
> > shows that EEE is disabled due to the eeecfg values not being set. However,
> > in the Maxliner GPY PHY, the driver EEE is enabled.
> 
> So the software state is out of sync with the hardware state. This is a
> bug in the GPY PHY driver.
> 
> If we look at the generic code, we can see that genphy_config_aneg()
> calls __genphy_config_aneg() which then goes on to call
> genphy_c45_an_config_eee_aneg(). genphy_c45_an_config_eee_aneg()
> writes the current EEE configuration to the PHY.
> 
> Now if we look at gpy_config_aneg(), it doesn't do this. Therefore,
> the GPY PHY is retaining its hardware state which is different from
> the software state. This is wrong.

Also note that phy_probe() reads the current configuration from the
PHY. The supported mask is set via phydev->drv->get_features,
which calls genphy_c45_pma_read_abilities() via the GPY driver and
genphy_c45_read_eee_abilities().

phy_probe() then moved on to genphy_c45_read_eee_adv(), which reads
the advertisement mask. If the advertising mask is non-zero, then
EEE is set as enabled.

From your description, it sounds like this isn't working right, and
needs to be debugged. For example, is the PHY changing its EEE
advertisement between phy_probe() and when it is up and running?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
