Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E04096ABF5
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2024 00:17:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10499C78013;
	Tue,  3 Sep 2024 22:17:27 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 564F7C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Sep 2024 22:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725401845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uX67JJ48/X+mbq8S3u6zeSeVmMvnaUsc25ToyEvfFRg=;
 b=J7PWBKaXoEKk0YdzRbzrmEO50mBiHT4GBekrkFtALdW5rDKSqdyCzobhVDBZCudn0oHlEj
 wtrIRxQDZARuipjjedL7ncFBbN9+86+P+QdHa7bW1cmWqjL6Z92CQZmw26pfDXTSmHxdrC
 B/wWwP6xLKCy5UknXqCxZyvNZzswW38=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-dv1-Pfx9OryaQD0yV_fK3A-1; Tue, 03 Sep 2024 18:17:22 -0400
X-MC-Unique: dv1-Pfx9OryaQD0yV_fK3A-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-45680f90e56so89223351cf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Sep 2024 15:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725401842; x=1726006642;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uX67JJ48/X+mbq8S3u6zeSeVmMvnaUsc25ToyEvfFRg=;
 b=vejT+34qm6O4V47XEI4d5QTm7D5tG/84jK3x0VdUamRevPAyz4aX0SS5x8hoKsTOC/
 +UIiV4LvVQoiXId1lHrNxid2HQEben1LUN8zQchqSnFcJgFFyaGpbwSbA7wXqSibvyCU
 qEIVw0ajIfmXJOQG6YWkdblq+H5spISKjC928k67VG4LUzicA5sXNWwfaUBqCEBAhSS6
 zfK/Q/AG94WshzSSJjze/E3U1t8SpvlRy7jmvdsX7di8uXfofwhjmdP6zd9FTdmHlxuU
 BhNB6Fh3FHzKupRxaMwUp90gAJEtnef42RD3OZDEnEdCzip5/5pkE6iioFhl7I/FlXN8
 Ztgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8SeKFvUaNahbnzMkSvuddUPNGIyjPY3SCY48DCpZKIKoYUQo+tQ6M1B3wiVAxfW6gG7GmF4iiW5jzYg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyEVIhS6hepMVJGkfnFo7B64rbro+69JHChcXYAgWziqXs1dT+g
 VRy4qaf0ulFInU35GjigBrzMnhD/KxHMylVmYY/emczF+Je6KuoFWab6w092qxPQUzJFiBycmlD
 jogjbXS1nk9HOFAEjJ2p6zpr5oE1p0xVDpEUjWg3QCKO8c3+prwClMTBwwovgU2j2o8gSaJTxS9
 6N0w==
X-Received: by 2002:a05:622a:4892:b0:456:80dd:2b74 with SMTP id
 d75a77b69052e-456f166a883mr180080171cf.2.1725401841793; 
 Tue, 03 Sep 2024 15:17:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGF+ADqf+HvwhdXdoU9v++JYfldALmtFlgglwFanWYamzzbURjrFGiQObND/oVCHlOkCKZ8dQ==
X-Received: by 2002:a05:622a:4892:b0:456:80dd:2b74 with SMTP id
 d75a77b69052e-456f166a883mr180079751cf.2.1725401841295; 
 Tue, 03 Sep 2024 15:17:21 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-45682c8788asm54097881cf.1.2024.09.03.15.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 15:17:20 -0700 (PDT)
Date: Tue, 3 Sep 2024 17:17:18 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>
Message-ID: <yy2prsz3tjqwjwxgsrumt3qt2d62gdvjwqsti3favtfmf7m5qs@eychxx5qz25f>
References: <20240902095436.3756093-1-quic_jsuraj@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20240902095436.3756093-1-quic_jsuraj@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 kernel@quicinc.com, Jose Abreu <joabreu@synopsys.com>,
 Andy Gross <agross@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Prasad Sodagudi <psodagud@quicinc.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Stop using a single
 dma_map() for multiple descriptors
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

