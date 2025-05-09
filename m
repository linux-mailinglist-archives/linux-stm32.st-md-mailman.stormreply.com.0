Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA01AB1D85
	for <lists+linux-stm32@lfdr.de>; Fri,  9 May 2025 21:52:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42FD0C78F9C;
	Fri,  9 May 2025 19:52:25 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E24FDC78F98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 May 2025 19:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746820342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3vE0/6Pj+61VPlyLz7h5R/qWMMebiHV585td+IpLLBg=;
 b=Q6eIOaskdiUiIh2rGsS7ZMxYwP3zlaYKDX/ZhX/WjDi/Q1zWJjk+M7bjO+E3nh8rV8NXM6
 /98bTfmeBjKxdWSm06j9a8CKzdl/+F8LbLVLYBwEUDsmKhGiJf8RrbTqsXKKVIXfLqAAZI
 Y1dki4zFbAlSrldSpDwRA4EQaCzHYo4=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-0xikOlZcPO-2Gq-OUlZrxw-1; Fri, 09 May 2025 15:52:21 -0400
X-MC-Unique: 0xikOlZcPO-2Gq-OUlZrxw-1
X-Mimecast-MFC-AGG-ID: 0xikOlZcPO-2Gq-OUlZrxw_1746820341
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-708af1dc9easo36713217b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 May 2025 12:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746820341; x=1747425141;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3vE0/6Pj+61VPlyLz7h5R/qWMMebiHV585td+IpLLBg=;
 b=k7X/GWK310puAJb4z0/oIsnMIdhvZBy3HuhR3yksuzJZ9wbSG30XWkLzctwbiDGNAh
 8cezVe1UQhNai7xuhJ/7qa3vh3dDFy7ZGRB0IBxT0iAX41rRCXkPYPYzL+0SIfM3vGJc
 bEJQh3ho757lUlzmcDo/JGh3O77lA9gUiKWImKjSWskoOtK24mN2yHOrM0x1jwNooe6S
 s8CciOLhROEGMkS3HTNYi1ZfK+HU03Og1Pf6rFtZeoHr0glH1o5UkqQkpUn5IfhUfnxe
 +Mpk/lbWGdEv2YL3Hl62H2kIRXENQGmIj8/h+d6dvMJ/zKSjofP4WcVCyFOeKuTGU7RQ
 hekw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXDU4IN+YE20MYg4rRhUZi0rPLmnSQ5gn5of7fx+yBRCCveo/0zYfr2/8vUG0+iPagZ0qVw69xGVf5Nw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyS4SmsXH5a7o7bPCJHbcrlGjOKOFvEJMw/hF264th2HPnaC4bX
 wWcBjR0j1Icl6fY8qwT7o1cfpl2+tNMna7YSmDFdxInutg7EEjDpyBffQ3+CkyleDZYUCyTj2gH
 BgwSn6KL9vmoM4af7sVgY1tY3qS3TmfLjP8T5kbFkaLJ1qcjL+1ebhdXmLAUcw11Q018hZsHveG
 gEOF7leR0A+/lgTI1rSC64M1UFGSxJFvIznT8w4kWUPv4QJIxb1QAo
X-Gm-Gg: ASbGncsw6dawg2s1vXclj9jlvylT6FcHFURkT5CUXtPFuaxJ9vjR+8kjW+tMJuCIamU
 BnKE8yY4+kJtQtk8Lw/faOeF7six6ZC9yjcNl2IM7g7nJblpKKGuqG3iFbUpEcCofedI=
X-Received: by 2002:a05:690c:3703:b0:700:b007:a33e with SMTP id
 00721157ae682-70a3fa35c34mr70580407b3.16.1746820340989; 
 Fri, 09 May 2025 12:52:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC0DQtfZer1s8WwuAvy5jnVdxcwwQL/obDFoxp/4pNvDHhS41o78nZLGWDEe5iMAgCmeGcNcnilGM5zXpvfJI=
X-Received: by 2002:a05:690c:3703:b0:700:b007:a33e with SMTP id
 00721157ae682-70a3fa35c34mr70579597b3.16.1746820340021; Fri, 09 May 2025
 12:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-5-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-5-b8bc1f16d7aa@bootlin.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 9 May 2025 14:48:59 -0400
X-Gm-Features: AX0GCFsJF80p2L07AVq8o4PxcvpfTfJkchc-7guLHKrPsZV_s9GdXIanRE7r2lY
Message-ID: <CAN9Xe3SQbH4gnKdDJvOiZ82+5t+L+d_Srxd=p=aYAH5vY7F4Dw@mail.gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oWm702aGW41r08-DyFORLlom9w1Uk9yFGz7FF0GrUxk_1746820341
X-Mimecast-Originator: redhat.com
Cc: imx@lists.linux.dev, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Martyn Welch <martyn.welch@collabora.co.uk>, Simona Vetter <simona@ffwll.ch>,
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
 linux-mediatek@lists.infradead.org, Ian Ray <ian.ray@gehealthcare.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 asahi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 05/22] drm/bridge:
 megachips-stdpxxxx-ge-b850v3-fw: convert to devm_drm_bridge_alloc() API
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
Content-Type: multipart/mixed; boundary="===============2137627401454255769=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============2137627401454255769==
Content-Type: multipart/alternative; boundary="000000000000da95ab0634b94dcc"

