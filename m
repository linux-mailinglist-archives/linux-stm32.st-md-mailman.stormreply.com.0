Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC0935D418
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Apr 2021 01:45:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25D26C57B79;
	Mon, 12 Apr 2021 23:45:19 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09413C57B76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 23:45:16 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id c18so12561042iln.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 16:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C9NHfRlVevF4M8K/rHQEyVi0J60392z2vn7IG56hY1E=;
 b=HR2eqOSk+FnonmNwmQAIfbMDUnYeOBV3DWZdEKQZu/yWDhDOV4buDmV+PGPI9J1iJU
 Ls5quVrlRHuwlGZxfubXLN1MvZ1P9NTnNdZIPSI5Q1+jrcTNpvxPT0QV2FKuWZBvhmVK
 jA7//CSgMPE2dPpn+aY7EpIHHvUAXr1Z1SUWtzizy9KtD4qxQWePwaBC7wzhlIHAv69t
 jT3n6MwDEjIykpSGG6HQWg3rDPj8bcfGOGMveb/L0/tVWTTwG055rpcCEhRcKIFayf0J
 bZQjRV8iZiWKTdVpHnYzImsZwJT2SA5SRXbjyRt0R835c8x5XHS/NYxeODv4lg7LWINM
 9tLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C9NHfRlVevF4M8K/rHQEyVi0J60392z2vn7IG56hY1E=;
 b=Qmt9ZH4rOq164vGI/cc32bufNO1mQ8B9YM2hL6q0UiA1uffWX48XpXuuAaH4YO8Ewn
 3j2IqCAwkYA8HTomSs91MOcx6sKe1HSE/HhxbGFe4xxBSYFTJ2XULA3cKo/TUFszywoE
 sJoBLAEN8s2gAT9RBfK7kp221P9DD2SQL7aTU5YBnWI8VqOE18NJwCUBd/vTjRto00TE
 XoJLgJzWY+LaU7lXt7dMd8gKSR9ruYKSdx/pTnGMXvw1Txt7ks+h6fzxrvDg7RG8CH1t
 s17a2KaFgCuualt3pOB8NCVTSoKmaJEYG2pp5+UyMj39bDDN7zsQgyXH6CBS3IkAPLUz
 xhQQ==
X-Gm-Message-State: AOAM531/w443/W3aZZz3CdXwIc5qfg9a0355aH2IYrSPKIJ28obgIUIt
 c3o0lkXYavwsWfiogpEfxh/sNQTpKmfNyCZTGxE=
X-Google-Smtp-Source: ABdhPJyeXPv5Sc4pLxLbt5dGfKVFKaeHr4aAjckko4WJVdRwhKS5xkaBI42lJ+w6qZ7qevywnVtfKDAGtJ6tdf4fNAE=
X-Received: by 2002:a05:6e02:672:: with SMTP id
 l18mr24345668ilt.271.1618271115374; 
 Mon, 12 Apr 2021 16:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <1618219898-4600-1-git-send-email-dillon.minfei@gmail.com>
 <YHRGPpQ03XgBMkiy@hovoldconsulting.com>
 <CAL9mu0JF-9hy3Z_ytpEO+hzKh0D+f-0gYaUBEA0v28EOHpC80w@mail.gmail.com>
In-Reply-To: <CAL9mu0JF-9hy3Z_ytpEO+hzKh0D+f-0gYaUBEA0v28EOHpC80w@mail.gmail.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Tue, 13 Apr 2021 07:44:39 +0800
Message-ID: <CAL9mu0Ke97FUZ03jvdH8Lz2qRnVY82B7tAEtjbhW97sPOVkAxQ@mail.gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Gerald Baeza <gerald.baeza@foss.st.com>, kbuild-all@lists.01.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux@googlegroups.com, linux-serial@vger.kernel.org,
 jirislaby@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 kernel test robot <lkp@intel.com>
Subject: Re: [Linux-stm32] [PATCH v2] serial: stm32: optimize spin lock usage
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

Hi Johan, Erwan

