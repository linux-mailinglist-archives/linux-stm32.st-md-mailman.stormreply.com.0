Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tZ/OIyLNOGoziQcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jun 2026 07:50:26 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E99816ACD37
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jun 2026 07:50:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b="Rzm1exK/";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CB1DC9AE54;
	Mon, 22 Jun 2026 05:50:25 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1131DC9AE34
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Jun 2026 09:37:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A4A92442DE;
 Sun, 21 Jun 2026 09:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736F91F00ACA;
 Sun, 21 Jun 2026 09:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782034672;
 bh=x9RfUMnEVGBBbeJMmrB9Gq2PF5/eRDSUHk1LH8SRFss=;
 h=Date:From:To:Cc:Subject:References;
 b=Rzm1exK/Lr8OogLStjal6NQ54TlzPxU1spXVGF47rnRCN+SslkRtrIOqYNh6cG32b
 DWLjBjfxm8Stmk+IREYorcGGIjlGobo4nZBUnfI3wBRukzhYvKaFS8Z5LK80sEBpso
 QK2Ylni+TtG0fxtrNfmhys6YcOOOAoBTl/+7j3zRZsngg//jPcAXr0MQ+GnkjyqHiS
 elj+dpTQt807df3xpqvs+xGjcXPREMTdSA5XRNJkIosiOI+0ytmFGbpwh2ICyUe1w1
 uQ6l2X4lossOjcfXnEK2DppwK4dXj93q8anlcicDuvy70Ul0Y5/8S4HzNtN5qUlNvY
 m8Ydamn19ejQw==
Received: from rostedt by gandalf with local (Exim 4.99.3)
 (envelope-from <rostedt@kernel.org>) id 1wbEd1-00000001qUz-1Pst;
 Sun, 21 Jun 2026 05:38:11 -0400
Message-ID: <20260621093811.168514984@kernel.org>
User-Agent: quilt/0.69
Date: Sun, 21 Jun 2026 05:34:32 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
References: <20260621093430.264983361@kernel.org>
MIME-Version: 1.0
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
Subject: [Linux-stm32] [PATCH 2/2] tracing: Add
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
X-Rspamd-Queue-Id: E99816ACD37

From: Steven Rostedt <rostedt@goodmis.org>

Instead of having trace_printk.h included in kernel.h, create a config
TRACE_PRINTK_DEBUGGING that when set will update the CFLAGS in the
Makefile to allow developers to add trace_printk() without the need to add
the include for it. Having it included in the Makefile keeps it from being
in the dependency chain and it will not waste extra CPU cycles for those
building the kernel without using trace_printk.

Link: https://lore.kernel.org/all/CAHk-=wikCBeVFjVXiY4o-oepdbjAoir5+TcAgtL12c4u1TpZLQ@mail.gmail.com/

Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 .../debugging/driver_development_debugging_guide.rst   |  2 +-
 Makefile                                               |  5 +++++
 arch/powerpc/kvm/book3s_xics.c                         |  1 +
 drivers/gpu/drm/i915/gt/intel_gtt.h                    |  1 +
 drivers/gpu/drm/i915/i915_gem.h                        |  1 +
 drivers/hwtracing/stm/dummy_stm.c                      |  4 ++++
 drivers/infiniband/hw/hfi1/trace_dbg.h                 |  1 +
 drivers/usb/early/xhci-dbc.c                           |  1 +
 fs/ext4/inline.c                                       |  1 +
 include/linux/kernel.h                                 |  1 -
 include/linux/sunrpc/debug.h                           |  1 +
 include/linux/trace_printk.h                           |  5 +++--
 kernel/trace/Kconfig                                   | 10 ++++++++++
 kernel/trace/ring_buffer_benchmark.c                   |  1 +
 kernel/trace/trace.h                                   |  1 +
 samples/fprobe/fprobe_example.c                        |  1 +
 samples/ftrace/ftrace-direct-modify.c                  |  1 +
 samples/ftrace/ftrace-direct-multi-modify.c            |  1 +
 samples/ftrace/ftrace-direct-multi.c                   |  2 +-
 samples/ftrace/ftrace-direct-too.c                     |  2 +-
 samples/ftrace/ftrace-direct.c                         |  2 +-
 21 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/Documentation/process/debugging/driver_development_debugging_guide.rst b/Documentation/process/debugging/driver_development_debugging_guide.rst
