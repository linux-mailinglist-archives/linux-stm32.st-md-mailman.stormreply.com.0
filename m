Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 867D8CF228A
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CF52C7A835;
	Mon,  5 Jan 2026 07:16:27 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEECFC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 12:18:20 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso61936355e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 04:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766837900; x=1767442700;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oUj1yTYG2OsJA5NR0t10qcegAjlFezEaj2Q6zpglNnU=;
 b=XWDvJZQIMV+h4f6dF5BJ4L5M/v7T2MhNa8g+FDev09jdFdG77PplwtcKOKyPVPJfwR
 4RBKSLUzhlv+5bBfBAmkNDWQNnsojl7OB97yqnOJbf1sYhIKUSS9lGA+/pSxbkVvCNq1
 k7CzjL34uYzAwgLIL5kFNsSK96pF5ySjq88UP0JWz4luJUtI/uvjZrZhqBCBDHd1Thyo
 3sQiaUVRbjW9h1FSXW0thJfCgaeoBA7kmX2WuFtaXr6FkpGqKRXtiaHEScAlf5VPvOR/
 P3lHSmyZrDjpG4mUF8PDuNmV7dJuSsBelMzdeVA4mPwRixs6vv6YadQf3mMLIn3S6PaU
 yHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766837900; x=1767442700;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oUj1yTYG2OsJA5NR0t10qcegAjlFezEaj2Q6zpglNnU=;
 b=u54Nm9Reb/V6VD8odgFJtC/O5NUnvUEKEDuIIXHcTzbFhbafzV3Qqp6uJOfpCvZ7Cr
 lQyYQQn88TCX+ZDL4m7CUgGsfx5dFZYL9kWzr+d3xEp6U5+kLfiUdur0SEUOZjvSVkLo
 AQdyJS/fQDfwCqKlMddFN5RhzWZg+wkdZ6S66NIrPGNEP52OQARTC3+ikQTEWZ9i5XA0
 YKA1l+b6IYGrC2CNzFcA1A/Z1NYyaIsaDVvGH4zSgKegXvJQWRFmWoiaftx1ciTn9oss
 Nw2k3jqApB47fDT4PbdDp59smjO/f1zLS4kI3Vk+p5YFrdcX7yhsFsyc9frADel/aeJ0
 EOSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWANh/plmTwfnPLfP1VL7PJMvToJGiHVMxW4H946adN0KB3MV1NOXueAUajbY2ldf5gp8ppDkPisyXSHg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxJVKsZFDMpO5EZKhCz6MGmTbIVLXiamsA3VRCQM2+EoWml7Ir/
 F2e2deAgu66WbPhsriTByAMLEv5qYp1xONCnel5lJuR4QJ5VgEdgpUTOX0OWeBCO5Iw=
X-Gm-Gg: AY/fxX6r9RL2Z3ZwXsOA0+4o/4MQYRwlP9ICRrFSQy3Z8IX3ow3Uw/rChehq/20fJ7W
 6usToM1nRe0BfLA72ku9cY8lXwdJv/whEZWJ97/naCwDbtZdGzafOAoVbawgI72gcdem0KLvXnT
 hThRp2Znoq+myZOzeb87c3kRQFR/JwYzPa/5sb2l5awo/UJqmYDteAeJ7BGWqrXh71jCb1iACsM
 lQHTZl6f98zTDVTGzI70YBwfq9duwd2f2I9SssqLaq/iWdfzwkW9W7PpCwT4GXYhq9OlYriktaw
 9yCxlFp59lU8MoJ5sRUWvM0Ed8GRRyj9p4TolFEhGRpBdS7RCkeMx9vUIUaWB4pfO9TyGNtZgC+
 FqmNTI0P3iIVYLXL3otwYJZINFM9E9ssG2GpwPtqQ8sCK2s1e7+UnhnRur8XHigaWGQ2coSdkll
 QDXuii56l5
X-Google-Smtp-Source: AGHT+IFXI+q7UVcETj2xrgWEDOplaD2DQfL+z5FfnKK5mI2lAjBc9EF1caRTkYKVAlNOUIoqedA3Qg==
X-Received: by 2002:a05:600c:4d98:b0:475:d7fd:5c59 with SMTP id
 5b1f17b1804b1-47be29f362amr221645875e9.16.1766837900191; 
 Sat, 27 Dec 2025 04:18:20 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 04:18:19 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:17 -0300
MIME-Version: 1.0
Message-Id: <20251227-printk-cleanup-part3-v1-10-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1079;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=3dvgtN1V/Te+qiB9DfrS6Ouyxfyny3L7qK8ewpooDVE=;
 b=vEVEr1V/PLyTXU5DKxPct4kmpsEX80YaTpb8m+k5Ll/RykRPcPf3SC/5piYXBTRWgZnh2jkWP
 FQP0jQiJpLBB9Qo/wJGJV1aoieFgYcnUso9xzkOCnscVwaYm3IY9A0b
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
Subject: [Linux-stm32] [PATCH 10/19] fs: pstore: platform: Migrate to
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
 fs/pstore/platform.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index f8b9c9c73997..9d42c0f2de9e 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -418,10 +418,10 @@ static void pstore_register_console(void)
 		sizeof(pstore_console.name));
 	/*
 	 * Always initialize flags here since prior unregister_console()
-	 * calls may have changed settings (specifically CON_ENABLED).
+	 * calls may have changed settings.
 	 */
-	pstore_console.flags = CON_PRINTBUFFER | CON_ENABLED | CON_ANYTIME;
-	register_console(&pstore_console);
+	pstore_console.flags = CON_PRINTBUFFER | CON_ANYTIME;
+	register_console_force(&pstore_console);
 }
 
 static void pstore_unregister_console(void)

-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
