Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C260D6CD6DA
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Mar 2023 11:48:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A796C69069;
	Wed, 29 Mar 2023 09:48:33 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1620C65E6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Mar 2023 09:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=au9j1RKX6uBNeqzDDu1OuVZGAvYR+PBKjc7fF9etf8g=; b=uQR1dij+ectpu7hzYEJ45EbjLP
 sQ/NxyhnOmjLTKzzlicb6edwu3KbL2D9pfnGksaT1qEvWY28vo3bmL+uWaB3oSQwJBHho1RPlZ4ZH
 Yw8gA5FGztN+Szwpc3fs00oAbQIliZ3Fbv7UOaoGaC3gtDXLlZn8VVEPw/bCiIxeBLoWGkWRYPRQm
 He4yJWhNFMe+Y8c3Gc9d4L5Cebsh0LzVydvvdbW3NeKnckV7xbaXPbHFyoDRBR8+/d1n/4YEKgyBq
 vHrBAElZLL1vlGjGB3R9dcOLxSE0iVbDHcos/7joOAQS0mcNtMSpCzh7Lq0i6nfx9MJF2UtzEcM6l
 NH2HaebA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41268)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1phSPd-0008J7-UH; Wed, 29 Mar 2023 10:48:13 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1phSPZ-0007Pv-Qo; Wed, 29 Mar 2023 10:48:09 +0100
Date: Wed, 29 Mar 2023 10:48:09 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
Message-ID: <ZCQJWcdfmualIjvX@shell.armlinux.org.uk>
References: <20230324081656.2969663-1-michael.wei.hong.sit@intel.com>
 <20230324081656.2969663-2-michael.wei.hong.sit@intel.com>
 <20230328185720.6239e4a7@kernel.org>
 <ZCP+aIoUTw2laZ3/@shell.armlinux.org.uk>
 <PH0PR11MB7587808A98658C9F075A0C309D899@PH0PR11MB7587.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PH0PR11MB7587808A98658C9F075A0C309D899@PH0PR11MB7587.namprd11.prod.outlook.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Voon,
 Weifeng" <weifeng.voon@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Lai,
 Peter Jun Ann" <peter.jun.ann.lai@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "Ong,
 Boon Leong" <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 "Looi, Hong Aun" <hong.aun.looi@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net v3 1/3] net: phylink: add
	phylink_expects_phy() method
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

On Wed, Mar 29, 2023 at 09:34:05AM +0000, Sit, Michael Wei Hong wrote:
> 
> 
> > -----Original Message-----
> > From: Russell King <linux@armlinux.org.uk>
> > Sent: Wednesday, March 29, 2023 5:01 PM
> > To: Jakub Kicinski <kuba@kernel.org>
> > Cc: Sit, Michael Wei Hong <michael.wei.hong.sit@intel.com>;
> > Giuseppe Cavallaro <peppe.cavallaro@st.com>; Alexandre Torgue
> > <alexandre.torgue@foss.st.com>; Jose Abreu
> > <joabreu@synopsys.com>; David S . Miller <davem@davemloft.net>;
> > Eric Dumazet <edumazet@google.com>; Paolo Abeni
> > <pabeni@redhat.com>; Maxime Coquelin
> > <mcoquelin.stm32@gmail.com>; Ong, Boon Leong
> > <boon.leong.ong@intel.com>; netdev@vger.kernel.org; linux-
> > stm32@st-md-mailman.stormreply.com; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Looi,
> > Hong Aun <hong.aun.looi@intel.com>; Voon, Weifeng
> > <weifeng.voon@intel.com>; Lai, Peter Jun Ann
> > <peter.jun.ann.lai@intel.com>
> > Subject: Re: [PATCH net v3 1/3] net: phylink: add
> > phylink_expects_phy() method
> > 
> > On Tue, Mar 28, 2023 at 06:57:20PM -0700, Jakub Kicinski wrote:
> > > On Fri, 24 Mar 2023 16:16:54 +0800 Michael Sit Wei Hong wrote:
> > > > Provide phylink_expects_phy() to allow MAC drivers to check if it
> > is
> > > > expecting a PHY to attach to. Since fixed-linked setups do not
> > need
> > > > to attach to a PHY.
> > > >
> > > > Provides a boolean value as to if the MAC should expect a PHY.
> > > > returns true if a PHY is expected.
> > > >
> > > > Signed-off-by: Michael Sit Wei Hong
> > <michael.wei.hong.sit@intel.com>
> > >
> > > Russell, looks good?
> > 
> > Not really, given that phylink_attach_phy() will refuse to attach a
> > PHY
> > when:
> > 
> >         if (WARN_ON(pl->cfg_link_an_mode == MLO_AN_FIXED ||
> >                     (pl->cfg_link_an_mode == MLO_AN_INBAND &&
> >                      phy_interface_mode_is_8023z(interface) && !pl-
> > >sfp_bus)))
> >                 return -EINVAL;
> > 
> > So, if we introduce a helper named "phylink_expects_phy" that
> > returns true when cfg_link_an_mode == MLO_AN_INBAND and the
> > interface mode is e.g. 1000base-X, but then someone tries to attach
> > a PHY, the kernel spits out a warning, backtrace, and a return value
> > of -EINVAL, things are going to look really rather stupid.
> > 
> Should we check for these 3 conditions as well then?
> (pl->cfg_link_an_mode == MLO_AN_INBAND &&
> phy_interface_mode_is_8023z(interface) && !pl->sfp_bus)
> to determine if phylink expects a phy.

If there's a sfp bus, then we don't expect a PHY from the MAC driver
(as there can only be one PHY attached), and as phylink_expects_phy()
is for the MAC driver to use, we should be returning false if
pl->sfp_bus != NULL.

	pl->cfg_link_an_mode == MLO_AN_FIXED ||
	(pl->cfg_link_an_mode == MLO_AN_INBAND &&
	 phy_interface_mode_is_8023z(interface))

Is true when we're in fixed-link mode, or if we're in in-band mode
and using 1000base-X or 25000base-X. These are the conditions that
we don't expect the MAC driver to give us a PHY.

To put that in positive logic, we expect a PHY from the MAC when
we're in PHY mode, or when we're in in-band mode and using SGMII,
QSGMII, USXGMII, RGMII, etc.

The reason for the extra "&& !pl->sfp_bus" in phylink_attach_phy()
is to allow SFPs to connect to the MAC using inband mode with
1000base-X and 2500base-X interface modes. These are not for the
MAC-side of things though.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
