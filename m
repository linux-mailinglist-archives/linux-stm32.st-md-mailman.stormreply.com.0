Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB10CB9BB74
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Sep 2025 21:31:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8A20C3F93F;
	Wed, 24 Sep 2025 19:31:44 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9819AC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 19:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wWHuMNffMGutQbJvBKG/MZveRAosfgTjgtTC/tzZqkI=; b=b5/u/dXh0JBJyMqjvQCaQFkHk+
 8Ksv2CPwkCAHaWyXWet8FTyq9FgPyo7XewgPvma6VXyppo3tezvBghJZfbT9HetuKxM795x5Kn7sr
 hIwXirxpW1Br4vDkZdC0CkWR6PKd2tEIxzEtktNIuD7WKO7pXP4kAfvgqHmmkTra4W+m4smtqCSuK
 XCOL9BxcPLVKGW785xU3zvkHu3JWuKs4AbGatRATYJYy4dHehqcVXwlroC7HjAXdeuwBz+1c2MDRq
 4FJmYWRFEXRXE1ABa/Jzw5zSJ3zIMTfFp8EaqrW37NtkfPs0PSG0jrfnENMkugEBKVbMTyULQoSIV
 Sb37R4Rg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34686)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1v1VCp-000000001DY-2osw;
 Wed, 24 Sep 2025 20:31:11 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1v1VCd-000000007PA-3Edy; Wed, 24 Sep 2025 20:30:59 +0100
Date: Wed, 24 Sep 2025 20:30:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jacob Keller <jacob.e.keller@intel.com>
Message-ID: <aNRG82biP9mA-rvm@shell.armlinux.org.uk>
References: <aNQ1oI0mt3VVcUcF@shell.armlinux.org.uk>
 <b7fb3c8c-bfa6-4e46-b5ed-05e4752bbc00@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b7fb3c8c-bfa6-4e46-b5ed-05e4752bbc00@intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Kees Cook <kees@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Furong Xu <0x1207@gmail.com>,
 Swathi K S <swathi.ks@samsung.com>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>, Simon Horman <horms@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Yu-Chun Lin <eleanor15x@gmail.com>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Shenwei Wang <shenwei.wang@nxp.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Daniel Machon <daniel.machon@microchip.com>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>, linux-arm-msm@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Alexis Lothore <alexis.lothore@bootlin.com>,
 Drew Fustini <dfustini@tenstorrent.com>, linux-arm-kernel@lists.infradead.org,
 Rohan G Thomas <rohan.g.thomas@altera.com>,
 Vladimir Oltean <olteanv@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 0/9] net: stmmac:
	experimental PCS conversion
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

On Wed, Sep 24, 2025 at 12:13:18PM -0700, Jacob Keller wrote:
> 
> 
> On 9/24/2025 11:17 AM, Russell King (Oracle) wrote:
> > This series is radical - it takes the brave step of ripping out much of
> > the existing PCS support code and throwing it all away.
> > 
> > I have discussed the introduction of the STMMAC_FLAG_HAS_INTEGRATED_PCS
> > flag with Bartosz Golaszewski, and the conclusion I came to is that
> > this is to workaround the breakage that I've been going on about
> > concerning the phylink conversion for the last five or six years.
> > 
> > The problem is that the stmmac PCS code manipulates the netif carrier
> > state, which confuses phylink.
> > 
> > There is a way of testing this out on the Jetson Xavier NX platform as
> > the "PCS" code paths can be exercised while in RGMII mode - because
> > RGMII also has in-band status and the status register is shared with
> > SGMII. Testing this out confirms my long held theory: the interrupt
> > handler manipulates the netif carrier state before phylink gets a
> > look-in, which means that the mac_link_up() and mac_link_down() methods
> > are never called, resulting in the device being non-functional.
> > 
> > Moreover, on dwmac4 cores, ethtool reports incorrect information -
> > despite having a full-duplex link, ethtool reports that it is
> > half-dupex.
> > 
> > Thus, this code is completely broken - anyone using it will not have
> > a functional platform, and thus it doesn't deserve to live any longer,
> > especially as it's a thorn in phylink.
> > 
> > Rip all this out, leaving just the bare bones initialisation in place.
> > 
> > However, this is not the last of what's broken. We have this hw->ps
> > integer which is really not descriptive, and the DT property from
> > which it comes from does little to help understand what's going on.
> > Putting all the clues together:
> > 
> > - early configuration of the GMAC configuration register for the
> >   speed.
> > - setting the SGMII rate adapter layer to take its speed from the
> >   GMAC configuration register.
> > 
> > Lastly, setting the transmit enable (TE) bit, which is a typo that puts
> > the nail in the coffin of this code. It should be the transmit
> > configuration (TC) bit. Given that when the link comes up, phylink
> > will call mac_link_up() which will overwrite the speed in the GMAC
> > configuration register, the only part of this that is functional is
> > changing where the SGMII rate adapter layer gets its speed from,
> > which is a boolean.
> > 
> > From what I've found so far, everyone who sets the snps,ps-speed
> > property which configures this mode also configures a fixed link,
> > so the pre-configuration is unnecessary - the link will come up
> > anyway.
> > 
> > So, this series rips that out the preconfiguration as well, and
> > replaces hw->ps with a boolean hw->reverse_sgmii_enable flag.
> > 
> > We then move the sole PCS configuration into a phylink_pcs instance,
> > which configures the PCS control register in the same way as is done
> > during the probe function.
> > 
> > Thus, we end up with much easier and simpler conversion to phylink PCS
> > than previous attempts.
> > 
> > Even so, this still results in inband mode always being enabled at the
> > moment in the new .pcs_config() method to reflect what the probe
> > function was doing. The next stage will be to change that to allow
> > phylink to correctly configure the PCS. This needs fixing to allow
> > platform glue maintainers who are currently blocked to progress.
> > 
> > Please note, however, that this has not been tested with any SGMII
> > platform.
> > 
> > I've tried to get as many people into the Cc list with get_maintainers,
> > I hope that's sufficient to get enough eyeballs on this.
> > 
> 
> I'm no expert with this hardware or driver, but all of your explanations
> seem reasonable to me.
> 
> I'd guess the real step is to try and get this tested against the
> variety of hardware supported by stmmac?

Yes please, that would be very helpful, as I don't want to regress
anyone's setup. I'm hoping that this series is going to be the low-
risk change.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
