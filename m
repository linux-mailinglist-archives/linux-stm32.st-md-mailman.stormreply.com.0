Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B601EA3C854
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Feb 2025 20:13:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 685B3C78F89;
	Wed, 19 Feb 2025 19:13:48 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67CB8C78F63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Feb 2025 19:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AXdrK0FW7YBCiiP1kX6NoL+0DT8yWctwGO9dXqbApP0=; b=LBPbPLYVfyUVGqIt7OCUrlXrd5
 lIHTDU6Mx3DQRND5VLydjwu3aBm/affJCwLVJn++b0RWN6vGZj3IpBtIg7uRC++gz4TL4PwiVkYkU
 qiNkxSwrxIuWvOYHRkMit1/pf0mLV59aCtp7JQuSzNpGnsvy1jRMD434rxyMNWR3+/0TDBzcV0Uzp
 44/uqEJ46rBpP2qpKbwzunVcpM/Gyj6XWyJtPtkiqViAPKFHLk4on4POUr+EOJJ4nVb69TLcRs98K
 E5wtWMGa+mt4q7QuHVklVtwfJUeaG8K+iKE67srxZPrMY1Bk6DkswRG6fUrKnmz5vOu+xgTtk1RhZ
 M8GtZjXA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36382)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tkpVm-0006ih-21;
 Wed, 19 Feb 2025 19:13:36 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tkpVi-00009w-2O;
 Wed, 19 Feb 2025 19:13:30 +0000
Date: Wed, 19 Feb 2025 19:13:30 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <Z7YtWmkVl0rWFvQO@shell.armlinux.org.uk>
References: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
 <E1tYAEG-0014QH-9O@rmk-PC.armlinux.org.uk>
 <6ab08068-7d70-4616-8e88-b6915cbf7b1d@nvidia.com>
 <Z63Zbaf_4Rt57sox@shell.armlinux.org.uk>
 <Z63e-aFlvKMfqNBj@shell.armlinux.org.uk>
 <05987b45-94b9-4744-a90d-9812cf3566d9@nvidia.com>
 <Z68nSJqVxcnCc1YB@shell.armlinux.org.uk>
 <86fae995-1700-420b-8d84-33ab1e1f6353@nvidia.com>
 <Z7X6Z8yLMsQ1wa2D@shell.armlinux.org.uk>
 <203871c2-c673-4a98-a0a3-299d1cf71cf0@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <203871c2-c673-4a98-a0a3-299d1cf71cf0@nvidia.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 UNGLinuxDriver@microchip.com, Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 9/9] net: stmmac: convert to
 phylink managed EEE support
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

On Wed, Feb 19, 2025 at 05:52:34PM +0000, Jon Hunter wrote:
> On 19/02/2025 15:36, Russell King (Oracle) wrote:
> > So clearly the phylink resolver is racing with the rest of the stmmac
> > resume path - which doesn't surprise me in the least. I believe I raised
> > the fact that calling phylink_resume() before the hardware was ready to
> > handle link-up is a bad idea precisely because of races like this.
> > 
> > The reason stmmac does this is because of it's quirk that it needs the
> > receive clock from the PHY in order for stmmac_reset() to work.
> 
> I do see the reset fail infrequently on previous kernels with this device
> and when it does I see these messages ...
> 
>  dwc-eth-dwmac 2490000.ethernet: Failed to reset the dma
>  dwc-eth-dwmac 2490000.ethernet eth0: stmmac_hw_setup: DMA engine
>   initialization failed

I wonder whether it's also racing with phylib, but phylink_resume()
calling phylink_start() going in to call phy_start() is all synchronous.
That causes __phy_resume() to be called.

Which PHY device/driver is being used?

> > So, my preference would be to move phylink_resume() later, removing
> > the race condition. If there's any regressions, then we need to
> > _properly_ solve them by ensuring that the PHY keeps the RX clock
> > running by honouring PHY_F_RXC_ALWAYS_ON. That's going to need
> > everyone to test their stmmac platforms to find all the cases that
> > need fixing...
> 
> Thanks for the in-depth analysis and feedback. We have 3 SoCs that use this
> driver and so I will do some testing with this change on all of them.

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
