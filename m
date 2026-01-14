Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B32D1D11C
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 09:20:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16517C8F26F;
	Wed, 14 Jan 2026 08:20:26 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDF27C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 08:20:24 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-42fbbc3df8fso4537808f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 00:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768378824; x=1768983624;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kOjWICKElajAktcnLTxDO0a0hjOrXuTPJG+TIiIDMlE=;
 b=c7hugjkT7Odo0u1zFue/23DuEhLxB7jfH+oQIbtVn433m6ZQoYOKQsu1oXvU/CEfZP
 JACAOLWIIqZwP/CC1ul+p/0Wvc5WYhrEFZ++4jzLKkok9+aEsn9Q7HprGmZAgs9Ob8WJ
 j4q9HdReUjR/pMbJ6ZvDsfv372Dc+4ijFs3nu8cVNkxdsJnP9/5dfyQ3t8oYise2Yq/P
 eG0aNWjf3sihfoX97O4llS5V9FR2g9SDuamVPJQTdLl/LOOgmxXAX3CYvzjqrlfbCXUH
 TZri/3dIlckM6+nbZv/YzS6pRbaRz7zqZlsxAij8hBNFkjvHbnbLfgJnYg6tVZLAeTra
 6+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768378824; x=1768983624;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kOjWICKElajAktcnLTxDO0a0hjOrXuTPJG+TIiIDMlE=;
 b=pVhfzNZJ/ApqCdQx9K1QkW/N3Mr1CKrIaMONVC4ELMf8suP3BldRru0vp7+FfjutCv
 be/qr+SkkuJXHRdxywyTdtlGDV55u/+DuPwHwAaTnl4G09wySBzRDxGCY9H3mndPpE9r
 ZymPpmnuAQBkP7AtFOGpsp9Bpn1O59rMj35EgQ7kWljnbZIJDNrw5IsMmgnivofbZIkb
 5mflrPwR1/MCFbws+00LJ352eVBLKaCBKpf5pESd/dikJgV1vxC2v+rS/pbPrRdQj1dF
 0mt+IBMJJV/rH9Y027tArh9fp5TTprOskVdtMUTilOOt7uBQ723eBetUwLUoIxI6y7jX
 6I2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU23DpLBhgv4EnGHBz71MtebKOJJEtHg4626FCmeNLIndCD2Ujx37qvZYMeGQxRNEsCH1VWWGAsafFUWw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxjFTBN27QcZ8Jpvs112Azy9OwjinXUq2sqDpTSrX0uCEfYvgYw
 F46MNIBzldOHalaHAq89IcZJtgsy46Unjlm+NaVA4ZWF9LcPnB4/dPkCJYsQ/LUYKcA=
X-Gm-Gg: AY/fxX6ZWLRl+QM1HxrIWPnynq9cwcX6gvO9wlUcM+Tvrl2osZ1i/ypJ2noAcJgiR1S
 M+zf2iVJ6wMQPKSaxusuRSH+/OEH20QKbRZyXbPDhXG1opy7BrmqnH9OECyPWw5ZUIqNWkcGJRE
 lvZGkSo9ULqaL5FOOk0LlmeO78J5A+LTbpYu+OjUup1KNgcvMY5+3Z5wL/PhPehATrw/aVTyzdd
 ceBJRX+bi8MEAWyv7MMca0FQfVOk/agKb1JTYgOxRSKTT0LUmKnSCe7gLZPwODTBks1Pvtvru5S
 AeviAYSy6MZnY4HKc0VvwFk0NrUm4br3gNEcyFDgnVSbjRJuS577JVh+5Yj6Ja1fIJ2bex9kmsD
 xJPFQS8n8ZGIKqJZRoZ/+Ve0xTudvXRnjZq/+pYtbCaer43ghBszfItQS5cRncL446+2ONV12Wy
 AZIM8BJcRafFg66Q==
X-Received: by 2002:a05:6000:40e1:b0:432:5b81:498 with SMTP id
 ffacd0b85a97d-4342c4f4a32mr1782744f8f.23.1768378823922; 
 Wed, 14 Jan 2026 00:20:23 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dad8bsm49346913f8f.8.2026.01.14.00.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 00:20:23 -0800 (PST)
Date: Wed, 14 Jan 2026 09:20:20 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWdRxBbJOEIZ-KjE@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <aVuz_hpbrk8oSCVC@aspen.lan> <aVvF2hivCm0vIlfE@aspen.lan>
 <a5d83903fe2d2c2eb21de1527007913ff00847c5.camel@suse.com>
 <89409a0f48e6998ff6dd2245691b9954f0e1e435.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <89409a0f48e6998ff6dd2245691b9954f0e1e435.camel@suse.com>
Cc: Andreas Larsson <andreas@gaisler.com>, Kees Cook <kees@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Breno Leitao <leitao@debian.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue 2026-01-13 21:32:33, Marcos Paulo de Souza wrote:
> On Tue, 2026-01-13 at 09:41 -0300, Marcos Paulo de Souza wrote:
> > On Mon, 2026-01-05 at 14:08 +0000, Daniel Thompson wrote:
> > > On Mon, Jan 05, 2026 at 12:52:14PM +0000, Daniel Thompson wrote:
> > > > Hi Marcos
> > > > =

