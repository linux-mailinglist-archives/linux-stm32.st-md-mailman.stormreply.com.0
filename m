Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4D0A31274
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2025 18:09:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F1A5C7A820;
	Tue, 11 Feb 2025 17:09:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 178D1C78F9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 17:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739293752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6KqtiPP9cAbKw9pLfJEtjIYHOv1qD2Gmu69RxwYEKDs=;
 b=ERypdz9/HgePkHbYSQ2eHs25/7AKSc3j7kPNsB9II0YoSFDoQn/N2Iu6nBtdgSbutIVbem
 zSMymg+9T8Ow7VwKYesMgIBCYAFRBYqdOrxM6m8xQPNr0e9Wpy1/B2tOwkh2iK9KwbPPbI
 v7ljWYYzTaQxjF+REq/RGZ4FmA2FkpA=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-KDgHqxfpMbqWSeyLAjDBow-1; Tue, 11 Feb 2025 12:09:10 -0500
X-MC-Unique: KDgHqxfpMbqWSeyLAjDBow-1
X-Mimecast-MFC-AGG-ID: KDgHqxfpMbqWSeyLAjDBow_1739293750
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-6f2bc451902so81719647b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 09:09:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739293750; x=1739898550;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6KqtiPP9cAbKw9pLfJEtjIYHOv1qD2Gmu69RxwYEKDs=;
 b=f6oagNS6RDRcu4CGi6H0dG+sTjlUf7naEnYDmmkdaaSIjBT+yVfv+z+pXPnF5ydWRF
 4lZdoVNf5ajYaWQAWAPly+nQQyrflNMroqcpKwXLajLc27ntC5rmc/jaxinP6T9iqoQc
 oJ/0owonWOlFuJUM2tKPH320OsVGCDiFbuKm4a7cKg1eTyv7WLGi4ea7hPfGzwsZwxv0
 5R/EXXUBE+lik1glm0xEImeNZy5fsAazxVMFNLPoIWFaYFSbRODKIPaZPG0Kfxv13lCv
 S0HwlIfQmmWvKBuSCqWDFRYPJAHUUBxZpnvFU6rU1/xcYil6LUCbIk1QsPK2M0PbK1PD
 REFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd1hKDSl22+Xfrr6AbPeaqwYz2/5i2jCLNhAojywCbjK7iCGFYyoLBWwW+26Uu2i5hUv6PpJ/Fcmks7A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwuEXJjtDLdQE5jzRaMDnosSOFH8oZKonkQOi9JOIdpTtUfJBl2
 dQhjk+NoTo400qM2DGOo5qhxWQW0AkTlRsd3IoFjm6Jxxi+zWbk4hb9/BMmZWoo2FJ+K07Xa8sn
 atk/JifnfE77qvjAUBFWtClDSnGB6MNxnXew+AxGpbcyCZlx78drxRYniq288NVtEHTKLig/TOF
 PtVBZqGxrNRjju/dcrAkp55UPjj13TsZS2o97P3QMaDqAytglt1q+f
X-Gm-Gg: ASbGncuvbvhVrYeQHTk4JRLm8TJt8khljfbnarbNH75IHp4Wj3Z4UyKom5kgRPu/XlM
 tLe7FG/1ObahqcEFDC1YqT6JmEvpj0Ei0MxrMNW6XiTs0/TwfTD1ey2GDTvRB
X-Received: by 2002:a05:690c:620b:b0:6f7:598d:34c2 with SMTP id
 00721157ae682-6fb1f68334dmr2317447b3.24.1739293749953; 
 Tue, 11 Feb 2025 09:09:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfKa1KCPRXDPfQeav0M9USwT61j5FjOY5ty4cMA/v4gmNerkCy0F091v6rJjoChnCBHioJN5La+YrVT3vOwcs=
X-Received: by 2002:a05:690c:620b:b0:6f7:598d:34c2 with SMTP id
 00721157ae682-6fb1f68334dmr2315547b3.24.1739293748119; Tue, 11 Feb 2025
 09:09:08 -0800 (PST)
MIME-Version: 1.0
References: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
 <20250205-mem-cocci-newapi-v1-11-aebf2b0e2300@redhat.com>
 <20250206-hallowed-ultra-tiger-cfec8e@houat>
In-Reply-To: <20250206-hallowed-ultra-tiger-cfec8e@houat>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 11 Feb 2025 12:08:57 -0500
X-Gm-Features: AWEUYZnpF-xtMX2zoqL1SmW6M0UxWIfNDoln_2D_Wz78SFwXrsyRItY4Zv4vDPk
Message-ID: <CAN9Xe3SpTG7r2UkN7_pH0uMXhU5u+dkWhaM9+w5VyOQZp9byNg@mail.gmail.com>
To: Maxime Ripard <mripard@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Rn_wzYXMvk7MJPclp1dgncOVvbv5mF5tsusafpV0n1U_1739293750
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
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Tian Tao <tiantao6@hisilicon.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-stm32@st-md-mailman.stormreply.com, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Yongqin Liu <yongqin.liu@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 11/12] drm/vc4: move to
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
Content-Type: multipart/mixed; boundary="===============7360512433006078081=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============7360512433006078081==
Content-Type: multipart/alternative; boundary="00000000000004607d062de0e274"

--00000000000004607d062de0e274
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 11:13=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:

