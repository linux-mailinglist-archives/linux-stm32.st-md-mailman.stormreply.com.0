Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0FA33C714
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Mar 2021 20:51:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E876C57B55;
	Mon, 15 Mar 2021 19:51:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97C95C56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 19:51:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 402C164DF0;
 Mon, 15 Mar 2021 19:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615837861;
 bh=hoqDuT8A2C6aokhdkoqKymuqaw9D6ovqyc/1aLIzWsU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=awdBpqE4rXysetx+T2AvN+kKG81fd+KADq8inTrTuBK8y//1zh4Tt10BkcUZwd3WS
 ciCDS1YCOR3MzlI7OPCuhqxHSecxHgkAXTel1IG9/Fx4YY7WWdQLbsJJ+qdm9IJ0gC
 7d0QUQYupcOnzUgEcrDfQtLktemjrC4api39oTk77qyREI9RoXhaEjcZJFmjX9yb9d
 LfSQyhMQeDLXmfp0dQWfv8OK7UxVBpBJ6vgTggWRjQqk7Z7eMa9Ho0cmJk8sMrkfiy
 t5FbYRj6oGquzAI6r3go6cDi9lh7bgFf1uqZXGygWNPmNv1yWN8qYdn3TlnZH2T0Ex
 dyTRzGxwm/+9w==
Date: Mon, 15 Mar 2021 12:50:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Message-ID: <20210315125059.32fde79a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210315064448.16391-2-boon.leong.ong@intel.com>
References: <20210315064448.16391-1-boon.leong.ong@intel.com>
 <20210315064448.16391-2-boon.leong.ong@intel.com>
MIME-Version: 1.0
Cc: Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S .
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: add per-queue
 TX & RX coalesce ethtool support
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

On Mon, 15 Mar 2021 14:44:48 +0800 Ong Boon Leong wrote:
> Extending the driver to support per-queue RX and TX coalesce settings in
> order to support below commands:
> 
> To show per-queue coalesce setting:-
>  $ ethtool --per-queue <DEVNAME> queue_mask <MASK> --show-coalesce
> 
> To set per-queue coalesce setting:-
>  $ ethtool --per-queue <DEVNAME> queue_mask <MASK> --coalesce \
>      [rx-usecs N] [rx-frames M] [tx-usecs P] [tx-frames Q]
> 
> Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>

