Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 660AA1159F8
	for <lists+linux-stm32@lfdr.de>; Sat,  7 Dec 2019 01:01:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14334C36B0B;
	Sat,  7 Dec 2019 00:01:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29661C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Dec 2019 00:01:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB6Nm0nE013830; Sat, 7 Dec 2019 01:01:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=STMicroelectronics;
 bh=ixJ2guiJFyST+QNjHDaZ3Gsr09qezAlVsf/9Nyn+DyI=;
 b=jXEl4dviICPpr/pxS+Fv1wCFCdrOwULIGj8Q1Kx7AGBDlI74Gx/TqXMJkXu/dq74NtaH
 84ZzMOpTTMT19Qnyqnb3K128OreYWrN1mjF/1LuVaUaYnq35ChXDcqu0ryINvSBFL645
 5BXJWaY9o+3nNr5lWDZxW3F4nDeXHauqmA9H4j42qiSP9fZWjnygS5eYymFOFwrBpuMA
 uwBTKxSbc15z8bmmIs2xQA6rgRrM2Zy/sOOFlt+wADrnqbZdYxKA23LAXKcGa2WK4MWW
 hxRcsEmkWfLkVFM3l9SA/k1uD/wxVgbd8klTjlxC9Y3uC8iETFb/AtckyBf6VsASYapu ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wkeeajvft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 07 Dec 2019 01:01:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 93B6F10002A;
 Sat,  7 Dec 2019 01:01:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4A2AE207581;
 Sat,  7 Dec 2019 01:01:10 +0100 (CET)
Received: from lshz10676 (10.75.127.45) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Sat, 7 Dec 2019 01:01:09 +0100
Message-ID: <6b5b74cede87a61d5f04f2a95bc4389830467fe9.camel@st.com>
From: Antonio Borneo <antonio.borneo@st.com>
To: Joel Fernandes <joel@joelfernandes.org>
Date: Sat, 7 Dec 2019 01:00:51 +0100
In-Reply-To: <20191204160407.GB17404@google.com>
References: <20191127154428.191095-1-antonio.borneo@st.com>
 <20191204160407.GB17404@google.com>
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_08:2019-12-05,2019-12-06 signatures=0
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-stm32@st-md-mailman.stormreply.com
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

On Wed, 2019-12-04 at 11:04 -0500, Joel Fernandes wrote:
> On Wed, Nov 27, 2019 at 04:44:28PM +0100, Antonio Borneo wrote:
> > This tracing event class is the only instance in kernel that logs
> > in the trace buffer the instruction pointer as offset to _stext,
> > instead of logging the full pointer.
> > This looks like a nice optimization for 64 bits platforms, where a
> > 32 bit offset can take less space than a full 64 bits pointer. But
> > the symbol _stext is incorrectly resolved as zero in the expansion
> 
> I didn't get this. If _stext is 0 on any platform, then your patch doesn't
> really do anything because the offset will be equal to the ip.
> 
> Could you provide an example with real numbers showing the overflow?
> 

Thanks for your reply.

Easy to replicate, e.g. with a vanilla v5.4 on x86_64
make x86_64_defconfig
echo CONFIG_PREEMPTIRQ_EVENTS=y >> .config
make oldconfig; make

At login:
trace-cmd record -e preemptirq:irq_enable sleep 1
trace-cmd report trace.dat | head
and I incorrectly get only the offsets to _stext:
cpus=1
           sleep-197   [000]   280.378022: irq_enable:           caller=0x1afaS parent=0xc00091S
           sleep-197   [000]   280.378026: irq_enable:           caller=0x54d34S parent=0x78e00000S
           sleep-197   [000]   280.378029: irq_enable:           caller=0x1afaS parent=0xc00a84S
           sleep-197   [000]   280.378032: irq_enable:           caller=0x263dS parent=0x78e00000S
...

With this patch I get the expected/right result:
cpus=1
           sleep-210   [000]   525.177583: irq_enable:           caller=trace_hardirqs_on_thunk parent=entry_SYSCALL_64_after_hwframe
           sleep-210   [000]   525.177587: irq_enable:           caller=__do_page_fault parent=(nil)S
           sleep-210   [000]   525.177590: irq_enable:           caller=trace_hardirqs_on_thunk parent=swapgs_restore_regs_and_return_to_usermode
           sleep-210   [000]   525.177593: irq_enable:           caller=do_syscall_64 parent=(nil)S
