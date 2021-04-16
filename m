Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FEE361BC1
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Apr 2021 10:57:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2650C57B78;
	Fri, 16 Apr 2021 08:57:35 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09F7FC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Apr 2021 08:57:35 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id d2so22483559ilm.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Apr 2021 01:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M41GXL+PjIBxhmb0o54t+3XJBKJFPW9+U1USw54R9hY=;
 b=fhGyue5C+F26oxcl+7iNvwj2auKwyobI/O6r5AZdpToMxHOPtb8ytmeJwDnpskPK7u
 Tjv4krNvFKdcPLqRB4jut/B2+MggQMfI/d3hDhU7t7Vf439lnzP/HS6RWzUChteD6X/H
 c9cDyG5fYDjKECOoXcrlVdZ27qfOMI2mhIggLxn9NuzzZUPaharXbCd9Mh0Vd7uaZR4C
 NSI0qnpagovoeEjNSGzZ2OL0gEwqEmNgLBuDGeRV6g9p1w+LLp4jZRSVrMckdUeEtcNh
 3Llc5xLE/q/5FvR3mZtbEaW5Ni/Aernc5nogsYvkKUg24KuzFaNQOVwJsD0i5QQrN2aF
 E5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M41GXL+PjIBxhmb0o54t+3XJBKJFPW9+U1USw54R9hY=;
 b=agO+IgnH0CBY6S5YhqSUF2p1eEsvQ6c4g0EPH6wMNire12Upy2031sNPkfGSW4B+n9
 3yF9rDw51CsKNHiZF6xW/pTG/+w9Uow1vtWUDx8nrg86+8VIi/99GeCGiqM9CTaBcTSS
 +s7AaM5lKDbtIr/DvhtOova+PPkI/VozRP2d6v510p+Tx8TIIaffqY5LjI8u9Iv5u4S5
 n+TvJXWSKPSz8RtervSKcZ5SzJqzVCP/JxYeJoL4JY7gfi0VZDVnGSbbYQYcQTiCYH+w
 R4LhKytFfG6LSwUVoRD6FkLtkLqS6sGwZlX1/JQhdyzY4zeg9G4fEnNbsBsH95lAlnHy
 XaLA==
X-Gm-Message-State: AOAM530VWKyIaNHSG+H04DxnSqlkQFgGtpXbWiyLj8cFqKQjSMoxWiiw
 vQJrca2pr6ETXUOru1JNn0mYBio1H/XeM5uPKBg=
X-Google-Smtp-Source: ABdhPJwMMdZeIC/59rPjHi9k0xK3kulpo9R2Ei3Ee4tP58bhwp/eQ1V/Y3zd+9pcWUL43L/jea9JZDo70ghxCbCY9fA=
X-Received: by 2002:a05:6e02:684:: with SMTP id
 o4mr6180647ils.218.1618563453889; 
 Fri, 16 Apr 2021 01:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <1618219898-4600-1-git-send-email-dillon.minfei@gmail.com>
 <YHRGPpQ03XgBMkiy@hovoldconsulting.com>
 <CAL9mu0JF-9hy3Z_ytpEO+hzKh0D+f-0gYaUBEA0v28EOHpC80w@mail.gmail.com>
 <CAL9mu0Ke97FUZ03jvdH8Lz2qRnVY82B7tAEtjbhW97sPOVkAxQ@mail.gmail.com>
 <YHlMYZCCxL+SS9ye@hovoldconsulting.com>
In-Reply-To: <YHlMYZCCxL+SS9ye@hovoldconsulting.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Fri, 16 Apr 2021 16:56:57 +0800
Message-ID: <CAL9mu0K4L-vGL1EyYc+p0q7tadQ39-VHcp1nd4gZs_HGKSmP2w@mail.gmail.com>
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

On Fri, Apr 16, 2021 at 4:35 PM Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, Apr 13, 2021 at 07:44:39AM +0800, dillon min wrote:
> > Hi Johan, Erwan
> >
> > It seems still a bit of a problem in the current version, not deadlock
> > but access register at the same time.
> >
> > For driver , we should consider it running under smp, let's think
> > about it for this case:
> >
> > static void stm32_usart_console_write(struct console *co, const char *s,
> >                                       unsigned int cnt)
> > {
> >          .....
> >          local_irq_save(flags);
> >          if (port->sysrq)
> >                     locked = 0;
> >          .....
> >          access register cr1, tdr, isr
> >          .....
> >
> >          local_irq_restore(flags);
> > }
> >
> > if port->sysrq is 1, stm32_usart_console_write() just disable local
> > irq response by local_irq_save(), at the time of access register cr1,
> > tdr, isr. an TXE interrupt raised, for other cores(I know stm32
> > mpu/mcu do not have multi cores, just assume it has), it still has a
> > chance to handle interrupt.  Then there is no lock to protect the uart
> > register.
>
> Right, the sysrq handling is a bit of a hack.
>
> > changes to below, should be more safe:
> >
> > .....
> > if (port->sysrq || oops_in_progress)
> >       locked = spin_trylock_irqsave(&port->lock, flags);
>
> Except that the lock debugging code would detect the attempt at
> recursive locking here and complain loudly on UP.
>
> If you really want to fix this, we have uart_unlock_and_check_sysrq()
> which can be used to defer sysrq processing until the interrupt handler
> has released the lock.

Great, uart_unlock_and_check_sysrq() is fit to fix this. you mean make
the flow like below:

    stm32_usart_threaded_interrupt()
      spin_lock(&port->lock);
      uart_unlock_and_check_sysrq(port, flags);
      ...
      uart_prepare_sysrq_char();
          printk();
            stm32_usart_console_write();
              locked = spin_trylock_irqsave(&port->lock); //only
handle oops, normal case

If so, I will submit v3 as you suggested. thanks.

Best regards.
Dillon,
>
> > else
> >       spin_lock_irqsave(&port->lock, flags);
> >
> > ....
> >
> > if (locked)
> >      spin_unlock_irqrestore(&port->lock, flags);
>
> Johan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
