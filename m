Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB47049CAC5
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jan 2022 14:27:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69E41C5F1EC;
	Wed, 26 Jan 2022 13:27:57 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83FFCC5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jan 2022 13:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZAq7lphUj4ZBbT0ttD3I4ZX17HecYYp/WQ0M7GbtbZg=; b=eFfUhCblrGf2E9eacHO/gPRV0+
 zygiBNn0vwQXKqFymnCr9Q4qqkJ2UnBpzzmuIBdkSUViGWPMdfgBXbVWpq6hZELCjDLLtL5t8G17w
 /ZV8q0145pveahnMnBUbWiEUItdiWmGN7BuNEYfFqvMbF4wuWdvGPJaTrnGbLD3jblCcEj6q/ooH9
 9+lkEKoXdzlvBjgZzs3Enc591b7BaAKvn/woO0JrL2OLOrV0zzmFRTtZTNzaU+f4sYOD5rLEKD/Im
 DZzdEClcdv/5wAZHjt36yv8j8tu4rHShQ5D+avIeu9MkMsoOZENA2n8ypE1TMEU7KLbfJK7s2kuXK
 GQrBBiIA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56888)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nCiKu-0003K2-6Q; Wed, 26 Jan 2022 13:27:44 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nCiKk-0004VA-3N; Wed, 26 Jan 2022 13:27:34 +0000
Date: Wed, 26 Jan 2022 13:27:34 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <YfFMRoLixWR/8spY@shell.armlinux.org.uk>
References: <20220123141245.1060-1-jszhang@kernel.org>
 <Ye15va7tFWMgKPEE@lunn.ch> <Ye19bHxcQ5Plx0v9@xhacker>
 <Ye2SznI2rNKAUDIq@lunn.ch> <YfFEulZJKzuRQfeG@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YfFEulZJKzuRQfeG@xhacker>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: don't stop RXC during LPI
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

On Wed, Jan 26, 2022 at 08:55:22PM +0800, Jisheng Zhang wrote:
> On Sun, Jan 23, 2022 at 06:39:26PM +0100, Andrew Lunn wrote:
> > > I think this is a common issue because the MAC needs phy's RXC for RX
> > > logic. But it's better to let other stmmac users verify. The issue
> > > can easily be reproduced on platforms with PHY_POLL external phy.
> > 
> > What is the relevance of PHY polling here? Are you saying if the PHY
> > is using interrupts you do not see this issue?
> 
> I tried these two days, if the PHY is using interrupts, I can't
> reproduce the issue. It looks a bit more complex. Any suggestions?

I suppose it could be that there is a delay between the PHY reporting
the link loss, raising an interrupt, which is then processed to disable
the receive side, and the PHY going into LPI. The problem with polling
is, well, it's polling, and at a one second rate - which probably is too
long between the PHY noticing the loss of link and going into LPI.

What this also probably means is that if interrupt latency is high
enough, the same problem will occur.

So maybe the EEE support to be a little more clever - so we only enable
clock stop after the MAC driver has disabled the receive side.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
