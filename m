Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD6FAB1F03
	for <lists+linux-stm32@lfdr.de>; Fri,  9 May 2025 23:22:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C36CEC7A827;
	Fri,  9 May 2025 21:22:49 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2191C78F9C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 May 2025 21:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746825767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LdVqfKmThJm07P0exGRK9hDnCyE1RcHB+N7uNiEdGxE=;
 b=Volft06+s3EWTBTAkoS/vvXLxC1gpj9zbA9STG42uK1ULWD4S77doeKLo7kJxe86QQJqoM
 +Xk6PAKPjXchSRkGLySfSPPHvzh/YeVZDan85BZufK+mZldK7VRu0DJyTzdmnaa9HHhisR
 ZJZpKIlg/2lLwphm470gHXH6yUFLdWE=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-n6AWhYLoNX2dHhI56FvgTw-1; Fri, 09 May 2025 17:22:45 -0400
X-MC-Unique: n6AWhYLoNX2dHhI56FvgTw-1
X-Mimecast-MFC-AGG-ID: n6AWhYLoNX2dHhI56FvgTw_1746825764
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-70a4be14d80so9975737b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 May 2025 14:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746825764; x=1747430564;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LdVqfKmThJm07P0exGRK9hDnCyE1RcHB+N7uNiEdGxE=;
 b=Y4YyRAaIZUSG0V+VvoYAw3ke+ic2Lo/4DmNyXea7IxTX3foceORdLRSFmBwtOwSbis
 Lbdu0JBsIB76y2ajpz6rEvQrVbLkIuGNxB0X/YjNThZiymsG9l0rY7s3IwcvcrFe+Su6
 GuDQQGL/pUnBzA5DWcX5OnajeTic1E0G0kx0frDcS0UbgqIHe4a5LSvcXb802XYh2LxE
 RB2bLVNpgJKoGYeevTZn4uHIhTWOXs8Yj61gOnXjj0FGZCNwPwV9CPFxPp7ygWgRpzDl
 91K9vqEDcos5X60zxFX6nBxQGP4MPQ/Y8Zgy2JRwRdW4gBUc+DJBvbrszKCdbslN0NBK
 nZ3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdsW4vguxUyLtiTVjphZ+VkYKfddm9lBNBF7a0VYbvZra2eoNdaC1mKZ1Gmqbs0LxtMoLSGHo79Fj6nQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzPlvzp2VK6J+4hIS4cAfI2u4nB4RoX/lqKiTA5rkr/NGWMe1oo
 FS6Ie9WrapIY95JxrKZKLB6sK4mqD/j24e/7oWYRRLkJQGorrdyXa33lDrzxSt7gRAiM1pp6p/D
 4ubaZSHmvResav1ppJWMPDahQjuSRmzYpqg6VsEik7lF8rw4Ttq3Te36pASRoLkrfd7veQ2GnQ1
 ot8U5IJ07qpoQ1MoByuTYquxBgz+qjNcIDS1b//Bm8pjCnrrvmIwXk
X-Gm-Gg: ASbGncv5uLxLPdqwqxu/XBSnHIGNewNlAvz3TxZakl45n4wDbC5OjjqGyEmh5QNqBoi
 gdKG2XQALQI+pVI75BRvb/YbY3i9FqtJZhQa3bvkzgWQISO1DtNZO+EYS3Xw8SQXwd1w=
X-Received: by 2002:a05:690c:7009:b0:708:ca5c:a6a8 with SMTP id
 00721157ae682-70a3f9f0da9mr67450557b3.8.1746825764614; 
 Fri, 09 May 2025 14:22:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDopTSrlnJzyCgp+EYSBa6JxbPJx4/LP7OI5Sp1VZU6wuPOj7Hxz+KUeYl6vqorEM3qIF+Lo36tLM2w2wHZDE=
X-Received: by 2002:a05:690c:7009:b0:708:ca5c:a6a8 with SMTP id
 00721157ae682-70a3f9f0da9mr67450257b3.8.1746825764261; Fri, 09 May 2025
 14:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-9-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-9-b8bc1f16d7aa@bootlin.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 9 May 2025 16:19:24 -0400
