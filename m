Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TTbYAJplOWpwrgcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jun 2026 18:40:58 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FBB6B1327
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jun 2026 18:40:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=infradead.org header.s=bombadil.20210309 header.b=wSEig2tX;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=infradead.org (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36859C8F275;
	Mon, 22 Jun 2026 16:40:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 692FDC7A833
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jun 2026 16:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=c5UMhYqzW3FXITWipN5SHhAQOB1P9YUKBIDy0r3xPQw=; b=wSEig2tXNqqYlMi+DO0fVntY5n
 xOHolZZKA+fIDoV0P9vbcZYk+nTw3ZO3neQaPzi4xv2gcxwSzlDonXdcprWpDH2QVuSHb1XstdPJW
 SDJunku4cTdk3jGABXOOirk4qvdvStLyf+TSspP6lyyvSkgzI8foJ7iUHjAWC1KMbyOnlr8Bk2/AC
 kSmplFs4mh7vU8qt6mUcBWozaXfZYbjxcaOPfxhFG3Z95uao/bptRNf0v9TlnvAPmJRfMGZZ11YUj
 Kd2cOw4Cnm3blaF1fkpC/rbtuwYhawbpOJtgBO9UdgKUgdoYUd8ev6TfDb5XWKvISvKwTYP33Ug+E
 awdU0f0A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wbhhW-00000005CFj-0vuV; Mon, 22 Jun 2026 16:40:46 +0000
Message-ID: <08b3c961-18bb-43d9-8d7f-8a87bcad0afa@infradead.org>
Date: Mon, 22 Jun 2026 09:40:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@kernel.org>
References: <20260621093430.264983361@kernel.org>
 <20260622083440.GX49951@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260622083440.GX49951@noisy.programming.kicks-ass.net>
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 John Ogness <john.ogness@linutronix.de>, linux-rdma@vger.kernel.org,
 linux-ext4@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, linux-kbuild@vger.kernel.org,
 intel-gfx@lists.freedesktop.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@inria.fr>,
 Thomas Gleixner <tglx@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 0/2] tracing: Move trace_printk.h out of
	kernel.h
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[infradead.org:s=bombadil.20210309];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:peterz@infradead.org,m:rostedt@kernel.org,m:mark.rutland@arm.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:bigeasy@linutronix.de,m:dri-devel@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:john.ogness@linutronix.de,m:linux-rdma@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:mhiramat@kernel.org,m:yury.norov@gmail.com,m:linux-kbuild@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:mathieu.desnoyers@efficios.com,m:linux-arm-kernel@lists.infradead.org,m:linux-nfs@vger.kernel.org,m:torvalds@linux-foundation.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:julia.lawall@inria.fr,m:tglx@kernel.org,m:akpm@linux-foundation.org,m:linux-trace-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:yurynorov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,linutronix.de,lists.freedesktop.org,st-md-mailman.stormreply.com,kernel.org,gmail.com,efficios.com,lists.infradead.org,linux-foundation.org,inria.fr,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,infradead.org:from_mime,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 85FBB6B1327



On 6/22/26 1:34 AM, Peter Zijlstra wrote:
> On Sun, Jun 21, 2026 at 05:34:30AM -0400, Steven Rostedt wrote:
>> There's been complaints about trace_printk() being defined in kernel.h as it
>> can increase the compilation time. As it is only used by some developers for
>> debugging purposes, it should not be in kernel.h causing lots of wasted CPU
>> cycles for those that do not ever care about it.
>>
>> Instead, add a CONFIG_TRACE_PRINTK_DEBUGGING option that developers that do
>> use it can set and not have to always remember to add #include <linux/trace_printk.h>
>> to the files they add trace_printk() while debugging. It also means that
>> those that do not have that config set will not have to worry about wasted
>> CPU cycles as it is only include in the CFLAGS when the option is set, and
>> its completely ignored otherwise.
> 
> Did you forget your C 101 class? If you use a function, you gotta
> include the relevant header.

Also item #1 in Documentation/process/submit-checklist.rst.

> You don't see userspace saying: 'Hey, you know what, perhaps we should
> add stdio.h to every other header, just in case someone wants to
> printf()' either.
> 
> I really don't understand your argument. Yes, maybe someone will forget
> and then either their editor (if they have a halfway modern setup with
> LSP enabled) or their build will complain, but so what? This is all
> trivial stuff, surely we have more pressing matters to concern outselves
> with?



-- 
~Randy

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
