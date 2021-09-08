Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E05403819
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Sep 2021 12:43:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FBD0C5AB71;
	Wed,  8 Sep 2021 10:43:40 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DA75C5A4D5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Sep 2021 06:04:18 +0000 (UTC)
X-UUID: febc94b4c0f24e34af6e86f0e8bef52a-20210908
X-UUID: febc94b4c0f24e34af6e86f0e8bef52a-20210908
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2023128501; Wed, 08 Sep 2021 14:04:13 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 8 Sep 2021 14:04:12 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 8 Sep 2021 14:04:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Sep 2021 14:04:11 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>
Date: Wed, 8 Sep 2021 14:03:09 +0800
Message-ID: <20210908060312.24007-15-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210908060312.24007-1-jason-jh.lin@mediatek.com>
References: <20210908060312.24007-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Wed, 08 Sep 2021 10:43:36 +0000
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, jason-jh.lin@mediatek.com,
 singo.chang@mediatek.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v10 14/17] drm/mediatek: adjust to the
	alphabetic order for mediatek-drm
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

Adjust to the alphabetic order for the define, function, struct
and array in mediatek-drm driver

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
rebase on series [1]

[1] drm/mediatek: add support for mediatek SOC MT8192
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=529489
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 126 ++++++++++----------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  24 ++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 100 ++++++++--------
 3 files changed, 124 insertions(+), 126 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index b46bc0f5d1a5..23c03e550658 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -20,26 +20,30 @@
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_crtc.h"
 
-#define DISP_REG_OD_EN				0x0000
-#define DISP_REG_OD_CFG				0x0020
-#define DISP_REG_OD_SIZE			0x0030
-#define DISP_REG_DITHER_5			0x0114
-#define DISP_REG_DITHER_7			0x011c
-#define DISP_REG_DITHER_15			0x013c
-#define DISP_REG_DITHER_16			0x0140
-
-#define DISP_REG_UFO_START			0x0000
 
 #define DISP_REG_DITHER_EN			0x0000
 #define DITHER_EN				BIT(0)
 #define DISP_REG_DITHER_CFG			0x0020
 #define DITHER_RELAY_MODE			BIT(0)
 #define DITHER_ENGINE_EN			BIT(1)
+#define DISP_DITHERING				BIT(2)
 #define DISP_REG_DITHER_SIZE			0x0030
+#define DISP_REG_DITHER_5			0x0114
+#define DISP_REG_DITHER_7			0x011c
+#define DISP_REG_DITHER_15			0x013c
+#define DITHER_LSB_ERR_SHIFT_R(x)		(((x) & 0x7) << 28)
+#define DITHER_ADD_LSHIFT_R(x)			(((x) & 0x7) << 20)
+#define DITHER_NEW_BIT_MODE			BIT(0)
+#define DISP_REG_DITHER_16			0x0140
+#define DITHER_LSB_ERR_SHIFT_B(x)		(((x) & 0x7) << 28)
+#define DITHER_ADD_LSHIFT_B(x)			(((x) & 0x7) << 20)
+#define DITHER_LSB_ERR_SHIFT_G(x)		(((x) & 0x7) << 12)
+#define DITHER_ADD_LSHIFT_G(x)			(((x) & 0x7) << 4)
 
+#define DISP_REG_OD_EN				0x0000
+#define DISP_REG_OD_CFG				0x0020
 #define OD_RELAYMODE				BIT(0)
-
-#define UFO_BYPASS				BIT(2)
+#define DISP_REG_OD_SIZE			0x0030
 
 #define DISP_REG_POSTMASK_EN			0x0000
 #define POSTMASK_EN				BIT(0)
@@ -47,14 +51,8 @@
 #define POSTMASK_RELAY_MODE			BIT(0)
 #define DISP_REG_POSTMASK_SIZE			0x0030
 
