Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 974C134F6E9
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Mar 2021 04:42:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 478F1C57B60;
	Wed, 31 Mar 2021 02:42:20 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DCFFC57B54
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 02:42:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B759619CA;
 Wed, 31 Mar 2021 02:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617158537;
 bh=8Ue31CU6c105fo9MV/f6yIBMpQtwspY1XPEZbBfWucU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EdRwlaXM3N507LgGVvVpkBDZZmfxRwODIwE3oPg2daUdkioNPdM+6rnKVLJMMrAcK
 hKVg/+axZBuNAGIn5W5/KSQOpQJiIHTiLB/Ba96t9mEYB/C/4r/ZbkK7ic0sdRqebq
 E8usJz/zahtHBUfU5RXtNNL8nwlJ6P/pm4rkT+ArCphDWdKRJs2g9SG7uMCVqQPlIJ
 FCLgILnnr/dOkyPHLIh8PdMzbQKsYafnwqWKIZQ3cKRImOpWuj6H+53KD2hldkTiTf
 +kLESK5ae3BnskcjJyS2hYCa3Sd0GdclH4t4J8ACQarqQSadRr+4Cs2IgTkmV/nwrc
 aZiGJhFx964ow==
Date: Tue, 30 Mar 2021 19:42:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Message-ID: <20210330194215.0469324a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210330024949.14010-5-boon.leong.ong@intel.com>
References: <20210330024949.14010-1-boon.leong.ong@intel.com>
 <20210330024949.14010-5-boon.leong.ong@intel.com>
MIME-Version: 1.0
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Yonghong Song <yhs@fb.com>,
 KP Singh <kpsingh@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 bpf@vger.kernel.org, "David S .
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Jesper Dangaard Brouer <hawk@kernel.org>
Subject: Re: [Linux-stm32] [PATCH net-next v2 4/6] net: stmmac: Add initial
	XDP support
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

On Tue, 30 Mar 2021 10:49:47 +0800 Ong Boon Leong wrote:
> +		if (!skb) {
> +			dma_sync_single_for_cpu(priv->device, buf->addr,
> +						buf1_len, dma_dir);
> +
> +			xdp.data = page_address(buf->page) + buf->page_offset;
> +			xdp.data_end = xdp.data + len;
> +			xdp.data_hard_start = page_address(buf->page);
> +			xdp_set_data_meta_invalid(&xdp);
> +			xdp.frame_sz = buf_sz;
> +
> +			skb = stmmac_xdp_run_prog(priv, &xdp);
> +
> +			/* For Not XDP_PASS verdict */
> +			if (IS_ERR(skb)) {
> +				unsigned int xdp_res = -PTR_ERR(skb);
> +
> +				if (xdp_res & STMMAC_XDP_CONSUMED) {
> +					page_pool_recycle_direct(rx_q->page_pool,
> +								 buf->page);
> +					buf->page = NULL;
> +					priv->dev->stats.rx_dropped++;
> +
> +					/* Clear skb as it was set as
> +					 * status by XDP program.
> +					 */
> +					skb = NULL;
> +
> +					if (unlikely((status & rx_not_ls)))
> +						goto read_again;
> +
> +					count++;
> +					continue;
> +				}
> +			}
> +		}
> +
>  		if (!skb) {
>  			skb = napi_alloc_skb(&ch->rx_napi, buf1_len);
>  			if (!skb) {
> @@ -4322,9 +4400,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  				goto drain_data;
>  			}
>  
> -			dma_sync_single_for_cpu(priv->device, buf->addr,
> -						buf1_len, DMA_FROM_DEVICE);
> -			skb_copy_to_linear_data(skb, page_address(buf->page),
> +			skb_copy_to_linear_data(skb, page_address(buf->page) +
> +						buf->page_offset,
>  						buf1_len);

XDP can prepend or remove headers (using the bpf_xdp_adjust_head()
helper), so the start of data may no longer be page + HEADROOM, 
and the length of the frame may have changed. 

Are you accounting for this?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
