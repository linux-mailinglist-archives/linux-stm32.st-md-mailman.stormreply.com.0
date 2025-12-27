Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F236FCF2294
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5DF3C7A832;
	Mon,  5 Jan 2026 07:16:27 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE290C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 12:18:57 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id
 ffacd0b85a97d-432777da980so932165f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 04:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766837937; x=1767442737;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jl/uMa7F0AxGo9UgKbw3ayYmv5/eAGkPJCpV4UBsG/A=;
 b=arDujjEEmRyfL0B+9AtcTCtn71I0Wx66YiFh2m1tJEvKXEkWJRYt7ZAftViqeGnunJ
 hwl1p/zqQ1LTQLZibmVmdJLt568RMYEhx3DHbTjoDn1DQ8JlmsKMj4SxcSUOUDEIGut4
 gqKYYX4cLge9nwLAdKPDzA1g8HjHyYlGQaE4cTAHMs7bvGaw6L29wMaSc2ZS1ZM5XYqO
 0dyicqHiHNOHGewZpb9kCRtx4zoEClkOHNBSqzwZ/TeKBb3Ia/+mQUFLHgiDaaI3fppB
 TOLny9nr98BgLGht2b9VNpV2/ugOvZxRmYGyO9QETxGN8Vl2L8W6tOBWO/9mMp+eyGjY
 w9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766837937; x=1767442737;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jl/uMa7F0AxGo9UgKbw3ayYmv5/eAGkPJCpV4UBsG/A=;
 b=DOWpxj/LtyFkqn8POgEr2bTwjPZSOp8WzcBvggeU0HUCbUec6bZZ0KAH9ZtXqDWCFR
 Ea/opq2WKc/R/X8dxe3ojo8/UPORR84FCMAPiBR/pikx8Aj2+Gf3K5j/7wdHamjVa395
 EwbfqJ2zRZvFywNSu6t5Tc4b+FSYbAvW+YX47h80h0bXKQhFMQ2CXztUIKPUCLY0q1ko
 k8UcKgeS4CN55IXfYlGjwvrzjB/dzxoWDTzs7GsSJiBpd9MUa2B5pcWYsCrt4F19u+yJ
 mciIhgGv5A8jQW/kBy0sjZhfek1+9q4EoGP6jgYzkpQvF7JQHXlXIurNiEaEYUW/buJW
 aY8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaxPsioAMvstGwoBKtg12o/sboXCUPfj85l4eGqGc7D2rs38WB3J7Eu38HLP+lYSXY7suE68nKllzU6A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyNABgQPVhe1QK9Lkr1g5UHwFQjj/OAvPa1cFv5KjocJq90gyL4
 qP5H+cu4CnSwPxVDHd2SIv4wo8OVNTeKKUifxWYVB+6Zt75o8wDEQCmpIi7wEv56Av4=
X-Gm-Gg: AY/fxX4vDkFWYPEiB/IO8l95HXhrFSLNIfAgGUmePkosAWxS8UBdfFA69H8gzCmXlNB
 dwcfMf/9GwbW71jssTrs1/BbFHzXhr29QgjJQ2dLvN48eJ59+H4VV7yu3D19siIJd0tUbvLriWG
 kf/Yg5vtWpPzBlxZDrFmAdj5XQiKC3GBho0QHrKKxoxYaiT0Uo8hjFvgtnJ5ZyMb5rsWYHLe5sy
 wQ8KeRwvRAyhqEq5+OVr5ezdTrqYNh5Klkb3wCmY1x60i6AgQlvLy/WUG0ILzuX5e/jT13VDYOS
 bDHfmWEhDwE1EGtwKoBju4JZ+q3HuzHGgniUo1fQdGqiHrF0DxZyPdjjeoQqWg5Wh8qkrphwB/m
 qgpe5PTC1LshHyYc4Fp7zbUaoesvfLITc9np/eW2qpybjWl1SCyoFRCjIwRBUd+Xqxconat3q1T
 HIU6gsdoOU
X-Google-Smtp-Source: AGHT+IEilNPw9ykBXsWasfDesGg5n0pMdngWI0y9wCDnaTUFF7DpZ4wL0dzMcGNMkGv8jBn79QEjlQ==
X-Received: by 2002:a05:600c:5249:b0:456:1a69:94fa with SMTP id
 5b1f17b1804b1-47d1954a128mr290319795e9.13.1766837937081; 
 Sat, 27 Dec 2025 04:18:57 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 04:18:56 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:21 -0300
MIME-Version: 1.0
Message-Id: <20251227-printk-cleanup-part3-v1-14-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=940;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=go1Xoe57mzaY/mIQIq5f3pHcbzGWVFe1Pe8aCGM93yA=;
 b=2O7MS+wSbmBy5GHviNZc0eUrBGjBqbDvdZl/gWh/gmVWu32K1VqnWzIxEikovOvxtxQ1Ut5k4
 SCkXkL827NRAROp5vOzN3LiFx30TLjgXwQqt3ej5ptdr+YtakhrR7Rs
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
Subject: [Linux-stm32] [PATCH 14/19] drivers: hwtracing: stm: console.c:
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
 drivers/hwtracing/stm/console.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/stm/console.c b/drivers/hwtracing/stm/console.c
index 097a00ac43a7..d3ae633e3bf1 100644
--- a/drivers/hwtracing/stm/console.c
+++ b/drivers/hwtracing/stm/console.c
@@ -42,8 +42,8 @@ static int stm_console_link(struct stm_source_data *data)
 
 	strcpy(sc->console.name, "stm_console");
 	sc->console.write = stm_console_write;
-	sc->console.flags = CON_ENABLED | CON_PRINTBUFFER;
-	register_console(&sc->console);
+	sc->console.flags = CON_PRINTBUFFER;
+	register_console_force(&sc->console);
 
 	return 0;
 }

-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
