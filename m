Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1781464EAE9
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Dec 2022 12:52:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF3CCC65E46;
	Fri, 16 Dec 2022 11:52:46 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 618A0C6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Dec 2022 11:52:45 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0921D839D5;
 Fri, 16 Dec 2022 12:52:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1671191564;
 bh=ccfEFXj/vkjrIoYNtALGzBq214DK48WkXwikITxyznQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=it7ApSyMIzZUlgGi0wpS/A8kyBaJkYwogv8fMjLCNH87EwVAn4B+U378vqU8vtWDH
 /eFaOmusi+lkvvPsikoySCardWafiTs+/7OsxE0TdNvGY0pqL+vBkfblGhjARXOxFg
 pBXkP3Mj4rE/cQoYLG5ga5kGr5iPiObSPtizGZLUH5VW6aVt8VZAe52YdoM431a2GD
 o9Q0CabSCTLmKHRr36vVIICIADf5hNVK2QB0qW8K2FDc+vzdcnYEdQQEdcVkYNA8PY
 W3XHmc1Tcc1SNVgvZut+hPaQ9MkiF4k1LP3ayVqp/FY9sL0qF+KvbJpY9dPfl8JP+z
 uEItVVCUDJ6+w==
Message-ID: <7eba06d4-4ea1-0a15-2bb0-a1837f342a34@denx.de>
Date: Fri, 16 Dec 2022 12:52:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <20221216021504.457699-1-marex@denx.de>
 <Y5wljLfx4bj1R9kl@linutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Y5wljLfx4bj1R9kl@linutronix.de>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] serial: stm32: Merge hard IRQ and
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

On 12/16/22 09:00, Sebastian Andrzej Siewior wrote:
> On 2022-12-16 03:15:04 [+0100], Marek Vasut wrote:
>> Avoid locking in hard interrupt context, move the entirety of hard IRQ
>> context code into single IRQ handler, preempt-rt would move the handler
>> into thread. This fixes the following splat with preempt-rt enabled:
>>
>>   BUG: scheduling while atomic: (mount)/1289/0x00010001
>>   Modules linked in:
>>   Preemption disabled at:
>>   [<c0119127>] irq_enter_rcu+0xb/0x42
>>   CPU: 0 PID: 1289 Comm: (mount) Not tainted 6.1.0-rc7-rt5-stable-standard-00006-gd70aeccb9f0f #17
>>   Hardware name: STM32 (Device Tree Support)
>>    unwind_backtrace from show_stack+0xb/0xc
>>    show_stack from dump_stack_lvl+0x2b/0x34
>>    dump_stack_lvl from __schedule_bug+0x53/0x80
>>    __schedule_bug from __schedule+0x47/0x404
>>    __schedule from schedule_rtlock+0x15/0x34
>>    schedule_rtlock from rtlock_slowlock_locked+0x1d7/0x57e
>>    rtlock_slowlock_locked from rt_spin_lock+0x29/0x3c
>>    rt_spin_lock from stm32_usart_interrupt+0xa9/0x110
>>    stm32_usart_interrupt from __handle_irq_event_percpu+0x73/0x14e
>>    __handle_irq_event_percpu from handle_irq_event_percpu+0x9/0x22
>>    handle_irq_event_percpu from handle_irq_event+0x53/0x76
>>    handle_irq_event from handle_fasteoi_irq+0x65/0xa8
>>    handle_fasteoi_irq from handle_irq_desc+0xf/0x18
>>    handle_irq_desc from gic_handle_irq+0x45/0x54
>>    gic_handle_irq from generic_handle_arch_irq+0x19/0x2c
>>    generic_handle_arch_irq from call_with_stack+0xd/0x10
> 
> Could this be replaced maybe with a proper description instead of
> slapping the backtrace into the patch description?

Sure, I'm not confident in the preempt-rt parts, thanks for the commit 
message update, I'll include it in V3.

>    Requesting an interrupt with IRQF_ONESHOT will run the primary handler
>    in the hard-IRQ context even in the force-threaded mode. The
>    force-threaded mode is used by PREEMPT_RT in order to avoid acquiring
>    sleeping locks (spinlock_t) in hard-IRQ context. This combination
>    makes it impossible and leads to "sleeping while atomic" warnings.
> 
>    Use one interrupt handler for both handlers (primary and secondary)
>    and drop the IRQF_ONESHOT flag which is not needed.
> 
>    Fixes: e359b4411c283 ("serial: stm32: fix threaded interrupt handling")
> 
> As for your change, this should work.
> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Thanks for all the help with this.

> Should this DMA-mode need to be outsourced (due to $REASON) you can
> request two handlers but then you need to avoid IRQF_ONESHOT and the
> primary handler needs to disable the interrupt source in the UART
> hardware.
> 
> Also it might be worth checking if the DMA mode makes any sense if the
> FIFO is so small.

If you want to push a lot of data through the UART without refilling the 
small FIFO all the time and getting a lot of IRQs, that's where the DMA 
comes in. Maybe I misunderstood this comment ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
