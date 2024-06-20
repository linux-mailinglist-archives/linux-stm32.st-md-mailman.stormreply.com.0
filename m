Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2C09103AD
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 14:07:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC70FC6DD6D;
	Thu, 20 Jun 2024 12:07:09 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0BB4C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 12:07:02 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52c7f7fdd24so1012963e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 05:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718885222; x=1719490022;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bdJE30S2Vadyj3WLYb1jiaxf0LmQe94InZQcowugJGw=;
 b=Tm2OItbzclGv3kQPAGhHMG+aWgBM+xJXA0+v+NgfiboS4b1kpe+CcisSN5TYeuZUSY
 joDvwKo5Irklp6pFJmF4Y1vVVo4xD+qcx7HYgEzEN2SnzQCnYTsW/0ioVBgNIuCrNsj0
 IbzfxhvDQgkBvh0GAsEzImpJZGxh0KmMFmFB+fGHXDDC856VBwTm05MA1zcczepd8XA0
 559CZp2A6mW+JnxGtJMspvQY50jzqD6qJOqKaNczlOmAfd/68Tcd5wqqLu2e2+WRadSv
 TUvM8LrWeZqYu2r3H1nM7Sxk8PMtLqzZ1+KyDzubEwK478bfYFWS1oN0fUI658P5EjGC
 aj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718885222; x=1719490022;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bdJE30S2Vadyj3WLYb1jiaxf0LmQe94InZQcowugJGw=;
 b=vtp6mWEwlduzlPmbXiUD823Cv5nlp/odmscCom0pdCdATp363tircyQzndFysGEReF
 ocpyGIftzwG86bQRPcFYE1AnyTSXrB8ghDI5FwEjWPOA/VVaXUCqynF6ns60VNWTXw6M
 tB6FPhPr8i6N+xDbKDEqBKLuGWkP5qbHRg2iZo4uAKoi9R07IOQ5vw5STf75ePuuxAqb
 bUorhmWhgDDQVqZsjUXGgqAFQucCfzI/EYYogC8G7FiUyT14lWMv9pvusKNJdmDYSjG5
 bC3tEsdAnF/3xq0Y5uYUet4rasrFCurxympkizFvYpOVDrvbsBYzQfO87EdnvGFpCoCt
 gZWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI1WHX1YvPRPeJn/Aqk6AX8IoI04yYFduwk8Hvg1vXObqzUoI41xuKlCsxhZKPF5nmYgmkZK2VJkkfronOmzrLF72TKxxMl7N/cp2jrispiB6MRPKASh4g
X-Gm-Message-State: AOJu0YyBuC0PzmxMzXW8PvAaJYSanBN+7weH6CBHedqiR7rz9Eg+tiUN
 7bF+41Ri+zjgHBOXNnbx1/kGOw9FyNMdtz23poZ2+sEAARRD2B0Z
X-Google-Smtp-Source: AGHT+IH7EA7ojjgOEAN9QY2Sip1uTsB7157OhZwJSe0fvPLVID47wVVFWRpzV0KqBSbzftOZME6SoQ==
X-Received: by 2002:a05:6512:3b8b:b0:52c:ce4a:3a8a with SMTP id
 2adb3069b0e04-52cce4a3b5emr2366093e87.1.1718885221604; 
 Thu, 20 Jun 2024 05:07:01 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2825863sm2016905e87.55.2024.06.20.05.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 05:07:01 -0700 (PDT)
Date: Thu, 20 Jun 2024 15:06:57 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <e3yzigcfbbkowias54nijvejc36hbcvfgjgbodycka3kfoqqek@46gktho2hwwt>
References: <20240620085200.583709-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240620085200.583709-1-0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: xgmac: increase
 length limit of descriptor ring
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

Hi Furong

On Thu, Jun 20, 2024 at 04:52:00PM +0800, Furong Xu wrote:
> DWXGMAC CORE supports a ring length of 65536 descriptors, bump max length
> from 1024 to 65536

What XGMAC IP-core version are you talking about? The DW XGMAC
IP-core databooks I have define the upper limit much lesser than that.

