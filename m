Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C00CB1C8547
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 11:02:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D2CBC3F930;
	Thu,  7 May 2020 09:02:12 +0000 (UTC)
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 402BAC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 09:02:10 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id b18so1252966ilf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 02:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dr6YZzavS4ZBiFf/E0M6ykRZYaqqE46BvzhJA9Sx7LY=;
 b=EpgLQ4BSq79grO+burkLs7N3QclG2glvDxr6iZ7NblHeudNN9S/gPsKsHM00LxF7YF
 O3KMrjpGQwU/PDmuQf5tgkkudc8d2qNe4yRC7k7ob6IRRguwz6shyXtIznH31QCNaA4l
 Lf8S6VQCA4eTczCFVfkeJvFXc5OQwM3pnqiIJEAN7YkSovfsY/3onP1m2pYfMV3AWYMf
 UvImB3a23rRA+ptQ/4gBCrjxaeM7sSRCkRQ5YdfufSEDl5Zu0I0kwZ9PcMjBmwjM1QJ+
 ucSs6g81yrNc28d2zNbo0NhJQwOtNEgI/zVjZbsCLwv1I5YZEn0vCtz/Pb51sdP2EVA6
 oNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dr6YZzavS4ZBiFf/E0M6ykRZYaqqE46BvzhJA9Sx7LY=;
 b=QxkEv9BetMSXJlD9NaWYJGHGv/j3uTCoUyue0BgnkmDcjH53EPmB03eTm9fqzA8xdK
 Ne5BTVMOf4yFq7V46tEZL5nU8Gdpalv5ap+2oAbI2afp5R3typ/YX+54YM+vsD5ZE9LI
 RjH/hnDoiw95xSkq+K4eyV8AnLFDXGZhAgociT/B6ut8LUlTFQMAJ1AKwAnKAbM94F+e
 wWm31jqQGw3fKHMGYleIF1oLq/RbUk4vtUcbqsjLAC6S0OunoXyfqQxFbPyeH8mYPXQw
 TFZ6xg33nMIyyUZkYAvb8GMKSBaJyvh94fzb1ZRu37Qo7GVy2f9Vu4n2tcx1Fch9ejis
 /qrQ==
X-Gm-Message-State: AGi0PuaBFFmDEF5w6p36oX95VXVm3wPTZESemy6dfOd5ymdwQOPlKtm9
 IbCF0AVUYRh6ilQfzkYd5s18sNV+nIyzLF9+9ms=
X-Google-Smtp-Source: APiQypIQDIwQYa7nQ+WLdBTglbhgs6v5L99nesiCC7cLgoOb1WNqwzsqbsAhbV1tcR9BGs4senTkLU1aWjJhMc+WlGU=
X-Received: by 2002:a92:8cdd:: with SMTP id s90mr13791139ill.200.1588842128969; 
 Thu, 07 May 2020 02:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <1588837654-14315-1-git-send-email-dillon.minfei@gmail.com>
 <6e60c3494b7daea740b335fee9c5f5ce5ad7de45.camel@toradex.com>
In-Reply-To: <6e60c3494b7daea740b335fee9c5f5ce5ad7de45.camel@toradex.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Thu, 7 May 2020 17:01:56 +0800
Message-ID: <CAL9mu0LEm14fHXQwbX1yO7Yx=KkMRaZo+6iYRJCAyMav5uEd+A@mail.gmail.com>
To: Philippe Schenker <philippe.schenker@toradex.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH 3/4] ARM: dts: stm32: enable stmpe811 on
	stm32429-disco board
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
Content-Type: multipart/mixed; boundary="===============5404455585483656197=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============5404455585483656197==
Content-Type: multipart/alternative; boundary="000000000000b3958e05a50b2275"

--000000000000b3958e05a50b2275
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe Schenker,

thanks for your quick reply. i check the stmpe code, it's not use id,
block, irq-trigger anymore.
i will remove these three configuration in dts, and submit again.

