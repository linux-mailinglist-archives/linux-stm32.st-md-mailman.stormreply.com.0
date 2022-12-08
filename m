Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 887FC6469ED
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Dec 2022 08:52:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C654C6507A;
	Thu,  8 Dec 2022 07:52:26 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F7D3C63327
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Dec 2022 07:52:25 +0000 (UTC)
Date: Thu, 8 Dec 2022 08:52:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1670485944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+xIQHUv5/3WeGfuuR2KGHZySpMyBf9GZ66WaBaNvos8=;
 b=z58K1hQb59PXMR3szIMc1vcHX4pqCjgCuMH1p9edP+XCJgtIXbRUd00bMK2NhdcWr2MD7L
 prwBEsgf/+MWendfnOVE/LuTCY1zfm9WraRYePV6PD6tP9b4tO0TyKt1Q5zG7GVkWRoX6n
 /PiGtm4ATE9ngfHkpkEA9dXmww4JVG65YbPrCTsKZEfZmq5QgIILKGRvM3I1r29j0Y/j+9
 MpGyshMt3qOAmXGRFvP1Q5Vh4rg6Hv1javeYHEx3zb3Rqv0GwAxXHG5xZFDT1TgSLycLXa
 o6YuOBy486k34/86TCxuT7ijQ0ReBgL47oQOhOJVeMZTfkbg0lkbYJNiNIJYJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1670485944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+xIQHUv5/3WeGfuuR2KGHZySpMyBf9GZ66WaBaNvos8=;
 b=n6hd3evh580/6UFQlWbuCrmN8vOSyaswC11TwX4VnbDUBWRLGj22S0q2aKEuEkwTzrriTH
 LOuRmaG6la8tU3DA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Marek Vasut <marex@denx.de>
Message-ID: <Y5GXt/NHCrODZ32S@linutronix.de>
References: <20221207195929.160267-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221207195929.160267-1-marex@denx.de>
Cc: linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] serial: stm32: Move hard IRQ handling to
 threaded interrupt context
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

- Jean Philippe Romain <jean-philippe.romain@foss.st.com>

Could you please drop that email address in future post as I did? It
comes back here with:
| Remote-MTA: dns; mxb-00178001.gslb.pphosted.com
| Diagnostic-Code: smtp; 550 5.1.1 User Unknown

On 2022-12-07 20:59:29 [+0100], Marek Vasut wrote:
> diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
> index a1490033aa164..f5bce0be02676 100644
> --- a/drivers/tty/serial/stm32-usart.c
> +++ b/drivers/tty/serial/stm32-usart.c
> @@ -1015,7 +1002,7 @@ static int stm32_usart_startup(struct uart_port *port)
>  	u32 val;
>  	int ret;
>  
> -	ret = request_threaded_irq(port->irq, stm32_usart_interrupt,
> +	ret = request_threaded_irq(port->irq, NULL,
>  				   stm32_usart_threaded_interrupt,
>  				   IRQF_ONESHOT | IRQF_NO_SUSPEND,
>  				   name, port);

So why don't you just
	request_irq(port->irq, stm32_usart_interrupt, IRQF_NO_SUSPEND,
		    name, port)
? If there is a requirement to always run in threaded mode please
document it by at least making it part of the commit description.

Sebastian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
