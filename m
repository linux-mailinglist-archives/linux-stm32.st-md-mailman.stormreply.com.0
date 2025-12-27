Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A090CF22A4
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 402B8C7A845;
	Mon,  5 Jan 2026 07:16:28 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06669C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 12:19:44 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-47d493a9b96so5714065e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 04:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766837983; x=1767442783;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xV/54pzRS8Etay7a+DmZn75b0ho6rdI/NPswC/OMCoI=;
 b=FxCluSJzel5LRtFQDbjcDgv04Lqhag/Mz/VAxDlMdu8dfR3AYA58mXnNAmx2owKyw8
 PR0e0NO/dNXLDUMfKgIyUMyO00FdfewxOHgcW9G9nlNUQ01jTVA7FkNcFf7tfSL1kW1z
 4i5sZ4Q8DfcCDPUB+Lk5R0eOoYKKdxh+cWiIozdtMQGy8KJ4NAX61tNDNX/+uUprCPTv
 gjz8mpCoqsj6Q+hz4ji9h51KDZT81gDmSUpZCTlj946wGjnNDdAPe6NmxIKtHyR9X8s3
 vgJ92+FPrZ5E8ljZNtJQvqJOA2ImRbMUX2O+SGW1OgLR/pv7f9ZmVWY71v75GVBmFpcN
 gKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766837983; x=1767442783;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xV/54pzRS8Etay7a+DmZn75b0ho6rdI/NPswC/OMCoI=;
 b=Q4zNFOnc5OfKwq1ac8kBLfVflRHBgiyXXpyp9nZCCgb3a+gkO55BDGnMOVALkZCtRd
 6okNZ9KXJR1EvuAsIRDntzs9QJW2ZuA8fSkft7uJBe9187l2kt+7juY6I2LqAw1ho+gi
 bS16mF9rhyB3hFJf8MIJyD9BxBJyjXw3DXt6+djowI5YFlES8T/EvczipRkFU4K4qapd
 YUjKknYr5ZW8Z6keA3L/aKYkJG81DaLkr/CJO1F8Szsk1HltepCIfpMaZWDLwGmts/ut
 fLedT7AsNwuV0MOrpU9ymW0yXh9ey472paIgdayd2qNGFdl3RQACfNv6xZyxyXofohYP
 alRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrIorOdjDDIYvcN0zQS8sYJhpeJU+ME5BVr13Ha4COGWIoxs1rrOgyyvxmoF1XCF8G1/OKqlNu8V1Zww==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywh4fVC+SbTqM2B7TSgNuQmF9kL66FF87raxhnTvlmWw1j/FzPY
 bJqP9rpUh8wdNWCLzgHzuOqBDq176R3/clTAxfhy4k4Vt6DMsw8mpxzL0Kt55q8Glpo=
X-Gm-Gg: AY/fxX7BKIC4X94BzebhNr50A/s3vbQiYnzwgwIQq7FHe3vCqwFxEIrmB0z4C3M4S9W
 oyLpZfyAjM9Cyr3fl/gP+qx9gCzajEvEN4AnSW/DGk5veo/ZSF05XB+JafX5PHeTIFtlIzHqsXc
 VqWBAfK+qYW2zjimuspBuOEGipjH4P1j58MRGjUZd1EEgHWi970ALKBcFz8E3DuZKdF0wXqYks/
 mtSJAV37xuLgcSwprYIkyDR5w+Bu51MlufBVEFvLfBPplOnz1bGgoOlaVBZ6z2+hZ4aQ/7SLgcY
 LraJZxhvvf5FiOrRGpySpx2zYlpcbc4uZ04tZDJ/3HTfoRssv219rVCGw1S235nxUcfUtYGg3ir
 c1OEQ14mW5GCZhSCdZO3zy3BmkYXAR/BAzqEWogmmpHI4RSDSaPpewZEBbeeR/9MGCWnSqPqCdO
 ZX9TEhP8CNO9et0ev4gCo=
X-Google-Smtp-Source: AGHT+IH8iMWTGKOo0ODMODi1rEzmJGgWpFcndwFU+BLf6Q6Oiy3SLl7fhkZeY72om2wNWMGGrFeTWQ==
X-Received: by 2002:a05:600d:8:b0:477:5897:a0c4 with SMTP id
 5b1f17b1804b1-47d1c13fcfdmr225764485e9.4.1766837983269; 
 Sat, 27 Dec 2025 04:19:43 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 04:19:42 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:26 -0300
MIME-Version: 1.0
Message-Id: <20251227-printk-cleanup-part3-v1-19-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=5342;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=jfxXivsE45EkgkvCbI8I2BEVFtLSwL83e0mmBVPuH+w=;
 b=L4bmhgBbhK4MabaljXOFYoWoPA/F2Ms1Hw5KRZJ0wiLbS51oCxDTE2j2nmUG21whYB1lNSvfW
 KXB3PChlBf2AMEmTwaAmskLdw1SadRBF3zXvV826sJWL27JOeadfagz
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
Subject: [Linux-stm32] [PATCH 19/19] printk: Remove CON_ENABLED flag
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

All remaining usages of CON_ENABLED were removed from console drivers
that were being registered without being specified on boot using console=
argument.

The usefulness of the flag was questionable since at first it meant that
the console was ready to print records. Later on, console drivers started
to set the flag when registering the console to make sure that the
console would be registered even without being specified by a kernel
argument.

