Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCD1AB1D58
	for <lists+linux-stm32@lfdr.de>; Fri,  9 May 2025 21:35:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BFF7C78F9C;
	Fri,  9 May 2025 19:35:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28DE0C78F98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 May 2025 19:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746819316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8LkGhyvM5ULGVgnYgzQpkCzO/x50SWndRmWv8pvECYE=;
 b=hAmri0J8mUyU0SXF3zZaeDL1TLicE5ZD2XWHhKCuKlKBGi3gq4UR3SZOkVzMun+KaDMGY2
 oq1vDOC0h7rrpDiM6gv3ijBCBddOd33NYf3eD327QOYSNW+VT9X2Jy4x2SY0aXXuJrriNk
 G0DIldzgN0DsH3oMnjLZCEL+xVb7xQM=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-ptw1DOpmOLOwHaXOa4CZbg-1; Fri, 09 May 2025 15:35:13 -0400
X-MC-Unique: ptw1DOpmOLOwHaXOa4CZbg-1
X-Mimecast-MFC-AGG-ID: ptw1DOpmOLOwHaXOa4CZbg_1746819312
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-708b6b57e67so37150987b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 May 2025 12:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746819312; x=1747424112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8LkGhyvM5ULGVgnYgzQpkCzO/x50SWndRmWv8pvECYE=;
 b=BzbC149gmsCyQdJ4zuSYXnnysS2spTmSfsHTVWrXR4VIqvjfSrSr8MJyj0bjOxqtra
 RFY2uRpJNXJd+S2Mqbt175M3Ym6/7WpDQzvRK04Fx9b415TU986HP83qBcOBfwkEvfYH
 psp3/KKM6Mp6S+ba37GFsl8L+huGpkZ38d8qQ6lkOYfoSjM8pImARWe4+1aXS/D2zraw
 vt1EaQqmJjGY9cTS5Qf29zf4WsJbreZaQB9Qca4FTJ1yf7Jml/ConMKFmR0yqBPXE5O7
 P3fCW/EhzK3Z9Q23OkrSXeKIqnBkg7wn8ziAzbN5mGJ8LUAfbMt+XWwtk/OC/nz+ox58
 OMyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCGmvMDbkMhr1myJ34T8LfuKD9k/sfC2yIb6WAxp8CRt/rAmVz8+x8I+MZfJgyY2Y8o5RcpVGOzdK2vA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxRhdqIvbST/s25jlCP0q8R+DJgi0LdbhkBGhuFOzrThUnN1+jE
 g9gaf2lUpqEuk1PDku4is+L+qdo1rGdbu4HXmy1CGvmqAfaMsjchmXpw7KoxWHarkpvNO+6Z7ov
 7gs2mcYmrpYdOgVi48P1/20Fbt514ispKutPVazG4GHwuu3Z+IRskjecbRnlnxxRtJf7U+pLsYo
 1mf92vvwr7/fSAOAxAbzIBVbHYqIERA5PQfwOUESkc0HpYn9yIXeuP
X-Gm-Gg: ASbGncsxK5Bh9ERCDNdZ+G+G6QO2DYXzl9WdWJOW8qziVsVy6F6lH/LO9o3M+vcyZhB
 zMF44eAlZy89IkiKZhSqqY4V22P2EKIzlV5lAGupsPxZKGQLgMyahpvfnyvqTfNqnG7k=
X-Received: by 2002:a05:690c:7487:b0:6fb:1f78:d9ee with SMTP id
 00721157ae682-70a3fa17f4amr68605417b3.15.1746819312168; 
 Fri, 09 May 2025 12:35:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt3PV5p9bgu7MwlRMnZkjDv9NjPEf3FqRtxZGYBPTrniTX6M6KWZ/kD+66XnLMxfTiUE1YPOACytjtNGlpEjA=
X-Received: by 2002:a05:690c:7487:b0:6fb:1f78:d9ee with SMTP id
 00721157ae682-70a3fa17f4amr68604677b3.15.1746819311690; Fri, 09 May 2025
 12:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-4-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-4-b8bc1f16d7aa@bootlin.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 9 May 2025 14:31:51 -0400
