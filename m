Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD11392B1B
	for <lists+linux-stm32@lfdr.de>; Thu, 27 May 2021 11:49:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56E1BC57B5B;
	Thu, 27 May 2021 09:49:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36750C57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 May 2021 09:49:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05FFA613E9;
 Thu, 27 May 2021 09:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1622108943;
 bh=ibMj4HGw4tq6iAwRPumkn3GwQyGhzBrwJyRHr8w0cdI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n2YJFcksYr9IFlyIdMQi6VNbc2iEPtpwbDaf2uvNqqTtx3dkHCy7N1tWlTV6ChFAp
 rFPK4Yop2icGeJl4ljBi7pWu2ZuAUc372umU4Mtz/R8fCgQWPwOqnwVGk0/BwEsGNP
 67xynQ5g6KppvjYW3PZySQWOlwjCxDprjE0+XpJU=
Date: Thu, 27 May 2021 11:49:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Erwan Le Ray <erwan.leray@foss.st.com>
Message-ID: <YK9rDVeg0W9WE+9a@kroah.com>
References: <20210527091537.8997-1-erwan.leray@foss.st.com>
 <20210527091537.8997-2-erwan.leray@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210527091537.8997-2-erwan.leray@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] serial: stm32: reset dma buffers
	during probe
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

On Thu, May 27, 2021 at 11:15:36AM +0200, Erwan Le Ray wrote:
> Reset Rx and Tx dma buffers during probe to avoid freeing
> invalid buffer in no dma mode.
> 
> Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>
> 
> diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
> index c2ae7b392b86..2ac3b30477a7 100644
> --- a/drivers/tty/serial/stm32-usart.c
> +++ b/drivers/tty/serial/stm32-usart.c
> @@ -1168,6 +1168,8 @@ static struct stm32_port *stm32_usart_of_get_port(struct platform_device *pdev)
>  	stm32_ports[id].cr1_irq = USART_CR1_RXNEIE;
>  	stm32_ports[id].cr3_irq = 0;
>  	stm32_ports[id].last_res = RX_BUF_L;
> +	stm32_ports[id].rx_dma_buf = 0;
> +	stm32_ports[id].tx_dma_buf = 0;
>  	return &stm32_ports[id];
>  }
>  
> -- 
> 2.17.1
> 

Is this a bugfix?  if so, what commit does this fix and does it need to
be backported anywhere?

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