X-Gm-Features: AX0GCFsNWXW9muWWo4zVoZUeGmeN9R6JfxdUEGKDhysqIg1Bcsv5yzV0yIetNsM
Message-ID: <CAN9Xe3RYD9es-0Zivmg=weZWw-bT4mS_ATTAX7e76ytyyQGPEA@mail.gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3fKVMrOGXg_F2UWn-1Yq6dAt4g3mLfxYwO5xtAeux7c_1746825764
X-Mimecast-Originator: redhat.com
Cc: imx@lists.linux.dev, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Simona Vetter <simona@ffwll.ch>,
 chrome-platform@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
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
Subject: Re: [Linux-stm32] [PATCH v3 09/22] drm/omap: dss: dsi: convert to
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
Content-Type: multipart/mixed; boundary="===============8316558298156730627=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============8316558298156730627==
Content-Type: multipart/alternative; boundary="00000000000029e5530634ba91dc"

--00000000000029e5530634ba91dc
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
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c
> b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index
> 91ee63bfe0bc73e28877d0383812225867e167a4..b129e5a8d791507098c7b8d1bc54f54=
c4b453954
> 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -4701,7 +4701,6 @@ static const struct drm_bridge_funcs
> dsi_bridge_funcs =3D {
>
>  static void dsi_bridge_init(struct dsi_data *dsi)
>  {
> -       dsi->bridge.funcs =3D &dsi_bridge_funcs;
>         dsi->bridge.of_node =3D dsi->host.dev->of_node;
>         dsi->bridge.type =3D DRM_MODE_CONNECTOR_DSI;
>
> @@ -4894,9 +4893,9 @@ static int dsi_probe(struct platform_device *pdev)
>         unsigned int i;
>         int r;
>
> -       dsi =3D devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> -       if (!dsi)
> -               return -ENOMEM;
> +       dsi =3D devm_drm_bridge_alloc(dev, struct dsi_data, bridge,
> &dsi_bridge_funcs);
> +       if (IS_ERR(dsi))
> +               return PTR_ERR(dsi);
>
>         dsi->dev =3D dev;
>         dev_set_drvdata(dev, dsi);
>
>
Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>

Thanks,
Anusha

> --
> 2.49.0
>
>

--00000000000029e5530634ba91dc
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
Cc: Tomi Valkeinen &lt;<a href=3D"mailto:tomi.valkeinen@ideasonboard.com" t=
arget=3D"_blank">tomi.valkeinen@ideasonboard.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/omapdrm/dss/dsi.c | 7 +++----<br>
=C2=A01 file changed, 3 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/ds=
s/dsi.c<br>
index 91ee63bfe0bc73e28877d0383812225867e167a4..b129e5a8d791507098c7b8d1bc5=
4f54c4b453954 100644<br>
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c<br>
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c<br>
@@ -4701,7 +4701,6 @@ static const struct drm_bridge_funcs dsi_bridge_funcs=
 =3D {<br>
<br>
=C2=A0static void dsi_bridge_init(struct dsi_data *dsi)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dsi-&gt;bridge.funcs =3D &amp;dsi_bridge_funcs;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dsi-&gt;bridge.of_node =3D dsi-&gt;host.dev-&gt=
;of_node;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dsi-&gt;bridge.type =3D DRM_MODE_CONNECTOR_DSI;=
<br>
<br>
@@ -4894,9 +4893,9 @@ static int dsi_probe(struct platform_device *pdev)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int i;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dsi =3D devm_kzalloc(dev, sizeof(*dsi), GFP_KER=
NEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dsi)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dsi =3D devm_drm_bridge_alloc(dev, struct dsi_d=
ata, bridge, &amp;dsi_bridge_funcs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(dsi))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(dsi)=
;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dsi-&gt;dev =3D dev;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_set_drvdata(dev, dsi);<br>
<br></blockquote><div><br></div><div>Reviewed-by: Anusha Srivatsa &lt;<a hr=
ef=3D"mailto:asrivats@redhat.com">asrivats@redhat.com</a>&gt;</div><div><br=
></div><div>Thanks,</div><div>Anusha=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
-- <br>
2.49.0<br>
<br>
</blockquote></div></div>

--00000000000029e5530634ba91dc--


--===============8316558298156730627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8316558298156730627==--