> > > > On Sat, Dec 27, 2025 at 09:16:07AM -0300, Marcos Paulo de Souza
> > > > wrote:
> > > > > The parts 1 and 2 can be found here [1] and here[2].
> > > > > =

> > > > > The changes proposed in this part 3 are mostly to clarify the
> > > > > usage of
> > > > > the interfaces for NBCON, and use the printk helpers more
> > > > > broadly.
> > > > > Besides it, it also introduces a new way to register consoles
> > > > > and drop thes the CON_ENABLED flag. It seems too much, but in
> > > > > reality
> > > > > the changes are not complex, and as the title says, it's
> > > > > basically a
> > > > > cleanup without changing the functional changes.
> > > > =

> > > > I ran this patchset through the kgdb test suite and I'm afraid it
> > > > is
> > > > reporting functional changes.
> > > > =

> > > > Specifically the earlycon support for kdb has regressed (FWIW the
> > > > problem bisects down to the final patch in the series where
> > > > CON_ENABLED
> > > > is removed).
> > > > =

> > > > Reproduction on x86-64 KVM outside of the test suite should be
> > > > easy:
> > > > =

> > > > =A0=A0=A0 make defconfig
> > > > =A0=A0=A0 scripts/config \
> > > > =A0=A0=A0=A0=A0=A0=A0 --enable DEBUG_INFO \
> > > > 	--enable DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
> > > > 	--enable DEBUG_FS \
> > > > 	--enable KALLSYMS_ALL \
> > > > 	--enable MAGIC_SYSRQ \
> > > > 	--enable KGDB \
> > > > 	--enable KGDB_TESTS \
> > > > 	--enable KGDB_KDB \
> > > > 	--enable KDB_KEYBOARD \
> > > > 	--enable LKDTM \
> > > > 	--enable SECURITY_LOCKDOWN_LSM
> > > > =A0=A0=A0 make olddefconfig
> > > > =A0=A0=A0 make -j$(nproc)
> > > > =A0=A0=A0 qemu-system-x86_64 \
> > > > =A0=A0=A0=A0=A0=A0=A0 -m 1G -smp 2 -nographic \
> > > > 	-kernel arch/x86/boot/bzImage \
> > > > 	-append "console=3DttyS0,115200 kgdboc=3DttyS0
> > > > earlycon=3Duart8250,io,0x3f8 kgdboc_earlycon kgdbwait"
> > > =

> > > Actually I realized there was a simpler reproduction (hinted at by
> > > the
> > > missing "printk: legacy bootconsole [uart8250] enabled" in the
> > > regressed
> > > case). It looks like the earlycon simply doesn't work and that
> > > means
> > > the
> > > reproduction doesn't require anything related to kgdb at all.
> > > Simply:
> > > =

> > > =A0=A0=A0 make defconfig
> > > =A0=A0=A0 make -j$(nproc)
> > > =A0=A0=A0 qemu-system-x86_64 -m 1G -smp 2 -nographic -kernel
> > > arch/x86/boot/bzImage \
> > > =A0=A0=A0=A0=A0=A0=A0 -append "earlycon=3Duart8250,io,0x3f8"
> > > =

> > > With the part 3 patchset applied I get no output from the earlycon
> > > (without the patch set I get the early boot messages which, as
> > > expected,
> > > stop when tty0 comes up).
> > =

> > Hi Daniel, sorry for the late reply! Lots of things to check lately
> > :)
> > =

> > Ok, I reproduced here, thanks a lot for testing kgdboc, it's a quick
> > way to check that the new register_console_force is not working. Let
> > me
> > take a look to find what's wrong. Thanks a lot for finding this
> > issue!
> =

> Ok, I did a bisect and found out that the issue lies in the last
> commit, where CON_ENABLED was removed. After it, I then checked what
> was wrong, since everything was being plumbed correctly (tm), and then
> I found that it was not:
> =

> On _register_console, the function try_enable_default_console is called
> when there are not registered consoles, and then it sets CON_ENABLED
> for the console. Later on, try_enable_preferred_console it checks if
> the console was specified by the user, and at the same time it had
> CON_ENABLED set.
> =

> It worked by chance, but now, we don't have this flag anymore, and then
> we are not _marking_ the console on try_enable_default_console so
> try_enable_preferred_console returns ENOENT.

Great catch! Yeah, it worked just by chance.

> So, without any console kgdb is activated much later in the boot
> process, as you found it.
> =

> I talked with Petr Mladek and it would need to rework the way that we
> register a console, and he's already working on it.

Yes, I have some patches in early stages of developnent of another
feature which would help here.

> For now I believe
> that we could take a look in all the patches besides the last one that
> currently breaks the earlycon with kgdb and maybe other usecases.

I agree. I am going to review this patchset first. Then I'll try to
clean up the patches which remove the ugly side effect from
try_enable_preferred_console(). Then we could discuss how
to move forward. It might make sense to push this patchset
first without the last patch...

> Sorry for not catching this issue before. I'll use kgdb next time to
> make sure that it keeps working :)

Do not worry at all. It was a well hidden catch. It is great that
Daniel found the regression in time...

Best Regards,
Petr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
