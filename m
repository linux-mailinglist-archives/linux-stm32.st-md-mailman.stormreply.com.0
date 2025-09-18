Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BD0B15FBC
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jul 2025 13:48:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66679C3F93F;
	Wed, 30 Jul 2025 11:48:12 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEBC3C35E3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jul 2025 17:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=eN8xia2pWS6RYX3WcW0Y0ly9LBsjiwKipKHOrqKEcmU=; b=fUBNgdgwB8JWrKCuOAdz0SVivV
 nv0YVIGRzpTMTDR2aP+y9xnk32N88CgEQoLoGNV3Hz99QJDMUynddwGxl4bCG7zPPt+DtykhJ30H1
 Y1mG2NbWq4GANzenNfNDcNjLVT++XSZBhLvpbaz0hxSekWYzicV0KLzaD7/KoyOyI8qY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ugo6Z-003DUL-7n; Tue, 29 Jul 2025 19:27:11 +0200
Date: Tue, 29 Jul 2025 19:27:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <b88160a5-a0b8-4a1a-a489-867b8495a88e@lunn.ch>
References: <E1ugQ33-006KDR-Nj@rmk-PC.armlinux.org.uk>
 <eaef1b1b-5366-430c-97dd-cf3b40399ac7@lunn.ch>
 <aIe5SqLITb2cfFQw@shell.armlinux.org.uk>
 <77229e46-6466-4cd4-9b3b-d76aadbe167c@foss.st.com>
 <aIiOWh7tBjlsdZgs@shell.armlinux.org.uk>
 <aIjCg_sjTOge9vd4@shell.armlinux.org.uk>
 <d300d546-09fa-4b37-b8e0-349daa0cc108@foss.st.com>
 <aIjePMWG6pEBvna6@shell.armlinux.org.uk>
 <186a2265-8ca8-4b75-b4a2-a81d21ca42eb@foss.st.com>
 <aIj4Q6WzEQkcGYVQ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aIj4Q6WzEQkcGYVQ@shell.armlinux.org.uk>
X-Mailman-Approved-At: Wed, 30 Jul 2025 11:48:10 +0000
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 6/7] net: stmmac: add helpers
 to indicate WoL enable status
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

> stmmac gets this wrong right now, but (as I've written previously)
> this is going to be a *very* difficult problem to solve, because
> the PHY drivers are - to put it bluntly - "utter crap" when it
> comes to WoL.

Agreed.

> I'll take the rtl8211f again as an example - its get_wol()
> implementation is quite typical of many PHY drivers. Someone comes
> along and decides to implement WoL support at the PHY. They add the
> .get_wol() method, which unconditionally returns the PHY's hardware
> capabilities without regards for the rest of the system.
> 
> Consider the case where a PHY supports WoL, but the signalling for
> WoL to wake up the system is not wired. The .get_wol() method happily
> says that WoL is supported. Let's say that the PHY supports magic
> packet, and so does the MAC, and the MAC WoL is functional.
> 
> Now, with what Andrew said in his email, and consider what this means.
> .set_wol() is called, requesting magic packet. The PHY driver says "oh
> yes, the PHY hardware supports this, I'll program the PHY and return
> zero". At this point, the MAC thinks the PHY has accepted the WoL
> configuration.
> 
> The user suspends the system. The user sends the correct magic
> packet. The system does not wake up. The user is now confused.

There are some MAC drivers which simply trust the PHY. They pass
.get_wol() and .set_wol() direct to the PHY. They don't attempt to
perform MAC WoL, or the MAC driver does not have any hardware support
for it. Such systems are going to end up with a confused user when the
driver says WoL is enabled, but it does not wake.

So while i agree we cannot simply 'fix' stmmac, the issue of PHY
drivers not behaving properly is a bigger problem across a wide range
of MAC drivers.

I think we could quickly improve the situation to some degree by
reviewing the PHY drivers. e.g. the current code in mxl-gpy.c makes it
clear WoL is just another interrupt source. There is no special
pin. So get_wol() needs a call to phy_interrupt_is_valid(phydev) and
return not return any WoL modes if there is not a valid interrupt.

This will not work for all PHYs, e.g. the Marvell 1G PHYs can
repurposed LED2 for WoL indication.

motorcomm.c looks broken. The code suggests WoL is just another
interrupt source, but the driver lacks interrupt handling...

The broadcom code looks like it gets it correct.
bcm54xx_phy_can_wakeup() checks if there is an interrupt or a
dedicated GPIO, and return no wakeup modes if not. KUDOS to Florians
team.

dp83822.c appears to be missing a phy_interrupt_is_valid(phydev),
since WoL appears to be just another interrupt source.

Same for dp83867.c.

And i did notice that the Broadcom code is the only one doing anything
with enable_irq_wake()/disable_irq_wake(). We need to scatter these
into the drivers.

	Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
