Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2442A87042E
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Mar 2024 15:32:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C81E1C6B45E;
	Mon,  4 Mar 2024 14:32:10 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFB2BC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Mar 2024 14:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M7nvPMRnGQwn3BnuaJW1dh3Kt5tINbWfh5PnvtUaX28=; b=EBP7gGmGPchdnbyVYA8y6FstvG
 pm60B0NbcPa0hTcDs5pzMkFNhVGLXnQB0jiseeNtAWwu6vNdrkVrGFSR0YVkRi4qrmOPifiRFO0r3
 pQjuOnoEDKe/n8Sag0T9MQ5zl/BBaf/VxzrcQH1odHpjsukYyrlYyXjkCLWnliuYg0+9VRDjSSE81
 dr9sDq4vetMxEgz0rwDh4LyTH7YIUdlPcMj/iqFpudwvG7/mMIPYZU+aOs7QcGrIZqEwLGftZuKUn
 hqRoFseN9u96KCN9m2gKKQMjp+mZPhEnn6cC41/YzF0jL++4xvr3wqnCcI8Nl29BRZxjgFwmbruyf
 BFOip6ow==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53470)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1rh9MB-0005l3-1L;
 Mon, 04 Mar 2024 14:31:55 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1rh9M7-0004Yg-F4; Mon, 04 Mar 2024 14:31:51 +0000
Date: Mon, 4 Mar 2024 14:31:51 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <ZeXbV2hIBs7OcEDK@shell.armlinux.org.uk>
References: <20240301-rxc_bugfix-v5-0-8dac30230050@bootlin.com>
 <20240301-rxc_bugfix-v5-1-8dac30230050@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240301-rxc_bugfix-v5-1-8dac30230050@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v5 1/7] net: phylink: add
 PHY_F_RXC_ALWAYS_ON to PHY dev flags
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

On Fri, Mar 01, 2024 at 04:34:58PM +0100, Romain Gantois wrote:
> From: Russell King <linux@armlinux.org.uk>
> 
> Some MAC controllers (e.g. stmmac) require their connected PHY to
> continuously provide a receive clock signal. This can cause issues in two
> cases:
> 
>   1. The clock signal hasn't been started yet by the time the MAC driver
>      initializes its hardware. This can make the initialization fail, as in
>       the case of the rzn1 GMAC1 driver.
>   2. The clock signal is cut during a power saving event. By the time the
>      MAC is brought back up, the clock signal is still not active since
>      phylink_start hasn't been called yet. This brings us back to case 1.
> 
> If a PHY driver reads this flag, it should ensure that the receive clock
> signal is started as soon as possible, and that it isn't brought down when
> the PHY goes into suspend.
> 
> Signed-off-by: Russell King <linux@armlinux.org.uk>

This is not the sign-off I sent you with my patches. At the very least,
it doesn't acknowledge my employer, and also has the wrong email address
that I use for _all_ my kernel attributations. Therefore, I can
definitively say that that you made this up. Please correct it back to
the sign-off in my patches that you derived this combined work from.

Given that sign-offs have legal purpose, what's more concerning is that
care has not been taken on your side to ensure that your handling of it
is correct, and has taken several postings before this cockup has been
noticed. This is not good.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
