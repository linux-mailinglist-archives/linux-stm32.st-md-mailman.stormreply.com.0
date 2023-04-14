Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC226E2876
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Apr 2023 18:38:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84233C6A5E6;
	Fri, 14 Apr 2023 16:38:49 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B21FC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Apr 2023 16:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681490327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RQ7sgqQDmbwnKclLYwzzFoBdsimrT7SdVshCZK2WEYc=;
 b=G3jyZuEzs2ZiwqKq3WFQN0pST2NOMx/kGv+9oe/lvO581NMHFht/50LoNubcu6jsga3a8c
 8ku2LcONO8nq/DNBB8M/oV0oCqobcTfccTXIPn+CkFzssUkMjQCPuJ/3lpHyAA3YRUJyNP
 gZathanqwEl3Cv3FATViu2um9u1fRdY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-hKyEB6iPNjSnRi_TqBu0Tg-1; Fri, 14 Apr 2023 12:38:46 -0400
X-MC-Unique: hKyEB6iPNjSnRi_TqBu0Tg-1
Received: by mail-ej1-f69.google.com with SMTP id
 e23-20020a170906375700b0094ed5ffb83fso1252423ejc.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Apr 2023 09:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681490325; x=1684082325;
 h=content-transfer-encoding:in-reply-to:references:to
 :content-language:subject:cc:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RQ7sgqQDmbwnKclLYwzzFoBdsimrT7SdVshCZK2WEYc=;
 b=GEeFhGwiLuLw72bAhFy7MzG7ty6zacAD49mQjMzY66Z8mmRfhctWFwGxTfuoBnDftT
 OE5x2LOSlu8nf4XOD3Ngo3iQPZaF/vGcKsD+09gvOLUrQBXuAorhwqJ8CZHD/0dW66G1
 2NgAbCP7xcUnbfStwbs8BGzCHkRmG3ix218ak8Txr68Ms4twNnyqne02D9YKWh7aLLQJ
 1YYIpP+E3QkSTeVw5RsigcO8deWtma0mJnxHZMKNjvr60Wu6AU6AtRrGvpXVr1QFEbf/
 KeOdGwiaf3FkAkMAOoPzApfbh+YyIEpv4aKptIevb4Mz5zLusFhAMQiNhG8yyyNJjK/P
 b5cw==
X-Gm-Message-State: AAQBX9cMSawMmM3qHTSrcSL6NY9swTalFw58eqiDNWuUR+zmuGPZTeIO
 9npXEOIor/CzAFf+Dgpc3UKgTJ1pHALdlTtrlDuLoBsdIThJWBjvtTEPx5yIlwB1EX68pDGopBG
 J1Llbc4uFhnouxYn6M9aPg+GJjj6CMBdZlRQHPHMC
X-Received: by 2002:a17:906:4d1:b0:94e:8aeb:f8f3 with SMTP id
 g17-20020a17090604d100b0094e8aebf8f3mr7484932eja.57.1681490324938; 
 Fri, 14 Apr 2023 09:38:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350ayugk3Xrac/spJG74Sa/J9mNGI+/Fz+UylpmqnwMJbWMwuvI3GN4RYzod8i4kv0xVxOUhMqQ==
X-Received: by 2002:a17:906:4d1:b0:94e:8aeb:f8f3 with SMTP id
 g17-20020a17090604d100b0094e8aebf8f3mr7484919eja.57.1681490324603; 
 Fri, 14 Apr 2023 09:38:44 -0700 (PDT)
Received: from [192.168.42.222] (194-45-78-10.static.kviknet.net.
 [194.45.78.10]) by smtp.gmail.com with ESMTPSA id
 pg16-20020a170907205000b0094a85f6074bsm2649346ejb.33.2023.04.14.09.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 09:38:44 -0700 (PDT)
From: Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <d74d570c-3001-4c92-7516-eb20ecb479d7@redhat.com>
Date: Fri, 14 Apr 2023 18:38:42 +0200
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
 <alexanderduyck@fb.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Jacob Keller <jacob.e.keller@intel.com>
