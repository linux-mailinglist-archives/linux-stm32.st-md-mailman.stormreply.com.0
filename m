Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83912A042D0
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 15:41:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3088AC78022;
	Tue,  7 Jan 2025 14:41:16 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44027C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 14:41:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CF2C75C630D;
 Tue,  7 Jan 2025 14:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08487C4CED6;
 Tue,  7 Jan 2025 14:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736260867;
 bh=Fm54NFKxpCer1yj0tlCPm8daKKZ3zQKs8KdgFK7i0r0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sCc0pZLn5PRwtj2bDqvy9l0P08SW3iNYULWsw9OD4KMgEwI7FImqoRhAsK61anQtY
 bsnW1U7j/UYZQr6m5feLqcycuFT+1lO28KfR5d7ABZ58afQbFF3fzxnSNcsjW9uY62
 C2LgXTKRRObyPWgald3Ce2Mu6IRDZK9vqX/WNUg8WU8sK7XYFwAtyXpk/pkkO/N42M
 uEK1SIeDIsKrJgyxpcV8D//caXY2pz1bCc7pJgjxI7Rsopo55xMME/Gn6/lnef2uIO
 Mx6+t3jO6PrQ6AH/AtWgu2bZbVp7lpFb6vbJzEsC6rWTRlhTkvSqp/0I6/+ir1MouF
 m2H2PsWVOXVEw==
Date: Tue, 7 Jan 2025 14:41:03 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20250107144103.GB5872@kernel.org>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmAE-007VWv-UW@rmk-PC.armlinux.org.uk>
 <20250107112851.GE33144@kernel.org>
 <Z30WmPpMp_BRgrOI@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z30WmPpMp_BRgrOI@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 03/17] net: stmmac: use
 correct type for tx_lpi_timer
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

On Tue, Jan 07, 2025 at 11:57:12AM +0000, Russell King (Oracle) wrote:
> On Tue, Jan 07, 2025 at 11:28:51AM +0000, Simon Horman wrote:
> > On Mon, Jan 06, 2025 at 12:24:58PM +0000, Russell King (Oracle) wrote:
> > > The ethtool interface uses u32 for tx_lpi_timer, and so does phylib.
> > > Use u32 to store this internally within stmmac rather than "int"
> > > which could misinterpret large values.
> > > 
> > > Since eee_timer is used to initialise priv->tx_lpi_timer, this also
> > > should be unsigned to avoid a negative number being interpreted as a
> > > very large positive number.
> > > 
> > > Also correct "value" in dwmac4_set_eee_lpi_entry_timer() to use u32
> > > rather than int, which is derived from tx_lpi_timer, even though
> > > masking with STMMAC_ET_MAX will truncate the sign bits. u32 is the
> > > value argument type for writel().
> > > 
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > 
> > ...
> > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > index 9a9169ca7cd2..b0ef439b715b 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > @@ -111,8 +111,8 @@ static const u32 default_msg_level = (NETIF_MSG_DRV | NETIF_MSG_PROBE |
> > >  				      NETIF_MSG_IFDOWN | NETIF_MSG_TIMER);
> > >  
> > >  #define STMMAC_DEFAULT_LPI_TIMER	1000
> > > -static int eee_timer = STMMAC_DEFAULT_LPI_TIMER;
> > > -module_param(eee_timer, int, 0644);
> > > +static unsigned int eee_timer = STMMAC_DEFAULT_LPI_TIMER;
> > > +module_param(eee_timer, uint, 0644);
> > >  MODULE_PARM_DESC(eee_timer, "LPI tx expiration time in msec");
> > >  #define STMMAC_LPI_T(x) (jiffies + usecs_to_jiffies(x))
> > >  
> > 
> > Hi Russell,
> > 
> > now that eee_timer is unsigned the following check in stmmac_verify_args()
> > can never be true. I guess it should be removed.
> > 
> >         if (eee_timer < 0)
> >                 eee_timer = STMMAC_DEFAULT_LPI_TIMER;
> > 
> 
> Thanks for finding that. The parameter description doesn't seem to
> detail whether this is intentional behaviour or not, or whether it is
> "because someone used int and we shouldn't have negative values here".
> 
> I can't see why someone would pass a negative number for eee_timer
> given that it already defaults to STMMAC_DEFAULT_LPI_TIMER.
> 
> So, I'm tempted to remove this.

I'm not sure either. It did cross my mind that the check could be changed,
to disallow illegal values (if the range of legal values is not all
possible unsigned integer values). But it was just an idea without any
inspection of the code or thought about it's practicality. And my first
instinct was the same as yours: remove the check.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
