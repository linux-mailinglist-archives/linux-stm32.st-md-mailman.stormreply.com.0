Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF82AB14A63
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 10:48:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25B05C35E2E;
	Tue, 29 Jul 2025 08:48:03 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A74ECC35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jul 2025 08:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P7oOJG5KTLIajgCuDI26bWwy2UJFAttGvQUBB26YlI0=; b=w9hTs92QWrfKsmkOfTZU3IzEK9
 /NKQF8UfFxhlytprmFOCd75wSELHVG+RUGnz4wM7Dx+2BPss78SGmtPdHHKqXTVoV+8J/kyMTLg/I
 hRViRpc1b1w3DMsWnVpCv6p54buc+jEfs+NYmwP4vuf7807MxGJTSNKyACuKF7NsdLYmIeK/zwHhi
 6rTY9HECZiKlsvCvt5yr4ekE9YHDNY01jZOJ1qgJQQMG36r0aFS4MlX9ZudxvFrYkCa2Z9Kux6Z8z
 zaUq7ikJI+pkp1WYuCTMqBTlJM0X1inAtGKp0jvRfT3AF6NHz39TTUui2BCr/k4YynT5kjqW0JN+N
 +vUvWBFQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47240)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1ugg04-0001bH-0U;
 Tue, 29 Jul 2025 09:47:56 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1ugg01-0007G2-2s;
 Tue, 29 Jul 2025 09:47:53 +0100
Date: Tue, 29 Jul 2025 09:47:53 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <aIiKuVwyzR4ZSitl@shell.armlinux.org.uk>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
 <E1ugQ38-006KDX-RT@rmk-PC.armlinux.org.uk>
 <b612eaee-17f2-4cab-bc37-a1cb9560ffe1@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b612eaee-17f2-4cab-bc37-a1cb9560ffe1@lunn.ch>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 7/7] net: stmmac: explain the
 phylink_speed_down() call in stmmac_release()
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

On Mon, Jul 28, 2025 at 07:29:09PM +0200, Andrew Lunn wrote:
> On Mon, Jul 28, 2025 at 04:46:02PM +0100, Russell King (Oracle) wrote:
> > The call to phylink_speed_down() looks odd on the face of it. Add a
> > comment to explain why this call is there.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index f44f8b1b0efa..0da5c29b8cb0 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -4138,8 +4138,13 @@ static int stmmac_release(struct net_device *dev)
> >  	struct stmmac_priv *priv = netdev_priv(dev);
> >  	u32 chan;
> >  
> > +	/* If the PHY or MAC has WoL enabled, then the PHY will not be
> > +	 * suspended when phylink_stop() is called below. Set the PHY
> > +	 * to its slowest speed to save power.
> > +	 */
> >  	if (device_may_wakeup(priv->device))
> >  		phylink_speed_down(priv->phylink, false);
> > +
> 
> Is there a corresponding phylink_speed_up() somewhere else? Does that
> need a similar comment?

__stmmac_open() does:

        phylink_start(priv->phylink);
        /* We may have called phylink_speed_down before */
        phylink_speed_up(priv->phylink);

So yes, there is a corresponding call, and it's unconditional, so such
a comment there wouldn't make sense.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
