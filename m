Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 052AFA76B31
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Mar 2025 17:50:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5751C78F90;
	Mon, 31 Mar 2025 15:50:00 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F16B2C78F8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Mar 2025 15:49:58 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5ed43460d6bso7651407a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Mar 2025 08:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743436198; x=1744040998;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fYNQzryO1zq/02eTy3ftbmbxWrnm/nAtju28Otm/kYo=;
 b=JoYSgCw/48ELOHDBNmw8wu0UXzM2xVFaKdmkkEL/MS4lJf4sTBZzhHiVQoh0nKqgN3
 3skEp+byK6V5YUbIs7hj2y0qxlL1xp7K4Eeui9abow/rwZkM9K5Ru+UHXJHcs2g+OHCJ
 t4hU708NDUmHQC75FFdaX3SkwHUdSytgj7L61c6Y3MNokWc5OtBH2o7iwhaRutycg6bg
 W0p8mBZx01D1OWPB7e8CNkN2Q59lZTqO8bidxgpk4fQ5AsWolXh7u+inAfY1DLK6Rdcz
 fzaW41iodr27XW86adGU22LUEUXlWhYrqGs+odu4qYgWdJveozi0QJUHD/5lIklgqVVo
 z9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743436198; x=1744040998;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fYNQzryO1zq/02eTy3ftbmbxWrnm/nAtju28Otm/kYo=;
 b=ehW9hDQBrVIuLqA5lqrSysCvDNBo9FHQperqJD7oyajxkiNnK6alhtcI6GIRo2WwFp
 ie1viCsob70P3Hp57HH122n3dIM7wBmTxkDCXZseQtKjtzRDewXRPwdZpJvZQi2pGoVz
 MpkeIX6cGD5WiXC6/xgj7vZ3TCtUkX/tbcyZIjcMH3KPrYP6AkH4YgicWveevYynxMF3
 4Tyvb+yCeG0m95zxWR0tIbnSWwhw8Fmze8VfyX1DJ5CuY+hBMfNAC6dyDABOmKkwEK8p
 hghz9a+GM+MnB2n1FBTM2mAu+rcTeaLi7c383Ovr7Hrt3fzTrDnm1sph6NLPDozbLlLG
 +DPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbrb7GLsRB4KZjWqqab3QwiPrPPQi8iCH2XvIOHKaqU45cOJU6Ik9CqTK9NnfXfZw0iVdg4OQC275/6w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzwKH+BI23bqJ43xyO/m1YsXG25FO1bylOa0DOVE6yUAGaUeRLa
 6IfyLVpd4of7CqQeK1gES7+BCLC+M3pQ63F38twVTmSaHCI+ypQo9Kzorh6l1BkDWFcsPzxPzZi
 Gth78wdcoW5JoX4oIXW+4SHxVNUsI9hfiEmBhZQ==
X-Gm-Gg: ASbGncua73dWzvCvKwwd8cjF8QoLfT8Mc8mUyWoXpUITHvxSVAVF/4bGdjz4aDeawSQ
 Zd7IcKPfjPE1a33dm+SnP6Gi78doMjd3fEPho9UPFqdWFlXjX8IkndwXt2YZhWIXaPvSngNAP2/
 IbegxzTuuJjtkyI5BhpDFOo4NNutVh3dsb6Woox5XJReM+oCTtRcd0I+w9/yZ8
X-Google-Smtp-Source: AGHT+IEvux5mHCq/V/VknpZQ/zI405wi60rjroeO72DCD062Bxomwf4KOLLRY41/WQwUumot1ruQyMusyKxHk0VV9e0=
X-Received: by 2002:a05:6402:3488:b0:5e5:bfab:51f with SMTP id
 4fb4d7f45d1cf-5edfb467613mr7968796a12.0.1743436198209; Mon, 31 Mar 2025
 08:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250327082721.641278-1-arnaud.pouliquen@foss.st.com>
In-Reply-To: <20250327082721.641278-1-arnaud.pouliquen@foss.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 31 Mar 2025 09:49:46 -0600
X-Gm-Features: AQ5f1Jqu2Zvqr2kI8wBHkXpjUI2TdO7TBDnuPupUipDzu7tXOH0M6kAo9_VQNOE
Message-ID: <CANLsYkx9GS4ctP1e+bBkUcpBh-Fzj38O-av_VKt9WSFS1VJ1Bg@mail.gmail.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/2] stm32-rproc: Add firmware-name DT
	property support
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
Content-Type: multipart/mixed; boundary="===============8458041913904651697=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============8458041913904651697==
Content-Type: multipart/alternative; boundary="0000000000004885e30631a55f6a"

--0000000000004885e30631a55f6a
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 02:30, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
wrote:

> Add flexibility by supporting the optional "firmware-name" property.
>
> This allows specifying in the device tree the firmware that needs to
> be loaded on boot, if the "st,auto-boot" DT property is set.
>
> Arnaud Pouliquen (2):
>   dt-bindings: remoteproc: stm32-rproc: Add firmware-name property
>   drivers: remoteproc: stm32_rproc: Allow to specify firmware default
>     name
>
>  .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml    | 4 ++++
>  drivers/remoteproc/stm32_rproc.c                          | 8 +++++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
>
I will apply this set when 6.15-rc1 comes out.

Thanks,
Mathieu


> base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
> --
> 2.25.1
>
>

--0000000000004885e30631a55f6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 27 Mar 2025 at 02:30,=
 Arnaud Pouliquen &lt;<a href=3D"mailto:arnaud.pouliquen@foss.st.com">arnau=
d.pouliquen@foss.st.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Add flexibility by supporting the optional &quot;fir=
mware-name&quot; property.<br>
<br>
This allows specifying in the device tree the firmware that needs to<br>
be loaded on boot, if the &quot;st,auto-boot&quot; DT property is set.<br>
<br>
Arnaud Pouliquen (2):<br>
=C2=A0 dt-bindings: remoteproc: stm32-rproc: Add firmware-name property<br>
=C2=A0 drivers: remoteproc: stm32_rproc: Allow to specify firmware default<=
br>
=C2=A0 =C2=A0 name<br>
<br>
=C2=A0.../devicetree/bindings/remoteproc/st,stm32-rproc.yaml=C2=A0 =C2=A0 |=
 4 ++++<br>
=C2=A0drivers/remoteproc/stm32_rproc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 8 +++++++-<br>
=C2=A02 files changed, 11 insertions(+), 1 deletion(-)<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">I will apply this set when 6.15-rc1 comes out.</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">Thanks,</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Mathieu</div></div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000004885e30631a55f6a--

--===============8458041913904651697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8458041913904651697==--
