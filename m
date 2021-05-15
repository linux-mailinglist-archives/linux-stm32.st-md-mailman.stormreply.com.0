Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A30D4381B0A
	for <lists+linux-stm32@lfdr.de>; Sat, 15 May 2021 22:43:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3543FC57B5F;
	Sat, 15 May 2021 20:43:38 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07B5CC57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 May 2021 20:43:35 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9C6CC82A85;
 Sat, 15 May 2021 22:43:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1621111414;
 bh=cOW2a/Znu89zokYWr/k7mO9lI0zD0AtfhbbUxTvTUkA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HVM+XLMVPNkZJqHxn/fI6Vk5xCvuBFCejMaotA8BleKkOR+QEff8ihLgGRf5AAOCs
 bXVAdYGkTe5VHUDJqpHrKB/AFWNPBaPUnGMsNULGBEuWjGmT6PmAVx7CleemIzeI2R
 A5QBDuZ/7JLMdFXnC0u/bdxcnvkO9Hl5KCp0/UX5ko49hKxtjFXfwz8RstHlM49gnK
 iPaWFYBi5dgJhYMz10Apw0xv1A5ovZCLsVReJy0s/tWSI0KA1HXxJzQchbtkJxgeAy
 54Z5p9x48/TP2OjET1vL2LCUT+q2d6JbOeikGImeWDYL5rJnhzAsMiP4kcG5i+1Rg8
 MJJPBeR6Cyy0Q==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Date: Sat, 15 May 2021 22:43:16 +0200
Message-Id: <20210515204317.366967-2-marex@denx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515204317.366967-1-marex@denx.de>
References: <20210515204317.366967-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, ch@denx.de,
 Antonio Borneo <antonio.borneo@st.com>, Vincent Abriou <vincent.abriou@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [Linux-stm32] [PATCH V4 2/2] drm/bridge: lvds-codec: Add support
	for pixel data sampling edge select
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

The OnSemi FIN3385 Parallel-to-LVDS encoder has a dedicated input line to
select input pixel data sampling edge. Add DT property "pclk-sample", not
the same as the one used by display timings but rather the same as used by
media, and configure bus flags based on this DT property.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Antonio Borneo <antonio.borneo@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Philippe Cornu <philippe.cornu@st.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Vincent Abriou <vincent.abriou@st.com>
Cc: Yannick Fertre <yannick.fertre@st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: dri-devel@lists.freedesktop.org
---
V2: - Limit the pixelclk-active to encoders only
    - Update DT binding document
V3: - Determine whether this is encoder from connector, i.e.
      lvds_codec->connector_type == DRM_MODE_CONNECTOR_LVDS
V4: - Switch to pclk-sample. Note that the value of this is inverted,
      so all the existing users of pixelclk-active using previous
      version of this patch must be reworked
---
 drivers/gpu/drm/bridge/lvds-codec.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index dcf579a4cf83..8a7cb267ab14 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -19,6 +19,7 @@ struct lvds_codec {
 	struct device *dev;
 	struct drm_bridge bridge;
 	struct drm_bridge *panel_bridge;
+	struct drm_bridge_timings timings;
 	struct regulator *vcc;
 	struct gpio_desc *powerdown_gpio;
 	u32 connector_type;
@@ -80,6 +81,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	struct device_node *panel_node;
 	struct drm_panel *panel;
 	struct lvds_codec *lvds_codec;
+	u32 val;
 
 	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
 	if (!lvds_codec)
@@ -119,6 +121,18 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	if (IS_ERR(lvds_codec->panel_bridge))
 		return PTR_ERR(lvds_codec->panel_bridge);
 
+	/*
+	 * Encoder might sample data on different clock edge than the display,
+	 * for example OnSemi FIN3385 has a dedicated strapping pin to select
+	 * the sampling edge.
+	 */
+	if (lvds_codec->connector_type == DRM_MODE_CONNECTOR_LVDS &&
+	    !of_property_read_u32(dev->of_node, "pclk-sample", &val)) {
+		lvds_codec->timings.input_bus_flags = val ?
+			DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE :
+			DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE;
+	}
+
 	/*
 	 * The panel_bridge bridge is attached to the panel's of_node,
 	 * but we need a bridge attached to our of_node for our user
@@ -126,6 +140,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	 */
 	lvds_codec->bridge.of_node = dev->of_node;
 	lvds_codec->bridge.funcs = &funcs;
+	lvds_codec->bridge.timings = &lvds_codec->timings;
 	drm_bridge_add(&lvds_codec->bridge);
 
 	platform_set_drvdata(pdev, lvds_codec);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
