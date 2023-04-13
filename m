Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8453A6E1331
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Apr 2023 19:09:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3684BC69063;
	Thu, 13 Apr 2023 17:09:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02273C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Apr 2023 17:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681405789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O5dv4XAyW10/07F5EnvMKRPv3TLobZcUlN4bcbi+kaA=;
 b=fIKGaOGaC1XkGwTcSQHcS3m60Bv41dD9LtF4cbZHk6+e+p1jXwFqsI7PHV/ekDQeJ+2ssG
 ripKB7xBdfYc2zTVoZ4Ui5esMIhJ5qBqQnYob5XZc7wm+j/L6+M6tTrV8o7I69JMncpxvd
 +NtF1Y800XKQO3mYm2fybC+9OlwOdeA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-dBc85ctjOzWmsAmKmE86AQ-1; Thu, 13 Apr 2023 13:09:48 -0400
X-MC-Unique: dBc85ctjOzWmsAmKmE86AQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 g21-20020a50d0d5000000b005067d6335c3so2364edf.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Apr 2023 10:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681405787; x=1683997787;
 h=content-transfer-encoding:in-reply-to:references:to
 :content-language:subject:cc:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O5dv4XAyW10/07F5EnvMKRPv3TLobZcUlN4bcbi+kaA=;
 b=QKlQ/xUBUKLeTs0qK4h7LUD8P5Zuze3nbDA/JcY5GudfPYtQHChiiOpcQ67tushcnb
 j6cjol7whtzfuT+A++nD2RqI7y+KMBcOvRUpidnxX7Izd1JYqz0kogLHmi5NltUQ+GC1
 uwfnTr6duqqzblchMlJ56hxSefHn8Vn0vT7vcTo3GHrQVUUK1Hb/AEPkgFmZk66+lwyH
 rdCAcME+Sy3gZXMcbUirQVCQof/RCq3totXPwaZ/z+0+UtBSpUv4b8gSQ7OWK/ew5nBl
 koyH00je4u+NJ+JTs1/BNdKqC9eelLKRHl//jy3IqAZnQ2jF8HHwAOkSXxC93Dgu+3Dk
 5Jsw==
X-Gm-Message-State: AAQBX9cRA2YbxPYu7KevgvrlzZjJRqyUHl7B+mcK5bY8CNKwS7lOuosV
 OW/7+YRSrONMmQTNnkFDrQuJGi8i1MY9qWRxH96pDogARc3v13oa2/nLYdSi+N3Yonha7YDvnmz
 DVgEck2YbPiXE312D8mgA7zfm6yIhJV5ESIonXroA
X-Received: by 2002:a17:906:2a56:b0:94c:6762:e20d with SMTP id
 k22-20020a1709062a5600b0094c6762e20dmr2839484eje.12.1681405787184; 
 Thu, 13 Apr 2023 10:09:47 -0700 (PDT)
X-Google-Smtp-Source: AKy350auwQSXJLuDYzIzYzD6jbuy2PcON1aKDR6Ey77ueObIYZvvDUCwgZNOif1QefTp6UAXXc042g==
X-Received: by 2002:a17:906:2a56:b0:94c:6762:e20d with SMTP id
 k22-20020a1709062a5600b0094c6762e20dmr2839449eje.12.1681405786887; 
 Thu, 13 Apr 2023 10:09:46 -0700 (PDT)
Received: from [192.168.42.222] (194-45-78-10.static.kviknet.net.
 [194.45.78.10]) by smtp.gmail.com with ESMTPSA id
 p8-20020a17090664c800b0094b360a281dsm1221750ejn.123.2023.04.13.10.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 10:09:46 -0700 (PDT)
From: Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <203ab7d9-3695-f734-92b5-503118444108@redhat.com>
Date: Thu, 13 Apr 2023 19:09:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: Song Yoong Siang <yoong.siang.song@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@google.com>, Alexander Duyck
 <alexanderduyck@fb.com>, Ong Boon Leong <boon.leong.ong@intel.com>
References: <20230413032541.885238-1-yoong.siang.song@intel.com>
 <20230413032541.885238-2-yoong.siang.song@intel.com>
