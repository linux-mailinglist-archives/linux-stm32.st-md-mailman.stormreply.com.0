Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CFEAB1EB6
	for <lists+linux-stm32@lfdr.de>; Fri,  9 May 2025 23:08:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4C91C7A827;
	Fri,  9 May 2025 21:08:24 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D357C78F9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 May 2025 21:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746824903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UARxfep1PUV/zClZnWhEuROkgNfsuVtcWX+qYwdPZ6U=;
 b=Vfqe+gXs9G5cp7AvCVrrLm5HdWH9MTJCL4fb1dNu15rPoOcBiWE8yJbgyPEYXvo2QZ/EAz
 RkKg8scoagEGSYHUiYJ8IO/O0CXXze9IuPmEf8NiatsJ6K4TIisgd+q0Fz1Clpmz98Det1
 sKTP2421/ElgoR/tihDyKIZvxSVTlnc=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-qqqJIWgINxuAP0UikR1SqQ-1; Fri, 09 May 2025 17:08:19 -0400
X-MC-Unique: qqqJIWgINxuAP0UikR1SqQ-1
X-Mimecast-MFC-AGG-ID: qqqJIWgINxuAP0UikR1SqQ_1746824899
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-707d49f9c3bso37536247b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 May 2025 14:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746824899; x=1747429699;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UARxfep1PUV/zClZnWhEuROkgNfsuVtcWX+qYwdPZ6U=;
 b=HJT/MFcVTS1hghnyPQv1XOR8dM1wHTcNtxC058nJ6/QOsOr8BEsqNDGqDEZU0AvyFq
 SKWFhDuiwvn5B1w0Cv9o0o6W/jW/P400Lt7kTM4LDgYXgToQPJRdAxdjDdwAuhkoTGyN
 fMq+wDne/ZFBqPjEy8RdayAmb2aa4PVOQ1tdD+DLs9IEk0huTzyVsrzK7gwu9JRKMOLv
 EBK5W3FQt3J/l5bIJKqZq5DHI7olJbXEcPr2FnocsgfKut4AxU0PJbesqADSt50xiEaN
 EKRxIUoGifTRwRxAzxSnXxAvLcjgfrB0uWf46bTAr6GXZHCllQ64YkpRLpnfXd5VEyjf
 d80Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsx8Xc40PjZDaYPG3FrOxhywKzv99jRI4UE6U9If5lygZph0G3gfbb9fvipmhHF3W7jXl5rM7+kW14jg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwjXPAwxciev88UoprNuMyy8A3xEGsfgAV2b+JeDCLCN0p/C1m3
 xrYdHsVwDsl4Oj4x/MrSuReuBHTFy853O5kz7CsEp6U5JDGSG8EmQpv1LV3BSeSs9Aj10X9/gGu
 ikDwMrt82N+hXCq5SW8SyjY6a817ZHev2HqKaNlS40xsH0NpT6Et530kKMDSWqiSxzns47autmG
 B9KvtT/GZawhPV3Yz6UwtVvhwvet+JzRh3KEbFS9C/AC7RSE0QS7Wc
X-Gm-Gg: ASbGncvaalfkQRroQjXPqSkQIEf8v1I4iDgPi98GB4eUn/14U3ERWCSu5lzxv7UIedW
 DwhjXXEXhefOWr+5ly2229wlGVcSZo9nnfmsTBBVArL2X/GtlCyXA2HKHGh7gXiAxhFs=
X-Received: by 2002:a05:690c:4b86:b0:709:17e4:4d27 with SMTP id
 00721157ae682-70a3fb1b0d4mr72899347b3.23.1746824899188; 
 Fri, 09 May 2025 14:08:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn2FbaiLJXpVMMYm1aD0LOc9R+oNCYF/mnEu4LufMPN7kBGGag7OLXUOJQHJrLtVspAzjldLH45fn1NMpmGrs=
X-Received: by 2002:a05:690c:4b86:b0:709:17e4:4d27 with SMTP id
 00721157ae682-70a3fb1b0d4mr72898667b3.23.1746824898685; Fri, 09 May 2025
 14:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-7-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-7-b8bc1f16d7aa@bootlin.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 9 May 2025 16:04:59 -0400
