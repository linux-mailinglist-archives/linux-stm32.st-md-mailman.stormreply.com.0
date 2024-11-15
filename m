Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9229CE101
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Nov 2024 15:13:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBD7BC78028;
	Fri, 15 Nov 2024 14:13:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 845F7C78021
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2024 14:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kCJamRcv160IaLBk591jHJ5/fIg4GfMqcqO3NZ/cgPo=; b=FgChEBy7f0xHqUezBIeOC59p8L
 ZIl1QDD3C+5HuUow1dNSNJBICuq78SuDCZidjKnpgYbz8kTvrQ7BDv2gYrDf0ktiu7yXzVHyHSc55
 58DVQAbV7yLJ1fpaTsghTN3jaGpHaX5Nvycf8LC8uIQNtLGSzTP4Br5xO63HQnQg9EodOdiswdHae
 f0Not3t/g8D22gAMIno8lPfFIAsDMjdfZTdeGJ3mQgBlfnnkfQtG5Sk/ahvHrUh5KaX0yuenCVC1e
 BhKEX/Gb/ggnrH/pzQJ53h0MT4qu4Kx46tv/SWxVHuxlLgax/+P6gra19Hbu/fA2wsn6QAvUKByJm
 NM4ZvpPw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54080)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tBx45-0001So-23;
 Fri, 15 Nov 2024 14:12:50 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tBx3z-0002Bd-09;
 Fri, 15 Nov 2024 14:12:43 +0000
Date: Fri, 15 Nov 2024 14:12:42 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <ZzdW2iB2OkbZxTgS@shell.armlinux.org.uk>
References: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
 <403be2f6-bab1-4a63-bad4-c7eac1e572ee@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <403be2f6-bab1-4a63-bad4-c7eac1e572ee@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Oleksij Rempel <o.rempel@pengutronix.de>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 0/2] Fix 'ethtool --show-eee'
	during initial stage
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

On Fri, Nov 15, 2024 at 02:41:54PM +0100, Heiner Kallweit wrote:
> On 15.11.2024 12:11, Choong Yong Liang wrote:
> > From: Choong Yong Liang <yong.liang.choong@intel.com>
> > 
> > When the MAC boots up with a Marvell PHY and phy_support_eee() is implemented,
> > the 'ethtool --show-eee' command shows that EEE is enabled, but in actuality,
> > the driver side is disabled. If we try to enable EEE through
> > 'ethtool --set-eee' for a Marvell PHY, nothing happens because the eee_cfg
> > matches the setting required to enable EEE in ethnl_set_eee().
> > 
> > This patch series will remove phydev->eee_enabled and replace it with
> > eee_cfg.eee_enabled. When performing genphy_c45_an_config_eee_aneg(), it
> > will follow the master configuration to have software and hardware in sync,
> > allowing 'ethtool --show-eee' to display the correct value during the
> > initial stage.
> > 
> > v2 changes:
> >  - Implement the prototype suggested by Russell
> >  - Check EEE before calling phy_support_eee()
> > 
> > Thanks to Russell for the proposed prototype in [1].
> > 
> > Reference:
> > [1] https://patchwork.kernel.org/comment/26121323/
> > 
> > Choong Yong Liang (2):
> >   net: phy: replace phydev->eee_enabled with eee_cfg.eee_enabled
> >   net: stmmac: set initial EEE policy configuration
> > 
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  3 +++
> >  drivers/net/phy/phy-c45.c                         | 11 +++++------
> >  drivers/net/phy/phy_device.c                      |  6 +++---
> >  include/linux/phy.h                               |  5 ++---
> >  4 files changed, 13 insertions(+), 12 deletions(-)
> > 
> 
> Russell submitted the proposed patch already:
> https://patchwork.kernel.org/project/netdevbpf/patch/E1tBXAF-00341F-EQ@rmk-PC.armlinux.org.uk/
> So there's no need for your patch 1.

Patch 1 is an updated version of that patch, minus my authorship and of
course no sign-off. I've already marked this series as requiring changes
in patchwork (hopefully, if I did it correctly.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
