Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB51AB1EA3
	for <lists+linux-stm32@lfdr.de>; Fri,  9 May 2025 23:01:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 524F4C78F9C;
	Fri,  9 May 2025 21:01:04 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE450C78F9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 May 2025 21:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746824461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GxeeDi1H5MJB3Qfb+8ddZTQgXdj+sj14UlmauzFXdmw=;
 b=M2mxMDU0ByEkX6vnOqi5SfKcZLfMg85yf28a4iOaRgfv5+zET6mCz8vg6CG8YDLOpBLrgb
 ASiXF+eHVEZH9V8l8W2//xpbbVuBMic8gja8UeCq/7JpSlda80Is55yKwWayy+wEO9AsLO
 XFEBgQ+NVPDchB0FJUIJlCAlZU5UOcc=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-q_mgCUdDOPCOdzI0aXzNsQ-1; Fri, 09 May 2025 17:00:50 -0400
X-MC-Unique: q_mgCUdDOPCOdzI0aXzNsQ-1
X-Mimecast-MFC-AGG-ID: q_mgCUdDOPCOdzI0aXzNsQ_1746824450
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-703d7a66d77so40641637b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 May 2025 14:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746824450; x=1747429250;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GxeeDi1H5MJB3Qfb+8ddZTQgXdj+sj14UlmauzFXdmw=;
 b=S/YiRPm5TbL+nkUfvJ6VUDr7XhjhpsFq/cVlaqMA56oMhclEoFs6xD2JPwoPy9Crbp
 JcjLT/dMTL8G6acdAdTp6FxykgZ7m+3xTc1uDJRkNFdcvcYrFVYR4/2aQzJwE5eBQGuT
 MlxEzeUamV3Gzxv/xgy7/tv0aXMR1R3fm2d9g4niZMaSCkRgBmHEsZJnc6s5WXKHXz46
 i9Tp31e8qKiqpAlxTbwp80DwG8JXwPujOXGaizsCyOZk0RbP3UeadtEoGWwQEp21+BYX
 blyxWpBH/oiXia8HauSiXMovyTBR6m3ikF8on25v0RpjK8bxoRIqi74KLIc0NjJgShjk
 x/2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNzxfXVqF7gwQJ+sZIGNQvxo6IdCXCNyDGID6SzPFpSlurTFxCKLBo6f0hCGKWnnwMcchE/n3gXFgEjw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzQf76NJCV0iTm1+SI9/15PgX7hV1X3qt+NjiMkju8NKJxCdna5
 Q0x+8rMU7iPiF3TRZZSvEdUXAeIsq0NS4F5+MJBGw8D5ldXrEC2t6L7H4duwiVu8yjvj2WfORUc
 t+NJQnKu29wgxDtbhBt4MJZDl6hUesGtGbRmkUj5SLGul6fkl+CTGewqHrO4fnx7ao5A1MyTnvK
 rEUSy3GdiJkGrA7Ifimf2B/j6NvHUC3473DLbJGPTz+rWiSZZ48KMr
X-Gm-Gg: ASbGncuuSxaFDp3wW8Y2hHpUEkupOmenV70kZIiTvyfeWo5sO14jllHAAg9CMOBTMOO
 RDkfdRMeol4fqMRBTz4Kt1lDXZPk1RSeqYy/pBZ+vVCwz4BeYoohEEjWZfOib7sbLhsU=
X-Received: by 2002:a05:690c:4a13:b0:6f9:4c00:53ae with SMTP id
 00721157ae682-70a3fe639a7mr66359727b3.8.1746824449926; 
 Fri, 09 May 2025 14:00:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu4gFpdDMPdqrm3koI5DF4B/M2VVfyv/zoOi8I1BG0UWxlvYeEw87dshOpo9AfvNFUdksvtnpxYysUb+Askfc=
X-Received: by 2002:a05:690c:4a13:b0:6f9:4c00:53ae with SMTP id
 00721157ae682-70a3fe639a7mr66359047b3.8.1746824449542; Fri, 09 May 2025
 14:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-6-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-6-b8bc1f16d7aa@bootlin.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 9 May 2025 15:57:30 -0400