...

The same correct result can be obtained by hardcoding _stext in TP_printk() (of course, disabling KASLR to use fixed _stext), e.g. on x86_64:
        TP_printk("caller=%pS parent=%pS",
-                 (void *)((unsigned long)(_stext) + __entry->caller_offs),
-                 (void *)((unsigned long)(_stext) + __entry->parent_offs))
+                 (void *)(0xffffffff81000000UL + __entry->caller_offs),
+                 (void *)(0xffffffff81000000UL + __entry->parent_offs))
 );

The problem is caused by having the macros TP_fast_assign() and TP_printk() expanded in different way.
The simpler expansion of the former macro resolves correctly the symbol _stext.
The more complex expansion of the latter macro passes through some stringification that at the end incorrectly expands _stext as 0.
At first I thought to fix the macro expansion of TP_printk(), but then I realized that:
- on 32 bit systems there is no gain in coding 32 bit offset instead of 32 bit pointer
- on 64 bit systems I cannot find a constraint that guarantees that modules are loaded within 32 bit offset from _stext
then, this patch!

> > of TP_printk(), which then prints only the hex offset instead of
> > the name of the caller function. Plus, on arm arch the kernel
> > modules are loaded at address lower than _stext, causing the u32
> > offset arithmetics to overflow and wrap at 32 bits.
> 
> If we use signed 32-bit, will that solve the module issue?
> 

Of course, on arm 32 bit using a signed offset would solve the 32 bit wraparound.

> > I did not identified a 64 bit arch where the modules are loaded at
> > offset from _stext that exceed u32 range, but I also did not
> > identified any constraint to feel safe with a u32 offset.
> > 
> > Log directly the instruction pointer instead of the offset to
> > _stext.
> 
> I am not comfortable with this patch at the moment, mainly because it will
> increase the size of this rather high frequency event. But I'm not saying
> there isn't an issue on 32-bit. Let's discuss more.
> 

Sure, the pressure on the trace buffer will increase on a 64 bit system, but in general it also has more memory than an embedded 32 bit system.
The key point is, instead, can we feel safe with a 32 bit offset in a 64 bit system? Is there any guarantee a module is loaded within 32 bits offset from _stext?

Antonio

> thanks,
> 
>  - Joel
> 
> 
> > Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
> > Fixes: d59158162e03 ("tracing: Add support for preempt and irq enable/disable events")
> > ---
> >  include/trace/events/preemptirq.h | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/include/trace/events/preemptirq.h b/include/trace/events/preemptirq.h
> > index 95fba0471e5b..d548a6aafa18 100644
> > --- a/include/trace/events/preemptirq.h
> > +++ b/include/trace/events/preemptirq.h
> > @@ -18,18 +18,18 @@ DECLARE_EVENT_CLASS(preemptirq_template,
> >  	TP_ARGS(ip, parent_ip),
> >  
> >  	TP_STRUCT__entry(
> > -		__field(u32, caller_offs)
> > -		__field(u32, parent_offs)
> > +		__field(unsigned long, caller_ip)
> > +		__field(unsigned long, parent_ip)
> >  	),
> >  
> >  	TP_fast_assign(
> > -		__entry->caller_offs = (u32)(ip - (unsigned long)_stext);
> > -		__entry->parent_offs = (u32)(parent_ip - (unsigned long)_stext);
> > +		__entry->caller_ip = ip;
> > +		__entry->parent_ip = parent_ip;
> >  	),
> >  
> >  	TP_printk("caller=%pS parent=%pS",
> > -		  (void *)((unsigned long)(_stext) + __entry->caller_offs),
> > -		  (void *)((unsigned long)(_stext) + __entry->parent_offs))
> > +		  (void *)__entry->caller_ip,
> > +		  (void *)__entry->parent_ip)
> >  );
> >  
> >  #ifdef CONFIG_TRACE_IRQFLAGS
> > -- 
> > 2.24.0
> > 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
