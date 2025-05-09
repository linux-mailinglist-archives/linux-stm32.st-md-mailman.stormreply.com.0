Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F51AB1F0D
	for <lists+linux-stm32@lfdr.de>; Fri,  9 May 2025 23:29:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48091C7A827;
	Fri,  9 May 2025 21:29:34 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04FCFC78F9C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 May 2025 21:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746826172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i/De0Jx5IFgD0sNFNUS/wwyJRmwsMymS62uY6uZUpus=;
 b=PcKhv4aEhDuigDlZEmI43iFJooZOOyiZkIpIM5SD4PMewIPiBlmyq5P4NOT+LCQK4uta4n
 +BWPSvZi7hO/piSXFtrVsIH01t01Hy98T0vAkqFeWy/jNmSx+Gr5E+AbBGPD0jz8uJarrU
 V+a8/VBDhLp6qwGR/NJXvbVVVlt8Y6g=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-HRUGSQzhOd-d1sxa-SlOYg-1; Fri, 09 May 2025 17:29:30 -0400
X-MC-Unique: HRUGSQzhOd-d1sxa-SlOYg-1
X-Mimecast-MFC-AGG-ID: HRUGSQzhOd-d1sxa-SlOYg_1746826170
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-70a30aede59so27516817b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 May 2025 14:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746826170; x=1747430970;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i/De0Jx5IFgD0sNFNUS/wwyJRmwsMymS62uY6uZUpus=;
 b=D28h+FcJpW5VW1u41LqeUFgU5rfPjW3SO5B4U6DGcz0QX4wcFUiqCmlSa3Rr1BX+fs
 8vEolQaOUDVYPuzkv/INGVE5+pLMV9unLoqlUsHe/qC//zrqLt1fTPm3vY4APplhrkHL
 q3XWqtZKukUQBMUSA0/hxNECP4D8/Rm69Ua/eJepAi2Ssu8lBHqzl7BMYsMg4xwC2psS
 tpoI+rkmMHW7Z/Wh6gxDp0Ry4HNRMGJn9C0WHHLkaGqT94Si/W5DijKnuu3GE5Ogt0EB
 shuf2lJRORAR6mcQ530vdtFxc4x2USYW5zRSpJ1PMd+c1jnISRkgNPSMMw/Eb5Jdt68j
 gAzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRaYG8sMPfjg0ye8FG9BVyone2WvCfvKfCEfVYbBMqltDPHQw6vQMaFrYSWsPiT4iba6D7KG7W53lYgw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzEayceaBbrQnBpJD/H7m0mv6ZU5wEBpoibdy1zeOxMngVOyoY9
 eeypfJuoSU/RS1BTccg92esR/Qj802iZj4VnpaloYV1K9xd1aU2HOhbh7agb2Rwl6mWGDlGV3Oj
 35X7TH1Khgb5jYV4MUdnnM7lSXLATxN4jl4fR9wnexHH1D9reffsdMnUnt/08hvONKYtvZPxc6w
 UissMg9CGo3k4vXwX/MrYtkAd7BAuYmzRjaIxm9Z0x5ICjMbSRpUko
X-Gm-Gg: ASbGncvWD2qTaIP1RH/0udGVBsfPRO/TK7zAWZbdRCtl5TM5rOTmQzJktuCSscDUTAZ
 5vw+evwtNeLHZ+aMUGgeiWO9ZdeBqnpvjfSRtEtuAAbqQGBYvTH3R3tc+SLnFI931CNs=
X-Received: by 2002:a05:690c:7487:b0:6fb:1f78:d9ee with SMTP id
 00721157ae682-70a3fa17f4amr73695837b3.15.1746826170049; 
 Fri, 09 May 2025 14:29:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp5EYYBrzU8/Gu19+QwyTIwBBoQnmr+XyBQWTJlN0PUivEqtKCpv1AmF6wAke9HmH9CtUVPC+jCWOQsyUY2qo=
X-Received: by 2002:a05:690c:7487:b0:6fb:1f78:d9ee with SMTP id
 00721157ae682-70a3fa17f4amr73695657b3.15.1746826169759; Fri, 09 May 2025
 14:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-14-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-14-b8bc1f16d7aa@bootlin.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 9 May 2025 16:26:09 -0400
