Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 528AA81B724
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 14:17:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0526EC6B477;
	Thu, 21 Dec 2023 13:17:45 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEE9AC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 13:17:43 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dbdb124491cso612696276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 05:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703164662; x=1703769462;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yz4iMeRIk9TAyj97jIuOOIhseoq5SQwyyx45BqaJo/Y=;
 b=d3HZCajHEyD5dDZgV9CttKKdilnLGdibmup0QLXlD3ztmC0XR0E0IlTj08e9CqVA3o
 fupYc8d4FN5ZU2grjQmy4wL1x6dVWSKp9+J+QJK5kSFQg6cktaBBf9v+YEWXJmP1p051
 SVGt1niYHRwfA/knBMLm5GWAdb1GCt0TKfhz4GtHRnGpcNyQjOHQ+gCRYxEV0MaYOCRT
 xTrR4Fv4/xwor1DVSrQ/DO5VMVY5pbkgRefa3mRjkW3H2o6reE/hBO8eKIC1dLwl4vjI
 k8o95Qo231NwBidrrW4hffJn8w99njPta09MhGDVabYoN0mtk9E4AGtihbTb++0ywpwU
 PFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703164662; x=1703769462;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yz4iMeRIk9TAyj97jIuOOIhseoq5SQwyyx45BqaJo/Y=;
 b=PieOyhg2OEZ72X8Hvp+E3nhr8U1GBVc8AIzeIx4P+IF/MJk4do0PolISBypCAIkflZ
 82BbtbLVREcK7bwbjTdJG34f2aj8/DxWr8ooZ5YvR8vKABai3zr4V+eMJL5W4MNQxja9
 AR9fKfqvfd07oc1o300W0FTRNyj5BeGZEdF2nf1uGDdsjoq75w4BFA+7bSyhp/+p42Ch
 jzd+ykS+I+zzrhaq4+Vt327+oYlInrd7D7CA2a5V9scq6O3kHpJgNOSpt8bobSpdKmWZ
 dtVy6IOgZt9R8dxHOhmLTJZX7P8/VFYemM865BsNzgd1BWWsqB11MwOrIGmVavcWZaCN
 xoPg==
X-Gm-Message-State: AOJu0Yx6VCkupFIfgCMMLIxwvM1+g+SA//FfbmQanDDbGRPbBSkDY0ms
 GtUwuHiIkmfk7BpMxZgeEGs6KTFeQKFoUOmFe2m/vwJ3bleFzw==
X-Google-Smtp-Source: AGHT+IE6C22+LNsiW2F843YHTth236QybUB1q3GOCwkhb/XTsX0HV0yBBuaiZlIIsroN5Kv3yXPy3tcoUpEyfVuKgWw=
X-Received: by 2002:a25:b312:0:b0:dbd:9a2f:be3d with SMTP id
 l18-20020a25b312000000b00dbd9a2fbe3dmr322201ybj.3.1703164662693; Thu, 21 Dec
 2023 05:17:42 -0800 (PST)
MIME-Version: 1.0
References: <20231221124339.420119-1-raphael.gallais-pou@foss.st.com>
 <20231221124339.420119-5-raphael.gallais-pou@foss.st.com>
In-Reply-To: <20231221124339.420119-5-raphael.gallais-pou@foss.st.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Dec 2023 15:17:31 +0200
Message-ID: <CAA8EJpq-NWUEe8QbUwDHu0BBSViWKh92PujD7PA84xgvSUsvhg@mail.gmail.com>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Sam Ravnborg <sam@ravnborg.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH RESEND v1 4/8] drm/stm: ltdc: implement
	bus clock
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

On Thu, 21 Dec 2023 at 14:45, Raphael Gallais-Pou
<raphael.gallais-pou@foss.st.com> wrote:
>
> From: Yannick Fertre <yannick.fertre@foss.st.com>
>
> The latest hardware version of the LTDC presents the addition of a bus
> clock, which contains the global configuration registers and the interrupt
> register.
>
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>  drivers/gpu/drm/stm/ltdc.c | 8 ++++++++
>  drivers/gpu/drm/stm/ltdc.h | 1 +
>  2 files changed, 9 insertions(+)

I might be missing something, but I don't see this clock being set
(compare this patch to the patch 5/8)

>
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 5576fdae4962..67064f47a4cb 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -1896,6 +1896,8 @@ void ltdc_suspend(struct drm_device *ddev)
>
>         DRM_DEBUG_DRIVER("\n");
>         clk_disable_unprepare(ldev->pixel_clk);
> +       if (ldev->bus_clk)
> +               clk_disable_unprepare(ldev->bus_clk);
>  }
>
>  int ltdc_resume(struct drm_device *ddev)
> @@ -1910,6 +1912,12 @@ int ltdc_resume(struct drm_device *ddev)
>                 DRM_ERROR("failed to enable pixel clock (%d)\n", ret);
>                 return ret;
>         }
> +       if (ldev->bus_clk) {
> +               if (clk_prepare_enable(ldev->bus_clk)) {
> +                       DRM_ERROR("Unable to prepare bus clock\n");
> +                       return -ENODEV;
> +               }
> +       }
>
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/stm/ltdc.h b/drivers/gpu/drm/stm/ltdc.h
> index 9d488043ffdb..155d8e4a7c6b 100644
> --- a/drivers/gpu/drm/stm/ltdc.h
> +++ b/drivers/gpu/drm/stm/ltdc.h
> @@ -44,6 +44,7 @@ struct ltdc_device {
>         void __iomem *regs;
>         struct regmap *regmap;
>         struct clk *pixel_clk;  /* lcd pixel clock */
> +       struct clk *bus_clk;    /* bus clock */
>         struct mutex err_lock;  /* protecting error_status */
>         struct ltdc_caps caps;
>         u32 irq_status;
> --
> 2.25.1
>


-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
