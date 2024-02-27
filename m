Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC488869D00
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Feb 2024 18:00:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 725A5C6C841;
	Tue, 27 Feb 2024 17:00:21 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1806AC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Feb 2024 17:00:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BB548CE01C1;
 Tue, 27 Feb 2024 17:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99DA7C433F1;
 Tue, 27 Feb 2024 17:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709053217;
 bh=Rtg/wJB+BwOfbLpXE7ewLdRK21mvIkgnQ8NFpKpylzg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mEZVkleoAOhydHqEWHg/rQfg/pNdE3CSGBgWQPF8/NJIv8K3UrpYePZbTNCCm2uNf
 A07aYmhkG2OxxOI4hy+BI4cpj0H/6nQjkSCQ9JiFfrvfzldGbQ3VKf/eHzx9cPSWhq
 J/w/GXftvQZYCfEutbIu7/HIeJhwiKZU8f4EaWp7YdeRh0AH+SKWnPvUO30c7lvUzz
 vZrO1FKHgPBXGn/vr2dpjcBaqVAqx+0x3ytQV1y5OyR3GXUVfBMfTFs/Rmf1xu8ULY
 24WLz6N4GqSW3UaH+/AJCULFkhFmaLKgJK2dhTNUfaDEJt/3qnHhwWsD5C/Byhl+Gq
 yw1U2w14cQlLg==
Date: Tue, 27 Feb 2024 17:00:12 +0000
From: Simon Horman <horms@kernel.org>
To: Piotr Wejman <piotrwejman90@gmail.com>
Message-ID: <20240227170012.GC277116@kernel.org>
References: <20240226093144.31965-1-piotrwejman90@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240226093144.31965-1-piotrwejman90@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: fix rx queue priority
	assignment
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

On Mon, Feb 26, 2024 at 10:31:44AM +0100, Piotr Wejman wrote:
> The driver should ensure that same priority is not mapped to multiple
> rx queues. Currently rx_queue_priority() function is adding
> priorities for a queue without clearing them from others.
> 
> >From DesignWare Cores Ethernet Quality-of-Service
> Databook, section 17.1.29 MAC_RxQ_Ctrl2:
> "[...]The software must ensure that the content of this field is
> mutually exclusive to the PSRQ fields for other queues, that is,
> the same priority is not mapped to multiple Rx queues[...]"
> 
> After this patch, rx_queue_priority() function will:
> - assign desired priorities to a queue
> - remove those priorities from all other queues
> The write sequence of CTRL2 and CTRL3 registers is done in the way to
> ensure this order.
> 
> Signed-off-by: Piotr Wejman <piotrwejman90@gmail.com>
> ---
> Changes in v2:
>   - Add some comments
>   - Apply same changes to dwxgmac2_rx_queue_prio()
>   - Revert "Rename prio argument to prio_mask"
>   - Link to v1: https://lore.kernel.org/netdev/20240219102405.32015-1-piotrwejman90@gmail.com/T/#u
> 
>  .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 42 +++++++++++++++----
>  .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 40 ++++++++++++++----
>  2 files changed, 66 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> index 6b6d0de09619..76ec0c1da250 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> @@ -92,19 +92,43 @@ static void dwmac4_rx_queue_priority(struct mac_device_info *hw,
>  				     u32 prio, u32 queue)
>  {
>  	void __iomem *ioaddr = hw->pcsr;
> -	u32 base_register;
> -	u32 value;
> +	u32 clear_mask = 0;
> +	u32 ctrl2, ctrl3;
> +	int i;
>  
> -	base_register = (queue < 4) ? GMAC_RXQ_CTRL2 : GMAC_RXQ_CTRL3;
> -	if (queue >= 4)
> -		queue -= 4;
> +	ctrl2 = readl(ioaddr + GMAC_RXQ_CTRL2);
> +	ctrl3 = readl(ioaddr + GMAC_RXQ_CTRL3);
> +	
> +	/* The software must ensure that the same priority
> +	 * is not mapped to multiple Rx queues.
> +	 */
> +	for (i = 0; i < 4; i++)
> +		clear_mask |= ((prio << GMAC_RXQCTRL_PSRQX_SHIFT(i)) &
> +						GMAC_RXQCTRL_PSRQX_MASK(i));
>  
> -	value = readl(ioaddr + base_register);
> +	ctrl2 &= ~clear_mask;
> +	ctrl3 &= ~clear_mask;
>  
> -	value &= ~GMAC_RXQCTRL_PSRQX_MASK(queue);
> -	value |= (prio << GMAC_RXQCTRL_PSRQX_SHIFT(queue)) &
> +	/* Assign new priorities to a queue and
> +	 * clear them from others queues.
> +	 * The CTRL2 and CTRL3 registers write sequence is done
> +	 * in the way to ensure this order.
> +	 */
> +	if (queue < 4) {
> +		ctrl2 |= (prio << GMAC_RXQCTRL_PSRQX_SHIFT(queue)) &
>  						GMAC_RXQCTRL_PSRQX_MASK(queue);
> -	writel(value, ioaddr + base_register);
> +
> +		writel(ctrl2, ioaddr + GMAC_RXQ_CTRL2);
> +		writel(ctrl3, ioaddr + GMAC_RXQ_CTRL3);
> +	} else {
> +		queue -= 4;
> +
> +		ctrl3 |= (prio << GMAC_RXQCTRL_PSRQX_SHIFT(queue)) &
> +						GMAC_RXQCTRL_PSRQX_MASK(queue);
> +
> +		writel(ctrl3, ioaddr + GMAC_RXQ_CTRL3);
> +		writel(ctrl2, ioaddr + GMAC_RXQ_CTRL2);
> +	}
>  }

Hi Piotr,

Sorry if I am on the wrong track here, but this seems a little odd to me.

My reading is that each byte of GMAC_RXQ_CTRL2 and GMAC_RXQ_CTRL3
hold the priority value - an integer in the range of 0-255 - for
each of 8 queues.

This corresponds with the way that the queue is set both before and
after this patch.

But the code immediately above treats these bytes as bit fields.

Consider the case where all queues are initialised to 0
(I have no idea if this is valid queue values).

Now suppose we wish to set Queue 0 to Priority 7.
Then my my reading we will end up with.

clear_mask = 0x07070707
ctrl0 = (0x00000000 & ~clear_mask) | 0x00000007 = 0x00000007
ctrl3 =  0x00000000 & ~clear_mask               = 0x00000000

So far so good, but now suppose we now wish to set Queue 1 to Priority 9.
Then we get:

clear_mask = 0x09090909
ctrl0 = (0x00000007 & ~clear_mask) | 0x00000900 = 0x00000906
ctrl3 =  0x00000000 & ~clear_mask               = 0x00000000

Now queue 0 seems to have priority 6.

...

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
