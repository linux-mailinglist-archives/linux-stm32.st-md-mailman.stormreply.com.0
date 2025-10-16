Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EACADBE3973
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Oct 2025 15:05:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACDE0C57A4D;
	Thu, 16 Oct 2025 13:05:28 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BE6AC57A49
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Oct 2025 13:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=7JL0+bGL0quldkyb9VQbHQdNgKSc3xiY2NepKrKb++8=; b=PpMxU/p7fUKKQlOiZqqqwDSEji
 di6xnJgDpt9A/EQjc6G6lZ21lW1ubDumlrkPQ81fdB7bIgY69YC7xNcceeXX/beuXtk5oiTY20wh8
 fg6X7PzcuVy0PsHdmMJts3ln/HOIspaXYXr+SDGGPX+LsQZJ2Y+OaGTT2J3QFWawmhgo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1v9NfH-00B9TY-Rk; Thu, 16 Oct 2025 15:05:07 +0200
Date: Thu, 16 Oct 2025 15:05:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <5f0c7653-30e4-486a-ae5d-9d20d5e7ac43@lunn.ch>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92NJ-0000000AmHi-1ZGJ@rmk-PC.armlinux.org.uk>
 <040a2f29-4c95-4561-87c0-2a70308d3f00@lunn.ch>
 <aPAYtHPcF5bes7Xi@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aPAYtHPcF5bes7Xi@shell.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH net-next 14/14] net: stmmac: convert to
 phylink PCS support
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

On Wed, Oct 15, 2025 at 10:57:08PM +0100, Russell King (Oracle) wrote:
> On Wed, Oct 15, 2025 at 11:31:37PM +0200, Andrew Lunn wrote:
> > > - create stmmac_pcs.c, which contains the phylink_pcs_ops structure, a
> > >   dummy .pcs_get_state() method which always reports link-down
> > 
> > I've not followed the PCS code too closely. Why always report link
> > down? Why is a dummy method needed?
> 
> If phylink is put into inband mode, and a PCS is supplied to phylink
> where this method left NULL, the kernel will oops.
> 
> As the code stands today in mainline, if phylink were to be put into
> inband mode with the integrated PCS, then there will be no phylink PCS,
> and so phylink_mac_pcs_get_state() will fall into the "else" path of:
> 
>         pcs = pl->pcs;
>         if (pcs)
>                 pcs->ops->pcs_get_state(pcs, pl->pcs_neg_mode, state);
>         else
>                 state->link = 0;
> 
> and force the link down.
> 
> So, adding this method keeps the status quo - not oopsing the kernel
> and not allowing the link to come up. No unintended behavioural
> change in this regard from how it would behave today. :)

O.K. Maybe some of this text could be added to the commit message?

Thanks
	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
