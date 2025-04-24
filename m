Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE174A9B743
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 21:00:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A692C78F70;
	Thu, 24 Apr 2025 19:00:50 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DBBFC78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 19:00:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF9C243B6C;
 Thu, 24 Apr 2025 19:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745521249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Au0mQLhtD+SC9FQejYqXmeWmtMq3lmMU5k6WXMVlQsE=;
 b=VHSCothUYa+yZ/DE6uuYEYLJ7T3s0WHVFO+lyJTVoBzsiyjzypVZzztD+UjQ3bmFZ6xN3B
 t/AiBRIElFxJ0Gz38++StdPb3FfWmhFX5HgDwdPjCXB9TQVb0HeTXcNzgQ8/HC40BRoXRH
 bCpLf8wJ+OS8SDPpryWsg7yuU6G9Ez2QJ5QC9xQZ0puOhLihFw4yw1FIzD/8j5Lrkn1zoB
 A6jcrZGwq9wiJtIF4WbC95OHhBYp+sitFtRX6xgczNEU4L4s34Vmy1sD6YgpwwkwrbRWbO
 HOtLwQwMVklekOrjBsK/n6rDvCBu1d//KUKKeDrM1ngiip1FEUnM/VVAuYkv2g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 24 Apr 2025 20:59:30 +0200
MIME-Version: 1.0
Message-Id: <20250424-drm-bridge-convert-to-alloc-api-v2-23-8f91a404d86b@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfnecuvehluhhsthgvrhfuihiivgepvddtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgegiedvmedusgguugemledutddumedvleegfhdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedvpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepjhgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrt
 ghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
Cc: imx@lists.linux.dev, Anusha Srivatsa <asrivats@redhat.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "Rob Herring \(Arm\)" <robh@kernel.org>, linux-samsung-soc@vger.kernel.org,
 Paul Kocialkowski <paulk@sys-base.io>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, chrome-platform@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <lumag@kernel.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 asahi@lists.linux.dev, freedreno@lists.freedesktop.org
Subject: [Linux-stm32] [PATCH v2 23/34] drm/omap: dss: sdi: convert to
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

Switching from a non-devm to a devm allocation allows removing the kfree()
in the remove function and in the probe error management code, and as a
consequence to simplify the code flow by removing now unnecessary gotos.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/sdi.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
index e78826e4b560a2b9af2d8a5a38e181bd3e44d250..df4cbc683e2ca27ef5fc45f79b77dcdcd9ca529a 100644
--- a/drivers/gpu/drm/omapdrm/dss/sdi.c
+++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
@@ -284,7 +284,6 @@ static const struct drm_bridge_funcs sdi_bridge_funcs = {
 
 static void sdi_bridge_init(struct sdi_device *sdi)
 {
-	sdi->bridge.funcs = &sdi_bridge_funcs;
 	sdi->bridge.of_node = sdi->pdev->dev.of_node;
 	sdi->bridge.type = DRM_MODE_CONNECTOR_LVDS;
 
@@ -344,21 +343,19 @@ int sdi_init_port(struct dss_device *dss, struct platform_device *pdev,
 	u32 datapairs;
 	int r;
 
-	sdi = kzalloc(sizeof(*sdi), GFP_KERNEL);
-	if (!sdi)
-		return -ENOMEM;
+	sdi = devm_drm_bridge_alloc(&pdev->dev, struct sdi_device, bridge, &sdi_bridge_funcs);
+	if (IS_ERR(sdi))
+		return PTR_ERR(sdi);
 
 	ep = of_graph_get_next_port_endpoint(port, NULL);
-	if (!ep) {
-		r = 0;
-		goto err_free;
-	}
+	if (!ep)
+		return 0;
 
 	r = of_property_read_u32(ep, "datapairs", &datapairs);
 	of_node_put(ep);
 	if (r) {
 		DSSERR("failed to parse datapairs\n");
-		goto err_free;
+		return r;
 	}
 
 	sdi->datapairs = datapairs;
@@ -372,19 +369,14 @@ int sdi_init_port(struct dss_device *dss, struct platform_device *pdev,
 		r = PTR_ERR(sdi->vdds_sdi_reg);
 		if (r != -EPROBE_DEFER)
 			DSSERR("can't get VDDS_SDI regulator\n");
-		goto err_free;
+		return r;
 	}
 
 	r = sdi_init_output(sdi);
 	if (r)
-		goto err_free;
+		return r;
 
 	return 0;
-
-err_free:
-	kfree(sdi);
-
-	return r;
 }
 
 void sdi_uninit_port(struct device_node *port)
@@ -395,5 +387,4 @@ void sdi_uninit_port(struct device_node *port)
 		return;
 
 	sdi_uninit_output(sdi);
-	kfree(sdi);
 }

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
