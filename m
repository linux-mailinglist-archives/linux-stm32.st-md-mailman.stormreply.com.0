Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 746F1CF2270
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C4D2C60469;
	Mon,  5 Jan 2026 07:16:26 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B58C1C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 12:17:06 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so61961565e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 04:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766837826; x=1767442626;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rhFoe+/fNVQYtucZwNZBdpwy2GyzZc29S0jBT7dXZmU=;
 b=MeOZ8I3SM6xLo8gAdJlA8T+wopziMrrzRMzwkjae3RVv/XOjHDzDvv7tvTHTOmyl+V
 wWwlwmblCaxxDq0obh1JuPD+pT7Oh3EZ13wCRuJAWy0WveAcKIfz8wyizi3vT7d+cAsa
 ZtE6yh22lnqV6JV28BTYZYEm4OVcB++gOZd7Oxefy1aQTJSoYBVYXEPhJ7J/A0saO1JH
 QlqaP0Ha/qVnMaxXDD0KmE2Vy7jfeNewMtg+sn9Vf0Yrdbf+cRjQEp/UUSNWj6Cd6woz
 O0Cx70KoelpsbH+fpZfh9m7TK613t6QOznhYyHaWf5kMVK+O6d0f1rf+gflW1pTdQ5QU
 bPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766837826; x=1767442626;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rhFoe+/fNVQYtucZwNZBdpwy2GyzZc29S0jBT7dXZmU=;
 b=Q6/rE1fSco/CdmBSepeionhMY8kSuv4RpJSp1Hdmp2VoYXL9MVyAQHLRL1iDIFgxfz
 oJ301JcEUNOe1H8oaZbJKOg5qn+D1bjRkBVZPQaus66aIrQq6i6KP1KbiRtCLUScKPrl
 7sVCamkqgtYTScWnDAOyok/kKKv0OzygFkGLg24zYPhV6UjqGE+mqOqOA/wMnObFyq6K
 kO+VA1ERHXfxq2yltoGMppXXl/5jGw0Wb6T0Q7wap6zVqLjJkPEJamPB2kZ5biIhTrvD
 ps4preYbCDhii9R4Ebt8KFKljxo5MZaRU0vrvkFs/CanhfodCazT+AcWDEEbWZ1Y7TMM
 32aQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXteGfZjfT6fyu6ge1+20mCgDLquYqNSocOATk7ruGEfMi5hYIatjw81c+Dzv8ZojLrdesLyWEQkyOyEw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx3lr1MxbozR/qjtW9f0LY9XrhQH/dwCaVjVMekI69jQDcEKFTf
 Y6fo5ZuDODWMDwuM9hbAGjFwxz3i3+JTerr4um3n5QnfZ5fyRSA58Mdg9vzdpChfUB8=
X-Gm-Gg: AY/fxX5c7Nsqnxj/XGwCyQUWxJbKolqygayrLImIhMPOdib3/yDDNIpV284OMy+OVaY
 V7SL2z444DmDre2GRwXMABPzYJnD3hljJTqAkFfe/mzp8Iz27/FNZ2Mz7tKiW/ASRmLsim0l5la
 W1Ai60HE8rb0IX4SyYsOXVMczk6TxpA9qqt2Sw2VQlUP+IGzbkfr0iLSO3EhpEZ4O5uPVq8w6YE
 xCkTZbBo/36QH4B2EXD6r5oZSUSftVXWwxgJDex6NnX6OWFDdrIUeWouCzb4a6iL84ajU3LGjO5
 +U4FEMzghefylmATrkrZJR5z41k0z4tR71G9rihlZtTGpWkZI7+n47B/rZZehx3QE5kfjQ5nJVx
 D8mCwRtfr81T6fCrkRRPGHOLg6lTdO5d/ELbW75yAdudbkggaZjHbeR3lot+HzE5t6UNF5dR9Xb
 s/+qz7jvPC
X-Google-Smtp-Source: AGHT+IHT9M2beqQrZzp9xbbyJud8/h6Q+UOZtBpjbh3fLwHrPjz2pLTjAJscQz+yaZcvqZw8y6NMSQ==
X-Received: by 2002:a05:600c:3b88:b0:47a:814c:ee95 with SMTP id
 5b1f17b1804b1-47d19556cf7mr356539265e9.12.1766837826003; 
 Sat, 27 Dec 2025 04:17:06 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 04:17:05 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:09 -0300
MIME-Version: 1.0
Message-Id: <20251227-printk-cleanup-part3-v1-2-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=5401;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=neUSae1tSSd9ZUIMhNnIsDOes9ZbVtbWmizb8QV3UdY=;
 b=gCYQ59/fzh5QOgA05PXMV/E/oNmzy4c9swZbzFlKNzJFERHXZDcBlPYBdYFwyrufnetFktUrT
 qugGUjzspdLDAy+AfxtSwqRvBilWtZIJfksSlShjgsgxcBNFgQvlHOk
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
Subject: [Linux-stm32] [PATCH 02/19] printk: Introduce console_is_nbcon
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

Besides checking if the current console is NBCON or not, console->flags
is also being read in order to serve as argument of the console_is_usable
function.

But CON_NBCON flag is unique: it's set just once in the console
registration and never cleared. In this case it can be possible to read
the flag when console_srcu_lock is held (which is the case when using
for_each_console).

