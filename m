Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 133C4AB1F18
	for <lists+linux-stm32@lfdr.de>; Fri,  9 May 2025 23:35:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8550C7A827;
	Fri,  9 May 2025 21:35:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA6F8C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 May 2025 21:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746826545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hYtlWhIfE8/FY/jKJnyYsZe7MxS7wLs6dmHJZajZruE=;
 b=FSL/1fkh+dIrC2RCOB+HyfueeLuDIJ/5teuKJ2mrdEH7E03u8grXP3KQkclUCZih7nHMER
 cBJjeNNBnHdXcf6FBacn2CGTtQBCXyuqrrsQDBW8yIYHNNKx/axsdaGXuqAIvvxXdpgc5+
 JdfFyMfYY5i8cge7H7YTfZ1krVsMj5A=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-HLL8CWXSMYmo9pZkmYYDcg-1; Fri, 09 May 2025 17:35:44 -0400
X-MC-Unique: HLL8CWXSMYmo9pZkmYYDcg-1
X-Mimecast-MFC-AGG-ID: HLL8CWXSMYmo9pZkmYYDcg_1746826543
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-70a4be14d80so10110927b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 May 2025 14:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746826543; x=1747431343;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hYtlWhIfE8/FY/jKJnyYsZe7MxS7wLs6dmHJZajZruE=;
 b=mU2vZDtL5TYtgrFKxVA93m2q325hkUH+VWXKQ5/KUnmZFtjQqxAvJfh4RNm4nNNYw+
 irW9sKeXzUKHpPIhj0gyB9UzHt0fXpA0UHr2RbJr2Zn6+JJlMKZt2dd1yWKMfPyyrjwh
 TvY0WmXYIiuvdGP4Q1zmB7Jtyx8+qaJ+Grk3/dnLyZvcaaVqP2dF2XDB+Fox3c2vr+hA
 XvX1jXJzZLldalZXPutx4bpHNQehROLCJ/2aa8b9jlEN4pJk4Bjn1lE6MPIkGg+Z6n81
 n1Ni6UGXDzGdLn3j5X06gASmgfc3a5YF6SdXJp+jhIP6E7D68DvU+bfj88AdpVyWcVHv
 xQrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvjiIGhP8SC54v6ocMI+Ht/iGZnWbVafX4235Pa1hS3wNlvicy05KUgqXRBeE+tldoZtaTkomlsZVZmQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxBTlfFtodAS4WlSC89uCq67ZnTBxTUfVBMF55vm7nYv5uTktuF
 b566+lhnVv0Lp4Fj0b+xbrIuAIMUJ/n8WX707+P1Oa7bRl4VD83JcxCW36Mf4rjWUkI5qS8U8k5
 r3QRiwjNRUrnVgxmdx/skgSyl9qEPT+4w4I1FjfLnv4ic2fB9KdqlcXsSPXcS7OyHetDihIZ16A
 SU8vrIPpbTcAFhAZAqxF+ai6VABLqR0h550ZotOdHQeZZZVZtbemSG
X-Gm-Gg: ASbGncu4I2vPxop28uqtzfcZ9qa0MSH4LLdfLWQwrlM18aNvfuvSauXmvHmiGj/9vNc
 +I6N4vbd/sR2zgXuBsHHXIiU/ZQw+PNUhbTHHBDDti5+YD0zt7xKl0tjcOEIq++Go8u8=
X-Received: by 2002:a05:690c:6012:b0:703:b930:97c7 with SMTP id
 00721157ae682-70a3fa2453bmr65777767b3.9.1746826543556; 
 Fri, 09 May 2025 14:35:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOX4g2wzfw7tGF0msoIwu89ObZWLx7H+gBPBCTd54o0YgB37bfihWxt4pX1/XHw0ycvt7E0xMq+56TtD2VrVc=
X-Received: by 2002:a05:690c:6012:b0:703:b930:97c7 with SMTP id
 00721157ae682-70a3fa2453bmr65777427b3.9.1746826543279; Fri, 09 May 2025
 14:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-15-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-15-b8bc1f16d7aa@bootlin.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 9 May 2025 16:32:22 -0400
X-Gm-Features: AX0GCFvgBDQPXfbsBXhpXssR6nd8_D6uWav2HkZaIC88ZkIzUSgFh2O4RCwzLCA
Message-ID: <CAN9Xe3TX+zGNjQOANzv8tqUD79zVniruG3yBDiQY=Cd6Jr6p9A@mail.gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 42foIgITOxW1tVXRFCvFzfpeMMBT3luiFz9iR9ohfgk_1746826543
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 asahi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 15/22] drm/bridge: stm_lvds: convert to
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
Content-Type: multipart/mixed; boundary="===============5683638229683611391=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============5683638229683611391==
Content-Type: multipart/alternative; boundary="00000000000098c5590634babf2d"

