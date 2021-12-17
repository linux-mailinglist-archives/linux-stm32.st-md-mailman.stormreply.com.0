Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9844784C3
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Dec 2021 06:57:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BC4DC5F1D9;
	Fri, 17 Dec 2021 05:57:42 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 618F3C5EC76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Dec 2021 05:57:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239498434"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="239498434"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 21:57:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="465011786"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga003.jf.intel.com with ESMTP; 16 Dec 2021 21:57:35 -0800
Received: from linux.intel.com (vwong3-iLBPG3.png.intel.com [10.88.229.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 6ACF4580127;
 Thu, 16 Dec 2021 21:57:32 -0800 (PST)
Date: Fri, 17 Dec 2021 13:57:29 +0800
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20211217055729.GA14835@linux.intel.com>
References: <Ybs7DNDkBrf73jDi@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ybs7DNDkBrf73jDi@shell.armlinux.org.uk>
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

On Thu, Dec 16, 2021 at 01:11:40PM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> This series updates xpcs and stmmac for the recent changes to phylink
> to better support split PCS and to get rid of private MAC validation
> functions.
> 
> This series is slightly more involved than other conversions as stmmac
> has already had optional proper split PCS support.
> 
> The patches:
> 
> 1) Provide a function to query the xpcs for the interface modes that
>    are supported.
> 
> 2) Populates the MAC capabilities and switches stmmac_validate() to use
>    phylink_get_linkmodes(). We do not use phylink_generic_validate() yet
>    as (a) we do not always have the supported interfaces populated, and
>    (b) the existing code does not restrict based on interface. There
>    should be no functional effect from this patch.
> 
> 3) Populates phylink's supported interfaces from the xpcs when the xpcs
>    is configured by firmware and also the firmware configured interface
>    mode. Note: this will restrict stmmac to only supporting these
>    interfaces modes - stmmac maintainers need to verify that this
>    behaviour is acceptable.
> 
> 4) stmmac_validate() tail-calls xpcs_validate(), but we don't need it to
>    now that PCS have their own validation method. Convert stmmac and
>    xpcs to use this method instead.
> 
> 5) xpcs sets the poll field of phylink_pcs to true, meaning xpcs
>    requires its status to be polled. There is no need to also set the
>    phylink_config.pcs_poll. Remove this.
> 
> 6) Switch to phylink_generic_validate(). This is probably the most
>    contravertial change in this patch set as this will cause the MAC to
>    restrict link modes based on the interface mode. From an inspection
>    of the xpcs driver, this should be safe, as XPCS only further
>    restricts the link modes to a subset of these (whether that is
>    correct or not is not an issue I am addressing here.) For
>    implementations that do not use xpcs, this is a more open question
>    and needs feedback from stmmac maintainers.
> 
> Please review and test this series. Thanks!
> 

Tested this patch series on my Intel Elkhart Lake setup with Marvell
88E1510 PHY. 

Everything works perfectly!

>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 144 ++++++----------------
>  drivers/net/pcs/pcs-xpcs.c                        |  41 +++---
>  include/linux/pcs/pcs-xpcs.h                      |   3 +-
>  3 files changed, 67 insertions(+), 121 deletions(-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
