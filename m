Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF38656C42
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Dec 2022 15:56:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A1CDC65042;
	Tue, 27 Dec 2022 14:56:51 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64CB0C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Dec 2022 14:56:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F34DA6116E;
 Tue, 27 Dec 2022 14:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB84C433F0;
 Tue, 27 Dec 2022 14:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672153008;
 bh=bJ+XHdK7jEWRBA/2KeMxWPYu+OlRSkwMzYqcmBqueCc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MgrHQ2iCh1ZEESHLKpHBiBOZ4hTW9oHQnygLGgHQiLYSHG65T9r1A9ip+LArAlUlz
 vOaA1ZtufXbHW/vtf3hW5OjIXyXzIwhjgnv/i46mZNP4b3nMQ3PTBgdGAJor8hBNxq
 9tV9Br6USc1ukmBXSsgT4/yufbukr1VbYA7G23QiO/0Bo3ChnwPnMtQvEmCBZ8vtL+
 mPi9lqCpQ10E/jyIYaJvhwtZIEC1GywKDAZ3jxT6EEnVGUzrvtjvCgWjSllMphB9xQ
 RSGrtfTTzY+y0a6Z4Z5Ftl2JeDji41iVTdUdmAFP6FU8bwAyXZQ0GTYZBdvmkzHU5h
 5GKQf/TN3fnxg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pABNn-0006GC-ID; Tue, 27 Dec 2022 15:56:48 +0100
Date: Tue, 27 Dec 2022 15:56:47 +0100
From: Johan Hovold <johan@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <Y6sHr5kuxUoahlzJ@hovoldconsulting.com>
References: <20221216115338.7150-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221216115338.7150-1-marex@denx.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-serial@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] serial: stm32: Merge hard IRQ and
 threaded IRQ handling into single IRQ handler
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

On Fri, Dec 16, 2022 at 12:53:38PM +0100, Marek Vasut wrote:
> Requesting an interrupt with IRQF_ONESHOT will run the primary handler
> in the hard-IRQ context even in the force-threaded mode. The
> force-threaded mode is used by PREEMPT_RT in order to avoid acquiring
> sleeping locks (spinlock_t) in hard-IRQ context. This combination
> makes it impossible and leads to "sleeping while atomic" warnings.
> 
> Use one interrupt handler for both handlers (primary and secondary)
> and drop the IRQF_ONESHOT flag which is not needed.
> 
> Fixes: e359b4411c283 ("serial: stm32: fix threaded interrupt handling")

I don't think a Fixes tag is warranted as this is only needed due to
this undocumented quirk of PREEMPT_RT.

And this should not be backported in any case.

> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Erwan Le Ray <erwan.leray@foss.st.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Valentin Caron <valentin.caron@foss.st.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-serial@vger.kernel.org
> ---
> V2: - Update patch subject, was:
>       serial: stm32: Move hard IRQ handling to threaded interrupt context
>     - Use request_irq() instead, rename the IRQ handler function
> V3: - Update the commit message per suggestion from Sebastian
>     - Add RB from Sebastian
>     - Add Fixes tag
> ---
>  drivers/tty/serial/stm32-usart.c | 29 +++++++----------------------
>  1 file changed, 7 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
> index dfdbcf092facc..bbbab8dc2bfa9 100644
> --- a/drivers/tty/serial/stm32-usart.c
> +++ b/drivers/tty/serial/stm32-usart.c
> @@ -752,8 +752,9 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
>  	struct tty_port *tport = &port->state->port;
>  	struct stm32_port *stm32_port = to_stm32_port(port);
>  	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
> -	u32 sr;
> +	unsigned long flags;
>  	unsigned int size;
> +	u32 sr;
>  
>  	sr = readl_relaxed(port->membase + ofs->isr);
>  
> @@ -793,27 +794,13 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
>  	}
>  
>  	if ((sr & USART_SR_TXE) && !(stm32_port->tx_ch)) {
> -		spin_lock(&port->lock);
> +		spin_lock_irqsave(&port->lock, flags);
>  		stm32_usart_transmit_chars(port);
> -		spin_unlock(&port->lock);
> +		spin_unlock_irqrestore(&port->lock, flags);

This is not needed as the handler runs with interrupts disabled.

>  	}
>  
> -	if (stm32_usart_rx_dma_enabled(port))
> -		return IRQ_WAKE_THREAD;
> -	else
> -		return IRQ_HANDLED;
> -}
> -
> -static irqreturn_t stm32_usart_threaded_interrupt(int irq, void *ptr)
> -{
> -	struct uart_port *port = ptr;
> -	struct tty_port *tport = &port->state->port;
> -	struct stm32_port *stm32_port = to_stm32_port(port);
> -	unsigned int size;
> -	unsigned long flags;
> -
>  	/* Receiver timeout irq for DMA RX */
> -	if (!stm32_port->throttled) {
> +	if (stm32_usart_rx_dma_enabled(port) && !stm32_port->throttled) {
>  		spin_lock_irqsave(&port->lock, flags);

But you could change this to spin_lock() now.

>  		size = stm32_usart_receive_chars(port, false);
>  		uart_unlock_and_check_sysrq_irqrestore(port, flags);
> @@ -1016,10 +1003,8 @@ static int stm32_usart_startup(struct uart_port *port)
>  	u32 val;
>  	int ret;
>  
> -	ret = request_threaded_irq(port->irq, stm32_usart_interrupt,
> -				   stm32_usart_threaded_interrupt,
> -				   IRQF_ONESHOT | IRQF_NO_SUSPEND,
> -				   name, port);
> +	ret = request_irq(port->irq, stm32_usart_interrupt,
> +			  IRQF_NO_SUSPEND, name, port);
>  	if (ret)
>  		return ret;

You should also remove

	/*
	 * Using DMA and threaded handler for the console could lead to
	 * deadlocks.
	 */
	if (uart_console(port))
		return -ENODEV;

from stm32_usart_of_dma_rx_probe() when removing the threaded handler.

Johan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
