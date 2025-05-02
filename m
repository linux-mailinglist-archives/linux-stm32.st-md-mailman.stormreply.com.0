Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E68AA7604
	for <lists+linux-stm32@lfdr.de>; Fri,  2 May 2025 17:29:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EA70C78F7D;
	Fri,  2 May 2025 15:29:35 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E3CBC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 May 2025 15:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=UfHSthQhcUGUYPAqAokpW8M9XQiGqY8eZUIZb5WDYjI=; b=p6NGLdFPU5vD+ggKs/3gbgFczg
 ARE+G6P1/RTbibIEYqrFuAo2kpWtO3AAaAJNjJ5B5RdEDv0EwyDiu4Lgtl7i/XKAYdMl0kmdedgNo
 kIYuOx7CSgcrd0+WnS59vnplpO2Pg+zBkuc+wxx64SDmqpe4HvgRoxcqEBZZ8ZVwozG0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uAsKH-00BQnu-1r; Fri, 02 May 2025 17:29:21 +0200
Date: Fri, 2 May 2025 17:29:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <ed54d4e5-ecc3-4327-8739-3d41ca41211e@lunn.ch>
References: <aBTKOBKnhoz3rrlQ@shell.armlinux.org.uk>
 <E1uAqYC-002D3p-UO@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1uAqYC-002D3p-UO@rmk-PC.armlinux.org.uk>
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

On Fri, May 02, 2025 at 02:35:36PM +0100, Russell King (Oracle) wrote:
> Phylink does not permit drivers to mess with the netif carrier, as
> this will de-synchronise phylink with the MAC driver. Moreover,
> setting and clearing the TE and RE bits via stmmac_mac_set() in this
> path is also wrong as the link may not be up.
> 
> Replace the netif_carrier_on(), netif_carrier_off() and
> stmmac_mac_set() calls with the appropriate phylink_carrier_block() and
> phylink_carrier_unblock() calls, thereby allowing phylink to manage the
> netif carrier and TE/RE bits through the .mac_link_up() and
> .mac_link_down() methods.
> 
> This change will have the side effect of printing link messages to
> the kernel log, even though the physical link hasn't changed state.
> This matches the carrier state that userspace sees, which has always
> "bounced".
> 
> Note that RE should only be set after the DMA is ready to avoid the
> receive FIFO between the MAC and DMA blocks overflowing, so
> phylink_start() needs to be placed after DMA has been started.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 20 +++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index f59a2363f150..ac27ea679b23 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6922,6 +6922,11 @@ void stmmac_xdp_release(struct net_device *dev)
>  	/* Ensure tx function is not running */
>  	netif_tx_disable(dev);
>  
> +	/* Take down the software link. stmmac_xdp_open() must be called after
> +	 * this function to release this block.
> +	 */
> +	phylink_carrier_block(priv->phylink);
> +
>  	/* Disable NAPI process */
>  	stmmac_disable_all_queues(priv);
>  
> @@ -6937,14 +6942,10 @@ void stmmac_xdp_release(struct net_device *dev)
>  	/* Release and free the Rx/Tx resources */
>  	free_dma_desc_resources(priv, &priv->dma_conf);
>  
> -	/* Disable the MAC Rx/Tx */
> -	stmmac_mac_set(priv, priv->ioaddr, false);
> -
>  	/* set trans_start so we don't get spurious
>  	 * watchdogs during reset
>  	 */
>  	netif_trans_update(dev);
> -	netif_carrier_off(dev);
>  }
>  

>  int stmmac_xdp_open(struct net_device *dev)
> @@ -7026,25 +7027,28 @@ int stmmac_xdp_open(struct net_device *dev)
>  		hrtimer_setup(&tx_q->txtimer, stmmac_tx_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>  	}
>  
> -	/* Enable the MAC Rx/Tx */
> -	stmmac_mac_set(priv, priv->ioaddr, true);
> -
>  	/* Start Rx & Tx DMA Channels */
>  	stmmac_start_all_dma(priv);
>  
> +	/* Allow phylink to bring the software link back up.
> +	 * stmmac_xdp_release() must have been called prior to this.
> +	 */

This is counter intuitive. Why is release called before open?

Looking into stmmac_xdp_set_prog() i think i get it. Even if there is
not a running XDP prog, stmmac_xdp_release() is called, and then
stmmac_xdp_open().

Maybe these two functions need better names? prepare and commit?

      Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
