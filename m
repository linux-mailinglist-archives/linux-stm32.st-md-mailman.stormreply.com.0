Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C81A2B3FD
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2025 22:16:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D73A3C78F8C;
	Thu,  6 Feb 2025 21:16:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B168FC78F8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2025 21:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738876583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/LIRhzPa0ziB3G/ikzWEbtqiSuvX/5xBqL7wzBRiH8M=;
 b=O661qaL8jtT4MqJhnsMpTiWf1m9P9VvrA3juwYw79KRR3CIyEMWRWCywStpYSYZ79nJ5+A
 bGGqklp6icHlvhScX1ljJot7C+Xpv+BnuwDNCkdSTHbE1qxmzbFYZBlesofdD9xiA3UGfM
 4ViWiZjbvwyjT8Zksd1YHnPv1dpKLmA=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-QX2ZsJjyODi9zUtceJRNZg-1; Thu, 06 Feb 2025 16:16:22 -0500
X-MC-Unique: QX2ZsJjyODi9zUtceJRNZg-1
X-Mimecast-MFC-AGG-ID: QX2ZsJjyODi9zUtceJRNZg
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-6f28863ff05so26584787b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Feb 2025 13:16:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738876579; x=1739481379;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/LIRhzPa0ziB3G/ikzWEbtqiSuvX/5xBqL7wzBRiH8M=;
 b=NGjuqvhbEE+0xrzca+hY7VhcU+m8enJ99bCQIbj39JL2n638t7BON8EQ3phev3Igso
 wgKwYDPE3Hpo8cDg65UaHZjCrEJ9r3tjv2aYj0pODY09NAQu4/9+rPLZLVaoMVShc2fy
 oTEYvbZT3M9Rir2J9cq0h0EaIZCogNosXb6RmQK5jCwQeefBZrJzls9cGvFrAqCoCs0s
 QOb2nJDK+oc0JnKlcch2gRX743ElMwuxJrBbE+6q5vNsZ0Rcfxb4KETuuyM/CzWJxReH
 GOxegY5h04gPAenWbtyIn48bKLFc4Xmie/DvCN6I1A4zEi4xIQJusX0j4yUW4cEY7UuZ
 GK2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTYf9KC5fIy4M8zgnAcQTEufRJWnhcom9A2kXUbgAebKrt837ql6xCfz/3oip5Vni9QI3NuHobcFQe7A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyqS52d7iAfD3RCGWlPQUgbiK5hi8WHoCyPSvJPBVItX1DWRzKa
 cWECrmdTy4XexGbfFMqLJfwzc5yzlM5XsSW3XOA3SKilOXfuBuCIeDJiy2xKzFYjGD1RJtxYfUI
 Fh/lu2gazhUHRo+NU1XqcaEIQB1aX0KS0idu0oxxtXz1R/L4B/ktyESokJ0W4fC6mTPsSsDJ2wi
 uaHB53P59rWzJQ3WHFDjPgEkoq1ApAwd6Hbsd6mCgS25Uis9OaD8xe
X-Gm-Gg: ASbGncvTDw0FRiRylYsjv7rsGaZNBYcdaVIz1Pc9rxl8RaSqcavM845ocRNwNdcnHHn
 17r4UfwuwWToOV8DZX8D3Q7LK8vpjblaTy1DbzKnLNudBuoVpmIQXYm6KvXqk
X-Received: by 2002:a05:690c:9989:b0:6ef:6fef:4cb6 with SMTP id
 00721157ae682-6f9b233bf8fmr8830577b3.0.1738876578997; 
 Thu, 06 Feb 2025 13:16:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjCqpwPwL+07jYSJFwomed71Bwu5IyhQrsp/e8kjJRvrAsFYgViw9/vssKy4znNo90IGP+LEAAzfLVoH6pYqM=
X-Received: by 2002:a05:690c:9989:b0:6ef:6fef:4cb6 with SMTP id
 00721157ae682-6f9b233bf8fmr8830137b3.0.1738876578666; Thu, 06 Feb 2025
 13:16:18 -0800 (PST)
MIME-Version: 1.0
References: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
 <20250205-mem-cocci-newapi-v1-12-aebf2b0e2300@redhat.com>
 <73bad044-f5fc-40ea-9e32-571912573a5f@suse.de>
In-Reply-To: <73bad044-f5fc-40ea-9e32-571912573a5f@suse.de>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 6 Feb 2025 16:16:07 -0500
X-Gm-Features: AWEUYZk6prfZM1C9-Gul4JSYr8izxGkZAIuEujMIU0-RwOCWKJ-qTeyWBXWPDFc
Message-ID: <CAN9Xe3R=PpKbM=QraFvPMTF+XvBujjxp3XCWtg3Y5+pd+OE1Dw@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sedl-8oopNBUeE8o9AnrjqgtWQnjJ0zfWFNkO00OLTg_1738876579
X-Mimecast-Originator: redhat.com
Cc: imx@lists.linux.dev, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Xinliang Liu <xinliang.liu@linaro.org>, Stefan Agner <stefan@agner.ch>,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>,
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Simona Vetter <simona@ffwll.ch>,
 Marek Vasut <marex@denx.de>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Tian Tao <tiantao6@hisilicon.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-stm32@st-md-mailman.stormreply.com, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Yongqin Liu <yongqin.liu@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 12/12] Documentation: Update the todo
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
Content-Type: multipart/mixed; boundary="===============5555028129184557609=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============5555028129184557609==
Content-Type: multipart/alternative; boundary="000000000000c7abf9062d7fc054"

