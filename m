Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A7BD2CEE4
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jan 2026 08:08:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDE92C90080;
	Fri, 16 Jan 2026 07:08:31 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AC9BC0693F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 12:29:41 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-43246af170aso453541f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 04:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768480181; x=1769084981;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ld+As4KXLNBvjLuNePKBkF4h3CZ3gGNkmAsVzP6KebE=;
 b=ebb1YS32nos/7M2XKhIVlDY5LCM3kvtGVsnVQw7In/MNKVXjf/ariQWe/yGI3vfTjz
 gbLW9z3bE5G8iMQP/6yYHqzEcNzE8R+Pyo7JWPoM+qtq0kOKziknkanccO8vZpFUAH0A
 XcpNssOpjrrN/8oJhs+qoKwQdt2a/Y9SxwS2eUF5Gd6ISlcTLAdcGJIncOnn6enUd8Lj
 F7lGOalz9roRn3HmelloqBFUjCZO+9HvyowqCnEf/OI6QwD56fVBIg02joS/3mssCHSB
 xjj1RUBAsYBCN9HXAJ3Ds2xaMdMOxLHSMu+xoYNSJWkRzT+w90pRfx58t7nx7xpyYJUx
 kU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768480181; x=1769084981;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ld+As4KXLNBvjLuNePKBkF4h3CZ3gGNkmAsVzP6KebE=;
 b=LK9dOmIE8OVqWp7nmGr/o3BDDYvPpw8k5Zhb+D5ImS7qkuYzDk+QIrAL1/I0wW5G88
 1MRUcNKKW116vu2B3hj77f1rjceEpnqFSBGqoidRgl3TXwZfNGRd1CkrLnkc2d6hhspz
 eCJHchRubGbeRVTf6R8P2OkTPHRpvV1phX3RPCy5B9HgYLlRPy4Sn7js1wqpMd4JFVtQ
 Yd+/X7Dh0N8eRw51TLW+f8e73H5WnWATdEEBSeZ3Koo3Fm52nwvS0Gf5XHJiARK+yM3N
 c1pn8MpZzescGNbJPz0jMRNJl3N15pWCDYTjBbJoS+kMOuJ6fUh6NmCn1c0mCSyPmFN2
 6g/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/dEfPGtZ08w35pltvx3ygkAH3S034ARW0KMDhj6C1i/6QzAZra51HH2nbymcoQzQT4jwX5L6zxVd4hA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwAzxg7+vJZ4Kw0B694toGuc1ibeRS94RUXpbvhLdACdz3gdu3r
 ZzS5vArcdGVXsRP0nh0t4FoNZjhHAtwdlL9aVV5JTtNjyJ+eO6a6MQurjqwY6sro2jI=
X-Gm-Gg: AY/fxX7iCh+X7yrtpus4tNTyR9lBs4oOBFYMmVLYvQUMZjHsup7kM5DCsZ/qyqFHugW
 jgWZcaC0X7iwByMZ3ZiD+6ZQYRBYcJK3awKPsazanlyrfwvGMu96EpZYREr3a4vGrMbTEAf3iFO
 bor/y1ucWCRisStnGU/i3YQ67fWD5pAFQNz+8Ko1/UYdR8mJXRycrZDr6yi474Br60ID0zlXRf1
 9iDITVtaMxvFGj7u5CyVq2WsHexo5/RgpwgDOHX4xphACgFQ26f1j7ZwdXz9GFuq6BAMi0p3SuW
 Oc/HIOU8+ifna7bHhSToBrl3Awvf8oRl9W9bj8eyQjMuxC6zqF3zzOqtMc6ZVBPYCreb4Z+bGHz
 wWGjj4PqrNXRWB1COpggANj/SniSxDxhW5jZoF64PDDSjAasS1ZQ8nMtbZmExu7/wav1xslkIM7
 G+D+oQRjmcVqeh6w==
X-Received: by 2002:a05:6000:420a:b0:42f:f627:3a88 with SMTP id
 ffacd0b85a97d-434ce7324b4mr3823468f8f.4.1768480180633; 
 Thu, 15 Jan 2026 04:29:40 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af653576sm5965022f8f.17.2026.01.15.04.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 04:29:40 -0800 (PST)
Date: Thu, 15 Jan 2026 13:29:37 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWjdsbYev_5zfKEC@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-14-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-14-21a291bcf197@suse.com>
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
Subject: Re: [Linux-stm32] [PATCH 14/19] drivers: hwtracing: stm: console.c:
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

On Sat 2025-12-27 09:16:21, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
> 
> No functional changes.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

LGTM, nice cleanup!

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
