Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C24555AE350
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Sep 2022 10:45:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80220C6334A;
	Tue,  6 Sep 2022 08:45:27 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85416C63325
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Sep 2022 08:45:25 +0000 (UTC)
X-UUID: 208bf84a14404499aead355a86577e7f-20220906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2WKJ/wVUkeTQLKTawlGlXDOI8foFUVG3UjyUJ12fdDE=; 
 b=a/vLjNbOJRjAHuwYhmD0cmGzfmc+Br1HBgqC2Y82TqBi3sS9kOmPVblpQXlpAr1ZnkQUGScYwtLiki8X/4u37LaUfKpEFR1YXpXl2EMjlpWfnVSefcWcnF8jRrD0nBkOP8lpmi0gqv4swm53T3jNN2ietHHfSl4IyvUr0r8CbcQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:2b27f7f0-ac5e-46ab-9391-0f0bc3076999, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Releas
 e_Ham,ACTION:release,TS:100
X-CID-INFO: VERSION:1.1.10, REQID:2b27f7f0-ac5e-46ab-9391-0f0bc3076999, OB:0,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS9
 81B3D,ACTION:quarantine,TS:100
X-CID-META: VersionHash:84eae18, CLOUDID:4003cf56-e800-47dc-8adf-0c936acf4f1b,
 C
 OID:6df14ab3234d,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 208bf84a14404499aead355a86577e7f-20220906
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <nathan.lu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 687607282; Tue, 06 Sep 2022 16:45:20 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 6 Sep 2022 16:45:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 6 Sep 2022 16:45:18 +0800
From: nathan.lu <nathan.lu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Date: Tue, 6 Sep 2022 16:44:47 +0800
Message-ID: <20220906084449.20124-5-nathan.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220906084449.20124-1-nathan.lu@mediatek.com>
References: <20220906084449.20124-1-nathan.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: Nathan Lu <nathan.lu@mediatek.com>, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 lancelot.wu@mediatek.com, amy zhang <Amy.Zhang@mediatek.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH v2 4/6] soc: mediatek: add mtk-mmsys support
	for mt8188 vdosys0
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

From: Nathan Lu <nathan.lu@mediatek.com>

1. add mt8188 mmsys
2. add mt8188 vdosys0 routing table settings

Signed-off-by: amy zhang <Amy.Zhang@mediatek.com>
Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
---
 drivers/soc/mediatek/mt8188-mmsys.h | 149 ++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c    |  18 ++++
 2 files changed, 167 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8188-mmsys.h