-#define DISP_DITHERING				BIT(2)
-#define DITHER_LSB_ERR_SHIFT_R(x)		(((x) & 0x7) << 28)
-#define DITHER_ADD_LSHIFT_R(x)			(((x) & 0x7) << 20)
-#define DITHER_NEW_BIT_MODE			BIT(0)
-#define DITHER_LSB_ERR_SHIFT_B(x)		(((x) & 0x7) << 28)
-#define DITHER_ADD_LSHIFT_B(x)			(((x) & 0x7) << 20)
-#define DITHER_LSB_ERR_SHIFT_G(x)		(((x) & 0x7) << 12)
-#define DITHER_ADD_LSHIFT_G(x)			(((x) & 0x7) << 4)
+#define DISP_REG_UFO_START			0x0000
+#define UFO_BYPASS				BIT(2)
 
 struct mtk_ddp_comp_dev {
 	struct clk *clk;
@@ -147,8 +145,35 @@ void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
 	}
 }
 
+static void mtk_dither_config(struct device *dev, unsigned int w,
+			      unsigned int h, unsigned int vrefresh,
+			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_REG_DITHER_SIZE);
+	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_DITHER_CFG);
+	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_REG_DITHER_CFG,
+			      DITHER_ENGINE_EN, cmdq_pkt);
+}
+
+static void mtk_dither_start(struct device *dev)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	writel(DITHER_EN, priv->regs + DISP_REG_DITHER_EN);
+}
+
+static void mtk_dither_stop(struct device *dev)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	writel_relaxed(0x0, priv->regs + DISP_REG_DITHER_EN);
+}
+
 static void mtk_dither_set(struct device *dev, unsigned int bpc,
-		    unsigned int cfg, struct cmdq_pkt *cmdq_pkt)
+			   unsigned int cfg, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
@@ -174,13 +199,6 @@ static void mtk_od_start(struct device *dev)
 	writel(1, priv->regs + DISP_REG_OD_EN);
 }
 
-static void mtk_ufoe_start(struct device *dev)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
-}
-
 static void mtk_postmask_config(struct device *dev, unsigned int w,
 			unsigned int h, unsigned int vrefresh,
 			unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -207,31 +225,11 @@ static void mtk_postmask_stop(struct device *dev)
 	writel_relaxed(0x0, priv->regs + DISP_REG_POSTMASK_EN);
 }
 
