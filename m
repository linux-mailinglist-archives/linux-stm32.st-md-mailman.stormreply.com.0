Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B84C1CF228D
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 706DDC7A837;
	Mon,  5 Jan 2026 07:16:27 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CDE7C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 12:18:30 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-47d493a9b96so5712065e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 04:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766837909; x=1767442709;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=z9kNg59vMLuZUSj8msr6djkrRczOEtEux+Dq5BMshWM=;
 b=fuuu2lGt7TjDiwDqsDBb0Hfsls8ZZWxgVPcqz3p1oBfHGAxDRMTm8dMcnxL3l16hb1
 Y/+rybDQyaUONMy06d1qiZigqfhqsVh+WlJPM9ePye5QCVBpEMAN6G0AkERS22w45AqB
 GTTWbmQFc/kKphzW5G3E8byawY8s3rLFXKrw2F46Nw+p1MrKTJqj7htdsHsdT4wyj/Ym
 2nfyZ//u2kFAtCkomCIjl/xfBRp0MkxD/dX5zVwPYsmW4iJEOUp8dj3iYfOXDgp/yvIq
 li+VlQWo7u4nE3/ReAqGPDAh7Sn4Vb0atnFUVSu0khDe5r17M0javdd7TtpOGpDxW2ty
 4eVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766837909; x=1767442709;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=z9kNg59vMLuZUSj8msr6djkrRczOEtEux+Dq5BMshWM=;
 b=ZnAkkMyE/fxbMj/HdrESh6HQsiXl3Plc8zx2s1n7CLJ8Tznbi+rS8v1ypz56Y6CdnG
 LUzsbdNKBJyDUQySMU+frifrdnPWRcOalc9kIV9hhOStFb9Cbgr7SInbN1F7+spG4kMm
 INbJ4zRQ2cFBLI6gbkwj+kjpkp3pPyV9j9l7EgnEJec2+4gGOZpR5eRiKIw6Lt2tnIQx
 CH83LoG+HuKCxpOoFpgysiPO5cQHxQlnNAi0zkuVf6YkD+RO6S5bHo3rwBML4o+fVKCj
 al+oRgPzt6ZWne5Yg3xkd2FHerC9FkI5seQJ2q0NqjWQdhL/bClopcS4lMy7+B7qDYjd
 ueDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH7sKEJrksEgiMmJ3SZLFh/71LouIeR4gXW9+0rzxZ/cFEEtJOQSJB74ui30sbfiOn74o23los/3HtHA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyU2dnWAwzpQGoRQj0y7omcIbXKuJ+u88Gdyvbuymo0YHiXt2tU
 c9JPz5YDn1OhHmiwS0bgiZjmDCIxTsWg9lKnGP1I2yDNgbrt2ZF2ik9Z9tzUGtAUuCY=
X-Gm-Gg: AY/fxX7u195nazH8hCI6SLYk0Cx364xMLheNEP6IHsUAgflU3SfVWR7p2waDE2QHHhU
 JnghKTu8wFNitjnYWO+9lGh/t4e/CIe9S3N6x0xEq/eS5BdWBHWdld1om5H73mHI1JyUDtv7x7z
 yZZiiXGJwAszPEZxT04gLW1n0OIgX+6lE9TcYrmjjse0FbMJpC+KHlccJrwX2qviR5mpoYPFJg6
 8j/nWcsb7RG9p4YDWeaoiiLCOKieMVzlV8xBuaAAfVfjI7mQCFD8KRPats/mQ8Amu/C46Xx2F2S
 GKvVu+y7tZ6AuErSSyRB0ISguU9pX1RMU4x1EtJs3ABGk/lGtSEWoVF4aKyp8uuhmRAlXA6fEJ3
 ofaLSh7TMvwbq/YoGawLHiWYmlJaODn+MIZzj8uKkQ76CerEEp+ynWj+5JM4Y2B2P3r5uQvTli2
 RWjAFYbXRdPBE0EMuyVhY=
X-Google-Smtp-Source: AGHT+IHrtEPOGW5HpG0S0h+CrpgwJd8+zbJNmNN/crxl7Vk2Gjo34WfIR0WT0TkmrlMgn1CALEr/CA==
X-Received: by 2002:a05:600c:4f4c:b0:47a:7aa0:175a with SMTP id
 5b1f17b1804b1-47d1958591bmr299387905e9.26.1766837909421; 
 Sat, 27 Dec 2025 04:18:29 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 04:18:28 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:18 -0300
MIME-Version: 1.0
Message-Id: <20251227-printk-cleanup-part3-v1-11-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1180;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=EzMaKsRNP/XrImaDzG6owj2ch5Rre3nG7qKvJVZXc3k=;
 b=4hRgVgEFeE8Kfjdb4F4yho+pOLOr4/h5Rv8YKsyU7Hs44mjvTHW9sE+Wu4jBIqif6kS1nJWUa
 QXrCwGXn4DFCsUQcLd3WwFDkthhp5OOtTZ3i5F2rVUBtIHQVlS2lOkg
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
Subject: [Linux-stm32] [PATCH 11/19] powerpc: kernel: udbg: Migrate to
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
 arch/powerpc/kernel/udbg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/udbg.c b/arch/powerpc/kernel/udbg.c
index 862b22b2b616..0f88b7697755 100644
--- a/arch/powerpc/kernel/udbg.c
+++ b/arch/powerpc/kernel/udbg.c
@@ -142,7 +142,7 @@ static void udbg_console_write(struct console *con, const char *s,
 static struct console udbg_console = {
 	.name	= "udbg",
 	.write	= udbg_console_write,
-	.flags	= CON_PRINTBUFFER | CON_ENABLED | CON_BOOT | CON_ANYTIME,
+	.flags	= CON_PRINTBUFFER | CON_BOOT | CON_ANYTIME,
 	.index	= 0,
 };
 
@@ -163,7 +163,7 @@ void __init register_early_udbg_console(void)
 		udbg_console.flags &= ~CON_BOOT;
 	}
 	early_console = &udbg_console;
-	register_console(&udbg_console);
+	register_console_force(&udbg_console);
 }
 
 #if 0   /* if you want to use this as a regular output console */

-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
