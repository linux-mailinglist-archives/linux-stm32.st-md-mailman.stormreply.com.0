Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6796D1D31D
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 09:44:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94FAFC8F261;
	Wed, 14 Jan 2026 08:44:17 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6617C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 08:44:15 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-432d256c2e6so4679589f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 00:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768380255; x=1768985055;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/Nn9M/VPDoeuifL+P7no8o5FApQZk7zNKYvSR+p2CRU=;
 b=C8pB2rXIRy/J89HApe1yXazD9ywATUCY50MQEkaDna9ufZy0pwmsmN0zKLv/0iXDUJ
 ESVt2vmL7v68nLjBxPOiSIuP9YoffPf7TvMdLlvyE/UvQRyPc9FrWiY1xG3nsaSBtjLL
 7iPhhYI7MpgEhb3HAEvD0cOKj1CEfmYYa9eEVGLlUmy/ry7VQbHSjKZQSIILKLtdDXnS
 +JT0+uBGhrYYdTi2H8HfSULLq8DpSrh3zDcjK5grlM3u8PeSIptuiBSBbdZAsXKi5d7n
 t+bYHsGTvo0odQRx/DOQ7byySD6mpJ432k8kEeT/G5/GsWAjq6nlToo02ULNXqPmRpvg
 rGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768380255; x=1768985055;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Nn9M/VPDoeuifL+P7no8o5FApQZk7zNKYvSR+p2CRU=;
 b=cGW7eBoXv1fgKwfSJBMMdoQFDINtEqSfmx3FF0sk4tU2sTpjcAR5oz5Zw+iK5RZ4js
 a7dRWMpncyDWG6ARRD2cn50XKDUBGUSZzEUjUFURIw6b9puGuhJuwfZml95COHFSLls2
 KoYW2dQtathSQutdXNQ9XK2EkjManvzsbZsDofA1B1IoaVLovR3z26Pm6HQGCo4gVQEz
 cd2E8XchRZb64VqrlOC9ypBszcx802kS8CwWEhxgMuVco2HGBBIF/f7UfIOs4S1rYUTH
 nRxKrBCjMTV2Xbi6sQraCjYiUHHOzmRQWtwhBYJy3AWJZIrDbovbXqJvAABKXon2pqk8
 Ovnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSzts2IzWZX58WPJou38eo7VBb264RQn14rHnn7TUIHSZu2Cn2mSWrNPR3N727MfobbMoGGWtSX9Plkg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwU7kaGqUTDhDxHTq5i2afPt7tg3G0njgHg2lJnVIaMBvWElXOc
 W3ZciLRbgk3MTDP5VqVWrTGVnxuNOxoKhFAkxFpBIprXJBe7N9JWH7c2uRN43q/LpLE=
X-Gm-Gg: AY/fxX53nbaSDstgnfEACkKgGsqVwJILGwdrFBou83yJ/YAkMGu6KNcX9Q1v0gayHxl
 QDZSphblMmVQ/BE4TjuVfKsTiGtKSCNONZ94kpuGwpEjsuJLVAfty/qmRYj7hsBJZuqgE7xlSII
 f6E/RNB4Yz477eTPf8SI4uIugHH2ak9PZODh+EPwPIaKr6PvnHKV6wYgrZWGl+s0yQI4bN6iaSt
 O8YLznmyQmXVqz8+mQZh28C/DMdBrzRDvh6eiKL9k07DCaFJI5Oi7Znj4tYJV/va6THqHH/8CHm
 XvSptpLDjaI+YnyEBaOfo4qyGMrKVmjcksgEUCBQ91N/bUpcs1uZvx63LcKdVV1AHuFY3LxkLL9
 99eeqZl2meHDgR8M20Vj8DMtm5po+0TyKVBLDLABv20z24uvhfeH/gu4i+seoEctMN4qyUep9X+
 lft7BmRkTUH/dXGQ==
X-Received: by 2002:a05:6000:61e:b0:431:a38:c2f7 with SMTP id
 ffacd0b85a97d-4342c574bedmr1500621f8f.59.1768380254886; 
 Wed, 14 Jan 2026 00:44:14 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ee5e3sm48685590f8f.35.2026.01.14.00.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 00:44:14 -0800 (PST)
Date: Wed, 14 Jan 2026 09:44:11 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWdXW6ohfQ7_z2B_@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-3-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-3-21a291bcf197@suse.com>
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
Subject: Re: [Linux-stm32] [PATCH 03/19] printk: Drop flags argument from
	console_is_usable
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

On Sat 2025-12-27 09:16:10, Marcos Paulo de Souza wrote:
> The flags argument was also used to check if CON_NBCON was set, but their
> usage was fixed in the last commit. All current users are reading the
> variable just to call console_is_usable.
> 
> By calling console_srcu_read_flags inside console_is_usable makes the
> code cleaner and removes one argument from the function.
> 
> Along with it, create a variant called __console_is_usable that can be
> used under console_list_lock(), like unregister_console_locked.
> 
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -656,13 +656,8 @@ extern bool nbcon_kdb_try_acquire(struct console *con,
>  				  struct nbcon_write_context *wctxt);
>  extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
>  
> -/*
> - * Check if the given console is currently capable and allowed to print
> - * records. Note that this function does not consider the current context,
> - * which can also play a role in deciding if @con can be used to print
> - * records.
> - */
> -static inline bool console_is_usable(struct console *con, short flags,
> +/* Variant of console_is_usable() when the console_list_lock is held. */

Nit: The comment is a bit misleading because this function is called
     also from console_is_usable() under console_srcu_read_lock().

     I would say something like:

/*
 * The caller must ensure that @con can't disappear either by taking
 * console_list_lock() or console_srcu_read_lock(). See also
 * console_is_usable().
 */
> +static inline bool __console_is_usable(struct console *con, short flags,
>  				     enum nbcon_write_cb nwc)
>  {
>  	if (!(flags & CON_ENABLED))
> @@ -707,6 +702,18 @@ static inline bool console_is_usable(struct console *con, short flags,
>  	return true;
>  }
>  
> +/*
> + * Check if the given console is currently capable and allowed to print
> + * records. Note that this function does not consider the current context,
> + * which can also play a role in deciding if @con can be used to print
> + * records.

And I would add here something like:

 *
 * Context: Must be called under console_srcu_read_lock().

> + */
> +static inline bool console_is_usable(struct console *con,
> +				     enum nbcon_write_cb nwc)
> +{
> +	return __console_is_usable(con, console_srcu_read_flags(con), nwc);
> +}
> +
>  #else
>  static inline void nbcon_cpu_emergency_enter(void) { }
>  static inline void nbcon_cpu_emergency_exit(void) { }

Otherwise, it looks good. It is a nice clean up.

Best Regards,
Petr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