Do you understand that specifying 65K descriptors will cause a huge
amount of memory consumed, right? Each descriptor is equipped with at
least 1-page buffer. If QoS/XGMAC SPH is enabled then each descriptor
is equipped with a second buffer. So 65K-descriptor will cause
allocation of at least 65536 * (4 * 4) bytes + 65536 * PAGE_SIZE
bytes. So it's ~256MB for the smallest possible 4K-pages. Not to
mention that there can be more than one queue, two buffers assigned to
each descriptor and more than a single page allocated for each buffer
in case of jumbos. All of that will multiply the basic ~256MB memory
consumption.

Taking all of the above into account, what is the practical reason of
having so many descriptors allocated? Are you afraid your CPU won't
keep up with some heavy incoming traffic?

Just a note about GMACs. The only GMAC having the ring-length limited
is DW QoS Eth (v4.x/v5.x). It may have up to 1K descriptors in the
ring. DW GMAC v3.73a doesn't have the descriptors array length constraint.
The last descriptor is marked by a special flag TDESC0.21 and
RDESC1.15, after meeting which the DMA-engine gets back to the first
descriptor in the ring.

-Serge(y)

> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  2 ++
>  .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 24 +++++++++++++++----
>  2 files changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> index 6a2c7d22df1e..264f4f876c74 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> @@ -11,6 +11,8 @@
>  
>  /* Misc */
>  #define XGMAC_JUMBO_LEN			16368
> +#define XGMAC_DMA_MAX_TX_SIZE		65536
> +#define XGMAC_DMA_MAX_RX_SIZE		65536
>  
>  /* MAC Registers */
>  #define XGMAC_TX_CONFIG			0x00000000
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index 18468c0228f0..3ae465c5a712 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -491,9 +491,16 @@ static void stmmac_get_ringparam(struct net_device *netdev,
>  				 struct netlink_ext_ack *extack)
>  {
>  	struct stmmac_priv *priv = netdev_priv(netdev);

> +	u32 dma_max_rx_size = DMA_MAX_RX_SIZE;
> +	u32 dma_max_tx_size = DMA_MAX_TX_SIZE;
>  
> -	ring->rx_max_pending = DMA_MAX_RX_SIZE;
> -	ring->tx_max_pending = DMA_MAX_TX_SIZE;
> +	if (priv->plat->has_xgmac) {
> +		dma_max_rx_size = XGMAC_DMA_MAX_RX_SIZE;
> +		dma_max_tx_size = XGMAC_DMA_MAX_TX_SIZE;
> +	}
> +
> +	ring->rx_max_pending = dma_max_rx_size;
> +	ring->tx_max_pending = dma_max_tx_size;

Do you understand the consequence of this change, right?
De

>  	ring->rx_pending = priv->dma_conf.dma_rx_size;
>  	ring->tx_pending = priv->dma_conf.dma_tx_size;
>  }
> @@ -503,12 +510,21 @@ static int stmmac_set_ringparam(struct net_device *netdev,
>  				struct kernel_ethtool_ringparam *kernel_ring,
>  				struct netlink_ext_ack *extack)
>  {
> +	struct stmmac_priv *priv = netdev_priv(netdev);
> +	u32 dma_max_rx_size = DMA_MAX_RX_SIZE;
> +	u32 dma_max_tx_size = DMA_MAX_TX_SIZE;
> +
> +	if (priv->plat->has_xgmac) {
> +		dma_max_rx_size = XGMAC_DMA_MAX_RX_SIZE;
> +		dma_max_tx_size = XGMAC_DMA_MAX_TX_SIZE;
> +	}
> +
>  	if (ring->rx_mini_pending || ring->rx_jumbo_pending ||
>  	    ring->rx_pending < DMA_MIN_RX_SIZE ||
> -	    ring->rx_pending > DMA_MAX_RX_SIZE ||
> +	    ring->rx_pending > dma_max_rx_size ||
>  	    !is_power_of_2(ring->rx_pending) ||
>  	    ring->tx_pending < DMA_MIN_TX_SIZE ||
> -	    ring->tx_pending > DMA_MAX_TX_SIZE ||
> +	    ring->tx_pending > dma_max_tx_size ||
>  	    !is_power_of_2(ring->tx_pending))
>  		return -EINVAL;
>  
> -- 
> 2.34.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