X-Gm-Features: AX0GCFvyosW1qSESkn4iHuCP9lrHnLnwOX6jMB7LV077XCjLfpAksJn92WhqF7U
Message-ID: <CAN9Xe3Tco_FuoSwhReP=ZyiXmbUiOtLnmY_weVx7ZhZpw8d8HA@mail.gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9jYGUEWUYoJvg5S2iLTYxkZk0ZPlDwpyzKxmssQcMVU_1746819312
X-Mimecast-Originator: redhat.com
Cc: imx@lists.linux.dev, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Simona Vetter <simona@ffwll.ch>,
 chrome-platform@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Aradhya Bhatia <a-bhatia1@ti.com>,
 David Airlie <airlied@gmail.com>, Paul Kocialkowski <paulk@sys-base.io>,
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
Subject: Re: [Linux-stm32] [PATCH v3 04/22] drm/bridge: cdns-dsi: convert to
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
Content-Type: multipart/mixed; boundary="===============7097569252088772602=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============7097569252088772602==
Content-Type: multipart/alternative; boundary="0000000000008f8be00634b910c9"

--0000000000008f8be00634b910c9
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
> Cc: Aradhya Bhatia <a-bhatia1@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> index
> b022dd6e6b6e9e43bf11583806e1a8d1e7431ae8..7604574da66606c103cc035dd94b0e2=
11b64ebdc
> 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> @@ -1289,9 +1289,10 @@ static int cdns_dsi_drm_probe(struct
> platform_device *pdev)
>         int ret, irq;
>         u32 val;
>
> -       dsi =3D devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
> -       if (!dsi)
> -               return -ENOMEM;
> +       dsi =3D devm_drm_bridge_alloc(&pdev->dev, struct cdns_dsi,
> input.bridge,
> +                                   &cdns_dsi_bridge_funcs);
> +       if (IS_ERR(dsi))
> +               return PTR_ERR(dsi);
>
>         platform_set_drvdata(pdev, dsi);
>
> @@ -1349,7 +1350,6 @@ static int cdns_dsi_drm_probe(struct platform_devic=
e
> *pdev)
>          * CDNS_DPI_INPUT.
>          */
>         input->id =3D CDNS_DPI_INPUT;
> -       input->bridge.funcs =3D &cdns_dsi_bridge_funcs;
>         input->bridge.of_node =3D pdev->dev.of_node;
>
>         /* Mask all interrupts before registering the IRQ handler. */
>
> --


Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>


>
> 2.49.0
>
>

--0000000000008f8be00634b910c9
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
Cc: Aradhya Bhatia &lt;<a href=3D"mailto:a-bhatia1@ti.com" target=3D"_blank=
">a-bhatia1@ti.com</a>&gt;<br>
Cc: Tomi Valkeinen &lt;<a href=3D"mailto:tomi.valkeinen@ideasonboard.com" t=
arget=3D"_blank">tomi.valkeinen@ideasonboard.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/d=
rm/bridge/cadence/cdns-dsi-core.c<br>
index b022dd6e6b6e9e43bf11583806e1a8d1e7431ae8..7604574da66606c103cc035dd94=
b0e211b64ebdc 100644<br>
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c<br>
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c<br>
@@ -1289,9 +1289,10 @@ static int cdns_dsi_drm_probe(struct platform_device=
 *pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret, irq;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 val;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dsi =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof(=
*dsi), GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dsi)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dsi =3D devm_drm_bridge_alloc(&amp;pdev-&gt;dev=
, struct cdns_dsi, input.bridge,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;cdns_dsi_bridge_fu=
ncs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(dsi))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(dsi)=
;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 platform_set_drvdata(pdev, dsi);<br>
<br>
@@ -1349,7 +1350,6 @@ static int cdns_dsi_drm_probe(struct platform_device =
*pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* CDNS_DPI_INPUT.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 input-&gt;id =3D CDNS_DPI_INPUT;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0input-&gt;bridge.funcs =3D &amp;cdns_dsi_bridge=
_funcs;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 input-&gt;bridge.of_node =3D pdev-&gt;dev.of_no=
de;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Mask all interrupts before registering the I=
RQ handler. */<br>
<br>
--</blockquote><div><br></div><div>Reviewed-by: Anusha Srivatsa &lt;<a href=
=3D"mailto:asrivats@redhat.com">asrivats@redhat.com</a>&gt;</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"> <br>
2.49.0<br>
<br>
</blockquote></div></div>

--0000000000008f8be00634b910c9--


--===============7097569252088772602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7097569252088772602==--