thanks.

regards.

dillon,

Philippe Schenker <philippe.schenker@toradex.com> =E4=BA=8E2020=E5=B9=B45=
=E6=9C=887=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=884:32=E5=86=99=E9=81=
=93=EF=BC=9A

> On Thu, 2020-05-07 at 15:47 +0800, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > Enable the stmpe811 touch screen on stm32429-disco board.
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> >  arch/arm/boot/dts/stm32f429-disco.dts | 50
> > +++++++++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/stm32f429-disco.dts
> > b/arch/arm/boot/dts/stm32f429-disco.dts
> > index 30c0f67..f9f21c8 100644
> > --- a/arch/arm/boot/dts/stm32f429-disco.dts
> > +++ b/arch/arm/boot/dts/stm32f429-disco.dts
> > @@ -49,6 +49,8 @@
> >  #include "stm32f429.dtsi"
> >  #include "stm32f429-pinctrl.dtsi"
> >  #include <dt-bindings/input/input.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/gpio/gpio.h>
> >
> >  / {
> >       model =3D "STMicroelectronics STM32F429i-DISCO board";
> > @@ -127,3 +129,51 @@
> >       pinctrl-names =3D "default";
> >       status =3D "okay";
> >  };
> > +
> > +&i2c3 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&i2c3_pins>;
> > +     clock-frequency =3D <100000>;
> > +     status =3D "okay";
> > +
> > +     stmpe811@41 {
> > +             compatible =3D "st,stmpe811";
> > +             reg =3D <0x41>;
> > +             interrupts =3D <15 IRQ_TYPE_EDGE_FALLING>;
> > +             interrupt-parent =3D <&gpioa>;
> > +             id =3D <0>;
> > +             blocks =3D <0x5>;
> > +             irq-trigger =3D <0x1>;
>
> I can't find id, blocks and irq-trigger in the binding. What are they
> for?
>
> Philippe
>
> > +             /* 3.25 MHz ADC clock speed */
> > +             st,adc-freq =3D <1>;
> > +             /* 12-bit ADC */
> > +             st,mod-12b =3D <1>;
> > +             /* internal ADC reference */
> > +             st,ref-sel =3D <0>;
> > +             /* ADC converstion time: 80 clocks */
> > +             st,sample-time =3D <4>;
> > +
> > +             stmpe_touchscreen {
> > +                     compatible =3D "st,stmpe-ts";
> > +                     /* 8 sample average control */
> > +                     st,ave-ctrl =3D <3>;
> > +                     /* 7 length fractional part in z */
> > +                     st,fraction-z =3D <7>;
> > +                     /*
> > +                      * 50 mA typical 80 mA max touchscreen drivers
> > +                      * current limit value
> > +                      */
> > +                     st,i-drive =3D <1>;
> > +                     /* 1 ms panel driver settling time */
> > +                     st,settling =3D <3>;
> > +                     /* 5 ms touch detect interrupt delay */
> > +                     st,touch-det-delay =3D <5>;
> > +             };
> > +
> > +             stmpe_adc {
> > +                     compatible =3D "st,stmpe-adc";
> > +                     /* forbid to use ADC channels 3-0 (touch) */
> > +                     st,norequest-mask =3D <0x0F>;
> > +             };
> > +     };
> > +};
>

--000000000000b3958e05a50b2275
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Philippe Schenker,</div><div><br></div><div>thanks=
 for your quick reply. i check the stmpe code, it&#39;s not use id, block, =
