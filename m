Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DD6A48EE5
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Feb 2025 03:52:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFD37CFAC47;
	Fri, 28 Feb 2025 02:52:14 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3427FCFAC45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2025 02:52:13 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-223594b3c6dso24740595ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 18:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740711132; x=1741315932;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=boGNm2RHbfdjeQuZKJQLhCH8tI0ZaSHF+L70lDAp7g0=;
 b=KY3UUCZc9i3fd8p0xayl36AFR03l2j7uamn4yFIqt3guxdTKkWdlt4OvmN1q6BHaLy
 j7ayT/C1j5qz7MfksikAguTrYPOSWqFGWaAujBB5teKZH68Cp1KB6yrE/ECSl3PXY+yI
 kXgctTJDS/5/PpLjGUjULeEa2suQsSsq9GGgAyInR+ZdsN7Y9q6YkJPluDMvAniHLYY4
 KGm9ZfgayvF/d3JaqIh6DHWBhmTkfL8Hr0fa0Mf+wjhXJWYIGIoauRHHULeyAsrCrPQi
 a8SXsReCMrLlKDp7vbFGYLbyIbvn1RQ5CCiAsY5p6XQtK6KniIKpKjS8iRDuHEYO/zbc
 ScZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740711132; x=1741315932;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=boGNm2RHbfdjeQuZKJQLhCH8tI0ZaSHF+L70lDAp7g0=;
 b=CXtDSPxGWlWLF7D/zz7A/slRmnW2A+Rkvdpx+9P1fzWkhuZdyGKDT/fGQA8ibm0LyH
 UhygJ/kdbG2BedgT224ob+kE1fDViPgwtvRDhHjS6mFFEpQ11WGeKgj6MQCwb17NiT7o
 mT3x/PIgxgOGDOcImC87JJdDrQFKzIymYUfUCygaaErUTjHp2OiMkhyTUGj1MuBQxukQ
 vL0IVvZbO4xoOk0JdPjNddV77iJuvI/a/rY+wBojq2lP9W7jJllobgvq7/dk2QJQXOHu
 GjzIDTqLi1G1Nyk0TLL1S6E8TZtOry5/70sldE3HAo2oqEjmfncvginEz1OR9+GoEcvv
 9fsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN/nL42fAcliZwd3asnGfa3Q8LoRAAsebypNTo9/lt2uD7OKebDX2+MFWRVX+XVrsNO4cF1rJIfzZjqA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw8u3grZZPiTqtM5FZTKhXlXa4e7PxsaUpfh+b+1tIitbZcXGZQ
 vc+iSu4DN3sjN7uPJVkMGCa0Owghj/suNOjnAUB2bcI/SbP48z042kp1yg==
X-Gm-Gg: ASbGncufcuyYpJiE2Co8LJp97mduxRPrWEn2d66KUk94Co4KnTOakrrVN9Kr9y2a3r2
 KsNvRdUkn9A8K0i42T8pfguMpj8JPz8QOzhrh0X1aUB1KHrdbG7wH/AgxvUwGjwjutEhQFfs6lx
 nVCr2j0Emw/mrWPYMZI3rWpjTyDmAu4rrGeeQhZ0wo3aSaG3omFVMqAGshoQbMAyW82KQHPnmC0
 n7kPhCtEAPxD1x+qEbS40bduSXC91gCAmB7t8erGMefOyAzpwh22kaP2NtJGn5oX85oCuU5zajA
 ABENBYElCHIlLmeILJG+z3Y=
X-Google-Smtp-Source: AGHT+IGQJlnrpGPiZBb33hDJef87VPOt8uSo1pNSRv/iEORfCM/cnXJBkr2516ecg+lJIS6ML0/RpQ==
X-Received: by 2002:a17:903:244d:b0:215:9470:7e82 with SMTP id
 d9443c01a7336-22368f71b7amr24670965ad.4.1740711131676; 
 Thu, 27 Feb 2025 18:52:11 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501d287dsm23054945ad.43.2025.02.27.18.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 18:52:11 -0800 (PST)
