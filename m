Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3C6AB161E
	for <lists+linux-stm32@lfdr.de>; Fri,  9 May 2025 15:56:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BD84C78F99;
	Fri,  9 May 2025 13:56:56 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18E60C78F96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 May 2025 13:56:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8D1743B63;
 Fri,  9 May 2025 13:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1746799014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KOcho37MvrVhiA5dQkVJX8FlRBRSDHiJRf+zEmA1rlY=;
 b=CndV2qgaPqO3LuApWCi1K2vmBzFmnB9puzhxZvWpn+taK86Eei7N1/UlnpOWvycXKcm3ei
 OXJsDcIbdqC5pA3dFPg8A58jlTSmqYWRlMBc+2FtdYRHwysUfZibXtR/3yoxjZj3W+kmRP
 Oaz8BhvT2/QeOUuRzgYpcvpljb31GBY8rxKQO6QG3aidrRFJWL+Qc4wwu2ToefYP0GWT2V
 Duos+FswOXgHcaFjdeL/UsBg4qF+mVh63yAcG+V3t0cY88WvumDcdAYtClHKsHciG8qvrS
 BbGt1cmgbE5BG3vhsmNZyUrxcTZHX3hAPwkbXSik46YKw0hUpKEeHXbB7rlLSw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 May 2025 15:53:39 +0200
MIME-Version: 1.0
Message-Id: <20250509-drm-bridge-convert-to-alloc-api-v3-13-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpeduudenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedtpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnu
 higqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrshhrihhvrghtshesrhgvughhrghtrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
Cc: chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 linux-arm-msm@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, asahi@lists.linux.dev,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 freedreno@lists.freedesktop.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [Linux-stm32] [PATCH v3 13/22] drm/omap: dss: venc: convert to
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

Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/venc.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index 50349518eda1630400529caf27ca4469bb09fc82..9b5d53dc361e654a2e4009c3c81b726f9ef76ced 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -664,7 +664,6 @@ static const struct drm_bridge_funcs venc_bridge_funcs = {
 
 static void venc_bridge_init(struct venc_device *venc)
 {
-	venc->bridge.funcs = &venc_bridge_funcs;
 	venc->bridge.of_node = venc->pdev->dev.of_node;
 	venc->bridge.ops = DRM_BRIDGE_OP_MODES;
 	venc->bridge.type = DRM_MODE_CONNECTOR_SVIDEO;
@@ -809,9 +808,9 @@ static int venc_probe(struct platform_device *pdev)
 	struct venc_device *venc;
 	int r;
 
-	venc = kzalloc(sizeof(*venc), GFP_KERNEL);
-	if (!venc)
-		return -ENOMEM;
+	venc = devm_drm_bridge_alloc(&pdev->dev, struct venc_device, bridge, &venc_bridge_funcs);
+	if (IS_ERR(venc))
+		return PTR_ERR(venc);
 
 	venc->pdev = pdev;
 
@@ -824,26 +823,24 @@ static int venc_probe(struct platform_device *pdev)
 	venc->config = &venc_config_pal_trm;
 
 	venc->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(venc->base)) {
-		r = PTR_ERR(venc->base);
-		goto err_free;
-	}
+	if (IS_ERR(venc->base))
+		return PTR_ERR(venc->base);
 
 	venc->vdda_dac_reg = devm_regulator_get(&pdev->dev, "vdda");
 	if (IS_ERR(venc->vdda_dac_reg)) {
 		r = PTR_ERR(venc->vdda_dac_reg);
 		if (r != -EPROBE_DEFER)
 			DSSERR("can't get VDDA_DAC regulator\n");
-		goto err_free;
+		return r;
 	}
 
 	r = venc_get_clocks(venc);
 	if (r)
-		goto err_free;
+		return r;
 
 	r = venc_probe_of(venc);
 	if (r)
-		goto err_free;
+		return r;
 
 	pm_runtime_enable(&pdev->dev);
 
@@ -861,8 +858,6 @@ static int venc_probe(struct platform_device *pdev)
 	venc_uninit_output(venc);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
-err_free:
-	kfree(venc);
 	return r;
 }
 
@@ -875,8 +870,6 @@ static void venc_remove(struct platform_device *pdev)
 	venc_uninit_output(venc);
 
 	pm_runtime_disable(&pdev->dev);
-
-	kfree(venc);
 }
 
 static __maybe_unused int venc_runtime_suspend(struct device *dev)

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
