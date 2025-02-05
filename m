Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A5AA29AC1
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2025 21:10:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 429D0C78F8F;
	Wed,  5 Feb 2025 20:10:30 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D04F4C78F8C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2025 20:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738786222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=augFT1SKfyLDD3QeIiU5g0n6Ov6tdKdIhndLDX7uWgM=;
 b=HcWc9UPZ+TDVtsRVLo4kLGfIaTR3LPb6p/VnDyxlHb9vK7XEC0dL5jBheg64nJDz0+LCWr
 o3PK/AUqG08/cQHR+jWJw2jJ8allC5637T6VowmSqse4VCuEg/tHgTQwwxvwP/YqmYYZ0j
 fYLFX7sx5WYVQDD0ajJndoBuoWt/amQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-325-D2LMSFsSPviBuVMQMdNA6g-1; Wed,
 05 Feb 2025 15:10:19 -0500
X-MC-Unique: D2LMSFsSPviBuVMQMdNA6g-1
X-Mimecast-MFC-AGG-ID: D2LMSFsSPviBuVMQMdNA6g
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 29EC619560A0; Wed,  5 Feb 2025 20:10:14 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.21])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D44A819560A3; Wed,  5 Feb 2025 20:10:02 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 05 Feb 2025 15:08:01 -0500
MIME-Version: 1.0
Message-Id: <20250205-mem-cocci-newapi-v1-5-aebf2b0e2300@redhat.com>
References: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
In-Reply-To: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738786137; l=2524;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=utPybh0lyb/JNub60ma7JiaZencmSPaI/Rr5vAWohcI=;
 b=adA5FmB9OTklNk5cSHry88wdmTnD8d60S03DE6RXmV5gfmSnK5NzvFpsiPJhn+8vuSw0WjKKQ
 pUZ5RMLArUMAJoKPoPhv9QcWmqnay+kcYFppICKGgs+hGcuYEXsXBut
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NAcRDjWMuOIs6sY1X0Xo9ycBCYt90YLcuz2EQf4qk84_1738786214
X-Mimecast-Originator: redhat.com
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 05/12] drm/mxsfb: move to
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

Cc: Marek Vasut <marex@denx.de>
Cc: Stefan Agner <stefan@agner.ch>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 4 +---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index 8ee00f59ca821cea8e823e7100fb4d7534283994..fcb2a7517377e9a5bbd2997c578c579b1b079f92 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -134,7 +134,6 @@ static int lcdif_load(struct drm_device *drm)
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	struct lcdif_drm_private *lcdif;
-	struct resource *res;
 	int ret;
 
 	lcdif = devm_kzalloc(&pdev->dev, sizeof(*lcdif), GFP_KERNEL);
@@ -144,8 +143,7 @@ static int lcdif_load(struct drm_device *drm)
 	lcdif->drm = drm;
 	drm->dev_private = lcdif;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	lcdif->base = devm_ioremap_resource(drm->dev, res);
+	lcdif->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(lcdif->base))
 		return PTR_ERR(lcdif->base);
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 59020862cf65e5cc488903f1263ed16dfbce06f9..377d4c4c9979ad9538cfec5464827a82936f811b 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -215,7 +215,6 @@ static int mxsfb_load(struct drm_device *drm,
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	struct mxsfb_drm_private *mxsfb;
-	struct resource *res;
 	int ret;
 
 	mxsfb = devm_kzalloc(&pdev->dev, sizeof(*mxsfb), GFP_KERNEL);
@@ -226,8 +225,7 @@ static int mxsfb_load(struct drm_device *drm,
 	drm->dev_private = mxsfb;
 	mxsfb->devdata = devdata;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mxsfb->base = devm_ioremap_resource(drm->dev, res);
+	mxsfb->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mxsfb->base))
 		return PTR_ERR(mxsfb->base);
 

-- 
2.47.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
