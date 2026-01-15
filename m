Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A43D2CEDC
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jan 2026 08:08:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50AC5C8F298;
	Fri, 16 Jan 2026 07:08:31 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DB41C87ED5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 11:05:55 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id
 ffacd0b85a97d-432d2670932so671731f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 03:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768475155; x=1769079955;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AuZzUvIQYamq4W1YoLrzX7y0En5/TpcBTyFE7gx3A0A=;
 b=Sv3DLdqYyR+cL8ljfcC10TpQwu4f2cagjPx47VsV4b3MaZjUDuFNiIKskhAyxkD+r8
 xjTZJk1Uesutf2Jj7GvnY8vc61JxBISva5q9m4DP4ljDxiNTLIKRv/za5LnbeAxV+wXN
 ICICjFwC0/XKs64oAUX2nWwuRZHK007/8JqnrORhYqHtEgDxNgYZWI7hfINInSNnr1SU
 3AzJRw7aQsfd1vzjwv9+s2NquF89i3NxCakFil+2hLgbDrII8r5N8eLpE/b07+sOYH4o
 Gf0pjApGLbGjrG+ve3KLvg8tyJTLLyf3pPx79/ZHqFrfbzLDSH3/zaPZqtpB/g4nwSVB
 hKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768475155; x=1769079955;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AuZzUvIQYamq4W1YoLrzX7y0En5/TpcBTyFE7gx3A0A=;
 b=ZAM8jHiR5mIBIvEnXkQydX172do/sgUYRBPB+H1m4stW9w+HD8jdv+K3uoAuQKJckk
 MUa2tKJCnKxI9YJZ+3G4V600eoG/7iLRpg9QxI5nYR5YI6naWaQQ2mYi+JU7fnebM7Z8
 2k6C/bojvy8tRkavpOKph3LxlGYlpD/MybfGLfnOHGwbhHt5BgWBwr/xgRavgu6spcMc
 XyA/vSVcHox99ARf8BZQPD4Ir1UOTt5VP2Ttds0HyVh06PqjtAPs9jE5xNrNMRZUCXKr
 eeAqh9tmlStCdEutdjlehS6gM2wSMgLkUYxrjDa2EVr3Ahe4Gp3cn2nDgn8xyfZpy5KW
 UdOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi0GTqTIpeBV1lnuFB7b0W9TcVIQjrCbG7dx3DWQVOVQEnNFrYzXDgnO3ABd6ZnSxXSvd931JmUx0Zbw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyD5dNeo5Mw/26FFmw1DEBxHaWgKPioTxdXk000TitHZHeKTI5v
 rdeDtWxMUndhpcL4IY20nP1Y2IJYniViSxjEb0TKoDXbWp+21DBNu9EuAbasjOXfUPU=
X-Gm-Gg: AY/fxX50ItlpVnQRyszFFm4xc1pRSvaI3Wg0B9FFhL0xWQu26W6akD7hPNNyE1lJV4N
 7U1Ufaett4UTXnPOAS2VqgsEbNuvHCld1x/jXw3gsI51X3Sa9dSMZMZVrzcGj/E4Myxu0CFV6am
 IU3ZPWUfv9tz8VX4RMYIJGG2lox/h3rWs99OVheQQNs0eIiHJ9s4hzidkMIif62UkgDYQW6dO3B
 VLjOHrHkXidAmwNew7hLkjJcG4A520c8pojF4eKcFs7J43xNTOCpis1jGCbYaICrgp7WlHzFguB
 6paUmE7SFV07ruKag5YOWyjGx68IvJaFfKRc4sYbz4SMcCc+Brb5XUaXlzlQAOBhxzH0ozSGFF6
 k6niAJm50V65bD8qvS4RlJ4WstFQAliCaov6PigeND8z7qIQDeUYl+9QF+D5mvwb3D7xngNxTrN
 VTwCmkzpAxjVXxPQ==
X-Received: by 2002:a05:6000:2f84:b0:430:fa9a:74d with SMTP id
 ffacd0b85a97d-4342d3912bcmr7103110f8f.24.1768475154515; 
 Thu, 15 Jan 2026 03:05:54 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af6d909fsm5297949f8f.31.2026.01.15.03.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 03:05:53 -0800 (PST)
Date: Thu, 15 Jan 2026 12:05:51 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWjKD4jv8CySV0Rj@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-10-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-10-21a291bcf197@suse.com>
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
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-hardening@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 10/19] fs: pstore: platform: Migrate to
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

On Sat 2025-12-27 09:16:17, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
> 
> No functional changes.

> --- a/fs/pstore/platform.c
> +++ b/fs/pstore/platform.c
> @@ -418,10 +418,10 @@ static void pstore_register_console(void)
>  		sizeof(pstore_console.name));
>  	/*
>  	 * Always initialize flags here since prior unregister_console()
> -	 * calls may have changed settings (specifically CON_ENABLED).
> +	 * calls may have changed settings.
>  	 */
> -	pstore_console.flags = CON_PRINTBUFFER | CON_ENABLED | CON_ANYTIME;
> -	register_console(&pstore_console);
> +	pstore_console.flags = CON_PRINTBUFFER | CON_ANYTIME;

As the original comment suggests, this was done primary because
of CON_ENABLED flag. Otherwise, the console was not registered again.

register_console() might remove CON_PRINTBUFFER when there was
a boot console and the newly registered console will get associated
with /dev/console. But I consider this a corner case. Other console
drivers ignore this scenario.

I suggest to define the two flags statically in
struct console pstore_console definition as it is done by
other console drivers. Remove this explicit dynamic assigment.
And add the following into the commit message:

<proposal>
Define the remaining console flags statically in the structure definition
as it is done by other console drivers.

The flags were re-defined primary because of the CON_ENABLED flag.
Otherwise, the re-registration failed.

The CON_PRINTBUFFER might get cleared when a boot console was registered
and the pstrore console got associated with /dev/console. In this
case, the pstore console would not re-play the entire ring buffer
on re-registration. But it is a corner case. And it actually might
be a desired behavior.
</proposal>

Otherwise, the next generations of kernel developers might think that
the re-assigment was there because of CON_PRINTBUFFER flag.
And it might cause non-necessary headaches ;-)


> +	register_console_force(&pstore_console);
>  }
>  
>  static void pstore_unregister_console(void)

Best Regards,
Petr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
