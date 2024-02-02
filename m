Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFA7847BEB
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Feb 2024 22:58:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2810C6DD9F;
	Fri,  2 Feb 2024 21:58:43 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDA7AC6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Feb 2024 21:58:42 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-51124db6cf0so1488432e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Feb 2024 13:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706911122; x=1707515922;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=E39dEMdG0r2fMpEBTkdZZwQ7jTYMRj0NqErtFuymXG4=;
 b=FuFEaPVmBl8nP62E9tmRhbKO9IVycNO0J/GphUq3Umu4vq+9kIIYE6XwzlIjSnxffW
 CE2jgqfoivBWgxsZhRdWLFykzLiF+2P5ptkhxmFvVg7XD+m/pAT/v2mYFvXYijTRZ2R9
 ug7ZgaGCQiwF3xr97/rFketNyRV1x049eLXAMyY30qWpi9Y3uJViyL/TRDDvS2vudnLj
 B3DyM0tYlGXGDfg/7GWo3g9lnl3HdjSM7q11jKlTZ8rsuo8Aw4BsNkRKYGnGd1ombsMr
 7WGqJjsGUEPyDCyBGt8+wqLhFOlOYq7/+jv5xsoNyER6nOaHAZ6wdlJ4pHA1DluRiw3J
 I7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706911122; x=1707515922;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E39dEMdG0r2fMpEBTkdZZwQ7jTYMRj0NqErtFuymXG4=;
 b=cyslrKgb8SknXy3Stxgua2OyYGjMylXcbC/NqKM8F4PBaSNCddeXpLwa4PIFxg9f6H
 BOXmwPXOmxItqotgbubhn9Yylp9F0N7mIyphfXIPqlNXF5eBywUvrdMhAv1P0qV25VPZ
 nP4iczkZgATsc6W+IaeiuiUdBPgQ04Y3a8GD9fF29eChWuSMRhesRDlRVt1LL6F7a2z2
 ktA5qXAfP9cMW3EpPZjns+fUC3sTE3NUZAdaGIiFzBly7etSOusMG+4OfwNs2aMvjvZ6
 hEddfKrAQ62DslZP2e5ypY90+CGI8j8s5IEeoEUslThoBGWuuvgDu44HYd2Csmo0BTYm
 Bw5g==
X-Gm-Message-State: AOJu0Yxz3bDU8fAlu5lXVVwy5zo4035HwgmlXe2M2JwtYi2bO1jbVQGQ
 Sm/rJUEufp4I6Wb/glIkIrTmRTw2kKmR3+V7xW2MqF5wSlBqEIqS
X-Google-Smtp-Source: AGHT+IFh/Jf6hZ5Vd5yjSlGVUByuXTqyJ5TuyPRxKtHqX2Czd1rY63m0hTtERJPqN5BAEQldRR3xlg==
X-Received: by 2002:a19:641c:0:b0:510:24dc:aa8f with SMTP id
 y28-20020a19641c000000b0051024dcaa8fmr87881lfb.14.1706911121776; 
 Fri, 02 Feb 2024 13:58:41 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCV4/mhmdTBnHJjXi9UYlDEK/W41Atpdj0exzH9ziHik/17Uh0o+kqMY39Cbw3Eo+3JaPLKJMUOC9VRBJVmxyKsRfpNKdO1eg4QVIi2IkY9T6koAKFNrlxDIOGM9q5XBgMoQAuhNJV30UCGLffnJyAteYBLrHOyGSpw9DKft6DzNGRkFpn5EZW1WZBUPKLRwT53kdUPjAILAsu/JZf9lH4B03bg7O0lalXXTF/f7VkwkgeLywImeFcOWECnsWoW/LLnyHfZWudQ9Gzq2cp+2Fk+N4OZc+vp9Tyfrhb3IKhgIT72G/G1uAw/AutFw6SSDemJPEnf/H46cfInopW5EN6fyEmx7FE+lsTTh4cgJOvR+s+0Tt6rpD08B5jNOzfpjHKD6AjTzJ3ttpVDSP4RPC7dv9+doRRgSp6oMLsSQNaMbdrjuFffApuPcLHprjY9jvvvN1l/MKhsd20cNUzXagP6SSwbQsuf4bKpELDRY6B/8gbqHKsSrKhXQAkdQCg==
