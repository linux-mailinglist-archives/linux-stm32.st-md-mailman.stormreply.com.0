Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C339FD1A36A
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 17:25:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6073CC8F282;
	Tue, 13 Jan 2026 16:25:58 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A3E1C5A4EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 16:25:56 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-47ed987d51aso8637365e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 08:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768321556; x=1768926356;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=y9kSWtn88k+QkPqpOG7NN6Fxk/gRH5gvJVVHZoYjlVA=;
 b=dITLUMTJmA3t4yoAkr8oo9w9JpD4utUAJuzaykFRIFRk81IDDozEHJDOVFIa/FUdK0
 R+ZtpQeZ8ear/cZebUrjV8A1hLiuffLY01ZK+2e9/muFdHVaiVL3wcSeuRJandos+FE8
 CaJJpUWQ+x3SiFONJ+1QlRqgczNi+v9RpYEoZf/HRqbJttNNv+czkTDMR8IsMg24S7uz
 IiucaNmV9W+Df7EFx6OdEFPRj3aGHGX4idMF0tlPHiwggfOFo/t9ZJnxfxIb3SY9I4z7
 UbCNFdx0K9sUAmf2fUY9MRl3k/GZ3zrI5UHgG8dip4e89i2Xg4JMlXAwJculTBIP79KH
 3pxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768321556; x=1768926356;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y9kSWtn88k+QkPqpOG7NN6Fxk/gRH5gvJVVHZoYjlVA=;
 b=w3JNJa94P8FR5fVMuGJBSoVHACYnIyzRepix0rT55J6oQasM2XZrfCPggUTZjtZZ+u
 +8Ymda2yxlvUx5CjkTG7aczG7jjoQUi/3ifbr0d1FP25YwLrZy78L0SFPnRr6SiAFjTN
 pMkZwGYPDU0U+MjgZNpuI+BAz+fVbDDe/rU6Zbx5InUPp6Ho3uDarEfYD0ozDMV2Oqyp
 CrqwFl2M8YUHUVXKnudmYnOsYeD1wz7mofTouz0p6EFuvYjzqpUZ2BSqSqWm9Gkx4ryC
 Nt6FGcJAPH4Wy9JdO7RKTeYClNZYqEooKqm6OA9zL12zEHXP2lPlCAwT1opDbe5sdysn
 FFkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRQC7Kr71iWWYlPQChS4jsJqDZ8NV1d1OA2+L3TPOsdRhRZOqQ3Cxg9HJn5iBWQVkEY+pXJ+Mavt++oA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw2pA7wfR4VGo8U6iAjqKoT/EgwIbDXQ/qcWkjb2G9pdm4luG9d
 Ma/89xy1GR88LayoLqLuKBkuvUWDtdZCZK+4Js2dtGGMUrbFiatDDP0Roct4k0Qc/Co=
X-Gm-Gg: AY/fxX5LC1nDby8qljckZh1XlRTeCWEPPscF4tNkw1d3M2/NUXm6P6774gbxambsSIn
 bleetCX3MDhYazKM6ESuslkmH6QvAlwVJcL/eqF1/zgf2QXazdvOR8ZvwyTqcteK4PE8dm9tHcs
 Et/JSEKXZnSGq5ocgvj7q6CLd1ULq/YIHnNcj8WnIEqg9gjRi5dukAlI0d3iyUUHevLNEjOqTQ5
 HSXhoZ4hFJlJ0xzT9Mngj9fxJqu1z3DqFO5XBVuz2OgD4XS6iLgl8fVTf3y6kuRJ9grmfMNkSFp
 N5RY0LR1rsjpmqpnhDWgkChigZteJgBONidtY2tX9UKGiUSS5wivgpZnJ1nRhi4T7DC58gnHXxs
 1Z0nWN+D9pJCwxm5Z8ZCMNs5p5A05U7SVPgR652IZlUomsH8UiJL1rC2VoAQVcnGTzyAlz0Lq7+
 qpf+MGNmlqYKeDe8OxGzHSlne4
X-Google-Smtp-Source: AGHT+IG4o2sMRbjal/wNqE1AyBhrQEhgOmuQP9i1Wb50Y85ZgDNaJvwCCbv/cl0e10bMkrsnwOfPLQ==
X-Received: by 2002:a05:600c:1e1c:b0:477:58af:a91d with SMTP id
 5b1f17b1804b1-47d84b0aa4bmr229523325e9.5.1768321556267; 
 Tue, 13 Jan 2026 08:25:56 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dad8bsm45637605f8f.8.2026.01.13.08.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:25:55 -0800 (PST)
Date: Tue, 13 Jan 2026 17:25:52 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWZyEHsOJFLRLRKT@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-1-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-1-21a291bcf197@suse.com>
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
Subject: Re: [Linux-stm32] [PATCH 01/19] printk/nbcon: Use an enum to
 specify the required callback in console_is_usable()
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

On Sat 2025-12-27 09:16:08, Marcos Paulo de Souza wrote:
> The current usage of console_is_usable() is clumsy. The parameter
> @use_atomic is boolean and thus not self-explanatory. The function is
> called twice in situations when there are no-strict requirements.
> 
> Replace it with enum nbcon_write_cb which provides a more descriptive
> values for all 3 situations: atomic, thread or any.
> 
> Note that console_is_usable() checks only NBCON_USE_ATOMIC because
> .write_thread() callback is mandatory. But the other two values still
> make sense because they describe the intention of the caller.
> 
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -202,6 +202,19 @@ enum cons_flags {
>  	CON_NBCON_ATOMIC_UNSAFE	= BIT(9),
>  };
>  
> +/**
> + * enum nbcon_write_cb - Defines which nbcon write() callback must be used based
> + *                       on the caller context.
> + * @NBCON_USE_ATOMIC: Use con->write_atomic().
> + * @NBCON_USE_THREAD: Use con->write_thread().
> + * @NBCON_USE_ANY:    The caller does not have any strict requirements.
> + */
> +enum nbcon_write_cb {
> +	NBCON_USE_ATOMIC,
> +	NBCON_USE_THREAD,
> +	NBCON_USE_ANY,

AFAIK, this would define NBCON_USE_ATOMIC as zero. See below.

> +};
> +
>  /**
>   * struct nbcon_state - console state for nbcon consoles
>   * @atom:	Compound of the state fields for atomic operations
> @@ -622,7 +635,8 @@ extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
>   * which can also play a role in deciding if @con can be used to print
>   * records.
>   */
> -static inline bool console_is_usable(struct console *con, short flags, bool use_atomic)
> +static inline bool console_is_usable(struct console *con, short flags,
> +				     enum nbcon_write_cb nwc)
>  {
>  	if (!(flags & CON_ENABLED))
>  		return false;
> @@ -631,7 +645,7 @@ static inline bool console_is_usable(struct console *con, short flags, bool use_
>  		return false;
>  
>  	if (flags & CON_NBCON) {
> -		if (use_atomic) {
> +		if (nwc & NBCON_USE_ATOMIC) {

This will always be false because NBCON_USE_ATOMIC is zero.
I think that it was defined as "0x1" in the original proposal.

Let's keep it defined by as zero and use here:

		if (nwc == NBCON_USE_ATOMIC) {

Note that we do _not_ want to return "false" for "NBCON_USE_ANY"
when con->write_atomic does not exist.

>  			/* The write_atomic() callback is optional. */
>  			if (!con->write_atomic)
>  				return false;


Otherwise, it looks good to me.

Best Regards,
Petr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
