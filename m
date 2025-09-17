Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98156B82307
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Sep 2025 00:49:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4145C32EA8;
	Wed, 17 Sep 2025 22:49:24 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9D5FC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Sep 2025 22:49:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AD30960008;
 Wed, 17 Sep 2025 22:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC200C4CEE7;
 Wed, 17 Sep 2025 22:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758149362;
 bh=cVtEEHP0hFciXuQqvr7c6l2Vgd+VUUwi+9QRFbfG8v8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vKZGADLEvBTv0vZxeSm5mToARBDKSSk+Ap2iPtTlrvrjfKkQwWwu1lBaNOI2tSsi6
 vNkxVQdK1CU0+H6uXx5S+wacfyRoPQhB2e1ZVyUn3/yJDZmjQ26KOKF7LCQnqxnsov
 NA26JK0Wtq5Bx9hKIerITlpwYvMoGRieljqisAit1sggr0SzM6uSyD6QS+yA8CP10E
 yqAZE4Rz0surrfBkgzmjGy/NOiGaU+joM1H4/KbeFzUyOTn68iQ/eyAkG2tOR5fRYH
 SF24uGfpYnjMInBEzCTHjQ66mnCcXJsDNXILUecrxUh3BFEHCdWoiIQE84SYAwiV08
 4ROveW50na4Iw==
Date: Wed, 17 Sep 2025 15:49:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Message-ID: <20250917154920.7925a20d@kernel.org>
In-Reply-To: <20250915-qbv-fixes-v2-2-ec90673bb7d4@altera.com>
References: <20250915-qbv-fixes-v2-0-ec90673bb7d4@altera.com>
 <20250915-qbv-fixes-v2-2-ec90673bb7d4@altera.com>
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

On Mon, 15 Sep 2025 16:17:19 +0800 Rohan G Thomas via B4 Relay wrote:
> From: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> On hardware with Tx VLAN offload enabled, add the VLAN tag
> length to the skb length before checking the Qbv maxSDU.
> Add 4 bytes for 802.1Q an add 8 bytes for 802.1AD tagging.
> 
> Fixes: c5c3e1bfc9e0 ("net: stmmac: Offload queueMaxSDU from tc-taprio")
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 25 ++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 8c8ca5999bd8ad369eafa0cd8448a15da55be86b..c06c947ef7764bf40291a556984651f4edd7cb74 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4537,6 +4537,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
>  	bool has_vlan, set_ic;
>  	int entry, first_tx;
>  	dma_addr_t des;
> +	u32 sdu_len;
>  
>  	tx_q = &priv->dma_conf.tx_queue[queue];
>  	txq_stats = &priv->xstats.txq_stats[queue];
> @@ -4553,13 +4554,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
>  			return stmmac_tso_xmit(skb, dev);
>  	}
>  
> -	if (priv->est && priv->est->enable &&
> -	    priv->est->max_sdu[queue] &&
> -	    skb->len > priv->est->max_sdu[queue]){
> -		priv->xstats.max_sdu_txq_drop[queue]++;
> -		goto max_sdu_err;
> -	}
> -
>  	if (unlikely(stmmac_tx_avail(priv, queue) < nfrags + 1)) {
>  		if (!netif_tx_queue_stopped(netdev_get_tx_queue(dev, queue))) {
>  			netif_tx_stop_queue(netdev_get_tx_queue(priv->dev,
> @@ -4575,6 +4569,23 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
>  	/* Check if VLAN can be inserted by HW */
>  	has_vlan = stmmac_vlan_insert(priv, skb, tx_q);
>  
> +	sdu_len = skb->len;
> +	if (has_vlan) {
> +		/* Add VLAN tag length to sdu length in case of txvlan offload */
> +		if (priv->dev->features & NETIF_F_HW_VLAN_CTAG_TX)
> +			sdu_len += VLAN_HLEN;
> +		if (skb->vlan_proto == htons(ETH_P_8021AD) &&
> +		    priv->dev->features & NETIF_F_HW_VLAN_STAG_TX)
> +			sdu_len += VLAN_HLEN;

Is the device adding the same VLAN tag twice if the proto is 8021AD?
It looks like it from the code, but how every strange..

In any case, it doesn't look like the driver is doing anything with 
the NETIF_F_HW_VLAN_* flags right? stmmac_vlan_insert() works purely
off of vlan proto. So I think we should do the same thing here?

> +	}
> +
> +	if (priv->est && priv->est->enable &&
> +	    priv->est->max_sdu[queue] &&
> +	    sdu_len > priv->est->max_sdu[queue]) {
> +		priv->xstats.max_sdu_txq_drop[queue]++;
> +		goto max_sdu_err;
> +	}
> +
>  	entry = tx_q->cur_tx;
>  	first_entry = entry;
>  	WARN_ON(tx_q->tx_skbuff[first_entry]);
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
