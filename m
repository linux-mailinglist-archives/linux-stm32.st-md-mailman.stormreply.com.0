Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0608E461F8B
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Nov 2021 19:45:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF794C5F1C9;
	Mon, 29 Nov 2021 18:44:59 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A658C5EC7E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Nov 2021 18:44:55 +0000 (UTC)
X-UUID: 4fb7dbd3d38f47628d2eac56c1513e7a-20211130
X-UUID: 4fb7dbd3d38f47628d2eac56c1513e7a-20211130
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1285703391; Tue, 30 Nov 2021 02:44:45 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 30 Nov 2021 02:44:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 30 Nov 2021 02:44:43 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Tue, 30 Nov 2021 02:44:35 +0800
Message-ID: <20211129184439.16892-12-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211129184439.16892-1-jason-jh.lin@mediatek.com>
References: <20211129184439.16892-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, jason-jh.lin@mediatek.com,
 singo.chang@mediatek.com, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 nancy.lin@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v13 11/15] drm/mediatek: rename the define of
	register offset
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

Add DISP_REG prefix for the define of register offset to
make the difference from the define of register value.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
rebase on series [1]

[1] drm/mediatek: add support for mediatek SOC MT8192
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=529489
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 62 +++++++++++----------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 7d3bd6214c15..40ea57fc4473 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -20,22 +20,22 @@
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_crtc.h"
 
-#define DISP_OD_EN				0x0000
-#define DISP_OD_CFG				0x0020
-#define DISP_OD_SIZE				0x0030
-#define DISP_DITHER_5				0x0114
-#define DISP_DITHER_7				0x011c
-#define DISP_DITHER_15				0x013c
-#define DISP_DITHER_16				0x0140
+#define DISP_REG_OD_EN				0x0000
+#define DISP_REG_OD_CFG				0x0020
+#define DISP_REG_OD_SIZE			0x0030
+#define DISP_REG_DITHER_5			0x0114
+#define DISP_REG_DITHER_7			0x011c
+#define DISP_REG_DITHER_15			0x013c
+#define DISP_REG_DITHER_16			0x0140
 
 #define DISP_REG_UFO_START			0x0000
 
-#define DISP_DITHER_EN				0x0000
+#define DISP_REG_DITHER_EN			0x0000
 #define DITHER_EN				BIT(0)
-#define DISP_DITHER_CFG				0x0020
+#define DISP_REG_DITHER_CFG			0x0020
 #define DITHER_RELAY_MODE			BIT(0)
 #define DITHER_ENGINE_EN			BIT(1)
-#define DISP_DITHER_SIZE			0x0030
+#define DISP_REG_DITHER_SIZE			0x0030
 
 #define OD_RELAYMODE				BIT(0)
 
@@ -50,11 +50,11 @@
 #define DITHER_LSB_ERR_SHIFT_G(x)		(((x) & 0x7) << 12)
 #define DITHER_ADD_LSHIFT_G(x)			(((x) & 0x7) << 4)
 
-#define DISP_POSTMASK_EN			0x0000
+#define DISP_REG_POSTMASK_EN			0x0000
 #define POSTMASK_EN					BIT(0)
-#define DISP_POSTMASK_CFG			0x0020
+#define DISP_REG_POSTMASK_CFG			0x0020
 #define POSTMASK_RELAY_MODE				BIT(0)
-#define DISP_POSTMASK_SIZE			0x0030
+#define DISP_REG_POSTMASK_SIZE			0x0030
 
 struct mtk_ddp_comp_dev {
 	struct clk *clk;
@@ -130,19 +130,19 @@ void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
 		return;
 
 	if (bpc >= MTK_MIN_BPC) {
-		mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_5);
-		mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_7);
+		mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_REG_DITHER_5);
+		mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_REG_DITHER_7);
 		mtk_ddp_write(cmdq_pkt,
 			      DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
 			      DITHER_ADD_LSHIFT_R(MTK_MAX_BPC - bpc) |
 			      DITHER_NEW_BIT_MODE,
-			      cmdq_reg, regs, DISP_DITHER_15);
+			      cmdq_reg, regs, DISP_REG_DITHER_15);
 		mtk_ddp_write(cmdq_pkt,
 			      DITHER_LSB_ERR_SHIFT_B(MTK_MAX_BPC - bpc) |
 			      DITHER_ADD_LSHIFT_B(MTK_MAX_BPC - bpc) |
 			      DITHER_LSB_ERR_SHIFT_G(MTK_MAX_BPC - bpc) |
 			      DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),
-			      cmdq_reg, regs, DISP_DITHER_16);
+			      cmdq_reg, regs, DISP_REG_DITHER_16);
 		mtk_ddp_write(cmdq_pkt, dither_en, cmdq_reg, regs, cfg);
 	}
 }
@@ -162,16 +162,16 @@ static void mtk_od_config(struct device *dev, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_OD_SIZE);
-	mtk_ddp_write(cmdq_pkt, OD_RELAYMODE, &priv->cmdq_reg, priv->regs, DISP_OD_CFG);
-	mtk_dither_set(dev, bpc, DISP_OD_CFG, cmdq_pkt);
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_REG_OD_SIZE);
+	mtk_ddp_write(cmdq_pkt, OD_RELAYMODE, &priv->cmdq_reg, priv->regs, DISP_REG_OD_CFG);
+	mtk_dither_set(dev, bpc, DISP_REG_OD_CFG, cmdq_pkt);
 }
 
 static void mtk_od_start(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel(1, priv->regs + DISP_OD_EN);
+	writel(1, priv->regs + DISP_REG_OD_EN);
 }
 
 static void mtk_ufoe_start(struct device *dev)
@@ -187,9 +187,11 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
-	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
-	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_DITHER_CFG,
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_DITHER_SIZE);
+	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_DITHER_CFG);
+	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_REG_DITHER_CFG,
 			      DITHER_ENGINE_EN, cmdq_pkt);
 }
 
@@ -197,14 +199,14 @@ static void mtk_dither_start(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel(DITHER_EN, priv->regs + DISP_DITHER_EN);
+	writel(DITHER_EN, priv->regs + DISP_REG_DITHER_EN);
 }
 
 static void mtk_dither_stop(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel_relaxed(0x0, priv->regs + DISP_DITHER_EN);
+	writel_relaxed(0x0, priv->regs + DISP_REG_DITHER_EN);
 }
 
 static void mtk_postmask_config(struct device *dev, unsigned int w,
@@ -214,23 +216,23 @@ static void mtk_postmask_config(struct device *dev, unsigned int w,
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
 	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,
-		      DISP_POSTMASK_SIZE);
+		      DISP_REG_POSTMASK_SIZE);
 	mtk_ddp_write(cmdq_pkt, POSTMASK_RELAY_MODE, &priv->cmdq_reg,
-		      priv->regs, DISP_POSTMASK_CFG);
+		      priv->regs, DISP_REG_POSTMASK_CFG);
 }
 
 static void mtk_postmask_start(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel(POSTMASK_EN, priv->regs + DISP_POSTMASK_EN);
+	writel(POSTMASK_EN, priv->regs + DISP_REG_POSTMASK_EN);
 }
 
 static void mtk_postmask_stop(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	writel_relaxed(0x0, priv->regs + DISP_POSTMASK_EN);
+	writel_relaxed(0x0, priv->regs + DISP_REG_POSTMASK_EN);
 }
 
 static const struct mtk_ddp_comp_funcs ddp_aal = {
-- 
2.18.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
