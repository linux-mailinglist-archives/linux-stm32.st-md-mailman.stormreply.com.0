Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 675A9BE6DF5
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Oct 2025 09:05:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDD0CC57B72;
	Fri, 17 Oct 2025 07:05:37 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 832DCC3F930
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 07:05:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9FDC41A1444;
 Fri, 17 Oct 2025 07:05:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 651C9606DB;
 Fri, 17 Oct 2025 07:05:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 00B0D102F22FF; 
 Fri, 17 Oct 2025 09:04:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760684733; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=8Txvygtf95T8nvPnqElNFv3jlBIUlCRN1Ha31LP6OZM=;
 b=sjVqtIm4RJwQ4q/9IDLKMSW6riYcV/yNt+HFk6E2Z9iRJ7mcel14odvS1qcyV6Zojb2ZL/
 UjK86X1GZjeFt8l4tTWqqX5GMkhp2tz//ZFswJJxaec0tbucR/wHOUZPsTXsOTWqF6Hkcy
 PsT3RCGuLuL3pIzCuxEBS19909xxzsZzs/iU/so1N2Ny/VakwLErGxdMdFvoTDEZfIGP7c
 1q7q03jcaA/Jdyzq66uIb9IX6f6YcMZtfsL6xNXl25uo1acubbem9B/PXBj+xHKuu2fXEd
 CJGlJW9d8NPHglu7w1OISAR7MVpEiXJ497Z1xlPBUvJt0TtWvMd4li2EVhgW5g==
Message-ID: <1f9d856f-4cfb-472c-abec-96ce55f4db81@bootlin.com>
Date: Fri, 17 Oct 2025 09:04:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aPECqg0vZGnBFCbh@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aPECqg0vZGnBFCbh@shell.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Song Yoong Siang <yoong.siang.song@intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Kees Cook <kees@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Swathi K S <swathi.ks@samsung.com>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>, Simon Horman <horms@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Furong Xu <0x1207@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Shenwei Wang <shenwei.wang@nxp.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
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
 "David S. Miller" <davem@davemloft.net>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/14] net: stmmac: phylink
	PCS conversion
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

Hello,

On 16/10/2025 16:35, Russell King (Oracle) wrote:
> This series is radical - it takes the brave step of ripping out much of
> the existing PCS support code and throwing it all away.
> 
> I have discussed the introduction of the STMMAC_FLAG_HAS_INTEGRATED_PCS
> flag with Bartosz Golaszewski, and the conclusion I came to is that
> this is to workaround the breakage that I've been going on about
> concerning the phylink conversion for the last five or six years.
> 
> The problem is that the stmmac PCS code manipulates the netif carrier
> state, which confuses phylink.
> 
> There is a way of testing this out on the Jetson Xavier NX platform as
> the "PCS" code paths can be exercised while in RGMII mode - because
> RGMII also has in-band status and the status register is shared with
> SGMII. Testing this out confirms my long held theory: the interrupt
> handler manipulates the netif carrier state before phylink gets a
> look-in, which means that the mac_link_up() and mac_link_down() methods
> are never called, resulting in the device being non-functional.
> 
> Moreover, on dwmac4 cores, ethtool reports incorrect information -
> despite having a full-duplex link, ethtool reports that it is
> half-dupex.
> 
> Thus, this code is completely broken - anyone using it will not have
> a functional platform, and thus it doesn't deserve to live any longer,
> especially as it's a thorn in phylink.
> 
> Rip all this out, leaving just the bare bones initialisation in place.
> 
> However, this is not the last of what's broken. We have this hw->ps
> integer which is really not descriptive, and the DT property from
> which it comes from does little to help understand what's going on.
> Putting all the clues together:
> 
> - early configuration of the GMAC configuration register for the
>   speed.
> - setting the SGMII rate adapter layer to take its speed from the
>   GMAC configuration register.
> 
> Lastly, setting the transmit enable (TE) bit, which is a typo that puts
> the nail in the coffin of this code. It should be the transmit
> configuration (TC) bit. Given that when the link comes up, phylink
> will call mac_link_up() which will overwrite the speed in the GMAC
> configuration register, the only part of this that is functional is
> changing where the SGMII rate adapter layer gets its speed from,
> which is a boolean.
> 
> From what I've found so far, everyone who sets the snps,ps-speed
> property which configures this mode also configures a fixed link,
> so the pre-configuration is unnecessary - the link will come up
> anyway.
> 
> So, this series rips that out the preconfiguration as well, and
> replaces hw->ps with a boolean hw->reverse_sgmii_enable flag.
> 
> We then move the sole PCS configuration into a phylink_pcs instance,
> which configures the PCS control register in the same way as is done
> during the probe function.
> 
> Thus, we end up with much easier and simpler conversion to phylink PCS
> than previous attempts.
> 
> Even so, this still results in inband mode always being enabled at the
> moment in the new .pcs_config() method to reflect what the probe
> function was doing. The next stage will be to change that to allow
> phylink to correctly configure the PCS. This needs fixing to allow
> platform glue maintainers who are currently blocked to progress.
> 
> Please note, however, that this has not been tested with any SGMII
> platform.
> 
> I've tried to get as many people into the Cc list with get_maintainers,
> I hope that's sufficient to get enough eyeballs on this.
> 
> Changes since RFC:
> - new patch (7) to remove RGMII "pcs" mode
> - new patch (8) to move reverse "pcs" mode to stmmac_check_pcs_mode()
> - new patch (9) to simplify the code moved in the previous patch
> - new patch (10) to rename the confusing hw->ps to something more
>   understandable.
> - new patch (11) to shut up inappropriate complaints about
>   "snps,ps-speed" being invalid.
> - new patch (13) to add a MAC .pcs_init method, which will only be
>   called when core has PCS present.
> - modify patch 14 to use this new pcs_init method.
> 
> Despite getting a couple of responses to the RFC series posted in
> September, I have had nothing testing this on hardware. I have tested
> this on the Jetson Xavier NX, which included trial runs with enabling
> the RGMII "pcs" mode, hence the new patches that rip out this mode. I
> have come to the conclusion that the only way to get stmmac changes
> tested is to get them merged into net-next, thereby forcing people to
> have to run with them... and we'll deal with any fallout later.

I have tested this on :
 - dwmac-socfpga w/ Lynx, SGMII and 1000BaseX mode
 - dwmac-socfpga w/ RGMII mode
 - stm32-dwmac (on stm32mp157a), w/ RGMII mode

I don't have any device available with stmmac using the internal PCS
implementation, but at least the 2 platforms above don't regress with
this series.

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
