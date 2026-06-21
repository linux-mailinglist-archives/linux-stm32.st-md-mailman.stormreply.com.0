Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tfBXEIXzN2qJVwcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Jun 2026 16:21:57 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD9C6AB09D
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Jun 2026 16:21:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=goodmis.org (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45D5CC8F28C;
	Sun, 21 Jun 2026 14:21:56 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com
 [216.40.44.15])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB1F4C5A4DF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Jun 2026 14:21:54 +0000 (UTC)
Received: from omf19.hostedemail.com (lb01a-stub [10.200.18.249])
 by unirelay07.hostedemail.com (Postfix) with ESMTP id 36393166CE4;
 Sun, 21 Jun 2026 14:21:51 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf19.hostedemail.com (Postfix) with ESMTPA id 1169420026; 
 Sun, 21 Jun 2026 14:21:46 +0000 (UTC)
Date: Sun, 21 Jun 2026 14:24:07 +0100
From: Steven Rostedt <rostedt@goodmis.org>
To: Yury Norov <yury.norov@gmail.com>, Steven Rostedt <rostedt@kernel.org>
User-Agent: K-9 Mail for Android
In-Reply-To: <ajfiVTlCIVlqW3sh@yury>
References: <20260621093430.264983361@kernel.org>
 <20260621093811.007634476@kernel.org> <ajfiVTlCIVlqW3sh@yury>
Message-ID: <C4ED8F5F-042B-43B6-B17A-7C3E2743E48F@goodmis.org>
MIME-Version: 1.0
X-Stat-Signature: m5id8uysanmtioempn6emsnsdgs5phht
X-Spam-Status: No, score=0.80
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19WinE5LWQa8HzvFNjRdlGwYann5/w38N8=
X-HE-Tag: 1782051706-894210
X-HE-Meta: U2FsdGVkX183C80JzklQEIa+kgNTjJZOknF6vAmyswd98TyGVgTRC8SyVWsz19w9BPwppSUtPiaeZPJXrIQbsy98gLBfQ1cJQl7yzp34fic0gzv0s9hrB6mxeJXqinMntnlfXe73gJIH/D2pt50tZwbP93X5621Z+n1JPgBDPeg2Qqz5v4YTHrFVzIaZ3VcUXUAKuj/7BGAd4D8VuUGw+dkVUMzvtoZoN/seDFwcReGQTYquH+YMzJ815xl7wR46FpiJ9+THR6XRxVuJCVh6iJAhD/ahytYNQMcMNmgFRXblBTPxbXFH63lW5Djcit4yMB+uNazqknvOnTkAw3vbLAB4CMkaAooU09WOrb4dRD5m5BQTaIQKdR+GIKMYTEwoPVIlbOYXwm+XOsikcSvwWkIxSgSJzlVeOeQCU6+wcUsByy327CPzOKFxszsj4v/QYc8SsHkTU40=
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rdma@vger.kernel.org, linux-ext4@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 John Ogness <john.ogness@linutronix.de>, linux-kbuild@vger.kernel.org,
 intel-gfx@lists.freedesktop.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@inria.fr>,
 Thomas Gleixner <tglx@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 1/2] tracing: Move non-trace_printk
 prototypes back to kernel.h
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
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER(0.00)[rostedt@goodmis.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:yury.norov@gmail.com,m:rostedt@kernel.org,m:mark.rutland@arm.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:peterz@infradead.org,m:bigeasy@linutronix.de,m:dri-devel@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-rdma@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:mhiramat@kernel.org,m:john.ogness@linutronix.de,m:linux-kbuild@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:mathieu.desnoyers@efficios.com,m:linux-arm-kernel@lists.infradead.org,m:linux-nfs@vger.kernel.org,m:torvalds@linux-foundation.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:julia.lawall@inria.fr,m:tglx@kernel.org,m:akpm@linux-foundation.org,m:linux-trace-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:yurynorov@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:url,stormreply.com:email,goodmis.org:email,goodmis.org:mid,goodmis.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8CD9C6AB09D



On June 21, 2026 2:08:37 PM GMT+01:00, Yury Norov <yury.norov@gmail.com> wrote:
>On Sun, Jun 21, 2026 at 05:34:31AM -0400, Steven Rostedt wrote:
>> From: Steven Rostedt <rostedt@goodmis.org>
>> 
>> In order to remove the include to trace_printk.h from kernel.h the tracing
>> control prototypes need to be moved back into kernel.h. That's because
>
>Please don't. Instead, you can split them out to trace_control.h, and
>include where needed. I actually have a prototype for it, FYI:
>
>https://github.com/norov/linux/tree/trace_pritk3
>

Sure, I have no problem adding another header for this.

>> they are used in other common header files like rcu.h. There's no point in
>> removing trace_printk.h from kernel.h if it just gets added back to other
>> common headers.
>> 
>> Prototypes are very cheap for the compiler and should not be an issue.
>
>It's not about cost, it's about mess. kernel.h is included everywhere.
>Is that API needed everywhere? No, it's needed in literally 10 files.
>So, no place in kernel.h.
> 

Well one of those files is rcu.h which is also pretty much included everywhere. But OK.

-- Steve 


>> 
>> 2.53.0
>> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
