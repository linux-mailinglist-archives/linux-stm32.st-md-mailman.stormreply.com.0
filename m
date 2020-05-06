Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 325961C6939
	for <lists+linux-stm32@lfdr.de>; Wed,  6 May 2020 08:45:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD861C349C7;
	Wed,  6 May 2020 06:45:49 +0000 (UTC)
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EED73C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2020 06:45:48 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id r2so722392ilo.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 May 2020 23:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lvaoZuKBKXpFlpA5C0J+EMjnV9LE596vkA9s4ZS6L/8=;
 b=iN359gjylLMOb7LEa3z5hv5ElAB3LdkCy/ywo4eOeTPoWENmmAELeMCcD7u9PieepY
 Lhpy4cpNpw4APv14XssIqNqDaHyxVtPLzSgYoZjoaFbnjWBxrc5pgmbXhg5352U1Bas7
 gXZlcv4CDcrvuIO3yo2ye2PUVOCPOJRCvK+Wne4ZshRb6L7fGcy+NPkbxN7BnJzgLPz6
 2W/20nrCtKMw554ymLoeR9+R1GkKHn8gMw+EsTEinqmmtvUNmTaHnBZTpYPD/GemecZo
 io6J7StoPpjzE6PuTHL/yM7SPOc8juKMMrrlMUabsqlWTTAKCiEAVbrfmYCP9rPOHQu9
 /K2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lvaoZuKBKXpFlpA5C0J+EMjnV9LE596vkA9s4ZS6L/8=;
 b=P5ImIYlLrb/AIoB331cJtylOJGcFSeICv/EVU/3WpWSasLyPskjK/An1Tk0X7E/ELc
 p9vI7QstlQl9Pb1nxm5Tw+RaD1WQakd5qvmA90aVUpkXo/FNty+LCnPgQHmdSER7+ChY
 GYo1oVus8z4pTtiz2jm4QAQsMFJCReSZzjkBBi7Wn6WlfxMTrZK8A0kWKwz5j8tRNf0P
 i+aeaUHcnQZ3gmOkVDzyI6FX25xGZ5nSt+bFH6oouYtxOb3UFjSc96OlUE7BEVhe1QLs
 YEjnzo4D4K3n4jn6TK90FgTRLHrnA35HeinCko3Q863RDIu6bz4ZdXcKQdeeNqwy9jhO
 /g2g==
X-Gm-Message-State: AGi0PuZwLIdvWGHV1f8vdjmmuOj2xQCmYfzNbW1Ohkf1435DOUpjSpWh
 KzXzp0FKixh2ypVMhD7ele+twuuvKLlp7PPNvQQ=
X-Google-Smtp-Source: APiQypLhIFdue4tf1+DVFyehWNlt9KwOsn3tb9e2Xib2hxe1B83Zmdd09QxamCaSGfVbXFAfjUoSfuZOmvnEptPOemY=
X-Received: by 2002:a92:485b:: with SMTP id v88mr7465090ila.271.1588747547756; 
 Tue, 05 May 2020 23:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <1588239802-11442-1-git-send-email-dillon.minfei@gmail.com>
 <33f928e7-3fde-99a2-b84d-d74a2d3f1186@st.com>
 <CAL9mu0+AqO69+rEcH=HVWRhDLbqDO52-Cjxt-PAZmg6=7QtpvQ@mail.gmail.com>
 <40bdf88c-fbc2-564c-1aec-38318bab5e61@st.com>
 <CAL9mu0KRPPrTUWggs2dQWPGjkyubUMpYx=3JzOpwTPQPHjsGhw@mail.gmail.com>
 <20200502063036.GA9204@ravnborg.org>
In-Reply-To: <20200502063036.GA9204@ravnborg.org>
From: dillon min <dillon.minfei@gmail.com>
Date: Wed, 6 May 2020 14:45:30 +0800
Message-ID: <CAL9mu0KS1UZkXXC8+xRcBv6Vw6CaGPchX8SMqkA-kM03BfowGQ@mail.gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com
Subject: Re: [Linux-stm32] [PATCH 1/4] add dts node for drm panel driver
 ili9341 add dts i2c3 for stmpe touch add dts spi5 for gyro & ili9341
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
Content-Type: multipart/mixed; boundary="===============1139044243289956993=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============1139044243289956993==
Content-Type: multipart/alternative; boundary="00000000000038cea005a4f51d70"

--00000000000038cea005a4f51d70
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sam Ravnborg <sam@ravnborg.org> =E4=BA=8E2020=E5=B9=B45=E6=9C=882=E6=97=A5=
=E5=91=A8=E5=85=AD =E4=B8=8B=E5=8D=882:30=E5=86=99=E9=81=93=EF=BC=9A

