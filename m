Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABA6363025
	for <lists+linux-stm32@lfdr.de>; Sat, 17 Apr 2021 15:08:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3443BC57B78;
	Sat, 17 Apr 2021 13:08:34 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3918EC57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Apr 2021 13:08:33 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id p15so14485997iln.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Apr 2021 06:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ulpGsJT6Bh0rpZeIediYCiOUyp80TRAFcGdkV8FE+eU=;
 b=iul605DudWrQIJEbm4Ba4B7WANizA4nPg0u0UlChQIQdrnPvfgy4ojszsuj3RiY5gk
 FmnvSVbAoqD9SPHXt3ZfBkd8sHJJoBk3Di1An+J/Xf9nEBSir5Ej5mkt5XwVB/2Q+9TM
 qaS33q+vNH9YQITVH2gkRVwErtgwdzBBOmbfUBFfyz4OwNUfeiJe7HB39UstffL1aO6j
 ofvlmzh798Lf8rGAaT6I+PHaHNnqwJXyg//pZvl256Mbc8GIm+pqEDekwQRGFCJIfzMf
 R9vdq2EPgEebMGy3BkrWJni+B544XLVWEPy8QhxFK9bXvrF0is/qdpeApS5P4sR/6vCD
 mqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ulpGsJT6Bh0rpZeIediYCiOUyp80TRAFcGdkV8FE+eU=;
 b=phYB59Aj+hK1H7dtqJ9Fj5e/bRUKPNOB5xIuAx2KqDk98MQ+e95ALEhffCq6sUYiYs
 KSat8S2cuFWskajn/XNVX0/dUp4dfusoiE5CeyBP6vMJYcamNC8/C2pKGs3Z+67kKYF4
 r0nGo2OzHCieskEwM6o+r9njxH9VywVHaVmTMGfR4VGmA8OGOF9Z/lnttWTDGu5E2h4y
 sLfe4q6BvdivGLpQvht86idU7poAPY9UKCGxwaU0uUzivFu2LbVyumb/uOT/Ti+KqQ1Z
 b12qtRtuRPeeJ6ap39SCUAM2TyVLRH8QoavD+C6HtCPZlFFog3t3IynDZ3prY86qEIPI
 xtiA==
X-Gm-Message-State: AOAM533o41zhsfbRQ1k5WGcgv5bvyvnuaqwvZLe+fquY2mwt66YQRUUw
 yJFHkxA7nxqntUhUAuFQRfNPnnj1j9G9T3zXhdY=
X-Google-Smtp-Source: ABdhPJzBCzAGi+Bz9p6VrUcood7f8uNgoXYxI8+ywBoimK1v/w3NieaJuwI5HbFjkAXeOjiqYsjWZHYsDYxHcMzBI5c=
X-Received: by 2002:a05:6e02:e0a:: with SMTP id
 a10mr10537215ilk.271.1618664911976; 
 Sat, 17 Apr 2021 06:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <1618567841-18546-1-git-send-email-dillon.minfei@gmail.com>
 <YHma7H3RoLyeH650@hovoldconsulting.com>
In-Reply-To: <YHma7H3RoLyeH650@hovoldconsulting.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Sat, 17 Apr 2021 21:07:55 +0800
Message-ID: <CAL9mu0Kxny5JOGDk67ByMCVAJFOCF44rEOjbt68VxHz_2gZHrg@mail.gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Gerald Baeza <gerald.baeza@foss.st.com>, kernel test robot <lkp@intel.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux@googlegroups.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-serial@vger.kernel.org,
 kbuild-all@lists.01.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3] serial: stm32: optimize spin lock usage
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

Hi Johan,

