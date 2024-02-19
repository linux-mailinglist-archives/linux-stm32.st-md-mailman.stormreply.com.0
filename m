Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D92D685A128
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 11:40:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EA0BC6B45E;
	Mon, 19 Feb 2024 10:40:30 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 154E3C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 10:40:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D31AAC0006;
 Mon, 19 Feb 2024 10:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1708339228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pvJ5Bdzvp14vIivGP5ebUVk8Mv5zqJTnOjVP5r+RR6o=;
 b=APnXhhLkeqRTI+H3MWdxeMZNrdls3Bs3LmusHu3n/te7j+eVqu7MLTs1HPdKLdZORKad4n
 oU8YCUXIWJ1KU3AF/zEOZg3kxbOTjxjYy69J+4Oll7qGkM8nM3Uw3IMezvxZdM7wnct/Me
 HAVEtZbVcisMdbey1mV5zXIChEYPDT1JtSOAOo9bGfWr8ZZB7WHBkbpnAGF1FgOd0L7mAE
 WQKjyJhT8qRVea5UHtreltShxYcHBeA38xsdp/nFlHHiE1dHZvheo30m7PK9wlxqtnpfll
 MJD3Ho8GljzFJG4iCcApfzVcaYKBuAU6bgPiooeCBLE61kzhP0/iSdRuiTxESA==
Date: Mon, 19 Feb 2024 11:40:56 +0100 (CET)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Piotr Wejman <piotrwejman90@gmail.com>
In-Reply-To: <20240219102405.32015-1-piotrwejman90@gmail.com>
Message-ID: <6bb634fb-fe02-085b-a96f-ea56698ebcb4@bootlin.com>
References: <20240219102405.32015-1-piotrwejman90@gmail.com>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix rx queue priority
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

Hello Piotr,

On Mon, 19 Feb 2024, Piotr Wejman wrote:

>  static void dwmac4_rx_queue_priority(struct mac_device_info *hw,
> -				     u32 prio, u32 queue)
> +				     u32 prio_mask, u32 queue)
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
>  
> -	value = readl(ioaddr + base_register);
> +	for (i = 0; i < 4; i++)
> +		clear_mask |= ((prio_mask << GMAC_RXQCTRL_PSRQX_SHIFT(i)) &
> +						GMAC_RXQCTRL_PSRQX_MASK(i));
>  
> -	value &= ~GMAC_RXQCTRL_PSRQX_MASK(queue);
> -	value |= (prio << GMAC_RXQCTRL_PSRQX_SHIFT(queue)) &
> +	ctrl2 &= ~clear_mask;
> +	ctrl3 &= ~clear_mask;
> +
> +	if (queue < 4) {
> +		ctrl2 |= (prio_mask << GMAC_RXQCTRL_PSRQX_SHIFT(queue)) &
This is a bit of a nitpick but do you think it would make sense to replace that 
"4" with a macro? Something like GMAC_RXQCTRL_PSRXQ_MAXCTRL2QUEUE?

>  						GMAC_RXQCTRL_PSRQX_MASK(queue);
> -	writel(value, ioaddr + base_register);
> +
> +		writel(ctrl2, ioaddr + GMAC_RXQ_CTRL2);
> +		writel(ctrl3, ioaddr + GMAC_RXQ_CTRL3);
I suppose that the order of these two writes are somehow important, else these 
could be factored out of the conditional block. Could you maybe add a short 
comment that explains why the order of these writes matter?

Best Regards,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
