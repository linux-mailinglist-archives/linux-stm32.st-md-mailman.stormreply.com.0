Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87113A9F14E
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Apr 2025 14:47:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 358E9C7802F;
	Mon, 28 Apr 2025 12:47:41 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83B0DC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 12:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=LMrRcIEPY7Q9w3xDE5e0552Sq4/nmQzTOdECWk3BTP8=; b=b
 We9+8mW+I4hT/nzFKdxG+p/vbuilXDf9o2+aUBFkKPR79bqEtQJdE/sC+9PEXb00
 ga8AgCzUSARhAkaTPAuttd2gETbO3T7O2cNjufquY2Aa9FZem8KEG4nbeaBxM0+0
 zerUAdGVSg/Mvpp05YVkVKp7TcNjpPAOF1Mreokx5o=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-137 (Coremail) ; Mon, 28 Apr 2025 20:44:03 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Mon, 28 Apr 2025 20:44:03 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
X-NTES-SC: AL_Qu2fB/Sfu0ov5SWabOkfmkcVgOw9UcO5v/Qk3oZXOJF8jBLo1zItdntMFln1/t+OJCOIkReYbzJI9MlIe6VRY6sPQCdyBIxAX351AVpDhuQrhQ==
MIME-Version: 1.0
Message-ID: <656e493e.a551.1967c6d0c53.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: iSgvCgAXHxgTeA9o84ahAA--.15978W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hM9XmgPbkX+9wACsl
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Cc: imx@lists.linux.dev, Manikandan Muralidharan <manikandan.m@microchip.com>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vitalii Mordan <mordan@ispras.ru>, Sui Jingfeng <sui.jingfeng@linux.dev>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-kernel@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>,
 Simona Vetter <simona@ffwll.ch>, chrome-platform@lists.linux.dev,
 Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Anusha Srivatsa <asrivats@redhat.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, Janne Grunau <j@jannau.net>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Phong LE <ple@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jesse Van Gavere <jesseevg@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-renesas-soc@vger.kernel.org, Christoph Fritz <chf.fritz@googlemail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 asahi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Kevin Hilman <khilman@baylibre.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, Liu Ying <victor.liu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Aleksandr Mishin <amishin@t-argos.ru>
Subject: Re: [Linux-stm32] [PATCH v2 01/34] drm: convert many bridge drivers
 from devm_kzalloc() to devm_drm_bridge_alloc() API
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

Hi ,

