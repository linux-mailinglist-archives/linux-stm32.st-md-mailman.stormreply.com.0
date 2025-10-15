Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4144ABE0E88
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Oct 2025 00:13:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 986EAC5717F;
	Wed, 15 Oct 2025 22:12:59 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1102EC5717C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 22:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4wDM7ea8WG0qsfgvvugn/KuHahIyav7ggrd+qRRZvlA=; b=nCY1sWW7An16x4rxXvqnUl+x5I
 ASEGspy2pshjRY27ot+WelX1sdCT93Ru/31qG21JGNHm3IX/VDc0T7EZjjsbWBGKf8cDAoeBFIr4G
 df98PLQtMI52u+kz/qQK/ZopYCjHVgn3Owizi0rSwURl8JZRsAlNEzZOTilLqdr4kd93JpRw5317R
 X1z9CrnKnVl0YVEaQ5DB+UDV3bZHtoRxnTBPWeRxW2T0r+AzJRb0SBM/Fgwl3+2H0wgDhgXVKU2hJ
 PkGNeKSGvo3v4BcbU7C8Cph6wGmHy5WQ7sqLOlEHub3BDyhUQo9++/c8Pj+gv6Pqv1ou05ulxEtX2
 c0Vp6ubQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36642)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1v99jS-000000005X8-1PdH;
 Wed, 15 Oct 2025 23:12:30 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1v99jJ-000000002ei-0dcB; Wed, 15 Oct 2025 23:12:21 +0100
Date: Wed, 15 Oct 2025 23:12:20 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <aPAcRNeFa5heydq7@shell.armlinux.org.uk>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92MO-0000000AmGP-2hFV@rmk-PC.armlinux.org.uk>
 <51db1103-afd7-430d-9038-7094032347fc@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51db1103-afd7-430d-9038-7094032347fc@lunn.ch>
Cc: Song Yoong Siang <yoong.siang.song@intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Kees Cook <kees@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Swathi K S <swathi.ks@samsung.com>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>, Simon Horman <horms@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Yu-Chun Lin <eleanor15x@gmail.com>,
 Furong Xu <0x1207@gmail.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Shenwei Wang <shenwei.wang@nxp.com>,
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
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 03/14] net: stmmac: remove
 SGMII/RGMII/SMII interrupt handling
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

On Wed, Oct 15, 2025 at 11:35:40PM +0200, Andrew Lunn wrote:
> On Wed, Oct 15, 2025 at 03:20:12PM +0100, Russell King (Oracle) wrote:
> > Now that the only use for the interrupt is to clear it and increment a
> > statistic counter (which is not that relevant anymore) remove all this
> > code and ensure that the interrupt remains disabled to avoid a stuck
> > interrupt.
> 
> Will this interrupt come back later, as part of the PCS? Or will the
> PCS be polled?

It depends whether it has any users - given the scrappy nature of all
this, and the fact it's never been properly implemented, I need to
hear from the platform glue people to really know what's going on.

Right now, all I'm doing is removing loads of code that has been proven
to be broken, and re-implementing what is left in a way that will work
for people who are using the internal PCS (in other words, where the
STMMAC_FLAG_HAS_INTEGRATED_PCS was set which disabled much of the
broken code anyway.)

> This leaves this counter unused, as you said. It does not look trivial
> to remove it, it is part of the statistics ABI. But if the interrupt
> comes back in a later patch, this counter could also be brought back
> to life?

Sadly, it's not quite unused - see dwmac-sun8i.c:

        if (v & EMAC_RGMII_STA_INT)
                x->irq_rgmii_n++;

This is more than glue, but is almost an entire core implementation as
well - the original commit introducing it says:

    The dwmac-sun8i is a heavy hacked version of stmmac hardware by
    allwinner.
    In fact the only common part is the descriptor management and the first
    register function.

So, rather than remove the statistic entirely, as I'm not touching this
hacked version, I decided to keep the statistic counter as there is
still something using it.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
