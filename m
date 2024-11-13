Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFA99C7EAB
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2024 00:05:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79612C78F92;
	Wed, 13 Nov 2024 23:05:44 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27B67C78F90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2024 23:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=GB4QZ+mM5xOGHoULP0fYX3jiIBGiTo1R3yaoqBjOj5Y=; b=5N1dky3izdPIxJ3m4NqFAWVQJ4
 mRJmi3jX4gbqJ78GHW1iDJAJht9Hd+iAm0FYWf2J1ibs2X03qyTBFFKLFMNITN6IavGcZ/PfwMivz
 yNS3bSdKVz2MCcAB+BRrWnvU71onxne2Qp+ZAHWRYJMPc2z1zUM8BO1gz4nBFNlz4BPg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tBMQJ-00DDd7-1P; Thu, 14 Nov 2024 00:05:19 +0100
Date: Thu, 14 Nov 2024 00:05:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <b61a9c36-dfd5-4b90-88a6-90e43cfae000@lunn.ch>
References: <20241112072447.3238892-1-yong.liang.choong@linux.intel.com>
 <20241112072447.3238892-2-yong.liang.choong@linux.intel.com>
 <f8ec2c77-33fa-45a8-9b6b-4be15e5f3658@gmail.com>
 <71b6be0e-426f-4fb4-9d28-27c55d5afa51@lunn.ch>
 <eb937669-d4ce-4b72-bcae-0660e1345b76@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eb937669-d4ce-4b72-bcae-0660e1345b76@linux.intel.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
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

On Wed, Nov 13, 2024 at 06:10:55PM +0800, Choong Yong Liang wrote:
> 
> 
> On 12/11/2024 9:04 pm, Andrew Lunn wrote:
> > On Tue, Nov 12, 2024 at 12:03:15PM +0100, Heiner Kallweit wrote:
> > > In stmmac_ethtool_op_get_eee() you have the following:
> > > 
> > > edata->tx_lpi_timer = priv->tx_lpi_timer;
> > > edata->tx_lpi_enabled = priv->tx_lpi_enabled;
> > > return phylink_ethtool_get_eee(priv->phylink, edata);
> > > 
> > > You have to call phylink_ethtool_get_eee() first, otherwise the manually
> > > set values will be overridden. However setting tx_lpi_enabled shouldn't
> > > be needed if you respect phydev->enable_tx_lpi.
> > 
> > I agree with Heiner here, this sounds like a bug somewhere, not
> > something which needs new code in phylib. Lets understand why it gives
> > the wrong results.
> > 
> > 	Andrew
> Hi Russell, Andrew, and Heiner, thanks a lot for your valuable feedback.
> 
> The current implementation of the 'ethtool --show-eee' command heavily
> relies on the phy_ethtool_get_eee() in phy.c. The eeecfg values are set by
> the 'ethtool --set-eee' command and the phy_support_eee() during the initial
> state. The phy_ethtool_get_eee() calls eeecfg_to_eee(), which returns the
> eeecfg containing tx_lpi_timer, tx_lpi_enabled, and eee_enable for the
> 'ethtool --show-eee' command.
> 
> The tx_lpi_timer and tx_lpi_enabled values stored in the MAC or PHY driver
> are not retrieved by the 'ethtool --show-eee' command.

tx_lpi_timer is a MAC property, but phylib does track it across
--set-eee calls and will fill it in for get-eee. What however is
missing it setting its default value. There is currently no API the
MAC driver can call to let phylib know what default value it is using.
Either such an API could be added, e.g. as part of phy_support_eee(),
or we could hard code a value, probably again in phy_support_eee().

tx_lpi_enabled is filled in by phy_ethtool_get_eee(), and its default
value is set by phy_support_eee(). So i don't see what is wrong here.

> Currently, we are facing 3 issues:
> 1. When we boot up our system and do not issue the 'ethtool --set-eee'
> command, and then directly issue the 'ethtool --show-eee' command, it always
> shows that EEE is disabled due to the eeecfg values not being set. However,
> in the Maxliner GPY PHY, the driver EEE is enabled. If we try to disable
> EEE, nothing happens because the eeecfg matches the setting required to
> disable EEE in ethnl_set_eee(). The phy_support_eee() was introduced to set
> the initial values to enable eee_enabled and tx_lpi_enabled. This would
> allow 'ethtool --show-eee' to show that EEE is enabled during the initial
> state. However, the Marvell PHY is designed to have hardware disabled EEE
> during the initial state. Users are required to use Ethtool to enable the
> EEE. phy_support_eee() does not show the correct for Marvell PHY.

We discussed what to set the initial state to when we reworked the EEE
support. It is a hard problem, because changing anything could cause
regressions. Some users don't want EEE enabled, because it can add
latency and jitter, e.g. to PTP packets. Some users want it enabled
for the power savings.

We decided to leave the PHY untouched, and will read out its
configuration. If this is going wrong, that is a bug which should be
found and fixed.

We want the core to be fixed, not workaround added to MAC
drivers. Please think about this when proposing future patches.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
