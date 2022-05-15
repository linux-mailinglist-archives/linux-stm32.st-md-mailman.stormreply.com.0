Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E156527D86
	for <lists+linux-stm32@lfdr.de>; Mon, 16 May 2022 08:22:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A951C0D2C2;
	Mon, 16 May 2022 06:22:32 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0204AC03FC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 May 2022 15:09:31 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id c11so12180283plg.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 May 2022 08:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qO3edEXXFT5sc7tSOHbpToJOfM0YJEvW28s28fqDv6A=;
 b=gplcc5psQGU3CNwV7O9BX5jHbuFEmR3/VjZotZM1RosFCwvZBEoBJt3xXuOb1Pii4E
 J7fG2MeqCIq1emBbEGDn0jeI63S+QI645i+VLiHhjOw6KSdK65DKXclgBDrzO+BfDKRW
 YIyaauuP1sybW9v5nAhBWtKWs9ja3iM57oyOp7RaMghtLLbfrTvwon+MZ9z2YpGdTE7F
 AabvOUxG/Kli0dUfnn6aopFgaulZstfk6zV6Hb6+isDEItcymXOeFCnf6MqM55sYETRS
 bV8K+VHf/k8CvKoe2A95JDWhHQdQD13QVTnHXxP5bNxhCBqKkd+H75dtyw2Q+MaNBsVb
 t45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qO3edEXXFT5sc7tSOHbpToJOfM0YJEvW28s28fqDv6A=;
 b=YEMbViQANumxA5TGy3ujbTtktnII/8J3I75YwyLSBb8/TTXamGFo047PR8pT81xDW6
 IXKB4/kUQBHJTbEo1wNsK21NMBk0RuGbCvJClDyYdNPrs7q0ADRqqqTToF7mJe/Nvanl
 xVH9YYNUdedlNwocBR3UeqPk2FsCgoIZb38A7qvW6pG6bxoVwYoFR+b0PebrcDVBZ5hD
 lEN0FU/J30urJO6ztXdaEXdyBonBmqEpbvIMD5UNtpCSSz/K+URnd3ATwD6MDP1rmmDu
 AwnbkMwyW92nGt/TMEz5W1SiH7eVa1d0foAgg3iyy4SaGGdhErgUFkgTxPV7yk8dGLe6
 0EHw==
X-Gm-Message-State: AOAM533ZsI2fB/+d3EykPQnPXfUAgSJREWkxCs6v+ukEUNcsa4j6r9W2
 G7+LZFDSmJO6giiabG1unaE5BquInKdDS5VMTQw=
X-Google-Smtp-Source: ABdhPJz8TyKiywLdC3TThnxnrvk3bzjXzAxnXKetYbASDbqwargBQkyu+G5PMVEdCfELqEFhshMNJdkFpY8g8JGEQdQ=
X-Received: by 2002:a17:90b:17c4:b0:1de:c92c:ad91 with SMTP id
 me4-20020a17090b17c400b001dec92cad91mr14924799pjb.169.1652627370510; Sun, 15
 May 2022 08:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220506225617.1774604-1-yannick.brosseau@gmail.com>
 <20220506225617.1774604-3-yannick.brosseau@gmail.com>
 <32a7849b-c631-f80d-b29c-2a790ac641ec@foss.st.com>
In-Reply-To: <32a7849b-c631-f80d-b29c-2a790ac641ec@foss.st.com>
From: "Brosseau, Yannick" <yannick.brosseau@gmail.com>
Date: Sun, 15 May 2022 11:09:19 -0400
Message-ID: <CAEzWAeJWUHyTUn+jsLJHa=ioSYhKkJrfmA1qL3HNran6aWy2CA@mail.gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
X-Mailman-Approved-At: Mon, 16 May 2022 06:22:30 +0000
Cc: lars@metafoo.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, paul@crapouillou.net,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/2] iio: adc: stm32: Fix check for
	spurious IRQs on STM32F4
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
Content-Type: multipart/mixed; boundary="===============2580153767216025668=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============2580153767216025668==
Content-Type: multipart/alternative; boundary="0000000000005d8d3705df0e4b97"

--0000000000005d8d3705df0e4b97
Content-Type: text/plain; charset="UTF-8"

On Fri, May 13, 2022 at 9:14 AM Fabrice Gasnier <fabrice.gasnier@foss.st.com>
wrote:

