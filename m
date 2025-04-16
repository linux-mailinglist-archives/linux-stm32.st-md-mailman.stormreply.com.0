Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E44CCA90ABF
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Apr 2025 20:03:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88225C78F87;
	Wed, 16 Apr 2025 18:03:35 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8957C78F83
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 18:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NJezJ3JKJn/lT7bV9zFqb3A9+YwgHaor3OWOH2QhrfY=; b=OH6qEwFHc99Ha7JqwKv7jMP/VA
 I+OxXNDjHtKYzKMGYs/zxhUe0+ZWnqGJ3zNiAOihoC2jTDMThgiHTw/CTK5z2Ek53gqxTw0/s/dZo
 uXyj4Qc3NPwaUN392Mhj+9rsbliM7UnI+NhBxZQP+6ztCGKnMGy/ao+69nciB7cP7/Wq4Rkjmi0gA
 U+aPBkgQKOP9gB4lpCkBPoTe2Jhnjw4V2BKwaitBzQ29vdyQsAJPMs1aKscY52Dh1w7kEcMnUcH+l
 ZYX/zldrDIY2Zq+zD0eNlVoXMVe80MJ8dGH1NrTgj+qKKmNm0mEAy3h9H9qk/yl66JJr1zhLxSpKZ
 yefTPZ7w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57022)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1u576b-0001lk-0h;
 Wed, 16 Apr 2025 19:03:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1u576W-0001bU-1K;
 Wed, 16 Apr 2025 19:03:20 +0100
Date: Wed, 16 Apr 2025 19:03:19 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <Z__w52jL05YbqSTW@shell.armlinux.org.uk>
References: <Z/ozvMMoWGH9o6on@shell.armlinux.org.uk>
 <E1u3XG6-000EJg-V8@rmk-PC.armlinux.org.uk>
 <20250414174342.67fe4b1d@kernel.org>
 <Z_4s5DmCPKB8SUJv@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z_4s5DmCPKB8SUJv@shell.armlinux.org.uk>
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

On Tue, Apr 15, 2025 at 10:54:44AM +0100, Russell King (Oracle) wrote:
> On Mon, Apr 14, 2025 at 05:43:42PM -0700, Jakub Kicinski wrote:
> > IIUC this will case a link loss when XDP is installed, if not disregard
> > the reset of the email.
> 
> It will, because the author who added XDP support to stmmac decided it
> was easier to tear everything down and rebuild, which meant (presumably)
> that it was necessary to use netif_carrier_off() to stop the net layer
> queueing packets to the driver. I'm just guessing - I know nothing
> about XDP, and never knowingly used it.
> 
> > Any idea why it's necessary to mess with the link for XDP changes?
> 
> Depends what you mean by "link". If you're asking why it messes with
> netif_carrier_foo(), my best guess is as above. However, phylink
> drivers are not allowed to mess with the netif_carrier state (as the
> commit message states.) This is not a new requirement, it's always
> been this way with phylink, and this pre-dates the addition of XDP
> to this driver.
> 
> As long as the code requires the netif_carrier to be turned off, the
> only way to guarantee that in a phylink using driver is as per this
> patch.
> 
> I'm guessing that the reason it does this is because it completely
> takes down the MAC and tx/rx rings to reprogram everything from
> scratch, and thus any interference from a packet coming in to be
> transmitted is going to cause problems.

I'd like the "what do you mean by link" clarified before I update the
commit message.

If you're referring to the carrier state via netif_carrier_off() /
netif_carrier_on(), then nothing actually changes in that respect
because the carrier manipulation is being done by the driver today,
behind phylink's back. That changes to inside phylink with phylink's
knowledge.

It is my understanding that netif_carrier_off() / netif_carrier_on()
get notified to userspace, so this is visible today when XDP changes.

If you are referring to the messages that appear on the kernel console,
then yes, phylink will print those in addition, which actually makes
it more consistent with what's being reported to userspace.

Depending which you are referring to changes what I should say in the
commit message. E.g.

"We retain the changes to carrier state, which are already being
reported to userspace as link loss/link gain events, but we gain
kernel messages reporting the link state."

if you're referring to the carrier state. Or maybe:

"This change will have the side effect of printing link messages to
the kernel log, even though the physical link hasn't changed state.
This matches the carrier state."

if you're referring to the additional kernel messages.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
