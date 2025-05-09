Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A35AAAB1EC3
	for <lists+linux-stm32@lfdr.de>; Fri,  9 May 2025 23:15:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54524C7A827;
	Fri,  9 May 2025 21:15:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8725C78F9C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 May 2025 21:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746825324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nADWFNkzjtB9Jfn+qaS7u6sG7u22ATf691MD3dUkDrE=;
 b=QVlWeLd4N1dPqy4q8CAQjQmGjclj+S+L7PPIeAO5UMTm2L5iaiN7ec2RGPS+DBMWlz9VFs
 alNchjp310O6MM/RrMWy8hj4EQ8K8JpeLypKFCOea6VAAin1gzQVP6TO8GPytDEmsUsmJq
 i9HUF1LYjyiJuqmqPZDgA8LBVLPlKSg=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-7ZEfo54APPGoVJOAtUcawg-1; Fri, 09 May 2025 17:15:21 -0400
X-MC-Unique: 7ZEfo54APPGoVJOAtUcawg-1
X-Mimecast-MFC-AGG-ID: 7ZEfo54APPGoVJOAtUcawg_1746825321
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-703d7a66d77so40816857b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 May 2025 14:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746825321; x=1747430121;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nADWFNkzjtB9Jfn+qaS7u6sG7u22ATf691MD3dUkDrE=;
 b=NXT5JZVdfP9Q1KbkfkLqaVcBf9SHf+Bi0Nn1fLYQ/8LUndQL/6rt7XjDGZQh7f9iZu
 mEReK+xGXFATtRr0rTuujyY6qWk4c7dgkajgloWY+cBrU2SosfmRJSS/INAdydwm/fRJ
 wtBe6KL3USWVxJX5H15i9RygyLLoOVdHS5/DOUf0MRs3ZrexJztlyk7DC+X9bjP20P0m
 WZSMd909gw5CcAasjxsQnuoUcr8PSotk/y3e1QK5QnvuSLJPV+XMJsrnrU1RGjilzFUw
 ynYe3czIFAo/PeGjFXIONsKH8Hy5Fp34T+nQdvfLP5eWCGqi23UVpG+4A6SiRB6B/ZHm
 b9TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/bW4ZwBMG6J0dF3qxhAb39hhvzOFKTNlUgLpFsGAxOtArYoEj8rdACdYHSVeZMZRvzUV7WdwNA5guCg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw9qsyuq+WbdGm4UNSlajp/B1suYQkRfGpLktgKzF1z3zp07BMa
 TtdrBeaGr07dscZqgAiFkl5sEECoNvlS1LSSdAQK8UbZZYg6WHYW2UopYpmvz/U4pknRmL2KLlr
 GQOr/MtRNXN4FcufWjrWN5iBAzhjxCE24mqN/r6r31lDO2i+iXeTEo4LaZZZbMR3CQeVtEQxLPa
 ZmbLrvq85tn7vKsvv96dqTvDGn4kPp1XpZcW3ZzZX2pJglIuNYe0A1
X-Gm-Gg: ASbGncsDIDyIVJ3gLWfAs/0oYB8jRp7XULz+ebyYgtbVmlvg1k5tLTsvO+KVNyl5PME
 mabDfmfOVzlNOU0tVhdYBPMNtN9d8LCOnc3qFWFE6eCFkoDz+65jmPxQJWTu8vfhNE7k=
X-Received: by 2002:a05:690c:314:b0:6fe:c2b4:f099 with SMTP id
 00721157ae682-70a2caaff36mr121893477b3.7.1746825320857; 
 Fri, 09 May 2025 14:15:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDppELatHWApVBTbp/y0X7WZ9jAfvXOg+6Uo9FOaf+Dx2WgFQUjAVJ0M31TRzpZ6Ak/8kII08lb0sxuJedJKU=
X-Received: by 2002:a05:690c:314:b0:6fe:c2b4:f099 with SMTP id
 00721157ae682-70a2caaff36mr121892917b3.7.1746825320418; Fri, 09 May 2025
 14:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-8-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-8-b8bc1f16d7aa@bootlin.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 9 May 2025 16:12:00 -0400
X-Gm-Features: AX0GCFvkeMsWo0PkdeGNZVPSEOEq27001W3hGFbQbs-mb7RlOGMt0yubyvY0ySM
Message-ID: <CAN9Xe3QFFr-igXdknR9iuTk1YPYUAjjANBdYsB_sT7rzvRS1jA@mail.gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7ckbxgxBwlfbQO--Fi293r43AzyBCvMMdg5rGYCnbFY_1746825321
X-Mimecast-Originator: redhat.com
Cc: imx@lists.linux.dev, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Simona Vetter <simona@ffwll.ch>,
 chrome-platform@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Paul Kocialkowski <paulk@sys-base.io>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 "Rob Herring \(Arm\)" <robh@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Hui Pu <Hui.Pu@gehealthcare.com>,
 linux-amlogic@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 asahi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 08/22] drm/omap: dss: dpi: convert to
 devm_drm_bridge_alloc() API
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
Content-Type: multipart/mixed; boundary="===============0490737353447737231=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============0490737353447737231==
Content-Type: multipart/alternative; boundary="000000000000b567400634ba7651"

