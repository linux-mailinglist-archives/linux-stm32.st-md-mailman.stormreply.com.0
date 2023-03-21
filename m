Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0099C6C2EB1
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Mar 2023 11:25:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B7C5C6A602;
	Tue, 21 Mar 2023 10:25:01 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28559C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Mar 2023 10:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2/5ZKCRtcozJW7fGgvaCJXkANVONxvDwkzpoVXYWfpA=; b=g0SsILMYrdK9CoBNejEiR55gQk
 K1chqIjm/nDgGtNLESl2IdkWqFpCcDQIkiGwf6C/yeI8w9SxFRqBDLCSq6Rg6m/c76/Yw+j5nIDaj
 2Z0JfT1RqCg3nz/yfL/wRxgyCfmoby/T1GG6n7CodvHUmmbn9bw25waTLSCG7xixjepShUgKQqKdc
 IJeqQCLXGkutSYlq6uyFZr6pkvVqK8vrL8zZPNC8e4qMg+WCr3Sw7QMrRKvptHbLxtpvr+1Tq7cMA
 uGWuVMgZal/BdX7TqZAI4WRshXd+qcAxDXwQT4piVVH9yK1LjPk6AA0HgyL5AzwqyMiqSoR3Vsxel
 D2iTKQLw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44938)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1peZAh-0000rR-AV; Tue, 21 Mar 2023 10:24:51 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1peZAf-0007eU-Na; Tue, 21 Mar 2023 10:24:49 +0000
Date: Tue, 21 Mar 2023 10:24:49 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
Message-ID: <ZBmF8bN6EmbQEE0I@shell.armlinux.org.uk>
References: <20230314070208.3703963-1-michael.wei.hong.sit@intel.com>
 <20230314070208.3703963-2-michael.wei.hong.sit@intel.com>
 <10aff941-e18a-4d77-974b-1760529988a6@lunn.ch>
 <ZBTUTD6RL22pdlmq@shell.armlinux.org.uk>
 <PH0PR11MB7587DC1E7B2947BDB0126F979D819@PH0PR11MB7587.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PH0PR11MB7587DC1E7B2947BDB0126F979D819@PH0PR11MB7587.namprd11.prod.outlook.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Voon,
 Weifeng" <weifeng.voon@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Lai,
 Peter Jun Ann" <peter.jun.ann.lai@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "Ong, Boon Leong" <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "Looi,
 Hong Aun" <hong.aun.looi@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net v2 1/2] net: stmmac: fix PHY handle
	parsing
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

On Tue, Mar 21, 2023 at 08:34:49AM +0000, Sit, Michael Wei Hong wrote:
> 
> 
> > -----Original Message-----
> > From: Russell King <linux@armlinux.org.uk>
> > Sent: Saturday, March 18, 2023 4:58 AM
> > To: Andrew Lunn <andrew@lunn.ch>
> > Cc: Sit, Michael Wei Hong <michael.wei.hong.sit@intel.com>;
> > Giuseppe Cavallaro <peppe.cavallaro@st.com>; Alexandre
> > Torgue <alexandre.torgue@foss.st.com>; Jose Abreu
> > <joabreu@synopsys.com>; David S . Miller
> > <davem@davemloft.net>; Eric Dumazet
> > <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>;
> > Paolo Abeni <pabeni@redhat.com>; Maxime Coquelin
> > <mcoquelin.stm32@gmail.com>; Ong, Boon Leong
> > <boon.leong.ong@intel.com>; netdev@vger.kernel.org; linux-
> > stm32@st-md-mailman.stormreply.com; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Looi,
> > Hong Aun <hong.aun.looi@intel.com>; Voon, Weifeng
> > <weifeng.voon@intel.com>; Lai, Peter Jun Ann
> > <peter.jun.ann.lai@intel.com>
> > Subject: Re: [PATCH net v2 1/2] net: stmmac: fix PHY handle
> > parsing
> > 
> > On Fri, Mar 17, 2023 at 08:56:19PM +0100, Andrew Lunn wrote:
> > > On Tue, Mar 14, 2023 at 03:02:07PM +0800, Michael Sit Wei
> > Hong wrote:
> > > > phylink_fwnode_phy_connect returns 0 when set to
> > MLO_AN_INBAND.
> > > > This causes the PHY handle parsing to skip and the PHY will not
> > be
> > > > attached to the MAC.
> > >
> > > Please could you expand the commit message because i'm
> > having trouble
> > > following this.
> > >
> > > phylink_fwnode_phy_connect() says:
> > >
> > > 	/* Fixed links and 802.3z are handled without needing a
> > PHY */
> > > 	if (pl->cfg_link_an_mode == MLO_AN_FIXED ||
> > > 	    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
> > > 	     phy_interface_mode_is_8023z(pl->link_interface)))
> > > 		return 0;
> > >
> > > So your first statement is not true. It should be
> > MLO_AN_INBAND and
> > > phy_interface_mode_is_8023z.
> > >
> > > > Add additional check for PHY handle parsing when set to
> > MLO_AN_INBAND.
> > >
> > > Looking at the patch, there is no reference to
> > MLO_AN_INBAND, or
> > > managed = "in-band-status";
> > 
> > That's the pesky "xpcs_an_inband" which ends up as phylink's
> > "ovr_an_inband"... I'm sure these are random renames of stuff
> > to make sure that people struggle to follow the code.
> > 
> It is as mentioned above, the "xpcs_an_inband" will end up as
> "ovr_an_inband" which will then
> set pl->cfg_link_an_mode = MLO_AN_INBAND in the
> phylink_parse_mode() in phylink.c

Let me make my comment more clear, because I don't think you understood
it correctly.

Please rename "xpcs_an_inband" to "ovr_an_inband" or
"phylink_ovr_an_inband" so it's obvious what it is and where it ends up.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
