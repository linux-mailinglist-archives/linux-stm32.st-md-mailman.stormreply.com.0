Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C9FD2CEE8
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jan 2026 08:08:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E355DC90082;
	Fri, 16 Jan 2026 07:08:31 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70476C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 16:28:49 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-432d256c2e6so892731f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 08:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768494529; x=1769099329;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=URJX5xTHolO9FC46ryjpGruJ5TGEDEyfrbwATuqwgLQ=;
 b=bZv5CCEv41D9bnhwvnOgIJBZC3TNd0gIaujqZ8izyERo/7ugV9vtldyOEyKnnh8l3t
 ZprSNiZmiWHo/ttWkTtlLeCWy/sUPdttTlYc1XjvSNdATOqzW80VlhnlqxACm9xtqzUM
 ceefd1qGyxM9mYG0O3Xfe1l4tl6j1h4kx+8QCdpazgh17QqLUoIU3AL2sahcjZwD6dK5
 UTN032i/twDpz7GUM+8OAMG5pKREejkNHbGoGqEpUN21zWaWtenCfGrFc6Dt26V9FDMI
 xT5lxx0HNJmFPhk0i+YHPvUxEA+tFtl+DtnJ6ziNzdy7XUGoQImk4xj9gbTBQjmfZLs6
 wWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768494529; x=1769099329;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=URJX5xTHolO9FC46ryjpGruJ5TGEDEyfrbwATuqwgLQ=;
 b=AXPOKG5EHxF3vrZwHs2lxFb6YuTgXoNyv32ehTWMyMOxop8CnIdGw9tH/AQhMPDk5a
 ENSRNnfQ/6NbVjbqjWSCfPHUTu5iXWpdImI624soTWlvASHloNn5+wWuoq54RrfOqSVJ
 tM56qMFep5nIPmZNzogk2YMOzwZx6hoYzWzEnn2sYrV+03UOGLBSpQX2EIK/Zn1Mx4P7
 yRJx7me+asCI2C+IweK2lGpLcXyyximQTadhomSHb+Np7hgl/vh+0FH7594meu3G9AWD
 Lf1qGszyut81S1s/Y48faBahJdfdMCXViO6Ni+pPqABCkwIcqf42ecvKzsQyvrTL5vPI
 MN7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC+7/j9ntSDCYGz/9RKClQup9vAKIO1F1MccK1UYfZuuxQ6dzsDD7YFwCF791t1STJKwk9pnhWVNbB/w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyidobpzqR0njz5ShpF7zalCNvg/dzZqsrU09mCe0rHPXRt8wRk
 NpT7dWTxFsdeZbI9UY1+Jetq8+Kngl0kTI7aduM7xHyt1JL7sMUR8vw/6qjw+RVnb4k=
X-Gm-Gg: AY/fxX63LAeLlyb3eGH3CmoZa5kqpOc+muRJeUAvQqzrp+Cix3hNtYICZDIdTnkViFm
 dQGs+wFg1kzFvsKlyB2Hx7ghV6bgXLovm+SBSQn68zOnsmMMc+FAaxsDyfUHcHyLEm5M7oKvqrX
 A4giTNGyD9ml7wu7uH+pW2rRCbPfRiI1GvZla89M+hWP3hAvVMWh6BU8h9fFlisDBLlpBBTTKnj
 TUYY5onJv4yuZcK4CcsFBbjR/GuQShpks4WBrgkbjFfpKiv4feS3UyF4Az+zKcKdMTgbMa+UVv6
 ok/iiHnoTVXGkkKP4pMwU3jD6sE11ZvC+VtWOD6UaTgg15h0bSW9nDH6sYmIKhsY8biV+E1S6dT
 H0Fv17ojhKlnCUBvcT2J2PF5bEPEZfHm/mbe/pKC4TXwghFUQ1AvOjzbklTUGUsUnzjj0PjFWqO
 UytoegMJDMyojPng==
X-Received: by 2002:a5d:64c5:0:b0:430:fd0f:2910 with SMTP id
 ffacd0b85a97d-4342c501a57mr9777353f8f.26.1768494528600; 
 Thu, 15 Jan 2026 08:28:48 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af6e148bsm6604069f8f.33.2026.01.15.08.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 08:28:47 -0800 (PST)
Date: Thu, 15 Jan 2026 17:28:44 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWkVvCu74HhV7W9s@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-16-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-16-21a291bcf197@suse.com>
X-Mailman-Approved-At: Fri, 16 Jan 2026 07:08:29 +0000
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
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-hardening@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 16/19] drivers: tty: serial:
 ma35d1_serial: Migrate to register_console_force helper
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

On Sat 2025-12-27 09:16:23, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
> 
> No functional changes.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  drivers/tty/serial/ma35d1_serial.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
> index 285b0fe41a86..d1e03dee5579 100644
> --- a/drivers/tty/serial/ma35d1_serial.c
> +++ b/drivers/tty/serial/ma35d1_serial.c
> @@ -633,7 +633,7 @@ static struct console ma35d1serial_console = {
>  	.write   = ma35d1serial_console_write,
>  	.device  = uart_console_device,
>  	.setup   = ma35d1serial_console_setup,
> -	.flags   = CON_PRINTBUFFER | CON_ENABLED,
> +	.flags   = CON_PRINTBUFFER,
>  	.index   = -1,
>  	.data    = &ma35d1serial_reg,
>  };
> @@ -657,7 +657,7 @@ static void ma35d1serial_console_init_port(void)
>  static int __init ma35d1serial_console_init(void)
>  {
>  	ma35d1serial_console_init_port();
> -	register_console(&ma35d1serial_console);
> +	register_console_force(&ma35d1serial_console);

Sigh, I am afraid that this is not enough.

I double checked how "ma35d1serial_console" was used. I guess
that it could get registered also via the generic uart device
driver code. I see the following:

#ifdef CONFIG_SERIAL_NUVOTON_MA35D1_CONSOLE
[...]
#define MA35D1SERIAL_CONSOLE    (&ma35d1serial_console)
#else
#define MA35D1SERIAL_CONSOLE    NULL
#endif

static struct uart_driver ma35d1serial_reg = {
[...]
	.cons         = MA35D1SERIAL_CONSOLE,
[...]
};

static int __init ma35d1serial_init(void)
{
[...]
	ret = uart_register_driver(&ma35d1serial_reg);
[...]
	ret = platform_driver_register(&ma35d1serial_driver);
[...]
}

And the gneric code:

uart_configure_port(struct uart_driver *drv, struct uart_state *state,
		    struct uart_port *port)
{
[...]
		/*
		 * If this driver supports console, and it hasn't been
		 * successfully registered yet, try to re-register it.
		 * It may be that the port was not available.
		 */
		if (port->cons && !console_is_registered(port->cons))
			register_console(port->cons);

[...]
}

, which can called via from:

  + mux_probe()
    + uart_add_one_port()
      + serial_ctrl_register_port()
	+serial_core_register_port()
	  + serial_core_add_one_port()
	    + uart_configure_port()
	      + register_console()


Honestly, I am not 100% sure. The struct console is assigned to
.cons in struct uart_driver. And uart_configure_port() function
passes port->cons from struct uart_port *port. But I believe
that they can get assigned somewhere in the maze of
the init/probe code.

I would feel more comfortable if we kept the information as
as flag in struct console so that even the generic callbacks
could use it.

Anyway, it makes sense to create a sepate flag for this
purpose, e.g. CON_FORCE or CON_FORCE_ENABLE.

>  	return 0;
>  }
>  console_initcall(ma35d1serial_console_init);

Best Regards,
Petr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
