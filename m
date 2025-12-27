Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B33ECF229C
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3268C7A833;
	Mon,  5 Jan 2026 07:16:27 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6025C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 12:19:20 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-477aa218f20so47223855e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 04:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766837960; x=1767442760;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ejU77izjbpiitWXY1CFRfcJAx1qt+ylV9tDV0w1mOdk=;
 b=FbaM5gMswC3SzKqnvlYw4aIzkQEkMbKW1TneH6zNsgMjUJ+ReX7CyPhjmjATV5M2y9
 c4emngeHkjJgc62RYJIxyHjTCy8r4qm7hJrxFS13N5ufyPdQI4z0XSdHNxlwokYaLcg5
 +j7sz35DLydMBFQFYDx9kY9t1xbHs3vsH8MR3te29PP6drw/0KR09RP2ORwmR15XiFxv
 ylecbFt89wJ3Jd61TvQX/pfEGxNz7NAa/QM59Bu9A3qscJjV1PVGDFejSj/jO9E+A3Nt
 2DmfNSZrp8+SDKyYQQYdtZsn2iYMxFVtYMGSJsQKXMCeEXgcgeQPyJFBQfsVBylWrd9V
 y1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766837960; x=1767442760;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ejU77izjbpiitWXY1CFRfcJAx1qt+ylV9tDV0w1mOdk=;
 b=qew2liaNIK2Ig+stTILTauhxTFdJySppnSkV5EF12O14L4HnA4ReafVLYWY53fgQ0c
 PxDpj2s7tupYMXEMaJmRkfKN4MgLCkQqmaSnAxrX00wHy+ws/EZRDIbMxj3NF69AgJsF
 VFFn8bNv3r5cuD6hPBsQr09rHeVBe3fbuiNZ6NzuxM60aVa7M3CX+KZ83WY25OKGAB53
 7wHEGOnXQoKW7L/YksxuyB/+oED3fAZWuE7Uu/v6jD3rxeY3y/Tz8qNJUjN/VUAjvu8k
 KOS6etsd3yGqpTk/yRqbOGlW51d7muT+JaRqkrugYxaWlZ113abvSe/A1EcXpM78kB8i
 /Dww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXas5q3Gsnda7dSXIAfz979XES6aYOrMVxU0edZu505QiIFN0HvIc55+kSzKApIkgjxG5Bnruw3C7kLJA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyCc3MZOV3q8+vHX0KcsBg08kcXYKp2ihkB5oCL0Ewi9Ljuqksj
 AtY0lBmbB5xvoFIIyeN0PG/vOGQk7wRvQ2WAoJT2moMtKC/dodm2GwQoyJYrk29K0eY=
X-Gm-Gg: AY/fxX5djEW3UGwHw0F9xu8rUoWdoXNWEpfy2BPL31ys96KdZmd8bZzMqDJ+ahq4+9E
 C3nFXAPNQn7EnIWLJ8fi65tcdIkAA6iPxeuKlirMCqcw0+eTSW6DgqfgCxu/RRnlMHf8euHomxq
 1O3hjQby9EilsM/BS82sobLxMsKdD210splboFbwWhY/BMZOUPXTLb67e8lQO/bfJopudgpsI/n
 8HFOEUzlehqZi/a3zX0mh+sBjoH+EVSSKFHFjFMwLA5Sf0osBbtoDRRYXP5RqjJwqvHMvawSSyH
 1Uuc6TYPsS1n8J1SjNJ3LXI3GISZQFRdiNS56dDRKDqFO/0e4RrOFLSlMsQuu898+CH/PBr8EYp
 mryICFZcJhCUBaXHekU+oGerH/IqfevSnhefLsaDpJ7zwrS6ipkD+tmq3uyBTD2CRBLa+UJdzRs
 Oxdb6CIw9y
X-Google-Smtp-Source: AGHT+IGcVRETU5SGb8qIhgBdGnot/sm969/AEg3tWF/SLDrOBPXwM9NZtaV8oGtTOpkC0w9sxSvHbQ==
X-Received: by 2002:a05:600c:3148:b0:479:3a86:dc1e with SMTP id
 5b1f17b1804b1-47d1958e459mr275597435e9.36.1766837955551; 
 Sat, 27 Dec 2025 04:19:15 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 04:19:15 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:23 -0300
MIME-Version: 1.0
Message-Id: <20251227-printk-cleanup-part3-v1-16-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1239;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=jiVyzdGaYwwOjViBefbG/4tnbA+IZ6VTt4S6NyPkSWY=;
 b=Y3ytKQigesyzk6xu3oPXbBS5mHTUJ1mX1rT6WRhai16pDTDKrILE6MzhKcIyuYvYQYYU9QQLY
 +jUI84bHhmDDBPQbqZ6BL7ROSTnYW/5U7XoL9eZmy1wASQ14fgiWD4j
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
Subject: [Linux-stm32] [PATCH 16/19] drivers: tty: serial: ma35d1_serial:
 Migrate to register_console_force helper
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
 drivers/tty/serial/ma35d1_serial.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
index 285b0fe41a86..d1e03dee5579 100644
--- a/drivers/tty/serial/ma35d1_serial.c
+++ b/drivers/tty/serial/ma35d1_serial.c
@@ -633,7 +633,7 @@ static struct console ma35d1serial_console = {
 	.write   = ma35d1serial_console_write,
 	.device  = uart_console_device,
 	.setup   = ma35d1serial_console_setup,
-	.flags   = CON_PRINTBUFFER | CON_ENABLED,
+	.flags   = CON_PRINTBUFFER,
 	.index   = -1,
 	.data    = &ma35d1serial_reg,
 };
@@ -657,7 +657,7 @@ static void ma35d1serial_console_init_port(void)
 static int __init ma35d1serial_console_init(void)
 {
 	ma35d1serial_console_init_port();
-	register_console(&ma35d1serial_console);
+	register_console_force(&ma35d1serial_console);
 	return 0;
 }
 console_initcall(ma35d1serial_console_init);

-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
