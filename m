Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A041C8B36
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 14:44:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89BAAC3F944;
	Thu,  7 May 2020 12:44:57 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63200C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 12:13:29 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id u11so5981737iow.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 05:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=5Eg52U2i6goeRxUm5niRxat7oFWoHLPYhu0nhcGrgdc=;
 b=WVaw+Q12d5eILtMuicUT8pn3PFwaKTzeK67XIkH0tmh8t+Ioh17veJNK3z1/bTedi+
 FISCD74rCvBmWXuWf2lLlZdGrKL6Cs/FWWVb0P24FQvaUFDR85hF3ERv3usS5hHvM5Vj
 U946M47mCq8Lb4beEwit1p2TvwYoEFq8dpQh7Zk6RhdoocwTKrOM7HSj+D5pfinqCFKR
 mucuQnnhtAd4vrbHYxcHA9OBRezVNNduZre3eBM19qFJ+zheZ+I0iNb2JZELYrrFkWjY
 LfXaO2Nm7QDb0zEeWpaI8UEKRIJ9ju+gOTq7mx595nG7G/kHolL+BZvYLaK2+zFOGXji
 y6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=5Eg52U2i6goeRxUm5niRxat7oFWoHLPYhu0nhcGrgdc=;
 b=Z92Tw/EITllvQpxGUWcdHoFl2pzKT6AvyT6UCVTQ/a00frmY9UBKuvNhes2au3D7E6
 BjepfO/0LiSVe9puo6isj3B0VYvKee6UA+pJBJpsxQUJOpKYwu4wC8BX+g77+VnKqO00
 gBGbVBjrWlwgpdibcCTAayNv6dWGVSKmW+o9Cb9AzVYjvTRgcY19LOqS7fLKhuc1uNJx
 3/XbnxAp4xvWwMUbuDmeM6/BHXMrTBjMlQSUvDvQBBlmrbDe9z2aGSRFyct9hcJkbrA5
 HCYhr2i7jdyiAZDl3nPC6svk/OoOCUkHxtV+KMF6A1d7D4IrWGndVFNoZRX8Jjl3ULJG
 GKRA==
X-Gm-Message-State: AGi0Pubv/wGxhe+kzkUoUu4cVBg7D1aOLdNZyUosasvKBLA4NLEloHpA
 iO5t7J626IEBT+L+8zwWXPo0EfkaRGfL8Cnla64=
X-Google-Smtp-Source: APiQypI6I/0qp3yNkcmPMbyJIyx4Hv9M2/RVal71qnwzYUrZWSwSUdrpjyITdfvseDhmDT2evsZfWOBterUY8rBYrnQ=
X-Received: by 2002:a6b:bc85:: with SMTP id m127mr13248936iof.89.1588853607521; 
 Thu, 07 May 2020 05:13:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:84e4:0:0:0:0:0 with HTTP;
 Thu, 7 May 2020 05:13:26 -0700 (PDT)
In-Reply-To: <98d6d44c-ff23-ac15-c17b-8f5f49ad2274@st.com>
References: <1588850125-24344-1-git-send-email-dillon.minfei@gmail.com>
 <98d6d44c-ff23-ac15-c17b-8f5f49ad2274@st.com>
From: Hua Dillon <dillonhua@gmail.com>
Date: Thu, 7 May 2020 20:13:26 +0800
Message-ID: <CAPTRvHns7WZj49O2MKHN-ByJpHjYftCqakHN_XOzTwMkg57z0Q@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@st.com>
X-Mailman-Approved-At: Thu, 07 May 2020 12:44:56 +0000
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "philippe.schenker@toradex.com" <philippe.schenker@toradex.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "dillon.minfei@gmail.com" <dillon.minfei@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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
Content-Type: multipart/mixed; boundary="===============0382884585255208355=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============0382884585255208355==
Content-Type: multipart/alternative; boundary="000000000000e0608f05a50dceb3"

--000000000000e0608f05a50dceb3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi, alexandre torgue

so, if i add "---" below
 Signed-off-by: dillon min <dillon.minfei@gmail.com>
 in git commit process, with changes log after that.  the log will not show
in commit messages, but will exist in git patchs, just showing for
reviewers ?

i will try this tomorrow, resubmit it.

thanks for your help.

best regards

dillon

=E5=9C=A8 2020=E5=B9=B45=E6=9C=887=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B=EF=
=BC=8CAlexandre Torgue <alexandre.torgue@st.com> =E5=86=99=E9=81=93=EF=BC=
=9A

