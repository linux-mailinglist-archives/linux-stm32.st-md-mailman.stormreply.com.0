Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B27AD0389
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Jun 2025 15:55:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEACAC3F930;
	Fri,  6 Jun 2025 13:55:44 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FC39C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Jun 2025 13:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=6dFmZYMvFnPKz7ElX5mkKo2Zv+TMRgVK23txlUfoVfY=; b=T5NhYSjd2nnhmPpsffbFUfP6uC
 eAPdvN5/SN0+W8vn/INqTew/+ATLDf1rR3/RBPDbaRm6mjXIyOyP8HLGEvFR+3FQV+Vo9iFNGWN/h
 QJmBgqQOEOoBeJ+/6okvzyJNd9Gu+bHs4IM1KDGCQ0ncCsGduFLMHl54xvqJ7OEgqzrM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uNXXZ-00EuDg-89; Fri, 06 Jun 2025 15:55:25 +0200
Date: Fri, 6 Jun 2025 15:55:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Bartlomiej Dziag <bartlomiejdziag@gmail.com>
Message-ID: <9f5f87d6-c7c2-4288-8c02-e57b0d943881@lunn.ch>
References: <20250606102100.12576-1-bartlomiejdziag@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250606102100.12576-1-bartlomiejdziag@gmail.com>
Cc: Wojciech Drewek <wojciech.drewek@intel.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Change the busy-wait loops
	timing
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

On Fri, Jun 06, 2025 at 12:19:49PM +0200, Bartlomiej Dziag wrote:
> After writing a new value to the PTP_TAR or PTP_STSUR registers,
> the driver waits for the addend/adjust operations to complete.
> Sometimes, the first check operation fails, resulting in
> a 10 milliseconds busy-loop before performing the next check.
> Since updating the registers takes much less than 10 milliseconds,
> the kernel gets stuck unnecessarily. This may increase the CPU usage.
> Fix that with changing the busy-loop interval to 5 microseconds.
> The registers will be checked more often.
> 
> Signed-off-by: Bartlomiej Dziag <bartlomiejdziag@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
> index e2840fa241f2..f8e1278a1837 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
> @@ -144,11 +144,11 @@ static int config_addend(void __iomem *ioaddr, u32 addend)
>  	writel(value, ioaddr + PTP_TCR);
>  
>  	/* wait for present addend update to complete */
> -	limit = 10;
> +	limit = 10000;
>  	while (limit--) {
>  		if (!(readl(ioaddr + PTP_TCR) & PTP_TCR_TSADDREG))
>  			break;
> -		mdelay(10);
> +		udelay(5);

I would actually suggest rewriting this using the macros from iopoll.h.

    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
