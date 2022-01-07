Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E260348787B
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jan 2022 14:47:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91038C60460;
	Fri,  7 Jan 2022 13:47:27 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A3EECFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jan 2022 13:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641563246; x=1673099246;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=S6EB7K/mWQGJ4edWsfLqzaPrJ4f9R1H4mn7kwvidIW0=;
 b=I48AmC1bkQM5Vn9AJ26gyLQfDPyBzCs5POKiSbZkOfMohvLq4neDNBku
 eXmL4lqk6ZapJoiktoUpxYfoV8QaV+EodWv8XfRIpi4rjOxY7q/Mq7BZT
 LE48cC5XIyoLkN+iRJq+t2UJEZu67mXoUwa12p4E08vZNkTVwMYC62pBM
 32j3JMXZ4SRqVB2kAVtP+ITiBW5OTMowtIUScLwzE1eSXF0oxEvMvLFbf
 maWS0JDPRRDe557+YuasleQY9q59sWwMlz5tbkg4fdIfGnH76xd/Ukzzd
 0IKkdF4mFaK3vQ2vM1/I7ktur++0MMS0wgf8tYQCe7wuyjCZQ11q3py2O A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="242820362"
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; d="scan'208";a="242820362"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 05:47:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; d="scan'208";a="513800161"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 07 Jan 2022 05:47:23 -0800
Received: from linux.intel.com (vwong3-iLBPG3.png.intel.com [10.88.229.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id D5238580806;
 Fri,  7 Jan 2022 05:47:20 -0800 (PST)
Date: Fri, 7 Jan 2022 21:47:17 +0800
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20220107134717.GA10144@linux.intel.com>
References: <Ybs7DNDkBrf73jDi@shell.armlinux.org.uk>
 <20211217055729.GA14835@linux.intel.com>
 <YdhCts9ZPMyzO8oX@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YdhCts9ZPMyzO8oX@shell.armlinux.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH CFT net-next 0/6] net: stmmac/xpcs:
	modernise PCS support
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

On Fri, Jan 07, 2022 at 01:40:06PM +0000, Russell King (Oracle) wrote:
> On Fri, Dec 17, 2021 at 01:57:29PM +0800, Wong Vee Khee wrote:
> > On Thu, Dec 16, 2021 at 01:11:40PM +0000, Russell King (Oracle) wrote:
> > > Hi,
> > > 
> > > This series updates xpcs and stmmac for the recent changes to phylink
> > > to better support split PCS and to get rid of private MAC validation
> > > functions.
> > > 
> > > This series is slightly more involved than other conversions as stmmac
> > > has already had optional proper split PCS support.
> > > 
> > > The patches:
> > > 
> > > 1) Provide a function to query the xpcs for the interface modes that
> > >    are supported.
> > > 
> > > 2) Populates the MAC capabilities and switches stmmac_validate() to use
> > >    phylink_get_linkmodes(). We do not use phylink_generic_validate() yet
> > >    as (a) we do not always have the supported interfaces populated, and
> > >    (b) the existing code does not restrict based on interface. There
> > >    should be no functional effect from this patch.
> > > 
> > > 3) Populates phylink's supported interfaces from the xpcs when the xpcs
> > >    is configured by firmware and also the firmware configured interface
> > >    mode. Note: this will restrict stmmac to only supporting these
> > >    interfaces modes - stmmac maintainers need to verify that this
> > >    behaviour is acceptable.
> > > 
> > > 4) stmmac_validate() tail-calls xpcs_validate(), but we don't need it to
> > >    now that PCS have their own validation method. Convert stmmac and
> > >    xpcs to use this method instead.
> > > 
> > > 5) xpcs sets the poll field of phylink_pcs to true, meaning xpcs
> > >    requires its status to be polled. There is no need to also set the
> > >    phylink_config.pcs_poll. Remove this.
> > > 
> > > 6) Switch to phylink_generic_validate(). This is probably the most
> > >    contravertial change in this patch set as this will cause the MAC to
> > >    restrict link modes based on the interface mode. From an inspection
> > >    of the xpcs driver, this should be safe, as XPCS only further
> > >    restricts the link modes to a subset of these (whether that is
> > >    correct or not is not an issue I am addressing here.) For
> > >    implementations that do not use xpcs, this is a more open question
> > >    and needs feedback from stmmac maintainers.
> > > 
> > > Please review and test this series. Thanks!
> > > 
> > 
> > Tested this patch series on my Intel Elkhart Lake setup with Marvell
> > 88E1510 PHY. 
> > 
> > Everything works perfectly!
> 
> Can I take that as a tested-by please?
> 

Sure.

Tested-by: Wong Vee Khee <vee.khee.wong@linux.intel.com> # Intel EHL

> It would be good to get some feedback from other stmmac users, since I
> believe stmmac is used in multiple different configurations.
> 
> Thanks!
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
