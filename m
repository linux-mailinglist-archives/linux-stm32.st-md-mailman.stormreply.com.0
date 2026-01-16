Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A83AD2D5E8
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jan 2026 08:42:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3370AC8F28E;
	Fri, 16 Jan 2026 07:42:29 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EC51C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jan 2026 07:42:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6F1524E4210E;
 Fri, 16 Jan 2026 07:42:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3BFAA60732;
 Fri, 16 Jan 2026 07:42:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3447610B682A5; Fri, 16 Jan 2026 08:42:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768549345; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=yu0jn8jm2n1dkDHVZT2M5vZAAWPa36+CBjxCNEHcarQ=;
 b=vj1GLVy4mLMrVpEO5LpZbGlurcpuETR5klnfjVo+8fv/PjmgKPiXfjNUNxcn7nIpwwXmV5
 i3Ns43oQtBAphJKcvvkbmCKRQIdJby4QyhiTQ6xzBDysgft/nDLQaO24ofhZoH+HFpk1TN
 VzK3u8D62QnWMvD7slJev5FpqOu9oueArL39PBNgDf4UcoOY0SNi/oJnx2XsT2wunUdap8
 Bo3dahe/gopBzNTzHixtjt3t+539bTS7uiJu0bt848VAQBWT8OZ68DC3+XKcYVr2eJsb0/
 L6pFWlt/ecYPkEP0+iKG4OTiuWpxKBsD0ruaNwZmuZwQPfcWVjSrNYqAQqUZ0A==
Message-ID: <ab2d7cc9-e7d9-47fb-95ad-90ae4f5f1f67@bootlin.com>
Date: Fri, 16 Jan 2026 08:42:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <E1vgY1k-00000003vOC-0Z1H@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vgY1k-00000003vOC-0Z1H@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: fix dwmac4 transmit
 performance regression
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

Hi Russell,