On Mon, Sep 02, 2024 at 03:24:36PM GMT, Suraj Jaiswal wrote:
> Currently same page address is shared
> between multiple buffer addresses and causing smmu fault for other
> descriptor if address hold by one descriptor got cleaned.
> Allocate separate buffer address for each descriptor
> for TSO path so that if one descriptor cleared it should not
> clean other descriptor address.

I think maybe you mean something like:

    Currently in the TSO case a page is mapped with dma_map_single(), and then
    the resulting dma address is referenced (and offset) by multiple
    descriptors until the whole region is programmed into the descriptors.

    This makes it possible for stmmac_tx_clean() to dma_unmap() the first of the
    already processed descriptors, while the rest are still being processed
    by the DMA engine. This leads to an iommu fault due to the DMA engine using
    unmapped memory as seen below:

    <insert splat>

    You can reproduce this easily by <reproduction steps>.

    To fix this, let's map each descriptor's memory reference individually.
    This way there's no risk of unmapping a region that's still being
    referenced by the DMA engine in a later descriptor.

That's a bit nitpicky wording wise, but your first sentence is hard
for me to follow (buffer addresses seems to mean descriptor?). I think
showing a splat and mentioning how to reproduce is always a bonus as
well.

> 
> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>

Fixes: ?

At a quick glance I think its f748be531d70 ("stmmac: support new GMAC4")

> ---
> 
> Changes since v2:
> - Fixed function description 
> - Fixed handling of return value.
> 

This is v1 as far as netdev is concerned :)

> 
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 63 ++++++++++++-------
>  1 file changed, 42 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 83b654b7a9fd..5948774c403f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4136,16 +4136,18 @@ static bool stmmac_vlan_insert(struct stmmac_priv *priv, struct sk_buff *skb,
>  /**
>   *  stmmac_tso_allocator - close entry point of the driver
>   *  @priv: driver private structure
> - *  @des: buffer start address
> + *  @addr: Contains either skb frag address or skb->data address
>   *  @total_len: total length to fill in descriptors
>   *  @last_segment: condition for the last descriptor
>   *  @queue: TX queue index
> + * @is_skb_frag: condition to check whether skb data is part of fragment or not
>   *  Description:
>   *  This function fills descriptor and request new descriptors according to
>   *  buffer length to fill
> + *  This function returns 0 on success else -ERRNO on fail
>   */
> -static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
> -				 int total_len, bool last_segment, u32 queue)
> +static int stmmac_tso_allocator(struct stmmac_priv *priv, void *addr,
> +				int total_len, bool last_segment, u32 queue, bool is_skb_frag)
>  {
>  	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
>  	struct dma_desc *desc;
> @@ -4153,6 +4155,8 @@ static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
>  	int tmp_len;
>  
>  	tmp_len = total_len;
> +	unsigned int offset = 0;
> +	unsigned char *data = addr;

Reverse xmas tree order, offset is always set below so you could just
declare it, and data really doesn't seem necessary to me vs using addr
directly.

https://docs.kernel.org/process/maintainer-netdev.html#local-variable-ordering-reverse-xmas-tree-rcs

>  
>  	while (tmp_len > 0) {
>  		dma_addr_t curr_addr;
> @@ -4161,20 +4165,44 @@ static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
>  						priv->dma_conf.dma_tx_size);
>  		WARN_ON(tx_q->tx_skbuff[tx_q->cur_tx]);
>  
> +		buff_size = tmp_len >= TSO_MAX_BUFF_SIZE ? TSO_MAX_BUFF_SIZE : tmp_len;
> +
>  		if (tx_q->tbs & STMMAC_TBS_AVAIL)
>  			desc = &tx_q->dma_entx[tx_q->cur_tx].basic;
>  		else
>  			desc = &tx_q->dma_tx[tx_q->cur_tx];
>  
> -		curr_addr = des + (total_len - tmp_len);
> +		offset = total_len - tmp_len;
> +		if (!is_skb_frag) {
> +			curr_addr = dma_map_single(priv->device, data + offset, buff_size,
> +						   DMA_TO_DEVICE);

Instead of defining "data" above, can't you just use "addr" directly here?

> +
> +			if (dma_mapping_error(priv->device, curr_addr))
> +				return -ENOMEM;
> +
> +			tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = curr_addr;
> +			tx_q->tx_skbuff_dma[tx_q->cur_tx].len = buff_size;
> +			tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page = false;
> +			tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
> +		} else {
> +			curr_addr = skb_frag_dma_map(priv->device, addr, offset,
> +						     buff_size,
> +						     DMA_TO_DEVICE);
> +
> +			if (dma_mapping_error(priv->device, curr_addr))
> +				return -ENOMEM;
> +
> +			tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = curr_addr;
> +			tx_q->tx_skbuff_dma[tx_q->cur_tx].len = buff_size;
> +			tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page = true;
> +			tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
> +		}
> +
>  		if (priv->dma_cap.addr64 <= 32)
>  			desc->des0 = cpu_to_le32(curr_addr);
>  		else
>  			stmmac_set_desc_addr(priv, desc, curr_addr);
>  
> -		buff_size = tmp_len >= TSO_MAX_BUFF_SIZE ?
> -			    TSO_MAX_BUFF_SIZE : tmp_len;
> -
>  		stmmac_prepare_tso_tx_desc(priv, desc, 0, buff_size,
>  				0, 1,
>  				(last_segment) && (tmp_len <= TSO_MAX_BUFF_SIZE),
> @@ -4182,6 +4210,7 @@ static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
>  
>  		tmp_len -= TSO_MAX_BUFF_SIZE;
>  	}
> +	return 0;

nit: add a newline before return 0

>  }
>  
>  static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue)
> @@ -4351,25 +4380,17 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
>  		pay_len = 0;
>  	}
>  
> -	stmmac_tso_allocator(priv, des, tmp_pay_len, (nfrags == 0), queue);
> +	if (stmmac_tso_allocator(priv, (skb->data + proto_hdr_len),
> +				 tmp_pay_len, nfrags == 0, queue, false))
> +		goto dma_map_err;

