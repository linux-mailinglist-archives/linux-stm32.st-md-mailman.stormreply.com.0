Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27574B14892
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:49:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D907EC3F92D;
	Tue, 29 Jul 2025 06:49:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89033C36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jul 2025 17:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q2WJT/kxEOUhaPow0205LOsDK8JhmSJ5YD08xubhx7Q=; b=w/2kJuuqSsJEI0KehdTGiYkqcR
 dM2viPfSYwnUIBjCFJL7q4So1z0YVONyoC9eN9w1Hs1bIB/IeAHfb9lKJvR1bJ+QY/m3IXSCbfFkb
 DjPc2wG4L8i+e7biWmDrX5DUOFsFW3zBZcRwzHXi0xLsw1yPpjkmULobR0cq7cs9aX6CEWfITR/bT
 cUFc/RTcp1nl9sv4YkMfdd6jULWuM/QAAFBXQf5QSZcVFGD0U84+4XYjmiH29LHtWRwDjY/yxMxJy
 +2bGps5EpLl6Yc9vFkkLrxEMzuhI/0EV0WiFqsCHu33ocZoL6GG7zoYwqUbJVZqhr25a/pArX8sc7
 6XSkxvxw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55998)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1ugS3K-0000h8-0k;
 Mon, 28 Jul 2025 18:54:22 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1ugS3G-0004wY-1k;
 Mon, 28 Jul 2025 18:54:18 +0100
Date: Mon, 28 Jul 2025 18:54:18 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <aIe5SqLITb2cfFQw@shell.armlinux.org.uk>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
 <E1ugQ33-006KDR-Nj@rmk-PC.armlinux.org.uk>
 <eaef1b1b-5366-430c-97dd-cf3b40399ac7@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eaef1b1b-5366-430c-97dd-cf3b40399ac7@lunn.ch>
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:48:52 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
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

On Mon, Jul 28, 2025 at 07:28:01PM +0200, Andrew Lunn wrote:
> > +static inline bool stmmac_wol_enabled_mac(struct stmmac_priv *priv)
> > +{
> > +	return priv->plat->pmt && device_may_wakeup(priv->device);
> > +}
> > +
> > +static inline bool stmmac_wol_enabled_phy(struct stmmac_priv *priv)
> > +{
> > +	return !priv->plat->pmt && device_may_wakeup(priv->device);
> > +}
> 
> I agree this is a direct translation into a helper.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
> I'm guessing at some point you want to change these two
> helpers. e.g. at some point, you want to try getting the PHY to do the
> WoL, independent of !priv->plat->pmt? 
> 
> > -	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
> > +	if (stmmac_wol_enabled_phy(priv))
> >  		phylink_speed_down(priv->phylink, false);
> 
> This might be related to the next patch. But why only do speed down
> when PHY is doing WoL? If the MAC is doing WoL, you could also do a
> speed_down.

No idea, but that's what the code currently does, and, as ever with
a cleanup series, I try to avoid functional changes in cleanup series.

Also, bear in mind that I can't test any of this.

We haven't yet been successful in getting WoL working in mainline. It
_seems_ that the Jetson Xaiver NX platform should be using PHY mode,
but the Realtek PHY driver is definitely broken for WoL. Even with
that hacked, and along with other fixes that I've been given, I still
can't get the SoC to wake up via WoL. In fact, the changes to change
DT to specify the PHY interrupt as being routed through the PM
controller results in normal PHY link up/down interrupts no longer
working.

I'd like someone else to test functional changes!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
