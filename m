Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DC47812C2
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 20:20:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55BF7C6B461;
	Fri, 18 Aug 2023 18:20:04 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 030FCC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 18:20:02 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2b9d07a8d84so19136641fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 11:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692382802; x=1692987602;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=E8CxnfReoMP8+uynZ3PaiswXkll6MQ1QWbgzzSuo5uI=;
 b=M90Axk+SC7+eqj0O+eFZe4ZVw5wCvO6kuQZG2fA5Lkw8jX9tMaL0Xs8dYbUbomfJBO
 N532nXeYInk9qFyMDAx1u91lk83bkBUEihVePgrK+mxHFA8Bc7EtHwn0VoF+JQvbCHwp
 lqX27qrC4fmWbGRYb6ndSFcRce4os1zneM6CKwvHIU+wM0e8pl2UC005XwuTZ2Z/EMsP
 KONqjFqK2Lf6DTtgV2/j4NRcPY0EihUqq+CkaQWUuu24gzBNRlqfulVkVvSQuExcUIzP
 oyg3jtWS1cJGwFLwtb4qwEV5/xjaEyKSvvhxbiZzmoO0jsP2q4rRmXsIQ4JIUN+ZGmmf
 dMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692382802; x=1692987602;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E8CxnfReoMP8+uynZ3PaiswXkll6MQ1QWbgzzSuo5uI=;
 b=DUH/oLL1ULlPLxax0I+gZFKSAR1sbVQUT2E+6HeLelOmDGhWRWS3FbxIpDwbp99q8X
 D6NwounUGi7Ry7teyKnnfC2+E4KX7HVd3kizZ6W7m/pfT2II81T52T7NLlcHFNlT9VIb
 y6/okVx9cwoTxuYlmrBJlz5sUcWEVzyMtd3h+f49r8dGjol2OGsc+rAUl5CLECJ4vgP7
 hU9VPj45gJ9S7lapJgDXvNXpX1JpU/JltP8tDJY6wIDIpzm3aokf5iF7pydl2+Z3PkxU
 ig8IbPjrLhac3+5Rl6HZ0KhiQ+j+U3kmaWyjgo6kxSDZBj1e0qMmeVyc/bveTf2wDpqQ
 2yfg==
X-Gm-Message-State: AOJu0YxTMoszszKJObD0kkCRZzIyQur6dNfLPxaFP6JMSXoQdF4Heu2o
 t7v6yYAKM3uK+Xj3VbiCxYU=
X-Google-Smtp-Source: AGHT+IE6pOb2aA6c9i0JOYlkYdU8iBBET0RocIW9RhWyDSrjfOd6FnBxlnddWEtRiITAyhWfSwz/Pw==
X-Received: by 2002:a19:5019:0:b0:4f9:556b:93c4 with SMTP id
 e25-20020a195019000000b004f9556b93c4mr2281962lfb.31.1692382801675; 
 Fri, 18 Aug 2023 11:20:01 -0700 (PDT)
Received: from mobilestation ([93.157.254.210])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a05651238a900b004fe15a2f0f6sm440762lft.62.2023.08.18.11.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 11:20:01 -0700 (PDT)
Date: Fri, 18 Aug 2023 21:19:59 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Rohan G Thomas <rohan.g.thomas@intel.com>
Message-ID: <trcp4f77dv2e36zpe53s7sjoyevgd5qtpv6m4a75ryalglqnev@trcsnsmvtijy>
References: <20230818135350.12474-1-rohan.g.thomas@intel.com>
 <20230818135350.12474-3-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230818135350.12474-3-rohan.g.thomas@intel.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 2/2] net: stmmac: Tx coe sw
	fallback
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