X-Gm-Features: AX0GCFvRKuZCV8LHJEx8lT3s7zZ8NAFBTY2KWfQvQ2udmU7ulTzeD9WDaNkWM5c
Message-ID: <CAN9Xe3R+DUnUZiYxdgR7sMBuDZew2ZG0+b+_c4OzdKMVk+A4Gw@mail.gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IbBRnCPyE15Ljo9Ys1oN1TKDpO5GHTUHp3pDcfdIvl8_1746826170
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
 linux-mediatek@lists.infradead.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 platform-driver-x86@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 asahi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 14/22] drm/rcar-du: dsi: convert to
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
Content-Type: multipart/mixed; boundary="===============3950586400097429281=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============3950586400097429281==
Content-Type: multipart/alternative; boundary="000000000000554e370634baa92b"

--000000000000554e370634baa92b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 9:57=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootlin=
.com>
wrote:

> This is the new API for allocating DRM bridges.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> ---
>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index
> 7ab8be46c7f6547f29b4d45af7ac704283da9dcd..1af4c73f7a887712aef8c8176b0d033=
8d9ca9727
> 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -918,7 +918,6 @@ static int rcar_mipi_dsi_host_attach(struct
> mipi_dsi_host *host,
>         }
>
>         /* Initialize the DRM bridge. */
> -       dsi->bridge.funcs =3D &rcar_mipi_dsi_bridge_ops;
>         dsi->bridge.of_node =3D dsi->dev->of_node;
>         drm_bridge_add(&dsi->bridge);
>
> @@ -1004,9 +1003,10 @@ static int rcar_mipi_dsi_probe(struct
> platform_device *pdev)
>         struct rcar_mipi_dsi *dsi;
>         int ret;
>
> -       dsi =3D devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
> -       if (dsi =3D=3D NULL)
> -               return -ENOMEM;
> +       dsi =3D devm_drm_bridge_alloc(&pdev->dev, struct rcar_mipi_dsi,
> bridge,
> +                                   &rcar_mipi_dsi_bridge_ops);
> +       if (IS_ERR(dsi))
> +               return PTR_ERR(dsi);
>
>
Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>

Thanks,
Anusha

>         platform_set_drvdata(pdev, dsi);
>
>
> --
> 2.49.0
>
>

--000000000000554e370634baa92b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 9, =
2025 at 9:57=E2=80=AFAM Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@b=
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
Cc: Kieran Bingham &lt;<a href=3D"mailto:kieran.bingham%2Brenesas@ideasonbo=
ard.com" target=3D"_blank">kieran.bingham+renesas@ideasonboard.com</a>&gt;<=
br>
Cc: Laurent Pinchart &lt;<a href=3D"mailto:laurent.pinchart%2Brenesas@ideas=
onboard.com" target=3D"_blank">laurent.pinchart+renesas@ideasonboard.com</a=
>&gt;<br>
Cc: Tomi Valkeinen &lt;<a href=3D"mailto:tomi.valkeinen%2Brenesas@ideasonbo=
ard.com" target=3D"_blank">tomi.valkeinen+renesas@ideasonboard.com</a>&gt;<=
br>
---<br>
=C2=A0drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/=
drm/renesas/rcar-du/rcar_mipi_dsi.c<br>
index 7ab8be46c7f6547f29b4d45af7ac704283da9dcd..1af4c73f7a887712aef8c8176b0=
d0338d9ca9727 100644<br>
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c<br>
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c<br>
@@ -918,7 +918,6 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_ho=
st *host,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Initialize the DRM bridge. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dsi-&gt;bridge.funcs =3D &amp;rcar_mipi_dsi_bri=
dge_ops;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dsi-&gt;bridge.of_node =3D dsi-&gt;dev-&gt;of_n=
ode;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_bridge_add(&amp;dsi-&gt;bridge);<br>
<br>
@@ -1004,9 +1003,10 @@ static int rcar_mipi_dsi_probe(struct platform_devic=
e *pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct rcar_mipi_dsi *dsi;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dsi =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof(=
*dsi), GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dsi =3D=3D NULL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dsi =3D devm_drm_bridge_alloc(&amp;pdev-&gt;dev=
, struct rcar_mipi_dsi, bridge,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;rcar_mipi_dsi_brid=
ge_ops);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(dsi))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(dsi)=
;<br>
<br></blockquote><div><br></div><div>Reviewed-by: Anusha Srivatsa &lt;<a hr=
ef=3D"mailto:asrivats@redhat.com">asrivats@redhat.com</a>&gt;</div><div><br=
></div><div>Thanks,</div><div>Anusha=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 platform_set_drvdata(pdev, dsi);<br>
<br>
<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div></div>

--000000000000554e370634baa92b--


--===============3950586400097429281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3950586400097429281==--