> -static int stmmac_get_coalesce(struct net_device *dev,
> -			       struct ethtool_coalesce *ec)
> +static int __stmmac_get_coalesce(struct net_device *dev,
> +				 struct ethtool_coalesce *ec,
> +				 int queue)
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
> +	u32 max_cnt;
> +	u32 rx_cnt;
> +	u32 tx_cnt;
>  
> -	ec->tx_coalesce_usecs = priv->tx_coal_timer;
> -	ec->tx_max_coalesced_frames = priv->tx_coal_frames;
> +	rx_cnt = priv->plat->rx_queues_to_use;
> +	tx_cnt = priv->plat->tx_queues_to_use;
> +	max_cnt = max(rx_cnt, tx_cnt);
>  
> -	if (priv->use_riwt) {
> -		ec->rx_max_coalesced_frames = priv->rx_coal_frames;
> -		ec->rx_coalesce_usecs = stmmac_riwt2usec(priv->rx_riwt, priv);
> +	if (queue < 0)
> +		queue = 0;
> +	else if (queue >= max_cnt)
> +		return -EINVAL;
> +
> +	if (queue < tx_cnt) {
> +		ec->tx_coalesce_usecs = priv->tx_coal_timer[queue];
> +		ec->tx_max_coalesced_frames = priv->tx_coal_frames[queue];
> +	} else {
> +		ec->tx_coalesce_usecs = -1;
> +		ec->tx_max_coalesced_frames = -1;
> +	}
> +
> +	if (priv->use_riwt && queue < rx_cnt) {
> +		ec->rx_max_coalesced_frames = priv->rx_coal_frames[queue];
> +		ec->rx_coalesce_usecs = stmmac_riwt2usec(priv->rx_riwt[queue],
> +							 priv);
> +	} else {
> +		ec->rx_max_coalesced_frames = -1;
> +		ec->rx_coalesce_usecs = -1;

Why the use of negative values? why not leave them as 0?

>  	}
>  
>  	return 0;
>  }
>  
> -static int stmmac_set_coalesce(struct net_device *dev,
> +static int stmmac_get_coalesce(struct net_device *dev,
>  			       struct ethtool_coalesce *ec)
> +{
> +	return __stmmac_get_coalesce(dev, ec, -1);
> +}
> +
> +static int stmmac_get_per_queue_coalesce(struct net_device *dev, u32 queue,
> +					 struct ethtool_coalesce *ec)
> +{
> +	return __stmmac_get_coalesce(dev, ec, queue);
> +}
> +
> +static int __stmmac_set_coalesce(struct net_device *dev,
> +				 struct ethtool_coalesce *ec,
> +				 int queue)
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
> -	u32 rx_cnt = priv->plat->rx_queues_to_use;
> +	bool all_queues = false;
>  	unsigned int rx_riwt;
> +	u32 max_cnt;
> +	u32 rx_cnt;
> +	u32 tx_cnt;
> +
> +	rx_cnt = priv->plat->rx_queues_to_use;
> +	tx_cnt = priv->plat->tx_queues_to_use;
> +	max_cnt = max(rx_cnt, tx_cnt);
> +
> +	if (queue < 0)
> +		all_queues = true;
> +	else if (queue >= max_cnt)
> +		return -EINVAL;
> +
> +	/* Check not supported parameters  */
> +	if (ec->rx_coalesce_usecs_irq ||
> +	    ec->rx_max_coalesced_frames_irq || ec->tx_coalesce_usecs_irq ||
> +	    ec->use_adaptive_rx_coalesce || ec->use_adaptive_tx_coalesce ||
> +	    ec->pkt_rate_low || ec->rx_coalesce_usecs_low ||
> +	    ec->rx_max_coalesced_frames_low || ec->tx_coalesce_usecs_high ||
> +	    ec->tx_max_coalesced_frames_low || ec->pkt_rate_high ||
> +	    ec->tx_coalesce_usecs_low || ec->rx_coalesce_usecs_high ||
> +	    ec->rx_max_coalesced_frames_high ||
> +	    ec->tx_max_coalesced_frames_irq ||
> +	    ec->stats_block_coalesce_usecs ||
> +	    ec->tx_max_coalesced_frames_high || ec->rate_sample_interval)
> +		return -EOPNOTSUPP;

This shouldn't be needed now that supporter types are expressed in 
dev->ethtool_ops->supported_coalesce_params, no?

>  	if (priv->use_riwt && (ec->rx_coalesce_usecs > 0)) {
>  		rx_riwt = stmmac_usec2riwt(ec->rx_coalesce_usecs, priv);
> @@ -785,8 +846,23 @@ static int stmmac_set_coalesce(struct net_device *dev,
>  		if ((rx_riwt > MAX_DMA_RIWT) || (rx_riwt < MIN_DMA_RIWT))
>  			return -EINVAL;
>  
> -		priv->rx_riwt = rx_riwt;
> -		stmmac_rx_watchdog(priv, priv->ioaddr, priv->rx_riwt, rx_cnt);
> +		if (all_queues) {
> +			int i;
> +
> +			for (i = 0; i < rx_cnt; i++) {
> +				priv->rx_riwt[i] = rx_riwt;
> +				stmmac_rx_watchdog(priv, priv->ioaddr,
> +						   rx_riwt, i);
> +				priv->rx_coal_frames[i] =
> +					ec->rx_max_coalesced_frames;
> +			}
> +		} else if (queue < rx_cnt) {
> +			priv->rx_riwt[queue] = rx_riwt;
> +			stmmac_rx_watchdog(priv, priv->ioaddr,
> +					   rx_riwt, queue);
> +			priv->rx_coal_frames[queue] =
> +				ec->rx_max_coalesced_frames;
> +		}
>  	}
>  
>  	if ((ec->tx_coalesce_usecs == 0) &&
> @@ -797,13 +873,37 @@ static int stmmac_set_coalesce(struct net_device *dev,
>  	    (ec->tx_max_coalesced_frames > STMMAC_TX_MAX_FRAMES))
>  		return -EINVAL;
>  
> -	/* Only copy relevant parameters, ignore all others. */
> -	priv->tx_coal_frames = ec->tx_max_coalesced_frames;
> -	priv->tx_coal_timer = ec->tx_coalesce_usecs;
> -	priv->rx_coal_frames = ec->rx_max_coalesced_frames;
> +	if (all_queues) {
> +		int i;
> +
> +		for (i = 0; i < tx_cnt; i++) {
> +			priv->tx_coal_frames[i] =
> +				ec->tx_max_coalesced_frames;
> +			priv->tx_coal_timer[i] =
> +				ec->tx_coalesce_usecs;
> +		}
> +	} else if (queue < tx_cnt) {
> +		priv->tx_coal_frames[queue] =
> +			ec->tx_max_coalesced_frames;
> +		priv->tx_coal_timer[queue] =
> +			ec->tx_coalesce_usecs;
> +	}
> +
>  	return 0;
>  }
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