> Hi Dillon
>
> On 5/7/20 1:15 PM, dillon.minfei@gmail.com wrote:
>
>> From: dillon min <dillon.minfei@gmail.com>
>>
>> Enable the stmpe811 touch screen on stm32429-disco board.
>>
>> Signed-off-by: dillon min <dillon.minfei@gmail.com>
>>
>> [PATCH 3/4]: ARM: dts: stm32: enable stmpe811 on stm32429-disco
>>
>> V2:
>> patch 3: remove unused id, blocks, irq-trigger
>>
>> V1:
>> patch 4: fix read touch screen xyz timeout bug
>> patch 3: enable stmpe_touchscreen on stm32f429-disco board
>> patch 2: add i2c3 pin mux for stm32f4
>> patch 1: add i2c3 controller interface for stm32f4
>>
>
> Good idea to add changes log for this patch. But this log has to be
> placed  after "---" below. This log has not to appear in your commit
> message. Furthermore, you should only add changes for this patch without
> talking about other patches .
>
>
>> Signed-off-by: dillon min <dillon.minfei@gmail.com>
>> ---
>>
>
> Add patch change log here.
>
>   arch/arm/boot/dts/stm32f429-disco.dts | 47
>> +++++++++++++++++++++++++++++++++++
>>   1 file changed, 47 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/stm32f429-disco.dts
>> b/arch/arm/boot/dts/stm32f429-disco.dts
>> index 30c0f67..fad1ec1 100644
>> --- a/arch/arm/boot/dts/stm32f429-disco.dts
>> +++ b/arch/arm/boot/dts/stm32f429-disco.dts
>> @@ -49,6 +49,8 @@
>>   #include "stm32f429.dtsi"
>>   #include "stm32f429-pinctrl.dtsi"
>>   #include <dt-bindings/input/input.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/gpio/gpio.h>
>>     / {
>>         model =3D "STMicroelectronics STM32F429i-DISCO board";
>> @@ -127,3 +129,48 @@
>>         pinctrl-names =3D "default";
>>         status =3D "okay";
>>   };
>> +
>> +&i2c3 {
>> +       pinctrl-names =3D "default";
>> +       pinctrl-0 =3D <&i2c3_pins>;
>> +       clock-frequency =3D <100000>;
>> +       status =3D "okay";
>> +
>> +       stmpe811@41 {
>> +               compatible =3D "st,stmpe811";
>> +               reg =3D <0x41>;
>> +               interrupts =3D <15 IRQ_TYPE_EDGE_FALLING>;
>> +               interrupt-parent =3D <&gpioa>;
>> +               /* 3.25 MHz ADC clock speed */
>> +               st,adc-freq =3D <1>;
>> +               /* 12-bit ADC */
>> +               st,mod-12b =3D <1>;
>> +               /* internal ADC reference */
>> +               st,ref-sel =3D <0>;
>> +               /* ADC converstion time: 80 clocks */
>> +               st,sample-time =3D <4>;
>> +
>> +               stmpe_touchscreen {
>> +                       compatible =3D "st,stmpe-ts";
>> +                       /* 8 sample average control */
>> +                       st,ave-ctrl =3D <3>;
>> +                       /* 7 length fractional part in z */
>> +                       st,fraction-z =3D <7>;
>> +                       /*
>> +                        * 50 mA typical 80 mA max touchscreen drivers
>> +                        * current limit value
>> +                        */
>> +                       st,i-drive =3D <1>;
>> +                       /* 1 ms panel driver settling time */
>> +                       st,settling =3D <3>;
>> +                       /* 5 ms touch detect interrupt delay */
>> +                       st,touch-det-delay =3D <5>;
>> +               };
>> +
>> +               stmpe_adc {
>> +                       compatible =3D "st,stmpe-adc";
>> +                       /* forbid to use ADC channels 3-0 (touch) */
>> +                       st,norequest-mask =3D <0x0F>;
>> +               };
>> +       };
>> +};
>>
>>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

--000000000000e0608f05a50dceb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi, alexandre torgue<div><br></div><div>so, if i add &quot;---&quot; below<=
/div><div>=C2=A0Signed-off-by: dillon min &lt;<a href=3D"mailto:dillon.minf=
ei@gmail.com" target=3D"_blank">dillon.minfei@gmail.com</a>&gt;</div><div>=
=C2=A0in git commit process, with changes log after that.=C2=A0 the log wil=
l not show in commit messages, but will exist in git patchs, just showing f=
or reviewers ?</div><div><br></div><div>i will try this tomorrow, resubmit =
it.</div><div><br></div><div>thanks for your help.</div><div><br></div><div=
>best regards</div><div><br></div><div>dillon<br><br>=E5=9C=A8 2020=E5=B9=
=B45=E6=9C=887=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B=EF=BC=8CAlexandre Torgue=
 &lt;<a href=3D"mailto:alexandre.torgue@st.com">alexandre.torgue@st.com</a>=