diff --git a/drivers/soc/mediatek/mt8188-mmsys.h b/drivers/soc/mediatek/mt8188-mmsys.h
new file mode 100644
index 000000000000..e1ab318c9192
--- /dev/null
+++ b/drivers/soc/mediatek/mt8188-mmsys.h
@@ -0,0 +1,149 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_MEDIATEK_MT8188_MMSYS_H
+#define __SOC_MEDIATEK_MT8188_MMSYS_H
+
+#define MT8188_VDO0_OVL_MOUT_EN				0xf14
+#define MT8188_MOUT_DISP_OVL0_TO_DISP_RDMA0		BIT(0)
+#define MT8188_MOUT_DISP_OVL0_TO_DISP_WDMA0		BIT(1)
+#define MT8188_MOUT_DISP_OVL0_TO_DISP_OVL1		BIT(2)
+#define MT8188_MOUT_DISP_OVL1_TO_DISP_RDMA1		BIT(4)
+#define MT8188_MOUT_DISP_OVL1_TO_DISP_WDMA1		BIT(5)
+#define MT8188_MOUT_DISP_OVL1_TO_DISP_OVL0		BIT(6)
+
+#define MT8188_VDO0_SEL_IN				0xf34
+#define MT8188_VDO0_SEL_OUT				0xf38
+
+#define MT8188_VDO0_DISP_RDMA_SEL			0xf40
+#define MT8188_SOUT_DISP_RDMA0_TO_MASK			GENMASK(2, 0)
+#define MT8188_SOUT_DISP_RDMA0_TO_DISP_COLOR0		(0 << 0)
+#define MT8188_SOUT_DISP_RDMA0_TO_DISP_DSI0		(1 << 0)
+#define MT8188_SOUT_DISP_RDMA0_TO_DISP_DP_INTF0		(5 << 0)
+#define MT8188_SEL_IN_DISP_RDMA0_FROM_MASK		GENMASK(8, 8)
+#define MT8188_SEL_IN_DISP_RDMA0_FROM_DISP_OVL0		(0 << 8)
+#define MT8188_SEL_IN_DISP_RDMA0_FROM_DISP_RSZ0		(1 << 8)
+
+
+#define MT8188_VDO0_DSI0_SEL_IN				0xf44
+#define MT8188_SEL_IN_DSI0_FROM_MASK			GENMASK(16, 16)
+#define MT8188_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT		(0 << 16)
+#define MT8188_SEL_IN_DSI0_FROM_DISP_DITHER0		(1 << 16)
+
+#define MT8188_VDO0_DP_INTF0_SEL_IN			0xf4C
+#define MT8188_SEL_IN_DP_INTF0_FROM_MASK		GENMASK(2, 0)
+#define MT8188_SEL_IN_DP_INTF0_FROM_DSC_WRAP0C1_OUT	(0 << 0)
+#define MT8188_SEL_IN_DP_INTF0_FROM_VPP_MERGE		(1 << 0)
+#define MT8188_SEL_IN_DP_INTF0_FROM_DISP_DITHER0	(3 << 0)
+
+#define MT8188_VDO0_DISP_DITHER0_SEL_OUT		0xf58
+#define MT8188_SOUT_DISP_DITHER0_TO_MASK		BIT(0)
+#define MT8188_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN	(0 << 0)
+#define MT8188_SOUT_DISP_DITHER0_TO_DSI0		(1 << 0)
+#define MT8188_SOUT_DISP_DITHER0_TO_VPP_MERGE0		(6 << 0)
+#define MT8188_SOUT_DISP_DITHER0_TO_DP_INTF0		(7 << 0)
+
+#define MT8188_VDO0_VPP_MERGE_SEL			0xf60
+#define MT8188_SEL_IN_VPP_MERGE_FROM_MASK		GENMASK(1, 0)
+#define MT8188_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT	(0 << 0)
+#define MT8188_SEL_IN_VPP_MERGE_FROM_DITHER0_OUT	(3 << 0)
+
+#define MT8188_SOUT_VPP_MERGE_TO_MASK			GENMASK(6, 4)
+#define MT8188_SOUT_VPP_MERGE_TO_DSI1			(0 << 4)
+#define MT8188_SOUT_VPP_MERGE_TO_DP_INTF0		(1 << 4)
+#define MT8188_SOUT_VPP_MERGE_TO_SINA_VIRTUAL0		(2 << 4)
+#define MT8188_SOUT_VPP_MERGE_TO_DISP_WDMA1		(3 << 4)
+#define MT8188_SOUT_VPP_MERGE_TO_DSC_WRAP0_IN		(4 << 4)
+#define MT8188_SOUT_VPP_MERGE_TO_DISP_WDMA0		(5 << 4)
+#define MT8188_SOUT_VPP_MERGE_TO_DSC_WRAP1_IN_MASK	GENMASK(11, 11)
+#define MT8188_SOUT_VPP_MERGE_TO_DSC_WRAP1_IN		(0 << 11)
+
+#define MT8188_VDO0_DSC_WARP_SEL			0xf64
+#define MT8188_SEL_IN_DSC_WRAP0C0_IN_FROM_MASK		GENMASK(0, 0)
+#define MT8188_SEL_IN_DSC_WRAP0C0_IN_FROM_DISP_DITHER0	(0 << 0)
+#define MT8188_SEL_IN_DSC_WRAP0C0_IN_FROM_VPP_MERGE	(1 << 0)
+#define MT8188_SOUT_DSC_WRAP0_OUT_TO_MASK		GENMASK(19, 16)
+#define MT8188_SOUT_DSC_WRAP0_OUT_TO_DSI0		BIT(16)
+#define MT8188_SOUT_DSC_WRAP0_OUT_TO_SINB_VIRTUAL0	BIT(17)
+#define MT8188_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE		BIT(18)
+#define MT8188_SOUT_DSC_WRAP0_OUT_TO_DISP_WDMA0		BIT(19)
+
+static const struct mtk_mmsys_routes mmsys_mt8188_routing_table[] = {
+	{
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
+		MT8188_VDO0_OVL_MOUT_EN, MT8188_MOUT_DISP_OVL0_TO_DISP_RDMA0,
+		MT8188_MOUT_DISP_OVL0_TO_DISP_RDMA0
+	}, {
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_WDMA0,
+		MT8188_VDO0_OVL_MOUT_EN, MT8188_MOUT_DISP_OVL0_TO_DISP_WDMA0,
+		MT8188_MOUT_DISP_OVL0_TO_DISP_WDMA0
+	}, {
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
+		MT8188_VDO0_DISP_RDMA_SEL, MT8188_SEL_IN_DISP_RDMA0_FROM_MASK,
+		MT8188_SEL_IN_DISP_RDMA0_FROM_DISP_OVL0
+	}, {
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
+		MT8188_VDO0_DSI0_SEL_IN, MT8188_SEL_IN_DSI0_FROM_MASK,
+		MT8188_SEL_IN_DSI0_FROM_DISP_DITHER0
+	}, {
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_MERGE0,
+		MT8188_VDO0_VPP_MERGE_SEL, MT8188_SEL_IN_VPP_MERGE_FROM_MASK,
+		MT8188_SEL_IN_VPP_MERGE_FROM_DITHER0_OUT
+	}, {
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSC0,
+		MT8188_VDO0_DSC_WARP_SEL,
+		MT8188_SEL_IN_DSC_WRAP0C0_IN_FROM_MASK,
+		MT8188_SEL_IN_DSC_WRAP0C0_IN_FROM_DISP_DITHER0
+	}, {
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DP_INTF0,
+		MT8188_VDO0_DP_INTF0_SEL_IN, MT8188_SEL_IN_DP_INTF0_FROM_MASK,
+		MT8188_SEL_IN_DP_INTF0_FROM_DISP_DITHER0
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
+		MT8188_VDO0_VPP_MERGE_SEL, MT8188_SEL_IN_VPP_MERGE_FROM_MASK,
+		MT8188_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
+		MT8188_VDO0_DSI0_SEL_IN, MT8188_SEL_IN_DSI0_FROM_MASK,
+		MT8188_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT
+	}, {
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
+		MT8188_VDO0_DISP_RDMA_SEL, MT8188_SOUT_DISP_RDMA0_TO_MASK,
+		MT8188_SOUT_DISP_RDMA0_TO_DISP_COLOR0
+	},  {
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
+		MT8188_VDO0_DISP_DITHER0_SEL_OUT,
+		MT8188_SOUT_DISP_DITHER0_TO_MASK,
+		MT8188_SOUT_DISP_DITHER0_TO_DSI0
+	},  {
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DP_INTF0,
+		MT8188_VDO0_DISP_DITHER0_SEL_OUT,
+		MT8188_SOUT_DISP_DITHER0_TO_MASK,
+		MT8188_SOUT_DISP_DITHER0_TO_DP_INTF0
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF0,
+		MT8188_VDO0_VPP_MERGE_SEL, MT8188_SOUT_VPP_MERGE_TO_MASK,
+		MT8188_SOUT_VPP_MERGE_TO_DP_INTF0
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DPI0,
+		MT8188_VDO0_VPP_MERGE_SEL, MT8188_SOUT_VPP_MERGE_TO_MASK,
+		MT8188_SOUT_VPP_MERGE_TO_SINA_VIRTUAL0
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_WDMA0,
+		MT8188_VDO0_VPP_MERGE_SEL, MT8188_SOUT_VPP_MERGE_TO_MASK,
+		MT8188_SOUT_VPP_MERGE_TO_DISP_WDMA0
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DSC0,
+		MT8188_VDO0_VPP_MERGE_SEL, MT8188_SOUT_VPP_MERGE_TO_MASK,
+		MT8188_SOUT_VPP_MERGE_TO_DSC_WRAP0_IN
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
+		MT8188_VDO0_DSC_WARP_SEL, MT8188_SOUT_DSC_WRAP0_OUT_TO_MASK,
+		MT8188_SOUT_DSC_WRAP0_OUT_TO_DSI0
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
+		MT8188_VDO0_DSC_WARP_SEL, MT8188_SOUT_DSC_WRAP0_OUT_TO_MASK,
+		MT8188_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE
+	},
+};
+
+#endif /* __SOC_MEDIATEK_MT8188_MMSYS_H */
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 114defd48298..9fba969dce1c 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -16,6 +16,7 @@
 #include "mt8167-mmsys.h"
 #include "mt8183-mmsys.h"
 #include "mt8186-mmsys.h"
+#include "mt8188-mmsys.h"
 #include "mt8192-mmsys.h"
 #include "mt8195-mmsys.h"
 #include "mt8365-mmsys.h"
@@ -128,6 +129,19 @@ static const struct mtk_mmsys_match_data mt8186_mmsys_match_data = {
 	},
 };
 
+static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
+	.clk_driver = "clk-mt8188-vdo0",
+	.routes = mmsys_mt8188_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_mt8188_routing_table),
+};
+
+static const struct mtk_mmsys_match_data mt8188_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8188_vdosys0_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.clk_driver = "clk-mt8192-mm",
 	.routes = mmsys_mt8192_routing_table,
@@ -453,6 +467,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 		.compatible = "mediatek,mt8186-mmsys",
 		.data = &mt8186_mmsys_match_data,
 	},
+	{
+		.compatible = "mediatek,mt8188-mmsys",
+		.data = &mt8188_mmsys_match_data,
+	},
 	{
 		.compatible = "mediatek,mt8192-mmsys",
 		.data = &mt8192_mmsys_match_data,
-- 
2.18.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
