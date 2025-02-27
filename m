Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B2CA471B0
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 02:52:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F82CC7A835;
	Thu, 27 Feb 2025 01:52:45 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62595C7A833
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 01:52:43 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-5fcf21d7235so167248eaf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 17:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740621162; x=1741225962;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ixz4rke/Pu4MIs/yXHWsa0RBvJ804N4RrG8GmiSG7vE=;
 b=Ti4hC555/OoqQdh2TbrMFmUMGrmxU4u1dJo5kE/mpdJYYVMk6Cb6oC0kUvH0jNftAg
 yEHmkqsRDHFVyQPSacLtsNfjPmjgyze7H4WOVYh/PKJxhHCcyArLRNQONklZhelgw3ds
 akVehyRInicXcGNW+ZczXtu24j4Zxx+/jv0Rn94UDzZ+d35AcIHErkK2zU3fka+/N70R
 gElWCny7GyGfq848PBf203c5/uRiM/Sg+zxx59UCoyOFY6IbbuP9McLhtpgJqGs+Fi4z
 BKqAlsoNPUoa3t2GMx3PmZDV/nPklUi6QyFSLDG8bDy+3MGQ3QZyVLGdAhN1Y7HAchgX
 AfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740621162; x=1741225962;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ixz4rke/Pu4MIs/yXHWsa0RBvJ804N4RrG8GmiSG7vE=;
 b=tm1HEUwArMLnwo28twX98jSJXx+SdlgiOAHiYq+zAYWcBJWgtHk0rvpah3XCLoLRcW
 uotmgK6FR4bKo+Hwv2HUBw76fslrGRlgj2xy/NtZn+Z8jz6q9aYpcyhDmKz6BNFlTjAC
 vXrx2TQLsAJEp5ejgRaJvOIkytq3f47XqHiJFrAMQCSKbKMezmWDCo1fPmRePeAAQqJW
 WrJxtZ0EIOgKfbbSGOeyi9fj2T3nX1V9mSfDN8c/aTne+HKhzXoq1zgGI2cLHdjSA1SM
 qW+6uVf0HLvh1y9tkvREy7coSKqOl7JGzi8n5qGF6ARL77dDDRUMeLQOOOJh6Ll6Cznn
 B/eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF/Q5mVh82fdAgu0zKKVeeKyJBH85ttlZizDZ1QUrycgcUteJp1xLAgFze+o4kOrmIPiOQWA+PdX9/aA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzvuDG0zGRoSWGRY65q8XPZQatFSZEP8myahhC5h1s6SDvbctS+
 yxQCF4tqld38hu0rFn/zmw+sB3/MPQshRZDTEgha/lgWyVraXkOfDoiE17GunIa7+MPv61lkTEU
 KByfv8XW+8LHuhxo9s/Ou7SpHPjo=
X-Gm-Gg: ASbGncvhWGyWs104TQxUIbxYY1Q8GXoARQkMo5zNmt2KokC0C8gq8eCTkG8Zkfhbk1q
 25D2sqHNBHJMeI6D7ul8/gwov8cIPKMI0EM7fFws4nHH9DhqzxK/JM9QdWOBQTI2KZ+7aXkOpiu
 /qO5MiUkstH14l2edyQ2ZYkQhWVeKjpZAsUR6BO9c=
X-Google-Smtp-Source: AGHT+IGqnXgTmRNVtKjZ/iy4Us2fHmhfpIjxOOKmUbGHr3+Ih8p+w6kJGd3DiiswHNSoSt374klMkalELnpHhT8BfD0=
X-Received: by 2002:a05:6808:1513:b0:3f3:f90b:f1b3 with SMTP id
 5614622812f47-3f425a658admr16487647b6e.5.1740621162105; Wed, 26 Feb 2025
 17:52:42 -0800 (PST)
MIME-Version: 1.0
References: <20250225-memory-drm-misc-next-v1-0-9d0e8761107a@redhat.com>
 <20250225-memory-drm-misc-next-v1-6-9d0e8761107a@redhat.com>
In-Reply-To: <20250225-memory-drm-misc-next-v1-6-9d0e8761107a@redhat.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Thu, 27 Feb 2025 09:52:06 +0800
X-Gm-Features: AQ5f1Jo4V-x_aMe6cNu_t6bm5DyuMpmkfFoBZmOQ95iqLbLXuNwjk8JtAQUipWI
Message-ID: <CAAfSe-vGC2bA10yNRjSkLo3Y=2K8HJvssuM8qLeB=57vQk1eZg@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH RESEND 06/12] drm/sprd: move to
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

On Wed, 26 Feb 2025 at 06:22, Anusha Srivatsa <asrivats@redhat.com> wrote:
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

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

> ---
>  drivers/gpu/drm/sprd/sprd_dpu.c | 9 +--------
>  drivers/gpu/drm/sprd/sprd_dsi.c | 9 +--------
>  2 files changed, 2 insertions(+), 16 deletions(-)
>
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
> 2.48.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
