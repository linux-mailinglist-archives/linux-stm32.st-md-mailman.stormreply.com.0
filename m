Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67160D1F643
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 15:23:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 183CCC8F26F;
	Wed, 14 Jan 2026 14:23:05 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9F60C8F261
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 14:23:03 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id
 ffacd0b85a97d-42fb0fc5aa4so6529849f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 06:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768400583; x=1769005383;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rjJ0doliNf6plVmMYQkV7IlLiBwqr6x+viyB7m/anSs=;
 b=Pj2eddkDd+GA1bDXUTWeM8dKuEAXu+ERmtwymzlPK1CqyUWI3ILoNG4fh/XfsM9Q/g
 RS7iHj3LLhh7ONS81I8HelnBHmhX5WdtsIAizDE/ww9dE03ML0XwBE5FmqpwP+2+PyGE
 YUSm1hpnGpidzIQUPSNQudbSzew5CHfuAbSFPa3B2gO/RjL3X6IRjFfH6sn6eell2IAc
 Gpr7pm0vvHdlphY6sRDT+VMoshhUrf3if1B3AQPPxLRPQTXMiVuncbn03Tl0rZ71KQYh
 3VCA8tjq/ADuRkcFpASC7CHJaWCsM3PiL/b/az8JxwVcyDXwDOhA0yu/GdgalDbAoVxb
 FP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768400583; x=1769005383;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rjJ0doliNf6plVmMYQkV7IlLiBwqr6x+viyB7m/anSs=;
 b=K2abyH85fT0a0OhhoGe0cchU8dhzylNKxNhXWOKcuSKynATTubCVIhb0DT8tp0ewur
 CvCPkxWkDpSLtmfJb3lHOXCUCPP67rrGu9gxH9lZ0B7gx9nbfH0GwojjFHiA7izRbrqA
 xBHb2rx0ZjMDyOuwxJLFtWKaONgyxPEe9tON6IDsAadyz/G/zrS6QeMXHTwtjwueeS2d
 orv+bCIVTPSf0lythov0C3/bw56ZhSFELpaZsYp5ngG5kssj0kAqg8TNkPZCT4zHrbCf
 KecZx6EUAFHaC/epdQJ3RK/gfNQFFONBndbf8DRVHdRTyXsfYkSZ2mmS04koqSyRJYAJ
 3UDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXj26ItPtxm12EGJ5dfC7PAN0Kgmlq1U/GYY3F+a/m/8jnE0S868fuYl3S/LzDg9BJCcHc1TyL/YM7V+A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwKpU12Vmf9Xb9EvtC1nsLhFCuiv1ucP/i+rDVsui8iirm4aQ7V
 H8j5qoem39at6QilCeCmxiqAaOVho1y5cgCRMXdGYjZqw5oIW4lfd6xQL+G+ljU/FIQ=
X-Gm-Gg: AY/fxX4vz0ihTobWNqqoyYQusVQar0VfuFRVXh/LYZv4mn1DxtRk6oBymwbVYTJP4rF
 CKPbVdgDKSqKrBhgrfvdQSFYZgIaZsXAMDtwuQz9A9Zkjj740X9VMj0sr8hwLxDhOlC0dHQYyiE
 a+tFmklo2J330Ay3tQwGR9IzHzzyBn3XBnaf81zDaW/kNJJ69A7n8e9SQb1WhhdjOuQwyZgjn8k
 izmYOq2Lc/2yeSRVzUH/X37AeivLGCmxM9g9d5xpL91Zgjh5GY1PQucMpjWkAWEux3gG8lELy+M
 guO0cS6PN+V/ALDima29m8Mo0ueFenKyXQfRNykMdSpMsO/9VzcBKKdpBTSMZVD/9SWZy9+so1b
 yHXbNSuL2oijt9di8OftWzZVN4bFBgO2fPJdNgIna31bwSv9+8bcR+zbrs+zyt1pKwT2SBZSYyE
 B5oHbbg7Wfeqht4A==
X-Received: by 2002:a05:6000:3105:b0:431:104:6dd5 with SMTP id
 ffacd0b85a97d-4342c5728e2mr3256518f8f.58.1768400582935; 
 Wed, 14 Jan 2026 06:23:02 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dacd1sm49446446f8f.4.2026.01.14.06.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 06:23:02 -0800 (PST)
Date: Wed, 14 Jan 2026 15:22:59 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWemw2ZCwtAd17I1@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-6-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-6-21a291bcf197@suse.com>
Cc: Andreas Larsson <andreas@gaisler.com>, Kees Cook <kees@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Shan-Chun Hung <schung@nuvoton.com>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Breno Leitao <leitao@debian.org>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, sparclinux@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Richard Weinberger <richard@nod.at>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 Daniel Thompson <danielt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jacky Huang <ychuang3@nuvoton.com>, John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-m68k@lists.linux-m68k.org,
 Nicholas Piggin <npiggin@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-hardening@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 06/19] printk: Introduce
	register_console_force
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

