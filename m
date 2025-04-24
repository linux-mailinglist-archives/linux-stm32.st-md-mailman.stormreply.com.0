Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F734A9B74F
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 21:01:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE3A4C78F70;
	Thu, 24 Apr 2025 19:01:14 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C968C78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 19:01:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B69743B6C;
 Thu, 24 Apr 2025 19:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745521272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GlbxOSSQor75pYLhcBGMiTmVttlHOD9YuyyYG+JTv+8=;
 b=UqSvFZaSpq6rqNZdzw0CiBBGu6qWm7bbYEuZiUb9/G3CJlMX5ZBL5bCOp02VBzOzhSwu5w
 rhaIPwJrHzCRYNpLKVAYWRSY0MrswIBDArDlvd/Z8poc+xBCVIcNCXEbc2XlTyOELWMvlR
 IAXg6lhQCcusFDnoanliiCtY91+5w7uS3BQc0mr00bkl5h0IV/wXhTg5kyMrMxTNJIkMNC
 BFlsrOw/1n1iv483A8xAUZCj6IPsmBSBtKEZ7jQNUz5kWVu+/bE1FgDbUWrvczzSG6iVv8
 7O8qmG/Pye5ol9R8pIPrlg/HOjKMI2S3Ht9Ngsdf/eW6O/KzEl9w363gUPPjOQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 24 Apr 2025 20:59:32 +0200
MIME-Version: 1.0
Message-Id: <20250424-drm-bridge-convert-to-alloc-api-v2-25-8f91a404d86b@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfnecuvehluhhsthgvrhfuihiivgepvddvnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgegiedvmedusgguugemledutddumedvleegfhdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedvpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepjhgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrt
 ghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhrvghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtodhrvghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
Cc: imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-arm-msm@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-mediatek@lists.infradead.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <lumag@kernel.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 asahi@lists.linux.dev, freedreno@lists.freedesktop.org
Subject: [Linux-stm32] [PATCH v2 25/34] drm/rcar-du: dsi: convert to
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

Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 7ab8be46c7f6547f29b4d45af7ac704283da9dcd..1af4c73f7a887712aef8c8176b0d0338d9ca9727 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -918,7 +918,6 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	}
 
 	/* Initialize the DRM bridge. */
-	dsi->bridge.funcs = &rcar_mipi_dsi_bridge_ops;
 	dsi->bridge.of_node = dsi->dev->of_node;
 	drm_bridge_add(&dsi->bridge);
 
@@ -1004,9 +1003,10 @@ static int rcar_mipi_dsi_probe(struct platform_device *pdev)
 	struct rcar_mipi_dsi *dsi;
 	int ret;
 
-	dsi = devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
-	if (dsi == NULL)
-		return -ENOMEM;
+	dsi = devm_drm_bridge_alloc(&pdev->dev, struct rcar_mipi_dsi, bridge,
+				    &rcar_mipi_dsi_bridge_ops);
+	if (IS_ERR(dsi))
+		return PTR_ERR(dsi);
 
 	platform_set_drvdata(pdev, dsi);
 

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