> On Wed, Feb 05, 2025 at 03:08:07PM -0500, Anusha Srivatsa wrote:
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
> > <+...
> > -res =3D platform_get_resource_byname(pdev,mem,name);
> > <...
> > -if (!res) {
> > -...
> > -}
> > ...>
> > -ioremap =3D devm_ioremap(...);
> > +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);
> > ...+>
> >
> > v2: Change the SmPl patch to work on multiple occurences of
> > the pattern. This also fixes the compilation error.
> >
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Cc: Ma=C3=ADra Canal <mcanal@igalia.com>
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 55
> +++++++++++-------------------------------
> >  1 file changed, 14 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c
> b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index
> 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..066f1246dab420ee889845b0c573d80=
ce7c88595
> 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -2951,71 +2951,44 @@ static int vc5_hdmi_init_resources(struct
> drm_device *drm,
> >  {
> >       struct platform_device *pdev =3D vc4_hdmi->pdev;
> >       struct device *dev =3D &pdev->dev;
> > -     struct resource *res;
> >       int ret;
> >
> > -     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hdmi"=
);
> > -     if (!res)
> > -             return -ENODEV;
> > -
> > -     vc4_hdmi->hdmicore_regs =3D devm_ioremap(dev, res->start,
> > -                                            resource_size(res));
> > +     vc4_hdmi->hdmicore_regs =3D
> devm_platform_ioremap_resource_byname(pdev,
> > +
>  "hdmi");
> >       if (!vc4_hdmi->hdmicore_regs)
> >               return -ENOMEM;
> >
> > -     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hd");
> > -     if (!res)
> > -             return -ENODEV;
> > -
> > -     vc4_hdmi->hd_regs =3D devm_ioremap(dev, res->start,
> resource_size(res));
> > +     vc4_hdmi->hd_regs =3D devm_platform_ioremap_resource_byname(pdev,
> "hd");
> >       if (!vc4_hdmi->hd_regs)
> >               return -ENOMEM;
>
> I *think* that one is shared between both HDMI controllers on the
> RaspberryPi4, so we can't claim them from both instances. We should add
> a comment there to document that it's on purpose.
>
> How about vc4_hdmi->hdmicore_regs? It also has another instance
vc4_hdmi_init_resources(). Looks like that also doesnt need any converting
and shold be left as is.

Anusha

> The rest looks good.
>
> Maxime
>

--00000000000004607d062de0e274
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 6, =
2025 at 11:13=E2=80=AFAM Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel=
.org">mripard@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Wed, Feb 05, 2025 at 03:08:07PM -0500, Anusha Sr=
ivatsa wrote:<br>
&gt; Replace platform_get_resource_byname + devm_ioremap_resource<br>
&gt; with just devm_platform_ioremap_resource()<br>
&gt; <br>
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
&gt; &lt;+...<br>
&gt; -res =3D platform_get_resource_byname(pdev,mem,name);<br>
&gt; &lt;...<br>
&gt; -if (!res) {<br>
&gt; -...<br>
&gt; -}<br>
&gt; ...&gt;<br>
&gt; -ioremap =3D devm_ioremap(...);<br>
&gt; +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);<br>
&gt; ...+&gt;<br>
&gt; <br>
&gt; v2: Change the SmPl patch to work on multiple occurences of<br>
&gt; the pattern. This also fixes the compilation error.<br>
&gt; <br>
&gt; Cc: Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.org" target=3D"=
_blank">mripard@kernel.org</a>&gt;<br>
&gt; Cc: Dave Stevenson &lt;<a href=3D"mailto:dave.stevenson@raspberrypi.co=
m" target=3D"_blank">dave.stevenson@raspberrypi.com</a>&gt;<br>
&gt; Cc: Ma=C3=ADra Canal &lt;<a href=3D"mailto:mcanal@igalia.com" target=
=3D"_blank">mcanal@igalia.com</a>&gt;<br>
&gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.c=
om" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/vc4/vc4_hdmi.c | 55 +++++++++++-----------------=
--------------<br>
&gt;=C2=A0 1 file changed, 14 insertions(+), 41 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_=
hdmi.c<br>
&gt; index 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..066f1246dab420ee889845=
b0c573d80ce7c88595 100644<br>
&gt; --- a/drivers/gpu/drm/vc4/vc4_hdmi.c<br>
&gt; +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c<br>
&gt; @@ -2951,71 +2951,44 @@ static int vc5_hdmi_init_resources(struct drm_=
device *drm,<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct platform_device *pdev =3D vc4_hdmi-&g=
t;pdev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;dev;<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource_byname(pdev, IORESO=
URCE_MEM, &quot;hdmi&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!res)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0vc4_hdmi-&gt;hdmicore_regs =3D devm_ioremap(dev, =
res-&gt;start,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 resource_size(res));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vc4_hdmi-&gt;hdmicore_regs =3D devm_platform_iore=
map_resource_byname(pdev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;hdmi&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vc4_hdmi-&gt;hdmicore_regs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<=
br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource_byname(pdev, IORESO=
URCE_MEM, &quot;hd&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!res)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0vc4_hdmi-&gt;hd_regs =3D devm_ioremap(dev, res-&g=
t;start, resource_size(res));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vc4_hdmi-&gt;hd_regs =3D devm_platform_ioremap_re=
source_byname(pdev, &quot;hd&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vc4_hdmi-&gt;hd_regs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<=
br>
<br>
I *think* that one is shared between both HDMI controllers on the<br>
RaspberryPi4, so we can&#39;t claim them from both instances. We should add=
<br>
a comment there to document that it&#39;s on purpose.<br>
<br></blockquote><div>How about vc4_hdmi-&gt;hdmicore_regs? It also has ano=
ther instance vc4_hdmi_init_resources(). Looks like that also doesnt need a=
ny converting and shold be left as is.</div><div><br></div><div>Anusha<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
The rest looks good.<br>
<br>
Maxime<br>
</blockquote></div></div>

--00000000000004607d062de0e274--


--===============7360512433006078081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7360512433006078081==--