On Fri, Aug 18, 2023 at 09:53:50PM +0800, Rohan G Thomas wrote:
> Add sw fallback of tx checksum calculation for those tx queues that
> don't support tx checksum offloading. Because, some DWMAC IPs support
> tx checksum offloading only for a few initial tx queues, starting
> from tx queue 0.
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  5 +++++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 19 +++++++++++++++++++
>  .../ethernet/stmicro/stmmac/stmmac_platform.c |  4 ++++
>  include/linux/stmmac.h                        |  1 +
>  4 files changed, 29 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index 3401e888a9f6..64d7dbe474bd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -210,12 +210,17 @@ struct stmmac_dma_conf {
>  	unsigned int dma_tx_size;
>  };
>  
> +#define STMMAC_PRIV_FLG_TXQ_COE_LIMIT	BIT(0)
> +
>  struct stmmac_priv {
>  	/* Frequently used values are kept adjacent for cache effect */
>  	u32 tx_coal_frames[MTL_MAX_TX_QUEUES];
>  	u32 tx_coal_timer[MTL_MAX_TX_QUEUES];
>  	u32 rx_coal_frames[MTL_MAX_TX_QUEUES];
>  

> +	u32 flags;

This looks redundant. See my last comment.

> +

> +	u32 tx_q_with_coe;

This one too. Can't you just use the
plat_stmmacenet_data.tx_queues_with_coe field?

>  	int hwts_tx_en;
>  	bool tx_path_in_lpi_mode;
>  	bool tso;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 733b5e900817..f9ab6635218c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4409,6 +4409,17 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
>  	WARN_ON(tx_q->tx_skbuff[first_entry]);
>  
>  	csum_insertion = (skb->ip_summed == CHECKSUM_PARTIAL);
> +	/* Some DWMAC IPs support tx coe only for a few initial tx queues,
> +	 * starting from tx queue 0. So checksum offloading for those queues
> +	 * that don't support tx coe needs to fallback to software checksum
> +	 * calculation.
> +	 */

> +	if (csum_insertion && (priv->flags & STMMAC_PRIV_FLG_TXQ_COE_LIMIT) &&
> +	    queue >= priv->tx_q_with_coe) {
> +		if (unlikely(skb_checksum_help(skb)))
> +			goto dma_map_err;
> +		csum_insertion = !csum_insertion;
> +	}

just (csum_insertion && queue >= priv->plat->tx_queues_with_coe). See
further what to do for this to work as I suggested.

>  
>  	if (likely(priv->extend_desc))
>  		desc = (struct dma_desc *)(tx_q->dma_etx + entry);
> @@ -7401,6 +7412,14 @@ int stmmac_dvr_probe(struct device *device,
>  		dev_info(priv->device, "SPH feature enabled\n");
>  	}
>  

> +	if (priv->plat->tx_coe &&
> +	    priv->plat->tx_queues_with_coe < priv->plat->tx_queues_to_use) {
> +		priv->flags |= STMMAC_PRIV_FLG_TXQ_COE_LIMIT;
> +		priv->tx_q_with_coe = priv->plat->tx_queues_with_coe;
> +		dev_info(priv->device, "TX COE limited to %u tx queues\n",
> +			 priv->tx_q_with_coe);
> +	}

What about:
+	if (priv->plat->tx_coe && !priv->plat->tx_queues_with_coe)
+		priv->plat->tx_queues_with_coe = priv->plat->tx_queues_to_use;
+	else if (!priv->plat->tx_coe)
+		priv->plat->tx_queues_with_coe = 0;
+	else if (priv->plat->tx_queues_with_coe < priv->plat->tx_queues_to_use)
+		dev_info(priv->device, "TX COE is available for %u queues\n", priv->plat->tx_queues_with_coe);

?

-Serge(y)

> +
>  	/* Ideally our host DMA address width is the same as for the
>  	 * device. However, it may differ and then we have to use our
>  	 * host DMA width for allocation and the device DMA width for
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index be8e79c7aa34..0138b7c9c7ab 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -225,6 +225,10 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
>  				 &plat->tx_queues_to_use))
>  		plat->tx_queues_to_use = 1;
>  
> +	if (of_property_read_u32(tx_node, "snps,tx-queues-with-coe",
> +				 &plat->tx_queues_with_coe))
> +		plat->tx_queues_with_coe = plat->tx_queues_to_use;
> +
>  	if (of_property_read_bool(tx_node, "snps,tx-sched-wrr"))
>  		plat->tx_sched_algorithm = MTL_TX_ALGORITHM_WRR;
>  	else if (of_property_read_bool(tx_node, "snps,tx-sched-wfq"))
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 784277d666eb..cb508164eaea 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -252,6 +252,7 @@ struct plat_stmmacenet_data {
>  	u32 host_dma_width;
>  	u32 rx_queues_to_use;
>  	u32 tx_queues_to_use;
> +	u32 tx_queues_with_coe;
>  	u8 rx_sched_algorithm;
>  	u8 tx_sched_algorithm;
>  	struct stmmac_rxq_cfg rx_queues_cfg[MTL_MAX_RX_QUEUES];
> -- 
> 2.19.0
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
