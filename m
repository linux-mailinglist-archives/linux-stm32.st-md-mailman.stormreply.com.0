Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF09A5AE353
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Sep 2022 10:45:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB797C640F2;
	Tue,  6 Sep 2022 08:45:33 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73460C640FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Sep 2022 08:45:31 +0000 (UTC)
X-UUID: 267112a62b4047098b432e57f60367c6-20220906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=iXNrNuT55qB4UEKn0dm1EhQ6AW108Y1kOKA357cPY9Y=; 
 b=e1fhNF4kfa/U7ZwVk9QWr8gi+fn8qm+fpj5cXm0B0cF7+Vbs6IOtOiYu1jfMXNhzEn+40Ed9K2ICAxntQ4ZH4ML4Fl6eDanKUXNFFniYpIrNbTyavgkDYOg813HzyjWpzbnpoZ4J7c+fErlOLSW8KXH4o9R2N2MUcJU/FpKqI7M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:04995f6d-02bf-4c75-8b73-4525f6a060bc, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
 _Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18, CLOUDID:d8fc5721-1c20-48a5-82a0-25f9c331906d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
 nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 267112a62b4047098b432e57f60367c6-20220906
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <nathan.lu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1070819910; Tue, 06 Sep 2022 16:45:23 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 6 Sep 2022 16:45:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 6 Sep 2022 16:45:21 +0800
From: nathan.lu <nathan.lu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Date: Tue, 6 Sep 2022 16:44:49 +0800
Message-ID: <20220906084449.20124-7-nathan.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220906084449.20124-1-nathan.lu@mediatek.com>
References: <20220906084449.20124-1-nathan.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: Nathan Lu <nathan.lu@mediatek.com>, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Rex-BC
 Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 lancelot.wu@mediatek.com, amy zhang <Amy.Zhang@mediatek.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH v2 6/6] drm/mediatek: add mediatek-drm of
	vdosys0 support for mt8188
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

add driver data of mt8188 vdosys0 to mediatek-drm and the sub driver.

Signed-off-by: amy zhang <Amy.Zhang@mediatek.com>
Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index d72263c8a621..649f22ac8cab 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -178,6 +178,18 @@ static const unsigned int mt8186_mtk_ddp_ext[] = {
 	DDP_COMPONENT_DPI0,
 };
 
+static const unsigned int mt8188_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_CCORR,
+	DDP_COMPONENT_AAL0,
+	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_POSTMASK0,
+	DDP_COMPONENT_DITHER0,
+	DDP_COMPONENT_DP_INTF0,
+};
+
 static const unsigned int mt8192_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_OVL_2L0,
@@ -323,6 +335,19 @@ static const struct mtk_mmsys_match_data mt8186_mmsys_match_data = {
 	},
 };
 
+static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
+	.main_path = mt8188_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt8188_mtk_ddp_main),
+	.mmsys_dev_num = 1,
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
 	.main_path = mt8192_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
@@ -376,6 +401,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8183_mmsys_match_data},
 	{ .compatible = "mediatek,mt8186-mmsys",
 	  .data = &mt8186_mmsys_match_data},
+	{ .compatible = "mediatek,mt8188-mmsys",
+	  .data = &mt8188_mmsys_match_data},
 	{ .compatible = "mediatek,mt8192-mmsys",
 	  .data = &mt8192_mmsys_match_data},
 	{ .compatible = "mediatek,mt8195-mmsys",
@@ -734,6 +761,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8186-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8188-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8192-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8195-disp-mutex",
-- 
2.18.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