It seems still a bit of a problem in the current version, not deadlock
but access register at the same time.

For driver , we should consider it running under smp, let's think
about it for this case:

static void stm32_usart_console_write(struct console *co, const char *s,
                                      unsigned int cnt)
{
         .....
         local_irq_save(flags);
         if (port->sysrq)
                    locked = 0;
         .....
         access register cr1, tdr, isr
         .....

         local_irq_restore(flags);
}

if port->sysrq is 1, stm32_usart_console_write() just disable local
irq response by local_irq_save(), at the time of access register cr1,
tdr, isr. an TXE interrupt raised, for other cores(I know stm32
mpu/mcu do not have multi cores, just assume it has), it still has a
chance to handle interrupt.  Then there is no lock to protect the uart
register.

changes to below, should be more safe:

.....
if (port->sysrq || oops_in_progress)
      locked = spin_trylock_irqsave(&port->lock, flags);
else
      spin_lock_irqsave(&port->lock, flags);

....

if (locked)
     spin_unlock_irqrestore(&port->lock, flags);

For current stm32 soc, it shouldn't happen. just a reminder for future.

Thanks.

Dillon

On Mon, Apr 12, 2021 at 10:04 PM dillon min <dillon.minfei@gmail.com> wrote:
>
> Hi Johan,
>
> Yes, there is no deadlock. my fault.
> I forget the local_irq_save() plus spin_lock() is spin_lock_irqsave().
>
> Thanks for your review. please ignore this patch.
>
> Best regards
>
> Dillon
>
> On Mon, Apr 12, 2021 at 9:08 PM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Mon, Apr 12, 2021 at 05:31:38PM +0800, dillon.minfei@gmail.com wrote:
> > > From: dillon min <dillon.minfei@gmail.com>
> > >
> > > To avoid potential deadlock in spin_lock usage, use spin_lock_irqsave,
> > > spin_trylock_irqsave(), spin_unlock_irqrestore() in process context.
> >
> > This doesn't make much sense as console_write can be called in any
> > context. And where's the deadlock you claim to be fixing here?
> >
> > > remove unused local_irq_save/restore call.
> > >
> > > Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > > Cc: Gerald Baeza <gerald.baeza@foss.st.com>
> > > Cc: Erwan Le Ray <erwan.leray@foss.st.com>
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > > ---
> > > v2: remove unused code from stm32_usart_threaded_interrupt() according from
> > >     Greg's review.
> > >
> > >  drivers/tty/serial/stm32-usart.c | 8 +++-----
> > >  1 file changed, 3 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
> > > index b3675cf25a69..b1ba5e36e36e 100644
> > > --- a/drivers/tty/serial/stm32-usart.c
> > > +++ b/drivers/tty/serial/stm32-usart.c
> > > @@ -1354,13 +1354,12 @@ static void stm32_usart_console_write(struct console *co, const char *s,
> > >       u32 old_cr1, new_cr1;
> > >       int locked = 1;
> > >
> > > -     local_irq_save(flags);
> > >       if (port->sysrq)
> > >               locked = 0;
> > >       else if (oops_in_progress)
> > > -             locked = spin_trylock(&port->lock);
> > > +             locked = spin_trylock_irqsave(&port->lock, flags);
> > >       else
> > > -             spin_lock(&port->lock);
> > > +             spin_lock_irqsave(&port->lock, flags);
> > >
> > >       /* Save and disable interrupts, enable the transmitter */
> > >       old_cr1 = readl_relaxed(port->membase + ofs->cr1);
> > > @@ -1374,8 +1373,7 @@ static void stm32_usart_console_write(struct console *co, const char *s,
> > >       writel_relaxed(old_cr1, port->membase + ofs->cr1);
> > >
> > >       if (locked)
> > > -             spin_unlock(&port->lock);
> > > -     local_irq_restore(flags);
> > > +             spin_unlock_irqrestore(&port->lock, flags);
> > >  }
> > >
> > >  static int stm32_usart_console_setup(struct console *co, char *options)
> >
> > Johan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
