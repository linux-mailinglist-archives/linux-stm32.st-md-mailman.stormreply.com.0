Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 460B4B82325
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Sep 2025 00:54:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02C92C32EA8;
	Wed, 17 Sep 2025 22:54:16 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 298C9C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Sep 2025 22:54:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CFD8A40871;
 Wed, 17 Sep 2025 22:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18268C4CEE7;
 Wed, 17 Sep 2025 22:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758149653;
 bh=z5aUyn8esdedtU49mhVPTZw8U7IDxTGO/BUaAI/eVc0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sDDhwxbk05spzhEuUTjELdBpi/vcVfTquXJ0xQRksKIGXbGBQeo8hef4TMeDoMDGU
 BIpdgHAv8ULGeXAyb0p+7+bEV1Tf2NzDoUjJdbXXZU1OW1PwC76E62ALG8dHeg4FJH
 5weCZ5b/4Pl3wIMyMdwq4hpEwTVlP6kvgdsKoY+abl76cnVM17bmqgbTGKn5BRTTRf
 KyLv35rP+AxIajSR3Tl/rP4zxk4GELQYoQtSwyZz6KTVXvucSMSiS31t10zwWgtXBD
 YElcaWl/dAYvBZnF2wpsTBlMctgMm/0t1KVjZ6b+qkgXPH9wdSqj5gXNfQYEcqFfZi
 PhBbeDAFr/auw==
Date: Wed, 17 Sep 2025 15:54:12 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Message-ID: <20250917155412.7b2af4f1@kernel.org>
In-Reply-To: <20250917154920.7925a20d@kernel.org>
References: <20250915-qbv-fixes-v2-0-ec90673bb7d4@altera.com>
 <20250915-qbv-fixes-v2-2-ec90673bb7d4@altera.com>
 <20250917154920.7925a20d@kernel.org>
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, rohan.g.thomas@altera.com,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, "Ng, Boon Khai" <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rohan G Thomas <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 2/2] net: stmmac: Consider Tx VLAN
 offload tag length for maxSDU
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

On Wed, 17 Sep 2025 15:49:20 -0700 Jakub Kicinski wrote:
> On Mon, 15 Sep 2025 16:17:19 +0800 Rohan G Thomas via B4 Relay wrote:
> > From: Rohan G Thomas <rohan.g.thomas@altera.com>
> > 
> > On hardware with Tx VLAN offload enabled, add the VLAN tag
> > length to the skb length before checking the Qbv maxSDU.
> > Add 4 bytes for 802.1Q an add 8 bytes for 802.1AD tagging.
> > 
> > Fixes: c5c3e1bfc9e0 ("net: stmmac: Offload queueMaxSDU from tc-taprio")
> > Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> > Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 25 ++++++++++++++++-------
> >  1 file changed, 18 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 8c8ca5999bd8ad369eafa0cd8448a15da55be86b..c06c947ef7764bf40291a556984651f4edd7cb74 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -4537,6 +4537,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
> >  	bool has_vlan, set_ic;
> >  	int entry, first_tx;
> >  	dma_addr_t des;
> > +	u32 sdu_len;
> >  
> >  	tx_q = &priv->dma_conf.tx_queue[queue];
> >  	txq_stats = &priv->xstats.txq_stats[queue];
> > @@ -4553,13 +4554,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
> >  			return stmmac_tso_xmit(skb, dev);
> >  	}
> >  
> > -	if (priv->est && priv->est->enable &&
> > -	    priv->est->max_sdu[queue] &&
> > -	    skb->len > priv->est->max_sdu[queue]){
> > -		priv->xstats.max_sdu_txq_drop[queue]++;
> > -		goto max_sdu_err;
> > -	}
> > -
> >  	if (unlikely(stmmac_tx_avail(priv, queue) < nfrags + 1)) {
> >  		if (!netif_tx_queue_stopped(netdev_get_tx_queue(dev, queue))) {
> >  			netif_tx_stop_queue(netdev_get_tx_queue(priv->dev,
> > @@ -4575,6 +4569,23 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
> >  	/* Check if VLAN can be inserted by HW */
> >  	has_vlan = stmmac_vlan_insert(priv, skb, tx_q);
> >  
> > +	sdu_len = skb->len;
> > +	if (has_vlan) {
> > +		/* Add VLAN tag length to sdu length in case of txvlan offload */
> > +		if (priv->dev->features & NETIF_F_HW_VLAN_CTAG_TX)
> > +			sdu_len += VLAN_HLEN;
> > +		if (skb->vlan_proto == htons(ETH_P_8021AD) &&
> > +		    priv->dev->features & NETIF_F_HW_VLAN_STAG_TX)
> > +			sdu_len += VLAN_HLEN;  
> 
> Is the device adding the same VLAN tag twice if the proto is 8021AD?
> It looks like it from the code, but how every strange..
> 
> In any case, it doesn't look like the driver is doing anything with 
> the NETIF_F_HW_VLAN_* flags right? stmmac_vlan_insert() works purely
> off of vlan proto. So I think we should do the same thing here?

I suppose the double tagging depends on the exact SKU but first check
looks unnecessary. Maybe stmmac_vlan_insert() should return the number
of vlans it decided to insert?

> > +	}
> > +
> > +	if (priv->est && priv->est->enable &&
> > +	    priv->est->max_sdu[queue] &&
> > +	    sdu_len > priv->est->max_sdu[queue]) {
> > +		priv->xstats.max_sdu_txq_drop[queue]++;
> > +		goto max_sdu_err;
> > +	}
> > +
> >  	entry = tx_q->cur_tx;
> >  	first_entry = entry;
> >  	WARN_ON(tx_q->tx_skbuff[first_entry]);
> >   
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