Received: from mobilestation ([95.79.203.166])
 by smtp.gmail.com with ESMTPSA id
 a24-20020a05651c211800b002ca092c194asm387382ljq.13.2024.02.02.13.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 13:58:41 -0800 (PST)
Date: Sat, 3 Feb 2024 00:58:39 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Furong Xu <0x1207@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>
Message-ID: <ksfs7uag4yukqbeygch7pxvr5axyrqz4gunq2xes3ppmtrgm5b@hwh5yx5qz3wl>
References: <20240131020828.2007741-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240131020828.2007741-1-0x1207@gmail.com>
Cc: Simon Horman <horms@kernel.org>, Joao Pinto <jpinto@synopsys.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net v3] net: stmmac: xgmac: fix handling
 of DPP safety error for DMA channels
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

On Wed, Jan 31, 2024 at 10:08:28AM +0800, Furong Xu wrote:
> Commit 56e58d6c8a56 ("net: stmmac: Implement Safety Features in
> XGMAC core") checks and reports safety errors, but leaves the
> Data Path Parity Errors for each channel in DMA unhandled at all, lead to
> a storm of interrupt.
> Fix it by checking and clearing the DMA_DPP_Interrupt_Status register.
> 
> Fixes: 56e58d6c8a56 ("net: stmmac: Implement Safety Features in XGMAC core")
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
> Changes in v3:
>  - code style fix, thanks Paolo Abeni
> 
> Changes in v2:
>   - explicit enable Data Path Parity Protection
>   - add new counters to stmmac_safety_stats
>   - add detailed log
> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
>  .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  3 +
>  .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 57 ++++++++++++++++++-
>  3 files changed, 60 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index 721c1f8e892f..b4f60ab078d6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -216,6 +216,7 @@ struct stmmac_safety_stats {
>  	unsigned long mac_errors[32];
>  	unsigned long mtl_errors[32];
>  	unsigned long dma_errors[32];
> +	unsigned long dma_dpp_errors[32];
>  };
>  
>  /* Number of fields in Safety Stats */
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> index 207ff1799f2c..5c67a3f89f08 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> @@ -303,6 +303,8 @@
>  #define XGMAC_RXCEIE			BIT(4)
>  #define XGMAC_TXCEIE			BIT(0)
>  #define XGMAC_MTL_ECC_INT_STATUS	0x000010cc
> +#define XGMAC_MTL_DPP_CONTROL		0x000010e0

> +#define XGMAC_DDPP_DISABLE		BIT(0)

Is the double "D" a typo? Shouldn't this be XGMAC_DPP_DISABLE or just
XGMAC_DDPP (if the "DDPP" means "Disable DPP")?

If so, David/Jakub, is it possible to rebase the branch with the macro
fixed in the commit or a new cleanup patch is the only option?

Other than the nit above no more notes from my side:

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

>  #define XGMAC_MTL_TXQ_OPMODE(x)		(0x00001100 + (0x80 * (x)))
>  #define XGMAC_TQS			GENMASK(25, 16)
>  #define XGMAC_TQS_SHIFT			16
> @@ -385,6 +387,7 @@
>  #define XGMAC_DCEIE			BIT(1)
>  #define XGMAC_TCEIE			BIT(0)
>  #define XGMAC_DMA_ECC_INT_STATUS	0x0000306c
> +#define XGMAC_DMA_DPP_INT_STATUS	0x00003074
>  #define XGMAC_DMA_CH_CONTROL(x)		(0x00003100 + (0x80 * (x)))
>  #define XGMAC_SPH			BIT(24)
>  #define XGMAC_PBLx8			BIT(16)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index eb48211d9b0e..04d7c4dc2e35 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> @@ -830,6 +830,43 @@ static const struct dwxgmac3_error_desc dwxgmac3_dma_errors[32]= {
>  	{ false, "UNKNOWN", "Unknown Error" }, /* 31 */
>  };
>  
> +static const char * const dpp_rx_err = "Read Rx Descriptor Parity checker Error";
> +static const char * const dpp_tx_err = "Read Tx Descriptor Parity checker Error";
> +static const struct dwxgmac3_error_desc dwxgmac3_dma_dpp_errors[32] = {
> +	{ true, "TDPES0", dpp_tx_err },
> +	{ true, "TDPES1", dpp_tx_err },
> +	{ true, "TDPES2", dpp_tx_err },
> +	{ true, "TDPES3", dpp_tx_err },
> +	{ true, "TDPES4", dpp_tx_err },
> +	{ true, "TDPES5", dpp_tx_err },
> +	{ true, "TDPES6", dpp_tx_err },
> +	{ true, "TDPES7", dpp_tx_err },
> +	{ true, "TDPES8", dpp_tx_err },
> +	{ true, "TDPES9", dpp_tx_err },
> +	{ true, "TDPES10", dpp_tx_err },
> +	{ true, "TDPES11", dpp_tx_err },
> +	{ true, "TDPES12", dpp_tx_err },
> +	{ true, "TDPES13", dpp_tx_err },
> +	{ true, "TDPES14", dpp_tx_err },
> +	{ true, "TDPES15", dpp_tx_err },
> +	{ true, "RDPES0", dpp_rx_err },
> +	{ true, "RDPES1", dpp_rx_err },
> +	{ true, "RDPES2", dpp_rx_err },
> +	{ true, "RDPES3", dpp_rx_err },
> +	{ true, "RDPES4", dpp_rx_err },
> +	{ true, "RDPES5", dpp_rx_err },
> +	{ true, "RDPES6", dpp_rx_err },
> +	{ true, "RDPES7", dpp_rx_err },
> +	{ true, "RDPES8", dpp_rx_err },
> +	{ true, "RDPES9", dpp_rx_err },
> +	{ true, "RDPES10", dpp_rx_err },
> +	{ true, "RDPES11", dpp_rx_err },
> +	{ true, "RDPES12", dpp_rx_err },
> +	{ true, "RDPES13", dpp_rx_err },
> +	{ true, "RDPES14", dpp_rx_err },
> +	{ true, "RDPES15", dpp_rx_err },
> +};
> +
>  static void dwxgmac3_handle_dma_err(struct net_device *ndev,
>  				    void __iomem *ioaddr, bool correctable,
>  				    struct stmmac_safety_stats *stats)
> @@ -841,6 +878,13 @@ static void dwxgmac3_handle_dma_err(struct net_device *ndev,
>  
>  	dwxgmac3_log_error(ndev, value, correctable, "DMA",
>  			   dwxgmac3_dma_errors, STAT_OFF(dma_errors), stats);
> +
> +	value = readl(ioaddr + XGMAC_DMA_DPP_INT_STATUS);
> +	writel(value, ioaddr + XGMAC_DMA_DPP_INT_STATUS);
> +
> +	dwxgmac3_log_error(ndev, value, false, "DMA_DPP",
> +			   dwxgmac3_dma_dpp_errors,
> +			   STAT_OFF(dma_dpp_errors), stats);
>  }
>  
>  static int
> @@ -881,6 +925,12 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
>  	value |= XGMAC_TMOUTEN; /* FSM Timeout Feature */
>  	writel(value, ioaddr + XGMAC_MAC_FSM_CONTROL);
>  
> +	/* 5. Enable Data Path Parity Protection */
> +	value = readl(ioaddr + XGMAC_MTL_DPP_CONTROL);
> +	/* already enabled by default, explicit enable it again */
> +	value &= ~XGMAC_DDPP_DISABLE;
> +	writel(value, ioaddr + XGMAC_MTL_DPP_CONTROL);
> +
>  	return 0;
>  }
>  
> @@ -914,7 +964,11 @@ static int dwxgmac3_safety_feat_irq_status(struct net_device *ndev,
>  		ret |= !corr;
>  	}
>  
> -	err = dma & (XGMAC_DEUIS | XGMAC_DECIS);
> +	/* DMA_DPP_Interrupt_Status is indicated by MCSIS bit in
> +	 * DMA_Safety_Interrupt_Status, so we handle DMA Data Path
> +	 * Parity Errors here
> +	 */
> +	err = dma & (XGMAC_DEUIS | XGMAC_DECIS | XGMAC_MCSIS);
>  	corr = dma & XGMAC_DECIS;
>  	if (err) {
>  		dwxgmac3_handle_dma_err(ndev, ioaddr, corr, stats);
> @@ -930,6 +984,7 @@ static const struct dwxgmac3_error {
>  	{ dwxgmac3_mac_errors },
>  	{ dwxgmac3_mtl_errors },
>  	{ dwxgmac3_dma_errors },
> +	{ dwxgmac3_dma_dpp_errors },
>  };
>  
>  static int dwxgmac3_safety_feat_dump(struct stmmac_safety_stats *stats,
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
