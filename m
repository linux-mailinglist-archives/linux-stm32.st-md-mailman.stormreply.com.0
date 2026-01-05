Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 354CACFF046
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 18:09:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D20C9C8F282;
	Wed,  7 Jan 2026 17:09:39 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECAD3C055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jan 2026 12:52:18 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-42fb5810d39so9321380f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Jan 2026 04:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767617538; x=1768222338;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DIfhp3vJVBySXs5/naEXyaaROJC4kEOY5dOC0TJhcN0=;
 b=cWE3EFYB1k6+nybFwa1Uhq92XJn3UQByiv602/JnqGT9MNLrZ5XplWcMdy30inESTS
 oTOfwtFiDbeNObMUQ67RGh4SLCTyZHG1M6WwkYOc0YNuHPemPFnmUzycBWnj0XyXDajD
 KE5NaTz+uRz5kJbwZEm04AAlIcDsoUS7AkdS3DGQ6h7YehFKYa/kdSDGKoR2NgKpDLtl
 rN8BQBLrLM6TBV6rUv8TPprwaSeV4XkN1It3c279hjnWpxeVimvrr5U5hrRgLckaFO6J
 8c+0+N3/33J4MBQbaIpWLW+eijsHSIhYZ1aqmnB9MAUsi0KgQ86aIZMX2hCodqKnAzl4
 7GEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767617538; x=1768222338;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DIfhp3vJVBySXs5/naEXyaaROJC4kEOY5dOC0TJhcN0=;
 b=mmDk6QzjNedw3QeHKgMA9MMuFdslryiPIItJURzs4xKOEnMyFon1EtSlc73QSdp5B+
 YLQ8O6EAvciw0fZ/WI9pu3UGDmMlFdldypAfdXzMffC1cIl7/UaMkrsglUDPMvWtarRz
 uW/+yAbSxrh91HIlcNs/KgmHQrsQqdlQGpBuIYzIU+SyMBVOSyGCKA/48lQOapComai+
 F57c/l62I0FI4LsGE22TPZB+d1SOx4trOXkrXCziTZmyjuZ06HUeTeZyTAQql1uqGJlm
 mNamGTYZS/2pcwnVerifYZ1joisWK5TiQfRdF3WlUqiAtzUGaYzypJFTd7oWACcBE9/D
 BN5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfMwL7glAahWlSky7uq3mWdFlSl0AfYVFt43aBxHTcK7eZD7jLa093IdNyizdlTeZzK/gm63CmvFSoFA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyroTKgvSllR4qwOVP82bak2xSYimiiIdITjxoYBLaIiIyBzWzM
 rvZiyK2O9Rp6p0qCuEdffkeAm1RQxm5UFdE7dJnxGjW4Eb3cF1J/A0zeeH+XuyRUoMs=
X-Gm-Gg: AY/fxX4B5kVCfVXfepNGFPMf0RI22lR6jXkVWSkJqr3tTY+mkGbFKZPfbMK3CQSdf8q
 Kx6a9OrgyFfTiKYxKuvvi0vwf/yiKOc63weeQG74uSOPYq+nOMyI8eqCwq4lPtXwM7vtSL31J9x
 1yGVPan0RpwlANIlJsMZvWRIGY8d1yQlPgcOOVuNp9ehTpWJ3FsnA8TwT29VS3ObGf4I+9U5+SV
 7nB475uxtfR2yZZJ+4eA5mAsPlHYiW5nym+QO7Zilf6TJvcFXBOaqfRKn/Foc5wc0n65AY9+S75
 q5CCWY3IAjIrhRS0pcd5cQA8c1K1hrMEXbEN+EFzPY9HYCoe1tr8pxiUYZ26JXERzdAI9tH0dNd
 bq01MOWylmrACDFEx/G7z03b2pJjpsbN8OOTpG/pDfZL7HS5Hw2VYDgwWUlh6uYeNDiW7VX0F9U
 6tpUsni75zLLhK3ZypIeJyOQNllqA97UrUNW2FtvaoDaS3zTtBqeK3uMqysfktvwndciNhXx5Pz
 Muw1axDlv22HeZONUBELbtZ7LE8ulGyGIjbS3kg3kPL1s+B0mUC9sK0bOLzPt2O3+hb4DJ9CeV/
 FWERNMM=