At 2025-04-25 02:59:08, "Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:
>devm_drm_bridge_alloc() is the new API to be used for allocating (and
>partially initializing) a private driver struct embedding a struct
>drm_bridge.
>
>For many drivers having a simple code flow in the probe function, this
>commit does a mass conversion automatically with the following semantic
>patch. The changes have been reviewed manually for correctness as well as
>to find any false positives.
>
>  @@
>  type T;
>  identifier C;
>  identifier BR;
>  expression DEV;
>  expression FUNCS;
>  @@
>  -T *C;
>  +T *C;
>   ...
>  (
>  -C = devm_kzalloc(DEV, ...);
>  -if (!C)
>  -    return -ENOMEM;
>  +C = devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
>  +if (IS_ERR(C))
>  +     return PTR_ERR(C);
>  |
>  -C = devm_kzalloc(DEV, ...);
>  -if (!C)
>  -    return ERR_PTR(-ENOMEM);
>  +C = devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
>  +if (IS_ERR(C))
>  +     return PTR_ERR(C);
>  )
>   ...
>  -C->BR.funcs = FUNCS;
>
>Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
>---
>
>Cc: Adam Ford <aford173@gmail.com>
>Cc: Adrien Grassein <adrien.grassein@gmail.com>
>Cc: Aleksandr Mishin <amishin@t-argos.ru>
>Cc: Andy Yan <andy.yan@rock-chips.com>
>Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>Cc: Benson Leung <bleung@chromium.org>
>Cc: Biju Das <biju.das.jz@bp.renesas.com>
>Cc: Christoph Fritz <chf.fritz@googlemail.com>
>Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>Cc: Detlev Casanova <detlev.casanova@collabora.com>
>Cc: Dharma Balasubiramani <dharma.b@microchip.com>
>Cc: Guenter Roeck <groeck@chromium.org>
>Cc: Heiko Stuebner <heiko@sntech.de>
>Cc: Jani Nikula <jani.nikula@intel.com>
>Cc: Janne Grunau <j@jannau.net>
>Cc: Jerome Brunet <jbrunet@baylibre.com>
>Cc: Jesse Van Gavere <jesseevg@gmail.com>
>Cc: Kevin Hilman <khilman@baylibre.com>
>Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>Cc: Liu Ying <victor.liu@nxp.com>
>Cc: Manikandan Muralidharan <manikandan.m@microchip.com>
>Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>Cc: Matthias Brugger <matthias.bgg@gmail.com>
>Cc: Philipp Zabel <p.zabel@pengutronix.de>
>Cc: Phong LE <ple@baylibre.com>
>Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>
>Cc: Sugar Zhang <sugar.zhang@rock-chips.com>
>Cc: Sui Jingfeng <sui.jingfeng@linux.dev>
>Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>Cc: Vitalii Mordan <mordan@ispras.ru>
>
>Changed in v2:
>- added missing PTR_ERR() in the second spatch alternative
>---
> drivers/gpu/drm/adp/adp-mipi.c                      |  8 ++++----
> drivers/gpu/drm/bridge/adv7511/adv7511_drv.c        |  9 ++++-----
> drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c  |  9 ++++-----
> drivers/gpu/drm/bridge/aux-bridge.c                 |  9 ++++-----
> drivers/gpu/drm/bridge/aux-hpd-bridge.c             |  9 +++++----
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c |  8 ++++----
> drivers/gpu/drm/bridge/chipone-icn6211.c            |  9 ++++-----
> drivers/gpu/drm/bridge/chrontel-ch7033.c            |  8 ++++----
> drivers/gpu/drm/bridge/cros-ec-anx7688.c            |  9 ++++-----
> drivers/gpu/drm/bridge/fsl-ldb.c                    |  7 +++----
> drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c      |  9 ++++-----
> drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c        | 10 ++++------
> drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c     |  8 ++++----
> drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c        |  8 ++++----
> drivers/gpu/drm/bridge/ite-it6263.c                 |  9 ++++-----
> drivers/gpu/drm/bridge/ite-it6505.c                 |  9 ++++-----
> drivers/gpu/drm/bridge/ite-it66121.c                |  9 ++++-----
> drivers/gpu/drm/bridge/lontium-lt8912b.c            |  9 ++++-----
> drivers/gpu/drm/bridge/lontium-lt9211.c             |  8 +++-----
> drivers/gpu/drm/bridge/lontium-lt9611.c             |  9 ++++-----
> drivers/gpu/drm/bridge/lvds-codec.c                 |  9 ++++-----
> drivers/gpu/drm/bridge/microchip-lvds.c             |  8 ++++----
> drivers/gpu/drm/bridge/nwl-dsi.c                    |  8 ++++----
> drivers/gpu/drm/bridge/parade-ps8622.c              |  9 ++++-----
> drivers/gpu/drm/bridge/parade-ps8640.c              |  9 ++++-----
> drivers/gpu/drm/bridge/sii9234.c                    |  9 ++++-----
> drivers/gpu/drm/bridge/sil-sii8620.c                |  9 ++++-----
> drivers/gpu/drm/bridge/simple-bridge.c              | 10 ++++------
> drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c        |  8 ++++----
> drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c       |  8 ++++----
> drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c      |  8 ++++----
> drivers/gpu/drm/bridge/tc358762.c                   |  9 ++++-----
> drivers/gpu/drm/bridge/tc358764.c                   |  9 ++++-----
> drivers/gpu/drm/bridge/tc358768.c                   |  9 ++++-----
> drivers/gpu/drm/bridge/tc358775.c                   |  9 ++++-----
> drivers/gpu/drm/bridge/thc63lvd1024.c               |  8 ++++----
> drivers/gpu/drm/bridge/ti-dlpc3433.c                |  9 ++++-----
> drivers/gpu/drm/bridge/ti-tdp158.c                  |  8 ++++----
> drivers/gpu/drm/bridge/ti-tfp410.c                  |  9 ++++-----
> drivers/gpu/drm/bridge/ti-tpd12s015.c               |  9 ++++-----
> drivers/gpu/drm/mediatek/mtk_dp.c                   |  9 ++++-----
> drivers/gpu/drm/mediatek/mtk_dpi.c                  |  9 ++++-----
> drivers/gpu/drm/mediatek/mtk_dsi.c                  |  9 ++++-----
> drivers/gpu/drm/mediatek/mtk_hdmi.c                 |  9 ++++-----
> drivers/gpu/drm/meson/meson_encoder_cvbs.c          | 12 ++++++------
> drivers/gpu/drm/meson/meson_encoder_dsi.c           | 12 ++++++------
> drivers/gpu/drm/meson/meson_encoder_hdmi.c          | 12 ++++++------
> drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c         |  9 ++++-----
> drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c      | 10 ++++------
> 49 files changed, 201 insertions(+), 237 deletions(-)
>