On Sat 2025-12-27 09:16:13, Marcos Paulo de Souza wrote:
> The register_console_force function will register a console even if it
> wasn't specified on boot. The new function will act like all consoles
> being registered were using the CON_ENABLED flag.

I am a bit confused by the last sentence. It might be bacause I am not
a native speaker. I wonder if the following is more clear:

<proposal>
The register_console_force() function will register a console even if it
wasn't preferred via the command line, SPCR, or device tree. Currently,
certain drivers pre-set the CON_ENABLE flag to achieve this.
</proposal>

> The CON_ENABLED flag will be removed in the following patches and the
> drivers that use it will migrate to register_console_force instead.
> 
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -3858,7 +3858,7 @@ static int console_call_setup(struct console *newcon, char *options)
>   * enabled such as netconsole
>   */
>  static int try_enable_preferred_console(struct console *newcon,
> -					bool user_specified)
> +					bool user_specified, bool force)
>  {
>  	struct console_cmdline *c;
>  	int i, err;
> @@ -3896,12 +3896,15 @@ static int try_enable_preferred_console(struct console *newcon,
>  		return 0;
>  	}
>  
> +	if (force)
> +		newcon->flags |= CON_ENABLED;
> +

This makes sense because the pre-enabled CON_ENABLED flag is handled
right below.

>  	/*
>  	 * Some consoles, such as pstore and netconsole, can be enabled even
>  	 * without matching. Accept the pre-enabled consoles only when match()
>  	 * and setup() had a chance to be called.
>  	 */
> -	if (newcon->flags & CON_ENABLED && c->user_specified ==	user_specified)
> +	if (newcon->flags & CON_ENABLED && c->user_specified == user_specified)
>  		return 0;

But this location was not a good idea in the first place. It hides an unexpected
side-effect into this function. It is easy to miss. A good example is
the regression caused by the last patch in this patch set, see
https://lore.kernel.org/all/89409a0f48e6998ff6dd2245691b9954f0e1e435.camel@suse.com/

I actually have a patch removing this side-effect:

From d24cd6b812967669900f9866f6202e8b0b65325a Mon Sep 17 00:00:00 2001
From: Petr Mladek <pmladek@suse.com>
Date: Mon, 24 Nov 2025 17:34:25 +0100
Subject: [PATCH] printk/console: Do not rely on
 try_enable_preferred_console() for pre-enabled consoles

try_enable_preferred_console() has non-obvious side effects. It returns
success for pre-enabled consoles.

Move the check for pre-enabled consoles to register_console(). It makes
the handling of pre-enabled consoles more obvious.

Also it will allow call try_enable_preferred_console() only when there
is an entry in preferred_consoles[] array. But it would need some more
changes.

It is part of the code clean up. It should not change the existing
behavior.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index abf1b93de056..d6b1d0a26217 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3826,14 +3826,6 @@ static int try_enable_preferred_console(struct console *newcon,
 		return 0;
 	}
 
-	/*
-	 * Some consoles, such as pstore and netconsole, can be enabled even
-	 * without matching. Accept the pre-enabled consoles only when match()
-	 * and setup() had a chance to be called.
-	 */
-	if (newcon->flags & CON_ENABLED && pc->user_specified == user_specified)
-		return 0;
-
 	return -ENOENT;
 }
 
@@ -4022,6 +4014,14 @@ void register_console(struct console *newcon)
 	if (err == -ENOENT)
 		err = try_enable_preferred_console(newcon, false);
 
+	/*
+	 * Some consoles, such as pstore and netconsole, can be enabled even
+	 * without matching. Accept them at this stage when they had a chance
+	 * to match() and call setup().
+	 */
+	if (err == -ENOENT && (newcon->flags & CON_ENABLED))
+		err = 0;
+
 	/* printk() messages are not printed to the Braille console. */
 	if (err || newcon->flags & CON_BRL) {
 		if (newcon->flags & CON_NBCON)
-- 
2.52.0


It would be better to do the above change 1st. Then the @force
parameter might be checked in __register_console() directly, like:

	/*
	 * Some consoles, such as pstore and netconsole, can be enabled even
	 * without matching. Accept them at this stage when they had a chance
	 * to match() and call setup().
	 */
	if (err == -ENOENT && (force || newcon->flags & CON_ENABLED))
		err = 0;

You might just remove the check of CON_ENABLED in the last patch.
I think that this should actually fix the regression. It will
handle also the case when the console was enabled by
try_enable_default_console() and try_enable_preferred_console()
returned -ENOENT.

Note: I have some more patches which clean up this mess. But they are
      more complicated because of how the Braille console support
      is wired. They still need some love. Anyway, the above patch should
      be good enough for removing CON_ENABLED flag.

Best Regards,
Petr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
