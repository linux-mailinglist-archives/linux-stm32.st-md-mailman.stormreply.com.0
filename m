Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B734CF2287
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFC34C5A4C5;
	Mon,  5 Jan 2026 07:16:26 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85CF1C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 12:18:11 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so48213905e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 04:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766837891; x=1767442691;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OB3+8VIsiv4yLcVB9h3kEd58M2RQJv95rPNYEtVMoiQ=;
 b=DQtv9L7xON5OE5Zg12r0F7fI+BWFRXBu4JKZXWFy+spEByd4+5klzPak+Uv/6cWnGQ
 fUt/qpX+f5K3cn8FdqP4yqgN6uI5hZ5HJm7FoZD4zv9ZBKbd0iDaKoBqw67nblDFRH5o
 RTbqmnzbY71jO0FwHcJep+leALzlRjBlUiZEUUKl3eYmq6Xy65EIKx+rj457pSsDF10d
 ng/HllT9UL6yOeuzMAu5oTeW5yslAOTW9l9/1DBAZbQwbKbbnHyKJdPzxaeKLcE0LLYn
 gpsT27BbDuFzxXZxlIS/Mnlo0stIuLBHrVoL6+fwNnaA3dwnN+Ah3qn5AFDjxrouAXA+
 COVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766837891; x=1767442691;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OB3+8VIsiv4yLcVB9h3kEd58M2RQJv95rPNYEtVMoiQ=;
 b=MekrP/i3LnMI44zRvSiBKTE1G4UveivdCGBaGWC7CxtX5Yg3RZxpZLiiXTegIakHIb
 +3NIBmd8nz0s9GaO7psq9nAFUPxQ0bJDqBTRP83VlkLEfJEn+zvx8aXyfmELCrgYWTCV
 EOdrEdNtzgql96AygNgli05zGua4Szz6Rm2DmQUL86p9eBZx3EQTSPqRR6PM3+sr6M4k
 mgoMm6ZPsGFT+9h2EEB/q1EuLvfkIZggqliWTmqOLdtv7F/SMYCTSTK9dzgP48thb7mB
 fiBX0AMXSPPXiW1Xwo+vS9Co+4aXzawx2ae5+HMTlPkwkmaDuLkTLdsqps+Zj3gsOnBs
 SvWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg06OEq6xhnAr3nGpe9bDxixUt6v/Lq1YcARrctvxkEk8ox0Ef9uSrPevrEdypeq+0VKcbG8kb5Kmfiw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyyixkWbhsD54rmB0uwj4iVoirL6OS8x52DyBBsYqiKt+mkWTBn
 0wj/H0wgCSPyrkdHVF2ffRS+rFrco5EFwOdoMVNelZWvONs7JIpBx1Uux4kcIf6pGRQ=
X-Gm-Gg: AY/fxX45+CgJYVTfvA2T4Y8srkhKlZ2QNyYMuMQdFVeyNUs6fmgmT8xSHhAG/CoBlu3
 8z88+D3ixXSRIwXI7LgH3750xOxrsIqVtGZ2YBFUMXZzpnI9Db8/e60tELgy1vBv2zSQSlRha4R
 a7tsjK2HB7sYaBYXLCx62trJPguUFphOE50CntBzwUBNNSjQ+3zwI6hJgLmHBhMnXUwah1f6Wh/
 UQGQ2w2h8BrQ4Xmu5y1xIocT9vYdCHmVMfpQOq7DKdpi710wZ55v9388UaU2HyyykR6l4lgSRpt
 GB9ykzxeI3zLdWoe+AMwv6Zx2DSmVhENprImZZH2N/+FfLE4o1D8Id+QouADC2R06s86/oe+ekr
 r0WbYUIC+4GCd63MmkcSMjpZYrfPM+njxfogy0cpikyeA2ZEdEdhJwgASXvMUxCCX8CLUE4c5Tk
 m8k1imJ1X8
X-Google-Smtp-Source: AGHT+IFJeR5Bq3e314KIMXwkrZhqd3SM0Gtgef2ZKhyuTvMEsyAQgTg0idlkENoTE/A1RwLAaI6A4g==
X-Received: by 2002:a05:600c:a30f:b0:47d:52ef:c572 with SMTP id
 5b1f17b1804b1-47d52efc7bdmr6320155e9.1.1766837890917; 
 Sat, 27 Dec 2025 04:18:10 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 04:18:10 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:16 -0300
MIME-Version: 1.0
Message-Id: <20251227-printk-cleanup-part3-v1-9-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=997;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=aTPPRUdelJJPNRSRbq/P3Dh/ezSRl1NcFqsysqipRcI=;
 b=bFiYD37gtcultSa+DtuWsZDZsqldtTEWNQGlnO3f8qpUTnHo9LyYg6/jnVTrFnBYz5Wno6rCP
 MIg9mT6KNXdApenqW2Pg83sbMRC0cE454dAXf3m0peqNYruoithEiNk
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
Subject: [Linux-stm32] [PATCH 09/19] m68k: emu: nfcon.c: Migrate to
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
 arch/m68k/emu/nfcon.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/emu/nfcon.c b/arch/m68k/emu/nfcon.c
index d41260672e24..3504bbb4aedc 100644
--- a/arch/m68k/emu/nfcon.c
+++ b/arch/m68k/emu/nfcon.c
@@ -110,10 +110,9 @@ static int __init nf_debug_setup(char *arg)
 		/*
 		 * The console will be enabled when debug=nfcon is specified
 		 * as a kernel parameter. Since this is a non-standard way
-		 * of enabling consoles, it must be explicitly enabled.
+		 * of enabling consoles, it must be explicitly forced.
 		 */
-		nf_console.flags |= CON_ENABLED;
-		register_console(&nf_console);
+		register_console_force(&nf_console);
 	}
 
 	return 0;

-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
