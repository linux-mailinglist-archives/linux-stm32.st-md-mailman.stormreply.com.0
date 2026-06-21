Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HGPaJk2/N2pYRgcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Jun 2026 12:39:09 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA8D6AA98F
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Jun 2026 12:39:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=goodmis.org (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1C1BC9AE2F;
	Sun, 21 Jun 2026 10:39:08 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com
 [216.40.44.12])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE74FC3F95E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Jun 2026 10:39:07 +0000 (UTC)
Received: from omf15.hostedemail.com (lb01a-stub [10.200.18.249])
 by unirelay05.hostedemail.com (Postfix) with ESMTP id A4F80403B5;
 Sun, 21 Jun 2026 10:39:03 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf15.hostedemail.com (Postfix) with ESMTPA id A063517; 
 Sun, 21 Jun 2026 10:38:58 +0000 (UTC)
Date: Sun, 21 Jun 2026 11:38:55 +0100
From: Steven Rostedt <rostedt@goodmis.org>
To: Thomas Gleixner <tglx@kernel.org>, Steven Rostedt <rostedt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
User-Agent: K-9 Mail for Android
In-Reply-To: <87ik7cmcb7.ffs@fw13>
References: <20260621093430.264983361@kernel.org>
 <20260621093811.168514984@kernel.org> <87ik7cmcb7.ffs@fw13>
Message-ID: <65FD4729-3DEB-44BF-B085-1F72A0B7BF3A@goodmis.org>
MIME-Version: 1.0
X-Stat-Signature: 1rpq566iuu696tbe6de19udoqya4ijdw
X-Spam-Status: No, score=-2.34
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+altd1Yz9Y3NVTA4Q+RMlDrpJ2CoeKO4s=
X-HE-Tag: 1782038338-801961
X-HE-Meta: U2FsdGVkX1+UIJ7kmLtbV5k3wlv8csQwDalYtg7WqKufnOv7be+VuRDa3ft8H3X3zzwfr+uJaQZNz0sDC4oyI98+t0mZe8z4QM7YVjOJ7k9IvaQO5X/gwLzm/T/snIDf9B1tqJjVQMbg/Fnqr36PDksXLybxk5Wk4szMxT0dI7RGk8YrmbCkpbiPzakXtErPJu/4LvGLwyxtHWX9zek973SlOgxvLlgqkXDRAT2+DqJr5WMtzWdQf68LXDneXrIH36GLwhtQHs9JqXlxGiQxIii+hAq+RQvxokuLaf3ukb8Kl6fOR60wgmpjUFzbMjevVHTotC5pRIjw762yNXa4cwdML3kSKjmj+IzsGxPuo8Puez99eB9siQ==
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 John Ogness <john.ogness@linutronix.de>, linux-rdma@vger.kernel.org,
 linux-ext4@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
 linux-kbuild@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-usb@vger.kernel.org,
 Julia Lawall <julia.lawall@inria.fr>, Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
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
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:rostedt@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:mark.rutland@arm.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:peterz@infradead.org,m:bigeasy@linutronix.de,m:dri-devel@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:john.ogness@linutronix.de,m:linux-rdma@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:yury.norov@gmail.com,m:linux-kbuild@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:mathieu.desnoyers@efficios.com,m:linux-arm-kernel@lists.infradead.org,m:linux-nfs@vger.kernel.org,m:torvalds@linux-foundation.org,m:linux-usb@vger.kernel.org,m:julia.lawall@inria.fr,m:mhiramat@kernel.org,m:akpm@linux-foundation.org,m:linuxppc-dev@lists.ozlabs.org,m:yurynorov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rostedt@goodmis.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,infradead.org,linutronix.de,lists.freedesktop.org,st-md-mailman.stormreply.com,gmail.com,efficios.com,lists.infradead.org,linux-foundation.org,inria.fr,kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0BA8D6AA98F



On June 21, 2026 11:13:00 AM GMT+01:00, Thomas Gleixner <tglx@kernel.org> wrote:
>On Sun, Jun 21 2026 at 05:34, Steven Rostedt wrote:
>> Instead of having trace_printk.h included in kernel.h, create a config
>> TRACE_PRINTK_DEBUGGING that when set will update the CFLAGS in the
>> Makefile to allow developers to add trace_printk() without the need to add
>> the include for it. Having it included in the Makefile keeps it from being
>> in the dependency chain and it will not waste extra CPU cycles for those
>> building the kernel without using trace_printk.
>
>IOW, you make it worse just because.
>
>With the header being separate I add the three trace_printk()s and the
>include to the source file I'm investigating. The recompile will build
>exactly this source file.
>
>Having to enable the config knob will result in a full kernel rebuild
>for no value.
>
>Seriously?

Like having lockdep enabled, this would always be set in the development environment. It's not something to only enable when you need to add a trace_printk. If you don't want to rebuild everything, by all means add the include file by file. There's nothing preventing you to do that with this solution.

-- Steve 

P.S. I'm replying on my phone as I'm in the London Tube. Thus why I'm not trimming my email.


>
>Thanks,
>
>        tglx
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
