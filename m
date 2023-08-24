Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE841786CE4
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Aug 2023 12:39:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 831C0C6B44E;
	Thu, 24 Aug 2023 10:39:06 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EE0DC6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 10:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bd9ObF5yMryn1R9YSIxTJTCgwM9L1it8cN+fWSWpN5M=; b=psXyNZvI5Np55L+RpucSDCB+HA
 cgUdNAjvw/3EKhGEdZSbRqkutatnhXtVvKqGMReYnbfuQeZsx5tBtXYXA/+oEYhtG7eJWDt0Re7C7
 IRy2aoTBqVrgB9RuXM4Xrz4fXLDZ6Ot4qLw8RxRUr0jY+D5guMY4J7a5xPC0OG/nfnCQdBxWCQ+OH
 Ry8Jvp4GLcRb7qO0EKqbPp9Rw0JUI3VTbBOfWi0+FxI1R0tDusORiWO+nMrb4ftG8fzki9kgEhKHh
 OCt6fcydMeUzij2zGPKiKkx+Lq0/AmgcUQrO+FGZdwKs433zeZj23hKDZV3SmXvFzl3aBA17sFjYT
 F4n68GSA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45678)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qZ7jq-00040J-06;
 Thu, 24 Aug 2023 11:38:54 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qZ7jl-0007mV-UL; Thu, 24 Aug 2023 11:38:49 +0100
Date: Thu, 24 Aug 2023 11:38:49 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <ZOczOWMLJnzAdwV1@shell.armlinux.org.uk>
References: <ZOUDRkBXzY884SJ1@shell.armlinux.org.uk>
 <E1qYWSO-005fXx-6w@rmk-PC.armlinux.org.uk>
 <20230823193457.35052bf8@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230823193457.35052bf8@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Feiyang Chen <chenfeiyang@loongson.cn>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 5/9] net: stmmac: use
	phylink_limit_mac_speed()
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

On Wed, Aug 23, 2023 at 07:34:57PM -0700, Jakub Kicinski wrote:
> On Tue, 22 Aug 2023 19:50:24 +0100 Russell King (Oracle) wrote:
> > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > index b51cf92392d2..0d7354955d62 100644
> > --- a/drivers/net/phy/phylink.c
> > +++ b/drivers/net/phy/phylink.c
> > @@ -440,7 +440,7 @@ void phylink_limit_mac_speed(struct phylink_config *config, u32 max_speed)
> >  
> >  	for (i = 0; i < ARRAY_SIZE(phylink_caps_params) &&
> >  		    phylink_caps_params[i].speed > max_speed; i++)
> > -		config->mac_speed &= ~phylink_caps_params.mask;
> > +		config->mac_capabilities &= ~phylink_caps_params[i].mask;
> >  }
> >  EXPORT_SYMBOL_GPL(phylink_limit_mac_speed);
> 
> This chunk belongs to patch 1?

Thanks for spotting that, you're absolutely right. I wonder why I didn't
merge that fix into the correct patch...

In any case, I added a 10th patch to the patch set which converts the
half-duplex capabilities to be positive logic. I'll resend it later
today.

I also have a raft of other stmmac cleanup patches which are steadily
growing at the moment!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