> On 5/7/22 00:56, Yannick Brosseau wrote:
> > The check for spurious IRQs introduced in 695e2f5c289bb assumed that the
> bits
> > in the control and status registers are aligned. This is true for the H7
> and MP1
> > version, but not the F4.
> >
> > Instead of comparing both registers bitwise, we check the bit in the
> status and control
> > for each interrupt we are interested in.
> >
>
> Hi Yannick,
>
> I propose a different approach, see here after.
>
> Same as for patch one,
> Fixes: 695e2f5c289b ("iio: adc: stm32-adc: fix a regression when using
> dma and irq")
>
> > Signed-off-by: Yannick Brosseau <yannick.brosseau@gmail.com>
> > ---
> >  drivers/iio/adc/stm32-adc.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> > index a68ecbda6480..5b0f138333ee 100644
> > --- a/drivers/iio/adc/stm32-adc.c
> > +++ b/drivers/iio/adc/stm32-adc.c
> > @@ -1422,9 +1422,10 @@ static irqreturn_t stm32_adc_threaded_isr(int
> irq, void *data)
> >               return IRQ_HANDLED;
> >       }
> >
> > -     if (!(status & mask))
> > +     if(!((status & regs->isr_eoc.mask) && (mask & regs->ier_eoc.mask))
> ||
> > +           ((status & regs->isr_ovr.mask) && (mask &
> regs->ier_ovr.mask)))
> >               dev_err_ratelimited(&indio_dev->dev,
> > -                                 "Unexpected IRQ: IER=0x%08x,
> ISR=0x%08x\n",
> > +                                 "Unexpected IRQ: CR1/IER=0x%08x,
> SR/ISR=0x%08x\n",
> >                                   mask, status);
>
>
> Here, a slightly different approach could be used... There's a long
> pending discussion, where Olivier or I should push further patches to
> support threadirqs (hopefully soon).
> In this discussion with Jonathan [1], he exposed the need to remove this
> message. Words from Jonathan:
> "This seems 'unusual'.  If this is a spurious interrupt we should be
> returning IRQ_NONE and letting the spurious interrupt protection
> stuff kick in."
>
> [1]
> https://lore.kernel.org/linux-arm-kernel/20210116175333.4d8684c5@archlinux/
>
> So basically, I suggest to completely get rid of this message:
>
> -       if (!(status & mask))
> -               dev_err_ratelimited(&indio_dev->dev,
> -                                   "Unexpected IRQ: IER=0x%08x,
> ISR=0x%08x\n",
> -                                   mask, status);
>
> >
> >       return IRQ_NONE;
> > @@ -1438,7 +1439,9 @@ static irqreturn_t stm32_adc_isr(int irq, void
> *data)
> >       u32 status = stm32_adc_readl(adc, regs->isr_eoc.reg);
> >       u32 mask = stm32_adc_readl(adc, regs->ier_eoc.reg);
> >
> > -     if (!(status & mask))
> > +     /* Check that we have the interrupt we care about are enabled and
> active */
> > +        if(!((status & regs->isr_eoc.mask) && (mask &
> regs->ier_eoc.mask)) ||
> > +           ((status & regs->isr_ovr.mask) && (mask &
> regs->ier_ovr.mask)))
> >               return IRQ_WAKE_THREAD;
>
> Here the statement becomes useless, so it could be removed:
> -       u32 mask = stm32_adc_readl(adc, regs->ier_eoc.reg);
> -
> -       if (!(status & mask))
> -               return IRQ_WAKE_THREAD;
>
> This would avoid some complexity here (and so headaches or regressions
> like the one you've hit).
>
> This also should serve the two purposes:
> - fall into kernel generic handler for spurious IRQs (by returning
> IRQ_NONE below)
> - by the way fix current issue in stm32f4
>
>
I agree with this. I was a bit unsure if this code was necessary. I ran my
systems with those line removed for a few months without issues.
I'll spin up an updated patchset.

Yannick

--0000000000005d8d3705df0e4b97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 13, 2022 at 9:14 AM Fabri=
ce Gasnier &lt;<a href=3D"mailto:fabrice.gasnier@foss.st.com">fabrice.gasni=
er@foss.st.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On 5/7/22 00:56, Yannick Brosseau wrote:<br>
&gt; The check for spurious IRQs introduced in 695e2f5c289bb assumed that t=
he bits<br>
&gt; in the control and status registers are aligned. This is true for the =
H7 and MP1<br>
&gt; version, but not the F4.<br>
&gt; <br>
&gt; Instead of comparing both registers bitwise, we check the bit in the s=
tatus and control<br>
&gt; for each interrupt we are interested in.<br>
&gt; <br>
<br>
Hi Yannick,<br>
<br>
I propose a different approach, see here after.<br>
<br>
Same as for patch one,<br>
Fixes: 695e2f5c289b (&quot;iio: adc: stm32-adc: fix a regression when using=
<br>
dma and irq&quot;)<br>
<br>
&gt; Signed-off-by: Yannick Brosseau &lt;<a href=3D"mailto:yannick.brosseau=
@gmail.com" target=3D"_blank">yannick.brosseau@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/iio/adc/stm32-adc.c | 9 ++++++---<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c=
<br>
&gt; index a68ecbda6480..5b0f138333ee 100644<br>
&gt; --- a/drivers/iio/adc/stm32-adc.c<br>
&gt; +++ b/drivers/iio/adc/stm32-adc.c<br>
&gt; @@ -1422,9 +1422,10 @@ static irqreturn_t stm32_adc_threaded_isr(int i=
rq, void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return IRQ_HANDL=
ED;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!(status &amp; mask))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if(!((status &amp; regs-&gt;isr_eoc.mask) &amp;&a=
mp; (mask &amp; regs-&gt;ier_eoc.mask)) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((status &amp; regs-&gt;isr_=
ovr.mask) &amp;&amp; (mask &amp; regs-&gt;ier_ovr.mask)))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err_ratelimi=
ted(&amp;indio_dev-&gt;dev,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Unexpected IRQ: IER=
=3D0x%08x, ISR=3D0x%08x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Unexpected IRQ: CR1/=
IER=3D0x%08x, SR/ISR=3D0x%08x\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mask, status);<br>
<br>
<br>
Here, a slightly different approach could be used... There&#39;s a long<br>
pending discussion, where Olivier or I should push further patches to<br>
support threadirqs (hopefully soon).<br>
In this discussion with Jonathan [1], he exposed the need to remove this<br=
>
message. Words from Jonathan:<br>
&quot;This seems &#39;unusual&#39;.=C2=A0 If this is a spurious interrupt w=
e should be<br>
returning IRQ_NONE and letting the spurious interrupt protection<br>
stuff kick in.&quot;<br>
<br>
[1]<br>
<a href=3D"https://lore.kernel.org/linux-arm-kernel/20210116175333.4d8684c5=
@archlinux/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/l=
inux-arm-kernel/20210116175333.4d8684c5@archlinux/</a><br>
<br>
So basically, I suggest to completely get rid of this message:<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(status &amp; mask))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err_ratelimited=
(&amp;indio_dev-&gt;dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Unexpected IRQ: I=
ER=3D0x%08x, ISR=3D0x%08x\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mask, status);<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return IRQ_NONE;<br>
&gt; @@ -1438,7 +1439,9 @@ static irqreturn_t stm32_adc_isr(int irq, void *=
data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 status =3D stm32_adc_readl(adc, regs-&gt=
;isr_eoc.reg);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask =3D stm32_adc_readl(adc, regs-&gt;i=
er_eoc.reg);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!(status &amp; mask))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Check that we have the interrupt we care about=
 are enabled and active */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(!((status &amp; regs-&gt;isr_eoc.mask)=
 &amp;&amp; (mask &amp; regs-&gt;ier_eoc.mask)) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((status &amp; regs-&gt;isr_=
ovr.mask) &amp;&amp; (mask &amp; regs-&gt;ier_ovr.mask)))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return IRQ_WAKE_=
THREAD;<br>
<br>
Here the statement becomes useless, so it could be removed:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mask =3D stm32_adc_readl(adc, regs-&gt;ier_=
eoc.reg);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(status &amp; mask))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return IRQ_WAKE_THR=
EAD;<br>
<br>
This would avoid some complexity here (and so headaches or regressions<br>
like the one you&#39;ve hit).<br>
<br>
This also should serve the two purposes:<br>
- fall into kernel generic handler for spurious IRQs (by returning<br>
IRQ_NONE below)<br>
- by the way fix current issue in stm32f4<br>
<br></blockquote><div><br></div><div>I agree with this. I was a bit unsure =
if this code was necessary. I ran my systems with those line removed for a =
few months without issues.=C2=A0</div><div>I&#39;ll spin up an updated patc=
hset.=C2=A0</div><div><br></div><div>Yannick</div><div>=C2=A0</div></div></=
div>

--0000000000005d8d3705df0e4b97--

--===============2580153767216025668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2580153767216025668==--