--000000000000c7abf9062d7fc054
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 2:57=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de>
wrote:

> Hi
>
>
> Am 05.02.25 um 21:08 schrieb Anusha Srivatsa:
> > Update the Documentation to be more precise.
> >
> > v2: Update for clarity
> >
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > ---
> >   Documentation/gpu/todo.rst | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index
> 256d0d1cb2164bd94f9b610a751b907834d96a21..03fcd086889acbd1294669b260292ff=
c79e97e2f
> 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -441,13 +441,13 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>
> >
> >   Level: Intermediate
> >
> > -Request memory regions in all drivers
> > --------------------------------------
> > +Request memory regions in all fbdev drivers
> > +--------------------------------------------
> >
> > -Go through all drivers and add code to request the memory regions that
> the
> > -driver uses. This requires adding calls to request_mem_region(),
> > -pci_request_region() or similar functions. Use helpers for managed
> cleanup
> > -where possible.
> > +Old/ancient fbdev drivers do not request their memory properly.
> > +Go through these drivers and add code to request the memory regions
> that the
> > +driver uses. Problematic areas include hardware that has exclusive
> ranges like
> > +VGA. VGA16fb does not request the range as it is expected.
>
> I'd keep both, old and new text, and turn them into a single paragraph.
> The old text explains what to do and the new text gives examples.
>
>
Sure. Waiting for one final patch to be reviewed(patch 11). With that, I
will make the changes you suggested and re-roll the series.

Thanks for the feedback!

Anusha

> Best regards
> Thomas
> >
> >   Drivers are pretty bad at doing this and there used to be conflicts
> among
> >   DRM and fbdev drivers. Still, it's the correct thing to do.
> >
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
>

--000000000000c7abf9062d7fc054
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 6, =
2025 at 2:57=E2=80=AFAM Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann=
@suse.de">tzimmermann@suse.de</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Hi<br>
<br>
<br>
Am 05.02.25 um 21:08 schrieb Anusha Srivatsa:<br>
&gt; Update the Documentation to be more precise.<br>
&gt;<br>
&gt; v2: Update for clarity<br>
&gt;<br>
&gt; Cc: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de" targe=
t=3D"_blank">tzimmermann@suse.de</a>&gt;<br>
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0Documentation/gpu/todo.rst | 12 ++++++------<br>
&gt;=C2=A0 =C2=A01 file changed, 6 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt; diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst<b=
r>
&gt; index 256d0d1cb2164bd94f9b610a751b907834d96a21..03fcd086889acbd1294669=
b260292ffc79e97e2f 100644<br>
&gt; --- a/Documentation/gpu/todo.rst<br>
&gt; +++ b/Documentation/gpu/todo.rst<br>
&gt; @@ -441,13 +441,13 @@ Contact: Thomas Zimmermann &lt;<a href=3D"mailto=
:tzimmermann@suse.de" target=3D"_blank">tzimmermann@suse.de</a>&gt;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0Level: Intermediate<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -Request memory regions in all drivers<br>
&gt; --------------------------------------<br>
&gt; +Request memory regions in all fbdev drivers<br>
&gt; +--------------------------------------------<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -Go through all drivers and add code to request the memory regions tha=
t the<br>
&gt; -driver uses. This requires adding calls to request_mem_region(),<br>
&gt; -pci_request_region() or similar functions. Use helpers for managed cl=
eanup<br>
&gt; -where possible.<br>
&gt; +Old/ancient fbdev drivers do not request their memory properly.<br>
&gt; +Go through these drivers and add code to request the memory regions t=
hat the<br>
&gt; +driver uses. Problematic areas include hardware that has exclusive ra=
nges like<br>
&gt; +VGA. VGA16fb does not request the range as it is expected.<br>
<br>
I&#39;d keep both, old and new text, and turn them into a single paragraph.=
 <br>
The old text explains what to do and the new text gives examples.<br>
<br></blockquote><div><br></div><div>Sure. Waiting for one final patch to b=
e reviewed(patch 11). With that, I will make the changes you suggested and =
re-roll the series. <br></div><div><br></div><div>Thanks for the feedback!<=
/div><div><br></div><div>Anusha<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
Best regards<br>
Thomas<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0Drivers are pretty bad at doing this and there used to be =
conflicts among<br>
&gt;=C2=A0 =C2=A0DRM and fbdev drivers. Still, it&#39;s the correct thing t=
o do.<br>
&gt;<br>
<br>
-- <br>
--<br>
Thomas Zimmermann<br>
Graphics Driver Developer<br>
SUSE Software Solutions Germany GmbH<br>
Frankenstrasse 146, 90461 Nuernberg, Germany<br>
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman<br>
HRB 36809 (AG Nuernberg)<br>
<br>
</blockquote></div></div>

--000000000000c7abf9062d7fc054--


--===============5555028129184557609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5555028129184557609==--

