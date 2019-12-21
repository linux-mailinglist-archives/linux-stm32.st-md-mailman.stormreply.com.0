Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCA0128BF8
	for <lists+linux-stm32@lfdr.de>; Sun, 22 Dec 2019 00:47:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 758D3C36B0C;
	Sat, 21 Dec 2019 23:47:46 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31177C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Dec 2019 23:47:44 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id s21so2931130plr.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Dec 2019 15:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fXy9xPSzwrsW14AMvNrH3dau8w//YzJTAr3l1Saqoig=;
 b=BtXPVluI1WJZfcKt5Lud61D40VYwvpo6G9Kp/Zsin1sj39dw2Dx681RY9uOB4Vqs28
 JWjDIAY4lEvhH95dllicpVB7VvOZflG+nvB9i8ly9SVnTnh8T8+NDo+HmIZwRePTp1jS
 jmtmCvrpP5x12TX5TYu5W4Vk+6pEm5t36iekU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fXy9xPSzwrsW14AMvNrH3dau8w//YzJTAr3l1Saqoig=;
 b=XEtKsSVwE15G9faEBm57hU77H7wjCmQhZd7g/tbGf4zyaip1Jg9Kp1HjplLWOUDX9Z
 djO9K9M/wJkJ0TAvSDIHnYdX6f6qCBWWHMYOvuep5R3nly/VNE7waJNhn0Gzl8Yxm+y/
 dnTQRmajAYY7MQ7Gt7dj9kLxjBHCW8M93IVJnNFp7wvrCmUltRnXkshBgR5N+BPJ5iFd
 R83BKotF/5Qbr1a5kMkb3olgrVBlK9l7SFNFJfG0Tt1TC+7i7uJIpvdt7YAhuVPy4bpq
 gknlfwwbp0hLxKX/2s2gKiKLMsJbws7AcUxXBBHb/RKZnzQkiTuefvILvA9J9qQaij7q
 fXFQ==
X-Gm-Message-State: APjAAAWLccypvy9sWiYJYz2u078gEkPmcYs9yp1Y3W1nBbfE08v9+/oN
 w9uLhLuNf8dirnnhKUmEMxdA/w==
X-Google-Smtp-Source: APXvYqzqzkp+eh1lKWYNwRToIgvfbaM/icchIpqxyrT/W118lizYV6091XMmfU8VB14/yYGANC8/Ew==
X-Received: by 2002:a17:902:8bc9:: with SMTP id
 r9mr22866985plo.48.1576972062452; 
 Sat, 21 Dec 2019 15:47:42 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id 133sm18161268pfy.14.2019.12.21.15.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2019 15:47:42 -0800 (PST)
Date: Sat, 21 Dec 2019 18:47:41 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Steven Rostedt <rostedt@goodmis.org>
Message-ID: <20191221234741.GA116648@google.com>
References: <20191127154428.191095-1-antonio.borneo@st.com>
 <20191204092115.30ef75c9@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191204092115.30ef75c9@gandalf.local.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Steve, it looks like this issue happens with trace-cmd not knowing what
_stext is. If I do cat trace_pipe , then I don't see the issue as _stext is
looked up correctly but the reporter of the bug is using trace-cmd. Is there
a way to solve this within trace-cmd? Not knowing much about trace-cmd
internals, I will have to defer to you on this though..

Other than this, I need to make the offset to _stext as s32 instead of u32
type so that the problem of the symbol location being before _stext does not
cause overflow.

Lastly, I am not super convinced that we need to store the full pointer just
to handle a case where the offset of the symbol might be more than +-2G from
_stext. Once we see such issue, then we can handle it. But right now the size
of the trace buffer is utilized better by just storing the offset IMHO.

thanks,

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
