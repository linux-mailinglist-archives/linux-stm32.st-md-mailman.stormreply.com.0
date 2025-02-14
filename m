Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CC6A353D4
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2025 02:40:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74D83C78F7D;
	Fri, 14 Feb 2025 01:40:47 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98474C78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2025 01:40:39 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-2adc2b6837eso536709fac.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 17:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739497238; x=1740102038;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p4aqqg9T7Texkg+zEN9mq7DtWDF92KdPzGxhWCeQ+QA=;
 b=OcPas7P3ORwZvkNkRuw/Ul753RjGobQTt+jPlvOqyq1d/NBG+7Ju1qYzusIu0YykpN
 sqZB+7//gcF0cq2MZKHU2AjNG1zu9wMoz+8SLmMmrgxaFtTu5uC3srYzrMtY3Aifg73Z
 Dz4288cCyujwpPQnQXeWn2EqYxxOcGlk4Yot008FabFLw2QTLZZ7HPAsrHUHFz89UuBg
 qkAqTefS+yG0jKWRBmOD6AnUAIhyTCwKJstzWH5EVVp9JYLqS72mCfziGFGejkyeOe5u
 BJnYU60CwF3gzcFWVjMbAQVeUYvW6sAjWzRigVvbI5y7GwmrivZEBwsqmIiDu8i91g3j
 ZvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739497238; x=1740102038;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p4aqqg9T7Texkg+zEN9mq7DtWDF92KdPzGxhWCeQ+QA=;
 b=Ke6QDLAGW7Z8O/flxjqSippWhgWspbFqG+epWlNm52hapi4TuuMbef0KegXdAjbGUc
 DbMkKS9Qj/Rsxk5rSNQpmnw0hqlVdiDO+j2XPVN7O/o8qS4BdL6qorQItKw4f/mPnILN
 h7O29yvZeMB3RBipDELFdrMtX1CPqMxw8n7NyCB1aOTWBM0C5yWrUzFY3fifCod5ww9P
 BuBpGWL+0am//HEVwCIhvqqwkjZ2ZAkQhQoSBeAC3JMePx8ZMvaOgEcYXpgvLa5s11xt
 RYO8MefX2qMZoW1HIhQ1CoxlOfikRK9KHOu9RRwsaQDUL5Uu8FQhsFW/NnlmxGw/m/D5
 mrFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYcXPmInxvFIzpyiDyYxfbllqCsePMxT2V2r+6GGJ1RjRkxt8rNgVBwXsA5tddtHgw8sar3+RakbaIvA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzDZgkr1WUDm0oDhC5hWFLtmX2HPVVnWfkEayzbHp7qIqsy92wu
 6VeXKibNMP4JUKD8I7XLtsCc8hYS0X4zO3GsjCinzs/PmqsSgLPGQcbCz6iKmILcAAwocD8JOEf
 gabNAXSv9YlQgC9Haa4sUyavAGrY=
X-Gm-Gg: ASbGnctCEBXl1COS5dC3HkvZeDMc0cS0huSBJoZWnANsvYiW7sMXPGvHfDAa0bdbF7u
 y1WdWOmrQ+4uBRYJh9JpYvvLfC7HakAucWoTGrJZuRhiPj7aU5sbZN7oLMTb9AHFF7txHOGRZhR
 0jwFlNZNK95jliJ2aXhizBWHcW6Uo2
X-Google-Smtp-Source: AGHT+IHaPhkpQ5sudo7SaVi7TcjcMdEkzloixKb0RO5UQ+Y460AaIBKtk0bx5VU/HVpLudsUAUuG+ituDRPvvbj3Blg=
X-Received: by 2002:a05:6870:3313:b0:29e:4578:5f74 with SMTP id
 586e51a60fabf-2b8f8aaf65amr3390978fac.4.1739497238239; Thu, 13 Feb 2025
 17:40:38 -0800 (PST)
MIME-Version: 1.0
References: <20250213-mem-cocci-v3-v1-0-93466d165349@redhat.com>
 <20250213-mem-cocci-v3-v1-6-93466d165349@redhat.com>
