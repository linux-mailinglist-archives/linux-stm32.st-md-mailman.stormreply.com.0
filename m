Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68747A352A4
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2025 01:21:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 305A8C7A824;
	Fri, 14 Feb 2025 00:21:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 278EFC7A820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2025 00:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739492467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vpuRtzEq0QQBKTFe7oiNde6xdrTLT6xb1c3fW35+XOM=;
 b=dmXJitr02vMJq+1YbY5cIrdQCvUzrjmKt3MCrzzrmIjY+biCVRad29Htwimy5e2XoGaDRQ
 UYWCDi85XosBh6qxKymtAwu7gokopMMVQY+Tq8Wrij2Od+6PYWoecXJbhuEX09wgOmI8Ti
 3kpvtQTQ6fe8gZj/xA576DMNEiUJzoo=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-586-LxgCWGsVN_6f4FwaIITdEQ-1; Thu,
 13 Feb 2025 19:21:03 -0500
X-MC-Unique: LxgCWGsVN_6f4FwaIITdEQ-1
X-Mimecast-MFC-AGG-ID: LxgCWGsVN_6f4FwaIITdEQ
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A699618EB2C6; Fri, 14 Feb 2025 00:20:54 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.199])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 65EF8191D7C8; Fri, 14 Feb 2025 00:20:45 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 13 Feb 2025 19:19:21 -0500
MIME-Version: 1.0
Message-Id: <20250213-mem-cocci-v3-v1-8-93466d165349@redhat.com>
References: <20250213-mem-cocci-v3-v1-0-93466d165349@redhat.com>
In-Reply-To: <20250213-mem-cocci-v3-v1-0-93466d165349@redhat.com>
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
 Fabio Estevam <festevam@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739492356; l=1617;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=i8LWrfxom0nQSC05REsfBXvlA+tOy6QpDxqqftn+kA0=;
 b=ODnHfrPCdxaG+cvlimJF1bdgqI5DCS6OaKBsHAK5YPWr4Mpni0r1miA8pb0l5FvqKULISA+19
 cfaUlB7iF9zDhK/+tlgHhQD7bnbWSZd0UKCrc2LMMV6SZmEUSfLoFcf
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 08/12] drm/stm: move to
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

Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Philippe Cornu <philippe.cornu@foss.st.com>
Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/stm/ltdc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 54a73753eff98902012c6012914fa8c6482affbd..ba315c66a04d72758b9d3cfcd842432877f66d3a 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1900,7 +1900,6 @@ int ltdc_load(struct drm_device *ddev)
 	struct drm_panel *panel;
 	struct drm_crtc *crtc;
 	struct reset_control *rstc;
-	struct resource *res;
 	int irq, i, nb_endpoints;
 	int ret = -ENODEV;
 
@@ -1966,8 +1965,7 @@ int ltdc_load(struct drm_device *ddev)
 		reset_control_deassert(rstc);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ldev->regs = devm_ioremap_resource(dev, res);
+	ldev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ldev->regs)) {
 		DRM_ERROR("Unable to get ltdc registers\n");
 		ret = PTR_ERR(ldev->regs);

-- 
2.47.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