In-Reply-To: <20230413032541.885238-2-yoong.siang.song@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: xdp-hints@xdp-project.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, brouer@redhat.com, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 1/3] net: stmmac: introduce
 wrapper for struct xdp_buff
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


On 13/04/2023 05.25, Song Yoong Siang wrote:
> Introduce struct stmmac_xdp_buff as a preparation to support XDP Rx
> metadata via kfuncs.
> 
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/stmmac.h   |  4 ++++
>   .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 +++++++++---------
>   2 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index 3d15e1e92e18..ac8ccf851708 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -92,6 +92,10 @@ struct stmmac_rx_buffer {
>   	dma_addr_t sec_addr;
>   };
>   
> +struct stmmac_xdp_buff {
> +	struct xdp_buff xdp;
> +};
> +
>   struct stmmac_rx_queue {
>   	u32 rx_count_frames;
>   	u32 queue_index;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index d7fcab057032..6ffce52ca837 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5188,9 +5188,9 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>   	int status = 0, coe = priv->hw->rx_csum;
>   	unsigned int next_entry = rx_q->cur_rx;
>   	enum dma_data_direction dma_dir;
> +	struct stmmac_xdp_buff ctx = {};

This code trick {} will zero out the struct.

Is this done purpose and really needed?

On x86_64 this unfortunately generates an asm instruction: rep stos

A repeated store string operation, for zeroing out memory, which is
slow. (Because[1] it supports be suspended by an exception or interrupt,
which requires it to store/restore CPU flags).

[1] https://www.felixcloutier.com/x86/rep:repe:repz:repne:repnz#tbl-4-22


>   	unsigned int desc_size;
>   	struct sk_buff *skb = NULL;
> -	struct xdp_buff xdp;
>   	int xdp_status = 0;
>   	int buf_sz;
>   
> @@ -5311,17 +5311,17 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>   			dma_sync_single_for_cpu(priv->device, buf->addr,
>   						buf1_len, dma_dir);
>   
> -			xdp_init_buff(&xdp, buf_sz, &rx_q->xdp_rxq);
> -			xdp_prepare_buff(&xdp, page_address(buf->page),
> +			xdp_init_buff(&ctx.xdp, buf_sz, &rx_q->xdp_rxq);
> +			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
>   					 buf->page_offset, buf1_len, false);
>   
> -			pre_len = xdp.data_end - xdp.data_hard_start -
> +			pre_len = ctx.xdp.data_end - ctx.xdp.data_hard_start -
>   				  buf->page_offset;
> -			skb = stmmac_xdp_run_prog(priv, &xdp);
> +			skb = stmmac_xdp_run_prog(priv, &ctx.xdp);
>   			/* Due xdp_adjust_tail: DMA sync for_device
>   			 * cover max len CPU touch
>   			 */
> -			sync_len = xdp.data_end - xdp.data_hard_start -
> +			sync_len = ctx.xdp.data_end - ctx.xdp.data_hard_start -
>   				   buf->page_offset;
>   			sync_len = max(sync_len, pre_len);
>   
> @@ -5331,7 +5331,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>   
>   				if (xdp_res & STMMAC_XDP_CONSUMED) {
>   					page_pool_put_page(rx_q->page_pool,
> -							   virt_to_head_page(xdp.data),
> +							   virt_to_head_page(ctx.xdp.data),
>   							   sync_len, true);
>   					buf->page = NULL;
>   					priv->dev->stats.rx_dropped++;
> @@ -5359,7 +5359,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>   
>   		if (!skb) {
>   			/* XDP program may expand or reduce tail */
> -			buf1_len = xdp.data_end - xdp.data;
> +			buf1_len = ctx.xdp.data_end - ctx.xdp.data;
>   
>   			skb = napi_alloc_skb(&ch->rx_napi, buf1_len);
>   			if (!skb) {
> @@ -5369,7 +5369,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>   			}
>   
>   			/* XDP program may adjust header */
> -			skb_copy_to_linear_data(skb, xdp.data, buf1_len);
> +			skb_copy_to_linear_data(skb, ctx.xdp.data, buf1_len);
>   			skb_put(skb, buf1_len);
>   
>   			/* Data payload copied into SKB, page ready for recycle */

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
