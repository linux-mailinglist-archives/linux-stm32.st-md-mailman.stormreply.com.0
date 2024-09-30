Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9566989F31
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Sep 2024 12:14:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A21DC78002;
	Mon, 30 Sep 2024 10:14:47 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECC86C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2024 10:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9OlRk2qJffviTG3xiJHPw655zAjPrxKfaoMhCDVoxhU=; b=rJ+/s2ZZ+r1qhJgR5sXdq8swui
 jsh1nMH1fR4V/oWf9FZXMwwI/Hk5nIBQyd3S1HfKYvC29P1K1iye7WHFjWYQVVMAEwD8R4YP2joJC
 AyP0nT9kdNN8pIzpO5LyUgufmVf9HADZ+gBuCTWQu0jMZeQfOqu511rej5iysuuHHt0b5ueYYx6hw
 pKvOhV3HWIGc7INL0rpdBLz61nVMLGXFJiSEVwwGQ+RbufWUgkJ0XAdLfbtlEdPdBwvBBK9LgLDhi
 QtYbKhUxGZYBcDE1uygEP/jJQ1R10aZEl3CMA37vcsPOGp0zPhS1UE5wBwL3uRo0DcvA3NpaEiuUe
 NDKjZSTw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44266)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1svDQ7-00041t-03;
 Mon, 30 Sep 2024 11:14:22 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1svDPz-0003uN-0e;
 Mon, 30 Sep 2024 11:14:15 +0100
Date: Mon, 30 Sep 2024 11:14:15 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <Zvp59w0kId/t8CZs@shell.armlinux.org.uk>
References: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
 <E1ssjcZ-005Nrf-QL@rmk-PC.armlinux.org.uk>
 <mykeabksgikgk6otbub2i3ksfettbozuhqy3gt5vyezmemvttg@cpjn5bcfiwei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mykeabksgikgk6otbub2i3ksfettbozuhqy3gt5vyezmemvttg@cpjn5bcfiwei>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 01/10] net: pcs: xpcs: move
 PCS reset to .pcs_pre_config()
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

On Mon, Sep 30, 2024 at 01:16:57AM +0300, Serge Semin wrote:
> Hi Russell
> 
> On Mon, Sep 23, 2024 at 03:00:59PM GMT, Russell King (Oracle) wrote:
> > +static void xpcs_pre_config(struct phylink_pcs *pcs, phy_interface_t interface)
> > +{
> > +	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
> > +	const struct dw_xpcs_compat *compat;
> > +	int ret;
> > +
> > +	if (!xpcs->need_reset)
> > +		return;
> > +
> 
> > +	compat = xpcs_find_compat(xpcs->desc, interface);
> > +	if (!compat) {
> > +		dev_err(&xpcs->mdiodev->dev, "unsupported interface %s\n",
> > +			phy_modes(interface));
> > +		return;
> > +	}
> 
> Please note, it's better to preserve the xpcs_find_compat() call even
> if the need_reset flag is false, since it makes sure that the
> PHY-interface is actually supported by the PCS.

Sorry, but I strongly disagree. xpcs_validate() will already have dealt
with that, so we can be sure at this point that the interface is always
valid. The NULL check is really only there because it'll stop the
"you've forgotten to check for NULL on this function that can return
NULL" brigade endlessly submitting patches to add something there -
just like xpcs_get_state() and xpcs_do_config().

> > +	bool need_reset;
> 
> If you still prefer the PCS-reset being done in the pre_config()
> function, then what about just directly checking the PMA id in there?
> 
> 	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID)
> 		return 0;
> 
> 	return xpcs_soft_reset(xpcs);

I think you've missed what "need_reset" is doing as you seem to
think it's just to make it conditional on the PMA ID. That's only
part of the story.

In the existing code, the reset only happens _once_ when the create
happens, not every time the PCS is configured. I am preserving this
behaviour, because I do _NOT_ wish to incorporate multiple functional
changes into one patch - and certainly in a cleanup series keep the
number of functional changes to a minimum.

So, all in all, I don't see the need to change anything in my patch.

Thanks for the feedback anyway.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
