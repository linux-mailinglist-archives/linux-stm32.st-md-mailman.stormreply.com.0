Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0A5CF227E
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3B08C628DC;
	Mon,  5 Jan 2026 07:16:26 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6823EC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 12:17:43 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso61934035e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 04:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766837863; x=1767442663;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8qC0U4cjRdxCF4b/YJbgVpXPFvwbnk17NoVL2cOfc8A=;
 b=PR6Jt2UINVo4tZyRDavu+rlY/8fPhK7YAZeDEgKNJ7/xMDWt4vic3Eve6Ec36DsPn2
 o7up1Fa4JsZUwNLNiDkT+moJVZaU2WpqXfj2ww85t4Nw+0o3dfOakp/bQmZpFxGP+yFS
 5czpuwoumcmg2ipRDOPcQPVgG6/543OYtd81l25eVmTHa6hdV+hmOlgGrLw3FbK9mROJ
 W4e1sLoXj83563EaRSM0GRWb8HX86Ldk10rQfH7FIZcFwUCU4m30BFE3lRSPf26bTBQc
 06WKdI6VnhQnekaaUZYqdkgUol2jYDckwlXikUqwH4nsrBz0IIVnuS8foHKrENxSFQ7e
 NXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766837863; x=1767442663;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8qC0U4cjRdxCF4b/YJbgVpXPFvwbnk17NoVL2cOfc8A=;
 b=DdV8lYt5dMkgQVgremxC/1hWTXjKtQ74EwqUksRoeIK6pT2Cdtu2dTc02Zs5XNMw0a
 LzQQMvjFhEJ8GtT3s6OX/uj9q7myARCqebBTbIKOQ6vNGBG+Cjeg7TIsMr8hpdz9bJcS
 eydFrHMjlSKQcT1RX/jqMaRHUF93FPKkXCQtGbiJSTQSbmTMRXzOVMu/N5ripaWNZruU
 nHU5TKIC4KaZJHESBNGKsZpEqbjZV/eSeWrOQAIVI9wEjlbXfllyrVmYw7uu/M0VwdGz
 6TXQROePQaSOHybmicWRO8HBbYF0/tWBiyCr/wm4M4b0B+8n9RpxTlGUM/xFTMZEhV0T
 GRMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXmsDi1OTwLc12UdBy2wY5H2wnRuQ2TGMMhtZryVUDCli7DBSr8NF6ubfyCyQ6RaHcXxIJ1mUKN0P8Ww==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyqrz7n8+g7ev7KnczgMVCMXSTzSllB0bDuAB0ambOfLvmQHENA
 nAeadfp50M9M3K0ihnDbML56UV3VT7ScH4damMKvBNH0O3HvaH4FeeWygSbZLW26VJY=
X-Gm-Gg: AY/fxX5+/PEfCcNW5WGJvj96D449ZC41qs822Jwq3pPcBVJnN6jTCOIoZfOmtwSlX+F
 5K5rLVwi0JwZOSH5V2NuCtgkDARkEGRB4yXO6eaQP8bydD6NfJI5wsAviCILt2v8P8zUyp32B9Y
 TTeRHsSf5va5Tg1ymJineIP5aSHwX4nRgiPiwbzpxQbHSLWwzW2uUCp8KuOqGFY5nbfaV7DGOZC
 77gOjNRJtI93+tOktl1mNbYfbpQJ3FRDfBTMPfbp6Cxye8Elx+SIzynDWplUIICoVkrbOXuQr5v
 nNeIhGGI0FKnfDluDI1P5AbyyKAfqK2n/s2mmCQq2e53OZVgmmH03j6VZ+ErcB9zckhkpIBaeyc
 gW2ngRoB53edMHAZbkSlOQbTwUCgn/YfsIXiL9hpGjYn6rariSzQAAeQ22rsyNIPFmhV4AlYEvv
 gUss882++tnS1f9MVm62U=
X-Google-Smtp-Source: AGHT+IG9JI4KghQQLO4JoQ5Zx3PCxaurUWQYnoyI9pepg6l828D4iHu4xsQcwAkRrVG/7RHQ7XMpOg==
X-Received: by 2002:a05:600c:3397:b0:475:d91d:28fb with SMTP id
 5b1f17b1804b1-47be2999657mr224830455e9.4.1766837862676; 
 Sat, 27 Dec 2025 04:17:42 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 04:17:42 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:13 -0300
MIME-Version: 1.0
Message-Id: <20251227-printk-cleanup-part3-v1-6-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=5702;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=yZ/nvvnmmkaNmxpD4iXjZtoziYkh4kvSpXf/WZXovX8=;
 b=Bzarxjf3B7CuE6yunxTz81Z6xrtzP/oSyuvyRHrm78aAxtHdfrdz9xczyh+zQMNScnR1tQowx
 BZmWRp2B3qfBQ9NUKyPZEo6SC7UASze6iocMjN2ThffW7UbTy1hRyur
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
Subject: [Linux-stm32] [PATCH 06/19] printk: Introduce register_console_force
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

