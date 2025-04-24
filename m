Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81261A9B75F
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 21:01:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45944C78F70;
	Thu, 24 Apr 2025 19:01:30 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D4AFC78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 19:01:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F24B4439D;
 Thu, 24 Apr 2025 19:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745521289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LhZpj5I/cWr8OxjpC/2t/ycyRXj9GzxVo+pFftfveRA=;
 b=K3FME/bWZ+JV4HZT+XIqZhe/4KSTbTPg3v+B1TH1HfUix79YJlrxW9liDFEmpIUas8fgTn
 8tGjfwPZtUM+y4Oc32SyM263P5ApBnNm9IRgmLMq2KPUqg54Aedxv6ST/KSVACafBMolEO
 ieV5Mcw5g5MYHKVFYXLEyU2jJUpfafkIsOxJi2n/D5RudTAL5dmuKggCV0CiBE+JjOKVaA
 ujjuu4YCH9GaN5dsQ1zQ3nDSX3Zrz7hI/WJs6z9yFh3Ugh2Dn/vpOW4syRBufd5fTKqklV
 83dPIZbCra3oHwdjkwjE/mmVwORIXzHPPGURX8LXVjhsW6jW/1AGbfT0YT/hXA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 24 Apr 2025 20:59:37 +0200
MIME-Version: 1.0
Message-Id: <20250424-drm-bridge-convert-to-alloc-api-v2-30-8f91a404d86b@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfnecuvehluhhsthgvrhfuihiivgepvdehnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgegiedvmedusgguugemledutddumedvleegfhdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedtpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepjhgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrt
 ghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehfrhgvvggurhgvnhhosehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
Cc: chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Liu Ying <victor.liu@nxp.com>, linux-arm-msm@vger.kernel.org,
 Anusha Srivatsa <asrivats@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 asahi@lists.linux.dev, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 freedreno@lists.freedesktop.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [Linux-stm32] [PATCH v2 30/34] drm/bridge: imx8qxp-pixel-combiner:
 convert to devm_drm_bridge_alloc() API
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

This driver embeds an array of channels in the main struct, and each
channel embeds a drm_bridge. This prevents dynamic, refcount-based
deallocation of the bridges.

To make the new, dynamic bridge allocation possible:

 * change the array of channels into an array of channel pointers
 * allocate each channel using devm_drm_bridge_alloc()
 * adapt the code wherever using the channels

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
index 1f6fd488e7039e943351006d3373009f0c15cb08..40a8a5a53a781137e722309ff91692cf90d881da 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -68,7 +68,7 @@ struct imx8qxp_pc_channel {
 
 struct imx8qxp_pc {
 	struct device *dev;
-	struct imx8qxp_pc_channel ch[2];
+	struct imx8qxp_pc_channel *ch[2];
 	struct clk *clk_apb;
 	void __iomem *base;
 };
@@ -307,7 +307,14 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
 			goto free_child;
 		}
 
-		ch = &pc->ch[i];
+		ch = devm_drm_bridge_alloc(dev, struct imx8qxp_pc_channel, bridge,
+					   &imx8qxp_pc_bridge_funcs);
+		if (IS_ERR(ch)) {
+			ret = PTR_ERR(ch);
+			goto free_child;
+		}
+
+		pc->ch[i] = ch;
 		ch->pc = pc;
 		ch->stream_id = i;
 
@@ -333,7 +340,6 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
 		of_node_put(remote);
 
 		ch->bridge.driver_private = ch;
-		ch->bridge.funcs = &imx8qxp_pc_bridge_funcs;
 		ch->bridge.of_node = child;
 		ch->is_available = true;
 
@@ -345,8 +351,8 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
 free_child:
 	of_node_put(child);
 
-	if (i == 1 && pc->ch[0].next_bridge)
-		drm_bridge_remove(&pc->ch[0].bridge);
+	if (i == 1 && pc->ch[0]->next_bridge)
+		drm_bridge_remove(&pc->ch[0]->bridge);
 
 	pm_runtime_disable(dev);
 	return ret;
@@ -359,7 +365,7 @@ static void imx8qxp_pc_bridge_remove(struct platform_device *pdev)
 	int i;
 
 	for (i = 0; i < 2; i++) {
-		ch = &pc->ch[i];
+		ch = pc->ch[i];
 
 		if (!ch->is_available)
 			continue;

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
