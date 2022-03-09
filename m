Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E01884D304A
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Mar 2022 14:47:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E631C628A2;
	Wed,  9 Mar 2022 13:47:15 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58368C60497
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Mar 2022 13:47:13 +0000 (UTC)
X-UUID: 3e4b148f66274518bf6c2ae5b499658a-20220309
X-UUID: 3e4b148f66274518bf6c2ae5b499658a-20220309
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 939116367; Wed, 09 Mar 2022 21:47:06 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 9 Mar 2022 21:47:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 9 Mar 2022 21:47:04 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Wed, 9 Mar 2022 21:46:59 +0800
Message-ID: <20220309134702.9942-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220309134702.9942-1-jason-jh.lin@mediatek.com>
References: <20220309134702.9942-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, Fabien Parent <fparent@baylibre.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, CK Hu <ck.hu@mediatek.com>,
 moudy.ho@mediatek.com, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/4] Revert "dt-bindings: display:
	mediatek: add ethdr definition for mt8195"
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

This reverts commit e7dcfe64204a5cd9a74a9ca7d9c7a22434dc7fe5.

Because examples property of mediatek,ethdr.yaml should base on [1][2].
Reverting it until [1][2] are applied.

[1] dt-bindings: mediatek: mt8195: Add binding for MM IOMMU
https://patchwork.kernel.org/project/linux-mediatek/patch/20220217113453.13658-2-yong.wu@mediatek.com/
[2] dt-bindings: reset: mt8195: add vdosys1 reset control bit
https://patchwork.kernel.org/project/linux-mediatek/patch/20220222100741.30138-5-nancy.lin@mediatek.com/

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 .../display/mediatek/mediatek,ethdr.yaml      | 147 ------------------
 1 file changed, 147 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
deleted file mode 100644
index 131eed5eeeb7..000000000000
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
+++ /dev/null
@@ -1,147 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,ethdr.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Mediatek Ethdr Device Tree Bindings
-
-maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
-
-description: |
-  ETHDR is designed for HDR video and graphics conversion in the external display path.
-  It handles multiple HDR input types and performs tone mapping, color space/color
-  format conversion, and then combine different layers, output the required HDR or
-  SDR signal to the subsequent display path. This engine is composed of two video
-  frontends, two graphic frontends, one video backend and a mixer. ETHDR has two
-  DMA function blocks, DS and ADL. These two function blocks read the pre-programmed
-  registers from DRAM and set them to HW in the v-blanking period.
-
-properties:
-  compatible:
-    items:
-      - const: mediatek,mt8195-disp-ethdr
-  reg:
-    maxItems: 7
-  reg-names:
-    items:
-      - const: mixer
-      - const: vdo_fe0
-      - const: vdo_fe1
-      - const: gfx_fe0
-      - const: gfx_fe1
-      - const: vdo_be
-      - const: adl_ds
-  interrupts:
-    minItems: 1
-  iommus:
-    description: The compatible property is DMA function blocks.
-      Should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for
-      details.
-    minItems: 1
-    maxItems: 2
-  clocks:
-    items:
-      - description: mixer clock
-      - description: video frontend 0 clock
-      - description: video frontend 1 clock
-      - description: graphic frontend 0 clock
-      - description: graphic frontend 1 clock
-      - description: video backend clock
-      - description: autodownload and menuload clock
-      - description: video frontend 0 async clock
-      - description: video frontend 1 async clock
-      - description: graphic frontend 0 async clock
-      - description: graphic frontend 1 async clock
-      - description: video backend async clock
-      - description: ethdr top clock
-  clock-names:
-    items:
-      - const: mixer
-      - const: vdo_fe0
-      - const: vdo_fe1
-      - const: gfx_fe0
-      - const: gfx_fe1
-      - const: vdo_be
-      - const: adl_ds
-      - const: vdo_fe0_async
-      - const: vdo_fe1_async
-      - const: gfx_fe0_async
-      - const: gfx_fe1_async
-      - const: vdo_be_async
-      - const: ethdr_top
-  power-domains:
-    maxItems: 1
-  resets:
-    maxItems: 5
-  mediatek,gce-client-reg:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    description: The register of display function block to be set by gce.
-      There are 4 arguments in this property, gce node, subsys id, offset and
-      register size. The subsys id is defined in the gce header of each chips
-      include/include/dt-bindings/gce/<chip>-gce.h, mapping to the register of
-      display function block.
-
-required:
-  - compatible
-  - reg
-  - clocks
-  - clock-names
-  - interrupts
-  - power-domains
-
-additionalProperties: false
-
-examples:
-  - |
-
-    disp_ethdr@1c114000 {
-            compatible = "mediatek,mt8195-disp-ethdr";
-            reg = <0 0x1c114000 0 0x1000>,
-                  <0 0x1c115000 0 0x1000>,
-                  <0 0x1c117000 0 0x1000>,
-                  <0 0x1c119000 0 0x1000>,
-                  <0 0x1c11A000 0 0x1000>,
-                  <0 0x1c11B000 0 0x1000>,
-                  <0 0x1c11C000 0 0x1000>;
-            reg-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
-                        "vdo_be", "adl_ds";
-            mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x4000 0x1000>,
-                                      <&gce0 SUBSYS_1c11XXXX 0x5000 0x1000>,
-                                      <&gce0 SUBSYS_1c11XXXX 0x7000 0x1000>,
-                                      <&gce0 SUBSYS_1c11XXXX 0x9000 0x1000>,
-                                      <&gce0 SUBSYS_1c11XXXX 0xA000 0x1000>,
-                                      <&gce0 SUBSYS_1c11XXXX 0xB000 0x1000>,
-                                      <&gce0 SUBSYS_1c11XXXX 0xC000 0x1000>;
-            clocks = <&vdosys1 CLK_VDO1_DISP_MIXER>,
-                     <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
-                     <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
-                     <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
-                     <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
-                     <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
-                     <&vdosys1 CLK_VDO1_26M_SLOW>,
-                     <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
-                     <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
-                     <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
-                     <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
-                     <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
-                     <&topckgen CLK_TOP_ETHDR_SEL>;
-            clock-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
-                          "vdo_be", "adl_ds", "vdo_fe0_async", "vdo_fe1_async",
-                          "gfx_fe0_async", "gfx_fe1_async","vdo_be_async",
-                          "ethdr_top";
-            power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
-            iommus = <&iommu_vpp M4U_PORT_L3_HDR_DS>,
-                     <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
-            interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>; /* disp mixer */
-            resets = <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC>,
-                     <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC>,
-                     <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC>,
-                     <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC>,
-                     <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC>;
-    };
-
-...
-- 
2.18.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