This change makes possible to remove the flags argument from
console_is_usable in the next patches.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 include/linux/console.h   | 27 +++++++++++++++++++++++++++
 kernel/debug/kdb/kdb_io.c |  2 +-
 kernel/printk/nbcon.c     |  2 +-
 kernel/printk/printk.c    | 15 ++++++---------
 4 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/include/linux/console.h b/include/linux/console.h
index 35c03fc4ed51..dd4ec7a5bff9 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -561,6 +561,33 @@ static inline void console_srcu_write_flags(struct console *con, short flags)
 	WRITE_ONCE(con->flags, flags);
 }
 
+/**
+ * console_srcu_is_nbcon - Locklessly check whether the console is nbcon
+ * @con:	struct console pointer of console to check
+ *
+ * Requires console_srcu_read_lock to be held, which implies that @con might
+ * be a registered console. The purpose of holding console_srcu_read_lock is
+ * to guarantee that no exit/cleanup routines will run if the console
+ * is currently undergoing unregistration.
+ *
+ * If the caller is holding the console_list_lock or it is _certain_ that
+ * @con is not and will not become registered, the caller may read
+ * @con->flags directly instead.
+ *
+ * Context: Any context.
+ * Return: True when CON_NBCON flag is set.
+ */
+static inline bool console_is_nbcon(const struct console *con)
+{
+	WARN_ON_ONCE(!console_srcu_read_lock_is_held());
+
+	/*
+	 * The CON_NBCON flag is statically initialized and is never
+	 * set or cleared at runtime.
+	 */
+	return data_race(con->flags & CON_NBCON);
+}
+
 /* Variant of console_is_registered() when the console_list_lock is held. */
 static inline bool console_is_registered_locked(const struct console *con)
 {
diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 6ffb962392a4..d6de512b433a 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -596,7 +596,7 @@ static void kdb_msg_write(const char *msg, int msg_len)
 		if (c == dbg_io_ops->cons)
 			continue;
 
-		if (flags & CON_NBCON) {
+		if (console_is_nbcon(c)) {
 			struct nbcon_write_context wctxt = { };
 
 			/*
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 13865ef85990..f0f42e212caa 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1647,7 +1647,7 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
 	for_each_console_srcu(con) {
 		short flags = console_srcu_read_flags(con);
 
-		if (!(flags & CON_NBCON))
+		if (!console_is_nbcon(con))
 			continue;
 
 		if (!console_is_usable(con, flags, NBCON_USE_ATOMIC))
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 5f4b84f9562e..bd0d574be3cf 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3200,7 +3200,7 @@ static bool console_flush_one_record(bool do_cond_resched, u64 *next_seq, bool *
 		 * nbcon consoles when the nbcon consoles cannot print via
 		 * their atomic or threaded flushing.
 		 */
-		if ((flags & CON_NBCON) && (ft.nbcon_atomic || ft.nbcon_offload))
+		if (console_is_nbcon(con) && (ft.nbcon_atomic || ft.nbcon_offload))
 			continue;
 
 		if (!console_is_usable(con, flags,
@@ -3209,7 +3209,7 @@ static bool console_flush_one_record(bool do_cond_resched, u64 *next_seq, bool *
 			continue;
 		any_usable = true;
 
-		if (flags & CON_NBCON) {
+		if (console_is_nbcon(con)) {
 			progress = nbcon_legacy_emit_next_record(con, handover, cookie,
 								 !do_cond_resched);
 			printk_seq = nbcon_seq_read(con);
@@ -3458,7 +3458,6 @@ void console_unblank(void)
 static void __console_rewind_all(void)
 {
 	struct console *c;
-	short flags;
 	int cookie;
 	u64 seq;
 
@@ -3466,9 +3465,7 @@ static void __console_rewind_all(void)
 
 	cookie = console_srcu_read_lock();
 	for_each_console_srcu(c) {
-		flags = console_srcu_read_flags(c);
-
-		if (flags & CON_NBCON) {
+		if (console_is_nbcon(c)) {
 			nbcon_seq_force(c, seq);
 		} else {
 			/*
@@ -3632,13 +3629,13 @@ static bool legacy_kthread_should_wakeup(void)
 		 * consoles when the nbcon consoles cannot print via their
 		 * atomic or threaded flushing.
 		 */
-		if ((flags & CON_NBCON) && (ft.nbcon_atomic || ft.nbcon_offload))
+		if (console_is_nbcon(con) && (ft.nbcon_atomic || ft.nbcon_offload))
 			continue;
 
 		if (!console_is_usable(con, flags, NBCON_USE_THREAD))
 			continue;
 
-		if (flags & CON_NBCON) {
+		if (console_is_nbcon(con)) {
 			printk_seq = nbcon_seq_read(con);
 		} else {
 			/*
@@ -4490,7 +4487,7 @@ static bool __pr_flush(struct console *con, int timeout_ms, bool reset_on_progre
 			if (!console_is_usable(c, flags, NBCON_USE_ANY))
 				continue;
 
-			if (flags & CON_NBCON) {
+			if (console_is_nbcon(c)) {
 				printk_seq = nbcon_seq_read(c);
 			} else {
 				printk_seq = c->seq;

-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