On Fri, Apr 16, 2021 at 10:10 PM Johan Hovold <johan@kernel.org> wrote:
>
> On Fri, Apr 16, 2021 at 06:10:41PM +0800, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > This patch aims to fix two potential bug:
> > - no lock to protect uart register in this case
> >
> >   stm32_usart_threaded_interrupt()
> >      spin_lock(&port->lock);
> >      ...
> >      stm32_usart_receive_chars()
> >        uart_handle_sysrq_char();
> >        sysrq_function();
> >        printk();
> >          stm32_usart_console_write();
> >            locked = 0; //since port->sysrq is not zero,
> >                          no lock to protect forward register
> >                          access.
> >
> > - if add spin_trylock_irqsave() to protect uart register for sysrq = 1 case,
> >   that might got recursive locking under UP.
> >   So, use uart_prepare_sysrq_char(), uart_unlock_and_check_sysrq()
> >   move sysrq handler position to irq/thread_d handler, just record
> >   sysrq_ch in stm32_usart_receive_chars() by uart_prepare_sysrq_char()
> >   delay the sysrq process to next interrupt handler.
> >
> >   new flow:
> >
> >   stm32_usart_threaded_interrupt()/stm32_usart_interrupt()
> >   spin_lock_irqsave(&port->lock);
> >   ...
> >   uart_unlock_and_check_sysrq();
> >      spin_unlock_irqrestore();
> >      handle_sysrq(sysrq_ch);
> >   stm32_usart_threaded_interrupt()//stm32_usart_interrupt() return
> >
> > Cc: Johan Hovold <johan@kernel.org>
> > Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > Cc: Gerald Baeza <gerald.baeza@foss.st.com>
> > Cc: Erwan Le Ray <erwan.leray@foss.st.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> > v3: add uart_prepare_sysrq_char(), uart_unlock_and_check_sysrq() to move
> >     sysrq handler inside interrupt routinei to avoid recursive locking,
> >     according to Johan Hovold suggestion, thanks.
> >
> >  drivers/tty/serial/stm32-usart.c | 24 +++++++++++-------------
> >  1 file changed, 11 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
> > index b3675cf25a69..981f50ec784e 100644
> > --- a/drivers/tty/serial/stm32-usart.c
> > +++ b/drivers/tty/serial/stm32-usart.c
> > @@ -271,7 +271,7 @@ static void stm32_usart_receive_chars(struct uart_port *port, bool threaded)
> >                       }
> >               }
> >
> > -             if (uart_handle_sysrq_char(port, c))
> > +             if (uart_prepare_sysrq_char(port, c))
> >                       continue;
> >               uart_insert_char(port, sr, USART_SR_ORE, c, flag);
> >       }
> > @@ -457,9 +457,10 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
> >       struct uart_port *port = ptr;
> >       struct stm32_port *stm32_port = to_stm32_port(port);
> >       const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
> > +     unsigned long flags;
> >       u32 sr;
> >
> > -     spin_lock(&port->lock);
> > +     spin_lock_irqsave(&port->lock, flags);
> >
> >       sr = readl_relaxed(port->membase + ofs->isr);
> >
> > @@ -477,7 +478,7 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
> >       if ((sr & USART_SR_TXE) && !(stm32_port->tx_ch))
> >               stm32_usart_transmit_chars(port);
> >
> > -     spin_unlock(&port->lock);
> > +     uart_unlock_and_check_sysrq(port, flags);
> >
> >       if (stm32_port->rx_ch)
> >               return IRQ_WAKE_THREAD;
> > @@ -489,13 +490,14 @@ static irqreturn_t stm32_usart_threaded_interrupt(int irq, void *ptr)
> >  {
> >       struct uart_port *port = ptr;
> >       struct stm32_port *stm32_port = to_stm32_port(port);
> > +     unsigned long flags;
> >
> > -     spin_lock(&port->lock);
> > +     spin_lock_irqsave(&port->lock, flags);
>
> This essentially turns the threaded handler into a non-threaded one,
> which is a bad idea.
This change is only to adapt for uart_unlock_and_check_sysrq() need flags.
Found your patch has removed this parameter from
uart_unlock_and_check_sysrq(), so this changes should be removed.

>
> >       if (stm32_port->rx_ch)
> >               stm32_usart_receive_chars(port, true);
> >
> > -     spin_unlock(&port->lock);
> > +     uart_unlock_and_check_sysrq(port, flags);
> >
> >       return IRQ_HANDLED;
> >  }
>
> You also didn't base this patch on tty-next, which has a number of
> updates to this driver. Before noting that myself, I had fixed a couple
> of deadlocks in this driver which turned out to have been incidentally
> fixed by an unrelated path in -next.
Yes, my submission is based on linux-5.12. based on the component's
next branch is a good idea , to avoid conflict. thanks.
>
> I'll be posting a series that should fix up all of this.
Thanks
>
> Johan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
