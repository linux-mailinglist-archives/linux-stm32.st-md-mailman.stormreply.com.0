Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D63A9B758
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 21:01:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DD45C78F70;
	Thu, 24 Apr 2025 19:01:24 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA920C78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 19:01:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92AAF43B6C;
 Thu, 24 Apr 2025 19:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745521282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3+Yzp90os1B1+K7TxmcOkUZ2pL98oF+RE1fH12ahofw=;
 b=IFXC3lNWyXZGNzdP409CinsAQprI06XEoz6Cvmh8rCSxhJ5/ak1dFIr6r+FHWhnLNmfvP6
 DOdskDihbRAyNyEWBdZXbdakoWSVm3DhKCXoPY/o9XW+zNCSq7ASnD8rLZZZ8PKKOWYW03
 W5i6YpoFcmC9mzRuwFmgYyjuRsnUCi/yWvvtzp+uJBhwRjrtYrA7bbfvVwYeInfmRsQ0Is
 KdOxSgVMxkIuWk5ewfCnNgz5ahF3hVCnJhWNcyR1GT6GjiWqEezk40lzWa7B/Yh2NNnPoN
 Vj/PZEz5sps6brrDrvVxLXuQYbRAqxlM39+rziK+9Zi5DiUIHm8aP7U/ebvj+Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 24 Apr 2025 20:59:35 +0200
MIME-Version: 1.0
Message-Id: <20250424-drm-bridge-convert-to-alloc-api-v2-28-8f91a404d86b@bootlin.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
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
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfnecuvehluhhsthgvrhfuihiivgepvdegnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgegiedvmedusgguugemledutddumedvleegfhdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedupdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepjhgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrt
 ghpthhtoheprhhgrghllhgrihhsphhouhesghhmrghilhdrtghomhdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
Cc: imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Hui Pu <Hui.Pu@gehealthcare.com>,
 linux-amlogic@lists.infradead.org, Raphael Gallais-Pou <rgallaispou@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <lumag@kernel.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 asahi@lists.linux.dev, freedreno@lists.freedesktop.org
Subject: [Linux-stm32] [PATCH v2 28/34] drm/sti: dvo: convert to
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

This driver allocates the DRM bridge separately from the main driver
private struct, which prevents using the new devm_drm_bridge_alloc()
API. Simplify the code by replacing the struct drm_bridge pointer with an
embedded struct drm_bridge inside the private struct, to make use of the
new API with the same code flow.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Raphael Gallais-Pou <rgallaispou@gmail.com>

Changed in v2:
- fix typos in commit message
---
 drivers/gpu/drm/sti/sti_dvo.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index 74a1eef4674eeabc445b53b380e325f785242024..7484d3c3f4ed5fac7eab408e30cbe2f6b87f27e5 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -97,7 +97,7 @@ struct sti_dvo {
 	struct dvo_config *config;
 	bool enabled;
 	struct drm_encoder *encoder;
-	struct drm_bridge *bridge;
+	struct drm_bridge bridge;
 };
 
 struct sti_dvo_connector {
@@ -439,7 +439,6 @@ static int sti_dvo_bind(struct device *dev, struct device *master, void *data)
 	struct drm_encoder *encoder;
 	struct sti_dvo_connector *connector;
 	struct drm_connector *drm_connector;
-	struct drm_bridge *bridge;
 	int err;
 
 	/* Set the drm device handle */
@@ -455,20 +454,14 @@ static int sti_dvo_bind(struct device *dev, struct device *master, void *data)
 
 	connector->dvo = dvo;
 
-	bridge = devm_kzalloc(dev, sizeof(*bridge), GFP_KERNEL);
-	if (!bridge)
-		return -ENOMEM;
-
-	bridge->driver_private = dvo;
-	bridge->funcs = &sti_dvo_bridge_funcs;
-	bridge->of_node = dvo->dev.of_node;
-	drm_bridge_add(bridge);
+	dvo->bridge.driver_private = dvo;
+	dvo->bridge.of_node = dvo->dev.of_node;
+	drm_bridge_add(&dvo->bridge);
 
-	err = drm_bridge_attach(encoder, bridge, NULL, 0);
+	err = drm_bridge_attach(encoder, &dvo->bridge, NULL, 0);
 	if (err)
 		return err;
 
-	dvo->bridge = bridge;
 	connector->encoder = encoder;
 	dvo->encoder = encoder;
 
@@ -490,7 +483,7 @@ static int sti_dvo_bind(struct device *dev, struct device *master, void *data)
 	return 0;
 
 err_sysfs:
-	drm_bridge_remove(bridge);
+	drm_bridge_remove(&dvo->bridge);
 	return -EINVAL;
 }
 
@@ -499,7 +492,7 @@ static void sti_dvo_unbind(struct device *dev,
 {
 	struct sti_dvo *dvo = dev_get_drvdata(dev);
 
-	drm_bridge_remove(dvo->bridge);
+	drm_bridge_remove(&dvo->bridge);
 }
 
 static const struct component_ops sti_dvo_ops = {
@@ -515,10 +508,10 @@ static int sti_dvo_probe(struct platform_device *pdev)
 
 	DRM_INFO("%s\n", __func__);
 
-	dvo = devm_kzalloc(dev, sizeof(*dvo), GFP_KERNEL);
-	if (!dvo) {
-		DRM_ERROR("Failed to allocate memory for DVO\n");
-		return -ENOMEM;
+	dvo = devm_drm_bridge_alloc(dev, struct sti_dvo, bridge, &sti_dvo_bridge_funcs);
+	if (IS_ERR(dvo)) {
+		DRM_ERROR("Failed to allocate DVO\n");
+		return PTR_ERR(dvo);
 	}
 
 	dvo->dev = pdev->dev;

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
