Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDAE9872EF
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Sep 2024 13:42:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1877FC78002;
	Thu, 26 Sep 2024 11:42:01 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7457CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 11:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I/a0LbYF1WXMeFMf/ldoVBQRSAUzG4YQ8n7SuE4RzPQ=; b=LWALQ1E6JAu2FtyvFdIXYV8B9v
 Tad5KLxC0Z8ei5aNTywchAcRBcm3q/ClmCFVOq/WIP2kKqIbvAnezZNgBT42wmKiYkd08FStb3rbq
 ovfYxOjq+kgRw4qPviliCrZ3pOIVtgdBUSPCQ6T16fOuiJQ+CijzBp/bH/CH3QzhgVOSqFK1byy23
 8/lVaIyhUaT9rKzGwl/kM7hV9RbpmX4slB6nZHIwYnwfeZ+xwWObHE15AQCSJW4MRT/NghAJs+SB+
 jNO2Wj+fl0honXdqrVoiEDfZdQlliswuiy+6JJlYHS5ySUfaiHzOpf5Srp0sk/VEsJNkA7aAPzxib
 66Xc7y2w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54520)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1stmsJ-00088t-3B;
 Thu, 26 Sep 2024 12:41:35 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1stmsB-0008IB-28;
 Thu, 26 Sep 2024 12:41:27 +0100
Date: Thu, 26 Sep 2024 12:41:27 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <ZvVIZ8cp4T/wO5Kh@shell.armlinux.org.uk>
References: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
 <20240925134337.y7s72tdomvpcehsu@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240925134337.y7s72tdomvpcehsu@skbuf>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC 00/10] net: pcs: xpcs: cleanups batch 1
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

On Wed, Sep 25, 2024 at 04:43:37PM +0300, Vladimir Oltean wrote:
> Hi Russell,
> 
> On Mon, Sep 23, 2024 at 03:00:26PM +0100, Russell King (Oracle) wrote:
> > First, sorry for the bland series subject - this is the first in a
> > number of cleanup series to the XPCS driver.
> 
> I presume you intend to remove the rest of the exported xpcs functions
> as well, in further "batches". Could you share in advance some details
> about what you plan to do with xpcs_get_an_mode() as used in stmmac?

I've been concentrating more on the sja1105 and wangxun users with this
cleanup, as changing stmmac is going to be quite painful - so I've left
this as something for the future. stmmac already stores a phylink_pcs
pointer, but we can't re-use that for XPCS because stmmac needs to know
that it's an XPCS vs some other PCS due to the direct calls such as
xpcs_get_an_mode() and xpcs_config_eee().

When I was working on EEE support at phylink level, I did try to figure
out what xpcs_config_eee() is all about, what it's trying to do, why,
and how it would fit into any phylink-based EEE scheme, but I never got
very far with that due to lack of documentation.

So, at the moment I have no plans to touch the prototypes of
xpcs_get_an_mode(), xpcs_config_eee() nor xpcs_get_interfaces(). With
the entire patch series being so large already, I'm in no hurry to add
patches for this - which would need yet more work on stmmac that I'm
no longer willing to do.

> 	if (xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73))
> 
> I'm interested because I actually have some downstream NXP patches which
> introduce an entirely new MLO_AN_C73 negotiating mode in phylink (though
> they don't convert XPCS to it, sadly). Just wondering where this is going
> in your view.

To give a flavour of what remains:

net: pcs: xpcs: move Wangxun VR_XS_PCS_DIG_CTRL1 configuration
net: pcs: xpcs: correctly place DW_VR_MII_DIG_CTRL1_2G5_EN
net: pcs: xpcs: use dev_*() to print messages
net: pcs: xpcs: convert to use read_poll_timeout()
net: pcs: xpcs: add _modify() accessors
net: pcs: xpcs: use FIELD_PREP() and FIELD_GET()
net: pcs: xpcs: convert to use linkmode_adv_to_c73()
net: pcs: xpcs: add xpcs_linkmode_supported()
net: mdio: add linkmode_adv_to_c73()
net: pcs: xpcs: move searching ID list out of line
net: pcs: xpcs: rename xpcs_get_id()
net: pcs: xpcs: move definition of struct dw_xpcs to private header
net: pcs: xpcs: provide a helper to get the phylink pcs given xpcs
net: pcs: xpcs: pass xpcs instead of xpcs->id to xpcs_find_compat()
net: pcs: xpcs: don't use array for interface
net: pcs: xpcs: remove dw_xpcs_compat enum

which looks like this on the diffstat:

 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c |   2 +-
 drivers/net/pcs/pcs-xpcs-nxp.c                    |  24 +-
 drivers/net/pcs/pcs-xpcs-wx.c                     |  51 +--
 drivers/net/pcs/pcs-xpcs.c                        | 521 +++++++++-------------
 drivers/net/pcs/pcs-xpcs.h                        |  42 +-
 include/linux/mdio.h                              |  40 ++
 include/linux/pcs/pcs-xpcs.h                      |  19 +-
 7 files changed, 303 insertions(+), 396 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
