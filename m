Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7412D1EFEC
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 14:12:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B2BFC8F26F;
	Wed, 14 Jan 2026 13:12:25 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF8F4C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 13:12:23 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so59384135e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 05:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768396343; x=1769001143;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ucpTGToIn8N6Wm60fm7MZ05SRRlKYptl+ek5X25PfwQ=;
 b=eVsBefvKHfVYAiyRZ6CpCOM2WQpAyKGUDTmesveB8Q1U6zsy1p/5E/LSdep6O+5g33
 iqX2twfXF5nwpWkP5VSfEILusjiyI+mNKJ7CQsUIZUq/BnQWGaFFRZnzHKunvLb6v5EY
 Zis4dBdVLdCwGmdsb4rh9LmmQeLJZ9RsA65XWL9JHstCd6zoNqknDv2nXQqL030POkkX
 zYoLK0pIQ+4YgmMW/AUXpO9MpGZYGryac64MM+5TF2W5X8vww6qFcDNqyw55TEz94Nvm
 MGDtecZwDpbSSaUCa01eZZCCkKplQq/NxKy4e5YcRKk1XSiG7UqjvGVeG3W+O6gJzyIq
 8Phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768396343; x=1769001143;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ucpTGToIn8N6Wm60fm7MZ05SRRlKYptl+ek5X25PfwQ=;
 b=GHezxUmIxl8CmKIhWbby9fOBXq7YU+EyxGLRDHKrCf9xbzb8g3oPZ7ckirvKH9PuU2
 QnWXddxro95zmzaPIshCzMTSWU4BVeJqzDf5J9FgHUgh0B+Ji3XvRH9ITfvuV99GS74B
 9ltQGvJXMd7LYGctUpoJZt8fni8P7P46dRhSlGEVdoPT/K35bIE1o2dFcrbg1g0hfP2B
 ueWhmwsyBtHELf4jB7kMu726iYpf6oMXaY/iMLR3feJH+vAdz+QDtAwyyP+M534nac8V
 KQnMk/4P938KE6s/4Vz7Httq181fvYdbStCqNTTUO+jz+Pimzq+kXxAs43B3qhx5MDrG
 H7ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCViuFiCgTTFaVxNa2wI/P5unN/XTinO24PPr+Bsoe0l0HG0ahUmf4qD/f523VIQ7SjbKWeJEnGtZmZZZQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzCYLdWcJ1S2OVBKHePZBuqFsHFMhg+sSZyMtmHYsGIOhJbU/Rv
 LcGQFvSyMO/OtbBURbL8+c1zUCRwNqirD+hAjBbnP0FvsMJ+xj812tILLcq7PDpLylk=
X-Gm-Gg: AY/fxX7GCbSztANGNwix0PaJ7pbxeKkjwX6cDNa9iXFIxNuH2sP8cvIqLkeT9/mHtc+
 5pbYmbMJ59KqeHj6yW8rS9HtsvVPMPoiHAGnziZAY1jVax3mR1uEoH/puayyyN7eLswwmJlSEaa
 7EPX/JZ4eZxxVS5qVR/YeTMAeSDtg/4gwWzHw8dJMwxOrlFehZWsbnTanWMbIgJloLlGAmycQz2
 qKJ5oTxLN71hAgq4Cx45/Pi3+zW1ZWLR0vQsh53I/gY2xiXxj2Ec1Su3G/5CFBFFFvpO+uXYWYX
 d2Es7YNjs4nenFgwSIdJLgZkL3Is8dXop8z+muvoqNyFxKG6vdiQK6w28RpEdT1ucxPX/vNjQUY
 iWNY+TxFHidSo0quGEtdh2PC6dAuiMDyOMwribOTzREeu7wgpCT/KACEKJIqzQ4jEpEUl2lckkq
 Nkr7269dFAI5fTidCS4SBtI+Id
X-Received: by 2002:a05:600c:5490:b0:479:3876:22a8 with SMTP id
 5b1f17b1804b1-47ee3356d5dmr36820375e9.16.1768396341643; 
 Wed, 14 Jan 2026 05:12:21 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee54b8c9bsm27274065e9.3.2026.01.14.05.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 05:12:21 -0800 (PST)
Date: Wed, 14 Jan 2026 14:12:18 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWeWMga1VaT0sYwj@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-4-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-4-21a291bcf197@suse.com>
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
Subject: Re: [Linux-stm32] [PATCH 04/19] printk: Reintroduce
	consoles_suspended global state
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

On Sat 2025-12-27 09:16:11, Marcos Paulo de Souza wrote:
> This change partially reverts commit 9e70a5e109a4
> ("printk: Add per-console suspended state"). The intent of the original
> commit was to move the management of the console suspended state to the
> consoles themselves to be able to use SRCU instead of console lock.
> 
> But having a global state is still useful when checking if the global
> suspend was triggered by power management. This way, instead of setting
> the state of each individual console, the code would only set/read from the
> global state.
> 
> Along with this change, two more fixes are necessary: change
> console_{suspend,resume} to set/clear CON_SUSPEND instead of setting
> CON_ENABLED and change show_cons_active to call __console_is_usable to
> check console usefulness.

I would invert the logic a bit. I think that the main motivation
is to replace CON_ENABLE -> CON_SUSPEND.

<proposal>
The flag CON_ENABLE is cleared when serial drivers get suspended. This
"hack" has been added by the commit 33c0d1b0c3ebb6 ("[PATCH] Serial
driver stuff") back in v2.5.28.

Stop hijacking CON_ENABLE flag and use the CON_SUSPEND flag instead.

Still allow to distinguish when:

  - the backing device is being suspended, see console_suspend().

  - the power management wants to calm down all consoles using
    a big-hammer, see console_suspend_all().

And restore the global "consoles_suspended" flag which was removed
by the commit 9e70a5e109a4 ("printk: Add per-console suspended state").

The difference is that accesses to the new global flag are
synchronized the same way as to the CON_SUSPEND flag. It allows
to read it under console_srcu_read_lock().

Finally, use __console_is_usable() in show_cons_active(). It is the
last location where the CON_ENABLED flag was checked directly.

The patch should not change the existing behavior because all users check
the state of the console using console_is_usable().
</proposal>

> diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
> index e2d92cf70eb7..7d2bded75b75 100644
> --- a/drivers/tty/tty_io.c
> +++ b/drivers/tty/tty_io.c
> @@ -3552,9 +3552,9 @@ static ssize_t show_cons_active(struct device *dev,
>  	for_each_console(c) {
>  		if (!c->device)
>  			continue;
> -		if (!(c->flags & CON_NBCON) && !c->write)
> -			continue;
> -		if ((c->flags & CON_ENABLED) == 0)
> +		if (!__console_is_usable(c, c->flags,
> +					 consoles_suspended,
> +					 NBCON_USE_ANY))

It would be better to move this into a separate patch.

>  			continue;
>  		cs[i++] = c;
>  		if (i >= ARRAY_SIZE(cs))

Otherwise, it looks good.

Best Regards,
Petr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
