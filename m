Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BB0781147
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 19:10:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53BDEC6B461;
	Fri, 18 Aug 2023 17:10:27 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B00C1C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 17:10:25 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-4fe85fd3d27so1810295e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 10:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692378625; x=1692983425;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qZncaXQLSh9js0I4WjpTSahy4Bvx67wGvUaNA9X9QL4=;
 b=mWiVtgsWZW2NgtZV2B1VWpSdYomDbnE5IM3I8NwhrcqW1ICl6KDFCrHBvLEuRWsiw4
 h68dv3P2mof7Uvn0W27wQKaU+szILp/iQk+ZZ7NCHMVhJhaaxYk1+a6IgcFBFaY8cReV
 hvVjg6Cg+nEmYiod4CbK7H4JM4/8z4fuiu3u9xolueCbV5aqABwD/8/5V7g2I2feoYCR
 G5ILCR+KA5LzRYlbIJJR4nNGFEdPFRL7j0QSshp/zTF4GjzyaXgW7MjbGUrCcX5PuhQv
 Ye3hwRCyudxym7NAyPZZLQ5am6U3HSWki/kp7aWRPkMXCwRq46p0gkXyFdFG+B5oJG4d
 a9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692378625; x=1692983425;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qZncaXQLSh9js0I4WjpTSahy4Bvx67wGvUaNA9X9QL4=;
 b=QVXxmXMTVg8FNKN/aUxYs+TSo/Q9nia4QpPLVFNOFbXf8vsEAxczVJD9Uzl9qa5CAV
 7ooybe0hi4AVHnZ48aPtLAP73+TEvuQngXuGoVzJ5pcG+DST51vfnx5cpgzRenrdOoQK
 Vwrwps1MxXERA1EFqMupY9gWzXHHAsH/jLw2K6RU+hLVPxP4pZdxQ8VWuCBhXxBti5nd
 GqJvvkEfXmR/IW46s8NCV68KKmWvxmQReuz4xMb+kxtLda+fsXC7D5Q+yUmyV5qyFzd4
 xIVkmbPKoGbgxCE2OYp9xd6F/uRdqvAss1i608vW47lFetNLMm7KMeUWoUzojcSEjTHy
 acNA==
X-Gm-Message-State: AOJu0Yx6QiAUXsa4qjru0SioDhNzyeeXabSq+pfTyAuvt7lrm/g73YYy
 uaVCww+1rjJzt3toG/B++ts=
X-Google-Smtp-Source: AGHT+IHsEr3WOE514VOmtMPl7fzHNR2vgMsIyU//tQb/ScBsu4i9rGSZix1w2kzZUdJX/qwEfDWk5Q==
X-Received: by 2002:a05:6512:477:b0:4f8:49a7:2deb with SMTP id
 x23-20020a056512047700b004f849a72debmr2118416lfd.8.1692378624613; 
 Fri, 18 Aug 2023 10:10:24 -0700 (PDT)
Received: from mobilestation ([93.157.254.210])
 by smtp.gmail.com with ESMTPSA id
 v20-20020ac25934000000b004faf6a87d63sm417332lfi.38.2023.08.18.10.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 10:10:24 -0700 (PDT)
Date: Fri, 18 Aug 2023 20:10:21 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <k57laovdsomy4eblyu5neujkkcqinitfmdvojcph3zh2ygn4jt@iton4m73y6nz>
References: <20230817165749.672-1-jszhang@kernel.org>
 <20230817165749.672-6-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230817165749.672-6-jszhang@kernel.org>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 5/9] net: stmmac: xgmac:
 support per-channel irq
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

On Fri, Aug 18, 2023 at 12:57:45AM +0800, Jisheng Zhang wrote:
> The IP supports per channel interrupt, add support for this usage case.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  2 ++
>  .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    | 33 +++++++++++--------
>  2 files changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> index 7f68bef456b7..18a042834d75 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> @@ -340,6 +340,8 @@
>  
>  /* DMA Registers */
>  #define XGMAC_DMA_MODE			0x00003000
> +#define XGMAC_INTM			GENMASK(13, 12)
> +#define XGMAC_INTM_MODE1		0x1
>  #define XGMAC_SWR			BIT(0)
>  #define XGMAC_DMA_SYSBUS_MODE		0x00003004
>  #define XGMAC_WR_OSR_LMT		GENMASK(29, 24)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> index 1ef8fc132c2d..ce228c362403 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> @@ -31,6 +31,13 @@ static void dwxgmac2_dma_init(void __iomem *ioaddr,
>  		value |= XGMAC_EAME;
>  
>  	writel(value, ioaddr + XGMAC_DMA_SYSBUS_MODE);
> +
> +	if (dma_cfg->perch_irq_en) {
> +		value = readl(ioaddr + XGMAC_DMA_MODE);
> +		value &= ~XGMAC_INTM;
> +		value |= FIELD_PREP(XGMAC_INTM, XGMAC_INTM_MODE1);
> +		writel(value, ioaddr + XGMAC_DMA_MODE);
> +	}
>  }
>  
>  static void dwxgmac2_dma_init_chan(struct stmmac_priv *priv,
> @@ -365,20 +372,20 @@ static int dwxgmac2_dma_interrupt(struct stmmac_priv *priv,
>  	}
>  
>  	/* TX/RX NORMAL interrupts */

> -	if (likely(intr_status & XGMAC_NIS)) {
> -		if (likely(intr_status & XGMAC_RI)) {
> -			u64_stats_update_begin(&rx_q->rxq_stats.syncp);
> -			rx_q->rxq_stats.rx_normal_irq_n++;
> -			u64_stats_update_end(&rx_q->rxq_stats.syncp);
> -			ret |= handle_rx;
> -		}
> -		if (likely(intr_status & (XGMAC_TI | XGMAC_TBU))) {
> -			u64_stats_update_begin(&tx_q->txq_stats.syncp);
> -			tx_q->txq_stats.tx_normal_irq_n++;
> -			u64_stats_update_end(&tx_q->txq_stats.syncp);
> -			ret |= handle_tx;
> -		}
> +	if (likely(intr_status & XGMAC_RI)) {
> +		u64_stats_update_begin(&rx_q->rxq_stats.syncp);
> +		rx_q->rxq_stats.rx_normal_irq_n++;
> +		u64_stats_update_end(&rx_q->rxq_stats.syncp);
> +		ret |= handle_rx;
> +	}
> +	if (likely(intr_status & XGMAC_TI)) {
> +		u64_stats_update_begin(&tx_q->txq_stats.syncp);
> +		tx_q->txq_stats.tx_normal_irq_n++;
> +		u64_stats_update_end(&tx_q->txq_stats.syncp);
> +		ret |= handle_tx;
>  	}
> +	if (unlikely(intr_status & XGMAC_TBU))
> +		ret |= handle_tx;

Just curious. Is this change really necessary seeing NIS IRQ is
unmasked and it is unmasked-OR of the RI/TI/TBU flags in the
DMA_CHx_Status register? Moreover based on the HW manual,
DMA_CHx_Status reflects raw IRQ flags status except NIS and AIS which
are the masked OR of the respective flags. So AFAIU NIS will be set in
anyway if you have RI/TI/TBU IRQs enabled.

-Serge(y)

>  
>  	/* Clear interrupts */
>  	writel(intr_en & intr_status, ioaddr + XGMAC_DMA_CH_STATUS(chan));
> -- 
> 2.40.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