-static void mtk_dither_config(struct device *dev, unsigned int w,
-			      unsigned int h, unsigned int vrefresh,
-			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_REG_DITHER_SIZE);
-	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs,
-		      DISP_REG_DITHER_CFG);
-	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_REG_DITHER_CFG,
-			      DITHER_ENGINE_EN, cmdq_pkt);
-}
-
-static void mtk_dither_start(struct device *dev)
-{
-	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	writel(DITHER_EN, priv->regs + DISP_REG_DITHER_EN);
-}
-
-static void mtk_dither_stop(struct device *dev)
+static void mtk_ufoe_start(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel_relaxed(0x0, priv->regs + DISP_REG_DITHER_EN);
+	writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
 }
 
 static const struct mtk_ddp_comp_funcs ddp_aal = {
@@ -336,23 +334,23 @@ static const struct mtk_ddp_comp_funcs ddp_ufoe = {
 };
 
 static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
-	[MTK_DISP_OVL] = "ovl",
-	[MTK_DISP_OVL_2L] = "ovl-2l",
-	[MTK_DISP_RDMA] = "rdma",
-	[MTK_DISP_WDMA] = "wdma",
-	[MTK_DISP_COLOR] = "color",
-	[MTK_DISP_CCORR] = "ccorr",
 	[MTK_DISP_AAL] = "aal",
-	[MTK_DISP_GAMMA] = "gamma",
+	[MTK_DISP_BLS] = "bls",
+	[MTK_DISP_CCORR] = "ccorr",
+	[MTK_DISP_COLOR] = "color",
 	[MTK_DISP_DITHER] = "dither",
-	[MTK_DISP_UFOE] = "ufoe",
-	[MTK_DSI] = "dsi",
-	[MTK_DPI] = "dpi",
-	[MTK_DISP_PWM] = "pwm",
+	[MTK_DISP_GAMMA] = "gamma",
 	[MTK_DISP_MUTEX] = "mutex",
 	[MTK_DISP_OD] = "od",
-	[MTK_DISP_BLS] = "bls",
+	[MTK_DISP_OVL] = "ovl",
+	[MTK_DISP_OVL_2L] = "ovl-2l",
 	[MTK_DISP_POSTMASK] = "postmask",
+	[MTK_DISP_PWM] = "pwm",
+	[MTK_DISP_RDMA] = "rdma",
+	[MTK_DISP_UFOE] = "ufoe",
+	[MTK_DISP_WDMA] = "wdma",
+	[MTK_DPI] = "dpi",
+	[MTK_DSI] = "dsi",
 };
 
 struct mtk_ddp_comp_match {
@@ -510,12 +508,12 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	    type == MTK_DISP_CCORR ||
 	    type == MTK_DISP_COLOR ||
 	    type == MTK_DISP_GAMMA ||
-	    type == MTK_DPI ||
-	    type == MTK_DSI ||
 	    type == MTK_DISP_OVL ||
 	    type == MTK_DISP_OVL_2L ||
 	    type == MTK_DISP_PWM ||
-	    type == MTK_DISP_RDMA)
+	    type == MTK_DISP_RDMA ||
+	    type == MTK_DPI ||
+	    type == MTK_DSI)
 		return 0;
 
 	priv = devm_kzalloc(comp->dev, sizeof(*priv), GFP_KERNEL);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index cd1dec6b4cdf..4c6a98662305 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -18,23 +18,23 @@ struct mtk_plane_state;
 struct drm_crtc_state;
 
 enum mtk_ddp_comp_type {
-	MTK_DISP_OVL,
-	MTK_DISP_OVL_2L,
-	MTK_DISP_RDMA,
-	MTK_DISP_WDMA,
-	MTK_DISP_COLOR,
+	MTK_DISP_AAL,
+	MTK_DISP_BLS,
 	MTK_DISP_CCORR,
+	MTK_DISP_COLOR,
 	MTK_DISP_DITHER,
-	MTK_DISP_AAL,
 	MTK_DISP_GAMMA,
-	MTK_DISP_UFOE,
-	MTK_DSI,
-	MTK_DPI,
-	MTK_DISP_POSTMASK,
-	MTK_DISP_PWM,
 	MTK_DISP_MUTEX,
 	MTK_DISP_OD,
-	MTK_DISP_BLS,
+	MTK_DISP_OVL,
+	MTK_DISP_OVL_2L,
+	MTK_DISP_POSTMASK,
+	MTK_DISP_PWM,
+	MTK_DISP_RDMA,
+	MTK_DISP_UFOE,
+	MTK_DISP_WDMA,
+	MTK_DPI,
+	MTK_DSI,
 	MTK_DDP_COMP_TYPE_MAX,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 794bdddc915e..e0ddfae20d37 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -422,28 +422,12 @@ static const struct component_master_ops mtk_drm_ops = {
 };
 
 static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
-	{ .compatible = "mediatek,mt2701-disp-ovl",
-	  .data = (void *)MTK_DISP_OVL },
-	{ .compatible = "mediatek,mt8173-disp-ovl",
-	  .data = (void *)MTK_DISP_OVL },
-	{ .compatible = "mediatek,mt8183-disp-ovl",
-	  .data = (void *)MTK_DISP_OVL },
-	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
-	  .data = (void *)MTK_DISP_OVL_2L },
-	{ .compatible = "mediatek,mt8192-disp-ovl",
-	  .data = (void *)MTK_DISP_OVL },
-	{ .compatible = "mediatek,mt8192-disp-ovl-2l",
-	  .data = (void *)MTK_DISP_OVL_2L },
-	{ .compatible = "mediatek,mt2701-disp-rdma",
-	  .data = (void *)MTK_DISP_RDMA },
-	{ .compatible = "mediatek,mt8173-disp-rdma",
-	  .data = (void *)MTK_DISP_RDMA },
-	{ .compatible = "mediatek,mt8183-disp-rdma",
-	  .data = (void *)MTK_DISP_RDMA },
-	{ .compatible = "mediatek,mt8192-disp-rdma",
-	  .data = (void *)MTK_DISP_RDMA },
-	{ .compatible = "mediatek,mt8173-disp-wdma",
-	  .data = (void *)MTK_DISP_WDMA },
+	{ .compatible = "mediatek,mt8173-disp-aal",
+	  .data = (void *)MTK_DISP_AAL},
+	{ .compatible = "mediatek,mt8183-disp-aal",
+	  .data = (void *)MTK_DISP_AAL},
+	{ .compatible = "mediatek,mt8192-disp-aal",
+	  .data = (void *)MTK_DISP_AAL},
 	{ .compatible = "mediatek,mt8183-disp-ccorr",
 	  .data = (void *)MTK_DISP_CCORR },
 	{ .compatible = "mediatek,mt8192-disp-ccorr",
@@ -452,32 +436,12 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_COLOR },
 	{ .compatible = "mediatek,mt8173-disp-color",
 	  .data = (void *)MTK_DISP_COLOR },