--000000000000b567400634ba7651
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 9:56=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootlin=
.com>
wrote:

> This is the new API for allocating DRM bridges.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> ---
>
> Cc: "Rob Herring (Arm)" <robh@kernel.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dpi.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c
> b/drivers/gpu/drm/omapdrm/dss/dpi.c
> index
> 6eff97a091602f6d137095b3b7bf54fce17e8d3e..9f86db774c395db7e3396cbf2694748=
fc23c309d
> 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dpi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
> @@ -562,7 +562,6 @@ static const struct drm_bridge_funcs dpi_bridge_funcs
> =3D {
>
>  static void dpi_bridge_init(struct dpi_data *dpi)
>  {
> -       dpi->bridge.funcs =3D &dpi_bridge_funcs;
>         dpi->bridge.of_node =3D dpi->pdev->dev.of_node;
>         dpi->bridge.type =3D DRM_MODE_CONNECTOR_DPI;
>
> @@ -707,9 +706,9 @@ int dpi_init_port(struct dss_device *dss, struct
> platform_device *pdev,
>         u32 datalines;
>         int r;
>
> -       dpi =3D devm_kzalloc(&pdev->dev, sizeof(*dpi), GFP_KERNEL);
> -       if (!dpi)
> -               return -ENOMEM;
> +       dpi =3D devm_drm_bridge_alloc(&pdev->dev, struct dpi_data, bridge=
,
> &dpi_bridge_funcs);
> +       if (IS_ERR(dpi))
> +               return PTR_ERR(dpi);
>
>         ep =3D of_graph_get_next_port_endpoint(port, NULL);
>         if (!ep)
>
>
Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>

Thanks,
Anusha

> --
> 2.49.0
>
>

--000000000000b567400634ba7651
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 9, =
2025 at 9:56=E2=80=AFAM Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@b=
ootlin.com">luca.ceresoli@bootlin.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">This is the new API for allocating DRM=
 bridges.<br>
<br>
Signed-off-by: Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@bootlin.co=
m" target=3D"_blank">luca.ceresoli@bootlin.com</a>&gt;<br>
<br>
---<br>
<br>
Cc: &quot;Rob Herring (Arm)&quot; &lt;<a href=3D"mailto:robh@kernel.org" ta=
rget=3D"_blank">robh@kernel.org</a>&gt;<br>
Cc: Helge Deller &lt;<a href=3D"mailto:deller@gmx.de" target=3D"_blank">del=
ler@gmx.de</a>&gt;<br>
Cc: Kuninori Morimoto &lt;<a href=3D"mailto:kuninori.morimoto.gx@renesas.co=
m" target=3D"_blank">kuninori.morimoto.gx@renesas.com</a>&gt;<br>
Cc: Tomi Valkeinen &lt;<a href=3D"mailto:tomi.valkeinen@ideasonboard.com" t=
arget=3D"_blank">tomi.valkeinen@ideasonboard.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/omapdrm/dss/dpi.c | 7 +++----<br>
=C2=A01 file changed, 3 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/ds=
s/dpi.c<br>
index 6eff97a091602f6d137095b3b7bf54fce17e8d3e..9f86db774c395db7e3396cbf269=
4748fc23c309d 100644<br>
--- a/drivers/gpu/drm/omapdrm/dss/dpi.c<br>
+++ b/drivers/gpu/drm/omapdrm/dss/dpi.c<br>
@@ -562,7 +562,6 @@ static const struct drm_bridge_funcs dpi_bridge_funcs =
=3D {<br>
<br>
=C2=A0static void dpi_bridge_init(struct dpi_data *dpi)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dpi-&gt;bridge.funcs =3D &amp;dpi_bridge_funcs;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dpi-&gt;bridge.of_node =3D dpi-&gt;pdev-&gt;dev=
.of_node;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dpi-&gt;bridge.type =3D DRM_MODE_CONNECTOR_DPI;=
<br>
<br>
@@ -707,9 +706,9 @@ int dpi_init_port(struct dss_device *dss, struct platfo=
rm_device *pdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 datalines;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dpi =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof(=
*dpi), GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dpi)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dpi =3D devm_drm_bridge_alloc(&amp;pdev-&gt;dev=
, struct dpi_data, bridge, &amp;dpi_bridge_funcs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(dpi))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(dpi)=
;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ep =3D of_graph_get_next_port_endpoint(port, NU=
LL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ep)<br>
<br></blockquote><div><br></div><div>Reviewed-by: Anusha Srivatsa &lt;<a hr=
ef=3D"mailto:asrivats@redhat.com">asrivats@redhat.com</a>&gt;</div><div><br=
></div><div>Thanks,</div><div>Anusha=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
-- <br>
2.49.0<br>
<br>
</blockquote></div></div>

--000000000000b567400634ba7651--


--===============0490737353447737231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0490737353447737231==--

