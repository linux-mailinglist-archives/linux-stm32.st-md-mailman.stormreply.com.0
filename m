Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id axevHyLNOGoxiQcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jun 2026 07:50:26 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E52416ACD36
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jun 2026 07:50:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=CPvoIDGL;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82A20C9AE52;
	Mon, 22 Jun 2026 05:50:25 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E13A6C5A4DF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Jun 2026 09:37:53 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 99C0F60051;
 Sun, 21 Jun 2026 09:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44EEE1F000E9;
 Sun, 21 Jun 2026 09:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782034672;
 bh=3PM2SwKGUgQ1Wfor83rkZsilDOPTMWeMgpO7Hmp6Coc=;
 h=Date:From:To:Cc:Subject;
 b=CPvoIDGL14sCX5ylLaYUAhDC9lMcMiJh12IJzutGSGQKhhN/j3P7fMe1lw15m5Roc
 tHpoEk8Aby4R7yyQzmUbl4hKAdLn06DdHEiYs3o1201v2up+FU7xKvnepQ/nPPwDCI
 WFkQeLslfQ8Kj6y7aV8P00hG40B3FZDEvni22GswCCp3bAgMXKZfMgiJsONy+BOgVi
 k0p/zCAiBS0MY4A0IhU6SDokj6lXppltL7JA3pcuCP15DKxW8Mk4X/xfQ3c3P97y2z
 c5uOUbqO06EeOjVenm17mc5XrEaYLlP7aug5hC/9nFo5DtP/NtxZmsipMAfim8Ib+w
 nCbGOugNardpA==
Received: from rostedt by gandalf with local (Exim 4.99.3)
 (envelope-from <rostedt@kernel.org>) id 1wbEd0-00000001qTd-46mY;
 Sun, 21 Jun 2026 05:38:10 -0400
Message-ID: <20260621093430.264983361@kernel.org>
User-Agent: quilt/0.69
Date: Sun, 21 Jun 2026 05:34:30 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
X-Mailman-Approved-At: Mon, 22 Jun 2026 05:50:24 +0000
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 John Ogness <john.ogness@linutronix.de>, linux-rdma@vger.kernel.org,
 linux-ext4@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, linux-kbuild@vger.kernel.org,
 intel-gfx@lists.freedesktop.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-usb@vger.kernel.org,
 Julia Lawall <julia.lawall@inria.fr>, Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Subject: [Linux-stm32] [PATCH 0/2] tracing: Move trace_printk.h out of
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:-];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,infradead.org,linutronix.de,lists.freedesktop.org,st-md-mailman.stormreply.com,kernel.org,gmail.com,efficios.com,lists.infradead.org,linux-foundation.org,inria.fr,lists.ozlabs.org];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[rostedt@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:mark.rutland@arm.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:peterz@infradead.org,m:bigeasy@linutronix.de,m:dri-devel@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:john.ogness@linutronix.de,m:linux-rdma@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:tglx@kernel.org,m:yury.norov@gmail.com,m:linux-kbuild@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:mathieu.desnoyers@efficios.com,m:linux-arm-kernel@lists.infradead.org,m:linux-nfs@vger.kernel.org,m:torvalds@linux-foundation.org,m:linux-usb@vger.kernel.org,m:julia.lawall@inria.fr,m:mhiramat@kernel.org,m:akpm@linux-foundation.org,m:linuxppc-dev@lists.ozlabs.org,m:yurynorov@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rostedt@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E52416ACD36

There's been complaints about trace_printk() being defined in kernel.h as it
can increase the compilation time. As it is only used by some developers for
debugging purposes, it should not be in kernel.h causing lots of wasted CPU
cycles for those that do not ever care about it.

Instead, add a CONFIG_TRACE_PRINTK_DEBUGGING option that developers that do
use it can set and not have to always remember to add #include <linux/trace_printk.h>
to the files they add trace_printk() while debugging. It also means that
those that do not have that config set will not have to worry about wasted
CPU cycles as it is only include in the CFLAGS when the option is set, and
its completely ignored otherwise.

Steven Rostedt (2):
      tracing: Move non-trace_printk prototypes back to kernel.h
      tracing: Add CONFIG_TRACE_PRINTK_DEBUGGING to clean up kernel.h

----
 .../driver_development_debugging_guide.rst         |  2 +-
 Makefile                                           |  5 +++++
 arch/powerpc/kvm/book3s_xics.c                     |  1 +
 drivers/gpu/drm/i915/gt/intel_gtt.h                |  1 +
 drivers/gpu/drm/i915/i915_gem.h                    |  1 +
 drivers/hwtracing/stm/dummy_stm.c                  |  4 ++++
 drivers/infiniband/hw/hfi1/trace_dbg.h             |  1 +
 drivers/usb/early/xhci-dbc.c                       |  1 +
 fs/ext4/inline.c                                   |  1 +
 include/linux/kernel.h                             | 19 ++++++++++++++++++-
 include/linux/sunrpc/debug.h                       |  1 +
 include/linux/trace_printk.h                       | 22 +++-------------------
 kernel/trace/Kconfig                               | 10 ++++++++++
 kernel/trace/ring_buffer_benchmark.c               |  1 +
 kernel/trace/trace.h                               |  1 +
 samples/fprobe/fprobe_example.c                    |  1 +
 samples/ftrace/ftrace-direct-modify.c              |  1 +
 samples/ftrace/ftrace-direct-multi-modify.c        |  1 +
 samples/ftrace/ftrace-direct-multi.c               |  2 +-
 samples/ftrace/ftrace-direct-too.c                 |  2 +-
 samples/ftrace/ftrace-direct.c                     |  2 +-
 21 files changed, 56 insertions(+), 24 deletions(-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
