Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6543B2149
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jun 2021 21:36:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F5A2C5662F;
	Wed, 23 Jun 2021 19:36:52 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C311EC424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jun 2021 19:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=T13J8AAOzye0vPE72zOkmKwgCqb3X8Y2nKlK460R0cY=; b=l4RlYytU80yLAKSl4Xth6DXqf0
 BmquKFSwgp7FHexz1xEs42MFaZDR7EFJin0KXyMgWtuFumuVvBbjJAiTkC6JAmrbMfFEdml5XNu8v
 16qklndSkA1nzTKlhrYx6jhQk9vtS7dIJRn+GFIut7ZrfiZnRRzOHU918mhAh8bWEwDw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1lw8fl-00AsjI-68; Wed, 23 Jun 2021 21:36:29 +0200
Date: Wed, 23 Jun 2021 21:36:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Voon, Weifeng" <weifeng.voon@intel.com>
Message-ID: <YNONPZAfmdyBMoL5@lunn.ch>
References: <20210621094536.387442-1-pei.lee.ling@intel.com>
 <20210621094536.387442-4-pei.lee.ling@intel.com>
 <YNCOqGCDgSOy/yTP@lunn.ch>
 <CH0PR11MB53806E2DC74B2B9BE8F84D7088089@CH0PR11MB5380.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH0PR11MB53806E2DC74B2B9BE8F84D7088089@CH0PR11MB5380.namprd11.prod.outlook.com>
Cc: Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>, "Wong,
 Vee Khee" <vee.khee.wong@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Tan,
 Tee Min" <tee.min.tan@intel.com>, "Ling, Pei Lee" <pei.lee.ling@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Russell King <linux@armlinux.org.uk>, "Sit,
 Michael Wei Hong" <michael.wei.hong.sit@intel.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "Ong, Boon Leong" <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next V1 3/4] net: stmmac: Reconfigure
 the PHY WOL settings in stmmac_resume()
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

On Wed, Jun 23, 2021 at 10:06:44AM +0000, Voon, Weifeng wrote:
> > > From: Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>
> > >
> > > After PHY received a magic packet, the PHY WOL event will be triggered
> > > then PHY WOL event interrupt will be disarmed.
> > > Ethtool settings will remain with WOL enabled after a S3/S4 suspend
> > > resume cycle as expected. Hence,the driver should reconfigure the PHY
> > > settings to reenable/disable WOL depending on the ethtool WOL settings
> > > in the resume flow.
> > 
> > Please could you explain this a bit more? I'm wondering if you have a
> > PHY driver bug. PHY WOL should remain enabled until it is explicitly
> > disabled.
> > 
> > 	Andrew
> 
> Let's take Marvell 1510 as example. 
> 
> As explained in driver/net/phy/marvell.c
> 1773 >------->-------/* If WOL event happened once, the LED[2] interrupt pin
> 1774 >------->------- * will not be cleared unless we reading the interrupt status
> 1775 >------->------- * register. 
> 
> The WOL event will not able trigger again if the driver does not clear
> the interrupt status.
> Are we expecting PHY driver will automatically clears the interrupt
> status rather than trigger from the MAC driver?

So you are saying the interrupt it getting discarded? I would of
though it is this interrupt which brings to system out of suspend, and
it should trigger the usual action, i.e. call the interrupt
handler. That should then clear the interrupt.

	 Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
