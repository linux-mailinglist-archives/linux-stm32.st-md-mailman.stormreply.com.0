Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E5464554E
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Dec 2022 09:16:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91D13C65E6B;
	Wed,  7 Dec 2022 08:16:00 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07441C65E5D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Dec 2022 08:15:58 +0000 (UTC)
Date: Wed, 7 Dec 2022 09:15:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1670400958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BRTqQIJG6VmpHsSpAsrO/dqie52AxWXZS7m5EVogHko=;
 b=Dg2L5StYii/bkRJjVW5VLoYOX/guI0k9RiBChN882sb7n/TvQEvK4z1/foDw9zXaCVUE1+
 aAIQlkzAhDYLSTZM4QBe0DSGy5aqu3ofcaIIPCN98ATCC8V7MkNTnv1wipU1H48Jn4YUWk
 x9HyOnvUcHb+0A2jnVVEfQMyDw0m+eauR4l16BkCa0LnoKLp2igX1mhZmUeyn5iY9Kpfzs
 JOwKIMEvedThQCpXiLgLgQ0TRwwD/2LoNkTJKycx9Ig7/oqPk86SFmJgcUsZYu4m2tLvWd
 dyvxcrxyq7OfWJtJ7jmzKhJdisZhdCd1fBhL+i52Wmomt0EjEbtRMY/AWxzxSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1670400958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BRTqQIJG6VmpHsSpAsrO/dqie52AxWXZS7m5EVogHko=;
 b=OBUz/6xwc1/bzheByQFN4VcWwgJQHTd2A3UXS2PNhpXJFZVMgDJfyAqHRJdGj2OwwyhJK5
 NmzZyokcnIpNkCAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Marek Vasut <marex@denx.de>
Message-ID: <Y5BLvE/2RTJsUVms@linutronix.de>
References: <20221207013012.395585-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221207013012.395585-1-marex@denx.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-serial@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>,
 Jean Philippe Romain <jean-philippe.romain@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] [RFC] serial: stm32: Move
 stm32_usart_transmit_chars() to interrupt thread
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

On 2022-12-07 02:30:12 [+0100], Marek Vasut wrote:
> Avoid locking in hard interrupt context, move the stm32_usart_transmit_chars()
> into the threaded IRQ handler. This fixes the following splat with preempt-rt:
> 
>  BUG: scheduling while atomic: (mount)/1289/0x00010001
>  Modules linked in:
>  Preemption disabled at:
>  [<c0119127>] irq_enter_rcu+0xb/0x42
>  CPU: 0 PID: 1289 Comm: (mount) Not tainted 6.1.0-rc7-rt5-stable-standard-00006-gd70aeccb9f0f #17
>  Hardware name: STM32 (Device Tree Support)
>   unwind_backtrace from show_stack+0xb/0xc
>   show_stack from dump_stack_lvl+0x2b/0x34
>   dump_stack_lvl from __schedule_bug+0x53/0x80
>   __schedule_bug from __schedule+0x47/0x404
>   __schedule from schedule_rtlock+0x15/0x34
>   schedule_rtlock from rtlock_slowlock_locked+0x1d7/0x57e
>   rtlock_slowlock_locked from rt_spin_lock+0x29/0x3c
>   rt_spin_lock from stm32_usart_interrupt+0xa9/0x110
>   stm32_usart_interrupt from __handle_irq_event_percpu+0x73/0x14e
>   __handle_irq_event_percpu from handle_irq_event_percpu+0x9/0x22
>   handle_irq_event_percpu from handle_irq_event+0x53/0x76
>   handle_irq_event from handle_fasteoi_irq+0x65/0xa8
>   handle_fasteoi_irq from handle_irq_desc+0xf/0x18
>   handle_irq_desc from gic_handle_irq+0x45/0x54
>   gic_handle_irq from generic_handle_arch_irq+0x19/0x2c
>   generic_handle_arch_irq from call_with_stack+0xd/0x10
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Erwan Le Ray <erwan.leray@foss.st.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jean Philippe Romain <jean-philippe.romain@foss.st.com>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Valentin Caron <valentin.caron@foss.st.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-serial@vger.kernel.org
> ---
>  drivers/tty/serial/stm32-usart.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
> index a1490033aa164..56357a7962edc 100644
> --- a/drivers/tty/serial/stm32-usart.c
> +++ b/drivers/tty/serial/stm32-usart.c
> @@ -791,11 +791,8 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
>  		}
>  	}

Why is this handler running as the primary handler to begin with?
There is
 stm32_usart_rs485_rts_disable() 
 -> mctrl_gpio_set()
    -> gpiod_set_array_value()
       -> gpiod_set_array_value_complex()
         -> gpio_chip_set_multiple()
	    -> gc->set_multiple() || gc->set() ?
         -> bitmap_alloc() boom

I don't know if the underlying gpiod is always using a raw_spinlock_t
but that bitmap_alloc() (depending on FASTPATH_NGPIO()) is not going to
work.
pm_wakeup_dev_event() is also using a spinlock_t.


> -	if ((sr & USART_SR_TXE) && !(stm32_port->tx_ch)) {
> -		spin_lock(&port->lock);
> -		stm32_usart_transmit_chars(port);
> -		spin_unlock(&port->lock);
> -	}
> +	if ((sr & USART_SR_TXE) && !(stm32_port->tx_ch))
> +		return IRQ_WAKE_THREAD;

Before that, there is a "stm32_port->throttled" check using the very
same lock.

>  	if (stm32_usart_rx_dma_enabled(port))
>  		return IRQ_WAKE_THREAD;

Sebastian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
