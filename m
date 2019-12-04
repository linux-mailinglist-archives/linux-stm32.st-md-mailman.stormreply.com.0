Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB87112F8E
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Dec 2019 17:06:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E7D4C36B0B;
	Wed,  4 Dec 2019 16:06:22 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D573EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Dec 2019 16:04:10 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id b1so75030pgq.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Dec 2019 08:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eByo4q9faNp6zGI9FakktXazM1EDxbjClMkzxr8m7r0=;
 b=BV0w8QAZZ5xXily8kG1uCAy00f3Fo9uhHJ6ajdFZpadL45LzYbAWAFq9Zmqnts4hCo
 IgZU7ZQjc4RvQqz7ENmpIgYdYDaszImbpYkyNK+CjCELQeCY/J7WzCrJ1EX8+YcFsBvz
 Ta/bfolTf0p/NzXzMT+8JaLPdoLKYluBojmjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eByo4q9faNp6zGI9FakktXazM1EDxbjClMkzxr8m7r0=;
 b=Bc03uVTaSmyc+g/4tImpLZoSFpvfA3kdiIY5m8XQQrBAKEWAgzYJDA7+vP4njvwDoq
 gCAWs8i8fPJ0oD9/e9fw3Jj1GDpcdycEkwA3fcksYVF9Ty3uIx0dzcLUjiDqHjTAFUjV
 jjXGpyjw3xB78Novc5sF0cKksd5E4Pq7jkfr9DIttmA9i/EPcOfDvzLbY2pGP8phr0vO
 hcwJbsMtgNZ7fu+WJKniEpZgc3VUuBWJdJyLElva6cF1SnRkg2O+xWbbOG91DZ3kY2tw
 91RmydOnW7ayCA+P6BuEdNpfq1gxq77e9uZbKuzpEwwZNImdd5ypnxh7IqZGU2Z6yYVK
 0qpw==
X-Gm-Message-State: APjAAAW891BkA6j7ld+MbWRRldAxIGuQrLzL6BVjNQpiIGKA6WgKn8N1
 k8IF0+1cjz+0sMKeq/pOOtU2aA==
X-Google-Smtp-Source: APXvYqwYZ6RInRzgXvlj/cFCMRejFpnNht5sE2GGDmMGO+ouJL7B/qBhkYEoAxyP90L6dPIAl4JAyg==
X-Received: by 2002:a63:c103:: with SMTP id w3mr4273542pgf.275.1575475449097; 
 Wed, 04 Dec 2019 08:04:09 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id g10sm8073496pgh.35.2019.12.04.08.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 08:04:08 -0800 (PST)
Date: Wed, 4 Dec 2019 11:04:07 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Antonio Borneo <antonio.borneo@st.com>
Message-ID: <20191204160407.GB17404@google.com>
References: <20191127154428.191095-1-antonio.borneo@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191127154428.191095-1-antonio.borneo@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 04 Dec 2019 16:06:21 +0000
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

On Wed, Nov 27, 2019 at 04:44:28PM +0100, Antonio Borneo wrote:
> This tracing event class is the only instance in kernel that logs
> in the trace buffer the instruction pointer as offset to _stext,
> instead of logging the full pointer.
> This looks like a nice optimization for 64 bits platforms, where a
> 32 bit offset can take less space than a full 64 bits pointer. But
> the symbol _stext is incorrectly resolved as zero in the expansion

I didn't get this. If _stext is 0 on any platform, then your patch doesn't
really do anything because the offset will be equal to the ip.

Could you provide an example with real numbers showing the overflow?

> of TP_printk(), which then prints only the hex offset instead of
> the name of the caller function. Plus, on arm arch the kernel
> modules are loaded at address lower than _stext, causing the u32
> offset arithmetics to overflow and wrap at 32 bits.

If we use signed 32-bit, will that solve the module issue?

> I did not identified a 64 bit arch where the modules are loaded at
> offset from _stext that exceed u32 range, but I also did not
> identified any constraint to feel safe with a u32 offset.
> 
> Log directly the instruction pointer instead of the offset to
> _stext.

I am not comfortable with this patch at the moment, mainly because it will
increase the size of this rather high frequency event. But I'm not saying
there isn't an issue on 32-bit. Let's discuss more.

thanks,

 - Joel


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
> -- 
> 2.24.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
