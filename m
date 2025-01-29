Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5C0A22382
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 19:00:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83E1CC7803C;
	Wed, 29 Jan 2025 18:00:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E00DC78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 18:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738173622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nqyDkjvRUysrwh4PELuHmLTFtieFiuB96Vrt8jInMXw=;
 b=DOQ76sYlMNCTPDYSc2bow1cnXCLpefLGSpfVtE0ujqJcRErPELJcxbd7lOZdFvdMWg1uke
 lzRJT0V2T+qgyglSHPi3hxekH9cAk+PqFdIKBt29CuVmx/Z59dONPCVvTjn0Itme3Xbf3t
 OIRWPtZufVgrze9jCAvj1ZU4Xa6zErc=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-4m_eor3VMzS0x0XqIztl7g-1; Wed, 29 Jan 2025 13:00:19 -0500
X-MC-Unique: 4m_eor3VMzS0x0XqIztl7g-1
X-Mimecast-MFC-AGG-ID: 4m_eor3VMzS0x0XqIztl7g
Received: by mail-yb1-f197.google.com with SMTP id
 3f1490d57ef6-e3a0f608b88so16628063276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 10:00:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738173618; x=1738778418;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nqyDkjvRUysrwh4PELuHmLTFtieFiuB96Vrt8jInMXw=;
 b=h6kNBXq71SE9JC/cThbhrTA1cjUKhy8yCeNeUAE6g0aj9LNhRJ+CZG6toJllID+Jr4
 y/VQen7HdVg1qApzjSwo7yym+dJIDmIZy+br5Gd/Hu1uZM4cFz50Au97/AmVNjNY2IXo
 /zM7FttsgzeIsJa270AXh1ZDw5iBR7IFB+FV4ox/3lY1o4MU/Z7oHdAjXzCHgAKZm6zW
 4co2g8aSlYcJA8lQ1sFh8ar1qSau24vy72QqZjNy/ATyS4rnC0sq5L5ChhYSffad/d4u
 b+kJ7ofMQOHhyePy/ivEU7sRb3zMwM5WDvr41f7fJYHNjMGEEbQJ4q86/SXtJmbcWObB
 XakA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJSrdSIlOzc7zZxBEeS2BDR8MOLbQS2CfBYVnWb0tWeVvZBZKyIVMl4LYPcK1DV4pzMFR0YHmNhaeT1A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxXbI+aQTk4YA8aAw0FPOtRXmZchVvE5tiQ+nPmWSYANkvPggqM
 8Dsz7snfyOr4NBO/lkPSPTtBxkwF6v3NuYUGOZP3f3lU/3mGfGzlFCGUANuQL0Adc6uG8mWPqlf
 2TFCPkYVQsYUT/mALlNe7FgxxJtfXtBYnVWB3G+gUWvp6NJOmc8DxDDRr2IWxBESW1ayZxBJCG3
 cqSCzXPHkAxgN3k6TWHdP6w1fukfX8OycT1JzayR3Z2FUCO7HQhQtc
X-Gm-Gg: ASbGncseRO3XQPx1P5Ffdmi/6kZD2aWSztGDF8YGKCQqmYE4jYjcXPyYgzHznpiAzNj
 vmX7zO7ok9gNU6WHTp/yoZ5uHPdyqB2SlKBPEYnNYCpCbw2hadKufrWNCDxqM
X-Received: by 2002:a05:690c:6b0e:b0:6ef:8c41:dee0 with SMTP id
 00721157ae682-6f7a837a551mr33579937b3.20.1738173618120; 
 Wed, 29 Jan 2025 10:00:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNwNDB7SeoR2hOqJ83NGvf+7/6aagiTUDM5yFm91TKvfpUEtQemjfCIOkHEzx0pR6XBCyUXQDsQ7LBiLTNnPI=
X-Received: by 2002:a05:690c:6b0e:b0:6ef:8c41:dee0 with SMTP id
 00721157ae682-6f7a837a551mr33578737b3.20.1738173617562; Wed, 29 Jan 2025
 10:00:17 -0800 (PST)
