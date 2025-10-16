Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 222A7BE3CED
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Oct 2025 15:52:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C63FC57A51;
	Thu, 16 Oct 2025 13:52:22 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC880C57A46
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Oct 2025 13:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UmCdG/YPwALyDLpBb5siWg/i3BOrWdjDOVrZPQUGrZ8=; b=0+dTZXBd5lApnHs2iQaBbz/W/V
 Q7bJFJnGIA2uG8tjS5UsEsS5Zf8UZNrrq2xOtoMqAw1ePzjfdRuqYhMDAbHp9IA6SKikFFdvxfcwL
 dzr4TP20v7Ikpb4eFepO6AgDnISJvNmQnXw09aUuufpFMWhnQxXRnGKqTiGPvjrCQbdma4YuvvwtH
 YVPgtZbE5K1ZsOHDzJG50RAIpAUra2yfNcA0krjXV1cBF/ch9+Buy3F6o2btiNcTXkFL0ICrSNJZY
 pxEOMeHRoS1NJFq8P6hRm8ihzKlijAE+794qKuQIu2Wqr0T2GPcn5xYNKe/fQcEoCLoRgAVrs5uRJ
 eOda1ZYw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38764)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1v9OON-000000006M1-0eca;
 Thu, 16 Oct 2025 14:51:43 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1v9OO9-000000003K9-3HzO; Thu, 16 Oct 2025 14:51:29 +0100
Date: Thu, 16 Oct 2025 14:51:29 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <aPD4YRH6ih93jQXH@shell.armlinux.org.uk>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92N3-0000000AmHQ-4Bm2@rmk-PC.armlinux.org.uk>
 <15ea57e0-d127-4722-b752-4989d5a443c0@lunn.ch>
 <aPAWoDGVgeRFV95b@shell.armlinux.org.uk>
 <6545b453-e99e-4f44-a206-ef14deb7f96a@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6545b453-e99e-4f44-a206-ef14deb7f96a@lunn.ch>
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
Subject: Re: [Linux-stm32] [PATCH net-next 11/14] net: stmmac: do not
 require snps, ps-speed for SGMII
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

On Thu, Oct 16, 2025 at 03:03:34PM +0200, Andrew Lunn wrote:
> > I don't at present, and I'm not sure what the point of updating it
> > would actually be, because this is another thing that's just broken.
> 
> > Hence, I would like this property a slow and painful^h^h^hfree death.
> > Maybe mark the property deprecated, and remove all explanation of it
> > apart from stating that it's obsolete after this patch series has
> > been merged and we've proven that it's never been useful.
> 
> And this is what i was thinking. At least mark it deprecated. If you
> want to remove the documentation late, i'm fine with that as well.

It's rather premature to do this - this series doesn't change anything
in the way that snps,ps-speed behaves.

Setting this still:
1. sets the SGMII rate adapter to take its speed configuration from the
   MAC control register rather than the in-band config.
2. enables the exchange of the SGMII in-band config.

What it doesn't do, and has never done, is to ensure that the in-band
config that is sent contains the speed and duplex information for the
SGMII link partner due to a repeated typo in the individual core sub-
drivers.

I'm not intending removing this until we have a different way to
specify it, e.g. PHY_INTERFACE_MODE_REVSGMII, but that is currently
looking unlikely. However, with PHY_INTERFACE_MODE_REVSGMII, we would
need to make the change (fix the typo bug) to publish the correct
in-band config.

I think a bit more thought is needed before going down that path,
because if we're publishing the config, is it a fixed-link. That's
something that we need to sort out in the PHY_INTERFACE_MODE_REVSGMII
discussions... if we're still going with it.

So, right now what happens here entirely depends on stuff we have
yet to make decisions on, and so marking it deprecated now is too
early.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
