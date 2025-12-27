Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B91ECF226F
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E819C60467;
	Mon,  5 Jan 2026 07:16:26 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7ADC8C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 12:16:57 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so77987805e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 04:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766837817; x=1767442617;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TucCmhZOA7i1Z82TbHC9/BloO3wYJZCYcsSdo+RW81I=;
 b=EdtSu+Dz8F5g1PUj4GS6/KghsIdXS2YOxK6SThorYi0oGalrjvF8dX5UipY4aVgwvj
 ewNz74LLtlnwSOF1njSQIdXYlNHbOIMT3GozsBUPyjkDli03Jo1bkFLGW6vuUoaLMsqO
 zFVlmA/SwAxk6b8f8q1RpP9T9YySd/OyuK83VeNw7Up5ArPLAKeJICN/Qjq2gVL+PCYU
 jmzz6wKseLCw4gKblKj+5Jj7RxmFMRDEJ26YG+/T0YEgMx/mAPy9zu+cA+Wqvw2aRVxT
 RKWXBJAHGgOWcJo5xKI2VGjYpmG0/Hmw04diCZ9/un41VH/B6WQQk8xJ8boniMC6op8M
 O/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766837817; x=1767442617;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TucCmhZOA7i1Z82TbHC9/BloO3wYJZCYcsSdo+RW81I=;
 b=KUN4zSt+gXSLp44QpfVTPdNRbv6MmUZNdnvO82VFrBTPxqkeMWA6+v3Mpn4GL75HLT
 PykicFzuwgnHCveT76tQuvNYBWULxFRnXx/TkAYoaG2Zy8wzUOP1EXkk9H7lsx/5xRbp
 OCNN4BbttXIc3FlC+ZiNkbe0ZOyybckYtdRa0O/yt772AjXTj0pp81E54txAF2HwcAxi
 WWzyBXhUlPIpop37FesDgsS71AoD88ndlwULTtftAHOMPklHTJK/bmt+5wkZbiVjid6E
 8zLVK6YIo0164ZookeH0Ah+nShgGZsJzENDFD1J3+iIKg4yQUoP8cGOYnEhkkfU+WYOy
 n61A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXExzd3Xbcf4GyaykG9gDj0DQ+vssDY84K28TjdImJnzxMclW1d5j3WJcdcuQLx1eFxfCEKiGTNmkzTw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxuqyjl0oZ2vS8sfJRCh2SxJxsrLUGaHDJxh2IE83DePvt+beyt
 vabLOt9dNhf4rU/OmR5kaP0gSY/A/2xP+u+QVgtoXiPdl+Lm4k7yRxmvg09nKdS1rVk=
X-Gm-Gg: AY/fxX7nnYvQGiqfX5ilI8ZQtZKIXRK8hb81uLtZNZ9XfIWKyX85Jnj+pMhVi3bzP/J
 cNOzlCzdS3cWZ3jbZYMkUq7GKD1BeOBOSubN10tShIuM4Uwbli2UXuH63vj4ldQ6YpdlC8csIeH
 MylFNu2hQ+xPTIp1gHjHnY0fPnheNVgS42edjFo2JsfNFzWHtO/OYyo4tGLDdm6hEixyOvMucoU
 oJJ8seqwqHShYo37UsYfOHX08XJEX1yTiYgEiDICW1HzDFWFD3Gm1YeyqpauyAF2m40hVWu8m4h
 DM4NJl3PQvG6qXgYN6UETh4Bpe5tVWNnHylcG1RGL09QiQTUH3MZMY7awWnoQ3Bo2Z2IAFVBPQ6
 11mc2BqK4LNwMdqX2V00Wrn7ujsMLHIi2Ji4ArK9MZ5rYVJc9h9r7xMo+HMm9Rx+laHSCzg4jIq
 pUJl8gH2d1
X-Google-Smtp-Source: AGHT+IF/Ogs7VBJ7Lrr7CGG7veshYzlT60dJ+vTxBr8CJY/jnjI8AOD4UQ6PSSMzci7/2/zJylqGqg==
X-Received: by 2002:a05:600c:314f:b0:47d:4fbe:e6cc with SMTP id
 5b1f17b1804b1-47d4fbee749mr22553095e9.13.1766837816753; 
 Sat, 27 Dec 2025 04:16:56 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 04:16:56 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:08 -0300
