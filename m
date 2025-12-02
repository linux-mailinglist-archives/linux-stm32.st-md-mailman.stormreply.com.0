Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7623AC9CA76
	for <lists+linux-stm32@lfdr.de>; Tue, 02 Dec 2025 19:34:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22BF3C58D7A;
	Tue,  2 Dec 2025 18:34:57 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84D40C35E2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Dec 2025 18:34:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 33EF540A01;
 Tue,  2 Dec 2025 18:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B28C4CEF1;
 Tue,  2 Dec 2025 18:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764700494;
 bh=Cu6psR00lGqDPUq9cuj2S9rijvgdPxkKstnZaesz5SM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YWPr7HSqlXslcAroHEVvdFJme2us/ctcCU+grKqfbvrZ+U9wGbwILna8HFMawLom/
 qjesvq7unUgojXZXN/dZGr2KPSBx7FtJTX9iOdnrS0OdTQj6tb6ScxVr3qIdGQOqdM
 CzNOJ9FY4GhEWL+iNEEINFEqwFiCqMUApkpugMau6ZbWuPDTIfJPhZnWt7TfIlXjig
 V4H5grinH/K3oBuCPWqIADjiz13w+1anVhG3DNUnrz9Qvc9Z5IrG/J+y1t654YZnrI
 DqcVHhY1w2p69c6Euw0IUKKTsXodz4O4DaAsGe8kiRUvgO+SYMv4lLtBcCKymp9wrm
 TtM4OLx09R6Uw==
Date: Tue, 2 Dec 2025 10:34:52 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: 2694439648@qq.com
Message-ID: <20251202103452.0d2df13d@kernel.org>
In-Reply-To: <tencent_4A0CBC92B9B22C699AC2890E139565FCB306@qq.com>
References: <tencent_4A0CBC92B9B22C699AC2890E139565FCB306@qq.com>
MIME-Version: 1.0
Cc: hailong.fan@siengine.com, inux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: Modify the judgment
 condition of "tx_avail" from 1 to 2
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

On Tue,  2 Dec 2025 15:43:59 +0800 2694439648@qq.com wrote:
> From: "hailong.fan" <hailong.fan@siengine.com>
> 
>     Under certain conditions, a WARN_ON will be triggered
>     if avail equals 1.
> 
>     For example, when a VLAN packet is to send,
>     stmmac_vlan_insert consumes one unit of space,
>     and the data itself consumes another.
>     actually requiring 2 units of space in total.
> 
>     ---
>     V0-V1:
>        1. Stop their queues earlier
>     V2-V1:
>        1. add fixes tag
>        2. Add stmmac_extra_space to count the additional required space

Why is the commit message indented ? Please looks around the mailing
list and try to follow the format others are using. Or read the
documentation. Either of the two will do.
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#changes-requested

> Fixes: 30d932279dc2 ("net: stmmac: Add support for VLAN Insertion Offload")
> Signed-off-by: hailong.fan <hailong.fan@siengine.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 7b90ecd3a..9a665a3b2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4476,6 +4476,15 @@ static bool stmmac_has_ip_ethertype(struct sk_buff *skb)
>  		(proto == htons(ETH_P_IP) || proto == htons(ETH_P_IPV6));
>  }
>  
> +static inline int stmmac_extra_space(struct stmmac_priv *priv,
> +				     struct sk_buff *skb)
> +{
> +	if (!priv->dma_cap.vlins || !skb_vlan_tag_present(skb))
> +		return 0;
> +
> +	return 1;
> +}
> +
>  /**
>   *  stmmac_xmit - Tx entry point of the driver
>   *  @skb : the socket buffer
> @@ -4529,7 +4538,8 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
>  		}
>  	}
>  
> -	if (unlikely(stmmac_tx_avail(priv, queue) < nfrags + 1)) {
> +	if (unlikely(stmmac_tx_avail(priv, queue) <
> +		nfrags + 1 + stmmac_extra_space(priv, skb))) {

extra logic is likely not worth the single descriptor saving, can you
use the same + 2 as in the condition for stopping the queue, please?

>  		if (!netif_tx_queue_stopped(netdev_get_tx_queue(dev, queue))) {
>  			netif_tx_stop_queue(netdev_get_tx_queue(priv->dev,
>  								queue));
> @@ -4675,7 +4685,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
>  		print_pkt(skb->data, skb->len);
>  	}
>  
> -	if (unlikely(stmmac_tx_avail(priv, queue) <= (MAX_SKB_FRAGS + 1))) {
> +	if (unlikely(stmmac_tx_avail(priv, queue) <= (MAX_SKB_FRAGS + 2))) {
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
