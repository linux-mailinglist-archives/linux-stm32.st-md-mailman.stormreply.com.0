Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA7C7828BB
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Aug 2023 14:15:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7762AC6B44B;
	Mon, 21 Aug 2023 12:15:08 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58E87C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 12:15:06 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-4ff9b389677so4853451e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 05:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692620105; x=1693224905;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=avV2BsJ1FLhhu79KeKfN0Ev+8booIHw8n+ZXD8aCVnA=;
 b=c5jpnXtPZchTfPtdD+NAyZpcNupHdzZV+pD84WcKk8uJIBSzC7W1uWaXcccQNUEBSO
 5RW55hM5m3dVq2HkVNUtqKXqlmOfsNHVAvzchVdF6GZoJQjqJfqs/Gw67knXOYQowLdV
 LdNjX6y0JW92cKc1mOUaxROW1X/wWgR6Of0J268IYa/shHy87Uj+HaWIw7bkl7YgJ39D
 DmQwsSFdoYQfZQmzNRT5HsdjJ6szG4pclaEtD5HxGThVrlPLK54aFQQwsAVVwsFfJurM
 PmgGflAJQjZ+DRQzel2z2SyeMqW14fq2QjNy/KKu8AIe1Ve3cKeB2IcCfFIAWkL/QN1q
 ZEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692620105; x=1693224905;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=avV2BsJ1FLhhu79KeKfN0Ev+8booIHw8n+ZXD8aCVnA=;
 b=gZJY+cqqe7SrWZofH7Irii8RY7fVgqQbye89pxFThnxRggS6wBn02c+yezUxM2RiTO
 2/WQ79v+MmsZ7N4x3qHWbYNSKaQmTdPqQ0zcGCnLGW8n11wvgmNPM007dUw6EfmTz9Sv
 81BXScRksfWBu7Fi55/hoVJI4+We7j1/8KQYp7/jsFrTRqk5v4TlB7PzJtJ8BVxcPui4
 HeK06X1jQgVeiPFo0QJlpBOYeJ6n5iI6olSXHGJ2f/ze+Dd3/VLyp3IYAOiPAe+b7i0U
 dySJ3Ng3xJ4CPCKyuIbTkhyUVRSv2gSrhqMTreeacLIndAnau56bw4w7sCOKo2gcEqHm
 ry5g==
X-Gm-Message-State: AOJu0Yz4yo8tf55ntEL3CsWpR9rnxKn9cHwTOdQQz/k/u9zQHpmbqeUH
 4oB31zPUXcO5WI2KElQ9Rg0=
X-Google-Smtp-Source: AGHT+IFNc61eHU9PArAyDrvV6DY1c2fksC/mbLMjK3WEsB9bq38x5BVHfXfD69uaWKpqHoHiv+Yn6Q==
X-Received: by 2002:a05:6512:3da0:b0:4fd:faa2:884c with SMTP id
 k32-20020a0565123da000b004fdfaa2884cmr5901431lfv.29.1692620105055; 
 Mon, 21 Aug 2023 05:15:05 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 p28-20020ac246dc000000b004ff9ea1ad91sm1700132lfo.216.2023.08.21.05.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 05:15:04 -0700 (PDT)
Date: Mon, 21 Aug 2023 15:15:02 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Rohan G Thomas <rohan.g.thomas@intel.com>
Message-ID: <yayy6d3zfewgljwstunyl44qgsco3t5kdipbbb2sibx65honva@jobrmiqnhnhx>
References: <20230819023132.23082-1-rohan.g.thomas@intel.com>
 <20230819023132.23082-3-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230819023132.23082-3-rohan.g.thomas@intel.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 2/2] net: stmmac: Tx coe sw
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

On Sat, Aug 19, 2023 at 10:31:32AM +0800, Rohan G Thomas wrote:
> Add sw fallback of tx checksum calculation for those tx queues that
> don't support tx checksum offloading. Because, some DWMAC IPs support
> tx checksum offloading only for a few initial tx queues, starting
> from tx queue 0.
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>

LGTM,
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 ++++++++++++++++++
>  .../ethernet/stmicro/stmmac/stmmac_platform.c  |  4 ++++
>  include/linux/stmmac.h                         |  1 +
>  3 files changed, 23 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 733b5e900817..3ffef45a2861 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4409,6 +4409,16 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
>  	WARN_ON(tx_q->tx_skbuff[first_entry]);
>  
>  	csum_insertion = (skb->ip_summed == CHECKSUM_PARTIAL);
> +	/* Some DWMAC IPs support tx coe only for a few initial tx queues,
> +	 * starting from tx queue 0. So checksum offloading for those queues
> +	 * that don't support tx coe needs to fallback to software checksum
> +	 * calculation.
> +	 */
> +	if (csum_insertion && queue >= priv->plat->tx_queues_with_coe) {
> +		if (unlikely(skb_checksum_help(skb)))
> +			goto dma_map_err;
> +		csum_insertion = !csum_insertion;
> +	}
>  
>  	if (likely(priv->extend_desc))
>  		desc = (struct dma_desc *)(tx_q->dma_etx + entry);
> @@ -7401,6 +7411,14 @@ int stmmac_dvr_probe(struct device *device,
>  		dev_info(priv->device, "SPH feature enabled\n");
>  	}
>  
> +	if (priv->plat->tx_coe && !priv->plat->tx_queues_with_coe)
> +		priv->plat->tx_queues_with_coe = priv->plat->tx_queues_to_use;
> +	else if (!priv->plat->tx_coe)
> +		priv->plat->tx_queues_with_coe = 0;
> +	else if (priv->plat->tx_queues_with_coe < priv->plat->tx_queues_to_use)
> +		dev_info(priv->device, "TX COE only available for %u queues\n",
> +			 priv->plat->tx_queues_with_coe);
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
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