irq-trigger anymore.</div><div>i will remove these three configuration in d=
ts, and submit=C2=A0again.=C2=A0</div><div><br></div><div>thanks.</div><div=
><br></div><div>regards.</div><div><div><br></div>dillon,=C2=A0</div><div>=
=C2=A0<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
Philippe Schenker &lt;<a href=3D"mailto:philippe.schenker@toradex.com">phil=
ippe.schenker@toradex.com</a>&gt; =E4=BA=8E2020=E5=B9=B45=E6=9C=887=E6=97=
=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=884:32=E5=86=99=E9=81=93=EF=BC=9A<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 2020-05-07 =
at 15:47 +0800, <a href=3D"mailto:dillon.minfei@gmail.com" target=3D"_blank=
">dillon.minfei@gmail.com</a> wrote:<br>
&gt; From: dillon min &lt;<a href=3D"mailto:dillon.minfei@gmail.com" target=
=3D"_blank">dillon.minfei@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Enable the stmpe811 touch screen on stm32429-disco board.<br>
&gt; <br>
&gt; Signed-off-by: dillon min &lt;<a href=3D"mailto:dillon.minfei@gmail.co=
m" target=3D"_blank">dillon.minfei@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/arm/boot/dts/stm32f429-disco.dts | 50<br>
&gt; +++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 50 insertions(+)<br>
&gt; <br>
&gt; diff --git a/arch/arm/boot/dts/stm32f429-disco.dts<br>
&gt; b/arch/arm/boot/dts/stm32f429-disco.dts<br>
&gt; index 30c0f67..f9f21c8 100644<br>
&gt; --- a/arch/arm/boot/dts/stm32f429-disco.dts<br>
&gt; +++ b/arch/arm/boot/dts/stm32f429-disco.dts<br>
&gt; @@ -49,6 +49,8 @@<br>
&gt;=C2=A0 #include &quot;stm32f429.dtsi&quot;<br>
&gt;=C2=A0 #include &quot;stm32f429-pinctrl.dtsi&quot;<br>
&gt;=C2=A0 #include &lt;dt-bindings/input/input.h&gt;<br>
&gt; +#include &lt;dt-bindings/interrupt-controller/irq.h&gt;<br>
&gt; +#include &lt;dt-bindings/gpio/gpio.h&gt;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 / {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0model =3D &quot;STMicroelectronics STM32F429=
i-DISCO board&quot;;<br>
&gt; @@ -127,3 +129,51 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt;=C2=A0 };<br>
&gt; +<br>
&gt; +&amp;i2c3 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;i2c3_pins&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clock-frequency =3D &lt;100000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0stmpe811@41 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
st,stmpe811&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x41&gt;;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts =3D &lt;15=
 IRQ_TYPE_EDGE_FALLING&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt-parent =3D =
&lt;&amp;gpioa&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0id =3D &lt;0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blocks =3D &lt;0x5&gt=
;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0irq-trigger =3D &lt;0=
x1&gt;;<br>
<br>
I can&#39;t find id, blocks and irq-trigger in the binding. What are they<b=
r>
for?<br>
<br>
Philippe<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 3.25 MHz ADC clock=
 speed */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st,adc-freq =3D &lt;1=
&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 12-bit ADC */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st,mod-12b =3D &lt;1&=
gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* internal ADC refer=
ence */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st,ref-sel =3D &lt;0&=
gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* ADC converstion ti=
me: 80 clocks */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st,sample-time =3D &l=
t;4&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmpe_touchscreen {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0compatible =3D &quot;st,stmpe-ts&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* 8 sample average control */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0st,ave-ctrl =3D &lt;3&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* 7 length fractional part in z */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0st,fraction-z =3D &lt;7&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 * 50 mA typical 80 mA max touchscreen drivers<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 * current limit value<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0st,i-drive =3D &lt;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* 1 ms panel driver settling time */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0st,settling =3D &lt;3&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* 5 ms touch detect interrupt delay */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0st,touch-det-delay =3D &lt;5&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmpe_adc {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0compatible =3D &quot;st,stmpe-adc&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* forbid to use ADC channels 3-0 (touch) */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0st,norequest-mask =3D &lt;0x0F&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
</blockquote></div></div></div>

--000000000000b3958e05a50b2275--

--===============5404455585483656197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5404455585483656197==--