&gt; =E5=86=99=E9=81=93=EF=BC=9A<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Dillo=
n<br>
<br>
On 5/7/20 1:15 PM, <a href=3D"mailto:dillon.minfei@gmail.com" target=3D"_bl=
ank">dillon.minfei@gmail.com</a> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: dillon min &lt;<a href=3D"mailto:dillon.minfei@gmail.com" target=3D"_=
blank">dillon.minfei@gmail.com</a>&gt;<br>
<br>
Enable the stmpe811 touch screen on stm32429-disco board.<br>
<br>
Signed-off-by: dillon min &lt;<a href=3D"mailto:dillon.minfei@gmail.com" ta=
rget=3D"_blank">dillon.minfei@gmail.com</a>&gt;<br>
<br>
[PATCH 3/4]: ARM: dts: stm32: enable stmpe811 on stm32429-disco<br>
<br>
V2:<br>
patch 3: remove unused id, blocks, irq-trigger<br>
<br>
V1:<br>
patch 4: fix read touch screen xyz timeout bug<br>
patch 3: enable stmpe_touchscreen on stm32f429-disco board<br>
patch 2: add i2c3 pin mux for stm32f4<br>
patch 1: add i2c3 controller interface for stm32f4<br>
</blockquote>
<br>
Good idea to add changes log for this patch. But this log has to be placed=
=C2=A0 after &quot;---&quot; below. This log has not to appear in your comm=
it message. Furthermore, you should only add changes for this patch without=
 talking about other patches .<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Signed-off-by: dillon min &lt;<a href=3D"mailto:dillon.minfei@gmail.com" ta=
rget=3D"_blank">dillon.minfei@gmail.com</a>&gt;<br>
---<br>
</blockquote>
<br>
Add patch change log here.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0 arch/arm/boot/dts/stm32f429-di<wbr>sco.dts | 47 ++++++++++++++++++++=
++++++++++<wbr>+++++<br>
=C2=A0 1 file changed, 47 insertions(+)<br>
<br>
diff --git a/arch/arm/boot/dts/stm32f429-<wbr>disco.dts b/arch/arm/boot/dts=
/stm32f429-<wbr>disco.dts<br>
index 30c0f67..fad1ec1 100644<br>
--- a/arch/arm/boot/dts/stm32f429-<wbr>disco.dts<br>
+++ b/arch/arm/boot/dts/stm32f429-<wbr>disco.dts<br>
@@ -49,6 +49,8 @@<br>
=C2=A0 #include &quot;stm32f429.dtsi&quot;<br>
=C2=A0 #include &quot;stm32f429-pinctrl.dtsi&quot;<br>
=C2=A0 #include &lt;dt-bindings/input/input.h&gt;<br>
+#include &lt;dt-bindings/interrupt-control<wbr>ler/irq.h&gt;<br>
+#include &lt;dt-bindings/gpio/gpio.h&gt;<br>
=C2=A0 =C2=A0 / {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 model =3D &quot;STMicroelectronics STM32F429i-D=
ISCO board&quot;;<br>
@@ -127,3 +129,48 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &quot;default&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
=C2=A0 };<br>
+<br>
+&amp;i2c3 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;i2c3_pins&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clock-frequency =3D &lt;100000&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0stmpe811@41 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quo=
t;st,stmpe811&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x41&gt=
;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts =3D &lt;=
15 IRQ_TYPE_EDGE_FALLING&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt-parent =
=3D &lt;&amp;gpioa&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 3.25 MHz ADC clo=
ck speed */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st,adc-freq =3D &lt=
;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 12-bit ADC */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st,mod-12b =3D &lt;=
1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* internal ADC ref=
erence */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st,ref-sel =3D &lt;=
0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* ADC converstion =
time: 80 clocks */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st,sample-time =3D =
&lt;4&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmpe_touchscreen {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0compatible =3D &quot;st,stmpe-ts&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* 8 sample average control */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0st,ave-ctrl =3D &lt;3&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* 7 length fractional part in z */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0st,fraction-z =3D &lt;7&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * 50 mA typical 80 mA max touchscreen drivers<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * current limit value<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0st,i-drive =3D &lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* 1 ms panel driver settling time */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0st,settling =3D &lt;3&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* 5 ms touch detect interrupt delay */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0st,touch-det-delay =3D &lt;5&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmpe_adc {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0compatible =3D &quot;st,stmpe-adc&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* forbid to use ADC channels 3-0 (touch) */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0st,norequest-mask =3D &lt;0x0F&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+};<br>
<br>
</blockquote>
<br>
______________________________<wbr>_________________<br>
linux-arm-kernel mailing list<br>
<a href=3D"mailto:linux-arm-kernel@lists.infradead.org" target=3D"_blank">l=
inux-arm-kernel@lists.infrade<wbr>ad.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kernel" ta=
rget=3D"_blank">http://lists.infradead.org/mai<wbr>lman/listinfo/linux-arm-=
kernel</a><br>
</blockquote></div>

--000000000000e0608f05a50dceb3--

--===============0382884585255208355==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0382884585255208355==--
