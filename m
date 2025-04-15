Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 871ADA898C4
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 11:54:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 349F6C78F68;
	Tue, 15 Apr 2025 09:54:56 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3390CC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 09:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IFDH9vhWaq+ALllkPSDHzLJE41HD2vsjtjk4qA/e2mQ=; b=fuWdPx6GZN1eNf0cArwoAmpK7d
 AayMLXQzTkfKlcEaqCqvLpA3jxERKs/fV8rnhvBlzf5Hex5N2M46GK4CNyS9N6URjHzNh5jFkkjJf
 0k4DVFyPXYIvBHzf7mdbkfDqQXO0MY2Ejn/tYnh+JVgpnjeTxjl14JjYRkKDF4vB3kbt7mUPWmxd7
 Dt1s5UC+j+n/vxB/mAjRGu2mBfX4TEf3LRlpvtmR5rVFiRXO0iOQO2/6Z7Kyn88ayyoK9Oxgag4xf
 potupcaQeCqqy/np+DQiz3sOqB7O82bFLup289XuWs9fZo/Fl6aNC4pqTYG+mpkKvgw+49DQ29ReN
 0Ao8BGPw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58114)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1u4d0B-0007sy-2L;
 Tue, 15 Apr 2025 10:54:47 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1u4d08-0000GI-1a;
 Tue, 15 Apr 2025 10:54:44 +0100
Date: Tue, 15 Apr 2025 10:54:44 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <Z_4s5DmCPKB8SUJv@shell.armlinux.org.uk>
References: <Z/ozvMMoWGH9o6on@shell.armlinux.org.uk>
 <E1u3XG6-000EJg-V8@rmk-PC.armlinux.org.uk>
 <20250414174342.67fe4b1d@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250414174342.67fe4b1d@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/3] net: stmmac: call
 phylink_start() and phylink_stop() in XDP functions
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

On Mon, Apr 14, 2025 at 05:43:42PM -0700, Jakub Kicinski wrote:
> On Sat, 12 Apr 2025 10:34:42 +0100 Russell King (Oracle) wrote:
> > Phylink does not permit drivers to mess with the netif carrier, as
> > this will de-synchronise phylink with the MAC driver. Moreover,
> > setting and clearing the TE and RE bits via stmmac_mac_set() in this
> > path is also wrong as the link may not be up.
> > 
> > Replace the netif_carrier_on(), netif_carrier_off() and
> > stmmac_mac_set() calls with the appropriate phylink_start() and
> > phylink_stop() calls, thereby allowing phylink to manage the netif
> > carrier and TE/RE bits through the .mac_link_up() and .mac_link_down()
> > methods.
> > 
> > Note that RE should only be set after the DMA is ready to avoid the
> > receive FIFO between the MAC and DMA blocks overflowing, so
> > phylink_start() needs to be placed after DMA has been started.
> 
> IIUC this will case a link loss when XDP is installed, if not disregard
> the reset of the email.

It will, because the author who added XDP support to stmmac decided it
was easier to tear everything down and rebuild, which meant (presumably)
that it was necessary to use netif_carrier_off() to stop the net layer
queueing packets to the driver. I'm just guessing - I know nothing
about XDP, and never knowingly used it.

> Any idea why it's necessary to mess with the link for XDP changes?

Depends what you mean by "link". If you're asking why it messes with
netif_carrier_foo(), my best guess is as above. However, phylink
drivers are not allowed to mess with the netif_carrier state (as the
commit message states.) This is not a new requirement, it's always
been this way with phylink, and this pre-dates the addition of XDP
to this driver.

As long as the code requires the netif_carrier to be turned off, the
only way to guarantee that in a phylink using driver is as per this
patch.

I'm guessing that the reason it does this is because it completely
takes down the MAC and tx/rx rings to reprogram everything from
scratch, and thus any interference from a packet coming in to be
transmitted is going to cause problems.

> I think we should mention in the commit message that the side effect is
> link loss on XDP on / off. I don't know of any other driver which would
> need this, stmmac is a real gift..

I'll add that. However, it would be nice to find a different solution
for XDP on this driver.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