--000000000000da95ab0634b94dcc
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
> Cc: Ian Ray <ian.ray@gehealthcare.com>
> Cc: Martyn Welch <martyn.welch@collabora.co.uk>
> Cc: Peter Senna Tschudin <peter.senna@gmail.com>
>
> Changed in v3:
> - updated Ian Ray's e-mail (old one is bouncing


 ^^^^^^ you missed closing the breaces here.

Code changes look good.

Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>


> Changed in v2: none
> ---
>  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 11 ++++------=
-
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> index
> 15a5a1f644fc10182c55bc9e489ccb81d4f924f9..81dde9ed7bcf7cacae000d9da31a3a5=
c347ce037
> 100644
> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> @@ -225,13 +225,11 @@ static int ge_b850v3_lvds_init(struct device *dev)
>         if (ge_b850v3_lvds_ptr)
>                 goto success;
>
> -       ge_b850v3_lvds_ptr =3D devm_kzalloc(dev,
> -                                         sizeof(*ge_b850v3_lvds_ptr),
> -                                         GFP_KERNEL);
> -
> -       if (!ge_b850v3_lvds_ptr) {
> +       ge_b850v3_lvds_ptr =3D devm_drm_bridge_alloc(dev, struct
> ge_b850v3_lvds, bridge,
> +                                                  &ge_b850v3_lvds_funcs)=
;
> +       if (IS_ERR(ge_b850v3_lvds_ptr)) {
>                 mutex_unlock(&ge_b850v3_lvds_dev_mutex);
> -               return -ENOMEM;
> +               return PTR_ERR(ge_b850v3_lvds_ptr);
>         }
>
>  success:
> @@ -264,7 +262,6 @@ static int ge_b850v3_register(void)
>         struct device *dev =3D &stdp4028_i2c->dev;
>
>         /* drm bridge initialization */
> -       ge_b850v3_lvds_ptr->bridge.funcs =3D &ge_b850v3_lvds_funcs;
>         ge_b850v3_lvds_ptr->bridge.ops =3D DRM_BRIDGE_OP_DETECT |
>                                          DRM_BRIDGE_OP_EDID;
>         ge_b850v3_lvds_ptr->bridge.type =3D DRM_MODE_CONNECTOR_DisplayPor=
t;
>
> --
> 2.49.0
>
> thanks,
Anusha

--000000000000da95ab0634b94dcc
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
Cc: Ian Ray &lt;<a href=3D"mailto:ian.ray@gehealthcare.com" target=3D"_blan=
k">ian.ray@gehealthcare.com</a>&gt;<br>
Cc: Martyn Welch &lt;<a href=3D"mailto:martyn.welch@collabora.co.uk" target=
=3D"_blank">martyn.welch@collabora.co.uk</a>&gt;<br>
Cc: Peter Senna Tschudin &lt;<a href=3D"mailto:peter.senna@gmail.com" targe=
t=3D"_blank">peter.senna@gmail.com</a>&gt;<br>
<br>
Changed in v3:<br>
- updated Ian Ray&#39;s e-mail (old one is bouncing</blockquote><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^ you missed closing the breaces here.</div><d=
iv>=C2=A0</div><div>Code changes look good.</div><div><br></div><div>Review=
ed-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.com">asrivats@=
redhat.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
Changed in v2: none<br>
---<br>
=C2=A0drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 11 ++++---=
----<br>
=C2=A01 file changed, 4 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/dri=
vers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c<br>
index 15a5a1f644fc10182c55bc9e489ccb81d4f924f9..81dde9ed7bcf7cacae000d9da31=
a3a5c347ce037 100644<br>
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c<br>
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c<br>
@@ -225,13 +225,11 @@ static int ge_b850v3_lvds_init(struct device *dev)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ge_b850v3_lvds_ptr)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto success;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ge_b850v3_lvds_ptr =3D devm_kzalloc(dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0si=
zeof(*ge_b850v3_lvds_ptr),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GF=
P_KERNEL);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ge_b850v3_lvds_ptr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ge_b850v3_lvds_ptr =3D devm_drm_bridge_alloc(de=
v, struct ge_b850v3_lvds, bridge,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;ge_b850v3_lvds_funcs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(ge_b850v3_lvds_ptr)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&amp;g=
e_b850v3_lvds_dev_mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(ge_b=
850v3_lvds_ptr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0success:<br>
@@ -264,7 +262,6 @@ static int ge_b850v3_register(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device *dev =3D &amp;stdp4028_i2c-&gt;de=
v;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* drm bridge initialization */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ge_b850v3_lvds_ptr-&gt;bridge.funcs =3D &amp;ge=
_b850v3_lvds_funcs;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ge_b850v3_lvds_ptr-&gt;bridge.ops =3D DRM_BRIDG=
E_OP_DETECT |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DR=
M_BRIDGE_OP_EDID;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ge_b850v3_lvds_ptr-&gt;bridge.type =3D DRM_MODE=
_CONNECTOR_DisplayPort;<br>
<br>
-- <br>
2.49.0<br>
<br></blockquote><div>thanks,</div><div>Anusha=C2=A0</div></div></div>

--000000000000da95ab0634b94dcc--


--===============2137627401454255769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2137627401454255769==--

