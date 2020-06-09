Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5761F42DD
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jun 2020 19:48:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60EA0C36B2F;
	Tue,  9 Jun 2020 17:48:37 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC772C36B23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2020 17:48:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id D6EA82A3BF5
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Date: Tue,  9 Jun 2020 20:49:52 +0300
Message-Id: <20200609174959.955926-5-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200609174959.955926-1-adrian.ratiu@collabora.com>
References: <20200609174959.955926-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Heiko Stuebner <heiko@sntech.de>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yannick FERTRE <yannick.fertre@st.com>,
 Andrzej Hajda <a.hajda@samsung.com>, linux-imx@nxp.com, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [Linux-stm32] [PATCH v9 04/11] drm: bridge: dw_mipi_dsi: remove
	bind/unbind API
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

The DW mipi-dsi bind/unbind API was only used to attach the bridge to
the encoder in the Rockchip driver, but with the addition of i.MX6 it
gets more complicated because the i.MX6 part of the bridge is another
bridge in itself which needs to daisy chain to the dw-mipi-dsi core.

So, instead of extending this API to allow daisy-chaining bridges and
risk having trouble with multiple connectors added by various bridges
just delete it and let the DW core bridge be accesed by SoC-specific
parts via the of_drm_find_bridge() API.

This just fixes the Rockchip driver for the bind() deprecation, it
doesn't convert it to a proper bridge daisy-chain with simple encoder
and bridge .attach call-backs, that refactoring work should be done
separately (and the i.MX6 driver can be used as reference).

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
New in v9.
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 22 -------------------
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |  7 +++---
 2 files changed, 3 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 16fd87055e7b7..70df0578cbe7b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -1453,28 +1453,6 @@ void dw_mipi_dsi_remove(struct dw_mipi_dsi *dsi)
 }
 EXPORT_SYMBOL_GPL(dw_mipi_dsi_remove);
 
-/*
- * Bind/unbind API, used from platforms based on the component framework.
- */
-int dw_mipi_dsi_bind(struct dw_mipi_dsi *dsi, struct drm_encoder *encoder)
-{
-	int ret;
-
-	ret = drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
-	if (ret) {
-		DRM_ERROR("Failed to initialize bridge with drm\n");
-		return ret;
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(dw_mipi_dsi_bind);
-
-void dw_mipi_dsi_unbind(struct dw_mipi_dsi *dsi)
-{
-}
-EXPORT_SYMBOL_GPL(dw_mipi_dsi_unbind);
-
 MODULE_AUTHOR("Chris Zhong <zyw@rock-chips.com>");
 MODULE_AUTHOR("Philippe Cornu <philippe.cornu@st.com>");
 MODULE_DESCRIPTION("DW MIPI DSI host controller driver");
diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 3feff0c45b3f7..86f87c7ea03cf 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -876,6 +876,7 @@ static int dw_mipi_dsi_rockchip_bind(struct device *dev,
 {
 	struct dw_mipi_dsi_rockchip *dsi = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
+	struct drm_bridge *dw_bridge = of_drm_find_bridge(dev->of_node);
 	struct device *second;
 	bool master1, master2;
 	int ret;
@@ -929,9 +930,9 @@ static int dw_mipi_dsi_rockchip_bind(struct device *dev,
 		return ret;
 	}
 
-	ret = dw_mipi_dsi_bind(dsi->dmd, &dsi->encoder);
+	ret = drm_bridge_attach(&dsi->encoder, dw_bridge, NULL, 0);
 	if (ret) {
-		DRM_DEV_ERROR(dev, "Failed to bind: %d\n", ret);
+		DRM_DEV_ERROR(dev, "Failed to attach DW DSI bridge: %d\n", ret);
 		return ret;
 	}
 
@@ -947,8 +948,6 @@ static void dw_mipi_dsi_rockchip_unbind(struct device *dev,
 	if (dsi->is_slave)
 		return;
 
-	dw_mipi_dsi_unbind(dsi->dmd);
-
 	clk_disable_unprepare(dsi->pllref_clk);
 }
 
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
