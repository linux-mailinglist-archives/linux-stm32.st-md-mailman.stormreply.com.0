Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A51D2CEE0
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jan 2026 08:08:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A453C8F29C;
	Fri, 16 Jan 2026 07:08:31 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34D88C0693F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 12:14:42 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-432d256c2a9so830070f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 04:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768479281; x=1769084081;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zx4s5ogULMWiwAg3H50k8gmoVyZOh2DwfMGC+/dY5Co=;
 b=QM3lY7ccr6onf9ZZRXmvFohitCLbWqnPHwzwDI0g4+ixhyBALNrsmYjsY2krVjgzT/
 5Bg8eUWrA97PDlwVmKc2ufItWctTBtxD2vulSyMYS7GflxQj9+B514YVsbaqgMeyGnxH
 TRTiLlzG+TUjJzlZ3r12U9OyHnhZXPMsNv6rHASmNHvN5GeKHekbyelksGHWkaKCLazs
 iC1GJJtJrsc/oWj2bSrsnfEFpFjJeioeLjV3kbhYwRsiT16/CPg9cFKQwH4X2Puckifx
 HLp4pUFgGFRd1AI/j7mGDaMXs10Y4+yTdy8bKNs6bEb4bjS2tMxyjautIbtW1la/9dF3
 /kJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768479281; x=1769084081;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zx4s5ogULMWiwAg3H50k8gmoVyZOh2DwfMGC+/dY5Co=;
 b=GcUHO9ep+xF9htJ7UjaRxV0/SDhUfHzu66petJH0CHJv66aZ11BbVZ266slcc80uAb
 YaqSAyLm7ArYytoiAvyGKF0CVcn4wmKhyP0zPtYZgIdKjEjcC1CYNTYWbd3MbTc+fuPz
 YOcmRMBUZcOHyyJDsNRBVxYBkrTiX7g8cK3hmdC9dt3QbZWfexfgCPhR+7yD57SolAVn
 dgPmPDUhc8AGL/UoPemq3ZDoiNPup7/nHaLJgQ7sKLcty5l/qR0xYy8gtaZl+a7Kie6k
 c2Y7Egl7Kc6dLYAQ+Bj4Hr5OEJ3XUCmXkozAjWmhrxY1pCWNqX6mzSJYK1ry8p6rVLuQ
 2q5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyXaeGepbo7BVn+PNF0HuXeCimLX8SMwMN2eClm55heHawPB7earE5v0hOKI/RTR35zXoj9OGanbmxAg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzPWsxKp9F+mgIsAS+XX77sAF7tOl7qBDN5gptfsTQt4aeMzUHs
 wKGr4qPKCnWwMEkEB/s2FcI+KYv2wIeOkK4TPGQZzT6tFTXV2oFat1X7b+s1J8bl3HE=
X-Gm-Gg: AY/fxX72OALzEq3IuIXexAwWQ/FrEsr1BXhDeG1C6J/KZ/inWiBdS2XK1c82DKaO8mt
 ifBbHeokdpV18hBg1bumyEptCA5DXgHsa3m2+2t+1TyWL7gDwrYrFMxIBztw2K91CLc3UjKNzpF
 Y9ThFRThCepZUrEFZJk044nYpmDg1cIIiRBzK30tRaW5euzuiMmFX359VuMOTWAKfcTip1jE6qX
 NNFEFNxOlbWpodatCd/Apv2c/FAWVR1IvwM1n/JFXwHecu4iBDhkDbOTFz8FpXywzQO76zqlctd
 hBF8Hc2nzLkPWuO4ZH7XMLOmddiKZQzjFi2hfmL92H13GyplzrnGWUS3r9nswsnLw0XUCFbNEl2
 siKGu8UbsLJi4rTEKuBZPBy6VSyHIafM5lfSyC7bkt1grtaPpw6JBk2TCDwMgXcJhw8jWi6dSmC
 jTg5xZjM0TIOH2og==
X-Received: by 2002:a05:6000:3101:b0:431:abb:942f with SMTP id
 ffacd0b85a97d-4342c557b93mr7715812f8f.54.1768479281353; 
 Thu, 15 Jan 2026 04:14:41 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af64a778sm5591185f8f.3.2026.01.15.04.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 04:14:40 -0800 (PST)
Date: Thu, 15 Jan 2026 13:14:38 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWjaLhzRoTLalIrM@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-12-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-12-21a291bcf197@suse.com>
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
Subject: Re: [Linux-stm32] [PATCH 12/19] sparc: kernel: btext: Migrate to
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

On Sat 2025-12-27 09:16:19, Marcos Paulo de Souza wrote:
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
