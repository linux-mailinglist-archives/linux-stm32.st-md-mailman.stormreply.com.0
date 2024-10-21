Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C689A5FA6
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Oct 2024 11:06:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27270C78035;
	Mon, 21 Oct 2024 09:06:19 +0000 (UTC)
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com
 [67.231.156.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A657C78033
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 09:06:11 +0000 (UTC)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49L7WkRG025994;
 Mon, 21 Oct 2024 02:05:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=pfpt0220; bh=0goJgfit4TjURb3XRQO6I44JY
 U0Wpgwn0kcUIYNFrFw=; b=MGZcPNKxs/gA9AcqBKLqfRsGOj7EGl5qVAdBCetut
 CH34pv/7LgL001uMfvmHvSxlxC7s1xmpKyz2ObN7PMYPnyM9MriY1nXAL2lCcg6D
 YEOeRJtoWBY6Hu37520VY4s5f+zRbrlOsQW457JUtMfAHhhPXMmsoSAGYrJ42cQO
 L1Lf+FtfJb7e+1vth/mUI/WHdNnAOIebwiYIlRdfJgsdsgmtv9akE+8eWhlVrdAS
 BXDGfCnGi8JzcTmTxNzZW19nQRj8NgrMOP7wuo+hlVZi0t2zQ8hxWiIm/JH7Gi9y
 LClCY2CTpGcoZP2fQxyqjBKflr5AnLGjMD2lhXP4kXn9Q==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
 by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 42djnmr5vq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Oct 2024 02:05:26 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 21 Oct 2024 02:04:58 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 21 Oct 2024 02:04:58 -0700
Received: from test-OptiPlex-Tower-Plus-7010 (unknown [10.29.37.157])
 by maili.marvell.com (Postfix) with SMTP id 495AA3F705D;
 Mon, 21 Oct 2024 02:04:54 -0700 (PDT)
Date: Mon, 21 Oct 2024 14:34:53 +0530
From: Hariprasad Kelam <hkelam@marvell.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <ZxYZNc+CKWglUphG@test-OptiPlex-Tower-Plus-7010>
References: <20241021061023.2162701-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241021061023.2162701-1-0x1207@gmail.com>
X-Proofpoint-GUID: VKTrNVJoQBOJl-nC4JKz4dttpbbjuoBC
X-Proofpoint-ORIG-GUID: VKTrNVJoQBOJl-nC4JKz4dttpbbjuoBC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: TSO: Fix unbalanced
 DMA map/unmap for non-paged SKB data
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

On 2024-10-21 at 11:40:23, Furong Xu (0x1207@gmail.com) wrote:
> In case the non-paged data of a SKB carries protocol header and protocol
> payload to be transmitted on a certain platform that the DMA AXI address
> width is configured to 40-bit/48-bit, or the size of the non-paged data
> is bigger than TSO_MAX_BUFF_SIZE on a certain platform that the DMA AXI
> address width is configured to 32-bit, then this SKB requires at least
> two DMA transmit descriptors to serve it.
> 
> For example, three descriptors are allocated to split one DMA buffer
> mapped from one piece of non-paged data:
>     dma_desc[N + 0],
>     dma_desc[N + 1],
>     dma_desc[N + 2].
> Then three elements of tx_q->tx_skbuff_dma[] will be allocated to hold
> extra information to be reused in stmmac_tx_clean():
>     tx_q->tx_skbuff_dma[N + 0],
>     tx_q->tx_skbuff_dma[N + 1],
>     tx_q->tx_skbuff_dma[N + 2].
> Now we focus on tx_q->tx_skbuff_dma[entry].buf, which is the DMA buffer
> address returned by DMA mapping call. stmmac_tx_clean() will try to
> unmap the DMA buffer _ONLY_IF_ tx_q->tx_skbuff_dma[entry].buf
> is a valid buffer address.
> 
> The expected behavior that saves DMA buffer address of this non-paged
> data to tx_q->tx_skbuff_dma[entry].buf is:
>     tx_q->tx_skbuff_dma[N + 0].buf = NULL;
>     tx_q->tx_skbuff_dma[N + 1].buf = NULL;
>     tx_q->tx_skbuff_dma[N + 2].buf = dma_map_single();
> Unfortunately, the current code misbehaves like this:
>     tx_q->tx_skbuff_dma[N + 0].buf = dma_map_single();
>     tx_q->tx_skbuff_dma[N + 1].buf = NULL;
>     tx_q->tx_skbuff_dma[N + 2].buf = NULL;
> 
> On the stmmac_tx_clean() side, when dma_desc[N + 0] is closed by the
> DMA engine, tx_q->tx_skbuff_dma[N + 0].buf is a valid buffer address
> obviously, then the DMA buffer will be unmapped immediately.
> There may be a rare case that the DMA engine does not finish the
> pending dma_desc[N + 1], dma_desc[N + 2] yet. Now things will go
> horribly wrong, DMA is going to access a unmapped/unreferenced memory
> region, corrupted data will be transmited or iommu fault will be
> triggered :(
> 
> In contrast, the for-loop that maps SKB fragments behaves perfectly
> as expected, and that is how the driver should do for both non-paged
> data and paged frags actually.
> 
> This patch corrects DMA map/unmap sequences by fixing the array index
> for tx_q->tx_skbuff_dma[entry].buf when assigning DMA buffer address.
> 
> Tested and verified on DWXGMAC CORE 3.20a
> 
> Reported-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
> Fixes: f748be531d70 ("stmmac: support new GMAC4")
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 ++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index d3895d7eecfc..208dbc68aaf9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4304,11 +4304,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
>  	if (dma_mapping_error(priv->device, des))
>  		goto dma_map_err;
>  
> -	tx_q->tx_skbuff_dma[first_entry].buf = des;
> -	tx_q->tx_skbuff_dma[first_entry].len = skb_headlen(skb);
> -	tx_q->tx_skbuff_dma[first_entry].map_as_page = false;
> -	tx_q->tx_skbuff_dma[first_entry].buf_type = STMMAC_TXBUF_T_SKB;
> -
>  	if (priv->dma_cap.addr64 <= 32) {
>  		first->des0 = cpu_to_le32(des);
>  
> @@ -4327,6 +4322,23 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
>  
>  	stmmac_tso_allocator(priv, des, tmp_pay_len, (nfrags == 0), queue);
>  
> +	/* In case two or more DMA transmit descriptors are allocated for this
> +	 * non-paged SKB data, the DMA buffer address should be saved to
> +	 * tx_q->tx_skbuff_dma[].buf corresponding to the last descriptor,
> +	 * and leave the other tx_q->tx_skbuff_dma[].buf as NULL to guarantee
> +	 * that stmmac_tx_clean() does not unmap the entire DMA buffer too early
> +	 * since the tail areas of the DMA buffer can be accessed by DMA engine
> +	 * sooner or later.
> +	 * By saving the DMA buffer address to tx_q->tx_skbuff_dma[].buf
> +	 * corresponding to the last descriptor, stmmac_tx_clean() will unmap
> +	 * this DMA buffer right after the DMA engine completely finishes the
> +	 * full buffer transmission.
> +	 */
> +	tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = des;
> +	tx_q->tx_skbuff_dma[tx_q->cur_tx].len = skb_headlen(skb);
> +	tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page = false;
> +	tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
> +
>  	/* Prepare fragments */
>  	for (i = 0; i < nfrags; i++) {
>  		const skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
> -- 
Reviewed-by: Hariprasad Kelam <hkelam@marvell.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
