Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 554296DD697
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Apr 2023 11:27:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 112E8C6B463;
	Tue, 11 Apr 2023 09:27:56 +0000 (UTC)
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
 [209.85.219.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 462DBC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Apr 2023 16:25:18 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id
 b124-20020a253482000000b00b8f1b9d74ecso9460yba.18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Apr 2023 09:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1681143917;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=zJZt4cv250ETxOLYWhNXH5O28WLGu+lq/P9MQwXS1vc=;
 b=Q38PWrtfrWbIykKvRvvBdbu2xEQ65qR53Fa294q6h9fTzpEgUOChCN6gZzA6J/2Jrr
 oqqSni32vEWVPYCbg0h6jm4fUOjfjFak24TvaaKhhhzysF17g2T81sIMcNE/NB6iEZfy
 +JAuyYt2ZIkrpatZUEADvUNtPERwhA5h4EJXJKEds3rQ3lUQshZ+PSpMj9wQN087+Ou9
 FPqzzKvhqvM3NpQ0KRI+2RbokVotgwcuON+I3/gS46uHJ5RfnNczmlNKsnPDqRFen6K/
 toC13G+9g8xUr2c5Iins+M2UhJTrM19tEpB1/wsJwf04OBfN3YoQtNyJepOI8VsojJVK
 Mzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681143917;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zJZt4cv250ETxOLYWhNXH5O28WLGu+lq/P9MQwXS1vc=;
 b=kbb+fdkfEM1qvafIXe5I5UqgC++cBQrmnmw0JjpBTiSt/YYvHDO+tlKA37wGNAV1jK
 B/GSwNsBU4aC7ug9jkVfdeEqWmbjT35IHVbs8ZkErsiUlgEaUXpzYvIr8UDdl7C16pNU
 s/aoIPyfZKvd2VenPBIQg8wFgqGvabyb3MtCG7lK1DwrmW77dF3nBkXPnAXzSr4BuqZp
 gCbCBYvflUFYAZ7+Jyy2T4IBxoTuMF0BDVPjsG98RpfkseWnTGHKiZpOfW0TSNJ3+f8Z
 0PmoGvpBW8UAB+zC8Uf0Oo/jw9vW0wuAYxLoumlJqUaULxfNESvxlSnesOFAas1kCKTB
 foMg==
X-Gm-Message-State: AAQBX9dYdJ23vThKf3583KvlqdI+yYgQhzm8nT2486anQPqMNmsvNETw
 vrgrH2cIwmvbEoOtloOJs07KHrw=
X-Google-Smtp-Source: AKy350Yza28bnGsHoOQVOcw77cb7JSctAnu5UcsxyRZ6i3OPX41XxJItWn69Z01NRHFpS7EVaLNUCGM=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a25:cb52:0:b0:a02:a3a6:78fa with SMTP id
 b79-20020a25cb52000000b00a02a3a678famr5422814ybg.12.1681143917218; Mon, 10
 Apr 2023 09:25:17 -0700 (PDT)
Date: Mon, 10 Apr 2023 09:25:15 -0700
In-Reply-To: <20230410100939.331833-4-yoong.siang.song@intel.com>
Mime-Version: 1.0
References: <20230410100939.331833-1-yoong.siang.song@intel.com>
 <20230410100939.331833-4-yoong.siang.song@intel.com>
Message-ID: <ZDQ4a9UIVysA6hgd@google.com>
From: Stanislav Fomichev <sdf@google.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>
X-Mailman-Approved-At: Tue, 11 Apr 2023 09:27:54 +0000
Cc: xdp-hints@xdp-project.net, linux-kernel@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 Alexander Duyck <alexanderduyck@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 3/4] net: stmmac: add Rx HWTS
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 04/10, Song Yoong Siang wrote:
> Add receive hardware timestamp metadata support via kfunc to XDP receive
> packets.
> 
> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 24 +++++++++++++++++--
>  2 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index ac8ccf851708..760445275da8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -94,6 +94,7 @@ struct stmmac_rx_buffer {
>  
>  struct stmmac_xdp_buff {
>  	struct xdp_buff xdp;
> +	ktime_t rx_hwts;
>  };
>  
>  struct stmmac_rx_queue {
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index f7bbdf04d20c..ca183fbfde85 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5307,6 +5307,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  			}
>  		}
>  

[..]

> +		stmmac_get_rx_hwtstamp(priv, p, np, &ctx.rx_hwts);

Do we want to pay this cost for every packet?

The preferred alternative is to store enough state in the
stmmac_xdp_buff so we can get to this data from stmmac_xdp_rx_timestamp.

I haven't read this code, but tentatively:
- move priv, p, np into stmmac_xdp_buff, assign them here instead of
  calling stmmac_get_rx_hwtstamp
- call stmmac_get_rx_hwtstamp from stmmac_xdp_rx_timestamp with the
  stored priv, p, np

That would ensure that we won't waste the cycles pulling out the rx
timestamp for every packet if the higher levels / users don't care.

Would something like this work?

> +
>  		if (!skb) {
>  			unsigned int pre_len, sync_len;
>  
> @@ -5315,7 +5317,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  
>  			xdp_init_buff(&ctx.xdp, buf_sz, &rx_q->xdp_rxq);
>  			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
> -					 buf->page_offset, buf1_len, false);
> +					 buf->page_offset, buf1_len, true);
>  
>  			pre_len = ctx.xdp.data_end - ctx.xdp.data_hard_start -
>  				  buf->page_offset;
> @@ -5411,7 +5413,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  
>  		shhwtstamp = skb_hwtstamps(skb);
>  		memset(shhwtstamp, 0, sizeof(struct skb_shared_hwtstamps));
> -		stmmac_get_rx_hwtstamp(priv, p, np, &shhwtstamp->hwtstamp);
> +		shhwtstamp->hwtstamp = ctx.rx_hwts;
>  
>  		stmmac_rx_vlan(priv->dev, skb);
>  		skb->protocol = eth_type_trans(skb, priv->dev);
> @@ -7071,6 +7073,22 @@ void stmmac_fpe_handshake(struct stmmac_priv *priv, bool enable)
>  	}
>  }
>  
> +static int stmmac_xdp_rx_timestamp(const struct xdp_md *_ctx, u64 *timestamp)
> +{
> +	const struct stmmac_xdp_buff *ctx = (void *)_ctx;
> +
> +	if (ctx->rx_hwts) {
> +		*timestamp = ctx->rx_hwts;
> +		return 0;
> +	}
> +
> +	return -ENODATA;
> +}
> +
> +const struct xdp_metadata_ops stmmac_xdp_metadata_ops = {
> +	.xmo_rx_timestamp		= stmmac_xdp_rx_timestamp,
> +};
> +
>  /**
>   * stmmac_dvr_probe
>   * @device: device pointer
> @@ -7178,6 +7196,8 @@ int stmmac_dvr_probe(struct device *device,
>  
>  	ndev->netdev_ops = &stmmac_netdev_ops;
>  
> +	ndev->xdp_metadata_ops = &stmmac_xdp_metadata_ops;
> +
>  	ndev->hw_features = NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM |
>  			    NETIF_F_RXCSUM;
>  	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
