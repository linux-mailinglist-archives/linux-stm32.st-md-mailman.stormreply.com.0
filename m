Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A202112D6A
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Dec 2019 15:26:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72334C36B0B;
	Wed,  4 Dec 2019 14:26:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35D56C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Dec 2019 14:21:19 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3CE58206DF;
 Wed,  4 Dec 2019 14:21:17 +0000 (UTC)
Date: Wed, 4 Dec 2019 09:21:15 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Antonio Borneo <antonio.borneo@st.com>
Message-ID: <20191204092115.30ef75c9@gandalf.local.home>
In-Reply-To: <20191127154428.191095-1-antonio.borneo@st.com>
References: <20191127154428.191095-1-antonio.borneo@st.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 04 Dec 2019 14:26:20 +0000
Cc: Joel Fernandes <joelaf@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
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


Joel,

Any comments on this patch?

-- Steve

On Wed, 27 Nov 2019 16:44:28 +0100
Antonio Borneo <antonio.borneo@st.com> wrote:

> This tracing event class is the only instance in kernel that logs
> in the trace buffer the instruction pointer as offset to _stext,
> instead of logging the full pointer.
> This looks like a nice optimization for 64 bits platforms, where a
> 32 bit offset can take less space than a full 64 bits pointer. But
> the symbol _stext is incorrectly resolved as zero in the expansion
> of TP_printk(), which then prints only the hex offset instead of
> the name of the caller function. Plus, on arm arch the kernel
> modules are loaded at address lower than _stext, causing the u32
> offset arithmetics to overflow and wrap at 32 bits.
> I did not identified a 64 bit arch where the modules are loaded at
> offset from _stext that exceed u32 range, but I also did not
> identified any constraint to feel safe with a u32 offset.
> 
> Log directly the instruction pointer instead of the offset to
> _stext.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
> Fixes: d59158162e03 ("tracing: Add support for preempt and irq enable/disable events")
> ---
>  include/trace/events/preemptirq.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/include/trace/events/preemptirq.h b/include/trace/events/preemptirq.h
> index 95fba0471e5b..d548a6aafa18 100644
> --- a/include/trace/events/preemptirq.h
> +++ b/include/trace/events/preemptirq.h
> @@ -18,18 +18,18 @@ DECLARE_EVENT_CLASS(preemptirq_template,
>  	TP_ARGS(ip, parent_ip),
>  
>  	TP_STRUCT__entry(
> -		__field(u32, caller_offs)
> -		__field(u32, parent_offs)
> +		__field(unsigned long, caller_ip)
> +		__field(unsigned long, parent_ip)
>  	),
>  
>  	TP_fast_assign(
> -		__entry->caller_offs = (u32)(ip - (unsigned long)_stext);
> -		__entry->parent_offs = (u32)(parent_ip - (unsigned long)_stext);
> +		__entry->caller_ip = ip;
> +		__entry->parent_ip = parent_ip;
>  	),
>  
>  	TP_printk("caller=%pS parent=%pS",
> -		  (void *)((unsigned long)(_stext) + __entry->caller_offs),
> -		  (void *)((unsigned long)(_stext) + __entry->parent_offs))
> +		  (void *)__entry->caller_ip,
> +		  (void *)__entry->parent_ip)
>  );
>  
>  #ifdef CONFIG_TRACE_IRQFLAGS

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