Date: Fri, 28 Feb 2025 10:52:02 +0800
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250228105202.0000635f@gmail.com>
In-Reply-To: <E1tnfRt-0057SR-Hx@rmk-PC.armlinux.org.uk>
References: <Z8B-DPGhuibIjiA7@shell.armlinux.org.uk>
 <E1tnfRt-0057SR-Hx@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Thierry Reding <treding@nvidia.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jon Hunter <jonathanh@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 4/5] net: stmmac: remove _RE
 and _TE in (start|stop)_(tx|rx)() methods
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

On Thu, 27 Feb 2025 15:05:17 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Remove fiddling with _TE and _RE in the GMAC control register in the
> start_tx/stop_tx/start_rx/stop_rx() methods as this should be handled
> by phylink and not during initialisation.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c   |  8 --------
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 12 ------------
>  2 files changed, 20 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> index 57c03d491774..61584b569be7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> @@ -50,10 +50,6 @@ void dwmac4_dma_start_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
>  
>  	value |= DMA_CONTROL_ST;
>  	writel(value, ioaddr + DMA_CHAN_TX_CONTROL(dwmac4_addrs, chan));
> -
> -	value = readl(ioaddr + GMAC_CONFIG);
> -	value |= GMAC_CONFIG_TE;
> -	writel(value, ioaddr + GMAC_CONFIG);
>  }
>  
>  void dwmac4_dma_stop_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
> @@ -77,10 +73,6 @@ void dwmac4_dma_start_rx(struct stmmac_priv *priv, void __iomem *ioaddr,
>  	value |= DMA_CONTROL_SR;
>  
>  	writel(value, ioaddr + DMA_CHAN_RX_CONTROL(dwmac4_addrs, chan));
> -
> -	value = readl(ioaddr + GMAC_CONFIG);
> -	value |= GMAC_CONFIG_RE;
> -	writel(value, ioaddr + GMAC_CONFIG);
>  }
>  
>  void dwmac4_dma_stop_rx(struct stmmac_priv *priv, void __iomem *ioaddr,
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> index 7840bc403788..cba12edc1477 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> @@ -288,10 +288,6 @@ static void dwxgmac2_dma_start_tx(struct stmmac_priv *priv,
>  	value = readl(ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
>  	value |= XGMAC_TXST;
>  	writel(value, ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
> -
> -	value = readl(ioaddr + XGMAC_TX_CONFIG);
> -	value |= XGMAC_CONFIG_TE;
> -	writel(value, ioaddr + XGMAC_TX_CONFIG);
>  }
>  
>  static void dwxgmac2_dma_stop_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
> @@ -302,10 +298,6 @@ static void dwxgmac2_dma_stop_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
>  	value = readl(ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
>  	value &= ~XGMAC_TXST;
>  	writel(value, ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
> -
> -	value = readl(ioaddr + XGMAC_TX_CONFIG);
> -	value &= ~XGMAC_CONFIG_TE;
> -	writel(value, ioaddr + XGMAC_TX_CONFIG);
>  }
>  
>  static void dwxgmac2_dma_start_rx(struct stmmac_priv *priv,
> @@ -316,10 +308,6 @@ static void dwxgmac2_dma_start_rx(struct stmmac_priv *priv,
>  	value = readl(ioaddr + XGMAC_DMA_CH_RX_CONTROL(chan));
>  	value |= XGMAC_RXST;
>  	writel(value, ioaddr + XGMAC_DMA_CH_RX_CONTROL(chan));
> -
> -	value = readl(ioaddr + XGMAC_RX_CONFIG);
> -	value |= XGMAC_CONFIG_RE;
> -	writel(value, ioaddr + XGMAC_RX_CONFIG);
>  }
>  
>  static void dwxgmac2_dma_stop_rx(struct stmmac_priv *priv, void __iomem *ioaddr,

Tested-by: Furong Xu <0x1207@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
