Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F449461F7E
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Nov 2021 19:44:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB15DC5EC7A;
	Mon, 29 Nov 2021 18:44:55 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 050B8C597B6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Nov 2021 18:44:53 +0000 (UTC)
X-UUID: 2f9588e6868d4d739419dc9a4c2e6a5a-20211130
X-UUID: 2f9588e6868d4d739419dc9a4c2e6a5a-20211130
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1465970027; Tue, 30 Nov 2021 02:44:44 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Nov 2021 02:44:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 30 Nov 2021 02:44:43 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Tue, 30 Nov 2021 02:44:34 +0800
Message-ID: <20211129184439.16892-11-jason-jh.lin@mediatek.com>
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
Subject: [Linux-stm32] [PATCH v13 10/15] drm/mediatek: remove unused define
	in mtk_drm_ddp_comp.c
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

Remove the unsed define in mtk_drm_ddp_comp.c

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 3704e4b7f3c5..7d3bd6214c15 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -21,8 +21,6 @@
 #include "mtk_drm_crtc.h"
 
 #define DISP_OD_EN				0x0000
-#define DISP_OD_INTEN				0x0008
-#define DISP_OD_INTSTA				0x000c
 #define DISP_OD_CFG				0x0020
 #define DISP_OD_SIZE				0x0030
 #define DISP_DITHER_5				0x0114
@@ -39,26 +37,18 @@
 #define DITHER_ENGINE_EN			BIT(1)
 #define DISP_DITHER_SIZE			0x0030
 
-#define LUT_10BIT_MASK				0x03ff
-
 #define OD_RELAYMODE				BIT(0)
 
 #define UFO_BYPASS				BIT(2)
 
 #define DISP_DITHERING				BIT(2)
 #define DITHER_LSB_ERR_SHIFT_R(x)		(((x) & 0x7) << 28)
-#define DITHER_OVFLW_BIT_R(x)			(((x) & 0x7) << 24)
 #define DITHER_ADD_LSHIFT_R(x)			(((x) & 0x7) << 20)
-#define DITHER_ADD_RSHIFT_R(x)			(((x) & 0x7) << 16)
 #define DITHER_NEW_BIT_MODE			BIT(0)
 #define DITHER_LSB_ERR_SHIFT_B(x)		(((x) & 0x7) << 28)
-#define DITHER_OVFLW_BIT_B(x)			(((x) & 0x7) << 24)
 #define DITHER_ADD_LSHIFT_B(x)			(((x) & 0x7) << 20)
-#define DITHER_ADD_RSHIFT_B(x)			(((x) & 0x7) << 16)
 #define DITHER_LSB_ERR_SHIFT_G(x)		(((x) & 0x7) << 12)
-#define DITHER_OVFLW_BIT_G(x)			(((x) & 0x7) << 8)
 #define DITHER_ADD_LSHIFT_G(x)			(((x) & 0x7) << 4)
-#define DITHER_ADD_RSHIFT_G(x)			(((x) & 0x7) << 0)
 
 #define DISP_POSTMASK_EN			0x0000
 #define POSTMASK_EN					BIT(0)
-- 
2.18.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