Changing the second argument here is subtly changing the dma_cap.addr64 <= 32
case right before this. Is that intentional?

i.e., prior, pretend des = 0 (side note but des is a very confusing
variable name for "dma address" when there's also mentions of desc meaning
"descriptor" in the DMA ring). In the <= 32 case, we'd call
stmmac_tso_allocator(priv, 0) and in the else case we'd call
stmmac_tso_allocator(priv, 0 + proto_hdr_len).

With this change in both cases its called with the (not-yet-dma-mapped)
skb->data + proto_hdr_len always (i.e. like the else case).

Honestly, the <= 32 case reads weird to me without this patch. It
seems some of the buffer is filled but des is not properly incremented?

I don't know how this hardware is supposed to be programmed (no databook
access) but that seems fishy (and like a separate bug, which would be
nice to squash if so in its own patch). Would you be able to explain the
logic there to me if it does make sense to you?

>  
>  	/* Prepare fragments */
>  	for (i = 0; i < nfrags; i++) {
> -		const skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
> +		skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
>  
> -		des = skb_frag_dma_map(priv->device, frag, 0,
> -				       skb_frag_size(frag),
> -				       DMA_TO_DEVICE);
> -		if (dma_mapping_error(priv->device, des))
> +		if (stmmac_tso_allocator(priv, frag, skb_frag_size(frag),
> +					 (i == nfrags - 1), queue, true))

Personally I think it would be nice to change stmmac_tso_allocator() so
you can keep the frag const above... i.e. something like
stmmac_tso_allocator(..., void *addr, ..., const skb_frag_t *frag)
and just check if frag is NULL to determine if you're dealing with a
frag or not (instead of passing the boolean in to indicate that).

I'm curious if someone else can think of a cleaner API than that for
that function, even that's not super pretty...

>  			goto dma_map_err;
> -
> -		stmmac_tso_allocator(priv, des, skb_frag_size(frag),
> -				     (i == nfrags - 1), queue);
> -
> -		tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = des;
> -		tx_q->tx_skbuff_dma[tx_q->cur_tx].len = skb_frag_size(frag);
> -		tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page = true;
> -		tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
>  	}
>  
>  	tx_q->tx_skbuff_dma[tx_q->cur_tx].last_segment = true;
> -- 
> 2.25.1
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
