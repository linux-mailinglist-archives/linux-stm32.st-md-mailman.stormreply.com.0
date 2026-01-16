Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 881C2D3A37E
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jan 2026 10:43:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3883DC87ED4;
	Mon, 19 Jan 2026 09:43:37 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28385C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jan 2026 10:00:01 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-432d256c2e6so1442727f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jan 2026 02:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768557601; x=1769162401;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ik7nBSUvqjiZji8p0UMpcxyJ9CmKYvj/STnQwZRmw6o=;
 b=KMmfqL93z62qX3M9anOMaTbbqa4c3s+fFXAkwW/yp2fGFq7xUkP8HmN0iWO22dfEsE
 wQ4twTLaeVVSdIT7LR9n1PkqjJV7+SbaoDyeKydGEJsT4PCC8DhFea6mPFaUEsW38f1a
 ZhSYxrQDg0SniluOh/7ZzkUb+rqFTtxViXYS2917pu1o1aqiBZ5BureXGbYBUQ6ttGw9
 LjdGn0bSQw6mnnZH7BIrsdnnQ1DuQ3iNVfv8J+GhRlvBlDJzj8OKvovJ5fyVP+DJg/F7
 MdPVAuf986yuO91kOLDCnF+cs/GW0YBWCapxxBJoggyskpOtmZJXsnEzUW+pJBWu7+qL
 Dyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768557601; x=1769162401;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ik7nBSUvqjiZji8p0UMpcxyJ9CmKYvj/STnQwZRmw6o=;
 b=DuGJWUkCfPc3XUPP2tLNUgYv/gbKHRsGckq5OqIc05g7UPgag+JkWw9bBRBrNmPP1d
 1qBvtXllBMKHt7YlmRrdJEdwSB4HQhTNt/jDlbAnbyiu4LX0TsJasTO+vifpfuUyrnLj
 ESzHhOruKh+E+Fq8gsgN8PNCT5wckeBx74tHJSI6HmV0GQiWBSwICR0+uwDMdzaSD8C+
 +New7ANFsIPb91rRURlSsQARMi1i0ort1py3E/bF2dk1x/4E1X75VNx026dgfyG6abxq
 O/e1SF15mzhAI3Xq7TtZUI9kbJ1IMY74bd4gdKSMt90DJ6vPmfXVUnJs2td7hXdYassx
 RKqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjIOdYbDfGCmGdMM24SvM2aXhmhw9rrrWJ+8nd9Vwq2nVlkcYoIeePIruQzIqp5Nyv8GItFpwa3vgO/A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxULKoGiWtxkAYvDrCqjlcSmDtY/Rv9Elv7vzS5LOETaoFkYgte
 lnW+WaDI7gkJvdbrhnXztfIKSu3hNx55fEXJubUzV+M0Pe8FcoGQzfSKdBG8xvWGfb8=
X-Gm-Gg: AY/fxX7xqJsGjmMwUEGw6M0V9uL+Ay+azecRNpFOhamEaZQMpdvodAE2uM8Q5kiOxiV
 Hro/Ouu/yd+wcSFagvhjcktXZnqXHE3LjyXTccdJERJVB/mWsGIbhNY/iO+fcEf9dw4DbTs44mx
 LyBgXdSE1xw3tw0pc+uj235P14dZef5iyVR1v5uPvUQNMPSF869Mrcl1uleJ/MtORY1ZlJg0HgQ
 2YVa4utOoca9nGCp1U+3nsnc9Fjb7PSh6vX9KESATEzSQjIH3Nk1Zd8E+TX4Fu1rEkihiw7mmt3
 b0fXOwcWRCnFkITIepZ1ynsrcfVPt/ouLFHMd44ZInGCNzclxuoFbl6wd/MIUbYZg4GuARtnd5+
 mmdqxi4yYN8Ho5FCQWlwcuYcCOxEteucD/EBZowV9B4IHkA0M+4g1OJ81UZoOhry6JMzCPgSmHM
 hesRSRcl8A4vGkEw==
X-Received: by 2002:a05:6000:26ce:b0:432:dfea:1fa8 with SMTP id
 ffacd0b85a97d-43569bc5767mr3019291f8f.45.1768557601174; 
 Fri, 16 Jan 2026 02:00:01 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569921f6esm4337797f8f.4.2026.01.16.01.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 02:00:00 -0800 (PST)
Date: Fri, 16 Jan 2026 10:59:57 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWoMHbbn-BmmbZMg@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-15-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-15-21a291bcf197@suse.com>
X-Mailman-Approved-At: Mon, 19 Jan 2026 09:43:36 +0000
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
Subject: Re: [Linux-stm32] [PATCH 15/19] drivers: tty: serial: mux.c:
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

On Sat 2025-12-27 09:16:22, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
> 
> --- a/drivers/tty/serial/mux.c
> +++ b/drivers/tty/serial/mux.c
> @@ -390,7 +390,7 @@ static struct console mux_console = {
>  	.write =	mux_console_write,
>  	.device =	uart_console_device,
>  	.setup =	mux_console_setup,
> -	.flags =	CON_ENABLED | CON_PRINTBUFFER,
> +	.flags =	CON_PRINTBUFFER,
>  	.index =	0,
>  	.data =		&mux_driver,
>  };
> @@ -547,7 +547,7 @@ static int __init mux_init(void)
>  		mod_timer(&mux_timer, jiffies + MUX_POLL_DELAY);
>  
>  #ifdef CONFIG_SERIAL_MUX_CONSOLE
> -	        register_console(&mux_console);
> +		register_console_force(&mux_console);

The situation here is the same as in 16th patch for
ma35d1serial_console().

Also "mux_console" is assigned to

static int __init mux_probe(struct parisc_device *dev)
{
[...]
		mux_driver.cons = MUX_CONSOLE;

		status = uart_register_driver(&mux_driver);
[...]
		status = uart_add_one_port(&mux_driver, port);
[...]
}

So, that it can get registered also by:

  + mux_probe()
    + uart_add_one_port()
      + serial_ctrl_register_port()
	+ serial_core_register_port()
	  + serial_core_add_one_port()
	    + uart_configure_port()
	      + register_console()

And we would need to pass the "force" information via CON_FORCE flag.

Best Regards,
Petr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
