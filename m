Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A4F7561A2
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jul 2023 13:36:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23818C6B452;
	Mon, 17 Jul 2023 11:36:07 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99A19C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jul 2023 11:36:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC0DD16C4;
 Mon, 17 Jul 2023 13:35:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1689593710;
 bh=Q3mYfdnpaLKlY8/jxmRm80QstU9e0PZzEci91ZZE1j4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=D34b2nk3MBeIsD4Hh9go1cz7KYgQfaVb0QwyTeWrvQudhj3fcvsR86k18n5c2Eh/a
 11cp7FnDEwboNqdfvQSni7J+NuSf4nawSesO0QfLQ1Tb/Qq/1vhrC/00e2IYaQomU7
 muczhfhcRx636pqbzTWg6NH753X76UJuCpEmbpUo=
MIME-Version: 1.0
In-Reply-To: <20230714174545.4056287-1-robh@kernel.org>
References: <20230714174545.4056287-1-robh@kernel.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Artur Weber <aweber.kernel@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Chen-Yu Tsai <wens@csie.org>, Christian Gmeiner <christian.gmeiner@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Emma Anholt <emma@anholt.net>,
 Fabio Estevam <festevam@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Guido =?utf-8?q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>, Icenow
 y Zheng <icenowy@aosc.io>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Jianhua Lu <lujianhua000@gmail.com>, John Stultz <jstultz@google.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Liu Ying <victor.liu@nxp.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 Marijn Suijten <marijn.suijten@
 somainline.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 NXP Linux Team <linux-imx@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Ondrej Jirman <megi@xff.cz>, Orson Zhai <orsonzhai@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Purism Kernel Team <kernel@puri.sm>, Qiang Yu <yuq825@gmail.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Sam Ravnborg <sam@ravnborg.org>, Samuel Holland <samuel@sholland.org
 >, Sandy Huang <hjc@rock-chips.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sean Paul <sean@poorly.run>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>,
 Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao <tiantao6@hisilicon.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Tomi Valkeinen <tomba@kernel.org>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Yongqin Liu <yongqin.liu@linaro.org>
Date: Mon, 17 Jul 2023 12:35:59 +0100
Message-ID: <168959375926.3515353.7529038208688306372@Monstersaurus>
User-Agent: alot/0.10
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, xen-devel@lists.xenproject.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] drm: Explicitly include correct DT
	includes
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

Quoting Rob Herring (2023-07-14 18:45:34)
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

>  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c         | 2 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c         | 2 ++
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c         | 1 +
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c       | 1 -
>  drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c      | 1 -

For drivers/gpu/drm/renesas/rcar-du/

> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> index 1ffde19cb87f..3904b0cca814 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> @@ -12,7 +12,7 @@
>  #include <linux/io.h>
>  #include <linux/mm.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/slab.h>
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> index adfb36b0e815..9ff4537c26c8 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> @@ -20,8 +20,10 @@
>  
>  #include <linux/device.h>
>  #include <linux/dma-buf.h>
> +#include <linux/of.h>
>  #include <linux/of_graph.h>
>  #include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/wait.h>
>  
>  #include "rcar_du_crtc.h"
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> index 45c05d0ffc70..9cbb5e6e2cba 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> @@ -22,6 +22,7 @@
>  #include <linux/bitops.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/videodev2.h>
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index e10e4d4b89a2..db2e6f16f954 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -12,7 +12,6 @@
>  #include <linux/math64.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> index aa95b85a2964..8048bdca2d6c 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> @@ -10,7 +10,6 @@
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
