Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7B5C2B767
	for <lists+linux-stm32@lfdr.de>; Mon, 03 Nov 2025 12:43:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D87FC62D2D;
	Mon,  3 Nov 2025 11:43:44 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 088E3C628DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 11:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BXuMJWywnmqLRFVSrlO0g4wLfEyDjnCQbBY2E7xN+7w=; b=LDxM83/rO3g7Z31rdahnjmiy62
 3ZSi9SC6X7XnsfCTlJ4CCf83JJFgU3bYHdp8475HXM3tI/29f1nEoD7jSUOM2dXdHldLjK+WA8TVa
 27XcJ9cSvK8+/paflZggp9LdelNUEfw5T9OpQf8iqHILFL7gHqR3amaXVSHHOfelpJ63Rm7E/KcQy
 h5mIITItmiZPBiVoItNcpG99R+MuylVz5bvro+znkJzkeQwWUafDoILRuBuTuhZTX39JbHpPCsbVz
 lL96cRh2cA9Y2cLBgsde4hfRxFdYpcOI/dgzMA6CnSs0ky5if7qx4cKIZ3tCLHURJ/ygmojo03qwY
 ymf4JXsw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50598)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vFsy8-000000000eF-3CVg;
 Mon, 03 Nov 2025 11:43:28 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vFsy3-000000003m0-3BBY; Mon, 03 Nov 2025 11:43:23 +0000
Date: Mon, 3 Nov 2025 11:43:23 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Message-ID: <aQiVWydDsRaMz8ua@shell.armlinux.org.uk>
References: <aQExx0zXT5SvFxAk@oss.qualcomm.com>
 <aQHc6SowbWsIA1A5@shell.armlinux.org.uk>
 <aQNmM5+cptKllTS8@oss.qualcomm.com>
 <aQOB_yCzCmAVM34V@shell.armlinux.org.uk>
 <aQOCpG_gjJlnm0A1@shell.armlinux.org.uk>
 <aQhusPX0Hw9ZuLNR@oss.qualcomm.com>
 <aQh7Zj10C7QcDoqn@shell.armlinux.org.uk>
 <aQiBjYNtJks2/mrw@oss.qualcomm.com>
 <20251103104820.3fcksk27j34zu6cg@skbuf>
 <aQiP46tKUHGwmiTo@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQiP46tKUHGwmiTo@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Furong Xu <0x1207@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Daniel Machon <daniel.machon@microchip.com>,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: phylink PCS
 conversion part 3 (dodgy stuff)
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

On Mon, Nov 03, 2025 at 04:50:03PM +0530, Mohd Ayaan Anwar wrote:
> On Mon, Nov 03, 2025 at 12:48:20PM +0200, Vladimir Oltean wrote:
> > 
> > As Russell partially pointed out, there are several assumptions in the
> > Aquantia PHY driver and in phylink, three of them being that:
> > - rate matching is only supported for PHY_INTERFACE_MODE_10GBASER and
> >   PHY_INTERFACE_MODE_2500BASEX (thus not PHY_INTERFACE_MODE_SGMII)
> > - if phy_get_rate_matching() returns RATE_MATCH_NONE for an interface,
> >   pl->phy_state.rate_matching will also be RATE_MATCH_NONE when using
> >   that interface
> > - if rate matching is used, the PHY is configured to use it for all
> >   media speeds <= phylink_interface_max_speed(link_state.interface)
> > 
> > Those assumptions are not validated very well against the ground truth
> > from the PHY provisioning, so the next step would be for us to see that
> > directly.
> > 
> > Please turn this print from aqr_gen2_read_global_syscfg() into something
> > visible in dmesg, i.e. by replacing phydev_dbg() with phydev_info():
> > 
> > 		phydev_dbg(phydev,
> > 			   "Media speed %d uses host interface %s with %s\n",
> > 			   syscfg->speed, phy_modes(syscfg->interface),
> > 			   syscfg->rate_adapt == AQR_RATE_ADAPT_NONE ? "no rate adaptation" :
> > 			   syscfg->rate_adapt == AQR_RATE_ADAPT_PAUSE ? "rate adaptation through flow control" :
> > 			   syscfg->rate_adapt == AQR_RATE_ADAPT_USX ? "rate adaptation through symbol replication" :
> > 			   "unrecognized rate adaptation type");
> 
> Thanks. Looks like rate adaptation is only provisioned for 10M, which
> matches my observation where phylink passes the exact speeds for
> 100/1000/2500 but 1000 for 10M.

Hmm, I wonder what the PHY is doing for that then. stmmac will be
programmed to read the Cisco SGMII in-band control word, and use
that to determine whether symbol replication for slower speeds is
being used.

If AQR115C is indicating 10M in the in-band control word, but is
actually operating the link at 1G speed, things are not going to
work, and I would say the PHY is broken to be doing that. The point
of the SGMII in-band control word is to tell the MAC about the
required symbol replication on the link for transmitting the slower
data rates over the link.

stmmac unfortunately doesn't give access to the raw Cisco SGMII
in-band control word. However, reading register 0xf8 bits 31:16 for
dwmac4, or register 0xd8 bits 15:0 for dwmac1000 will give this
information. In that bitfield, bits 2:1 give the speed. 2 = 1G,
1 = 100M, 0 = 10M.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