MIME-Version: 1.0
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-13-0d1609a29587@redhat.com>
 <CAPY8ntBvJpSFhOwqBPmiN59Z0EpienEm-=M-euHdQU8XLGgXUA@mail.gmail.com>
In-Reply-To: <CAPY8ntBvJpSFhOwqBPmiN59Z0EpienEm-=M-euHdQU8XLGgXUA@mail.gmail.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 29 Jan 2025 13:00:06 -0500
X-Gm-Features: AWEUYZkNBFsPsHrKCDC5xJ-gNE5tqY69PNKeLsi61kNwK-N1agru8qUFF63-ZWw
Message-ID: <CAN9Xe3SbqYNqZzPtywWOX3Uj3a76GT7pDBwaa=YM2zWAcGj8Gg@mail.gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tCkbIinjP5oqzhL8pCbiJs7J1W4iXjE5ioPFarZ6gVo_1738173618
X-Mimecast-Originator: redhat.com
Cc: imx@lists.linux.dev, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Xinliang Liu <xinliang.liu@linaro.org>, Stefan Agner <stefan@agner.ch>,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>,
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Simona Vetter <simona@ffwll.ch>, Marek Vasut <marex@denx.de>,
 Jonathan Corbet <corbet@lwn.net>, Kevin Hilman <khilman@baylibre.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@gmail.com>, Tian Tao <tiantao6@hisilicon.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Yongqin Liu <yongqin.liu@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 13/14] drm/vc4: move to
	devm_platform_ioremap_resource() usage
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
Content-Type: multipart/mixed; boundary="===============6098345075788185812=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============6098345075788185812==
Content-Type: multipart/alternative; boundary="000000000000087f3b062cdc15a4"

--000000000000087f3b062cdc15a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 8:18=E2=80=AFAM Dave Stevenson <
dave.stevenson@raspberrypi.com> wrote:

