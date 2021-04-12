Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B67035C82A
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Apr 2021 16:04:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08139C57B79;
	Mon, 12 Apr 2021 14:04:46 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B842DC57B76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 14:04:43 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id x16so13577501iob.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 07:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ZmPHR9GUafARGNI7sj7W1J+ANavVOrnfghsbNP17iA=;
 b=Nzm5jd0z+ScBOsDtaS1gPR5gW8RY669tautb/riCPzi6VH4NJa8tWcRNm7Mp9hmzaj
 P0vu1MfkC2trCzisIMXblpD34gl+kFDABuSf7ojWpSJvGfGmdoCTyxQZoRiWSYIm0P2O
 FxBxFDEzRPVUBSlJH65MN72t/vt6/tXcS7VuCZtIof05kCUoF896xDPjwkPeSEobPIyX
 XLtf2HRyHV7JoQ+cFZISWEfzSa7i6+Aopw+eQNV2ySjcEtIwLHdX2S2fDf9FegbBmUfl
 vQ+dU+IMcTmdIZsF5m0iu6K/7BQtV3iLIAKuuszOSq3COyezEIOztNQyfU7vSdhk+iWt
 7v2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ZmPHR9GUafARGNI7sj7W1J+ANavVOrnfghsbNP17iA=;
 b=VbbjpO4L9hWx3UIqCrrkmL7MLY85K+ZT3roVcJ5JO5CL3EVUZHYWAV7S9Y4hsl12Ev
 j8I6a5O1suQQCW5V+CIEreI+y1Wc7pWeRTvuG+kn+0ruqjLJ7/47zdsqBKTT1pA0lcYo
 k2D6+qmkNwYdcoevSMoNDsCtpzsxuogCKsUzShRVYr0pgw97fXb7gaYXxEE20X5U7hwe
 HOshqDCmwxgwMP6NcG8e+Bc6UQ+6j2DMHUQAcHHlAmne7U9TBIcGJR73Tp5UPu5SQ/rA
 aKYI+KOvbJz/zhTvOzxz4Kb+LvAtT24N7d/PMaBE7APV3en2m6dq0+z+6zo/nufP7lFY
 uT3g==
X-Gm-Message-State: AOAM532m95i8uKaPCnOQpAuvSaRQIlapwake/Zd9qgODIP9tSLOgS48D
 9mzBPATot3lOF5xLjHHRMny3N5hgFxGVwzra4m4=
X-Google-Smtp-Source: ABdhPJwLkUno1GOuKAFL2x5ktrw1BS4bEuoKWA8A1X/t1s5rPTHHM4olT0s016lO8j69XLXgjMXLOVPDBF3rwWcU1Ro=
X-Received: by 2002:a5d:9d13:: with SMTP id j19mr23217873ioj.110.1618236282497; 
 Mon, 12 Apr 2021 07:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <1618219898-4600-1-git-send-email-dillon.minfei@gmail.com>
 <YHRGPpQ03XgBMkiy@hovoldconsulting.com>
In-Reply-To: <YHRGPpQ03XgBMkiy@hovoldconsulting.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Mon, 12 Apr 2021 22:04:06 +0800
Message-ID: <CAL9mu0JF-9hy3Z_ytpEO+hzKh0D+f-0gYaUBEA0v28EOHpC80w@mail.gmail.com>
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

Hi Johan,

Yes, there is no deadlock. my fault.
I forget the local_irq_save() plus spin_lock() is spin_lock_irqsave().

Thanks for your review. please ignore this patch.

Best regards

Dillon

On Mon, Apr 12, 2021 at 9:08 PM Johan Hovold <johan@kernel.org> wrote:
>
> On Mon, Apr 12, 2021 at 05:31:38PM +0800, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > To avoid potential deadlock in spin_lock usage, use spin_lock_irqsave,
> > spin_trylock_irqsave(), spin_unlock_irqrestore() in process context.
>
> This doesn't make much sense as console_write can be called in any
> context. And where's the deadlock you claim to be fixing here?
>
> > remove unused local_irq_save/restore call.
> >
> > Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > Cc: Gerald Baeza <gerald.baeza@foss.st.com>
> > Cc: Erwan Le Ray <erwan.leray@foss.st.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> > v2: remove unused code from stm32_usart_threaded_interrupt() according from
> >     Greg's review.
> >
> >  drivers/tty/serial/stm32-usart.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
> > index b3675cf25a69..b1ba5e36e36e 100644
> > --- a/drivers/tty/serial/stm32-usart.c
> > +++ b/drivers/tty/serial/stm32-usart.c
> > @@ -1354,13 +1354,12 @@ static void stm32_usart_console_write(struct console *co, const char *s,
> >       u32 old_cr1, new_cr1;
> >       int locked = 1;
> >
> > -     local_irq_save(flags);
> >       if (port->sysrq)
> >               locked = 0;
> >       else if (oops_in_progress)
> > -             locked = spin_trylock(&port->lock);
> > +             locked = spin_trylock_irqsave(&port->lock, flags);
> >       else
> > -             spin_lock(&port->lock);
> > +             spin_lock_irqsave(&port->lock, flags);
> >
> >       /* Save and disable interrupts, enable the transmitter */
> >       old_cr1 = readl_relaxed(port->membase + ofs->cr1);
> > @@ -1374,8 +1373,7 @@ static void stm32_usart_console_write(struct console *co, const char *s,
> >       writel_relaxed(old_cr1, port->membase + ofs->cr1);
> >
> >       if (locked)
> > -             spin_unlock(&port->lock);
> > -     local_irq_restore(flags);
> > +             spin_unlock_irqrestore(&port->lock, flags);
> >  }
> >
> >  static int stm32_usart_console_setup(struct console *co, char *options)
>
> Johan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