The register_console_force function will register a console even if it
wasn't specified on boot. The new function will act like all consoles
being registered were using the CON_ENABLED flag.

The CON_ENABLED flag will be removed in the following patches and the
drivers that use it will migrate to register_console_force instead.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 include/linux/console.h |  1 +
 kernel/printk/printk.c  | 65 ++++++++++++++++++++++++++++++++-----------------
 2 files changed, 43 insertions(+), 23 deletions(-)

diff --git a/include/linux/console.h b/include/linux/console.h
index caf9b0951129..7d374a29a625 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -792,6 +792,7 @@ enum con_flush_mode {
 extern int add_preferred_console(const char *name, const short idx, char *options);
 extern void console_force_preferred_locked(struct console *con);
 extern void register_console(struct console *);
+extern void register_console_force(struct console *c);
 extern int unregister_console(struct console *);
 extern void console_lock(void);
 extern int console_trylock(void);
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 85a8b6521d9e..c5c05e4d0a67 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3858,7 +3858,7 @@ static int console_call_setup(struct console *newcon, char *options)
  * enabled such as netconsole
  */
 static int try_enable_preferred_console(struct console *newcon,
-					bool user_specified)
+					bool user_specified, bool force)
 {
 	struct console_cmdline *c;
 	int i, err;
@@ -3896,12 +3896,15 @@ static int try_enable_preferred_console(struct console *newcon,
 		return 0;
 	}
 
+	if (force)
+		newcon->flags |= CON_ENABLED;
+
 	/*
 	 * Some consoles, such as pstore and netconsole, can be enabled even
 	 * without matching. Accept the pre-enabled consoles only when match()
 	 * and setup() had a chance to be called.
 	 */
-	if (newcon->flags & CON_ENABLED && c->user_specified ==	user_specified)
+	if (newcon->flags & CON_ENABLED && c->user_specified == user_specified)
 		return 0;
 
 	return -ENOENT;
@@ -4001,26 +4004,11 @@ static u64 get_init_console_seq(struct console *newcon, bool bootcon_registered)
 
 static int unregister_console_locked(struct console *console);
 
-/*
- * The console driver calls this routine during kernel initialization
- * to register the console printing procedure with printk() and to
- * print any messages that were printed by the kernel before the
- * console driver was initialized.
- *
- * This can happen pretty early during the boot process (because of
- * early_printk) - sometimes before setup_arch() completes - be careful
- * of what kernel features are used - they may not be initialised yet.
- *
- * There are two types of consoles - bootconsoles (early_printk) and
- * "real" consoles (everything which is not a bootconsole) which are
- * handled differently.
- *  - Any number of bootconsoles can be registered at any time.
- *  - As soon as a "real" console is registered, all bootconsoles
- *    will be unregistered automatically.
- *  - Once a "real" console is registered, any attempt to register a
- *    bootconsoles will be rejected
+/**
+ * __register_console: Register a new console
+ * @force: Register the console even if not specified on boot
  */
-void register_console(struct console *newcon)
+static void __register_console(struct console *newcon, bool force)
 {
 	bool use_device_lock = (newcon->flags & CON_NBCON) && newcon->write_atomic;
 	bool bootcon_registered = false;
@@ -4080,11 +4068,11 @@ void register_console(struct console *newcon)
 	}
 
 	/* See if this console matches one we selected on the command line */
-	err = try_enable_preferred_console(newcon, true);
+	err = try_enable_preferred_console(newcon, true, force);
 
 	/* If not, try to match against the platform default(s) */
 	if (err == -ENOENT)
-		err = try_enable_preferred_console(newcon, false);
+		err = try_enable_preferred_console(newcon, false, force);
 
 	/* printk() messages are not printed to the Braille console. */
 	if (err || newcon->flags & CON_BRL) {
@@ -4185,8 +4173,39 @@ void register_console(struct console *newcon)
 unlock:
 	console_list_unlock();
 }
+
+/*
+ * The console driver calls this routine during kernel initialization
+ * to register the console printing procedure with printk() and to
+ * print any messages that were printed by the kernel before the
+ * console driver was initialized.
+ *
+ * This can happen pretty early during the boot process (because of
+ * early_printk) - sometimes before setup_arch() completes - be careful
+ * of what kernel features are used - they may not be initialised yet.
+ *
+ * There are two types of consoles - bootconsoles (early_printk) and
+ * "real" consoles (everything which is not a bootconsole) which are
+ * handled differently.
+ *  - Any number of bootconsoles can be registered at any time.
+ *  - As soon as a "real" console is registered, all bootconsoles
+ *    will be unregistered automatically.
+ *  - Once a "real" console is registered, any attempt to register a
+ *    bootconsoles will be rejected
+ */
+void register_console(struct console *newcon)
+{
+	__register_console(newcon, false);
+}
 EXPORT_SYMBOL(register_console);
 
+
+void register_console_force(struct console *newcon)
+{
+	__register_console(newcon, true);
+}
+EXPORT_SYMBOL(register_console_force);
+
 /* Must be called under console_list_lock(). */
 static int unregister_console_locked(struct console *console)
 {

-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