index aca08f457793..3c87aa03622f 100644
--- a/Documentation/process/debugging/driver_development_debugging_guide.rst
+++ b/Documentation/process/debugging/driver_development_debugging_guide.rst
@@ -52,7 +52,7 @@ For the full documentation see :doc:`/core-api/printk-basics`
 Trace_printk
 ~~~~~~~~~~~~
 
-Prerequisite: ``CONFIG_DYNAMIC_FTRACE`` & ``#include <linux/ftrace.h>``
+Prerequisite: ``CONFIG_TRACE_PRINTK_DEBUGGING``
 
 It is a tiny bit less comfortable to use than printk(), because you will have
 to read the messages from the trace file (See: :ref:`read_ftrace_log`
diff --git a/Makefile b/Makefile
index d1c595db55c9..2f5923d5393b 100644
--- a/Makefile
+++ b/Makefile
@@ -840,6 +840,11 @@ ifdef CONFIG_FUNCTION_TRACER
   CC_FLAGS_FTRACE := -pg
 endif
 
+ifdef CONFIG_TRACE_PRINTK_DEBUGGING
+  # Allow trace_printk() to be used anywhere without including the header.
+  LINUXINCLUDE += -include $(srctree)/include/linux/trace_printk.h
+endif
+
 ifdef CONFIG_TRACEPOINTS
 # To check for unused tracepoints (tracepoints that are defined but never
 # called), run with:
diff --git a/arch/powerpc/kvm/book3s_xics.c b/arch/powerpc/kvm/book3s_xics.c
index 74a44fa702b0..ef5eb596a56e 100644
--- a/arch/powerpc/kvm/book3s_xics.c
+++ b/arch/powerpc/kvm/book3s_xics.c
@@ -26,6 +26,7 @@
 #if 1
 #define XICS_DBG(fmt...) do { } while (0)
 #else
+#include <linux/trace_printk.h>
 #define XICS_DBG(fmt...) trace_printk(fmt)
 #endif
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index b54ee4f25af1..f6f223090760 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -35,6 +35,7 @@
 #define I915_GFP_ALLOW_FAIL (GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN)
 
 #if IS_ENABLED(CONFIG_DRM_I915_TRACE_GTT)
+#include <linux/trace_printk.h>
 #define GTT_TRACE(...) trace_printk(__VA_ARGS__)
 #else
 #define GTT_TRACE(...)
diff --git a/drivers/gpu/drm/i915/i915_gem.h b/drivers/gpu/drm/i915/i915_gem.h
index 20b3cb29cfff..5cab1836dc1d 100644
--- a/drivers/gpu/drm/i915/i915_gem.h
+++ b/drivers/gpu/drm/i915/i915_gem.h
@@ -116,6 +116,7 @@ int i915_gem_open(struct drm_i915_private *i915, struct drm_file *file);
 #endif
 
 #if IS_ENABLED(CONFIG_DRM_I915_TRACE_GEM)
+#include <linux/trace_printk.h>
 #define GEM_TRACE(...) trace_printk(__VA_ARGS__)
 #define GEM_TRACE_ERR(...) do {						\
 	pr_err(__VA_ARGS__);						\
diff --git a/drivers/hwtracing/stm/dummy_stm.c b/drivers/hwtracing/stm/dummy_stm.c
index 38528ffdc0b3..784f9af7ccba 100644
--- a/drivers/hwtracing/stm/dummy_stm.c
+++ b/drivers/hwtracing/stm/dummy_stm.c
@@ -14,6 +14,10 @@
 #include <linux/stm.h>
 #include <uapi/linux/stm.h>
 
+#ifdef DEBUG
+#include <linux/trace_printk.h>
+#endif
+
 static ssize_t notrace
 dummy_stm_packet(struct stm_data *stm_data, unsigned int master,
 		 unsigned int channel, unsigned int packet, unsigned int flags,
diff --git a/drivers/infiniband/hw/hfi1/trace_dbg.h b/drivers/infiniband/hw/hfi1/trace_dbg.h
index 58304b91380f..30df5e246586 100644
--- a/drivers/infiniband/hw/hfi1/trace_dbg.h
+++ b/drivers/infiniband/hw/hfi1/trace_dbg.h
@@ -103,6 +103,7 @@ __hfi1_trace_def(IOCTL);
  */
 
 #ifdef HFI1_EARLY_DBG
+#include <linux/trace_printk.h>
 #define hfi1_dbg_early(fmt, ...) \
 	trace_printk(fmt, ##__VA_ARGS__)
 #else
diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index 41118bba9197..955c73bd601f 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -30,6 +30,7 @@ static struct xdbc_state xdbc;
 static bool early_console_keep;
 
 #ifdef XDBC_TRACE
+#include <linux/trace_printk.h>
 #define	xdbc_trace	trace_printk
 #else
 static inline void xdbc_trace(const char *fmt, ...) { }
diff --git a/fs/ext4/inline.c b/fs/ext4/inline.c
index 8045e4ff270c..0eff4a0c6a6c 100644
--- a/fs/ext4/inline.c
+++ b/fs/ext4/inline.c
@@ -934,6 +934,7 @@ static int ext4_da_convert_inline_data_to_extent(struct address_space *mapping,
 }
 
 #ifdef INLINE_DIR_DEBUG
+#include <linux/trace_printk.h>
 void ext4_show_inline_dir(struct inode *dir, struct buffer_head *bh,
 			  void *inline_start, int inline_size)
 {
diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index c3c68128827c..538655385089 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -31,7 +31,6 @@
 #include <linux/build_bug.h>
 #include <linux/sprintf.h>
 #include <linux/static_call_types.h>
-#include <linux/trace_printk.h>
 #include <linux/util_macros.h>
 #include <linux/wordpart.h>
 
diff --git a/include/linux/sunrpc/debug.h b/include/linux/sunrpc/debug.h
index ab61bed2f7af..7524f5d82fba 100644
--- a/include/linux/sunrpc/debug.h
+++ b/include/linux/sunrpc/debug.h
@@ -29,6 +29,7 @@ extern unsigned int		nlm_debug;
 # define ifdebug(fac)		if (unlikely(rpc_debug & RPCDBG_##fac))
 
 # if IS_ENABLED(CONFIG_SUNRPC_DEBUG_TRACE)
+#  include <linux/trace_printk.h>
 #  define __sunrpc_printk(fmt, ...)	trace_printk(fmt, ##__VA_ARGS__)
 # else
 #  define __sunrpc_printk(fmt, ...)	printk(KERN_DEFAULT fmt, ##__VA_ARGS__)
diff --git a/include/linux/trace_printk.h b/include/linux/trace_printk.h
index 879fed0805fd..66edec6d5dbf 100644
--- a/include/linux/trace_printk.h
+++ b/include/linux/trace_printk.h
@@ -1,11 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef _LINUX_TRACE_PRINTK_H
 #define _LINUX_TRACE_PRINTK_H
+#if !defined(__ASSEMBLY__) && !defined(__GENKSYMS__) && !defined(BUILD_VDSO)
 
-#include <linux/compiler_attributes.h>
 #include <linux/instruction_pointer.h>
 #include <linux/stddef.h>
 #include <linux/stringify.h>
+#include <linux/stdarg.h>
 
 /*
  * General tracing related utility functions - trace_printk(),
@@ -181,5 +182,5 @@ ftrace_vprintk(const char *fmt, va_list ap)
 }
 static inline void ftrace_dump(enum ftrace_dump_mode oops_dump_mode) { }
 #endif /* CONFIG_TRACING */
-
+#endif /* !defined(__ASSEMBLY__) && !defined(__GENKSYMS__) */
 #endif
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 084f34dc6c9f..ffbd1b0ce66e 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -210,6 +210,16 @@ menuconfig FTRACE
 
 if FTRACE
 
+config TRACE_PRINTK_DEBUGGING
+	bool "Debug with trace_printk()"
+	help
+	  If you need to debug with trace_printk(), instead of adding
+	  include <linux/trace_printk.h> to every file you add a trace_printk
+	  to, select this option and it will add trace_printk.h to all code
+	  to allow tracing with trace_printk() with.
+
+	  If in doubt, select N
+
 config TRACEFS_AUTOMOUNT_DEPRECATED
 	bool "Automount tracefs on debugfs [DEPRECATED]"
 	depends on TRACING
diff --git a/kernel/trace/ring_buffer_benchmark.c b/kernel/trace/ring_buffer_benchmark.c
index 593e3b59e42e..2bb25caebb75 100644
--- a/kernel/trace/ring_buffer_benchmark.c
+++ b/kernel/trace/ring_buffer_benchmark.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2009 Steven Rostedt <srostedt@redhat.com>
  */
 #include <linux/ring_buffer.h>
+#include <linux/trace_printk.h>
 #include <linux/completion.h>
 #include <linux/kthread.h>
 #include <uapi/linux/sched/types.h>
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 80fe152af1dd..580a3deab1e9 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -13,6 +13,7 @@
 #include <linux/ftrace.h>
 #include <linux/trace.h>
 #include <linux/hw_breakpoint.h>
+#include <linux/trace_printk.h>
 #include <linux/trace_seq.h>
 #include <linux/trace_events.h>
 #include <linux/compiler.h>
diff --git a/samples/fprobe/fprobe_example.c b/samples/fprobe/fprobe_example.c
index bfe98ce826f3..de81b9b4ca7d 100644
--- a/samples/fprobe/fprobe_example.c
+++ b/samples/fprobe/fprobe_example.c
@@ -12,6 +12,7 @@
 
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
+#include <linux/trace_printk.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/fprobe.h>
diff --git a/samples/ftrace/ftrace-direct-modify.c b/samples/ftrace/ftrace-direct-modify.c
index 1ba1927b548e..30d0f8e644c8 100644
--- a/samples/ftrace/ftrace-direct-modify.c
+++ b/samples/ftrace/ftrace-direct-modify.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#include <linux/trace_printk.h>
 #include <linux/module.h>
 #include <linux/kthread.h>
 #include <linux/ftrace.h>
diff --git a/samples/ftrace/ftrace-direct-multi-modify.c b/samples/ftrace/ftrace-direct-multi-modify.c
index 7a7822dfeb50..f64b929e19ec 100644
--- a/samples/ftrace/ftrace-direct-multi-modify.c
+++ b/samples/ftrace/ftrace-direct-multi-modify.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#include <linux/trace_printk.h>
 #include <linux/module.h>
 #include <linux/kthread.h>
 #include <linux/ftrace.h>
diff --git a/samples/ftrace/ftrace-direct-multi.c b/samples/ftrace/ftrace-direct-multi.c
index 3fe6ddaf0b69..d32644a49554 100644
--- a/samples/ftrace/ftrace-direct-multi.c
+++ b/samples/ftrace/ftrace-direct-multi.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#include <linux/trace_printk.h>
 #include <linux/module.h>
-
 #include <linux/mm.h> /* for handle_mm_fault() */
 #include <linux/ftrace.h>
 #include <linux/sched/stat.h>
diff --git a/samples/ftrace/ftrace-direct-too.c b/samples/ftrace/ftrace-direct-too.c
index bf2411aa6fd7..266fcb233301 100644
--- a/samples/ftrace/ftrace-direct-too.c
+++ b/samples/ftrace/ftrace-direct-too.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#include <linux/trace_printk.h>
 #include <linux/module.h>
-
 #include <linux/mm.h> /* for handle_mm_fault() */
 #include <linux/ftrace.h>
 #if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
diff --git a/samples/ftrace/ftrace-direct.c b/samples/ftrace/ftrace-direct.c
index 5368c8c39cbb..85e0dff9b691 100644
--- a/samples/ftrace/ftrace-direct.c
+++ b/samples/ftrace/ftrace-direct.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#include <linux/trace_printk.h>
 #include <linux/module.h>
-
 #include <linux/sched.h> /* for wake_up_process() */
 #include <linux/ftrace.h>
 #if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
-- 
2.53.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