X-Gm-Features: AX0GCFsXRmzCU1YWdcE7qOGXX4MM5M9X_-TsxuZaGU2s0VoAZtFUNeQly9oXeMk
Message-ID: <CAN9Xe3QkjfNqezBOV1CpvfiCGJZ89on=EHWHcE1oB6z_vjTUjg@mail.gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3p72aNnt9hiEni2ggSzOH4VhlfibcPzLg7QVgayb37A_1746824450
X-Mimecast-Originator: redhat.com
Cc: imx@lists.linux.dev, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
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
Subject: Re: [Linux-stm32] [PATCH v3 06/22] drm/bridge: nxp-ptn3460: convert
 to devm_drm_bridge_alloc() API
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
Content-Type: multipart/mixed; boundary="===============0072363553137787962=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============0072363553137787962==
Content-Type: multipart/alternative; boundary="000000000000ccdd1f0634ba42b2"

--000000000000ccdd1f0634ba42b2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 9:56=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootlin=
.com>
wrote:

> This is the new API for allocating DRM bridges.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/nxp-ptn3460.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c
> b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> index
> 25d7c415478b14ef634bff4185a8dd8e866be0c6..7acb11f16dc19e87a84cc765b1cebef=
158662c00
> 100644
> --- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
> +++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> @@ -261,10 +261,10 @@ static int ptn3460_probe(struct i2c_client *client)
>         struct drm_bridge *panel_bridge;
>         int ret;
>
> -       ptn_bridge =3D devm_kzalloc(dev, sizeof(*ptn_bridge), GFP_KERNEL)=
;
> -       if (!ptn_bridge) {
> -               return -ENOMEM;
> -       }
> +       ptn_bridge =3D devm_drm_bridge_alloc(dev, struct ptn3460_bridge,
> bridge,
> +                                          &ptn3460_bridge_funcs);
> +       if (IS_ERR(ptn_bridge))
> +               return PTR_ERR(ptn_bridge);
>
>         panel_bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
>         if (IS_ERR(panel_bridge))
> @@ -300,7 +300,6 @@ static int ptn3460_probe(struct i2c_client *client)
>                 return ret;
>         }
>
> -       ptn_bridge->bridge.funcs =3D &ptn3460_bridge_funcs;
>         ptn_bridge->bridge.ops =3D DRM_BRIDGE_OP_EDID;
>         ptn_bridge->bridge.type =3D DRM_MODE_CONNECTOR_LVDS;
>         ptn_bridge->bridge.of_node =3D dev->of_node;
>
>
Looks good to me!
Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>


> --
> 2.49.0
>
>

--000000000000ccdd1f0634ba42b2
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
---<br>
=C2=A0drivers/gpu/drm/bridge/nxp-ptn3460.c | 9 ++++-----<br>
=C2=A01 file changed, 4 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/=
nxp-ptn3460.c<br>
index 25d7c415478b14ef634bff4185a8dd8e866be0c6..7acb11f16dc19e87a84cc765b1c=
ebef158662c00 100644<br>
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c<br>
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c<br>
@@ -261,10 +261,10 @@ static int ptn3460_probe(struct i2c_client *client)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_bridge *panel_bridge;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ptn_bridge =3D devm_kzalloc(dev, sizeof(*ptn_br=
idge), GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ptn_bridge) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ptn_bridge =3D devm_drm_bridge_alloc(dev, struc=
t ptn3460_bridge, bridge,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
amp;ptn3460_bridge_funcs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(ptn_bridge))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(ptn_=
bridge);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel_bridge =3D devm_drm_of_get_bridge(dev, de=
v-&gt;of_node, 0, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(panel_bridge))<br>
@@ -300,7 +300,6 @@ static int ptn3460_probe(struct i2c_client *client)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ptn_bridge-&gt;bridge.funcs =3D &amp;ptn3460_br=
idge_funcs;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptn_bridge-&gt;bridge.ops =3D DRM_BRIDGE_OP_EDI=
D;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptn_bridge-&gt;bridge.type =3D DRM_MODE_CONNECT=
OR_LVDS;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptn_bridge-&gt;bridge.of_node =3D dev-&gt;of_no=
de;<br>
<br></blockquote><div><br></div><div>Looks good to me!</div><div>Reviewed-b=
y: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.com">asrivats@redh=
at.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
-- <br>
2.49.0<br>
<br>
</blockquote></div></div>

--000000000000ccdd1f0634ba42b2--


--===============0072363553137787962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0072363553137787962==--

