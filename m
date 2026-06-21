Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cz/WIbXtN2rYVgcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Jun 2026 15:57:09 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8C26AAFEE
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Jun 2026 15:57:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=kVpqfzG4;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A83BAC9AE2F;
	Sun, 21 Jun 2026 13:57:08 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4C95C5A4DB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Jun 2026 13:57:07 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-7ea6923cc94so34712187b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Jun 2026 06:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782050226; x=1782655026;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Sv1dki/80aNeWwp+36abGEnVJza7FGEeP7NOY9gPTvc=;
 b=kVpqfzG4sq3YdC6u//xK0G2394taR1KmepAzg4YwLa8xZ0h0PWKc2O3swpZW0jMNq+
 mQgvWdGEOL0zVPDW3mXqHF5VBflvHzhtLviJ13brN3IFLgkQ6i2SUQKMRBsOMmV3V8Gk
 c6pAj9SUp0xBX02SgVMothawMDTzKirWs3MVGerGoibIIRZOso10/EhXYT/0KGZR6RDC
 bFKkG+oPzlG2PsU3p9WkuV1TFX8cBUe8xHF9eT7C+CMNT2Ocu3juZBH4mOywQHTO7w9v
 g1o0+C0y+98uUpSWgRA8R8YWuPqXgptu4iGTiuuuYORRFPisHYko2w6C3ZSJ+SnZpwnc
 iyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782050226; x=1782655026;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sv1dki/80aNeWwp+36abGEnVJza7FGEeP7NOY9gPTvc=;
 b=HOJDho2OGDnEKxH2lX9kD8rHosXSHqkxFMzqke1UJKJeD0o+K/PIAzp1RpOP9QeKb/
 NgQPcr+F5MEIePHlseq8WPyJqIC83MJptOU7cue/HuCT2Xtq1edd5Vtxmx+yw24FDAZn
 kY+HqUGU6Ax8x8qBY0llmQ/jMOJGdk+RvRjoP0QfV6udNsW1XFDR4hIs2m0fMkrw4P/D
 /reF1Bm2o/oujFJY8qbu9Au58QHIomVsBMlxwgfu5W5p/B2TMWCasukBu38kkWVMJu7P
 4Nav/Nd+rVIN4y7gKgy1p0Mo9oj36fu+LhfKdOPa3eL4Bf8D4TUuF9qlqFuvZK1QX7El
 lAHw==
X-Forwarded-Encrypted: i=1;
 AHgh+Roksow9wSQyUyANx9pjavgwFt1vjvZmtTDXU38BOsIGqIG9yVhNMsM4EdOvkxnNbMR0WWxr9+aISt1c3A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyDg/nUfht16zusOucJhSBt0dW4ZQ0+Upo/3rpZgK8uxw0TAaWb
 p4QmlOxLFYSe3olk07+uPVxPLTxNa5IBgG+RZGVYLhXZ2VnSbrr1qtgZ
X-Gm-Gg: AfdE7cmVWv7dcZI46twUhAuFb+sgFlOV0n92sA4H6C3bw8vDF1yD4Px4kRijNnjLdOw
 uy/AlvQK2NBA90SS4eWrQVvt8vCWPnVZTY1CIRdWcyMhX+/ilTrXUWqW1yTzK6bVPO9TG+XgxCG
 077RfBTER3n4G6gIbBOqIbmQi/WszapXTol1SlfOdnc6CQ0AFSvhlXw8jeBnUBiuxk6xvm7OdzD
 q7lz8q1guCNCzeTdka33XrPX1qfg1iu+OPJJslF8y4+cMS3e0gqTmLiCAVMJaMTtxn+SicJj9Yw
 VbRQOuADL28JrH1ZO7gbMjHqEgHiZHUSAzXl/yRxZGtmGo7aH6mwuEv0mgC56cqsqULsbCjMt5K
 li0ySY0E31fexWKFqk5SBSWiUiVhD6Tv6WmQrjK4DzHIPTyZLk0RUlvuTs099EhlQdEm7vEzg32
 3RyDCaR0FhJRNiTpNUcfpD9z95otwb5VvVEUM=
