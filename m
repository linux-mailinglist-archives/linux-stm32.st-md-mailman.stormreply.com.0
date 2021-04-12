Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B2935C705
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Apr 2021 15:08:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76319C57B79;
	Mon, 12 Apr 2021 13:08:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC4A8C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 13:08:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A16F6128A;
 Mon, 12 Apr 2021 13:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618232900;
 bh=+gF3uqIXavl3hMrOghe8B0SiT2ksN2Qd1LhyosV53go=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SbwiRoVspb29bqg8e/3ppeaDXykbxSHRBpjaDlHedmqky9OuVKYGfU3+c3qEwtQB/
 gpUXRcx61QcRWRRWz6EQn60j5b8JdfYghszN3CX+xsEUD87zvoc1XuW4mdE94mZaZu
 cqwjVI6U3iAtRxfTarN0XoPpYuCuqoBSOJF0qZMbjdatOwk3YvIjvbG2UsqzPdKN5a
 kxAO92d66Rh2P7xnc3H6e/3RHYmjSODNglm9AvxdeWgmwEvbiFh0dBzqUq4t57O6JI
 JLSvw906nSA5ARIIwKaXsM7XGBcp2so24ZzU+aT40aE+14K9lx/w3CD5ZjEzPZ6tYQ
 u+9JefcIQGTyA==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lVwIY-00028W-Bh; Mon, 12 Apr 2021 15:08:14 +0200
Date: Mon, 12 Apr 2021 15:08:14 +0200
From: Johan Hovold <johan@kernel.org>
To: dillon.minfei@gmail.com
Message-ID: <YHRGPpQ03XgBMkiy@hovoldconsulting.com>
References: <1618219898-4600-1-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1618219898-4600-1-git-send-email-dillon.minfei@gmail.com>
Cc: Gerald Baeza <gerald.baeza@foss.st.com>, kbuild-all@lists.01.org,
 mcoquelin.stm32@gmail.com, gregkh@linuxfoundation.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, linux-serial@vger.kernel.org,
 jirislaby@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, lkp@intel.com
Subject: Re: [Linux-stm32] [PATCH v2] serial: stm32: optimize spin lock usage
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

On Mon, Apr 12, 2021 at 05:31:38PM +0800, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> To avoid potential deadlock in spin_lock usage, use spin_lock_irqsave,
> spin_trylock_irqsave(), spin_unlock_irqrestore() in process context.

This doesn't make much sense as console_write can be called in any
context. And where's the deadlock you claim to be fixing here?
 
> remove unused local_irq_save/restore call.
> 
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Gerald Baeza <gerald.baeza@foss.st.com>
> Cc: Erwan Le Ray <erwan.leray@foss.st.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
> v2: remove unused code from stm32_usart_threaded_interrupt() according from
>     Greg's review.
> 
>  drivers/tty/serial/stm32-usart.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
> index b3675cf25a69..b1ba5e36e36e 100644
> --- a/drivers/tty/serial/stm32-usart.c
> +++ b/drivers/tty/serial/stm32-usart.c
> @@ -1354,13 +1354,12 @@ static void stm32_usart_console_write(struct console *co, const char *s,
>  	u32 old_cr1, new_cr1;
>  	int locked = 1;
>  
> -	local_irq_save(flags);
>  	if (port->sysrq)
>  		locked = 0;
>  	else if (oops_in_progress)
> -		locked = spin_trylock(&port->lock);
> +		locked = spin_trylock_irqsave(&port->lock, flags);
>  	else
> -		spin_lock(&port->lock);
> +		spin_lock_irqsave(&port->lock, flags);
>  
>  	/* Save and disable interrupts, enable the transmitter */
>  	old_cr1 = readl_relaxed(port->membase + ofs->cr1);
> @@ -1374,8 +1373,7 @@ static void stm32_usart_console_write(struct console *co, const char *s,
>  	writel_relaxed(old_cr1, port->membase + ofs->cr1);
>  
>  	if (locked)
> -		spin_unlock(&port->lock);
> -	local_irq_restore(flags);
> +		spin_unlock_irqrestore(&port->lock, flags);
>  }
>  
>  static int stm32_usart_console_setup(struct console *co, char *options)

Johan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