--00000000000098c5590634babf2d
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
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>  drivers/gpu/drm/stm/lvds.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
> index
> a3ae9a93ce6670eb2c4dd36b3e572fcbca791a1c..07788e8d3d8302a3951e97d64736b72=
1033998d3
> 100644
> --- a/drivers/gpu/drm/stm/lvds.c
> +++ b/drivers/gpu/drm/stm/lvds.c
> @@ -1049,9 +1049,9 @@ static int lvds_probe(struct platform_device *pdev)
>
>         dev_dbg(dev, "Probing LVDS driver...\n");
>
> -       lvds =3D devm_kzalloc(dev, sizeof(*lvds), GFP_KERNEL);
> -       if (!lvds)
> -               return -ENOMEM;
> +       lvds =3D devm_drm_bridge_alloc(dev, struct stm_lvds, lvds_bridge,
> &lvds_bridge_funcs);
> +       if (IS_ERR(lvds))
> +               return PTR_ERR(lvds);
>
>         lvds->dev =3D dev;
>
> @@ -1164,7 +1164,6 @@ static int lvds_probe(struct platform_device *pdev)
>                 goto err_lvds_probe;
>         }
>
> -       lvds->lvds_bridge.funcs =3D &lvds_bridge_funcs;
>         lvds->lvds_bridge.of_node =3D dev->of_node;
>         lvds->hw_version =3D lvds_read(lvds, LVDS_VERR);
>
>
>
Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>

Thanks,
Anusha

> --
> 2.49.0
>
>

--00000000000098c5590634babf2d
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
Cc: Alexandre Torgue &lt;<a href=3D"mailto:alexandre.torgue@foss.st.com" ta=
rget=3D"_blank">alexandre.torgue@foss.st.com</a>&gt;<br>
Cc: Maxime Coquelin &lt;<a href=3D"mailto:mcoquelin.stm32@gmail.com" target=
=3D"_blank">mcoquelin.stm32@gmail.com</a>&gt;<br>
Cc: Philippe Cornu &lt;<a href=3D"mailto:philippe.cornu@foss.st.com" target=
=3D"_blank">philippe.cornu@foss.st.com</a>&gt;<br>
Cc: Raphael Gallais-Pou &lt;<a href=3D"mailto:raphael.gallais-pou@foss.st.c=
om" target=3D"_blank">raphael.gallais-pou@foss.st.com</a>&gt;<br>
Cc: Yannick Fertre &lt;<a href=3D"mailto:yannick.fertre@foss.st.com" target=
=3D"_blank">yannick.fertre@foss.st.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/stm/lvds.c | 7 +++----<br>
=C2=A01 file changed, 3 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c<br>
index a3ae9a93ce6670eb2c4dd36b3e572fcbca791a1c..07788e8d3d8302a3951e97d6473=
6b721033998d3 100644<br>
--- a/drivers/gpu/drm/stm/lvds.c<br>
+++ b/drivers/gpu/drm/stm/lvds.c<br>
@@ -1049,9 +1049,9 @@ static int lvds_probe(struct platform_device *pdev)<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_dbg(dev, &quot;Probing LVDS driver...\n&quo=
t;);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lvds =3D devm_kzalloc(dev, sizeof(*lvds), GFP_K=
ERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!lvds)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lvds =3D devm_drm_bridge_alloc(dev, struct stm_=
lvds, lvds_bridge, &amp;lvds_bridge_funcs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(lvds))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(lvds=
);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lvds-&gt;dev =3D dev;<br>
<br>
@@ -1164,7 +1164,6 @@ static int lvds_probe(struct platform_device *pdev)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_lvds_probe=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lvds-&gt;lvds_bridge.funcs =3D &amp;lvds_bridge=
_funcs;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lvds-&gt;lvds_bridge.of_node =3D dev-&gt;of_nod=
e;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lvds-&gt;hw_version =3D lvds_read(lvds, LVDS_VE=
RR);<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Anusha Srivatsa &lt;<a hr=
ef=3D"mailto:asrivats@redhat.com">asrivats@redhat.com</a>&gt;</div><div><br=
></div><div>Thanks,</div><div>Anusha=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
-- <br>
2.49.0<br>
<br>
</blockquote></div></div>

--00000000000098c5590634babf2d--


--===============5683638229683611391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5683638229683611391==--

