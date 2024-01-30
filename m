Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C49284203A
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jan 2024 10:57:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3389C6B476;
	Tue, 30 Jan 2024 09:57:21 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9DFDC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 09:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f+2kg4tF09LZoZ7Uh1DZzhspF8XmiCbLSzOdKc2DM8c=; b=t/xmO76K6M7GEcBjPID/JNsHAW
 AZ1MwcrhIB//H4vms9xKoI0yIW1hDty1JK7FzvbF2bmpEHqB149JTMbhejWx/mc8D8CoHvt+Almd9
 0t1DNdVbmlY/Ly5dlAWanUfq/znrt0z6Y95xK9U66MzG1ygCgkbTvUSvsEeBBwh0bUGmTbkW1STaY
 JJ1koxek9bMCnaOt7Gr9qUQHKKydqclNPxPXCWMr5i3OqciM6lcWM2YBs7AZkMOP72TFsq8V9aH7Q
 8OiIsu46FyYkPblDC8xrfd3hpySDn/ByAKIAwYgrYGLs3YGkrljf1vQKZa93v0tVhMw4EUTxaXdZb
 pl73+ymg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35696)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1rUkrc-0001ad-2N;
 Tue, 30 Jan 2024 09:57:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1rUkrZ-0005PU-LP; Tue, 30 Jan 2024 09:57:05 +0000
Date: Tue, 30 Jan 2024 09:57:05 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <ZbjH8QJO11ymezZG@shell.armlinux.org.uk>
References: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com>
 <20240130-rxc_bugfix-v2-1-5e6c3168e5f0@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240130-rxc_bugfix-v2-1-5e6c3168e5f0@bootlin.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/7] net: phy: add
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

On Tue, Jan 30, 2024 at 10:28:36AM +0100, Romain Gantois wrote:
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
> [rgantois: commit log]
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

You seem to have combined two of my patches into this one, which touch
two different bits of code. I'm fine with that, but please adjust the
subject line to match the _majority_ of the code that is being touched,
which is phylink (having the prefix net: phylink:), rather than phylib
(having the prefix net: phy:).

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
