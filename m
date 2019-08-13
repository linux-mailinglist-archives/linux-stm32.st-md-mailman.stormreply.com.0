Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 320648C352
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Aug 2019 23:11:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE2EBC35E02;
	Tue, 13 Aug 2019 21:11:35 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A182C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2019 21:11:34 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id z4so107960790qtc.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2019 14:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=5DO9+iiMXCnTxtn8kwS2obogFdAM5hjWuU5VPWQaLfs=;
 b=tYcrzUhl5ircfJr1bs2q5kQPK6/jwLBoImHl3kWYeFY+3XOA3Qzyzo+gXYlxbVv7Kj
 NGuEgYU1tEffEOG8uffyJCThrNLl99RjrMCoCWsSaWypdc3X/O3d6MOwh+Sk68+k6PbS
 aXEkHsZChosQeQeFomYIwBbKjBpvk7zYct5DIQPOMKPdtHJWqWnGlEfrs+YNxJUw6Xgh
 KJiuLLLOlst+61lwP+Xvr2KP0lF27LBAzbEBn8iKz7TNRMST98M+KCiUFDzKVnwaWUQe
 Slabew/eXCQCTjQnUK/FwU7QgK2dxLBJioRP90JCriKk+W6ewp78wkVy3goYii7NKyy6
 OEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=5DO9+iiMXCnTxtn8kwS2obogFdAM5hjWuU5VPWQaLfs=;
 b=pN5VCWhbcoaG1j/NPSJBwchNchltc7mh/oPx7mduYpx3xked0+3e/FJH4nLoVKtthG
 6xdUuciAYAA/caKBniDe1oDK/y0NaKrYP6yt9VE+pli3sE4cPnIshNmveXzGLM9y8TMZ
 dLbldRa0DJvFspmJATGcTdByw6jfUQxvUrU7po3uiG5gEdE/DYVUluiu0rOa8DJ9UNMh
 EsXMYs9zLto024oEbIriKBC9YP04QDONg7btpEMm1P/MbouSKUvRWObaN27TKj8uGohV
 6feXMYnjxbIRab+h1k1NkHUepsiW6aecKGlp7SgpGgH2p1b4HZQhIo/yTbjBTzBjCsGw
 q7vQ==
X-Gm-Message-State: APjAAAWKE7ZQbfkTjEIWE89oz9chUFF1NWUv3a64K1n9TheIeHSEqEQm
 y/Y8WFIe5cmoU6yIWrFkpyyAbw==
X-Google-Smtp-Source: APXvYqwXnH6BSNDMXssyIYCybM9bhgzE9wbjMU4CueLHzjlps+cYdJzD+gHjkEYo2NVLUhdkdWiBFw==
X-Received: by 2002:a05:6214:110c:: with SMTP id
 e12mr198694qvs.126.1565730693427; 
 Tue, 13 Aug 2019 14:11:33 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id q73sm35531390qke.90.2019.08.13.14.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 14:11:33 -0700 (PDT)
Date: Tue, 13 Aug 2019 14:11:23 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20190813141123.1df0daf2@cakuba.netronome.com>
In-Reply-To: <342007d6ac2b44db03d113e7e8bf0310caa77ea0.1565602974.git.joabreu@synopsys.com>
References: <cover.1565602974.git.joabreu@synopsys.com>
 <342007d6ac2b44db03d113e7e8bf0310caa77ea0.1565602974.git.joabreu@synopsys.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 02/12] net: stmmac: Prepare to
 add Split Header support
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

