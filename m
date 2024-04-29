Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C9E8B55CF
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2024 12:51:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F977C71285;
	Mon, 29 Apr 2024 10:51:46 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D281C71283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 10:51:45 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-4daab3cf090so2095044e0c.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 03:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714387904; x=1714992704;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BXhEnLpZuSACRtLpCaCHyHe6X1epB7qL3alOjAjU9x8=;
 b=lU23x6VdxMekjBpERzcR2WASW9Rkdp/u6TRZ1maeONSJsYe7l6Hrm37z3QAmRsc81s
 xYUjuoNMLG8boQmyi+87GYY63FoRPLmfBNd55pGDmHtOvXntnpYHyTt4psjhhitn0cFO
 RojCpSvWQyZHtT6c0QVy5klDVHs/7qZ2uyXQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714387904; x=1714992704;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BXhEnLpZuSACRtLpCaCHyHe6X1epB7qL3alOjAjU9x8=;
 b=YMmQRtg6gUfWUEcScxk1oePl6YTBGBW+WO/QZRmLb93H7CfomfkYX2AVknedTaDrz0
 GWCcctBIQWfF+pEh7ISIWKH9rf24z1YfYV8slVDkIn3dKjckFmtHIVl/scPkg03cMY/B
 PSA5CZjCkW3AzGH1zCbvKte3DxhIphB4hvHRCrcBb8605AScXbqH8JNP5+OEytZ91RYs
 k/JG5AHaHxWL9ex4OIK3ecfYDbuyPREC9JSKq3IjxTz9RDUrxg43sTxv+os12ALJ+x2K
 bYr/KIxBJILyzoh+TdP8td06lB97KHXLPaXorYiAh82SRwcsHQ8yFuAdTA4EKmjiArXA
 +H4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbaaofiFo5AwL4MU25cKOn9v+r459ZCFbxKskaUCamfolPaFpe0e9n4oAs3tqjDJg2zQS/OhZdQnUg46Ieic9saOneahMey5yE7uTCfoMopCQk70WC4xfs
X-Gm-Message-State: AOJu0YwBGmv9HKpJFGXcmXX7gYA/QV6zonmFmHGu0zbZKe7DF6J177ru
 07OsnuzJfuRtskmSU3VdX1OE+tQmmuPrSdbaM2RVWHOIQvkwuhEXGoRvLtRKcgAse1F/rAo1mh8
 =
X-Google-Smtp-Source: AGHT+IFST4h9F0cq8+EPISsvoQ2ojKdBQw+XNaWYF8YULhNSYFhGYK7bF3dKp1j0oe5GA1edycSg4A==
X-Received: by 2002:a05:6122:2525:b0:4da:c46e:1be6 with SMTP id
 cl37-20020a056122252500b004dac46e1be6mr7633430vkb.6.1714387902619; 
 Mon, 29 Apr 2024 03:51:42 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47]) by smtp.gmail.com with ESMTPSA id
 x18-20020ab06412000000b007e6eb2b8f55sm3757808uao.17.2024.04.29.03.51.41
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 03:51:42 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id
 a1e0cc1a2514c-7efec3eb57cso1052553241.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 03:51:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUm2GUxFqOLcsxmPbntNCGI4mnNhxw6y492VoNW2HnND3tvQFXtiezw29Shn/0NF6t/B4LLA/PDLk3F24vazQbyujvrvxLSeuA1OKBgoxeCsU3AMYmFZowU
X-Received: by 2002:a05:6214:27cd:b0:6a0:4d4f:9428 with SMTP id
 ge13-20020a05621427cd00b006a04d4f9428mr14947200qvb.32.1714387880813; Mon, 29
 Apr 2024 03:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-9-2119e692309c@chromium.org>
 <40b9c015-8ccf-4313-800a-ecae9aa8cc27@xs4all.nl>
 <ZilMu614pUAzEGTa@kekkonen.localdomain>
 <20240424184603.GA6282@pendragon.ideasonboard.com>
In-Reply-To: <20240424184603.GA6282@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 12:51:08 +0200
X-Gmail-Original-Message-ID: <CANiDSCucvz=dQYDguzBZ-f95ZP84zuhvoKnmEYoJqAs1YnZ3ZA@mail.gmail.com>
Message-ID: <CANiDSCucvz=dQYDguzBZ-f95ZP84zuhvoKnmEYoJqAs1YnZ3ZA@mail.gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sergey Kozlov <serjk@netup.ru>,
 Samuel Holland <samuel@sholland.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-staging@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 linux-media@vger.kernel.org, Abylay Ospan <aospan@netup.ru>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>, linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>
Subject: Re: [Linux-stm32] [PATCH v2 09/26] media: v4l: async: refactor
	v4l2_async_create_ancillary_links
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Hans

Your proposal is what I sent for v1:
https://lore.kernel.org/linux-media/20240415-fix-cocci-v1-9-477afb23728b@chromium.org/

I have no strong opinion for any of the two, please feel free to land
whatever version you prefer.


Regards

On Wed, 24 Apr 2024 at 20:46, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Apr 24, 2024 at 06:17:31PM +0000, Sakari Ailus wrote:
> > On Wed, Apr 24, 2024 at 12:55:20PM +0200, Hans Verkuil wrote:
> > > On 19/04/2024 11:47, Ricardo Ribalda wrote:
> > > > Return 0 without checking IS_ERR or PTR_ERR if CONFIG_MEDIA_CONTROLLER
> > > > is not enabled.
> > > >
> > > > This makes cocci happier:
> > > >
> > > > drivers/media/v4l2-core/v4l2-async.c:331:23-30: ERROR: PTR_ERR applied after initialization to constant on line 319
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-async.c | 7 +++----
> > > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > > index 4bb073587817..915a9f3ea93c 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > > @@ -316,9 +316,10 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
> > > >  static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> > > >                                        struct v4l2_subdev *sd)
> > > >  {
> > > > - struct media_link *link = NULL;
> > > > + struct media_link *link;
> > > >
> > > > -#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> > > > + if (!IS_ENABLED(CONFIG_MEDIA_CONTROLLER))
> > > > +         return 0;
> > > >
> > > >   if (sd->entity.function != MEDIA_ENT_F_LENS &&
> > > >       sd->entity.function != MEDIA_ENT_F_FLASH)
> > > > @@ -326,8 +327,6 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> > > >
> > > >   link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
> > > >
> > > > -#endif
> > > > -
> > > >   return IS_ERR(link) ? PTR_ERR(link) : 0;
> > > >  }
> > >
> > > I think I would prefer:
> > >
> > > static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> > >                                          struct v4l2_subdev *sd)
> > > {
> > > #if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> > >     struct media_link *link;
> > >
> > >     ...
> > >
> > >     return IS_ERR(link) ? PTR_ERR(link) : 0;
> > > #else
> > >     return 0;
> > > #endif
> > > }
> > >
> >
> > Me, too.
>
> I actually prefer Ricardo's proposal :-)
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
