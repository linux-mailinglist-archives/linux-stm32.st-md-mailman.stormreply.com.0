Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C520B81CF96
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Dec 2023 22:56:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 737C3C6B477;
	Fri, 22 Dec 2023 21:56:51 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74A5FC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 21:56:50 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2cc4029dc6eso27419781fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 13:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703282209; x=1703887009;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5Mc4RBdrTIsg9v7kQI4wrbgPnTmbysRGhL3z9WVMn0Q=;
 b=cpmUv94LsyL9Bn70imNUtk7JXKGvJLo63JbdF884isRp6WUNe7g4Ou0G1pAIdZiU66
 GbbZzKiheigNzF0p/thhNKyE9LP5Uap84kOWE03qsA856D4aHWrjcsqdkfgGQdjxu96Q
 5vsdzpcSKGtbAk2fPR0pukcyr0NR4NrH4I9DQq7HYdK5kItzG5usUn3Qj4A+F3uCxPUz
 JZ9//cYjrnY/GD+wI6XeC5DVvTpGEmHyvIRNS0MVRubgj4uS8QwDOhlvIOlgWe5NNjYc
 nyfAAJRn/Pgth1I8OfVIVYUh1AEsaOtUxaF57q4B5155dxkhBUo0lwmTG7SBVBvvy6fN
 4ebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703282209; x=1703887009;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Mc4RBdrTIsg9v7kQI4wrbgPnTmbysRGhL3z9WVMn0Q=;
 b=GYoIXErhj/0kN2+wytt9/u8jGaheoHACXEibxK2fTT8XP0gEuxsmKHXRBbzm1GcU1L
 S7Go62heVpXywwIIxFv/pv7+XchdexH2aD+hBce6l/UeAEXVwYud40r8y8ybJ+LT+LIn
 aM6TytrWH30Tsh15Ed6qcIohcK9a8jPe/3o1sojlNj1YKcLrMs1pb4rtW9X8jGtWxIOm
 fItzSHLYHyLsZxBV5xhFJpEYyIjDHUv6zEd11zw8laVNetO9prR8MHLSDQXz51A2dEFq
 TzbEp8UwhN92+vncmtlcW3xBtbbmGwR4MK+YvnYdCwxZtj1AlEEzPdu/73MjV6HGjkUZ
 Bgsw==
X-Gm-Message-State: AOJu0Yy2rsMPjrVljkxNcIhEgeWETq0yPnZUYDIzPpppSMrIHqxt5Sp2
 4NVN2mnWIzj7GIASuYxc9QI=
X-Google-Smtp-Source: AGHT+IEBqb6aBSiNjefugxbF5FxM+uS4ON7a8MJONhwTjEhYFmhSAQyyPuQO/gFlPYroXZ7/7kRJdg==
X-Received: by 2002:a05:6512:158d:b0:50e:6b4f:9809 with SMTP id
 bp13-20020a056512158d00b0050e6b4f9809mr928408lfb.20.1703282209390; 
 Fri, 22 Dec 2023 13:56:49 -0800 (PST)
Received: from mobilestation ([95.79.203.166])
 by smtp.gmail.com with ESMTPSA id
 bi30-20020a0565120e9e00b0050e5909db5fsm640342lfb.113.2023.12.22.13.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 13:56:48 -0800 (PST)
Date: Sat, 23 Dec 2023 00:56:46 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Leong Ching Swee <leong.ching.swee@intel.com>
Message-ID: <prjrrsznvpnbanseqttqgtu3s6kgillyyhs5hozwxwh4kt7eiv@zmups3rcbvby>
References: <20231222054451.2683242-1-leong.ching.swee@intel.com>
 <20231222054451.2683242-5-leong.ching.swee@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231222054451.2683242-5-leong.ching.swee@intel.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Teoh Ji Sheng <ji.sheng.teoh@intel.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 4/4] net: stmmac: Use
 interrupt mode INTM=1 for per channel irq
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