MIME-Version: 1.0
Message-Id: <20251227-printk-cleanup-part3-v1-1-21a291bcf197@suse.com>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
In-Reply-To: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
To: Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jason Wessel <jason.wessel@windriver.com>, 
 Daniel Thompson <danielt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Andreas Larsson <andreas@gaisler.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=7808;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=v10odBRNUVRtYegW6AWVkSJvotaiGNuLgfoYzWWV1rM=;
 b=pFG5z/R9mPhdW0GcbWwBqAYRxphqjaw37XiHB8zK2Svw6cgWPnnbt5ix8LVRTlDSXoMKx6YOe
 j641rf88XbSCyYZnTx7OjU6MTkBS6ecM7BDrludb53BNNBG+/Mhcz0A
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-Mailman-Approved-At: Mon, 05 Jan 2026 07:16:22 +0000
Cc: kgdb-bugreport@lists.sourceforge.net, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-hardening@vger.kernel.org,
 linux-serial@vger.kernel.org, netdev@vger.kernel.org,
 sparclinux@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 01/19] printk/nbcon: Use an enum to specify
 the required callback in console_is_usable()
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

The current usage of console_is_usable() is clumsy. The parameter
@use_atomic is boolean and thus not self-explanatory. The function is
called twice in situations when there are no-strict requirements.

Replace it with enum nbcon_write_cb which provides a more descriptive
values for all 3 situations: atomic, thread or any.

Note that console_is_usable() checks only NBCON_USE_ATOMIC because
.write_thread() callback is mandatory. But the other two values still
make sense because they describe the intention of the caller.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 arch/um/kernel/kmsg_dump.c |  3 ++-
 include/linux/console.h    | 20 +++++++++++++++++---
 kernel/debug/kdb/kdb_io.c  |  2 +-
 kernel/printk/nbcon.c      |  8 ++++----
 kernel/printk/printk.c     | 16 ++++++++--------
 5 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/arch/um/kernel/kmsg_dump.c b/arch/um/kernel/kmsg_dump.c
index fc0f543d1d8e..8ae38308b67c 100644
--- a/arch/um/kernel/kmsg_dump.c
+++ b/arch/um/kernel/kmsg_dump.c
@@ -31,7 +31,8 @@ static void kmsg_dumper_stdout(struct kmsg_dumper *dumper,
 		 * expected to output the crash information.
 		 */
 		if (strcmp(con->name, "ttynull") != 0 &&
-		    console_is_usable(con, console_srcu_read_flags(con), true)) {
+		    console_is_usable(con, console_srcu_read_flags(con),
+				      NBCON_USE_ATOMIC)) {
 			break;
 		}
 	}
diff --git a/include/linux/console.h b/include/linux/console.h
index fc9f5c5c1b04..35c03fc4ed51 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -202,6 +202,19 @@ enum cons_flags {
 	CON_NBCON_ATOMIC_UNSAFE	= BIT(9),
 };
 
+/**
+ * enum nbcon_write_cb - Defines which nbcon write() callback must be used based
+ *                       on the caller context.
+ * @NBCON_USE_ATOMIC: Use con->write_atomic().
+ * @NBCON_USE_THREAD: Use con->write_thread().
+ * @NBCON_USE_ANY:    The caller does not have any strict requirements.
+ */
+enum nbcon_write_cb {
+	NBCON_USE_ATOMIC,
+	NBCON_USE_THREAD,
+	NBCON_USE_ANY,
+};
+
 /**
  * struct nbcon_state - console state for nbcon consoles
  * @atom:	Compound of the state fields for atomic operations
@@ -622,7 +635,8 @@ extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
  * which can also play a role in deciding if @con can be used to print
  * records.
  */
