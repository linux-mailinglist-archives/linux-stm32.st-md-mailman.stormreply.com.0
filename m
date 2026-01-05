Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A9BCFF047
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 18:09:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E12C4C8F284;
	Wed,  7 Jan 2026 17:09:39 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 498E6C290A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jan 2026 14:08:30 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-4308d81fdf6so6752262f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Jan 2026 06:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767622109; x=1768226909;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Kq3TtsxUy/q4IZcqauYlg+KhZOOjIgyB7YRbMBjceZQ=;
 b=PZcKqlhcaM0Hrdc7ghjj1unMwYGqQg4sJZSHIhgv9TvjGYctvFGJfwU3HGvoxCaph8
 SPjK93L0xOlMU80Br0SqXquD4YrdC3Mg/JT35vY06OnltrFRavduq7cPf6/zbB4rXQB9
 FFlLLjj409X0j2d7WG7qsmO+NdDwRcMxjNPhoYsRAVtKweeQkqs4DQrOsWxjXXu50cxZ
 CTbzey9EQgUBwL7AEG2pbZknp6CyQuRfJO2Hv4uqYHVJHQXnW69IBA/U1GWhHiFhqCmS
 0FQfB3DO72O29EGpV5RdGDZ9eaxdqhycwBoCXjFH18MPhvzA4E0gEpaT9eOmr1jA9zdV
 MOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767622109; x=1768226909;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kq3TtsxUy/q4IZcqauYlg+KhZOOjIgyB7YRbMBjceZQ=;
 b=CoduZV1cjnKRjX6ZfJXp9Wtqn+J5KkGr45QThqclXy0gXiguEUngV1WHPVdqWXvJhc
 QOzgnT+itwJG3pdTRJ1pgMlPVAbNnomzKvx0R33r2fhmjOHl3YttNCx2bJeX4iHCGq9p
 6d7wYwonfUj3kuSj07OfXA62S2xIAqIqUCOLhSZTI9bgvHtf6vHQC2NAdIIXdRU43Sim
 d8+AFYAWE/HKkqNCVD9EGYUKjjGp4myGYZneMSnKOxe0y1cZPqyaMvI6pf53otCPlApq
 YtadC1ceF+cQSeOsd3SNobiHSdfrwOTPxKqPV/4Y+zkWvPe91iozMvyzvfBWRtBP0SRu
 pBLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvrOAbmnePgC7aXtSlw0NUvZdeRzRbt8I5LwJSmCxBn15XjzE+LmGFRSUCdPj/foS3jdGVHS/ZD1gZgA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzU6ZLXJh5ASTPfCRsWa7FawNMvxkntZeN1GV7+QWZIBNp33m1c
 YpD826NgYo1zGB6bHsY6l0t0FgRyZQHb4bCKUrHgGhRkcXstIjs3uq+zXJN9Q/Q0ClY=
X-Gm-Gg: AY/fxX4oizOTJnkPD8DjZgqlZHawwDm+qM2cs1E3camqcWFDvRlyOrFl+M9mhVXvdxl
 7NmDugpxNHsPJbEBENPcd7nLu4GmMnfzbCuwwvmIkPZcShzEBo4FkzKJG1QY/Jv2rqg4U7u5fHT
 rlOtnmNVB08qlbbyR0sPWS8N/g/dh3Jp4O70wFoUXiLuLlfTlotbPVsgtu95mJSFG2oAB6eZP77
 +z9twwTow+5xBeX1PpP7lomElJbK3zIPXwKhh0WWPIjA6F0kPTKO5RZQTMKB19WaF/yuU4XByxl
 PUkwEyz93NpJ9O3Uw5EoEA9NhEEfJZlQb7gkWSVH+fHuljn2rjA1BFxUWqUcXqvopLVx8Msu0im
 7taY7iLnE4o2Ti4Y4C8V+dfvSQvt5k/5zZMYCoC+7lL8dnQqVTLunUhYZRokmYbiDG8zpdQLpd5
 sA8moWTDeDtmBQULiLnbLGah1Dl5nmTRaZEDAmvIHjCN02KOBC4n71293+wThmIGH5RHEl6u0eC
 EiBy/FKtcDGqRkKbOGiWwNJbcY2MYZIXmUnRORf1Vmh2WSY1JuLl+kRljUO7krD44CJUeCQ