> Hi dillon min
>
> > > okay, thanks alexandre, i will go through these docs. currently i'm o=
n
> may
> > day holiday,  will be back at  next wensday.
> > after go back to work. i will separate this patch to five part with 9
> > patchs , should be more clear
> >
> > dts releated
> >     1,  ARM: dts: stm32: Add i2c3 node for stm32f429
> >     2,  ARM: dts: stm32: Add drm panel ili9341 nodes connect to ldtc
> > support for stm32f429-disco board
> >     3,  ARM: dts: stm32: Add stmpe811 touch screen support for
> > stm32f429-disco board
> >     4,  ARM: dts: stm32: Add l3gd20 gyroscope sensor support for
> > stm32f429-disco board
> >
> > clk releated
> >     1, clk: stm32: Fix ltdc loading hang in set clk rate, pll_hw set to
> > clks[PLL_VCO_SAI] but not clks[PLL_SAI]
> >     2, clk: stm32: Add CLK_IGNORE_UNUSED flags for ltdc, make sure ltdc
> clk
> > not be released after system startup
> >
> > spi releated
> >     1, spi: stm32: Add transfer mode SPI_SIMPLE_RX, SPI_3WIRE_RX suppor=
t
> > for stm32f4
> >
> > drm releated
> >     1, drm/panel: Add panel driver ilitek-ili9341
> >
> > doc releated
> >      1, dt-bindings: display: panel: Add binding document for Ilitek
> Ili9341
>
> Patch separation looks good.
> Please cc: me on both the binding and the panel patches.
> The binding must be in DT Schema format (.yaml).
> See a lot of examples in drm-misc-next for inspiration.
>
> Looks forward to see/review your submission.
>
>         Sam
>

hi Sam,

just sumbmit a patchset about ltdc with ili-9341 support on stm32f429-disco
board, with yaml
documents inside as well.

thanks,

Dillon,

--00000000000038cea005a4f51d70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Sam Ravnborg &lt;<a href=3D"mailto:sa=
m@ravnborg.org">sam@ravnborg.org</a>&gt; =E4=BA=8E2020=E5=B9=B45=E6=9C=882=
=E6=97=A5=E5=91=A8=E5=85=AD =E4=B8=8B=E5=8D=882:30=E5=86=99=E9=81=93=EF=BC=
=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi dillon mi=
n<br>
<br>
&gt; &gt; okay, thanks alexandre, i will go through these docs. currently i=
&#39;m on may<br>
&gt; day holiday,=C2=A0 will be back at=C2=A0 next wensday.<br>
&gt; after go back to work. i will separate this patch to five part with 9<=
br>
&gt; patchs , should be more clear<br>
&gt; <br>
&gt; dts releated<br>
&gt;=C2=A0 =C2=A0 =C2=A01,=C2=A0 ARM: dts: stm32: Add i2c3 node for stm32f4=
29<br>
&gt;=C2=A0 =C2=A0 =C2=A02,=C2=A0 ARM: dts: stm32: Add drm panel ili9341 nod=
es connect to ldtc<br>
&gt; support for stm32f429-disco board<br>
&gt;=C2=A0 =C2=A0 =C2=A03,=C2=A0 ARM: dts: stm32: Add stmpe811 touch screen=
 support for<br>
&gt; stm32f429-disco board<br>
&gt;=C2=A0 =C2=A0 =C2=A04,=C2=A0 ARM: dts: stm32: Add l3gd20 gyroscope sens=
or support for<br>
&gt; stm32f429-disco board<br>
&gt; <br>
&gt; clk releated<br>
&gt;=C2=A0 =C2=A0 =C2=A01, clk: stm32: Fix ltdc loading hang in set clk rat=
e, pll_hw set to<br>
&gt; clks[PLL_VCO_SAI] but not clks[PLL_SAI]<br>
&gt;=C2=A0 =C2=A0 =C2=A02, clk: stm32: Add CLK_IGNORE_UNUSED flags for ltdc=
, make sure ltdc clk<br>
&gt; not be released after system startup<br>
&gt; <br>
&gt; spi releated<br>
&gt;=C2=A0 =C2=A0 =C2=A01, spi: stm32: Add transfer mode SPI_SIMPLE_RX, SPI=
_3WIRE_RX support<br>
&gt; for stm32f4<br>
&gt; <br>
&gt; drm releated<br>
&gt;=C2=A0 =C2=A0 =C2=A01, drm/panel: Add panel driver ilitek-ili9341<br>
&gt; <br>
&gt; doc releated<br>
&gt;=C2=A0 =C2=A0 =C2=A0 1, dt-bindings: display: panel: Add binding docume=
nt for Ilitek Ili9341<br>
<br>
Patch separation looks good.<br>
Please cc: me on both the binding and the panel patches.<br>
The binding must be in DT Schema format (.yaml).<br>
See a lot of examples in drm-misc-next for inspiration.<br>
<br>
Looks forward to see/review your submission.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sam<br></blockquote><div><br></div><div>hi Sam,=
</div><div><br></div><div>just sumbmit a patchset about ltdc with ili-9341 =
support on stm32f429-disco board, with yaml</div><div>documents inside as w=
ell.</div><div><br></div><div>thanks,</div><div><br></div><div>Dillon,=C2=
=A0</div></div></div>

--00000000000038cea005a4f51d70--

--===============1139044243289956993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1139044243289956993==--
