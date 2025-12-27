Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B4DCF229D
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00254C7A841;
	Mon,  5 Jan 2026 07:16:27 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74616C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 12:19:25 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so75663065e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 04:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766837965; x=1767442765;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PI64KbZN9t1PF6ymgBKKgUkODGeQdgLto8SJvKTSB0M=;
 b=BuJjrjB1VVa4bvTahyEdjSHWeNA6+zIjY88W/XyOEz0zC0u5PqrWg39GVgyQVuXOs8
 i2Ms331sXlKlHPwQQyWwSSkGwGo5UIndHa4dg21bMKxH3awRqkss6D7BljijtqwXXV40
 rEYNdUG7oJ+lEa8wmUXmK8lEdX+WV5cq+ZSPQMcy8dr/FmrgTW0H3HrkS4WOuRMHNRdG
 Pw1Wo4tJ6POWPfOZhQ43UpNhkLo3Zov+gJiZ7jYl6t950il5tUsb0aY32JjSs7hQKc2o
 rLQxrOFgle5BWPPloBVDgsIzufzfxDcq6XX2TXugqpfZDjI9AS2PVwqKhg3rSZawp/mR
 KbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766837965; x=1767442765;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PI64KbZN9t1PF6ymgBKKgUkODGeQdgLto8SJvKTSB0M=;
 b=mF/QyAGkzmDo9XzE4qGFlWDfLHpFGIe9sZvMrulM86pGGxSXuCqw045zUGctDcvB4c
 xiBU+3T04tuHGRsX9Udh7U39S8wY97tXG8tXixzJskZ/xJxBbLBT9omZWnxPv0ByDf+G
 YfN7F0h+LZchbRTmCO5AcCHxzpIB/wxJrBtTRPKA/j6WaPP0x1x4cPwRAYjN38shq/H/
 O6ULiD1VU11040cpJfhzo5KC642N307y+V5WqX43mwVYF5LLRLHS0z9YywCFQ1r4cS7x
 Ar7nhGnTfndtPZrOeCJH6X0NCA6peGZNtQ2TKJz+Pe12j+kf9NE9ovvJVSaDOKnfsdL6
 58KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFI5QGBAD9cfRsrSrxcemLZfA8xXdYpiSgeh1xkMg9B13qUDOQ66EOYqQW8Wh6BgVtUu07/hCW/+cTaA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YybDnd2JXTvGbKXpE07ySZj1WYUuwUFeHZcB+SMganngtN2Cy8T
 eWrnSQU9TwRI2SY6yy95snD4lKGeoaZBbqIM/GWDhyuXu9wQ1F25oZkqAZpENqn+7Lk=
X-Gm-Gg: AY/fxX60eDLkUDzte7wWKgSDUQLIb+piMFikVmnCZTn6NFriFHwVvC859yeRg3xNa2X
 MbamcQQlwXPF5gch0ZCc2PrgCfXpjkb1ckPBE3S4yLDf5KMdNLZp4UEqUszL7YMth/n4tbIu8Om
 IHtDcok+n7W5Lt6LrBpCSOUqzX8rOD1VV0d3GYfNc7SPV1611WYVFro6XEKI4DLgVuVEPlYzMpK
 J1Maa6oz9jSM7riO2E+pR8wcu4RLX38F6mHthkZOpx5eaT7TDN4MRMIcZxurkN0PNFkIcc8Ga2V
 QI9XOq3cPxJ0gZ7nMn/O5mWT8zZjfQ+J2N5NKG3DOtLK/QbTn6Bs0uySKFGPkgaacKlUYYVxqhv
 2WfMWwIxyp34sbi55KAGPh2hcJNbQuDCTBXIeTozS5lbldIOMgOzOfXPfnyQFZ5KgenSKwTyiG+
 MNpAPW+U+M
X-Google-Smtp-Source: AGHT+IEqqHc/Rd2kLfHagj9YhzIrZRGfzwvOOoeUxY4FRXLnI0VACA/N9sgft7uDx22VCc1m3UDX7g==
X-Received: by 2002:a05:600c:190f:b0:475:dd89:acb with SMTP id
 5b1f17b1804b1-47d195a72fbmr289900545e9.22.1766837964788; 
 Sat, 27 Dec 2025 04:19:24 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 04:19:24 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:24 -0300
MIME-Version: 1.0
Message-Id: <20251227-printk-cleanup-part3-v1-17-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1183;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=ipo1oJr6oF51GaJ/ypmHdNm6pxSai2H+L3ksWdFz4YE=;
 b=BCXQlMZHiSgf9aACQxFpdYHusJFHrRGAPtAecEP+JmKnj9nHT6kdi2m955mQdUkj992asxAcQ
 YxGwDMjxOJdD2wCUfBrHw1pcuZeGNuCZOOekwLuy8OjtGsDgBHGc3PP
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
Subject: [Linux-stm32] [PATCH 17/19] drivers: tty: ehv_bytechan: Migrate to
 register_console_force helper
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

The register_console_force function was introduced to register consoles
even on the presence of default consoles, replacing the CON_ENABLE flag
that was forcing the same behavior.

No functional changes.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 drivers/tty/ehv_bytechan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/ehv_bytechan.c b/drivers/tty/ehv_bytechan.c
index 69508d7a4135..a2aab48d11ae 100644
--- a/drivers/tty/ehv_bytechan.c
+++ b/drivers/tty/ehv_bytechan.c
@@ -299,7 +299,7 @@ static struct console ehv_bc_console = {
 	.name		= "ttyEHV",
 	.write		= ehv_bc_console_write,
 	.device		= ehv_bc_console_device,
-	.flags		= CON_PRINTBUFFER | CON_ENABLED,
+	.flags		= CON_PRINTBUFFER,
 };
 
 /*
@@ -331,7 +331,7 @@ static int __init ehv_bc_console_init(void)
 	   byte channels here, either, since we only care about one. */
 
 	add_preferred_console(ehv_bc_console.name, ehv_bc_console.index, NULL);
-	register_console(&ehv_bc_console);
+	register_console_force(&ehv_bc_console);
 
 	pr_info("ehv-bc: registered console driver for byte channel %u\n",
 		stdout_bc);

-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
