Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9911C8628
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 11:54:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1FE5C3F939;
	Thu,  7 May 2020 09:54:54 +0000 (UTC)
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE135C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 09:54:53 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id s10so2148234iln.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 02:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tWY8u0IUa1vo5d3Z0x3wsZKNZ/jcX5HgixET3URMnQU=;
 b=HgUw2PXMHpqtXcG7ywiIuLuy6gAskvcLZodB1jf9/M3ldx/eVQ1uH3BrbYyXQ0NZeZ
 kmWXiS3mxPpsxko0F8ksjrjH6yXyVyJqmnjBzkU7KNdYwTHD3+rxHgbwS7mm8i40k/K9
 apua7YjTmHvCqtkNftn080yb2uMkb4MZTjH0Gb9CcAvLnVjOAAC9CJwfgCiDq0dTCJD1
 1SF07K37TF+V8Jy3bFHWL6mMYVgUFQfAdBa5evKexq1Bkxijpikt1nxXbtTQMd1tQA0/
 VR2If9Ce6zYrGbV02zld9rKOiccaC6GNHSgccqtCNVciNoLYoAxpMIYc0TpPqEnfVuTw
 OKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tWY8u0IUa1vo5d3Z0x3wsZKNZ/jcX5HgixET3URMnQU=;
 b=N7mqzcY7Tjhnzvkt6KsQtz2LL2Ge0VD8w5Cq9KcuHV6uKqFEfT+YM8EYjAX57GJaTB
 G2+T9qPaurd4LcCNWmrGKKZmIE3b+WkEh9KEDNNXGsHjcrb4dJyM6HYWBjtwzlFon24/
 abk7H1PjNIe9wnDO5/Hhq6OgjOrMBiH381ES18+brOKpJxWSXjtzjWG+2haI2JBzxiAB
 zzLy+2gK3Hx2ke+tE+09mZasC0Mf3K1dbYQwiBRAkFWb+fGFgNt3mCUlwAh9KhFCdfUL
 KDBS2QYFkYikvC8JAKExOO4plqM4VTBXrJklsfgIAlDlN6afQE2CPglgIej5EHJZ8q4M
 bN3w==
X-Gm-Message-State: AGi0Pua9qoBtXxEJeJDTRDEeVdXOOGmewY0/pOd2RzDN0iKRPf7z9m7k
 I3AsYNlLl25plVe7vZ96JZYzUPCpHxRo5PalxbE=
X-Google-Smtp-Source: APiQypKMK0prdSeG+ItL5gbD/APC2I3akQY1OHf0IPmiT19iPBbLh4PmGcUILJTq+X5EWOwGGMJF2KrtwpkVYXVs0uY=
X-Received: by 2002:a92:b710:: with SMTP id k16mr13426467ili.270.1588845292622; 
 Thu, 07 May 2020 02:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <philippe.schenker@toradex.com>
 <1588842971-20495-1-git-send-email-dillon.minfei@gmail.com>
 <1588842971-20495-2-git-send-email-dillon.minfei@gmail.com>
 <67c1d18e-033d-30d5-3945-7985a03bf142@st.com>
In-Reply-To: <67c1d18e-033d-30d5-3945-7985a03bf142@st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Thu, 7 May 2020 17:54:39 +0800
Message-ID: <CAL9mu0+07O+FzMcgcjTm9LdfSKZEkZX6fKn54Zxh70ELkTCfFQ@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Philippe Schenker <philippe.schenker@toradex.com>,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org
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
Content-Type: multipart/mixed; boundary="===============6444903743565069076=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============6444903743565069076==
Content-Type: multipart/alternative; boundary="00000000000045178e05a50bdfe6"

--00000000000045178e05a50bdfe6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Alexandre Torgue, Philippe Schenker

ok, just working on that now, thanks.

best regards.

dillon,

Alexandre Torgue <alexandre.torgue@st.com> =E4=BA=8E2020=E5=B9=B45=E6=9C=88=
7=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=885:42=E5=86=99=E9=81=93=EF=BC=
=9A

