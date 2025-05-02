Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E81AA78E2
	for <lists+linux-stm32@lfdr.de>; Fri,  2 May 2025 19:55:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 455D4C78F7D;
	Fri,  2 May 2025 17:55:10 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A83EC7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 May 2025 17:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gXNNDPdZb2Mvvv9l4U0qnaw+JsmJmG680iJnfO61RQ0=; b=drWIecNg8gz9iVU7R4SbsnNC4G
 OT+gaz2JAollchQiDnxPvMENCLtRfCnY/KiSO97PdVcgLiMk7OCUoMLZbwQairLtNUWRytnnYcFrd
 9/v7gYhCHD/48M8bSMa275bj70kY+oJe5NLjmfS1yrf9YAroP0dm7wuZa6zJLyJX2bX5TJFiYjYxQ
 rm95uOLHeXAc7+LDiUYhyo8m1BWM53IZ5flM/iAtkFVBo6zEpNcvn5C/08Q+cMfcuvVVSFfTly0AZ
 HvmokMsKGp0KPgpwV6MoB6FY+sewh4jj8ga1Y4dn8f+jDdulRkjDj1b7R0ZIpOinKe5dHIn/tWTGD
 qOdbDESA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43400)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1uAub8-0001h2-1h;
 Fri, 02 May 2025 18:54:54 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1uAub4-0000s1-0M;
 Fri, 02 May 2025 18:54:50 +0100
Date: Fri, 2 May 2025 18:54:49 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <aBUG6Z_Crs31W45x@shell.armlinux.org.uk>
References: <aBTKOBKnhoz3rrlQ@shell.armlinux.org.uk>
 <E1uAqYC-002D3p-UO@rmk-PC.armlinux.org.uk>
 <ed54d4e5-ecc3-4327-8739-3d41ca41211e@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ed54d4e5-ecc3-4327-8739-3d41ca41211e@lunn.ch>
Cc: Thierry Reding <treding@nvidia.com>, Paolo Abeni <pabeni@redhat.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/4] net: stmmac: call
 phylink_carrier_*() in XDP functions
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

On Fri, May 02, 2025 at 05:29:21PM +0200, Andrew Lunn wrote:
> On Fri, May 02, 2025 at 02:35:36PM +0100, Russell King (Oracle) wrote:
> > Phylink does not permit drivers to mess with the netif carrier, as
> > this will de-synchronise phylink with the MAC driver. Moreover,
> > setting and clearing the TE and RE bits via stmmac_mac_set() in this
> > path is also wrong as the link may not be up.
> > 
> > Replace the netif_carrier_on(), netif_carrier_off() and
> > stmmac_mac_set() calls with the appropriate phylink_carrier_block() and
> > phylink_carrier_unblock() calls, thereby allowing phylink to manage the
> > netif carrier and TE/RE bits through the .mac_link_up() and
> > .mac_link_down() methods.
> > 
> > This change will have the side effect of printing link messages to
> > the kernel log, even though the physical link hasn't changed state.
> > This matches the carrier state that userspace sees, which has always
> > "bounced".
> > 
> > Note that RE should only be set after the DMA is ready to avoid the
> > receive FIFO between the MAC and DMA blocks overflowing, so
> > phylink_start() needs to be placed after DMA has been started.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 20 +++++++++++--------
> >  1 file changed, 12 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index f59a2363f150..ac27ea679b23 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -6922,6 +6922,11 @@ void stmmac_xdp_release(struct net_device *dev)
> >  	/* Ensure tx function is not running */
> >  	netif_tx_disable(dev);
> >  
> > +	/* Take down the software link. stmmac_xdp_open() must be called after
> > +	 * this function to release this block.
> > +	 */
> > +	phylink_carrier_block(priv->phylink);
> > +
> >  	/* Disable NAPI process */
> >  	stmmac_disable_all_queues(priv);
> >  
> > @@ -6937,14 +6942,10 @@ void stmmac_xdp_release(struct net_device *dev)
> >  	/* Release and free the Rx/Tx resources */
> >  	free_dma_desc_resources(priv, &priv->dma_conf);
> >  
> > -	/* Disable the MAC Rx/Tx */
> > -	stmmac_mac_set(priv, priv->ioaddr, false);
> > -
> >  	/* set trans_start so we don't get spurious
> >  	 * watchdogs during reset
> >  	 */
> >  	netif_trans_update(dev);
> > -	netif_carrier_off(dev);
> >  }
> >  
> 
> >  int stmmac_xdp_open(struct net_device *dev)
> > @@ -7026,25 +7027,28 @@ int stmmac_xdp_open(struct net_device *dev)
> >  		hrtimer_setup(&tx_q->txtimer, stmmac_tx_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> >  	}
> >  
> > -	/* Enable the MAC Rx/Tx */
> > -	stmmac_mac_set(priv, priv->ioaddr, true);
> > -
> >  	/* Start Rx & Tx DMA Channels */
> >  	stmmac_start_all_dma(priv);
> >  
> > +	/* Allow phylink to bring the software link back up.
> > +	 * stmmac_xdp_release() must have been called prior to this.
> > +	 */
> 
> This is counter intuitive. Why is release called before open?

Indeed - and that should've been caught in the review where XDP was
being added.

> Looking into stmmac_xdp_set_prog() i think i get it. Even if there is
> not a running XDP prog, stmmac_xdp_release() is called, and then
> stmmac_xdp_open().

If there is a change of "do we have an XDP prog" state, then
stmmac_xdp_release() is called to free all the current contexts to
do with queue/descriptor management, and then stmmac_xdp_open() is
called thereafter. These are doing a subset of .ndo_open/.ndo_release
and I think that's where they're getting their naming from.

The only possible sequence is:

	stmmac_open()
then, on each XDP prog addition or removal, but not replacement:
		stmmac_xdp_release()
		stmmac_xdp_open()
finally,
	stmmac_release()

> Maybe these two functions need better names? prepare and commit?

Yes, it's all counter intuitive, and there are various things about the
XDP code that make it hard to follow.

For example, stmmac_xdp_set_prog() leads you to think, because of the
way the need_update variable is set, that looking for references to
xdp_prog would show one where all the dependents are, but no, there's
stmmac_xdp_is_enabled(), which is nice and readable, but could've
been used in stmmac_xdp_set_prog() to make it more obvious what to
grep for.

Incidentally, if stmmac_xdp_open() fails to re-grab the interrupts,
then it calls phylink_stop(), stmmac_hw_teardown(), and
free_dma_desc_resources().

If one then set the interface administratively down, stmmac_release()
gets called, which again calls phylink_stop(), free_dma_desc_resources()
and stmmac_release_ptp().

stmmac_release_ptp() disables/unprepares clk_ptp_ref, and unregisters
the PTP stuff. stmmac_hw_teardown() also disables/unprepares
clk_ptp_ref, so we probably unbalance the clk API in this case...
and probably much other stuff.

Calling free_dma_desc_resources() twice calls functios such as 
free_dma_tx_desc_resources() twice, and it looks like that's not going
to be healthy, calling dma_free_coherent() with the same arguments,
double-releasing memory. Same for kfree(). Probably same for the RX
stuff.

Basically, if one messes with XDP in this driver, expect things to go
bang and kill the kernel if something goes wrong with the whole
xdp_release+xdp_open dance.

Honestly, this needs a rewrite, but I currently know nowt about XDP.

So, I'd suggest that the names of these functions is the least of the
problems here.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
