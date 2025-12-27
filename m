Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0385CF228E
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 847B6C7A839;
	Mon,  5 Jan 2026 07:16:27 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3641BC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 12:18:39 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so48214895e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 04:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766837919; x=1767442719;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zBuTaAePekdaKhl7Nr4xkMCH+YbgmQZc5bDJsdsSluc=;
 b=XUjC/gVHebgxSJ6Lc07/c9DDCvxlEHY/v9lT4COss1Eus7Yp6ctVS2DV+RjtDTyryW
 DKcBfHfuJP6Vd0uBPNlcTdzLFPvzR7IjhSXu+VKyiOP4p9qMF3I8z+isp0mz9Qrsys7B
 fY8++ubuArRLqIuV3FxhItndw8UHbETRV9mfKR7WgXS1UhQfcgCfsUFwPsYwjgG37xUc
 cri1q5Cf/DaQsWvhYM8HkSmok7+LtGvvybNV6ET+lf2m0GFLu9rLFj9V/qB1XKyJFqM9
 K8D41YcBjY6qbrKWIbBmCYtdlz2vLB/MgxYrssiPLupLvTwQJjXBqt6uB9czeatsMFpG
 TNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766837919; x=1767442719;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zBuTaAePekdaKhl7Nr4xkMCH+YbgmQZc5bDJsdsSluc=;
 b=gqjV8XKmf77nAIGLe3782mAJIAUbgKSN90IoqghjyL/7+DPYwsGHL8HyZwgPsL43lz
 p4uzHNVz2VDy9ENY5NwBdFGNbNx0kCXdNnNKSN1pQD0DZ4fks8QLhyj4kuHu4RO44J6I
 yYXD4qZYB6GucrCVgFruyor2KsheBA5W2H51KnbDTXBTDCj60buHmoPQcMwWkG1pV9Xk
 /YKkFBszIPNS905W1ZaW9+EPMnBnhPg3XS0HC/jumTs9jV1cESovDdsLoY/gqiyujyUf
 eOw0dp4rdxf/6d3xRr4ztedpshEmCEW/30zTldYATRBix2s9wiUszxnyXknGFKVI090g
 UsQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrFEdwzAiBjicfyr5RMCukPr8WS9UobYU+neNHuU/F6KxwdbKSreEJUslRMAYwKeaptg4t8QC+HzVNwQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzj8AUr88GbdoPS3mFCFakjmFS820bvK8kT6VJt4f4R2Io90b3z
 6sBSCKVgZHKhQLq6oXo7qQFxcA9iezbFyBLrqVIue6nrlwz7MyuQsIlMqJEk5T9UKjY=
X-Gm-Gg: AY/fxX5wsm9O4sKveNlyU9/ymM7Cbnk+LLXdiwm/BmKeIuulPPhllfwn3WiyqFygJpU
 DEovqzCBDD+YWNs8MPwJKY74dFic6VYJg2Mx34WlsuMDQs9UOJtlfhRjLi90wJgetUif7ahz8ct
 Diyn/3TxrJXE0A9G9Mk91AhiFszgT7q2vvgNZlzW7KArwlX+MjKqWWOOTJgrFGEOf6YQVsmxS7N
 vNV8umVa+JKLS67ON0oTICS+prGKcKY4vkshtLKjs+XWD3WsdLaGsoL8hUU2emsaHkJwMaf9upr
 ukY98WzuI4yLtbDVwcBmHOWNTA3y7SFvPPleqyCHM+Zbn9Obc3MZPqPlkMeTj6E6VG2dNVzndrX
 3ZvJ2R9dPfYSA6gpJMyNk7rHrViU0IoZ3arwgcU19paRO5akwK6TxcGUO3vZhjfBzn0+2lT0btC
 /l5zOaTeAo
X-Google-Smtp-Source: AGHT+IEaiNWrbXUQR9Xr4SWeWCswjY7G2xsTNDPKS34qx+Z9cd/RVKqDItuoVsaN7WK8NMfB3mQH/w==
X-Received: by 2002:a05:600c:3799:b0:477:a71c:d200 with SMTP id
 5b1f17b1804b1-47be29e87c1mr231953365e9.11.1766837918587; 
 Sat, 27 Dec 2025 04:18:38 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 04:18:38 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:19 -0300
MIME-Version: 1.0
Message-Id: <20251227-printk-cleanup-part3-v1-12-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1119;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=rI7fN9M4UYBhm41SNkDmrXmROIuX+aCv9rIYYOtlo+M=;
 b=bcNrmzf90N/BodrKZ64tr7qsRPh416urxDwc2BxCBqWgNmTslPpP/9rT1ZURe+mv3PmWaFnbq
 xnM5PWTrVU8APb7FwkkZf2fGZ3Hw2PsJVWl1KwMiIyJjzl33goH6hX9
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
Subject: [Linux-stm32] [PATCH 12/19] sparc: kernel: btext: Migrate to
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
 arch/sparc/kernel/btext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/kernel/btext.c b/arch/sparc/kernel/btext.c
index 2bf558a0c568..951de7733632 100644
--- a/arch/sparc/kernel/btext.c
+++ b/arch/sparc/kernel/btext.c
@@ -301,7 +301,7 @@ static void btext_console_write(struct console *con, const char *s,
 static struct console btext_console = {
 	.name	= "btext",
 	.write	= btext_console_write,
-	.flags	= CON_PRINTBUFFER | CON_ENABLED | CON_BOOT | CON_ANYTIME,
+	.flags	= CON_PRINTBUFFER | CON_BOOT | CON_ANYTIME,
 	.index	= 0,
 };
 
@@ -320,7 +320,7 @@ int __init btext_find_display(void)
 	ret = btext_initialize(node);
 	if (!ret) {
 		btext_clearscreen();
-		register_console(&btext_console);
+		register_console_force(&btext_console);
 	}
 	return ret;
 }

-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
