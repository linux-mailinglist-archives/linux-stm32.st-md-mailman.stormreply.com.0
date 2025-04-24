Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FCDA9B8D3
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 22:11:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10A7DC78F72;
	Thu, 24 Apr 2025 20:11:36 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9233C78F70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 20:11:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F2A043A53;
 Thu, 24 Apr 2025 20:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745525494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=09PG+fxuKesOM/kP22ajuEbhOQfehjAeduUbezP82Mg=;
 b=MDQiMXwM5Q6Bw/oa/uvytc0mvtbv7DY7eO7AgzCRzcWizRHKKKcSnyc0iJLbNVTw3Wsr6J
 lTOqEIBpBUTVqeWYByUkK9Vr4B1fufwPqZl7YxYRoWAyaBP1xMe1FKuin1fkR2amiI8dF0
 g4m6ihEA5Sz5uKfTe90sT+P+hHpzDS0N1w8Eup2LzDQrQMZHVyRc/xdFInUSbca9eev8lk
 S91hJDIYFe8zBrsqAHK0miPfASgOMYTye6Z7W6eIE6MEXvKIMHHApCEBVFDrzlDwCSVoJ3
 qsOh05OZ4XanGRLXUXv1Kzadf2o8Wr2tXbrVszd0YlKh6k3OKd9EvxoaBkoDbQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 24 Apr 2025 22:05:49 +0200
Message-ID: <20250424-drm-bridge-convert-to-alloc-api-v2-34-8f91a404d86b@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtfeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudffiefgvdfftdffkeejjefhffduleejleeuieetieetgeehtefhjedtgeegieegnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgegiedvmedusgguugemledutddumedvleegfhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgegiedvmedusgguugemledutddumedvleegfhdphhgvlhhopegsohhothihrdhfrhhithiirdgsohigpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeelpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdru
 ggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
Cc: chrome-platform@lists.linux.dev, imx@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-arm-msm@vger.kernel.org,
 Anusha Srivatsa <asrivats@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 asahi@lists.linux.dev, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 freedreno@lists.freedesktop.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 34/34] drm/bridge: panel: convert to
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

This is the new API for allocating DRM bridges.

The devm lifetime management of this driver is peculiar. The underlying
device for the panel_bridge is the panel, and the devm lifetime is tied the
panel device (panel->dev). However the panel_bridge allocation is not
performed by the panel driver, but rather by a separate entity (typically
the previous bridge in the encoder chain).

Thus when that separate entoty is destroyed, the panel_bridge is not
removed automatically by devm, so it is rather done explicitly by calling
drm_panel_bridge_remove(). This is the function that does devm_kfree() the
panel_bridge in current code, so update it as well to put the bridge
reference instead.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/panel.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 79b009ab9396048eac57ad47631a902e949d77c6..ddd1e91970d09b93aa64f50cd9155939a12a2c6f 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -287,15 +287,14 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
 	if (!panel)
 		return ERR_PTR(-EINVAL);
 
-	panel_bridge = devm_kzalloc(panel->dev, sizeof(*panel_bridge),
-				    GFP_KERNEL);
-	if (!panel_bridge)
-		return ERR_PTR(-ENOMEM);
+	panel_bridge = devm_drm_bridge_alloc(panel->dev, struct panel_bridge, bridge,
+					     &panel_bridge_bridge_funcs);
+	if (IS_ERR(panel_bridge))
+		return (void *)panel_bridge;
 
 	panel_bridge->connector_type = connector_type;
 	panel_bridge->panel = panel;
 
-	panel_bridge->bridge.funcs = &panel_bridge_bridge_funcs;
 	panel_bridge->bridge.of_node = panel->dev->of_node;
 	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
 	panel_bridge->bridge.type = connector_type;
@@ -327,7 +326,7 @@ void drm_panel_bridge_remove(struct drm_bridge *bridge)
 	panel_bridge = drm_bridge_to_panel_bridge(bridge);
 
 	drm_bridge_remove(bridge);
-	devm_kfree(panel_bridge->panel->dev, bridge);
+	devm_drm_put_bridge(panel_bridge->panel->dev, bridge);
 }
 EXPORT_SYMBOL(drm_panel_bridge_remove);
 

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