> Hi Anusha
>
> On Tue, 28 Jan 2025 at 22:33, Anusha Srivatsa <asrivats@redhat.com> wrote=
:
> >
> > Replace platform_get_resource_byname + devm_ioremap_resource
> > with just devm_platform_ioremap_resource()
> >
> > Used Coccinelle to do this change. SmPl patch:
> > //rule s/(devm_)platform_get_resource_byname +
> > //(devm_)ioremap/devm_platform_ioremap_resource.
> > @rule_3@
> > identifier res;
> > expression ioremap;
> > identifier pdev;
> > constant mem;
> > expression name;
> > @@
> > -struct resource *res;
> > ...
> > -res =3D platform_get_resource_byname(pdev,mem,name);
> > <...
> > -if (!res) {
> > -...
> > -}
> > ...>
> > -ioremap =3D devm_ioremap(...);
> > +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);
> >
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Cc: "Ma=C3=ADra Canal" <mcanal@igalia.com>
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 9 ++-------
> >  1 file changed, 2 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c
> b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index
> 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..e22733f8159aa4b247a915e24a236f6=
20bae932c
> 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -2951,15 +2951,10 @@ static int vc5_hdmi_init_resources(struct
> drm_device *drm,
> >  {
> >         struct platform_device *pdev =3D vc4_hdmi->pdev;
> >         struct device *dev =3D &pdev->dev;
> > -       struct resource *res;
> >         int ret;
> >
> > -       res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hdm=
i");
> > -       if (!res)
> > -               return -ENODEV;
> > -
> > -       vc4_hdmi->hdmicore_regs =3D devm_ioremap(dev, res->start,
> > -                                              resource_size(res));
> > +       vc4_hdmi->hdmicore_regs =3D
> devm_platform_ioremap_resource_byname(pdev,
> > +
>  "hdmi");
>
> Whilst I totally agree with this change, why was only one of the 8
> instances of this pattern within this function updated? Is that a
> limitation in your script?
>
> https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/vc4/vc4_hdm=
i.c#L2957-L3020
>
>
Yes! looks like it is. My script is missing one set of ellipses which makes
it apply the rule only to the first appearance of the pattern. Will rectify
this. Thanks!!

Anusha

>   Dave
>
> >         if (!vc4_hdmi->hdmicore_regs)
> >                 return -ENOMEM;
> >
> >
> > --
> > 2.47.0
> >
>
>

--000000000000087f3b062cdc15a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 29,=
 2025 at 8:18=E2=80=AFAM Dave Stevenson &lt;<a href=3D"mailto:dave.stevenso=
n@raspberrypi.com">dave.stevenson@raspberrypi.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hi Anusha<br>
<br>
On Tue, 28 Jan 2025 at 22:33, Anusha Srivatsa &lt;<a href=3D"mailto:asrivat=
s@redhat.com" target=3D"_blank">asrivats@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Replace platform_get_resource_byname + devm_ioremap_resource<br>
&gt; with just devm_platform_ioremap_resource()<br>
&gt;<br>
&gt; Used Coccinelle to do this change. SmPl patch:<br>
&gt; //rule s/(devm_)platform_get_resource_byname +<br>
&gt; //(devm_)ioremap/devm_platform_ioremap_resource.<br>
&gt; @rule_3@<br>
&gt; identifier res;<br>
&gt; expression ioremap;<br>
&gt; identifier pdev;<br>
&gt; constant mem;<br>
&gt; expression name;<br>
&gt; @@<br>
&gt; -struct resource *res;<br>
&gt; ...<br>
&gt; -res =3D platform_get_resource_byname(pdev,mem,name);<br>
&gt; &lt;...<br>
&gt; -if (!res) {<br>
&gt; -...<br>
&gt; -}<br>
&gt; ...&gt;<br>
&gt; -ioremap =3D devm_ioremap(...);<br>
&gt; +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);<br>
&gt;<br>
&gt; Cc: Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.org" target=3D"=
_blank">mripard@kernel.org</a>&gt;<br>
&gt; Cc: Dave Stevenson &lt;<a href=3D"mailto:dave.stevenson@raspberrypi.co=
m" target=3D"_blank">dave.stevenson@raspberrypi.com</a>&gt;<br>
&gt; Cc: &quot;Ma=C3=ADra Canal&quot; &lt;<a href=3D"mailto:mcanal@igalia.c=
om" target=3D"_blank">mcanal@igalia.com</a>&gt;<br>
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 ++-------<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 7 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_=
hdmi.c<br>
&gt; index 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..e22733f8159aa4b247a915=
e24a236f620bae932c 100644<br>
&gt; --- a/drivers/gpu/drm/vc4/vc4_hdmi.c<br>
&gt; +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c<br>
&gt; @@ -2951,15 +2951,10 @@ static int vc5_hdmi_init_resources(struct drm_=
device *drm,<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct platform_device *pdev =3D vc4_=
hdmi-&gt;pdev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;=
dev;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource_byname(pdev,=
 IORESOURCE_MEM, &quot;hdmi&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!res)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV=
;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0vc4_hdmi-&gt;hdmicore_regs =3D devm_iorema=
p(dev, res-&gt;start,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 resource_size(res));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vc4_hdmi-&gt;hdmicore_regs =3D devm_platfo=
rm_ioremap_resource_byname(pdev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;hdmi&quot;);<br>
<br>
Whilst I totally agree with this change, why was only one of the 8<br>
instances of this pattern within this function updated? Is that a<br>
limitation in your script?<br>
<a href=3D"https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/vc=
4/vc4_hdmi.c#L2957-L3020" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/torvalds/linux/blob/master/drivers/gpu/drm/vc4/vc4_hdmi.c#L2957-L302=
0</a><br>
<br></blockquote><div><br></div><div>Yes! looks like it is. My script is mi=
ssing one set of ellipses which makes it apply the rule only to the first a=
ppearance of the pattern. Will rectify this. Thanks!!</div><div><br></div><=
div>Anusha<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 Dave<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vc4_hdmi-&gt;hdmicore_regs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -E=
NOMEM;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; 2.47.0<br>
&gt;<br>
<br>
</blockquote></div></div>

--000000000000087f3b062cdc15a4--


--===============6098345075788185812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6098345075788185812==--

