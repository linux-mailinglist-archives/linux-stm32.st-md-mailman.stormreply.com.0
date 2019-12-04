Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C7A112F8F
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Dec 2019 17:06:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB547C36B0E;
	Wed,  4 Dec 2019 16:06:22 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20BB1C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Dec 2019 16:04:24 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id z124so67465pgb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Dec 2019 08:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lEczIr05C8TgUB0wYPwYco1Wmd1jSJezldm3cM37UHY=;
 b=AMAi7jzFKieoCU3sOqVAqotUHCS9ex43uM+DvM0+mEr4hLI9aadCiPDB8lqiIOKAPO
 F/6caJmyTcCI08xYiT7KIzIXxNpzKBBkBSkmgCZmyEQor60Vgc026L6xN3//5sEJGT8O
 DSGobBlOoy65xNlVmsBrLvoINtsusHq8oWWHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lEczIr05C8TgUB0wYPwYco1Wmd1jSJezldm3cM37UHY=;
 b=IxjICJnfm1nvdafX8fSudBMSaetReOsOAdc2tQNdW3PsR/Y8b5z9Gk3iDaL6pG7cqw
 L7OpQyifeyzSRu1riGus2ZQRJN401c3XR/0TEIjO81pN4OrSjA3UQFp5uV7vzzfMax5q
 xLJh3mfEaS8vpSLmWWQLgpGh8cJPE0UlQT7m4dMidFqumZEnzXdPsklTNND0APiny4FI
 FTXHqRWFIFH9fwvWZ9EuQmwTEyatcB0Mj1v7WsueZskFzYZK6onoAed5Hn10Q/769BbP
 wrhlI+f07fIHY9QePsbd+cc0u2VJJSZwj4orvzhbtg23uX/d47ZgmIn2gR5aFdHiewdY
 Wk/Q==
X-Gm-Message-State: APjAAAX8xcUGPBiEcEVvWIZdRU4fb7Ws5bVs2TNrMqpVXyj6FTveFh0c
 ydYr/GCKbqHXb3Q8udY5r150o72bMNs=
X-Google-Smtp-Source: APXvYqwRVG5ZTFGimiLMObb2aEdXmbfLPt6NGsTwoK7yCqMXlHti7j2qLYudtL7BMdDQ60byUcq7pw==
X-Received: by 2002:a63:c141:: with SMTP id p1mr4375003pgi.326.1575475462437; 
 Wed, 04 Dec 2019 08:04:22 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id s3sm8081816pgi.31.2019.12.04.08.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 08:04:21 -0800 (PST)
Date: Wed, 4 Dec 2019 11:04:20 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Steven Rostedt <rostedt@goodmis.org>
Message-ID: <20191204160420.GC17404@google.com>
References: <20191127154428.191095-1-antonio.borneo@st.com>
 <20191204092115.30ef75c9@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191204092115.30ef75c9@gandalf.local.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 04 Dec 2019 16:06:21 +0000
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
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

On Wed, Dec 04, 2019 at 09:21:15AM -0500, Steven Rostedt wrote:
> 
> Joel,
> 
> Any comments on this patch?

Just replied, thanks for the ping!

 - Joel

> 
> -- Steve
> 
> On Wed, 27 Nov 2019 16:44:28 +0100
> Antonio Borneo <antonio.borneo@st.com> wrote:
> 
> > This tracing event class is the only instance in kernel that logs
> > in the trace buffer the instruction pointer as offset to _stext,
> > instead of logging the full pointer.
> > This looks like a nice optimization for 64 bits platforms, where a
> > 32 bit offset can take less space than a full 64 bits pointer. But
> > the symbol _stext is incorrectly resolved as zero in the expansion
> > of TP_printk(), which then prints only the hex offset instead of
> > the name of the caller function. Plus, on arm arch the kernel
> > modules are loaded at address lower than _stext, causing the u32
> > offset arithmetics to overflow and wrap at 32 bits.
> > I did not identified a 64 bit arch where the modules are loaded at
> > offset from _stext that exceed u32 range, but I also did not
> > identified any constraint to feel safe with a u32 offset.
> > 
> > Log directly the instruction pointer instead of the offset to
> > _stext.
> > 
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
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
