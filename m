Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E32ABCF2293
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1C08C7A83B;
	Mon,  5 Jan 2026 07:16:27 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74BCAC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 12:18:48 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-47d3ffb0f44so13339925e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 04:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766837928; x=1767442728;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NC/xlTHSkC5720zy/KPT378kGxggptiwCzT1YNGAqrI=;
 b=DwmUinPySGO/w7kpp0yjdCpN6Asl+MU5muI77gyKk/ecNrnTpO084iqhVRyr4hBDlt
 UeT5lv0aOaHc+vM1QPOJEmph72zOoIPtcIIXHTUwGKcic2sgfAKt02B3NnmVvLw9rSG7
 eLMyGsqw8VJeEkka1+bxQtkID5oGqNJQuLx9gI1pLibE02XBioupbCteZyk4o9Zgawx8
 TEYcl2lF5GVtTkAPa6po/wFYw1oMkHWRCNRfLUh1mlrCT6qZRJuswRzKlEOtv2mA5ty1
 kTB1v8hnqZ99R6Uu/IAzTXIrSBfj+sdQz24K9FT7hywiBbP16NIElNXUMPtB7ZwkAqs9
 IfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766837928; x=1767442728;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NC/xlTHSkC5720zy/KPT378kGxggptiwCzT1YNGAqrI=;
 b=injEK5LiKKx1u7iQztbIt67A+o07SwK/pA0JFjzIb73qElAkXgQpKfgLNaQB2Lbu75
 5/BDmLTb/Y/R/yehvUuHhi5zH+RrWDnfz+zurvdDDzYWX8gB6gsg7YHrlsEgETBymu1u
 SYPMpgF6Rb1xWu7UDAbDqGFKg/eIIM4ZEYdBfcI5VMicbbp3mopu33QROIQ+FIAW/20v
 HpeIz8gIZLsGRT15WHYPpBXMx2nRYm1547YNuzHS+XKtgtDyIgoAf9f2GkrsPx0qO+5T
 fd7C8HwN3S9GwYUTBBTmtZG9XqoD8+ShCpfhPOZXb57qBuoZcHhJt/CLtS031Mm7WfZM
 hONA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcBvGEUZFrxhqc16NtuDkxrS+J+K3fkbgsSG/Al2My9+x9oBbayS4R0jZFnlnCF7BjDq6f1FdT9A+P/A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwysCHr+zMeEFP3X43De2K2lvVRWcjA4F6OQFZEDQOspmdvh7C9
 O7WG6AxvrH3ty/+uIsqtTAzvua56Loh5A4GHYbonADVLT0Hpz8l1Qndp2j0sl6YLaec=
X-Gm-Gg: AY/fxX5ZtutsR6xFMEJg197AdBN7mrbeMyAlr0pNDu2eu78XvdwQRRU7sRUtRf7sBK/
 9O+ecR+WFlLmU+dFbVQmEEN6EtQ1UVBPqwOb/SUziLuxwovyD4clcAFRrLehqhPlS3Tri9INJyI
 h/Hksu36kueEYIfVfAuI9n6PsstkG5eh1w4shXxlnV8riFwJDahUChm0oG9anU44udEJSFH7hbX
 om4qgFZbjX2qEMP0WVh1Z/Y8WOUt6BhApa32zWJbjsMcNByoqWR9lF0vFA3L8Pevxe2ByOBc8KL
 p3JpbGqTiuyAxRbsXSP0W5tfsoGqrlqbQUGrjcUbqno8fy/8s9pl2yoCwki9c/5ByzTtmHIW4c4
 iykezU7ZZr4pvkEldWPFr67+ZvUpS0573swTacw7MMlDeV0K08u+gLS63cF3fr3qCScsjZBbrXE
 hdH9iLecz0
X-Google-Smtp-Source: AGHT+IFbCGvkCxGExFQLBl5yaU008gmiVvRdmeb7k0sjyaCh7Z1nYJocCXv7ZLYKC/Juko66305eyA==
X-Received: by 2002:a05:600c:8183:b0:477:fad:acd9 with SMTP id
 5b1f17b1804b1-47d195a9834mr270395745e9.34.1766837927833; 
 Sat, 27 Dec 2025 04:18:47 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 04:18:47 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:20 -0300
MIME-Version: 1.0
Message-Id: <20251227-printk-cleanup-part3-v1-13-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=961;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=9A3Brx5a3gQ0NUhTGZ1ViMT9HfTuP00Tgzee1GwnjVM=;
 b=gNLF1CEZIFvupLFUy4kgNSgx2QLue8Fjf3sjVi+zSBhpSIWUfb0laNahgF6qahlq6x3pophwD
 dRykPPu3R/nALZM8P2pCpkq//4oDFgsmNLGc4Tixc+Z0JIXH+9rAGGe
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
Subject: [Linux-stm32] [PATCH 13/19] um: drivers: mconsole_kern.c: Migrate
 to register_console_force helper
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
 arch/um/drivers/mconsole_kern.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/um/drivers/mconsole_kern.c b/arch/um/drivers/mconsole_kern.c
index ff4bda95b9c7..ce4f4ceb7f27 100644
--- a/arch/um/drivers/mconsole_kern.c
+++ b/arch/um/drivers/mconsole_kern.c
@@ -582,12 +582,11 @@ static void console_write(struct console *console, const char *string,
 
 static struct console mc_console = { .name	= "mc",
 				     .write	= console_write,
-				     .flags	= CON_ENABLED,
 				     .index	= -1 };
 
 static int mc_add_console(void)
 {
-	register_console(&mc_console);
+	register_console_force(&mc_console);
 	return 0;
 }
 

-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
