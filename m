Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B89D166302D
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Jan 2023 20:19:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 570B8C69048;
	Mon,  9 Jan 2023 19:19:24 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0231C65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jan 2023 19:19:22 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 746208091A;
 Mon,  9 Jan 2023 20:19:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1673291962;
 bh=Za+Qn8GL5zyzuLQ75VP6smK4HEYZvNIVeKoLRdHkEaI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bDRqQUbKdNgPUv3l5tasRagUEZm5I69hHVYg1NyFMk+iLyyHw1o+3fGRuIyEFTJk6
 3c3sbLlVzuX3c7wqkZqcVgAiLtLqw6mJJ0cjIchWr5BY6IvKP4e4QRfZIzBjuI0+aS
 bnUE6mul5m6wX7XCpJgfg7UNUnRYHyV1hdT++OVLYqeVLbzXXKPUZb42JMMH9qsvtc
 0Y7Emn58g8VPu+cn9fyKAa8bg4E2zp6u43Mlv2HQVKoLLh1eMU3mvkrJi/ee8QJ99B
 +FgZKI9Z2tDrsZ2M6US0cF3/0keEdSndlVs7u17/xEMjdcXQjPslaIvSNQrziZ6yf5
 cb7jeyY9c1thg==
Message-ID: <d6cd2874-71ed-d9ae-67fe-5390da1ade24@denx.de>
Date: Mon, 9 Jan 2023 20:19:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
References: <20221216115338.7150-1-marex@denx.de>
 <Y6sHr5kuxUoahlzJ@hovoldconsulting.com>
 <a66988fd-af44-63cd-e962-47ffa6205a6a@denx.de>
 <Y7f+birb2KpTygxI@hovoldconsulting.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Y7f+birb2KpTygxI@hovoldconsulting.com>
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

On 1/6/23 11:56, Johan Hovold wrote:
> On Thu, Jan 05, 2023 at 09:46:57PM +0100, Marek Vasut wrote:
>> On 12/27/22 15:56, Johan Hovold wrote:
>>
>> [...]
>>
>>>> @@ -793,27 +794,13 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
>>>>    	}
>>>>    
>>>>    	if ((sr & USART_SR_TXE) && !(stm32_port->tx_ch)) {
>>>> -		spin_lock(&port->lock);
>>>> +		spin_lock_irqsave(&port->lock, flags);
>>>>    		stm32_usart_transmit_chars(port);
>>>> -		spin_unlock(&port->lock);
>>>> +		spin_unlock_irqrestore(&port->lock, flags);
>>>
>>> This is not needed as the handler runs with interrupts disabled.
>>
>> On SMP system, another thread on another core can call
>> stm32_usart_transmit_chars() . I don't think removing the locking is
>> correct ?
> 
> I didn't say that you should remove the locking, which is very much
> needed. There's just no need to disable interrupts in a (non-threaded)
> interrupt handler as that has already been done by IRQ core (and, yes,
> that is also the case with forced threading).

Ah, understood.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
