Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C748A219EF
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 10:34:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 911B1C78F75;
	Wed, 29 Jan 2025 09:34:44 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36A29C78038
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 22:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738103472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ppu6Hxn7eds6hVdudyY6IyGaw0deGVqQvLkC+3cElE=;
 b=LAAq0K/J+urGib6L0WIkAi0hMwVIrmA7sAhA0cKTNe/3e/Dd9Crfhc5wxDTsfjXaVn3OWP
 TfWhSVXAFzQ3mgcI4Zk18KlRIJJ0EY6jk+97Ica0wwr+1NKrSbqrhJEF7Nt7k7c3720SYz
 iWWTaA36SjVwAX8JvlzL3i2jDSkuTtU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-618-bVWBdiPWNQyI9gUHYyDqpQ-1; Tue,
 28 Jan 2025 17:31:08 -0500
X-MC-Unique: bVWBdiPWNQyI9gUHYyDqpQ-1
X-Mimecast-MFC-AGG-ID: bVWBdiPWNQyI9gUHYyDqpQ
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 19700180188A; Tue, 28 Jan 2025 22:31:07 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.231])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2C55218008D4; Tue, 28 Jan 2025 22:30:55 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 28 Jan 2025 17:29:27 -0500
MIME-Version: 1.0
Message-Id: <20250128-cocci-memory-api-v1-3-0d1609a29587@redhat.com>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
In-Reply-To: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
To: Joel Stanley <joel@jms.id.au>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Alexey Brodkin <abrodkin@synopsys.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Jonathan Corbet <corbet@lwn.net>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738103410; l=2919;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=Psk2ovSxNSmPk2j8mgWkV0b48v8ExBeAmG1+F82B7t4=;
 b=1sq/7D6zzuwyG7D9t25OtBv+NjBas+ltESTs3qH9oSOySLstuoe5U0ByLencsB3oi9NzB5N1T
 0tjbtLixIFCDdv/UfLyukM8IVBaBlWK/938tBYGgq+90ECO4eJGfjlp
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mailman-Approved-At: Wed, 29 Jan 2025 09:34:43 +0000
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 03/14] drm/hisilicon: move to
 devm_platform_ioremap_resource() usage
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

Replace platform_get_resource + devm_ioremap_resource
with just devm_platform_ioremap_resource()

Used Coccinelle to do this change. SmPl patch:
@rule_1@
identifier res;
expression ioremap_res;
identifier pdev;
@@
-struct resource *res;
...
-res = platform_get_resource(pdev,...);
-ioremap_res = devm_ioremap_resource(...);
+ioremap_res = devm_platform_ioremap_resource(pdev,0);

Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Yongqin Liu <yongqin.liu@linaro.org>
Cc: John Stultz <jstultz@google.com>

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c    | 4 +---
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index 2eea9fb0e76bf3ead8f5914e6ebb65b5b3603b9a..e80debdc41763357cb2cf321205c0dfac80a911e 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -825,7 +825,6 @@ static const struct component_ops dsi_ops = {
 static int dsi_parse_dt(struct platform_device *pdev, struct dw_dsi *dsi)
 {
 	struct dsi_hw_ctx *ctx = dsi->ctx;
-	struct resource *res;
 
 	ctx->pclk = devm_clk_get(&pdev->dev, "pclk");
 	if (IS_ERR(ctx->pclk)) {
@@ -833,8 +832,7 @@ static int dsi_parse_dt(struct platform_device *pdev, struct dw_dsi *dsi)
 		return PTR_ERR(ctx->pclk);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ctx->base = devm_ioremap_resource(&pdev->dev, res);
+	ctx->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ctx->base)) {
 		DRM_ERROR("failed to remap dsi io region\n");
 		return PTR_ERR(ctx->base);
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index 2eb49177ac42bc6dba692328cca5c99d5925041c..45c4eb008ad5d639340f769ad022d186ec454722 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -844,7 +844,6 @@ static struct drm_plane_funcs ade_plane_funcs = {
 static void *ade_hw_ctx_alloc(struct platform_device *pdev,
 			      struct drm_crtc *crtc)
 {
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = pdev->dev.of_node;
 	struct ade_hw_ctx *ctx = NULL;
@@ -856,8 +855,7 @@ static void *ade_hw_ctx_alloc(struct platform_device *pdev,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ctx->base = devm_ioremap_resource(dev, res);
+	ctx->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ctx->base)) {
 		DRM_ERROR("failed to remap ade io base\n");
 		return ERR_PTR(-EIO);

-- 
2.47.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
