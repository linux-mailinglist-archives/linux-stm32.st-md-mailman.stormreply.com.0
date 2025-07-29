Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98272B15FBA
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jul 2025 13:48:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A332C3F93D;
	Wed, 30 Jul 2025 11:48:12 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 345DBC35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jul 2025 16:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LUnLUSkkHQ0KtmeifxLqpV19mfTPS/23h/uc9Q4JzE4=; b=Yn7TvtWASbRMJEShmmX8wbGU29
 w8cc/jSobrXubE6LcPAHIPHD9MOcuyRGTOgzRIWmlbJiaK63XqQRuZHIMOiNnaCdff5y/+k2l4ENc
 ThplDkSAXq+0F0v8DHWd13z4lrPwaS38uBIDYnZnukOfuGD/GC+ttx64ddeXSfrZLVip9jFeMxQl1
 LC4Tmzk3E8g9Jz/o8dsvL8yB12YZQ3oyzzBYzJSTZuvJQHdYvS5hpYksPkktYsH+k3ybGhKIJvt+j
 4Zyrft+4Mb2JQD1RJXAFDNJWFDLUMEOLhETH10NCigvvjMY0dlP8BQlup4QnZDRuftMd+TcTdBcmn
 P4ZJ9Shg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37072)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1ugnIN-0002Cl-1t;
 Tue, 29 Jul 2025 17:35:19 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1ugnIJ-0007YC-2w;
 Tue, 29 Jul 2025 17:35:15 +0100
Date: Tue, 29 Jul 2025 17:35:15 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Message-ID: <aIj4Q6WzEQkcGYVQ@shell.armlinux.org.uk>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
 <E1ugQ33-006KDR-Nj@rmk-PC.armlinux.org.uk>
 <eaef1b1b-5366-430c-97dd-cf3b40399ac7@lunn.ch>
 <aIe5SqLITb2cfFQw@shell.armlinux.org.uk>
 <77229e46-6466-4cd4-9b3b-d76aadbe167c@foss.st.com>
 <aIiOWh7tBjlsdZgs@shell.armlinux.org.uk>
 <aIjCg_sjTOge9vd4@shell.armlinux.org.uk>
 <d300d546-09fa-4b37-b8e0-349daa0cc108@foss.st.com>
 <aIjePMWG6pEBvna6@shell.armlinux.org.uk>
 <186a2265-8ca8-4b75-b4a2-a81d21ca42eb@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <186a2265-8ca8-4b75-b4a2-a81d21ca42eb@foss.st.com>
X-Mailman-Approved-At: Wed, 30 Jul 2025 11:48:10 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
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

On Tue, Jul 29, 2025 at 05:34:49PM +0200, Gatien CHEVALLIER wrote:
> For STMMAC:
> I'm a bit lost there. I may be missing something. I thought that using
> PHY WoL (therefore having STMMAC_FLAG_USE_PHY_WOL) superseded the MAC
> WoL usage.

I'll simply point you to Andrew's message:

https://lore.kernel.org/r/5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch

The PHY and the MAC are supposed to inter-operate so that one ends
up with the union of the WoL capabilities.

stmmac gets this wrong right now, but (as I've written previously)
this is going to be a *very* difficult problem to solve, because
the PHY drivers are - to put it bluntly - "utter crap" when it
comes to WoL.

I'll take the rtl8211f again as an example - its get_wol()
implementation is quite typical of many PHY drivers. Someone comes
along and decides to implement WoL support at the PHY. They add the
.get_wol() method, which unconditionally returns the PHY's hardware
capabilities without regards for the rest of the system.

Consider the case where a PHY supports WoL, but the signalling for
WoL to wake up the system is not wired. The .get_wol() method happily
says that WoL is supported. Let's say that the PHY supports magic
packet, and so does the MAC, and the MAC WoL is functional.

Now, with what Andrew said in his email, and consider what this means.
.set_wol() is called, requesting magic packet. The PHY driver says "oh
yes, the PHY hardware supports this, I'll program the PHY and return
zero". At this point, the MAC thinks the PHY has accepted the WoL
configuration.

The user suspends the system. The user sends the correct magic
packet. The system does not wake up. The user is now confused.

However, if the PHY driver were to behave correctly according to what
Andrew says, and not allow WoL if it can't wake the system, then
instead we would program the MAC to allow magic packet, and the user
would be happy because their system would wake up as expected.

This is why we can't simply "fix" stmmac - not without all the PHY
drivers that are being used with stmmac behaving properly. Can it
ever be fixed to work as Andrew suggests? I really don't know. I
suspect not, because that will probably involve regressing a lot of
setups that work today (fixing the PHY drivers will likely cause
user visible regressions.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
