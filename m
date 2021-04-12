Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F7235B9F2
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Apr 2021 07:52:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91A34C57B6F;
	Mon, 12 Apr 2021 05:52:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E07EEC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 05:52:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A75D561207;
 Mon, 12 Apr 2021 05:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1618206747;
 bh=efCpCnAinHSf2kSKdV1JoeqCUQSQ/06SRXMJwGOgVdc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oWgropJxyAI8fh04gSOaCZDSUtj00UIEqrA1HMKf54YVJLlfVfGzlIZqRmMH29h3M
 8n0DXpGk0AvcvVsvIHvGkfwhG/VKqdkHNdNwefP4EvhPkyBWbuqo+E8DpqppwZea74
 asFZk45SAuqLMKJGYJ4+CtCiT44m331SXxTo8ylU=
Date: Mon, 12 Apr 2021 07:52:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: dillon.minfei@gmail.com
Message-ID: <YHPgGI6EmTzmVH7g@kroah.com>
References: <1618202061-8243-1-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1618202061-8243-1-git-send-email-dillon.minfei@gmail.com>
Cc: linux-serial@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, jirislaby@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] serial: stm32: optimize spin lock usage
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

On Mon, Apr 12, 2021 at 12:34:21PM +0800, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> To avoid potential deadlock in spin_lock usage, change to use
> spin_lock_irqsave(), spin_unlock_irqrestore() in process(thread_fn) context.
> spin_lock(), spin_unlock() under handler context.
> 
> remove unused local_irq_save/restore call.
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
> Was verified on stm32f469-disco board. need more test on stm32mp platform.
> 
>  drivers/tty/serial/stm32-usart.c | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
> index b3675cf25a69..c4c859b34367 100644
> --- a/drivers/tty/serial/stm32-usart.c
> +++ b/drivers/tty/serial/stm32-usart.c
> @@ -214,7 +214,7 @@ static void stm32_usart_receive_chars(struct uart_port *port, bool threaded)
>  	struct tty_port *tport = &port->state->port;
>  	struct stm32_port *stm32_port = to_stm32_port(port);
>  	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
> -	unsigned long c;
> +	unsigned long c, flags;
>  	u32 sr;
>  	char flag;
>  
> @@ -276,9 +276,17 @@ static void stm32_usart_receive_chars(struct uart_port *port, bool threaded)
>  		uart_insert_char(port, sr, USART_SR_ORE, c, flag);
>  	}
>  
> -	spin_unlock(&port->lock);
> +	if (threaded)
> +		spin_unlock_irqrestore(&port->lock, flags);
> +	else
> +		spin_unlock(&port->lock);

You shouldn't have to check for this, see the other patches on the list
recently that fixed this up to not be an issue for irq handlers.

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