On Fri, Dec 22, 2023 at 01:44:51PM +0800, Leong Ching Swee wrote:
> From: Swee Leong Ching <leong.ching.swee@intel.com>
> 
> Enable per DMA channel interrupt that uses shared peripheral
> interrupt (SPI), so only per channel TX and RX intr (TI/RI)
> are handled by TX/RX ISR without calling common interrupt ISR.
> 
> Signed-off-by: Teoh Ji Sheng <ji.sheng.teoh@intel.com>
> Signed-off-by: Swee Leong Ching <leong.ching.swee@intel.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  3 ++
>  .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    | 32 +++++++++++--------
>  2 files changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> index 207ff1799f2c..04bf731cb7ea 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> @@ -346,6 +346,9 @@
>  /* DMA Registers */
>  #define XGMAC_DMA_MODE			0x00003000
>  #define XGMAC_SWR			BIT(0)
> +#define XGMAC_DMA_MODE_INTM_MASK	GENMASK(13, 12)
> +#define XGMAC_DMA_MODE_INTM_SHIFT	12
> +#define XGMAC_DMA_MODE_INTM_MODE1	0x1
>  #define XGMAC_DMA_SYSBUS_MODE		0x00003004
>  #define XGMAC_WR_OSR_LMT		GENMASK(29, 24)
>  #define XGMAC_WR_OSR_LMT_SHIFT		24
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> index 3cde695fec91..dcb9f094415d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> @@ -31,6 +31,13 @@ static void dwxgmac2_dma_init(void __iomem *ioaddr,
>  		value |= XGMAC_EAME;
>  
>  	writel(value, ioaddr + XGMAC_DMA_SYSBUS_MODE);
> +
> +	if (dma_cfg->multi_irq_en) {
> +		value = readl(ioaddr + XGMAC_DMA_MODE);
> +		value &= ~XGMAC_DMA_MODE_INTM_MASK;
> +		value |= (XGMAC_DMA_MODE_INTM_MODE1 << XGMAC_DMA_MODE_INTM_SHIFT);
> +		writel(value, ioaddr + XGMAC_DMA_MODE);
> +	}
>  }
>  
>  static void dwxgmac2_dma_init_chan(struct stmmac_priv *priv,
> @@ -365,19 +372,18 @@ static int dwxgmac2_dma_interrupt(struct stmmac_priv *priv,
>  	}
>  

>  	/* TX/RX NORMAL interrupts */
> -	if (likely(intr_status & XGMAC_NIS)) {
> -		if (likely(intr_status & XGMAC_RI)) {
> -			u64_stats_update_begin(&rxq_stats->syncp);
> -			rxq_stats->rx_normal_irq_n++;
> -			u64_stats_update_end(&rxq_stats->syncp);
> -			ret |= handle_rx;
> -		}
> -		if (likely(intr_status & (XGMAC_TI | XGMAC_TBU))) {
> -			u64_stats_update_begin(&txq_stats->syncp);
> -			txq_stats->tx_normal_irq_n++;
> -			u64_stats_update_end(&txq_stats->syncp);
> -			ret |= handle_tx;
> -		}
> +	if (likely(intr_status & XGMAC_RI)) {
> +		u64_stats_update_begin(&rxq_stats->syncp);
> +		rxq_stats->rx_normal_irq_n++;
> +		u64_stats_update_end(&rxq_stats->syncp);
> +		ret |= handle_rx;
> +	}
> +
> +	if (likely(intr_status & (XGMAC_TI | XGMAC_TBU))) {
> +		u64_stats_update_begin(&txq_stats->syncp);
> +		txq_stats->tx_normal_irq_n++;
> +		u64_stats_update_end(&txq_stats->syncp);
> +		ret |= handle_tx;

Could you please clarify my comment to the original patch:

On Fri, Aug 18, 2023 at 20:10:21PM +0300, Serge Semin wrote:
> Just curious. Is this change really necessary seeing NIS IRQ is
> unmasked and it is unmasked-OR of the RI/TI/TBU flags in the
> DMA_CHx_Status register? Moreover based on the HW manual,
> DMA_CHx_Status reflects raw IRQ flags status except NIS and AIS which
> are the masked OR of the respective flags. So AFAIU NIS will be set in
> anyway if you have RI/TI/TBU IRQs enabled.

-Serge(y)

>  	}
>  
>  	/* Clear interrupts */
> -- 
> 2.34.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
