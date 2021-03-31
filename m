Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE623509AB
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Mar 2021 23:42:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46559C3FAD6;
	Wed, 31 Mar 2021 21:42:41 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C43AFC32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 21:42:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D729460FE8;
 Wed, 31 Mar 2021 21:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617226957;
 bh=Fz/I/hl1yyAm72gSCKg/MoqAzZtuus5hQonetSpNc3I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RW787MI6LE5UtC5glGn/yEU6oFwJDa73G+GlcJhOken3vy86TdE6sAAxps0iZK0Qw
 Y2oArBelG3AKmHuD46Ng83ZWBhbqDIo/Fuq7/qpoFCdiI1jfY58ahnJtJ8LFJUcwXl
 9pHo0aABYPxyu5NbQbYUn7NMSpSX+2M8n1J68f9yJOUIp5W4M5snSwvgqCEKVr5lRp
 9AME9mLRTClC/OLr7jgaF5mOJeY3de/6eQgFx5uiasgRexeBw2WTUvkBNayPdKvJWh
 TqNdKCWsANAZUkxiRbLDyggIK1a+oAbAQFd6ub5HpQmttIln6uaZpxFCqVxkGG9wYw
 T3YG47kvI60pw==
Date: Wed, 31 Mar 2021 14:42:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Message-ID: <20210331144235.799dea32@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210331154135.8507-6-boon.leong.ong@intel.com>
References: <20210331154135.8507-1-boon.leong.ong@intel.com>
 <20210331154135.8507-6-boon.leong.ong@intel.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v3 5/6] net: stmmac: Add support
 for XDP_TX action
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

On Wed, 31 Mar 2021 23:41:34 +0800 Ong Boon Leong wrote:
> This patch adds support for XDP_TX action which enables XDP program to
> transmit back received frames.
> 
> This patch has been tested with the "xdp2" app located in samples/bpf
> dir. The DUT receives burst traffic packet generated using pktgen script
> 'pktgen_sample03_burst_single_flow.sh'.
> 
> v3: Added 'nq->trans_start = jiffies' to avoid TX time-out as we are
>     sharing TX queue between slow path and XDP. Thanks to Jakub Kicinski
>     for pointing out.
> 
> Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>

> +static int stmmac_xdp_xmit_back(struct stmmac_priv *priv,
> +				struct xdp_buff *xdp)
> +{
> +	struct xdp_frame *xdpf = xdp_convert_buff_to_frame(xdp);
> +	int cpu = smp_processor_id();
> +	struct netdev_queue *nq;
> +	int queue;
> +	int res;
> +
> +	if (unlikely(!xdpf))
> +		return -EFAULT;

Can you return -EFAULT here? looks like the function is otherwise
returning positive STMMAC_XDP_* return codes/masks.

> +	queue = stmmac_xdp_get_tx_queue(priv, cpu);
> +	nq = netdev_get_tx_queue(priv->dev, queue);
> +
> +	__netif_tx_lock(nq, cpu);
> +	/* Avoids TX time-out as we are sharing with slow path */
> +	nq->trans_start = jiffies;
> +	res = stmmac_xdp_xmit_xdpf(priv, queue, xdpf);
> +	if (res == STMMAC_XDP_TX) {
> +		stmmac_flush_tx_descriptors(priv, queue);
> +		stmmac_tx_timer_arm(priv, queue);

Would it make sense to arm the timer and flush descriptors at the end
of the NAPI poll cycle? Instead of after every TX frame?

> +	}
> +	__netif_tx_unlock(nq);
> +
> +	return res;
> +}

> @@ -4365,16 +4538,26 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  			xdp.data_hard_start = page_address(buf->page);
>  			xdp_set_data_meta_invalid(&xdp);
>  			xdp.frame_sz = buf_sz;
> +			xdp.rxq = &rx_q->xdp_rxq;
>  
> +			pre_len = xdp.data_end - xdp.data_hard_start -
> +				  buf->page_offset;
>  			skb = stmmac_xdp_run_prog(priv, &xdp);
> +			/* Due xdp_adjust_tail: DMA sync for_device
> +			 * cover max len CPU touch
> +			 */
> +			sync_len = xdp.data_end - xdp.data_hard_start -
> +				   buf->page_offset;
> +			sync_len = max(sync_len, pre_len);
>  
>  			/* For Not XDP_PASS verdict */
>  			if (IS_ERR(skb)) {
>  				unsigned int xdp_res = -PTR_ERR(skb);
>  
>  				if (xdp_res & STMMAC_XDP_CONSUMED) {
> -					page_pool_recycle_direct(rx_q->page_pool,
> -								 buf->page);
> +					page_pool_put_page(rx_q->page_pool,
> +							   virt_to_head_page(xdp.data),
> +							   sync_len, true);

IMHO the dma_sync_size logic is a little question, but it's not really
related to your patch, others are already doing the same thing, so it's
fine, I guess.

>  					buf->page = NULL;
>  					priv->dev->stats.rx_dropped++;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