X-Received: by 2002:a05:690c:4b8b:b0:7c5:f6c:d311 with SMTP id
 00721157ae682-80131d97bdamr100779827b3.13.1782050226417; 
 Sun, 21 Jun 2026 06:57:06 -0700 (PDT)
Received: from localhost (user-24-214-85-55.knology.net. [24.214.85.55])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8025c96fdb3sm21073127b3.1.2026.06.21.06.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jun 2026 06:57:06 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Sun, 21 Jun 2026 09:57:05 -0400
To: Yury Norov <yury.norov@gmail.com>
Message-ID: <ajftsRwe19fPTP1r@yury>
References: <20260621093430.264983361@kernel.org>
 <20260621093811.168514984@kernel.org>
 <20260621054721.7cde38f0@fedora> <ajfphe4Z8BrfYoUX@yury>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ajfphe4Z8BrfYoUX@yury>
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rdma@vger.kernel.org, linux-ext4@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 John Ogness <john.ogness@linutronix.de>, linux-kbuild@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@inria.fr>,
 Thomas Gleixner <tglx@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 2/2] tracing: Add
 CONFIG_TRACE_PRINTK_DEBUGGING to clean up kernel.h
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[yurynorov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yury.norov@gmail.com,m:mark.rutland@arm.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:peterz@infradead.org,m:bigeasy@linutronix.de,m:dri-devel@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-rdma@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:mhiramat@kernel.org,m:john.ogness@linutronix.de,m:linux-kbuild@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:linux-arm-kernel@lists.infradead.org,m:linux-nfs@vger.kernel.org,m:torvalds@linux-foundation.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:julia.lawall@inria.fr,m:tglx@kernel.org,m:akpm@linux-foundation.org,m:linux-trace-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:yurynorov@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[yurynorov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE8C26AAFEE

On Sun, Jun 21, 2026 at 09:39:17AM -0400, Yury Norov wrote:
> On Sun, Jun 21, 2026 at 05:47:21AM -0400, Steven Rostedt wrote:
> > On Sun, 21 Jun 2026 05:34:32 -0400
> > Steven Rostedt <rostedt@kernel.org> wrote:
> > 
> > > Instead of having trace_printk.h included in kernel.h, create a config
> > > TRACE_PRINTK_DEBUGGING that when set will update the CFLAGS in the
> > > Makefile to allow developers to add trace_printk() without the need to add
> > > the include for it. Having it included in the Makefile keeps it from being
> > > in the dependency chain and it will not waste extra CPU cycles for those
> > > building the kernel without using trace_printk.
> > 
> > Bah, I only tested with the config option enabled, and missed some
> > dependencies with it disabled.
> 
> Yes you did.
>  
> > For instance, rcu.h also uses ftrace_dump() so that too needs to go
> > into kernel.h.
> 
> No, it shouldn't.
> 
> > I also need to add a few more includes to trace_printk.h.
> 
> > OK, I need to run this through all my tests to find where else I missed
> > adding the includes. But the idea should hopefully satisfy everyone.
> 
> If you include it under config in kernel.h, to make the kernel buildable,

I mean: in kernel.h or in Makefile.

> you need to include trace_printk.h explicitly where it's actually used.
> IOW, apply my patch v4-7.
> 
> Then, developers who use trace_printk() on their development machine,
> will be really frustrated when their debugging code will break client
> build just because CONFIG_TRACE_PRINTK_DEBUGGING is disabled there.
> They will spend a day, at best, communicating with remote managers,
> and end up with adding #include <linux/trace_printk.h> in the files
> they touch. Is that your plan?
> 
> If I was one of those developers, the solution would be simple for me:
> don't use trace_printk() at all.
> 
> Thanks,
> Yury
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
