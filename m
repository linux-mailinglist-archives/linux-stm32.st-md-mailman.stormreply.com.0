Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C4649799B
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jan 2022 08:40:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E031C60476;
	Mon, 24 Jan 2022 07:40:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F680C5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jan 2022 16:17:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7250B60FBC;
 Sun, 23 Jan 2022 16:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B101AC340EC;
 Sun, 23 Jan 2022 16:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642954629;
 bh=jt+I++u3hLF8P1Vv8OE/63F2UYfze6jfRP/OKUEOIWA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qrh5KgBWB5pyQI9U2dql4DCgzJQ9MPF1O0ETp+QiCqvgrxWTchAQXIICAbJfcb7av
 X6iwOvH7FXKNyPMFmM4DAqWK6icaZvQbW+HnyDtYvN4Sd7bAPaSkeOmJVdAo9c6hQi
 xfuW9mPIix2CIz3Vx+gxH/hT/89jjYqHvqea176vrmy1I04cX3lWJkbItL0V48JRyD
 NIHyzG1r5lA0jM1nJFpcRaggv7sgoUK/XlLP+/g9VyWWJVfOSlUU92BoNxAPkPCq/u
 dyY35wJy9NrxgX1VZEx/URczjNAlZOFdBZUxld1Ml5MGqpj1iMh1tTvyMKJkW25VNe
 q8NI2km6sozNw==
Date: Mon, 24 Jan 2022 00:09:34 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>, Joakim Zhang <qiangqing.zhang@nxp.com>
Message-ID: <Ye19vpFWXR8wJQVH@xhacker>
References: <20220123141245.1060-1-jszhang@kernel.org>
 <Ye15va7tFWMgKPEE@lunn.ch> <Ye19bHxcQ5Plx0v9@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ye19bHxcQ5Plx0v9@xhacker>
X-Mailman-Approved-At: Mon, 24 Jan 2022 07:40:41 +0000
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: don't stop RXC during LPI
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

On Mon, Jan 24, 2022 at 12:08:22AM +0800, Jisheng Zhang wrote:
> On Sun, Jan 23, 2022 at 04:52:29PM +0100, Andrew Lunn wrote:
> > On Sun, Jan 23, 2022 at 10:12:45PM +0800, Jisheng Zhang wrote:
> > > I met can't receive rx pkt issue with below steps:
> > > 0.plug in ethernet cable then boot normal and get ip from dhcp server
> > > 1.quickly hotplug out then hotplug in the ethernet cable
> > > 2.trigger the dhcp client to renew lease
> > > 
> > > tcpdump shows that the request tx pkt is sent out successfully,
> > > but the mac can't receive the rx pkt.
> > > 
> > > The issue can easily be reproduced on platforms with PHY_POLL external
> > > phy. If we don't allow the phy to stop the RXC during LPI, the issue
> > > is gone. I think it's unsafe to stop the RXC during LPI because the mac
> > > needs RXC clock to support RX logic.
> > > 
> > > And the 2nd param clk_stop_enable of phy_init_eee() is a bool, so use
> > > false instead of 0.
> > > 
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > index 6708ca2aa4f7..92a9b0b226b1 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > @@ -1162,7 +1162,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
> > >  
> > >  	stmmac_mac_set(priv, priv->ioaddr, true);
> > >  	if (phy && priv->dma_cap.eee) {
> > > -		priv->eee_active = phy_init_eee(phy, 1) >= 0;
> > > +		priv->eee_active = phy_init_eee(phy, false) >= 0;
> > 
> > This has not caused issues in the past. So i'm wondering if this is
> > somehow specific to your system? Does everybody else use a PHY which
> > does not implement this bit? Does your synthesis of the stmmac have a
> > different clock tree?
> > 
> > By changing this value for every instance of the stmmac, you are
> > potentially causing a power regression for stmmac implementations
> > which don't need the clock. So we need a clear understanding, stopping
> > the clock is wrong in general and so the change is correct in
> 
> I think this is a common issue because the MAC needs phy's RXC for RX
> logic. But it's better to let other stmmac users verify. The issue
> can easily be reproduced on platforms with PHY_POLL external phy.
> Or other platforms use a dedicated clock rather than clock from phy
> for MAC's RX logic?
> 
> If the issue turns out specific to my system, then I will send out
> a new patch to adopt your suggestion.
>

+ Joakim

> Hi Joakim, IIRC, you have stmmac + external RTL8211F phy platform, but
> I'm not sure whether your platform have an irq for the phy. could you
> help me to check whether you can reproduce the issue on your platform?
> 
> > general. Or this is specific to your system, and you probably need to
> > add priv->dma_cap.keep_rx_clock_ticking, which you set in your glue
> > driver,and use here to decide what to pass to phy_init_eee().
> 
> Thanks a lot for the suggestion.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