> Hi Dillon
>
> On 5/7/20 11:16 AM, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > Enable the stmpe811 touch screen on stm32429-disco board.
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
>
> You have to add version to your patches. When you send updates of your
> patches, it is better to resend the whole series by adding [PATCH v2]
> ... instead of [PATCH] (you can do it easily using git format-patch and
> subject-prefix). Then in your cover letter you have to explain changes
> between 2 series versions.
>
> So please resend the whole series by adding V2 prefix, update
> cover-letter explaining changes, and add a title to your cover-letter
> please.
>
> regards
> alex
>
>
>
> >   arch/arm/boot/dts/stm32f429-disco.dts | 47
> +++++++++++++++++++++++++++++++++++
> >   1 file changed, 47 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/stm32f429-disco.dts
> b/arch/arm/boot/dts/stm32f429-disco.dts
> > index 30c0f67..fad1ec1 100644
> > --- a/arch/arm/boot/dts/stm32f429-disco.dts
> > +++ b/arch/arm/boot/dts/stm32f429-disco.dts
> > @@ -49,6 +49,8 @@
> >   #include "stm32f429.dtsi"
> >   #include "stm32f429-pinctrl.dtsi"
> >   #include <dt-bindings/input/input.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/gpio/gpio.h>
> >
> >   / {
> >       model =3D "STMicroelectronics STM32F429i-DISCO board";
> > @@ -127,3 +129,48 @@
> >       pinctrl-names =3D "default";
> >       status =3D "okay";
> >   };
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
> >
>

--00000000000045178e05a50bdfe6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Alexandre Torgue, Philippe Schenker<div><br></div><div=
>ok, just working on that now, thanks.</div><div><br></div><div>best regard=
s.</div><div><br></div><div>dillon,</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Alexandre Torgue &lt;<a href=3D"ma=
ilto:alexandre.torgue@st.com">alexandre.torgue@st.com</a>&gt; =E4=BA=8E2020=
=E5=B9=B45=E6=9C=887=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=885:42=E5=
=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi Dillon<br>
<br>
On 5/7/20 11:16 AM, <a href=3D"mailto:dillon.minfei@gmail.com" target=3D"_b=
lank">dillon.minfei@gmail.com</a> wrote:<br>
&gt; From: dillon min &lt;<a href=3D"mailto:dillon.minfei@gmail.com" target=
=3D"_blank">dillon.minfei@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Enable the stmpe811 touch screen on stm32429-disco board.<br>
&gt; <br>
&gt; Signed-off-by: dillon min &lt;<a href=3D"mailto:dillon.minfei@gmail.co=
m" target=3D"_blank">dillon.minfei@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
You have to add version to your patches. When you send updates of your <br>
patches, it is better to resend the whole series by adding [PATCH v2] <br>
... instead of [PATCH] (you can do it easily using git format-patch and <br=
>
subject-prefix). Then in your cover letter you have to explain changes <br>
between 2 series versions.<br>
<br>
So please resend the whole series by adding V2 prefix, update <br>
cover-letter explaining changes, and add a title to your cover-letter <br>
please.<br>
<br>
regards<br>
alex<br>
<br>
<br>
<br>
&gt;=C2=A0 =C2=A0arch/arm/boot/dts/stm32f429-disco.dts | 47 +++++++++++++++=
++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 47 insertions(+)<br>
&gt; <br>
&gt; diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts=
/stm32f429-disco.dts<br>
&gt; index 30c0f67..fad1ec1 100644<br>
&gt; --- a/arch/arm/boot/dts/stm32f429-disco.dts<br>
&gt; +++ b/arch/arm/boot/dts/stm32f429-disco.dts<br>
&gt; @@ -49,6 +49,8 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;stm32f429.dtsi&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;stm32f429-pinctrl.dtsi&quot;<br>
&gt;=C2=A0 =C2=A0#include &lt;dt-bindings/input/input.h&gt;<br>
&gt; +#include &lt;dt-bindings/interrupt-controller/irq.h&gt;<br>
&gt; +#include &lt;dt-bindings/gpio/gpio.h&gt;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/ {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0model =3D &quot;STMicroelectronics STM32F429=
i-DISCO board&quot;;<br>
&gt; @@ -127,3 +129,48 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt;=C2=A0 =C2=A0};<br>
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
&gt; <br>
</blockquote></div>

--00000000000045178e05a50bdfe6--

--===============6444903743565069076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6444903743565069076==--
