Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D173B9CE033
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Nov 2024 14:37:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B041C78028;
	Fri, 15 Nov 2024 13:37:50 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F2F1C78021
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2024 13:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8+1mHkW5xeUn98DLU2MzEmZyX/j5XKeY/1cmO/2lLi0=; b=Kl27prUPtKYLoQ/s2vZBSQyK7n
 io0y6C+YFo3TFcRYOPId/ovLvP0qnH4MTTmrLCxykNrMAgDlcjuEKYNVgmLD0AZp19EbK4AnN9AMQ
 d2BNDZbM9fF77Uc96Q+nxoFC+wIz1pzysRw6sDoZzSa5/0QH/84rJz04uqaaf8eUUavgjq89VY10V
 IDEScKjh1+tLlUHzQwe3Dcd/ZG9AUCz28wcHJEhUWDeaYKZjmqII/edIgVwkDKi5OuzyWvXADw4vR
 KkpT5l5b86Q3467cLtrC48K/+RD+6P5FkGnwLWRNB6g+B3DsMoen12t09Pu66ZSTV8DuHSRput/f7
 R8PShxVw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36000)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tBwVq-0001Pv-1F;
 Fri, 15 Nov 2024 13:37:26 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tBwVk-00029i-1G;
 Fri, 15 Nov 2024 13:37:20 +0000
Date: Fri, 15 Nov 2024 13:37:20 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <ZzdOkE0lqpl6wx2d@shell.armlinux.org.uk>
References: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
 <20241115111151.183108-2-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241115111151.183108-2-yong.liang.choong@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Oleksij Rempel <o.rempel@pengutronix.de>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net v2 1/2] net: phy: replace
 phydev->eee_enabled with eee_cfg.eee_enabled
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

On Fri, Nov 15, 2024 at 07:11:50PM +0800, Choong Yong Liang wrote:
> Not all PHYs have EEE enabled by default. For example, Marvell PHYs are
> designed to have EEE hardware disabled during the initial state.
> 
> In the initial stage, phy_probe() sets phydev->eee_enabled to be disabled.
> Then, the MAC calls phy_support_eee() to set eee_cfg.eee_enabled to be
> enabled. However, when phy_start_aneg() is called,
> genphy_c45_an_config_eee_aneg() still refers to phydev->eee_enabled.
> This causes the 'ethtool --show-eee' command to show that EEE is enabled,
> but in actuality, the driver side is disabled.
> 
> This patch will remove phydev->eee_enabled and replace it with
> eee_cfg.eee_enabled. When performing genphy_c45_an_config_eee_aneg(),
> it will follow the master configuration to have software and hardware
> in sync.

Hmm. I'm not happy with how you're handling my patch. I would've liked
some feedback on it (thanks for spotting that the set_eee case needed
to pass the state to genphy_c45_an_config_eee_aneg()).

However, what's worse is, that the bulk of this patch is my work, yet
you've effectively claimed complete authorship of it in the way you
are submitting this patch. Moreover, you are violating the kernel
submission rules, as the Signed-off-by does not include one for me
(which I need to explicitly give.) I was waiting for the results of
your testing before finalising the patch.

The patch needs to be authored by me, the first sign-off needs to be
me, then optionally Co-developed-by for you, and then your sign-off.

See Documentation/process/submitting-patches.rst

Thanks.

pw-bot: cr

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
