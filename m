Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAC4A7E137
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 16:25:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F16AC78F9B;
	Mon,  7 Apr 2025 14:25:00 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 638D4C78F97
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 14:24:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5393442C5;
 Mon,  7 Apr 2025 14:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744035898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7MGAYVLqc2j0NmWCZPylg2j6LPz+kdlLwuJ4SwaUzNQ=;
 b=CwCBPxknCpBx5cIrtpubrSAfK33aBLF2jlMVJ19BjMNJ/tIS/k3u2mRx8PMFpTrkvBWpE3
 Y/CwuCk14R8/BNpiH5tnniyEb1Iw2FXRJod7ZNWyC+8bwhvCEyJXoQx02Yx94E+rDkJHLl
 +l5rNRUycwFcOIEbT4IOorLiOBJSupRgetkTfmaogI9xy3Dd8a3CBA+7++2jyAZcVWkd/u
 6x4hylqY1nDAr13iFhmgwATQNpXjItIOJvj3hYHhNPtVm8dx3C9tiCOyELO3Drph164jeK
 YbQ3YWF3RBnj+QJQUb19X5sChauuFLRzSnHyiM4j1HxcAjqYokOZmiuwQeotJQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 07 Apr 2025 16:23:33 +0200
MIME-Version: 1.0
Message-Id: <20250407-drm-bridge-convert-to-alloc-api-v1-18-42113ff8d9c0@bootlin.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
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
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedugeenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeghedprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtohepjfhuihdrrfhusehgvghhvggrlhhthhgtrghrvgdrtghomhdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
Cc: imx@lists.linux.dev,
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-mediatek@lists.infradead.org,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 asahi@lists.linux.dev, freedreno@lists.freedesktop.org
Subject: [Linux-stm32] [PATCH 18/34] drm/msm/hdmi: convert to
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

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 4a5b5112227f516dfc4279d0f319ec1e5b17f240..7b325ab0bb1f1e9434c3979f34fb0a8f94aad660 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -324,16 +324,15 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
 	struct hdmi_bridge *hdmi_bridge;
 	int ret;
 
-	hdmi_bridge = devm_kzalloc(hdmi->dev->dev,
-			sizeof(*hdmi_bridge), GFP_KERNEL);
-	if (!hdmi_bridge)
-		return -ENOMEM;
+	hdmi_bridge = devm_drm_bridge_alloc(hdmi->dev->dev, struct hdmi_bridge, base,
+					    &msm_hdmi_bridge_funcs);
+	if (IS_ERR(hdmi_bridge))
+		return PTR_ERR(hdmi_bridge);
 
 	hdmi_bridge->hdmi = hdmi;
 	INIT_WORK(&hdmi_bridge->hpd_work, msm_hdmi_hotplug_work);
 
 	bridge = &hdmi_bridge->base;
-	bridge->funcs = &msm_hdmi_bridge_funcs;
 	bridge->ddc = hdmi->i2c;
 	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
 	bridge->ops = DRM_BRIDGE_OP_HPD |

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
