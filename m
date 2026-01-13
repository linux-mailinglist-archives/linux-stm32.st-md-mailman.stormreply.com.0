Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F3AD1AAB2
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 18:37:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFA50C8F282;
	Tue, 13 Jan 2026 17:37:22 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19F3CC5A4EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 17:37:20 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-430f57cd471so3943965f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 09:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768325840; x=1768930640;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/CVOy4tPw1zWY0e6rYcKRwtfrfRvUlKFzd8YTNoGp5w=;
 b=K7nLcJqhRNPCavqRyE0JWVNRyik2x4Vb/aN6jg8FIXpexmYuxMLsA41kJHhIO7ABrF
 k9Xneel2zepZs5F7qDLb4KKuHndml77RW1KdEZz8utiC8vQIkrQ6PJxEe0Dpme+etJeo
 qlo34vVDwBXIP1LUqWkeXDDOB3BdMY6HUieN591E6OjrXTOW3/QMOcm8RByznj84xAWe
 brSaz/X0X9AoPsY/r4wWqtIYuw5Oepye8pbk5287EVpzDZ3xh/HHgEy6xcC1xlVtQXkQ
 TI7/A1wrKp2GLXxIGXvTLWMY8+Dxsxs6GDn2uiwk83nVxZB2oS/7b7rco08vN79V7OYF
 IHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768325840; x=1768930640;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/CVOy4tPw1zWY0e6rYcKRwtfrfRvUlKFzd8YTNoGp5w=;
 b=V5y118JeFxAnTyiOiVwGiewKPL5YXLDErDImUg7XGU4IdioFp2m6TnXd3/ey06YyR/
 gBITxyINWfcacjjkucvsJCRWwvdXLHv4ScQbiB1Si9Y103LpzoOHwTQusr7aNkATpkkZ
 AjaahZyDwVUxAjj6xcANFOGE1J2GirwKBIXpvBlZ8Q1VrByi3QG4BsaYFPI2soT0dIBY
 PtJK44zmnWqL1A3ddmXiy0lSLZB5mYTvcOMRyNXfFsmKapsqJN4jUhQdmpu7zXEm5ESr
 R33c2DsfatnxoWx/oAokA3MS0e/TOnXR7pXGe+cJ7qZCeQ6OhBcz1P+hTQ+CnJDgNelz
 UoGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAOfq8ZOKJMYRYU35WO5hEXfLT642E9R4+1NMjnWtvX0er1x7qhzPeOCMensRKgoJ4I0GnMDnQj6DNPw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxGjFzekZkahLcMURCSHpg+6EB6F8Fjh2P7kIybQchw4NJiK2TY
 25HLT6Y4fEuU/JuzRLqx09smgwKyPtttWaTchB0CiKcDdoS4B/YrXQ8YWWkIdEEc1kQ=
X-Gm-Gg: AY/fxX7Yb+Nv1Ku+NBwMA0qImK7KgQBcDqM6T7TavnhBvUOi5goFH+Af5pRt782TXYS
 Bgklo1Mavy1hzOUPL9MRrQhqcDotQ3Bqyw7Q854qTa5YC3FhWCJBHA9aDnl1yPi8bdmy7BAeVzJ
 x/mnGZi51jvARpKCSnosHDr48SlFz0+G6T6uAHw36KD19ufFbUrl4Q1UxDe1qFYdeLEEG6LiUd0
 veFY+8zSqm9mF2M+HmYIthwDN68YvD8/LfPi/jffbibkiIeoBnXv6KE9EzF/YHJ751/5500zO8E
 VALlFFDrJIA3wxTqss7ri2D+rUJLVHMZvg7lbRjqa6nxBRqYkZVGpGxk33D+OmN3xTehxdc3m29
 ++cn9DwnVTkeK1HLIGGPWx/D6kyvjPhCaVZj43iswIP0fLA7Wq/mlKMbipVaMbI7z9XZvm9I9Xu
 2JbWp1NHYzs1iaZg==
X-Google-Smtp-Source: AGHT+IHUReQqvVgC0db5F0/UgqAPwHgCcpq2ZD0lhm0g7XnDeEa3Phlj1/GEitKl8zvqkUFbSZC6XA==
X-Received: by 2002:a05:6000:2dc9:b0:430:fced:902 with SMTP id
 ffacd0b85a97d-432c36436fbmr29258778f8f.26.1768325840268; 
 Tue, 13 Jan 2026 09:37:20 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432d9610671sm28342147f8f.34.2026.01.13.09.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 09:37:19 -0800 (PST)
Date: Tue, 13 Jan 2026 18:37:17 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWaCzZ8_UuyAa6xp@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-2-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-2-21a291bcf197@suse.com>
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
Subject: Re: [Linux-stm32] [PATCH 02/19] printk: Introduce console_is_nbcon
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

On Sat 2025-12-27 09:16:09, Marcos Paulo de Souza wrote:
> Besides checking if the current console is NBCON or not, console->flags
> is also being read in order to serve as argument of the console_is_usable
> function.
> 
> But CON_NBCON flag is unique: it's set just once in the console
> registration and never cleared. In this case it can be possible to read
> the flag when console_srcu_lock is held (which is the case when using
> for_each_console).
> 
> This change makes possible to remove the flags argument from
> console_is_usable in the next patches.
> 
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  include/linux/console.h   | 27 +++++++++++++++++++++++++++
>  kernel/debug/kdb/kdb_io.c |  2 +-
>  kernel/printk/nbcon.c     |  2 +-
>  kernel/printk/printk.c    | 15 ++++++---------
>  4 files changed, 35 insertions(+), 11 deletions(-)
> 
> diff --git a/include/linux/console.h b/include/linux/console.h
> index 35c03fc4ed51..dd4ec7a5bff9 100644
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -561,6 +561,33 @@ static inline void console_srcu_write_flags(struct console *con, short flags)
>  	WRITE_ONCE(con->flags, flags);
>  }
>  
> +/**
> + * console_srcu_is_nbcon - Locklessly check whether the console is nbcon

There is _srcu in the function name, see below.

> + * @con:	struct console pointer of console to check
> + *
> + * Requires console_srcu_read_lock to be held, which implies that @con might
> + * be a registered console. The purpose of holding console_srcu_read_lock is
> + * to guarantee that no exit/cleanup routines will run if the console
> + * is currently undergoing unregistration.
> + *
> + * If the caller is holding the console_list_lock or it is _certain_ that
> + * @con is not and will not become registered, the caller may read
> + * @con->flags directly instead.
> + *
> + * Context: Any context.
> + * Return: True when CON_NBCON flag is set.
> + */
> +static inline bool console_is_nbcon(const struct console *con)

And here it is without _srcu.

I would prefer the variant with _srcu to make it clear that it
can be called only under _srcu. Similar to console_srcu_read_flags(con).

> +{
> +	WARN_ON_ONCE(!console_srcu_read_lock_is_held());
> +
> +	/*
> +	 * The CON_NBCON flag is statically initialized and is never
> +	 * set or cleared at runtime.
> +	 */
> +	return data_race(con->flags & CON_NBCON);
> +}
> +
>  /* Variant of console_is_registered() when the console_list_lock is held. */
>  static inline bool console_is_registered_locked(const struct console *con)
>  {

Otherwise, it looks good to me.

With a consistent name, feel free to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
