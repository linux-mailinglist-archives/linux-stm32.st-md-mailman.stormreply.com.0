Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E10EA14BCF
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jan 2025 10:05:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF924C78F80;
	Fri, 17 Jan 2025 09:05:41 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A96FC78F7D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2025 09:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=803wd+XrzBXv/QN065wJvFDvqjKzNdhjPPcBp4nDMNs=; b=HX3fKtFbUqxKAN4DIM4+2//X1i
 6RoO4ZdaRl4KVIRBvmMhjilyidMLFXYNUp91yf4wC7jeyfugFaMkd40yPnqs9IkPvTRCYco9FNYlB
 29Iq3e/UvpgMywxIbMobGrpzNA70pFIXZWf8owPazU4DMbuzYpTu8OmcbiarPlMSxdK+9tjCS1xFo
 8jJkGWlk4w2K/+pf+qPDCL8SH0BYLwBCx7cOrBhGLQgUdxmpK+F6c0ekKXY9OICgFjIZBIY1citnO
 /k5FnhUkM9oPhUN/PSKxpp0OBW+oF9aGjKg0WaplA3lxunJ+l9m0GO3FW+t/WUCLd/2iYNX6q0gKp
 sep/HoBw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60586)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tYiI8-0003U5-1q;
 Fri, 17 Jan 2025 09:05:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tYiI4-00089U-0u;
 Fri, 17 Jan 2025 09:05:20 +0000
Date: Fri, 17 Jan 2025 09:05:20 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Message-ID: <Z4odUIWmYb8TelZS@shell.armlinux.org.uk>
References: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
 <06d301db68bd$b59d3c90$20d7b5b0$@trustnetic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <06d301db68bd$b59d3c90$20d7b5b0$@trustnetic.com>
Cc: 'Andrew Lunn' <andrew@lunn.ch>, 'Paolo Abeni' <pabeni@redhat.com>,
 'Marcin Wojtas' <marcin.s.wojtas@gmail.com>, UNGLinuxDriver@microchip.com,
 'Bryan Whitehead' <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 'Andrew Lunn' <andrew+netdev@lunn.ch>, 'Eric Dumazet' <edumazet@google.com>,
 'Maxime Coquelin' <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 'Jakub Kicinski' <kuba@kernel.org>, mengyuanlou@net-swift.com,
 "'David S. Miller'" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, 'Heiner Kallweit' <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 0/9] net: add phylink managed EEE
	support
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

On Fri, Jan 17, 2025 at 04:56:34PM +0800, Jiawen Wu wrote:
> > Hi,
> > 
> > Adding managed EEE support to phylink has been on the cards ever since
> > the idea in phylib was mooted. This overly large series attempts to do
> > so. I've included all the patches as it's important to get the driver
> > patches out there.
> > 
> > Patch 1 adds a definition for the clock stop capable bit in the PCS
> > MMD status register.
> > 
> > Patch 2 adds a phylib API to query whether the PHY allows the transmit
> > xMII clock to be stopped while in LPI mode. This capability is for MAC
> > drivers to save power when LPI is active, to allow them to stop their
> > transmit clock.
> > 
> > Patch 3 extracts a phylink internal helper for determining whether the
> > link is up.
> > 
> > Patch 4 adds basic phylink managed EEE support. Two new MAC APIs are
> > added, to enable and disable LPI. The enable method is passed the LPI
> > timer setting which it is expected to program into the hardware, and
> > also a flag ehther the transmit clock should be stopped.
> > 
> > I have taken the decision to make enable_tx_lpi() to return an error
> > code, but not do much with it other than report it - the intention
> > being that we can later use it to extend functionality if needed
> > without reworking loads of drivers.
> > 
> > I have also dropped the validation/limitation of the LPI timer, and
> > left that in the driver code prior to calling phylink_ethtool_set_eee().
> > 
> > The remainder of the patches convert mvneta, lan743x and stmmac, and
> > add support for mvneta.
> > 
> > Since yesterday's RFC:
> > - fixed the mvpp2 GENMASK()
> > - dropped the DSA patch
> > - changed how phylink restricts EEE advertisement, and the EEE support
> >   reported to userspace which fixes a bug.
> > 
> >  drivers/net/ethernet/marvell/mvneta.c             | 107 ++++++++++------
> >  drivers/net/ethernet/marvell/mvpp2/mvpp2.h        |   5 +
> >  drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c   |  86 +++++++++++++
> >  drivers/net/ethernet/microchip/lan743x_ethtool.c  |  21 ---
> >  drivers/net/ethernet/microchip/lan743x_main.c     |  46 ++++++-
> >  drivers/net/ethernet/microchip/lan743x_main.h     |   1 -
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  57 +++++++--
> >  drivers/net/phy/phy.c                             |  20 +++
> >  drivers/net/phy/phylink.c                         | 149 ++++++++++++++++++++--
> >  include/linux/phy.h                               |   1 +
> >  include/linux/phylink.h                           |  45 +++++++
> >  include/uapi/linux/mdio.h                         |   1 +
> >  12 files changed, 446 insertions(+), 93 deletions(-)
> 
> Since merging these patches, phylink_connect_phy() can no longer be
> invoked correctly in ngbe_open(). The error is returned from the function
> phy_eee_rx_clock_stop(). Since EEE is not supported on our NGBE hardware.

That would mean phy_modify_mmd() is failing, but the question is why
that is. Please investigate. Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