In-Reply-To: <20250213-mem-cocci-v3-v1-6-93466d165349@redhat.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Fri, 14 Feb 2025 09:40:01 +0800
X-Gm-Features: AWEUYZmNNW2GxKBvhWTtapwmiPwzOWM-ubPmXZmO79ZpLPJrrgzjYmiy7fGvf4g
Message-ID: <CAAfSe-tNuzNCi=oR4Yv=TLRPt5jUmcozv+mtfu=PBT+6LqsHDw@mail.gmail.com>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 linux-doc@vger.kernel.org, Xinliang Liu <xinliang.liu@linaro.org>,
 Stefan Agner <stefan@agner.ch>, Mikko Perttunen <mperttunen@nvidia.com>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 John Stultz <jstultz@google.com>, David Airlie <airlied@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Simona Vetter <simona@ffwll.ch>,
 Marek Vasut <marex@denx.de>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Tian Tao <tiantao6@hisilicon.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 06/12] drm/sprd: move to
	devm_platform_ioremap_resource() usage
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

On Fri, 14 Feb 2025 at 08:20, Anusha Srivatsa <asrivats@redhat.com> wrote:
>
> Replace platform_get_resource + devm_ioremap
> with just devm_platform_ioremap_resource()
>
> Used Coccinelle to do this change. SmPl patch:
> @rule_2@
> identifier res;
> expression ioremap;
> identifier pdev;
> @@
> -struct resource *res;
> ...
> -res = platform_get_resource(pdev,...);
> <...
> -if (!res) {
> -...
> -}
> ...>
> -ioremap = devm_ioremap(...);
> +ioremap = devm_platform_ioremap_resource(pdev,0);
>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/sprd/sprd_dpu.c | 9 +--------
>  drivers/gpu/drm/sprd/sprd_dsi.c | 9 +--------
>  2 files changed, 2 insertions(+), 16 deletions(-)
>

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan

> diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
> index cb2816985305fd19eac27413c214681a5a1e9ffa..65cd5aa1634eee5a6735ccffa4ee3979844d92ce 100644
> --- a/drivers/gpu/drm/sprd/sprd_dpu.c
> +++ b/drivers/gpu/drm/sprd/sprd_dpu.c
> @@ -784,16 +784,9 @@ static int sprd_dpu_context_init(struct sprd_dpu *dpu,
>  {
>         struct platform_device *pdev = to_platform_device(dev);
>         struct dpu_context *ctx = &dpu->ctx;
> -       struct resource *res;
>         int ret;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       if (!res) {
> -               dev_err(dev, "failed to get I/O resource\n");
> -               return -EINVAL;
> -       }
> -
> -       ctx->base = devm_ioremap(dev, res->start, resource_size(res));
> +       ctx->base = devm_platform_ioremap_resource(pdev, 0);
>         if (!ctx->base) {
>                 dev_err(dev, "failed to map dpu registers\n");
>                 return -EFAULT;
> diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
> index 8fc26479bb6bce0aa94914f49d0986a7e19326c1..1668bb4166ab0ad3812c5654244544a9caf249a6 100644
> --- a/drivers/gpu/drm/sprd/sprd_dsi.c
> +++ b/drivers/gpu/drm/sprd/sprd_dsi.c
> @@ -901,15 +901,8 @@ static int sprd_dsi_context_init(struct sprd_dsi *dsi,
>  {
>         struct platform_device *pdev = to_platform_device(dev);
>         struct dsi_context *ctx = &dsi->ctx;
> -       struct resource *res;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       if (!res) {
> -               dev_err(dev, "failed to get I/O resource\n");
> -               return -EINVAL;
> -       }
> -
> -       ctx->base = devm_ioremap(dev, res->start, resource_size(res));
> +       ctx->base = devm_platform_ioremap_resource(pdev, 0);
>         if (!ctx->base) {
>                 drm_err(dsi->drm, "failed to map dsi host registers\n");
>                 return -ENXIO;
>
> --
> 2.47.0
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