-	{ .compatible = "mediatek,mt8173-disp-aal",
-	  .data = (void *)MTK_DISP_AAL},
-	{ .compatible = "mediatek,mt8183-disp-aal",
-	  .data = (void *)MTK_DISP_AAL},
-	{ .compatible = "mediatek,mt8192-disp-aal",
-	  .data = (void *)MTK_DISP_AAL},
+	{ .compatible = "mediatek,mt8183-disp-dither",
+	  .data = (void *)MTK_DISP_DITHER },
 	{ .compatible = "mediatek,mt8173-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8183-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
-	{ .compatible = "mediatek,mt8183-disp-dither",
-	  .data = (void *)MTK_DISP_DITHER },
-	{ .compatible = "mediatek,mt8173-disp-ufoe",
-	  .data = (void *)MTK_DISP_UFOE },
-	{ .compatible = "mediatek,mt2701-dsi",
-	  .data = (void *)MTK_DSI },
-	{ .compatible = "mediatek,mt8173-dsi",
-	  .data = (void *)MTK_DSI },
-	{ .compatible = "mediatek,mt8183-dsi",
-	  .data = (void *)MTK_DSI },
-	{ .compatible = "mediatek,mt2701-dpi",
-	  .data = (void *)MTK_DPI },
-	{ .compatible = "mediatek,mt8173-dpi",
-	  .data = (void *)MTK_DPI },
-	{ .compatible = "mediatek,mt8183-dpi",
-	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt2701-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt2712-disp-mutex",
@@ -488,14 +452,50 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8192-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
-	{ .compatible = "mediatek,mt2701-disp-pwm",
-	  .data = (void *)MTK_DISP_BLS },
-	{ .compatible = "mediatek,mt8173-disp-pwm",
-	  .data = (void *)MTK_DISP_PWM },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
+	{ .compatible = "mediatek,mt2701-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8173-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8183-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8192-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
+	  .data = (void *)MTK_DISP_OVL_2L },
+	{ .compatible = "mediatek,mt8192-disp-ovl-2l",
+	  .data = (void *)MTK_DISP_OVL_2L },
 	{ .compatible = "mediatek,mt8192-disp-postmask",
 	  .data = (void *)MTK_DISP_POSTMASK },
+	{ .compatible = "mediatek,mt2701-disp-pwm",
+	  .data = (void *)MTK_DISP_BLS },
+	{ .compatible = "mediatek,mt8173-disp-pwm",
+	  .data = (void *)MTK_DISP_PWM },
+	{ .compatible = "mediatek,mt2701-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8173-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8183-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8192-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8173-disp-ufoe",
+	  .data = (void *)MTK_DISP_UFOE },
+	{ .compatible = "mediatek,mt8173-disp-wdma",
+	  .data = (void *)MTK_DISP_WDMA },
+	{ .compatible = "mediatek,mt2701-dpi",
+	  .data = (void *)MTK_DPI },
+	{ .compatible = "mediatek,mt8173-dpi",
+	  .data = (void *)MTK_DPI },
+	{ .compatible = "mediatek,mt8183-dpi",
+	  .data = (void *)MTK_DPI },
+	{ .compatible = "mediatek,mt2701-dsi",
+	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8173-dsi",
+	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8183-dsi",
+	  .data = (void *)MTK_DSI },
 	{ }
 };
 
@@ -587,8 +587,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		    comp_type == MTK_DISP_OVL ||
 		    comp_type == MTK_DISP_OVL_2L ||
 		    comp_type == MTK_DISP_RDMA ||
-		    comp_type == MTK_DSI ||
-		    comp_type == MTK_DPI) {
+		    comp_type == MTK_DPI ||
+		    comp_type == MTK_DSI) {
 			dev_info(dev, "Adding component match for %pOF\n",
 				 node);
 			drm_of_component_match_add(dev, &match, compare_of,
-- 
2.18.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
