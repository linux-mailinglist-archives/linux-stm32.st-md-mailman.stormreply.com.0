Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 355D334C637
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Mar 2021 10:08:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7A1AC5719D;
	Mon, 29 Mar 2021 08:08:35 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 339A3C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Mar 2021 08:08:33 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id n198so11916677iod.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Mar 2021 01:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M90PtnBos3vQm4jCYdp24IMqWu4umlMBuWXWPsG5RUI=;
 b=XDcojEEvHw7VjId4QVIJ4x75QaQSNdQdx6b5ynGSdQ6rRtpfhVw3hYWVopCzz+i8Mx
 MawpBVFqghbwm+t0GQto3ccA5RVfnkV3zhieuKICgbyD6UJ6Sx3tu1S4gvu25AIypxJU
 IrKNadU9KlRCsAwt6Ko0ND6l2IDtAgziZ+pH8H/M12uTdgWUctXPf+is6ylHU5dG30LP
 23chMnymCz9holZnfdWVaE0K1NcDfitMSls/YRpfvS79iNgkcKeX0S4J4W7gluJR/eI9
 xKaXdVxCUx/E4UzDo7vvmkOvsu8ruOXJPNRblW96dd+8K8IFzs2tlrn/HjgncWfQh7J2
 gUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M90PtnBos3vQm4jCYdp24IMqWu4umlMBuWXWPsG5RUI=;
 b=He/lREEO6j4MUiOCZ7rTpzqcYgQFmCmDAcnJ9j5RwDsbvI3MZB2fYpmD3ECga+lvA5
 7Flr03gDOd9INno33S1QaUURl14Xr98Gz+nYIv1GAcSHlZzIJ/0fnUbtewQMATpOhPP+
 6wkNr9OKmGQ+ztK7BpI3JPkkE9grOO5+Q9dw1b795O5J4IM/qhX5nvz2ecH+9EDg5okH
 Q5fYcDxxm156LfBT606kDt3UJhbgNYjqe4g4aDgRvKPSd1dQTiy+2TIPL94wjE2j8Sa4
 2+8Rw2Qd/TTBDidinFRoa7rt+BpPz+z2z613soGWgBUUb6widWJuJqoaX3ke3m6ht3eP
 DHlw==
X-Gm-Message-State: AOAM530nsqU0APPgCUyGiwOz0MOVo+vCzbTV/rtFTYHKUHN3AhkZK8y5
 WamQ3K7W6QSzAHR0GriP9FjdQrePEbzi5yv31uA=
X-Google-Smtp-Source: ABdhPJwf+nNTr4QHEViurBtr2d3/xvlbhnLb599B6ZVv54r8NPMEKvz7hwFVeFk/Dn/uBm2Zk+aTqvnqBv1DHzEi4u8=
X-Received: by 2002:a05:6602:280f:: with SMTP id
 d15mr18461754ioe.127.1617005312167; 
 Mon, 29 Mar 2021 01:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <1615530274-31422-1-git-send-email-dillon.minfei@gmail.com>
 <1615530274-31422-9-git-send-email-dillon.minfei@gmail.com>
 <eb2437ef-ecd2-e258-b77b-2fe9f70205f2@foss.st.com>
In-Reply-To: <eb2437ef-ecd2-e258-b77b-2fe9f70205f2@foss.st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Mon, 29 Mar 2021 16:07:56 +0800
Message-ID: <CAL9mu0KrT4S=NHULcJdztXZ=RvGnVA9s95pDGmadRBH=vnpO6g@mail.gmail.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux@armlinux.org.uk, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, afzal.mohd.ma@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 8/8] pinctrl: stm32: Add STM32H750 MCU
	pinctrl support
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

On Mon, Mar 29, 2021 at 4:00 PM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
> Hi Dillon
>
> On 3/12/21 7:24 AM, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > This patch adds STM32H750 pinctrl and GPIO support
> > since stm32h750 has the same pin alternate functions
> > with stm32h743, so just reuse the stm32h743's pinctrl
> > driver
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> > v2:
> > - add compatible string st,stm32h750-pinctrl to pinctl-stm32h743.c as they
> >    have same pin alternate functions
> > - add STM32H750 to Kconfig description
> >
> >   drivers/pinctrl/stm32/Kconfig             | 2 +-
> >   drivers/pinctrl/stm32/pinctrl-stm32h743.c | 3 +++
> >   2 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/stm32/Kconfig b/drivers/pinctrl/stm32/Kconfig
> > index f36f29113370..fb1ffc94c57f 100644
> > --- a/drivers/pinctrl/stm32/Kconfig
> > +++ b/drivers/pinctrl/stm32/Kconfig
> > @@ -35,7 +35,7 @@ config PINCTRL_STM32F769
> >       select PINCTRL_STM32
> >
> >   config PINCTRL_STM32H743
> > -     bool "STMicroelectronics STM32H743 pin control" if COMPILE_TEST && !MACH_STM32H743
> > +     bool "STMicroelectronics STM32H743/STM32H750 pin control" if COMPILE_TEST && !MACH_STM32H743
> >       depends on OF && HAS_IOMEM
> >       default MACH_STM32H743
> >       select PINCTRL_STM32
> > diff --git a/drivers/pinctrl/stm32/pinctrl-stm32h743.c b/drivers/pinctrl/stm32/pinctrl-stm32h743.c
> > index ffe7b5271506..700206c7bc11 100644
> > --- a/drivers/pinctrl/stm32/pinctrl-stm32h743.c
> > +++ b/drivers/pinctrl/stm32/pinctrl-stm32h743.c
> > @@ -1966,6 +1966,9 @@ static const struct of_device_id stm32h743_pctrl_match[] = {
> >               .compatible = "st,stm32h743-pinctrl",
> >               .data = &stm32h743_match_data,
> >       },
> > +     {       .compatible = "st,stm32h750-pinctrl",
> > +             .data = &stm32h743_match_data,
> > +     },
>
> If you use exactly the same driver (i.e. same ball out and AF mux) then
> you don't have to create a new compatible for that. Just use the same
> than h743.(so you don't have to factorize DT files).
Okay, yes they are the total same ball out and AF mux. I will delete
it in the next submission.
 Just a kindly reminder , the newest version of this patchset is [PATCH v6].

Thanks.
>
> Regards
> Alex
>
> >       { }
> >   };
> >
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