-static inline bool console_is_usable(struct console *con, short flags, bool use_atomic)
+static inline bool console_is_usable(struct console *con, short flags,
+				     enum nbcon_write_cb nwc)
 {
 	if (!(flags & CON_ENABLED))
 		return false;
@@ -631,7 +645,7 @@ static inline bool console_is_usable(struct console *con, short flags, bool use_
 		return false;
 
 	if (flags & CON_NBCON) {
-		if (use_atomic) {
+		if (nwc & NBCON_USE_ATOMIC) {
 			/* The write_atomic() callback is optional. */
 			if (!con->write_atomic)
 				return false;
@@ -679,7 +693,7 @@ static inline bool nbcon_kdb_try_acquire(struct console *con,
 					 struct nbcon_write_context *wctxt) { return false; }
 static inline void nbcon_kdb_release(struct nbcon_write_context *wctxt) { }
 static inline bool console_is_usable(struct console *con, short flags,
-				     bool use_atomic) { return false; }
+				     enum nbcon_write_cb nwc) { return false; }
 #endif
 
 extern int console_set_on_cmdline;
diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 61c1690058ed..6ffb962392a4 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -591,7 +591,7 @@ static void kdb_msg_write(const char *msg, int msg_len)
 	for_each_console_srcu(c) {
 		short flags = console_srcu_read_flags(c);
 
-		if (!console_is_usable(c, flags, true))
+		if (!console_is_usable(c, flags, NBCON_USE_ATOMIC))
 			continue;
 		if (c == dbg_io_ops->cons)
 			continue;
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index be5a04367e60..13865ef85990 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1184,7 +1184,7 @@ static bool nbcon_kthread_should_wakeup(struct console *con, struct nbcon_contex
 	cookie = console_srcu_read_lock();
 
 	flags = console_srcu_read_flags(con);
-	if (console_is_usable(con, flags, false)) {
+	if (console_is_usable(con, flags, NBCON_USE_THREAD)) {
 		/* Bring the sequence in @ctxt up to date */
 		ctxt->seq = nbcon_seq_read(con);
 
@@ -1251,7 +1251,7 @@ static int nbcon_kthread_func(void *__console)
 
 		con_flags = console_srcu_read_flags(con);
 
-		if (console_is_usable(con, con_flags, false))
+		if (console_is_usable(con, con_flags, NBCON_USE_THREAD))
 			backlog = nbcon_emit_one(&wctxt, false);
 
 		console_srcu_read_unlock(cookie);
@@ -1650,7 +1650,7 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
 		if (!(flags & CON_NBCON))
 			continue;
 
-		if (!console_is_usable(con, flags, true))
+		if (!console_is_usable(con, flags, NBCON_USE_ATOMIC))
 			continue;
 
 		if (nbcon_seq_read(con) >= stop_seq)
@@ -1904,7 +1904,7 @@ void nbcon_device_release(struct console *con)
 	 */
 	cookie = console_srcu_read_lock();
 	printk_get_console_flush_type(&ft);
-	if (console_is_usable(con, console_srcu_read_flags(con), true) &&
+	if (console_is_usable(con, console_srcu_read_flags(con), NBCON_USE_ATOMIC) &&
 	    !ft.nbcon_offload &&
 	    prb_read_valid(prb, nbcon_seq_read(con), NULL)) {
 		/*
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 7394f1b6033b..5f4b84f9562e 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3203,7 +3203,9 @@ static bool console_flush_one_record(bool do_cond_resched, u64 *next_seq, bool *
 		if ((flags & CON_NBCON) && (ft.nbcon_atomic || ft.nbcon_offload))
 			continue;
 
-		if (!console_is_usable(con, flags, !do_cond_resched))
+		if (!console_is_usable(con, flags,
+				       do_cond_resched ? NBCON_USE_THREAD
+						       : NBCON_USE_ATOMIC))
 			continue;
 		any_usable = true;
 
@@ -3392,7 +3394,7 @@ void console_unblank(void)
 	 */
 	cookie = console_srcu_read_lock();
 	for_each_console_srcu(c) {
-		if (!console_is_usable(c, console_srcu_read_flags(c), true))
+		if (!console_is_usable(c, console_srcu_read_flags(c), NBCON_USE_ATOMIC))
 			continue;
 
 		if (c->unblank) {
@@ -3432,7 +3434,7 @@ void console_unblank(void)
 
 	cookie = console_srcu_read_lock();
 	for_each_console_srcu(c) {
-		if (!console_is_usable(c, console_srcu_read_flags(c), true))
+		if (!console_is_usable(c, console_srcu_read_flags(c), NBCON_USE_ATOMIC))
 			continue;
 
 		if (c->unblank)
@@ -3633,7 +3635,7 @@ static bool legacy_kthread_should_wakeup(void)
 		if ((flags & CON_NBCON) && (ft.nbcon_atomic || ft.nbcon_offload))
 			continue;
 
-		if (!console_is_usable(con, flags, false))
+		if (!console_is_usable(con, flags, NBCON_USE_THREAD))
 			continue;
 
 		if (flags & CON_NBCON) {
@@ -4204,7 +4206,7 @@ static int unregister_console_locked(struct console *console)
 
 	if (!console_is_registered_locked(console))
 		res = -ENODEV;
-	else if (console_is_usable(console, console->flags, true))
+	else if (console_is_usable(console, console->flags, NBCON_USE_ATOMIC))
 		__pr_flush(console, 1000, true);
 
 	/* Disable it unconditionally */
@@ -4485,10 +4487,8 @@ static bool __pr_flush(struct console *con, int timeout_ms, bool reset_on_progre
 			 * that they make forward progress, so only increment
 			 * @diff for usable consoles.
 			 */
-			if (!console_is_usable(c, flags, true) &&
-			    !console_is_usable(c, flags, false)) {
+			if (!console_is_usable(c, flags, NBCON_USE_ANY))
 				continue;
-			}
 
 			if (flags & CON_NBCON) {
 				printk_seq = nbcon_seq_read(c);

-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