On Mon, 12 Aug 2019 11:44:01 +0200, Jose Abreu wrote:
> In order to add Split Header support, stmmac_rx() needs to take into
> account that packet may be split accross multiple descriptors.
> 
> Refactor the logic of this function in order to support this scenario.
> 
> Signed-off-by: Jose Abreu <joabreu@synopsys.com>
> 
> ---
> Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Jose Abreu <joabreu@synopsys.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: netdev@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   6 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 149 +++++++++++++---------
>  2 files changed, 95 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index 80276587048a..56158e1448ac 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -74,6 +74,12 @@ struct stmmac_rx_queue {
>  	u32 rx_zeroc_thresh;
>  	dma_addr_t dma_rx_phy;
>  	u32 rx_tail_addr;
> +	unsigned int state_saved;
> +	struct {
> +		struct sk_buff *skb;
> +		unsigned int len;
> +		unsigned int error;
> +	} state;
>  };
>  
>  struct stmmac_channel {
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index b2e5f4ecd551..a093eb4ec275 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3353,9 +3353,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  {
>  	struct stmmac_rx_queue *rx_q = &priv->rx_queue[queue];
>  	struct stmmac_channel *ch = &priv->channel[queue];
> +	unsigned int count = 0, error = 0, len = 0;
> +	int status = 0, coe = priv->hw->rx_csum;
>  	unsigned int next_entry = rx_q->cur_rx;
> -	int coe = priv->hw->rx_csum;
> -	unsigned int count = 0;
> +	struct sk_buff *skb = NULL;
>  
>  	if (netif_msg_rx_status(priv)) {
>  		void *rx_head;
> @@ -3369,9 +3370,27 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  		stmmac_display_ring(priv, rx_head, DMA_RX_SIZE, true);
>  	}
>  	while (count < limit) {
> +		enum pkt_hash_types hash_type;
>  		struct stmmac_rx_buffer *buf;
> +		unsigned int prev_len = 0;
>  		struct dma_desc *np, *p;
> -		int entry, status;
> +		int entry;
> +		u32 hash;
> +
> +		if (!count && rx_q->state_saved) {
> +			skb = rx_q->state.skb;
> +			error = rx_q->state.error;
> +			len = rx_q->state.len;
> +		} else {
> +			rx_q->state_saved = false;
> +			skb = NULL;
> +			error = 0;
> +			len = 0;
> +		}
> +
> +read_again:
> +		if (count >= limit)
> +			break;

Is this stopping the NAPI poll once @limit descriptors were seen?
It should probably be okay to ignore the limit until you get a full
frame? I'd think it'd be best to finish up the frame while the state 
is hot in the CPU cache.. WDYT?

>  		entry = next_entry;
>  		buf = &rx_q->buf_pool[entry];
> @@ -3407,28 +3426,24 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  			page_pool_recycle_direct(rx_q->page_pool, buf->page);
>  			priv->dev->stats.rx_errors++;
>  			buf->page = NULL;
> +			error = 1;
> +		}
> +
> +		if (unlikely(error & (status & rx_not_ls)))

Looks suspicious - sure this is supposed to be error & (status & bla)
and not error && ... ?

> +			goto read_again;
> +		if (unlikely(error)) {
> +			if (skb)
> +				dev_kfree_skb(skb);
> +			continue;
> +		}
> +
> +		/* Buffer is good. Go on. */
> +
> +		if (likely(status & rx_not_ls)) {
> +			len += priv->dma_buf_sz;
>  		} else {
> -			enum pkt_hash_types hash_type;
> -			struct sk_buff *skb;
> -			unsigned int des;
> -			int frame_len;
> -			u32 hash;
> -
> -			stmmac_get_desc_addr(priv, p, &des);
> -			frame_len = stmmac_get_rx_frame_len(priv, p, coe);
> -
> -			/*  If frame length is greater than skb buffer size
> -			 *  (preallocated during init) then the packet is
> -			 *  ignored
> -			 */
> -			if (frame_len > priv->dma_buf_sz) {
> -				if (net_ratelimit())
> -					netdev_err(priv->dev,
> -						   "len %d larger than size (%d)\n",
> -						   frame_len, priv->dma_buf_sz);
> -				priv->dev->stats.rx_length_errors++;
> -				continue;
> -			}
> +			prev_len = len;
> +			len = stmmac_get_rx_frame_len(priv, p, coe);
>  
>  			/* ACS is set; GMAC core strips PAD/FCS for IEEE 802.3
>  			 * Type frames (LLC/LLC-SNAP)
> @@ -3439,57 +3454,71 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  			 */
>  			if (unlikely(priv->synopsys_id >= DWMAC_CORE_4_00) ||
>  			    unlikely(status != llc_snap))
> -				frame_len -= ETH_FCS_LEN;
> -
> -			if (netif_msg_rx_status(priv)) {
> -				netdev_dbg(priv->dev, "\tdesc: %p [entry %d] buff=0x%x\n",
> -					   p, entry, des);
> -				netdev_dbg(priv->dev, "frame size %d, COE: %d\n",
> -					   frame_len, status);
> -			}
> +				len -= ETH_FCS_LEN;
> +		}
>  
> -			skb = netdev_alloc_skb_ip_align(priv->dev, frame_len);
> -			if (unlikely(!skb)) {
> +		if (!skb) {
> +			skb = netdev_alloc_skb_ip_align(priv->dev, len);

Since you're in NAPI call perhaps something like napi_alloc_skb() could
speed things up a little? But please also see below..

> +			if (!skb) {
>  				priv->dev->stats.rx_dropped++;
>  				continue;
>  			}
>  
> -			dma_sync_single_for_cpu(priv->device, buf->addr,
> -						frame_len, DMA_FROM_DEVICE);
> +			dma_sync_single_for_cpu(priv->device, buf->addr, len,
> +						DMA_FROM_DEVICE);
>  			skb_copy_to_linear_data(skb, page_address(buf->page),
> -						frame_len);
> -			skb_put(skb, frame_len);
> +						len);
> +			skb_put(skb, len);
>  
> -			if (netif_msg_pktdata(priv)) {
> -				netdev_dbg(priv->dev, "frame received (%dbytes)",
> -					   frame_len);
> -				print_pkt(skb->data, frame_len);
> -			}
> +			/* Data payload copied into SKB, page ready for recycle */
> +			page_pool_recycle_direct(rx_q->page_pool, buf->page);
> +			buf->page = NULL;
> +		} else {
> +			unsigned int buf_len = len - prev_len;
>  
> -			stmmac_get_rx_hwtstamp(priv, p, np, skb);
> +			if (likely(status & rx_not_ls))
> +				buf_len = priv->dma_buf_sz;
>  
> -			stmmac_rx_vlan(priv->dev, skb);
> +			dma_sync_single_for_cpu(priv->device, buf->addr,
> +						buf_len, DMA_FROM_DEVICE);
> +			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
> +					buf->page, 0, buf_len,
> +					priv->dma_buf_sz);
>  
> -			skb->protocol = eth_type_trans(skb, priv->dev);
> +			/* Data payload appended into SKB */
> +			page_pool_release_page(rx_q->page_pool, buf->page);
> +			buf->page = NULL;
> +		}
>  
> -			if (unlikely(!coe))
> -				skb_checksum_none_assert(skb);
> -			else
> -				skb->ip_summed = CHECKSUM_UNNECESSARY;
> +		if (likely(status & rx_not_ls))
> +			goto read_again;
>  
> -			if (!stmmac_get_rx_hash(priv, p, &hash, &hash_type))
> -				skb_set_hash(skb, hash, hash_type);
> +		/* Got entire packet into SKB. Finish it. */
>  
> -			skb_record_rx_queue(skb, queue);
> -			napi_gro_receive(&ch->rx_napi, skb);
> +		stmmac_get_rx_hwtstamp(priv, p, np, skb);
> +		stmmac_rx_vlan(priv->dev, skb);
> +		skb->protocol = eth_type_trans(skb, priv->dev);
>  
> -			/* Data payload copied into SKB, page ready for recycle */
> -			page_pool_recycle_direct(rx_q->page_pool, buf->page);
> -			buf->page = NULL;
> +		if (unlikely(!coe))
> +			skb_checksum_none_assert(skb);
> +		else
> +			skb->ip_summed = CHECKSUM_UNNECESSARY;
>  
> -			priv->dev->stats.rx_packets++;
> -			priv->dev->stats.rx_bytes += frame_len;
> -		}
> +		if (!stmmac_get_rx_hash(priv, p, &hash, &hash_type))
> +			skb_set_hash(skb, hash, hash_type);
> +
> +		skb_record_rx_queue(skb, queue);
> +		napi_gro_receive(&ch->rx_napi, skb);

Did you look into using napi_gro_frags() family of APIs?
I think Eric said those are more efficient from GRO perspective..

> +		priv->dev->stats.rx_packets++;
> +		priv->dev->stats.rx_bytes += len;
> +	}
> +
> +	if (status & rx_not_ls) {
> +		rx_q->state_saved = true;
> +		rx_q->state.skb = skb;
> +		rx_q->state.error = error;
> +		rx_q->state.len = len;
>  	}
>  
>  	stmmac_rx_refill(priv, queue);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
