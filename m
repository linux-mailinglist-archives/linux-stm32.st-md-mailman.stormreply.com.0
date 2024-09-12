Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C22D59764CC
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Sep 2024 10:47:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E840C6DD9A;
	Thu, 12 Sep 2024 08:47:24 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43B96C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Sep 2024 08:47:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 799375C54F3;
 Thu, 12 Sep 2024 08:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E10EC4CEC3;
 Thu, 12 Sep 2024 08:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726130835;
 bh=i0CNHHFTOhKkqY5aND8P+QYFqt6olhaiseKhzencGF0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kkoR83+BFUXOwLV646gTExq9075bH58xAdvKY0YV6Klx6pVxiG0MKpZw2mDUfZdWx
 JgxiWbRxqXc97YWp8RoYEfmKtetg/mVSznfRm5YkGNMcpTABJRAIFtLSjUGNnY5Dby
 UAPpoIS5rP4oMWGrzaqkrmfv0Y1YUdnv7A+M3A5wlmS2bQ9OlJjGETAEbSTmW+/XrV
 VtIv2gumdLIG98bGc9+6wCX9H3AGkYJ8DpMLL76dbM8oU7zFpB6hQ/3qrFVIeK303+
 3BWAH/Jwtws8GQGLPJuXo5FoSrxqzxZBo1DQijQM1uqDMmwyNDtzwVZuSm0JZhTC04
 Hgz4CkJVhI6xg==
Date: Thu, 12 Sep 2024 09:47:10 +0100
From: Simon Horman <horms@kernel.org>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>
Message-ID: <20240912084710.GE572255@kernel.org>
References: <20240910124841.2205629-1-quic_jsuraj@quicinc.com>
 <20240910124841.2205629-2-quic_jsuraj@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240910124841.2205629-2-quic_jsuraj@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, kernel@quicinc.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Prasad Sodagudi <psodagud@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: allocate separate page
	for buffer
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

On Tue, Sep 10, 2024 at 06:18:41PM +0530, Suraj Jaiswal wrote:
> Currently for TSO page is mapped with dma_map_single()
> and then resulting dma address is referenced (and offset)
> by multiple descriptors until the whole region is
> programmed into the descriptors.
> This makes it possible for stmmac_tx_clean() to dma_unmap()
> the first of the already processed descriptors, while the
> rest are still being processed by the DMA engine. This leads
> to an iommu fault due to the DMA engine using unmapped memory
> as seen below:
> 
> arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
> iova=0xfc401000, fsynr=0x60003, cbfrsynra=0x121, cb=38
> 
> Descriptor content:
>      TDES0       TDES1   TDES2   TDES3
> 317: 0xfc400800  0x0     0x36    0xa02c0b68
> 318: 0xfc400836  0x0     0xb68   0x90000000
> 
> As we can see above descriptor 317 holding a page address
> and 318 holding the buffer address by adding offset to page
> addess. Now if 317 descritor is cleaned as part of tx_clean()

Hi Suraj,

As it looks like there will be a v3 anyway, some minor nits from my side.

addess -> address

Flagged by checkpatch.pl --codespell

> then we will get SMMU fault if 318 descriptor is getting accessed.
> 
> To fix this, let's map each descriptor's memory reference individually.
> This way there's no risk of unmapping a region that's still being
> referenced by the DMA engine in a later descriptor.
> 
> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
> ---
> 
> Changes since v2:
> - Update commit text with more details.
> - fixed Reverse xmas tree order issue.
> 
> 
> Changes since v1:
> - Fixed function description 
> - Fixed handling of return value.
> 
> 
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 63 ++++++++++++-------
>  1 file changed, 42 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 83b654b7a9fd..98d5a4b64cac 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4136,21 +4136,25 @@ static bool stmmac_vlan_insert(struct stmmac_priv *priv, struct sk_buff *skb,
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

Please consider using a "Return:" or "Returns:" section to document
return values.

Flagged by ./scripts/kernel-doc -none -Wall .../stmmac_main.c

>   */
> -static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
> -				 int total_len, bool last_segment, u32 queue)
> +static int stmmac_tso_allocator(struct stmmac_priv *priv, void *addr,
> +				int total_len, bool last_segment, u32 queue, bool is_skb_frag)

The line above could be trivially wrapped to <= 80 columns wide, as is
still preferred for networking code. Likewise a little further below.

Likewise elsewhere in this patch.

You can pass an option to checkpatch.pl to check for this.

>  {
>  	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
>  	struct dma_desc *desc;
>  	u32 buff_size;
>  	int tmp_len;
> +	unsigned char *data = addr;
> +	unsigned int offset = 0;

Please consider arranging local variables in Networking code in
reverse xmas tree order - longest line to shortest.

Edward Cree's xmastree tool can be of assistance here:
https://github.com/ecree-solarflare/xmastree

>  
>  	tmp_len = total_len;
>  
> @@ -4161,20 +4165,44 @@ static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
>  						priv->dma_conf.dma_tx_size);
>  		WARN_ON(tx_q->tx_skbuff[tx_q->cur_tx]);
>  
> +		buff_size = tmp_len >= TSO_MAX_BUFF_SIZE ? TSO_MAX_BUFF_SIZE : tmp_len;

		FWIIW, I think that min() would allow this the intent
		of the line above to be expressed more succinctly.

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

Maybe my eyes are deceiving me, but there seems to be quite a lot of
repetition in the two arms of the if/else condition above. If so, can it be
consolidated by moving everything other than the assignment of curr out of
the conditional blocks?  (And dropping the {}.)

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

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
