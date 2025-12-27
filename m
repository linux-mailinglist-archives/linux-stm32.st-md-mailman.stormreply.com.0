Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C078CCF2279
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D02CC628B2;
	Mon,  5 Jan 2026 07:16:26 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DB6DC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 12:17:34 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso75768975e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 04:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766837853; x=1767442653;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GvSE1c/4a8QCKCTV5gdf1mCLxf9YZVQyxdWd8z10SmE=;
 b=Y4/5XC+3k01xvZ9u3kx4gxtB1mrmseCjtPmf2HW1T9tgnnkJ9y44BJDxWq1JKoHTtN
 SnCrAjJhkk/uX3ylU4B6dE504gYB5xzrpkQf1ugbXgONubkgaykbXKh9HrSWgrACccan
 Ldc9zFka8RNf8jdCT4veJffHi6GPyd9hRqu7K3NkUxeX3wEmnwCqC1eT305zF6eGwXSg
 AoETZFYPDu7Cxj3LpRrH4Ahkk2IWqZQqSdKb6Q/amS05iUFqglPS4w7P2SxuxKyD/Dt6
 M1ckNnYBgCCvWqWydK0OSGUEirQMRwFG0DUpzCLbT/AIPwOdFTun5dQ3eW6DIzAvj35x
 zKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766837853; x=1767442653;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GvSE1c/4a8QCKCTV5gdf1mCLxf9YZVQyxdWd8z10SmE=;
 b=YtdUxrlhol59bLlswvX8TuOor0twZE6nBnpnH2qbV1Pm7NlHI8YWWMBMMW7XUGuG9i
 oL9opk26kbHKj5rJhO5j7AyHFYxUU5CqtUPimKOBaelGv7++zqMw5v+Y8FwsR4LVDgos
 HNcP7APivVPMLhlDK9HoViWaHSp3KjZactPNb1K+ioCEYaAEHkq9nEe/yqlNWGmEDr4i
 7Q/Os9jkJsiGls0jZo10EhanhTVy6n/bHI5JjzR4iHdV81poToDaYmlGvFLJFDYxtg1V
 ITRYo3+z56LxVVV2dKvpQFq4JaDMcXeCOFp295hVIXb3RsLi9NVJfvjsSJ0ng5ASPDGt
 /2CQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX0qZOsOhJNanQDuXEecrjnJMoXq7QlgMG7F56xZJuKDMiVo7aQUSw9PZewQn+Bf2Hnr89dsW6fRiQIQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyQX04MyHj/L7nywKjRnsH+MYT41l09I5Z3C2BxyGyMKL1Rfvme
 bi08XZrLWe17n9z2WzrVSKLzOORTbPTnG6JR2fX7F4l+ExRjj0bSdX4D4BSdTGBvYXY=
X-Gm-Gg: AY/fxX76jqoFd0rby08I3NV0y3tDGldH8kVgel8nSp/pPJcOjjoFin+/iLPS9vheNQ1
 RJpWWf3FRcSVzYxakK11nZrRqla2sEipqIP09TtKylOBelSrtzAgR4WV/5YXVleYx3tzBTHDlAy
 /yutpDqyIdsfNa9bgPeHyeTPRygmEjcVSFVlM0ebNkwBO9bclCq+koDvJvB8TJU9dya1QJZsMHD
 8MbSrp62juRNfKC8CrqevXvKpisoMLG3r2wCnOqCCAwHA9pcQ0dm6mLwjo2/xQKwMuLWyFocrXy
 OfGbvm8ymuG4nHeVD/MBD7Q24igqkFggPQ0w+4vhO+Rf+opyz6mCx3wy6GH4TxioBBQwRzPO151
 nDVnE4nCQmWgo4WOMDILciQZ0qMMa1bHWSUXezCXS5NCzpfl1ILUKRPRApwYeZOecRD8EnLJmu9
 XATMX0+7MvAlMiG03l8QI=
X-Google-Smtp-Source: AGHT+IFc0PxKRmRSwma+5BK2z0BfbuhbWCK5ZAQiNCh/fQVQ/f+EcwX2yper4KDcLK2LLWDZAwXkgQ==
X-Received: by 2002:a05:600c:620c:b0:475:dde5:d91b with SMTP id
 5b1f17b1804b1-47d3639489cmr187665015e9.17.1766837853435; 
 Sat, 27 Dec 2025 04:17:33 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 04:17:32 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:12 -0300
MIME-Version: 1.0
Message-Id: <20251227-printk-cleanup-part3-v1-5-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1815;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=ZR0iR9pvZGcVZSHwNZDrCThadrViJMyV5/bfGtiN4gw=;
 b=tA7/rFTFgz8i0hdAJ53eXVaQiZ32fF9Si88T8AKGgxMwsJDyXHg4gS+HXEQzjoX95zhxiaqSG
 v/P+ZTpJjf2DQdqlDkpPXA8mgBEajKQf1Xila0zWamPBwICGf70zjAA
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
Subject: [Linux-stm32] [PATCH 05/19] printk: Add more context to
	suspend/resume functions
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

The new comments clarifies from where the functions are supposed to be
called.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 kernel/printk/printk.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 173c14e08afe..85a8b6521d9e 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2734,7 +2734,8 @@ MODULE_PARM_DESC(console_no_auto_verbose, "Disable console loglevel raise to hig
 /**
  * console_suspend_all - suspend the console subsystem
  *
- * This disables printk() while we go into suspend states
+ * This disables printk() while we go into suspend states. Called by the power
+ * management subsystem.
  */
 void console_suspend_all(void)
 {
@@ -2766,6 +2767,12 @@ void console_suspend_all(void)
 	synchronize_srcu(&console_srcu);
 }
 
+/**
+ * console_resume_all - resume the console subsystem
+ *
+ * This resumes printk() when the system is being restored. Called by the power
+ * management subsystem.
+ */
 void console_resume_all(void)
 {
 	struct console_flush_type ft;
@@ -3553,7 +3560,7 @@ struct tty_driver *console_device(int *index)
 /*
  * Prevent further output on the passed console device so that (for example)
  * serial drivers can suspend console output before suspending a port, and can
- * re-enable output afterwards.
+ * re-enable output afterwards. Called by console drivers.
  */
 void console_suspend(struct console *console)
 {
@@ -3572,6 +3579,7 @@ void console_suspend(struct console *console)
 }
 EXPORT_SYMBOL(console_suspend);
 
+/* Resumes printing on the passed console device. Called by console drivers. */
 void console_resume(struct console *console)
 {
 	struct console_flush_type ft;

-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