References: <20230414052651.1871424-1-yoong.siang.song@intel.com>
 <20230414052651.1871424-3-yoong.siang.song@intel.com>
In-Reply-To: <20230414052651.1871424-3-yoong.siang.song@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: xdp-hints@xdp-project.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, brouer@redhat.com, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 2/3] net: stmmac: add Rx HWTS
 metadata to XDP receive pkt
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


On 14/04/2023 07.26, Song Yoong Siang wrote:
> Add receive hardware timestamp metadata support via kfunc to XDP receive
> packets.
> 
> Suggested-by: Stanislav Fomichev <sdf@google.com>
> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
> Acked-by: Stanislav Fomichev <sdf@google.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  3 ++
>   .../net/ethernet/stmicro/stmmac/stmmac_main.c | 40 ++++++++++++++++++-
>   2 files changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index ac8ccf851708..826ac0ec88c6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -94,6 +94,9 @@ struct stmmac_rx_buffer {
>   
>   struct stmmac_xdp_buff {
>   	struct xdp_buff xdp;
> +	struct stmmac_priv *priv;
> +	struct dma_desc *p;
> +	struct dma_desc *np;

Hmm, I don't like the naming of the descriptors as "p" and "np".
If you insist on this naming, at least we need comments describing that 
this is.

Does "desc" and "ndesc" make sense?  (where "n" means "next")

>   };
>   
>   struct stmmac_rx_queue {
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 10b9f8912bb2..74f78e5537a3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5313,10 +5313,15 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>   
>   			xdp_init_buff(&ctx.xdp, buf_sz, &rx_q->xdp_rxq);
>   			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
> -					 buf->page_offset, buf1_len, false);
> +					 buf->page_offset, buf1_len, true);
>   
>   			pre_len = ctx.xdp.data_end - ctx.xdp.data_hard_start -
>   				  buf->page_offset;
> +
> +			ctx.priv = priv;
> +			ctx.p = p;
> +			ctx.np = np;
> +
>   			skb = stmmac_xdp_run_prog(priv, &ctx.xdp);
>   			/* Due xdp_adjust_tail: DMA sync for_device
>   			 * cover max len CPU touch
> @@ -7060,6 +7065,37 @@ void stmmac_fpe_handshake(struct stmmac_priv *priv, bool enable)
>   	}
>   }
>   
> +static int stmmac_xdp_rx_timestamp(const struct xdp_md *_ctx, u64 *timestamp)
> +{
> +	const struct stmmac_xdp_buff *ctx = (void *)_ctx;
> +	struct stmmac_priv *priv = ctx->priv;
> +	struct dma_desc *desc = ctx->p;
> +	struct dma_desc *np = ctx->np;
> +	struct dma_desc *p = ctx->p;
> +	u64 ns = 0;
> +
> +	if (!priv->hwts_rx_en)
> +		return -ENODATA;
> +
> +	/* For GMAC4, the valid timestamp is from CTX next desc. */
> +	if (priv->plat->has_gmac4 || priv->plat->has_xgmac)
> +		desc = np;
> +
> +	/* Check if timestamp is available */
> +	if (stmmac_get_rx_timestamp_status(priv, p, np, priv->adv_ts)) {
> +		stmmac_get_timestamp(priv, desc, priv->adv_ts, &ns);
> +		ns -= priv->plat->cdc_error_adj;
> +		*timestamp = ns_to_ktime(ns);
> +		return 0;
> +	}
> +
> +	return -ENODATA;
> +}
> +
> +static const struct xdp_metadata_ops stmmac_xdp_metadata_ops = {
> +	.xmo_rx_timestamp		= stmmac_xdp_rx_timestamp,
> +};
> +
>   /**
>    * stmmac_dvr_probe
>    * @device: device pointer
> @@ -7167,6 +7203,8 @@ int stmmac_dvr_probe(struct device *device,
>   
>   	ndev->netdev_ops = &stmmac_netdev_ops;
>   
> +	ndev->xdp_metadata_ops = &stmmac_xdp_metadata_ops;
> +
>   	ndev->hw_features = NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM |
>   			    NETIF_F_RXCSUM;
>   	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
