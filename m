Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EC065F55C
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Jan 2023 21:47:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCDA4C69069;
	Thu,  5 Jan 2023 20:47:01 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4362BC03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Jan 2023 20:47:00 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8F693855ED;
 Thu,  5 Jan 2023 21:46:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1672951619;
 bh=Ts70kyLCR6lX3KKTUrPlDmVX0MnBSxV9GtAQsnuBGqo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gLEXOrk1UTP5pTqVJilPXARQnJWVErH8nIucxwtgD8TCRsPYErxjYYPdxgGgpJalq
 IDBjA9UZsCgf0itJSiYk16AxiorvWzyvGsBIDugldvoGfF5g59svluirTeccEZ0QmV
 xTMl7jEyOQEUQqw8aoJVgJqzAagtaQqB62y/VasEMw/goo1aCTEcdajfAgVxkXPhFF
 JW/vSvT2ky7y8En+JraBXCiFWoIuQWQmao0pPpf+uSaXTX2k86HRJVCzTyY+u+YXlQ
 bACQHkun+xucFOwvGwjF6qSPGsKXHX0tvvFKYoOG8AogEvq0IuRRAiT4GpHPhWRX3j
 Ze8ZDJved9R+A==
Message-ID: <a66988fd-af44-63cd-e962-47ffa6205a6a@denx.de>
Date: Thu, 5 Jan 2023 21:46:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
References: <20221216115338.7150-1-marex@denx.de>
 <Y6sHr5kuxUoahlzJ@hovoldconsulting.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Y6sHr5kuxUoahlzJ@hovoldconsulting.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 12/27/22 15:56, Johan Hovold wrote:

[...]

>> @@ -793,27 +794,13 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
>>   	}
>>   
>>   	if ((sr & USART_SR_TXE) && !(stm32_port->tx_ch)) {
>> -		spin_lock(&port->lock);
>> +		spin_lock_irqsave(&port->lock, flags);
>>   		stm32_usart_transmit_chars(port);
>> -		spin_unlock(&port->lock);
>> +		spin_unlock_irqrestore(&port->lock, flags);
> 
> This is not needed as the handler runs with interrupts disabled.

On SMP system, another thread on another core can call 
stm32_usart_transmit_chars() . I don't think removing the locking is 
correct ?

> 
>>   	}
>>   
>> -	if (stm32_usart_rx_dma_enabled(port))
>> -		return IRQ_WAKE_THREAD;
>> -	else
>> -		return IRQ_HANDLED;
>> -}
>> -
>> -static irqreturn_t stm32_usart_threaded_interrupt(int irq, void *ptr)
>> -{
>> -	struct uart_port *port = ptr;
>> -	struct tty_port *tport = &port->state->port;
>> -	struct stm32_port *stm32_port = to_stm32_port(port);
>> -	unsigned int size;
>> -	unsigned long flags;
>> -
>>   	/* Receiver timeout irq for DMA RX */
>> -	if (!stm32_port->throttled) {
>> +	if (stm32_usart_rx_dma_enabled(port) && !stm32_port->throttled) {
>>   		spin_lock_irqsave(&port->lock, flags);
> 
> But you could change this to spin_lock() now.

[...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
