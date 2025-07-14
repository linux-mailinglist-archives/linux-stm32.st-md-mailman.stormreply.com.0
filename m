Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00694B04011
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Jul 2025 15:34:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C62AC3F92D;
	Mon, 14 Jul 2025 13:34:57 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5BCFC36B18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jul 2025 13:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=rkKA5JFXkaqeIgKnZeTRvq/H+eMfFQ7tSAFHadzv+i4=; b=qPYqJaoStTW6WZY8E3xsfppAcV
 GciwfhUoAIxtaUx5hRVyOQZL595Nutl12IeZGQ+2QwMLot/GFSllOAsMkFzzwfSJiTKTwqNREFIWM
 u1tdKdG9gNKJ9cvGzr99Z+DlXIe3rzBruOF4Hcro7UHi3k4oDscE48rIsYpUmNuaWcqU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ubJKR-001SkI-Ao; Mon, 14 Jul 2025 15:34:47 +0200
Date: Mon, 14 Jul 2025 15:34:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: rohan.g.thomas@altera.com
Message-ID: <bef4d761-8909-4f90-8822-8c344291cb93@lunn.ch>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-1-c34092a88a72@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250714-xgmac-minor-fixes-v1-1-c34092a88a72@altera.com>
Cc: linux-kernel@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>,
 netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/3] net: stmmac: xgmac: Disable
 RX FIFO Overflow interrupts
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

On Mon, Jul 14, 2025 at 03:59:17PM +0800, Rohan G Thomas via B4 Relay wrote:
> From: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> Enabling RX FIFO Overflow interrupts is counterproductive
> and causes an interrupt storm when RX FIFO overflows.
> Disabling this interrupt has no side effect and eliminates
> interrupt storms when the RX FIFO overflows.
> 
> Commit 8a7cb245cf28 ("net: stmmac: Do not enable RX FIFO
> overflow interrupts") disables RX FIFO overflow interrupts
> for DWMAC4 IP and removes the corresponding handling of
> this interrupt. This patch is doing the same thing for
> XGMAC IP.
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>

Please take a read of:

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

This appears to be a fixed, so the Subject: line should indicate this.
Please also include a Fixes: tag, and Cc: stable.

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> index 5dcc95bc0ad28b756accf9670c5fa00aa94fcfe3..7201a38842651a865493fce0cefe757d6ae9bafa 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> @@ -203,10 +203,6 @@ static void dwxgmac2_dma_rx_mode(struct stmmac_priv *priv, void __iomem *ioaddr,
>  	}
>  
>  	writel(value, ioaddr + XGMAC_MTL_RXQ_OPMODE(channel));
> -
> -	/* Enable MTL RX overflow */
> -	value = readl(ioaddr + XGMAC_MTL_QINTEN(channel));
> -	writel(value | XGMAC_RXOIE, ioaddr + XGMAC_MTL_QINTEN(channel));

What is the reset default? Would it make sense to explicitly disable
it, rather than never enable it? What does 8a7cb245cf28 do?

    Andrew

---
pw-bot: cr


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