X-Google-Smtp-Source: AGHT+IFtm/KgnS/DHXZ241C9Tii09D9IuHplpok3aN88rFmOsLWOymloQBuensoLNVO5jV8TaARwoQ==
X-Received: by 2002:a5d:4842:0:b0:432:84ee:186d with SMTP id
 ffacd0b85a97d-43284ee2de1mr31846134f8f.62.1767622109438; 
 Mon, 05 Jan 2026 06:08:29 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea1b1b1sm100250524f8f.3.2026.01.05.06.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 06:08:29 -0800 (PST)
Date: Mon, 5 Jan 2026 14:08:26 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aVvF2hivCm0vIlfE@aspen.lan>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <aVuz_hpbrk8oSCVC@aspen.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aVuz_hpbrk8oSCVC@aspen.lan>
X-Mailman-Approved-At: Wed, 07 Jan 2026 17:09:38 +0000
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
 Petr Mladek <pmladek@suse.com>, Jacky Huang <ychuang3@nuvoton.com>,
 John Ogness <john.ogness@linutronix.de>,
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
Subject: Re: [Linux-stm32] [PATCH 00/19] printk cleanup - part 3
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

On Mon, Jan 05, 2026 at 12:52:14PM +0000, Daniel Thompson wrote:
> Hi Marcos
>
> On Sat, Dec 27, 2025 at 09:16:07AM -0300, Marcos Paulo de Souza wrote:
> > The parts 1 and 2 can be found here [1] and here[2].
> >
> > The changes proposed in this part 3 are mostly to clarify the usage of
> > the interfaces for NBCON, and use the printk helpers more broadly.
> > Besides it, it also introduces a new way to register consoles
> > and drop thes the CON_ENABLED flag. It seems too much, but in reality
> > the changes are not complex, and as the title says, it's basically a
> > cleanup without changing the functional changes.
>
> I ran this patchset through the kgdb test suite and I'm afraid it is
> reporting functional changes.
>
> Specifically the earlycon support for kdb has regressed (FWIW the
> problem bisects down to the final patch in the series where CON_ENABLED
> is removed).
>
> Reproduction on x86-64 KVM outside of the test suite should be easy:
>
>     make defconfig
>     scripts/config \
>         --enable DEBUG_INFO \
> 	--enable DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
> 	--enable DEBUG_FS \
> 	--enable KALLSYMS_ALL \
> 	--enable MAGIC_SYSRQ \
> 	--enable KGDB \
> 	--enable KGDB_TESTS \
> 	--enable KGDB_KDB \
> 	--enable KDB_KEYBOARD \
> 	--enable LKDTM \
> 	--enable SECURITY_LOCKDOWN_LSM
>     make olddefconfig
>     make -j$(nproc)
>     qemu-system-x86_64 \
>         -m 1G -smp 2 -nographic \
> 	-kernel arch/x86/boot/bzImage \
> 	-append "console=ttyS0,115200 kgdboc=ttyS0 earlycon=uart8250,io,0x3f8 kgdboc_earlycon kgdbwait"

Actually I realized there was a simpler reproduction (hinted at by the
missing "printk: legacy bootconsole [uart8250] enabled" in the regressed
case). It looks like the earlycon simply doesn't work and that means the
reproduction doesn't require anything related to kgdb at all. Simply:

    make defconfig
    make -j$(nproc)
    qemu-system-x86_64 -m 1G -smp 2 -nographic -kernel arch/x86/boot/bzImage \
        -append "earlycon=uart8250,io,0x3f8"

With the part 3 patchset applied I get no output from the earlycon
(without the patch set I get the early boot messages which, as expected,
stop when tty0 comes up).


Daniel.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
