Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BC3A219ED
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 10:34:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5137DC7803C;
	Wed, 29 Jan 2025 09:34:44 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3352C7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 22:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738103435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Bbih3RuEKQlUkWbTQ/PFCmKMuLjifWffxPwT42Mo1uc=;
 b=an8dKsVHiaFw1N0kd0xpOX+Xe4d7Yd7c2ILAATj8BSOnniKXCmptrOC/cGGQTIEyuMWP6u
 LqXt8p03LKDKQrngTpiBsuLJ0Ff69YPth4zZ/S7jPKJ8WSTqx1G3t6QldNVmxbgVey2zoE
 VDi8pZO01O5L95+VwR01Pwh3ZWe7H5o=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-650-S-YYHA-bNhGgBOivYiq9zA-1; Tue,
 28 Jan 2025 17:30:30 -0500
X-MC-Unique: S-YYHA-bNhGgBOivYiq9zA-1
X-Mimecast-MFC-AGG-ID: S-YYHA-bNhGgBOivYiq9zA
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 616CA19560B4; Tue, 28 Jan 2025 22:30:27 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.231])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 83018180035E; Tue, 28 Jan 2025 22:30:10 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 28 Jan 2025 17:29:24 -0500
Message-Id: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAERamWcC/x3MTQqAIBBA4avErBtQI42uEi3EppqFPyhEEd49a
 fkt3nuhUGYqMHcvZLq4cAwNsu/AnTYchLw1gxJqFFJN6KJzjJ58zA/axKi0JjlYMRoy0LKUaef
 7Xy5rrR8zCerIYgAAAA==
X-Change-ID: 20250128-cocci-memory-api-266e13a057e7
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738103409; l=4607;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=t1B4jwyIADVA6S8X7DXOmIb01Pyst5f0UX1jMRzVBZA=;
 b=TKPB6evzfjTeNzV82GgFaRIEt8PBIygsoHwoHMJY6JP3p+kHHMkgJH10gfKAjIAyEApxibsX1
 CFZ8Xj5+QaQDJehni2woQbUyEUZMq2rh8dkQ+4RKwUZp27t3QE5BRgr
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mailman-Approved-At: Wed, 29 Jan 2025 09:34:43 +0000
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 00/14] drm: Move to using
	devm_platform_ioremap_resource
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

Start replacing the below occurences with the newer API:
- (devm_)platform_get_resource + devm_ioremap_resource
- (devm_)platform_get_resource + (devm_)ioremap
- platform_get_resource_byname + devm_ioremap
Move all these occurences to uses devm_platform_ioremap_resource
instead.

Address a TODO item in the GPU section.

Used Coccinelle to make the code changes.Semantic patch:

//First Case
//rule s/platform_get_resource + devm_ioremap_resource/devm_platform_ioremap_resource
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

//Second case
//rule s/(devm_)platform_get_resource + (devm_)ioremap/devm_platform_ioremap_resource.
@rule_2@
identifier res;
expression ioremap;
identifier pdev;
@@
-struct resource *res;
...
-res = platform_get_resource(pdev,...);
<...
-if (!res) {
-...
-}
...>
-ioremap = devm_ioremap(...);
+ioremap = devm_platform_ioremap_resource(pdev,0);

//Third case
//rule s/(devm_)platform_get_resource_byname + (devm_)ioremap/devm_platform_ioremap_resource_byname.
@rule_3@
identifier res;
expression ioremap;
identifier pdev;
constant mem;
expression name;
@@
-struct resource *res;
...
-res = platform_get_resource_byname(pdev,mem,name);
<...
-if (!res) {
-...
-}
...>
-ioremap = devm_ioremap(...);
+ioremap = devm_platform_ioremap_resource_byname(pdev,name);

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
Anusha Srivatsa (14):
      drm/aspeed: move to devm_platform_ioremap_resource() usage
      drm/fsl-dcu: move to devm_platform_ioremap_resource() usage
      drm/hisilicon: move to devm_platform_ioremap_resource() usage
      drm/mediatek: move to devm_platform_ioremap_resource() usage
      drm/meson: move to devm_platform_ioremap_resource() usage
      drm/mxsfb: move to devm_platform_ioremap_resource() usage
      drm/rockchip: move to devm_platform_ioremap_resource() usage
      drm/sprd: move to devm_platform_ioremap_resource() usage
      drm/sti: move to devm_platform_ioremap_resource() usage
      drm/stm: move to devm_platform_ioremap_resource() usage
      drm/tegra: move to devm_platform_ioremap_resource() usage
      drm/tiny: move to devm_platform_ioremap_resource() usage
      drm/vc4: move to devm_platform_ioremap_resource() usage
      Documentation: Update the todo

 Documentation/gpu/todo.rst                      | 15 ---------------
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c         |  4 +---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c       |  4 +---
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c    |  4 +---
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c |  4 +---
 drivers/gpu/drm/mediatek/mtk_disp_color.c       |  4 +---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c       |  4 +---
 drivers/gpu/drm/mediatek/mtk_disp_merge.c       |  4 +---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c         |  4 +---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c        |  4 +---
 drivers/gpu/drm/mediatek/mtk_dsi.c              |  4 +---
 drivers/gpu/drm/mediatek/mtk_hdmi.c             |  4 +---
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c         |  4 +---
 drivers/gpu/drm/meson/meson_drv.c               |  9 +--------
 drivers/gpu/drm/mxsfb/lcdif_drv.c               |  4 +---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c               |  4 +---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c     |  4 +---
 drivers/gpu/drm/sprd/sprd_dpu.c                 |  9 +--------
 drivers/gpu/drm/sprd/sprd_dsi.c                 |  9 +--------
 drivers/gpu/drm/sti/sti_compositor.c            | 10 +---------
 drivers/gpu/drm/sti/sti_dvo.c                   | 10 +---------
 drivers/gpu/drm/sti/sti_hda.c                   | 10 +---------
 drivers/gpu/drm/sti/sti_hdmi.c                  | 11 +----------
 drivers/gpu/drm/sti/sti_hqvdp.c                 | 10 +---------
 drivers/gpu/drm/sti/sti_tvout.c                 | 10 +---------
 drivers/gpu/drm/sti/sti_vtg.c                   | 10 +---------
 drivers/gpu/drm/stm/ltdc.c                      |  4 +---
 drivers/gpu/drm/tegra/dsi.c                     |  4 +---
 drivers/gpu/drm/tiny/arcpgu.c                   |  4 +---
 drivers/gpu/drm/vc4/vc4_hdmi.c                  |  9 ++-------
 30 files changed, 30 insertions(+), 164 deletions(-)
---
base-commit: c4b9570cfb63501638db720f3bee9f6dfd044b82
change-id: 20250128-cocci-memory-api-266e13a057e7

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