On 16/01/2026 01:49, Russell King (Oracle) wrote:
> dwmac4's transmit performance dropped by a factor of four due to an
> incorrect assumption about which definitions are for what. This
> highlights the need for sane register macros.
> 
> Commit 8409495bf6c9 ("net: stmmac: cores: remove many xxx_SHIFT
> definitions") changed the way the txpbl value is merged into the
> register:
> 
>         value = readl(ioaddr + DMA_CHAN_TX_CONTROL(dwmac4_addrs, chan));
> -       value = value | (txpbl << DMA_BUS_MODE_PBL_SHIFT);
> +       value = value | FIELD_PREP(DMA_BUS_MODE_PBL, txpbl);
> 
> With the following in the header file:
> 
>  #define DMA_BUS_MODE_PBL               BIT(16)
> -#define DMA_BUS_MODE_PBL_SHIFT         16
> 
> The assumption here was that DMA_BUS_MODE_PBL was the mask for
> DMA_BUS_MODE_PBL_SHIFT, but this turns out not to be the case.
> 
> The field is actually six bits wide, buts 21:16, and is called
> TXPBL.
> 
> What's even more confusing is, there turns out to be a PBLX8
> single bit in the DMA_CHAN_CONTROL register (0x1100 for channel 0),
> and DMA_BUS_MODE_PBL seems to be used for that. However, this bit
> et.al. was listed under a comment "/* DMA SYS Bus Mode bitmap */"
> which is for register 0x1004.
> 
> Fix this up by adding an appropriately named field definition under
> the DMA_CHAN_TX_CONTROL() register address definition.
> 
> Move the RPBL mask definition under DMA_CHAN_RX_CONTROL(), correctly
> renaming it as well.
> 
> Also move the PBL bit definition under DMA_CHAN_CONTROL(), correctly
> renaming it.
> 
> This removes confusion over the PBL fields.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Good job finding the problem ! However you need a Fixes tag, even though
ths is is for net-next.

It would also have been nice to be in CC, I spent some time on the bisect...

Besides that, problem solved on an imx8mp setup :)

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c | 8 ++++----
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h | 7 ++++---
>  2 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> index 7036beccfc85..aaa83e9ff4f0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> @@ -52,7 +52,7 @@ static void dwmac4_dma_init_rx_chan(struct stmmac_priv *priv,
>  	u32 rxpbl = dma_cfg->rxpbl ?: dma_cfg->pbl;
>  
>  	value = readl(ioaddr + DMA_CHAN_RX_CONTROL(dwmac4_addrs, chan));
> -	value = value | FIELD_PREP(DMA_BUS_MODE_RPBL_MASK, rxpbl);
> +	value = value | FIELD_PREP(DMA_CHAN_RX_CTRL_RXPBL_MASK, rxpbl);
>  	writel(value, ioaddr + DMA_CHAN_RX_CONTROL(dwmac4_addrs, chan));
>  
>  	if (IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT) && likely(dma_cfg->eame))
> @@ -73,7 +73,7 @@ static void dwmac4_dma_init_tx_chan(struct stmmac_priv *priv,
>  	u32 txpbl = dma_cfg->txpbl ?: dma_cfg->pbl;
>  
>  	value = readl(ioaddr + DMA_CHAN_TX_CONTROL(dwmac4_addrs, chan));
> -	value = value | FIELD_PREP(DMA_BUS_MODE_PBL, txpbl);
> +	value = value | FIELD_PREP(DMA_CHAN_TX_CTRL_TXPBL_MASK, txpbl);
>  
>  	/* Enable OSP to get best performance */
>  	value |= DMA_CONTROL_OSP;
> @@ -98,7 +98,7 @@ static void dwmac4_dma_init_channel(struct stmmac_priv *priv,
>  	/* common channel control register config */
>  	value = readl(ioaddr + DMA_CHAN_CONTROL(dwmac4_addrs, chan));
>  	if (dma_cfg->pblx8)
> -		value = value | DMA_BUS_MODE_PBL;
> +		value = value | DMA_CHAN_CTRL_PBLX8;
>  	writel(value, ioaddr + DMA_CHAN_CONTROL(dwmac4_addrs, chan));
>  
>  	/* Mask interrupts by writing to CSR7 */
> @@ -116,7 +116,7 @@ static void dwmac410_dma_init_channel(struct stmmac_priv *priv,
>  	/* common channel control register config */
>  	value = readl(ioaddr + DMA_CHAN_CONTROL(dwmac4_addrs, chan));
>  	if (dma_cfg->pblx8)
> -		value = value | DMA_BUS_MODE_PBL;
> +		value = value | DMA_CHAN_CTRL_PBLX8;
>  
>  	writel(value, ioaddr + DMA_CHAN_CONTROL(dwmac4_addrs, chan));
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> index 5f1e2916f099..9d9077a4ac9f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> @@ -24,8 +24,6 @@
>  
>  #define DMA_SYS_BUS_MODE		0x00001004
>  
> -#define DMA_BUS_MODE_PBL		BIT(16)
> -#define DMA_BUS_MODE_RPBL_MASK		GENMASK(21, 16)
>  #define DMA_BUS_MODE_MB			BIT(14)
>  #define DMA_BUS_MODE_FB			BIT(0)
>  
> @@ -68,19 +66,22 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
>  
>  #define DMA_CHAN_CONTROL(addrs, x)	dma_chanx_base_addr(addrs, x)
>  
> +#define DMA_CHAN_CTRL_PBLX8		BIT(16)
>  #define DMA_CONTROL_SPH			BIT(24)
>  
>  #define DMA_CHAN_TX_CONTROL(addrs, x)	(dma_chanx_base_addr(addrs, x) + 0x4)
>  
>  #define DMA_CONTROL_EDSE		BIT(28)
> +#define DMA_CHAN_TX_CTRL_TXPBL_MASK	GENMASK(21, 16)
>  #define DMA_CONTROL_TSE			BIT(12)
>  #define DMA_CONTROL_OSP			BIT(4)
>  #define DMA_CONTROL_ST			BIT(0)
>  
>  #define DMA_CHAN_RX_CONTROL(addrs, x)	(dma_chanx_base_addr(addrs, x) + 0x8)
>  
> -#define DMA_CONTROL_SR			BIT(0)
> +#define DMA_CHAN_RX_CTRL_RXPBL_MASK	GENMASK(21, 16)
>  #define DMA_RBSZ_MASK			GENMASK(14, 1)
> +#define DMA_CONTROL_SR			BIT(0)
>  
>  #define DMA_CHAN_TX_BASE_ADDR_HI(addrs, x)	(dma_chanx_base_addr(addrs, x) + 0x10)
>  #define DMA_CHAN_TX_BASE_ADDR(addrs, x)	(dma_chanx_base_addr(addrs, x) + 0x14)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
