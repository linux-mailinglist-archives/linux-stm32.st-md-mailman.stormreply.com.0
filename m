Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A85B69AC88D
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Oct 2024 13:07:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49AFAC71287;
	Wed, 23 Oct 2024 11:07:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28EE1C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 11:07:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6731E5C5C6B;
 Wed, 23 Oct 2024 11:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF01C4CEC6;
 Wed, 23 Oct 2024 11:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729681663;
 bh=lVH6MnxKITbbLVTwdZBysRiSQtubnhnYeW4+iV/DjdI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E3nkyUXpCIUw60Ut1ahkxfsb6ko2wlwoKm8v7ip68Yc9G/pNXB9f5GYPYI+nxDgJB
 Myycd0ohPbxwgWoYNYuiTI6HXwa7kUnO0MXVz8kx6NiOk3q2xTNv6XfqYEWU/nIhzA
 KwjW+P0DjmO0t00/ja5zTvi+NyD0WXlygeRP9noMs171EY/zM5p0u/zctG9N4qZfSa
 oCIt4meSaexNvxxqb5cwZZUUydunkS2Iyn7ue/56NR2hCE++w2kuOdnFZC43Gkfsst
 WXxWPh+Z8hP0tBFaP9UPc/OcR7IZXPqSgs5xSsg8RABN9bfysnxqJ7vs8tighnobeW
 JQkCZmiwbttlw==
Date: Wed, 23 Oct 2024 12:07:38 +0100
From: Simon Horman <horms@kernel.org>
To: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Message-ID: <20241023110738.GM402847@kernel.org>
References: <20241021054625.1791965-1-leyfoon.tan@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241021054625.1791965-1-leyfoon.tan@starfivetech.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 lftan.linux@gmai.com, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Corentin Labbe <clabbe.montjoie@gmail.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v3] net: stmmac: dwmac4: Fix high
 address display by updating reg_space[] from register values
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

+ Corentin, Giuseppe, Maxime, Andrew, linux-arm-kernel, linux-stm32

  As per output of get_maintainers.pl FILE.patch
  Please consider doing likewise in future.

On Mon, Oct 21, 2024 at 01:46:25PM +0800, Ley Foon Tan wrote:
> The high address will display as 0 if the driver does not set the
> reg_space[]. To fix this, read the high address registers and
> update the reg_space[] accordingly.
> 
> Fixes: fbf68229ffe7 ("net: stmmac: unify registers dumps methods")
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> ---
> - Split the patch series to net and net-next. Submit this patch for net.
> - Rebased to net https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git
> 
> v2: https://patchwork.kernel.org/project/netdevbpf/cover/20241016031832.3701260-1-leyfoon.tan@starfivetech.com/

Thanks for the update.

Reviewed-by: Simon Horman <horms@kernel.org>

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c | 8 ++++++++
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h | 2 ++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> index e0165358c4ac..77b35abc6f6f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> @@ -203,8 +203,12 @@ static void _dwmac4_dump_dma_regs(struct stmmac_priv *priv,
>  		readl(ioaddr + DMA_CHAN_TX_CONTROL(dwmac4_addrs, channel));
>  	reg_space[DMA_CHAN_RX_CONTROL(default_addrs, channel) / 4] =
>  		readl(ioaddr + DMA_CHAN_RX_CONTROL(dwmac4_addrs, channel));
> +	reg_space[DMA_CHAN_TX_BASE_ADDR_HI(default_addrs, channel) / 4] =
> +		readl(ioaddr + DMA_CHAN_TX_BASE_ADDR_HI(dwmac4_addrs, channel));
>  	reg_space[DMA_CHAN_TX_BASE_ADDR(default_addrs, channel) / 4] =
>  		readl(ioaddr + DMA_CHAN_TX_BASE_ADDR(dwmac4_addrs, channel));
> +	reg_space[DMA_CHAN_RX_BASE_ADDR_HI(default_addrs, channel) / 4] =
> +		readl(ioaddr + DMA_CHAN_RX_BASE_ADDR_HI(dwmac4_addrs, channel));
>  	reg_space[DMA_CHAN_RX_BASE_ADDR(default_addrs, channel) / 4] =
>  		readl(ioaddr + DMA_CHAN_RX_BASE_ADDR(dwmac4_addrs, channel));
>  	reg_space[DMA_CHAN_TX_END_ADDR(default_addrs, channel) / 4] =
> @@ -225,8 +229,12 @@ static void _dwmac4_dump_dma_regs(struct stmmac_priv *priv,
>  		readl(ioaddr + DMA_CHAN_CUR_TX_DESC(dwmac4_addrs, channel));
>  	reg_space[DMA_CHAN_CUR_RX_DESC(default_addrs, channel) / 4] =
>  		readl(ioaddr + DMA_CHAN_CUR_RX_DESC(dwmac4_addrs, channel));
> +	reg_space[DMA_CHAN_CUR_TX_BUF_ADDR_HI(default_addrs, channel) / 4] =
> +		readl(ioaddr + DMA_CHAN_CUR_TX_BUF_ADDR_HI(dwmac4_addrs, channel));
>  	reg_space[DMA_CHAN_CUR_TX_BUF_ADDR(default_addrs, channel) / 4] =
>  		readl(ioaddr + DMA_CHAN_CUR_TX_BUF_ADDR(dwmac4_addrs, channel));
> +	reg_space[DMA_CHAN_CUR_RX_BUF_ADDR_HI(default_addrs, channel) / 4] =
> +		readl(ioaddr + DMA_CHAN_CUR_RX_BUF_ADDR_HI(dwmac4_addrs, channel));
>  	reg_space[DMA_CHAN_CUR_RX_BUF_ADDR(default_addrs, channel) / 4] =
>  		readl(ioaddr + DMA_CHAN_CUR_RX_BUF_ADDR(dwmac4_addrs, channel));
>  	reg_space[DMA_CHAN_STATUS(default_addrs, channel) / 4] =
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> index 17d9120db5fe..4f980dcd3958 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> @@ -127,7 +127,9 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
>  #define DMA_CHAN_SLOT_CTRL_STATUS(addrs, x)	(dma_chanx_base_addr(addrs, x) + 0x3c)
>  #define DMA_CHAN_CUR_TX_DESC(addrs, x)	(dma_chanx_base_addr(addrs, x) + 0x44)
>  #define DMA_CHAN_CUR_RX_DESC(addrs, x)	(dma_chanx_base_addr(addrs, x) + 0x4c)
> +#define DMA_CHAN_CUR_TX_BUF_ADDR_HI(addrs, x)	(dma_chanx_base_addr(addrs, x) + 0x50)
>  #define DMA_CHAN_CUR_TX_BUF_ADDR(addrs, x)	(dma_chanx_base_addr(addrs, x) + 0x54)
> +#define DMA_CHAN_CUR_RX_BUF_ADDR_HI(addrs, x)	(dma_chanx_base_addr(addrs, x) + 0x58)
>  #define DMA_CHAN_CUR_RX_BUF_ADDR(addrs, x)	(dma_chanx_base_addr(addrs, x) + 0x5c)
>  #define DMA_CHAN_STATUS(addrs, x)	(dma_chanx_base_addr(addrs, x) + 0x60)
>  
> -- 
> 2.34.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
