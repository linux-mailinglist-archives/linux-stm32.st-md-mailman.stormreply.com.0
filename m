Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9E8B15FB9
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jul 2025 13:48:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11AF7C3F939;
	Wed, 30 Jul 2025 11:48:12 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 762EAC35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jul 2025 15:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8pdHtZil6IN1qVHpWKAQBiWmQwU9lVPg4+/dj9oSk8U=; b=rPMqaDgXXNYIXDyeSUIzo7Gq6G
 rKSKVIxWxQ5G0+VnJdJTtFxPxxfb17XbObWMber7dl10BmGoqVsYbaKbL6tWzKBuIJmRk4KdKHhhC
 tsPCMZrDZpkGsafBCJ4PIby6eKeUn8A4ONPhxy428Ygy0nfaWHp2WGdQ/JWnTporuWgl6CTLZbty/
 CLv1NGbqwIYqfRuHVph1I8efco21RkuIdW0OqZiqe0SDMLF3puF8olVDZDHltynYPj0d8Um18Wj1x
 p+iL7zahS7Q0RfZAxJIdFt6Rm6rg7/upg3swfHYtuZyDaXh0kYSTIL0NANGwAM0aBzNJvBiIERU4e
 uaW8ytkA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37834)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1ugmIV-00027y-2Z;
 Tue, 29 Jul 2025 16:31:23 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1ugmIS-0007Vx-2J;
 Tue, 29 Jul 2025 16:31:20 +0100
Date: Tue, 29 Jul 2025 16:31:20 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Message-ID: <aIjpSEz4jZz12c2Q@shell.armlinux.org.uk>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
 <E1ugQ33-006KDR-Nj@rmk-PC.armlinux.org.uk>
 <eaef1b1b-5366-430c-97dd-cf3b40399ac7@lunn.ch>
 <aIe5SqLITb2cfFQw@shell.armlinux.org.uk>
 <77229e46-6466-4cd4-9b3b-d76aadbe167c@foss.st.com>
 <aIiOWh7tBjlsdZgs@shell.armlinux.org.uk>
 <aIiQ6qnj1M2qTudc@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aIiQ6qnj1M2qTudc@shell.armlinux.org.uk>
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

On Tue, Jul 29, 2025 at 10:14:18AM +0100, Russell King (Oracle) wrote:
> On Tue, Jul 29, 2025 at 10:03:22AM +0100, Russell King (Oracle) wrote:
> > Without Thierry's .dts patch, as I predicted, enabling WoL at the
> > PHY results in Bad Stuff happening - the code in the realtek driver
> > for WoL is quite simply broken and wrong.
> > 
> > Switching the pin from INTB mode to PMEB mode results in:
> > - No link change interrupts once WoL is enabled
> > - The interrupt output being stuck at active level, causing an
> >   interrupt storm and the interrupt is eventually disabled.
> >   The PHY can be configured to pulse the PMEB or hold at an active
> >   level until the WoL is cleared - and by default it's the latter.
> > 
> > So, switching the interrupt pin to PMEB mode is simply wrong and
> > breaks phylib. I guess the original WoL support was only tested on
> > a system which didn't use the PHY interrupt, only using the interrupt
> > pin for wake-up purposes.
> 
> I will also state that the only way the WoL support for Realtek that
> was merged can possibly work is if there is some other agent in the
> system which configures the PHY such that PMEB only pulses on WoL
> packet reception. Unless this is the case, the PMEB pin will be
> pulled active on the first matching WoL packet, and remain there.
> That means WoL will work for the first attempt and not after.
> 
> This makes the WoL support that was merged completely broken for the
> general case where there isn't some other agent configuring the PHY
> e.g. at boot time.
> 
> I am in two minds whether it should be reverted until it can be
> correctly implemented. It's a relatively recent addition to the
> kernel - the patch is dated 29th April 2025. See
> https://patch.msgid.link/20250429-realtek_wol-v2-1-8f84def1ef2c@kuka.com

Oh, and it gets better...

		/* Disable magic packet matching and reset WOL status */
		rtl821x_write_page(dev, RTL8211F_WOL_SETTINGS_PAGE);
		__phy_write(dev, RTL8211F_WOL_SETTINGS_EVENTS, 0);
		__phy_write(dev, RTL8211F_WOL_SETTINGS_STATUS, RTL8211F_WOL_STATUS_RESET);

where RTL8211F_WOL_STATUS_RESET is defined as:

#define RTL8211F_WOL_STATUS_RESET              (BIT(15) | 0x1fff)

Now, this does nothing of the sort. Yes, bit 15 is the WoL reset bit,
but if one bothers to read the application note, one discovers that
bit 15 is _active_ _low_ !

This bit is required to be written as zero to reset the PMEB output
to inactive state. No where in the driver is this done.

Ergo, the addition of WoL support for RTL8211F, basically, is totally
and utterly broken, even if pin 31 is used solely for PMEB
functionality.

Therefore, the only conclusion at this point is that the patch adding
WoL support was likely hardly functionally tested, if at all. Given
everything I've stated about the current code, I think it's safe to
ignore the "functionality" provided by existing code, and not worry
about breaking anyone's setup: it's already completely broken.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
