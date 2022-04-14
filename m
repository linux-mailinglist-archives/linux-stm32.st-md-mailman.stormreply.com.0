Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FABA500D23
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Apr 2022 14:24:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A735C6049C;
	Thu, 14 Apr 2022 12:24:41 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1433FC5F1D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Apr 2022 12:24:39 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id kl29so3846685qvb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Apr 2022 05:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2gM58XwROhm0N00VwVwbh3pdnwwjzwvbBSho9O6c+es=;
 b=Y2WhHcQUE3QOn2lz0hZmZ0rIaWNOW1VIkaMQk4mgzunm8PrF5RNZGip8ewjS+IrrIX
 1cb5RMW4oUIgH89ztQIEs7b6fO9F6GThDKhEjzM3/yhRylf5c39+vlYPH87t1qp4cG/t
 vUIHug5kaErkL0KuyA8yteLR/jhBgKZ/Xw5N0FQUJK5irD6KmBRy/bI9P6SzjLtL8TAQ
 dSX87gGqTsaVtUHEv577xL0bPInflqgqeQyWu2tgtKnows3iSjYmyT+VRoLcc/rf+h44
 lErSP4F9jm863qtwtygeanEIvEkEqvyLAtYI7xhHeDj1DPBrpVGIV4V9ruwcJIV/di7r
 q6Cg==
X-Gm-Message-State: AOAM531u1j7/EEuw5nNz49lqKonwbLJcSv1OGq+UzGzHFxH3rt2+baJF
 3dheZk2CL+0SGNZcZmSMye0YiwgrU1TEvQ==
X-Google-Smtp-Source: ABdhPJxNqDGTKLls3jUYbZNM5Wh3coj2FRBWfdxN9JaalGPHhX0QVZCag0gLJcQvmgCz06XsA+nEFQ==
X-Received: by 2002:a05:6214:2601:b0:444:51fb:d4df with SMTP id
 gu1-20020a056214260100b0044451fbd4dfmr3085167qvb.62.1649939077836; 
 Thu, 14 Apr 2022 05:24:37 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 2-20020a05620a078200b0069bf545076bsm866422qka.13.2022.04.14.05.24.37
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 05:24:37 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id h8so9040696ybj.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Apr 2022 05:24:37 -0700 (PDT)
X-Received: by 2002:a5b:984:0:b0:63f:8c38:676c with SMTP id
 c4-20020a5b0984000000b0063f8c38676cmr1552530ybq.393.1649939077194; Thu, 14
 Apr 2022 05:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220408122636.505737-1-valentin.caron@foss.st.com>
 <20220408122636.505737-4-valentin.caron@foss.st.com>
 <CAMuHMdWD8fxeqPUaT_CwnYdq02aaTsnQM_G-YyOGWooS5epCeQ@mail.gmail.com>
 <b29dda44-1596-0456-7331-00012d740f06@foss.st.com>
In-Reply-To: <b29dda44-1596-0456-7331-00012d740f06@foss.st.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Apr 2022 14:24:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVyScZaYPcRqcobnaC2LAdfV80KXzCnxwfBE9-Q+72OYQ@mail.gmail.com>
Message-ID: <CAMuHMdVyScZaYPcRqcobnaC2LAdfV80KXzCnxwfBE9-Q+72OYQ@mail.gmail.com>
To: Valentin CARON <valentin.caron@foss.st.com>
Cc: "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V2 3/3] serial: stm32: add earlycon support
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

Hi Valentin,

On Thu, Apr 14, 2022 at 2:17 PM Valentin CARON
<valentin.caron@foss.st.com> wrote:
> On 4/11/22 16:59, Geert Uytterhoeven wrote:
> > On Fri, Apr 8, 2022 at 3:14 PM Valentin Caron
> > <valentin.caron@foss.st.com> wrote:
> >> Add early console support in stm32 uart driver.
> >>
> >> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> >> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
> > Thanks for your patch!
> >
> >> --- a/Documentation/admin-guide/kernel-parameters.txt
> >> +++ b/Documentation/admin-guide/kernel-parameters.txt
> >> @@ -1264,6 +1264,12 @@
> >>                          address must be provided, and the serial port must
> >>                          already be setup and configured.
> >>
> >> +               stm32,<addr>
> >> +                       Use early console provided by ST Microelectronics
> >> +                       serial driver for STM32 SoCs. A valid base address
> >> +                       must be provided, and the serial port must already
> >> +                       be setup and configured.
> > Why do you need this parameter?
> >
> > Given this driver uses DT, can't it figure out the serial port address
> > from chosen/stdout-path?
>
> I took the example of other serial drivers.
> Both methods work (with earlycon/stdout-path and with
> earlycon=stm32,0xXXXXXXX)
> but your right, the second will probably never used on this driver.
>
> Should I remove it ?

I think you should.  The less platform-specific kernel parameters,
the better. And the less bad examples to copy from.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
