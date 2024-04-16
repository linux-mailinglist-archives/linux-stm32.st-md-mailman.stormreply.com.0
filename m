Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA93E8A6A11
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 14:01:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92B1AC6B47E;
	Tue, 16 Apr 2024 12:01:45 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5A00C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 12:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IsKWmq3S1tbhsPEHkpNJ+4wTjZvXqEyH5UAdmDYEQ5Q=; b=R6GDJn38hgKmNBGIc81JtA0h1Q
 R3uScF+x+HDTqA8bIZi8vFrRKzu4vgwk6os8ntlO2z4sio2h40d5XAbu9VYldnSIq9/Uc2BFgxhWU
 gYhHN/JWQBuDrHapNFeqQUlssHeUz7jEXzIuxbYOR+Oiam/vKXNlqS5aZKZVHPLStzH5rEMJFdeqp
 xIQ6DJrAGZh1xsU74mUnzpwU4/s02XomHhPQoL9yiF7qk88W8YEcIa7iMY0o8e51JmSx2V1NTExas
 kZAUfITBlX3IP8E9E9hqhJkAqpfhfBqhepNUAQFCPz8I/PhRvoptM3wQRl+1nbrmTPPkjr9jiogV0
 sxjM8eCA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33062)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1rwhUv-00009J-1B;
 Tue, 16 Apr 2024 13:01:13 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1rwhUo-0004pX-19; Tue, 16 Apr 2024 13:01:06 +0100
Date: Tue, 16 Apr 2024 13:01:05 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <Zh5ogZ433lrUOi9b@shell.armlinux.org.uk>
References: <20240412180340.7965-1-fancer.lancer@gmail.com>
 <20240412180340.7965-5-fancer.lancer@gmail.com>
 <714199e5-edf2-dcbb-216b-563431d70488@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <714199e5-edf2-dcbb-216b-563431d70488@bootlin.com>
Cc: Yanteng Si <siyanteng@loongson.cn>, linux-kernel@vger.kernel.org,
 Simon Horman <horms@kernel.org>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Serge Semin <fancer.lancer@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 4/4] net: stmmac: Move MAC caps
 init to phylink MAC caps getter
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

On Tue, Apr 16, 2024 at 09:56:32AM +0200, Romain Gantois wrote:
> Hi Serge,
> 
> On Fri, 12 Apr 2024, Serge Semin wrote:
> 
> > +static unsigned long stmmac_mac_get_caps(struct phylink_config *config,
> > +					 phy_interface_t interface)
> > +{
> > +	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
> > +
> > +	/* Get the MAC-specific capabilities */
> > +	stmmac_mac_phylink_get_caps(priv);
> 
> This is a bit of a nitpick, but the terminology is quite confusing between 
> stmmac_mac_phylink_get_caps() and stmmac_mac_get_caps(). Ideally, we could just 
> get rid of the whole stmmac_do_void_callback() complexity and just call 
> phylink_get_caps() directly. In the meantime, maybe renaming this to 
> stmmac_mac_core_get_caps() would be acceptable?

I'd prefer not to do that. If the method is called mac_get_caps() then
I'd much rather have method implementations called foo_mac_get_caps()
which makes grep easier.

So... stmmac_core_mac_get_caps() would be acceptable to me.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