X-Gm-Features: AX0GCFvKuUu9e22S9SVXkS9UEWDKB4E-n7gr-L0jB9G_tZfdMvVpNCP3CNKnqws
Message-ID: <CAN9Xe3QDpw67hcONcA+8hSGA8e4n1vA=czpuDcNU8J6tz-BVCg@mail.gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XBimtl5cfwrt_HqAd3M89Yn62qNH-VusFlN9GDnxp-I_1746824899
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
Subject: Re: [Linux-stm32] [PATCH v3 07/22] drm/bridge: sii902x: convert to
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
Content-Type: multipart/mixed; boundary="===============3681388177341111538=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============3681388177341111538==
Content-Type: multipart/alternative; boundary="0000000000009240c00634ba5de6"

--0000000000009240c00634ba5de6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 9:56=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootlin=
.com>
wrote:

> This is the new API for allocating DRM bridges.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/sii902x.c
> b/drivers/gpu/drm/bridge/sii902x.c
> index
> 6de61d9fe06487856e8b3c32db3c8d8c25633fd8..882973e900628c0d972d32cd4ff3588=
432daa8e9
> 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -1135,7 +1135,6 @@ static int sii902x_init(struct sii902x *sii902x)
>         if (ret)
>                 goto err_unreg_audio;
>
> -       sii902x->bridge.funcs =3D &sii902x_bridge_funcs;
>         sii902x->bridge.of_node =3D dev->of_node;
>         sii902x->bridge.timings =3D &default_sii902x_timings;
>         sii902x->bridge.ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID=
;
> @@ -1170,9 +1169,9 @@ static int sii902x_probe(struct i2c_client *client)
>                 return -EIO;
>         }
>
> -       sii902x =3D devm_kzalloc(dev, sizeof(*sii902x), GFP_KERNEL);
> -       if (!sii902x)
> -               return -ENOMEM;
> +       sii902x =3D devm_drm_bridge_alloc(dev, struct sii902x, bridge,
> &sii902x_bridge_funcs);
> +       if (IS_ERR(sii902x))
> +               return PTR_ERR(sii902x);
>
>         sii902x->i2c =3D client;
>         sii902x->regmap =3D devm_regmap_init_i2c(client,
> &sii902x_regmap_config);
>
> --


Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>

Thanks,
Anusha

>
> 2.49.0
>
>

--0000000000009240c00634ba5de6
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
=C2=A0drivers/gpu/drm/bridge/sii902x.c | 7 +++----<br>
=C2=A01 file changed, 3 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii9=
02x.c<br>
index 6de61d9fe06487856e8b3c32db3c8d8c25633fd8..882973e900628c0d972d32cd4ff=
3588432daa8e9 100644<br>
--- a/drivers/gpu/drm/bridge/sii902x.c<br>
+++ b/drivers/gpu/drm/bridge/sii902x.c<br>
@@ -1135,7 +1135,6 @@ static int sii902x_init(struct sii902x *sii902x)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_unreg_audi=
o;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sii902x-&gt;bridge.funcs =3D &amp;sii902x_bridg=
e_funcs;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sii902x-&gt;bridge.of_node =3D dev-&gt;of_node;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sii902x-&gt;bridge.timings =3D &amp;default_sii=
902x_timings;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sii902x-&gt;bridge.ops =3D DRM_BRIDGE_OP_DETECT=
 | DRM_BRIDGE_OP_EDID;<br>
@@ -1170,9 +1169,9 @@ static int sii902x_probe(struct i2c_client *client)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sii902x =3D devm_kzalloc(dev, sizeof(*sii902x),=
 GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!sii902x)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sii902x =3D devm_drm_bridge_alloc(dev, struct s=
ii902x, bridge, &amp;sii902x_bridge_funcs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(sii902x))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(sii9=
02x);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sii902x-&gt;i2c =3D client;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sii902x-&gt;regmap =3D devm_regmap_init_i2c(cli=
ent, &amp;sii902x_regmap_config);<br>
<br>
--</blockquote><div><br></div><div>Reviewed-by: Anusha Srivatsa &lt;<a href=
=3D"mailto:asrivats@redhat.com">asrivats@redhat.com</a>&gt;</div><div><br><=
/div><div>Thanks,</div><div>Anusha=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"> <br>
2.49.0<br>
<br>
</blockquote></div></div>

--0000000000009240c00634ba5de6--


--===============3681388177341111538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3681388177341111538==--

