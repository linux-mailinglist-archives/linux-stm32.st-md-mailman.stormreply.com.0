Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE144127701
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Dec 2019 09:10:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84360C36B0C;
	Fri, 20 Dec 2019 08:10:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FFDAC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Dec 2019 18:45:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBE141FB;
 Thu, 19 Dec 2019 10:45:27 -0800 (PST)
Received: from [10.1.194.46] (e113632-lin.cambridge.arm.com [10.1.194.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D43C93F67D;
 Thu, 19 Dec 2019 10:45:26 -0800 (PST)
To: Antonio Borneo <antonio.borneo@st.com>,
 Joel Fernandes <joel@joelfernandes.org>
References: <20191127154428.191095-1-antonio.borneo@st.com>
 <20191204160407.GB17404@google.com>
 <6b5b74cede87a61d5f04f2a95bc4389830467fe9.camel@st.com>
From: Valentin Schneider <valentin.schneider@arm.com>
Message-ID: <68b3b7db-d278-6cd2-f2b6-cbba05df6db4@arm.com>
Date: Thu, 19 Dec 2019 18:45:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6b5b74cede87a61d5f04f2a95bc4389830467fe9.camel@st.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 20 Dec 2019 08:10:28 +0000
Cc: ambroise.vincent@arm.com, Ingo Molnar <mingo@redhat.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] tracing: Fix printing ptrs in preempt/irq
 enable/disable events
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

On 07/12/2019 00:00, Antonio Borneo wrote:
> At login:
> trace-cmd record -e preemptirq:irq_enable sleep 1
> trace-cmd report trace.dat | head
> and I incorrectly get only the offsets to _stext:
> cpus=1
>            sleep-197   [000]   280.378022: irq_enable:           caller=0x1afaS parent=0xc00091S
>            sleep-197   [000]   280.378026: irq_enable:           caller=0x54d34S parent=0x78e00000S
>            sleep-197   [000]   280.378029: irq_enable:           caller=0x1afaS parent=0xc00a84S
>            sleep-197   [000]   280.378032: irq_enable:           caller=0x263dS parent=0x78e00000S
> ...
> 
> With this patch I get the expected/right result:
> cpus=1
>            sleep-210   [000]   525.177583: irq_enable:           caller=trace_hardirqs_on_thunk parent=entry_SYSCALL_64_after_hwframe
>            sleep-210   [000]   525.177587: irq_enable:           caller=__do_page_fault parent=(nil)S
>            sleep-210   [000]   525.177590: irq_enable:           caller=trace_hardirqs_on_thunk parent=swapgs_restore_regs_and_return_to_usermode
>            sleep-210   [000]   525.177593: irq_enable:           caller=do_syscall_64 parent=(nil)S
> ...

FWIW Ambroise (in Cc) and I were staring at some irq enable/disable traces,
and encountered exactly this on a Pixel3 running a mainline kernel. With
Antonio's patch we got the expected result, so you can have:

Tested-by: Valentin Schneider <valentin.schneider@arm.com>

>> I am not comfortable with this patch at the moment, mainly because it will
>> increase the size of this rather high frequency event. But I'm not saying
>> there isn't an issue on 32-bit. Let's discuss more.
>>
> 
> Sure, the pressure on the trace buffer will increase on a 64 bit system, but in general it also has more memory than an embedded 32 bit system.
> The key point is, instead, can we feel safe with a 32 bit offset in a 64 bit system? Is there any guarantee a module is loaded within 32 bits offset from _stext?
> 

You're better placed than I to know if and when this is the case, but I
wouldn't use this in a production environment. To me this is more of a
debugging tool (and a really good one at that), so I am less concerned
about the memory overhead.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
