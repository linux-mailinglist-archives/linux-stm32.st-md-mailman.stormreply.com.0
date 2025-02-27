Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED507A48592
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 17:47:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADEFDCFAC45;
	Thu, 27 Feb 2025 16:47:16 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E89FCFAC44
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 16:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Yii92iQAEmxCOP2QDsW+vzITDTXCaT6QnQ8yK7d0FrI=; b=ua+UrFDJfdRtQF05ycPAm1iveg
 9inZXR1uacy2V0yfnuGkr5A96MMUNwHsq9QBhDni36Dz3ofDVe+eSUeYHRy/ZHiBxemcH0gI2wk2y
 Pq+v+JyfhQgMQVAqagztNDsrTwm1iscDZj7RlDTrhs71kh2B1o6644S71Jhvqm6jxdL0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tnh2T-000eog-0Q; Thu, 27 Feb 2025 17:47:09 +0100
Date: Thu, 27 Feb 2025 17:47:08 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <4a1ecc2e-1feb-4d93-9204-218942e20ee1@lunn.ch>
References: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
 <E1tnf1c-0056LO-DN@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1tnf1c-0056LO-DN@rmk-PC.armlinux.org.uk>
Cc: Thierry Reding <treding@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 5/5] net: stmmac: fix resume
 when media is in low-power mode
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

On Thu, Feb 27, 2025 at 02:38:08PM +0000, Russell King (Oracle) wrote:
> The Synopsys Designwavre GMAC core databook requires all clocks to be
> active in order to complete software reset.
> 
> This means if the PHY receive clock has been stopped due to the media
> being in EEE low-power state, and the PHY being permitted to stop its
> clock, then software reset will not complete.
> 
> Phylink now provides a way to work around this by calling
> phylink_prepare_resume() before attempting to issue a reset. This will
> prepare any attached PHY by disabling its permission to stop the clock.
> phylink_resume() will restore the receive clock stop setting according
> to the configuration passed from the netdev driver.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
