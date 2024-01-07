Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B69D8265F8
	for <lists+linux-stm32@lfdr.de>; Sun,  7 Jan 2024 21:52:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4599C6B476;
	Sun,  7 Jan 2024 20:52:15 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF80BC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 Jan 2024 20:52:14 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-50eac018059so1322197e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 07 Jan 2024 12:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704660734; x=1705265534;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=e5PMeecEEo3AqtvbhWJChBGMmTa++0S5sl1/vnCPNtk=;
 b=J8Hpr3l3oMecuStIDXCGrnWUD1M2tOvooUlcfbruzadSkZ4r/aUoGI2rUPNxJcAj9j
 Yu6Oxsch1rUqG1gmT+2tfwF0OQG2hsu0wWqWEpd8Ww32uJW/+WDCMWlIhw7qrlqTYa7P
 t34J9bS5ciENKFkiTPIRT+x1JqlgMEFw9TBzFxKd49+Uj+ogTbo2bbfagh7VjTlJ0CGQ
 Zq4tRdHId2/FkGCSdxRUgBpVPzBEYo+pNjPFSyt+4xvRErZTaMDcdtRSqgG7h4RID42n
 66IuGXzljw/eigXFElZcSUD+e3q0isrH8D/C6zebZoXMXXeUfatEMW5iHMorXEeRmg8o
 qygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704660734; x=1705265534;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e5PMeecEEo3AqtvbhWJChBGMmTa++0S5sl1/vnCPNtk=;
 b=n2rxgBGr0sdFSNyRIApxzepuabsJ0JkOedy/kYZy0cSRB85V7VqtC2A5JAPWiZ+pKA
 K2Jn3YwyzTY3XH49YCnP8biUuRLNx28txZGuyIyAGoEBA9fvK7JUQooH0nv6J280ZERp
 tveGWB4I6yxvt2/rGWnqvqT1XrR1dzijFMT/3Gp9f2UJ5hKwxACLIKiMMvW3/2poyb+H
 kf+dPSm/raYpm6Xx1i2GvNww7fbgcJXMcmIqhYymEuPEoKQttkzLPmbjaAf5t8Jz6mbU
 zwwVd5otwqFe030ufgz+IjnmzD/BmqxY8JP7UpQxoofnZLUVbLKOSr1CPkuKPW2IJ7gl
 WK7g==
X-Gm-Message-State: AOJu0Yx5H7WtI6zj6P7WaeCCorUa+SpVHseEv5U7GlUvjQoRcesMoBiq
 6xb8zFa9zQi0iLUuN831gW8=
X-Google-Smtp-Source: AGHT+IGJQYWRpMRV/Lg31RH/oBbOsUP/kNiVqW8GI/ctj2lJw+LfzVDraxmhGM4BQagSFwFrbPuZTg==
X-Received: by 2002:a05:6512:3d05:b0:50e:56b6:593e with SMTP id
 d5-20020a0565123d0500b0050e56b6593emr1380348lfv.89.1704660733959; 
 Sun, 07 Jan 2024 12:52:13 -0800 (PST)
Received: from mobilestation ([95.79.203.166])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a19ca08000000b0050e810689e5sm950590lfg.33.2024.01.07.12.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 12:52:13 -0800 (PST)
Date: Sun, 7 Jan 2024 23:52:11 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Leong Ching Swee <leong.ching.swee@intel.com>
Message-ID: <jvnoq2jo3dzsw3vuqzathjuyox3xipaullzeaur3ppzlmtux5k@v64tckj7pvo2>
References: <20240105070925.2948871-1-leong.ching.swee@intel.com>
 <20240105070925.2948871-5-leong.ching.swee@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240105070925.2948871-5-leong.ching.swee@intel.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Teoh Ji Sheng <ji.sheng.teoh@intel.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 4/4] net: stmmac: Use
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

On Fri, Jan 05, 2024 at 03:09:25PM +0800, Leong Ching Swee wrote:
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

AFAICS the DW XGMAC module doesn't maintain a convention of having the
CSR fields macro names prefixed with the CSR name. Let's drop the
DMA_MODE suffix from the macro name then:
+#define XGMAC_INTM_MASK		GENMASK(13, 12)
+#define XGMAC_INTM_SHIFT		12
+#define XGMAC_INTM_MODE1		0x1
to have it unified with the rest of the macros in dwxgmac2.h.

Other than that the change looks good. Thanks.

-Serge(y)

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