With the inclusion a global state for system wide suspend/resume
in place, with console_{suspend,resume} handling CON_SUSPEND, and with
console_is_usable helper being more used, the CON_ENABLED flag can be
safely removed.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 fs/proc/consoles.c      |  1 -
 include/linux/console.h | 27 ++++++++++-----------------
 kernel/printk/printk.c  | 15 ++-------------
 3 files changed, 12 insertions(+), 31 deletions(-)

diff --git a/fs/proc/consoles.c b/fs/proc/consoles.c
index b7cab1ad990d..b6916ed7957b 100644
--- a/fs/proc/consoles.c
+++ b/fs/proc/consoles.c
@@ -18,7 +18,6 @@ static int show_console_dev(struct seq_file *m, void *v)
 		short flag;
 		char name;
 	} con_flags[] = {
-		{ CON_ENABLED,		'E' },
 		{ CON_CONSDEV,		'C' },
 		{ CON_BOOT,		'B' },
 		{ CON_NBCON,		'N' },
diff --git a/include/linux/console.h b/include/linux/console.h
index 7d374a29a625..0ab02f7ba307 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -164,9 +164,6 @@ static inline void con_debug_leave(void) { }
  *			consoles or read by userspace via syslog() syscall.
  * @CON_CONSDEV:	Indicates that the console driver is backing
  *			/dev/console.
- * @CON_ENABLED:	Indicates if a console is allowed to print records. If
- *			false, the console also will not advance to later
- *			records.
  * @CON_BOOT:		Marks the console driver as early console driver which
  *			is used during boot before the real driver becomes
  *			available. It will be automatically unregistered
@@ -192,14 +189,13 @@ static inline void con_debug_leave(void) { }
 enum cons_flags {
 	CON_PRINTBUFFER		= BIT(0),
 	CON_CONSDEV		= BIT(1),
-	CON_ENABLED		= BIT(2),
-	CON_BOOT		= BIT(3),
-	CON_ANYTIME		= BIT(4),
-	CON_BRL			= BIT(5),
-	CON_EXTENDED		= BIT(6),
-	CON_SUSPENDED		= BIT(7),
-	CON_NBCON		= BIT(8),
-	CON_NBCON_ATOMIC_UNSAFE	= BIT(9),
+	CON_BOOT		= BIT(2),
+	CON_ANYTIME		= BIT(3),
+	CON_BRL			= BIT(4),
+	CON_EXTENDED		= BIT(5),
+	CON_SUSPENDED		= BIT(6),
+	CON_NBCON		= BIT(7),
+	CON_NBCON_ATOMIC_UNSAFE	= BIT(8),
 };
 
 /**
@@ -522,9 +518,9 @@ extern bool consoles_suspended;
  *
  * Requires console_srcu_read_lock to be held, which implies that @con might
  * be a registered console. The purpose of holding console_srcu_read_lock is
- * to guarantee that the console state is valid (CON_SUSPENDED/CON_ENABLED)
- * and that no exit/cleanup routines will run if the console is currently
- * undergoing unregistration.
+ * to guarantee that the console state is valid (CON_SUSPENDED) and that no
+ * exit/cleanup routines will run if the console is currently undergoing
+ * unregistration.
  *
  * If the caller is holding the console_list_lock or it is _certain_ that
  * @con is not and will not become registered, the caller may read
@@ -706,9 +702,6 @@ static inline bool __console_is_usable(struct console *con, short flags,
 	if (all_suspended)
 		return false;
 
-	if (!(flags & CON_ENABLED))
-		return false;
-
 	if ((flags & CON_SUSPENDED))
 		return false;
 
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index c5c05e4d0a67..9cb0911997e5 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3890,21 +3890,17 @@ static int try_enable_preferred_console(struct console *newcon,
 			if (err)
 				return err;
 		}
-		newcon->flags |= CON_ENABLED;
 		if (i == preferred_console)
 			newcon->flags |= CON_CONSDEV;
 		return 0;
 	}
 
-	if (force)
-		newcon->flags |= CON_ENABLED;
-
 	/*
 	 * Some consoles, such as pstore and netconsole, can be enabled even
 	 * without matching. Accept the pre-enabled consoles only when match()
 	 * and setup() had a chance to be called.
 	 */
-	if (newcon->flags & CON_ENABLED && c->user_specified == user_specified)
+	if (force && c->user_specified == user_specified)
 		return 0;
 
 	return -ENOENT;
@@ -3919,8 +3915,6 @@ static void try_enable_default_console(struct console *newcon)
 	if (console_call_setup(newcon, NULL) != 0)
 		return;
 
-	newcon->flags |= CON_ENABLED;
-
 	if (newcon->device)
 		newcon->flags |= CON_CONSDEV;
 }
@@ -3977,10 +3971,8 @@ static u64 get_init_console_seq(struct console *newcon, bool bootcon_registered)
 				for_each_console(con) {
 					u64 seq;
 
-					if (!(con->flags & CON_BOOT) ||
-					    !(con->flags & CON_ENABLED)) {
+					if (!(con->flags & CON_BOOT))
 						continue;
-					}
 
 					if (con->flags & CON_NBCON)
 						seq = nbcon_seq_read(con);
@@ -4233,9 +4225,6 @@ static int unregister_console_locked(struct console *console)
 				     consoles_suspended, NBCON_USE_ATOMIC))
 		__pr_flush(console, 1000, true);
 
-	/* Disable it unconditionally */
-	console_srcu_write_flags(console, console->flags & ~CON_ENABLED);
-
 	if (res < 0)
 		return res;
 

-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