......

> 
>@@ -202,9 +203,6 @@ static int simple_bridge_probe(struct platform_device *pdev)
> 	if (IS_ERR(sbridge->enable))
> 		return dev_err_probe(&pdev->dev, PTR_ERR(sbridge->enable),
> 				     "Unable to retrieve enable GPIO\n");
>-
>-	/* Register the bridge. */
>-	sbridge->bridge.funcs = &simple_bridge_bridge_funcs;
> 	sbridge->bridge.of_node = pdev->dev.of_node;
> 	sbridge->bridge.timings = sbridge->info->timings;
> 
>diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
>index 5e5f8c2f95be1f5c4633f1093b17a00f9425bb37..9b1dfdb5e7ee528c876c01916c9821d550cad679 100644
>--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
>+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
>@@ -1045,9 +1045,10 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
> 		return ERR_PTR(-ENODEV);
> 	}
> 
>-	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
>-	if (!hdmi)
>-		return ERR_PTR(-ENOMEM);
>+	hdmi = devm_drm_bridge_alloc(dev, struct dw_hdmi_qp, bridge,
>+				     &dw_hdmi_qp_bridge_funcs);
>+	if (IS_ERR(hdmi))
>+		return PTR_ERR(hdmi);

           This should return hdmi or ERR_CAST(hdmi);


> 
> 	hdmi->dev = dev;
> 
>@@ -1073,7 +1074,6 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
> 		return ERR_PTR(ret);
> 
> 	hdmi->bridge.driver_private = hdmi;
>-	hdmi->bridge.funcs = &dw_hdmi_qp_bridge_funcs;
> 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT |
> 			   DRM_BRIDGE_OP_EDID |
> 			   DRM_BRIDGE_OP_HDMI |
>diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>index b08ada920a501d6a62f39581944a87019f5e5c15..87886235b8d3a85e0711f7763d048ad9eefd159a 100644
>--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>@@ -1194,9 +1194,10 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
> 	struct dw_mipi_dsi *dsi;
> 	int ret;
> 
>-	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
>-	if (!dsi)
>-		return ERR_PTR(-ENOMEM);
>+	dsi = devm_drm_bridge_alloc(dev, struct dw_mipi_dsi, bridge,
>+				    &dw_mipi_dsi_bridge_funcs);
>+	if (IS_ERR(dsi))
>+		return PTR_ERR(dsi);


This shoud return dsi or ERR_CAST(dsi);
> 
> 	dsi->dev = dev;
> 	dsi->plat_data = plat_data;
>@@ -1265,7 +1266,6 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
> 	}
> 
> 	dsi->bridge.driver_private = dsi;
>-	dsi->bridge.funcs = &dw_mipi_dsi_bridge_funcs;
> 	dsi->bridge.of_node = pdev->dev.of_node;
> 
> 	return dsi;
>diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
>index c76f5f2e74d14bd372f969c6c7832aa57f80772b..9f694f72b521912f5d4af46f2df2fc0fe3f776ea 100644
>--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
>+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
>@@ -914,9 +914,10 @@ __dw_mipi_dsi2_probe(struct platform_device *pdev,
> 	struct dw_mipi_dsi2 *dsi2;
> 	int ret;
> 
>-	dsi2 = devm_kzalloc(dev, sizeof(*dsi2), GFP_KERNEL);
>-	if (!dsi2)
>-		return ERR_PTR(-ENOMEM);
>+	dsi2 = devm_drm_bridge_alloc(dev, struct dw_mipi_dsi2, bridge,
>+				     &dw_mipi_dsi2_bridge_funcs);
>+	if (IS_ERR(dsi2))
>+		return PTR_ERR(dsi2);

This should return dsi2 or ERR_CAST(dis2);

> 
> 	dsi2->dev = dev;
> 	dsi2->plat_data = plat_data;
>@@ -981,7 +982,6 @@ __dw_mipi_dsi2_probe(struct platform_device *pdev,
> 	}
> 
> 	dsi2->bridge.driver_private = dsi2;
>-	dsi2->bridge.funcs = &dw_mipi_dsi2_bridge_funcs;
> 	dsi2->bridge.of_node = pdev->dev.of_node;
> 
> 	return dsi2;
>
> 	/* Init host device */
>
>-- 
>2.49.0
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