X-Google-Smtp-Source: AGHT+IE4Mz004OZ0As7rWOFq5sPjHYJ4N8Pzam8+bOUXJdXGQOskOlJaecSDta7VRdPfx5XGGjwohQ==
X-Received: by 2002:a05:6000:1844:b0:432:8504:b8a9 with SMTP id
 ffacd0b85a97d-4328504b8e1mr37753933f8f.62.1767617537725; 
 Mon, 05 Jan 2026 04:52:17 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea1b36fsm100029761f8f.5.2026.01.05.04.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 04:52:17 -0800 (PST)
Date: Mon, 5 Jan 2026 12:52:14 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aVuz_hpbrk8oSCVC@aspen.lan>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
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

Hi Marcos

On Sat, Dec 27, 2025 at 09:16:07AM -0300, Marcos Paulo de Souza wrote:
> The parts 1 and 2 can be found here [1] and here[2].
>
> The changes proposed in this part 3 are mostly to clarify the usage of
> the interfaces for NBCON, and use the printk helpers more broadly.
> Besides it, it also introduces a new way to register consoles
> and drop thes the CON_ENABLED flag. It seems too much, but in reality
> the changes are not complex, and as the title says, it's basically a
> cleanup without changing the functional changes.

I ran this patchset through the kgdb test suite and I'm afraid it is
reporting functional changes.

Specifically the earlycon support for kdb has regressed (FWIW the
problem bisects down to the final patch in the series where CON_ENABLED
is removed).

Reproduction on x86-64 KVM outside of the test suite should be easy:

    make defconfig
    scripts/config \
        --enable DEBUG_INFO \
	--enable DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
	--enable DEBUG_FS \
	--enable KALLSYMS_ALL \
	--enable MAGIC_SYSRQ \
	--enable KGDB \
	--enable KGDB_TESTS \
	--enable KGDB_KDB \
	--enable KDB_KEYBOARD \
	--enable LKDTM \
	--enable SECURITY_LOCKDOWN_LSM
    make olddefconfig
    make -j$(nproc)
    qemu-system-x86_64 \
        -m 1G -smp 2 -nographic \
	-kernel arch/x86/boot/bzImage \
	-append "console=ttyS0,115200 kgdboc=ttyS0 earlycon=uart8250,io,0x3f8 kgdboc_earlycon kgdbwait"

In a successful test the kdb prompt will appear after only a few lines
of output:
~~~
[    0.000000] Linux version 6.19.0-rc4-00020-g4b7f3b144021 (drt@wychelm) (gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44) #2 SMP PREEMPT_DYNAMIC Mon Jan 6
[    0.000000] Command line: console=ttyS0,115200 kgdboc=ttyS0 earlycon=uart8250,io,0x3f8 kgdboc_earlycon kgdbwait
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000003ffdffff] usable
[    0.000000] BIOS-e820: [mem 0x000000003ffe0000-0x000000003fffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
[    0.000000] earlycon: uart8250 at I/O port 0x3f8 (options '')
[    0.000000] printk: legacy bootconsole [uart8250] enabled
[    0.000000] kgdboc: Going to register kgdb with earlycon 'uart'
[    0.000000] KGDB: Registered I/O driver kgdboc_earlycon
[    0.000000] KGDB: Waiting for connection from remote gdb...

Entering kdb (current=0x0000000000000000, pid 0) on processor 0 due to NonMaskable Interrupt @ 0xffffffff9101491f
[0]kdb>
~~~

After this patchset is applied the earlycon triggers do not work
correctly and we get:
~~~
[    0.000000] Linux version 6.19.0-rc4-00019-g882df99205ba (drt@wychelm) (gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44) #3 SMP PREEMPT_DYNAMIC Mon Jan 6
[    0.000000] Command line: console=ttyS0,115200 kgdboc=ttyS0 earlycon=uart8250,io,0x3f8 kgdboc_earlycon kgdbwait
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000003ffdffff] usable
[    0.000000] BIOS-e820: [mem 0x000000003ffe0000-0x000000003fffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
[    0.000000] earlycon: uart8250 at I/O port 0x3f8 (options '')
[    0.000000] kgdboc: No suitable earlycon yet, will try later
...
~~~


Daniel.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
