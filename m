Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 514774D304C
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Mar 2022 14:47:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09AA6C628A8;
	Wed,  9 Mar 2022 13:47:17 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 198BBC6049C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Mar 2022 13:47:13 +0000 (UTC)
X-UUID: ac7fbddf2eb04c26ad9eaa32049c7343-20220309
X-UUID: ac7fbddf2eb04c26ad9eaa32049c7343-20220309
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 219848943; Wed, 09 Mar 2022 21:47:06 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 9 Mar 2022 21:47:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 9 Mar 2022 21:47:05 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Wed, 9 Mar 2022 21:47:02 +0800
Message-ID: <20220309134702.9942-5-jason-jh.lin@mediatek.com>
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
Subject: [Linux-stm32] [PATCH v2 4/4] dt-bindings: display: mediatek: Fix
	examples on new bindings
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

To avoid failure of dt_binding_check perform a slight refactoring
of the examples: the main block is kept, but that required fixing
the address and size cells, plus the inclusion of missing dt-bindings
headers, required to parse some of the values assigned to various
properties.

Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Tested-by: jason-jh.lin <jason-jh.lin@medaitek.com>
---
 .../display/mediatek/mediatek,aal.yaml        | 23 ++++++---
 .../display/mediatek/mediatek,ccorr.yaml      | 23 ++++++---
 .../display/mediatek/mediatek,color.yaml      | 23 ++++++---
 .../display/mediatek/mediatek,dither.yaml     | 23 ++++++---
 .../display/mediatek/mediatek,dpi.yaml        |  3 +-
 .../display/mediatek/mediatek,dsc.yaml        | 23 ++++++---
 .../display/mediatek/mediatek,gamma.yaml      | 23 ++++++---
 .../display/mediatek/mediatek,merge.yaml      | 49 +++++++++----------
 .../display/mediatek/mediatek,mutex.yaml      | 25 +++++++---
 .../display/mediatek/mediatek,od.yaml         | 14 ++++--
 .../display/mediatek/mediatek,ovl-2l.yaml     | 26 +++++++---
 .../display/mediatek/mediatek,ovl.yaml        | 26 +++++++---
 .../display/mediatek/mediatek,postmask.yaml   | 23 ++++++---
 .../display/mediatek/mediatek,rdma.yaml       | 28 +++++++----
 .../display/mediatek/mediatek,split.yaml      | 17 +++++--
 .../display/mediatek/mediatek,ufoe.yaml       | 19 ++++---
 .../display/mediatek/mediatek,wdma.yaml       | 26 +++++++---
 17 files changed, 260 insertions(+), 134 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 225f9dd726d2..61f0ed1e388f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -66,12 +66,21 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
 
-    aal@14015000 {
-        compatible = "mediatek,mt8173-disp-aal";
-        reg = <0 0x14015000 0 0x1000>;
-        interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-        clocks = <&mmsys CLK_MM_DISP_AAL>;
-        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        aal@14015000 {
+           compatible = "mediatek,mt8173-disp-aal";
+           reg = <0 0x14015000 0 0x1000>;
+           interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_LOW>;
+           power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+           clocks = <&mmsys CLK_MM_DISP_AAL>;
+           mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
+       };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 6894b6999412..0ed53b6238f0 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -65,12 +65,21 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/power/mt8183-power.h>
+    #include <dt-bindings/gce/mt8183-gce.h>
 
-    ccorr0: ccorr@1400f000 {
-        compatible = "mediatek,mt8183-disp-ccorr";
-        reg = <0 0x1400f000 0 0x1000>;
-        interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
-        clocks = <&mmsys CLK_MM_DISP_CCORR0>;
-        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ccorr0: ccorr@1400f000 {
+            compatible = "mediatek,mt8183-disp-ccorr";
+            reg = <0 0x1400f000 0 0x1000>;
+            interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+            clocks = <&mmsys CLK_MM_DISP_CCORR0>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index bc83155b3b4c..3ad842eb5668 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -75,12 +75,21 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
 
-    color0: color@14013000 {
-        compatible = "mediatek,mt8173-disp-color";
-        reg = <0 0x14013000 0 0x1000>;
-        interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-        clocks = <&mmsys CLK_MM_DISP_COLOR0>;
-        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x3000 0x1000>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        color0: color@14013000 {
+            compatible = "mediatek,mt8173-disp-color";
+            reg = <0 0x14013000 0 0x1000>;
+            interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_DISP_COLOR0>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x3000 0x1000>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 9d89297f5f1d..6657549af165 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -65,12 +65,21 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/power/mt8183-power.h>
+    #include <dt-bindings/gce/mt8183-gce.h>
 
-    dither0: dither@14012000 {
-        compatible = "mediatek,mt8183-disp-dither";
-        reg = <0 0x14012000 0 0x1000>;
-        interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
-        clocks = <&mmsys CLK_MM_DISP_DITHER0>;
-        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dither0: dither@14012000 {
+            compatible = "mediatek,mt8183-disp-dither";
+            reg = <0 0x14012000 0 0x1000>;
+            interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+            clocks = <&mmsys CLK_MM_DISP_DITHER0>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index dd2896a40ff0..843f89d6053f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -70,8 +70,7 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/interrupt-controller/irq.h>
+
     dpi0: dpi@1401d000 {
         compatible = "mediatek,mt8173-dpi";
         reg = <0x1401d000 0x1000>;
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
index 1ec083eff824..49248864514b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
@@ -60,12 +60,21 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/power/mt8195-power.h>
+    #include <dt-bindings/gce/mt8195-gce.h>
 
-    dsc0: disp_dsc_wrap@1c009000 {
-        compatible = "mediatek,mt8195-disp-dsc";
-        reg = <0 0x1c009000 0 0x1000>;
-        interrupts = <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH 0>;
-        power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
-        clocks = <&vdosys0 CLK_VDO0_DSC_WRAP0>;
-        mediatek,gce-client-reg = <&gce1 SUBSYS_1c00XXXX 0x9000 0x1000>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dsc0: disp_dsc_wrap@1c009000 {
+            compatible = "mediatek,mt8195-disp-dsc";
+            reg = <0 0x1c009000 0 0x1000>;
+            interrupts = <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH 0>;
+            power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+            clocks = <&vdosys0 CLK_VDO0_DSC_WRAP0>;
+            mediatek,gce-client-reg = <&gce1 SUBSYS_1c00XXXX 0x9000 0x1000>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index 247baad147b3..78442339314f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -66,12 +66,21 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
 
-    gamma@14016000 {
-        compatible = "mediatek,mt8173-disp-gamma";
-        reg = <0 0x14016000 0 0x1000>;
-        interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-        clocks = <&mmsys CLK_MM_DISP_GAMMA>;
-        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x6000 0x1000>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        gamma@14016000 {
+            compatible = "mediatek,mt8173-disp-gamma";
+            reg = <0 0x14016000 0 0x1000>;
+            interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_DISP_GAMMA>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x6000 0x1000>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
index d5cd69b7f501..d635c5dcb68b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
@@ -38,18 +38,16 @@ properties:
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
   clocks:
+    minItems: 1
     maxItems: 2
-    items:
-      - description: MERGE Clock
-      - description: MERGE Async Clock
-          Controlling the synchronous process between MERGE and other display
-          function blocks cross clock domain.
 
   clock-names:
-    maxItems: 2
-    items:
-      - const: merge
-      - const: merge_async
+    oneOf:
+      - items:
+          - const: merge
+      - items:
+          - const: merge
+          - const: merge_async
 
   mediatek,merge-fifo-en:
     description:
@@ -88,23 +86,20 @@ additionalProperties: false
 
 examples:
   - |
-
-    merge@14017000 {
-        compatible = "mediatek,mt8173-disp-merge";
-        reg = <0 0x14017000 0 0x1000>;
-        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
-        clocks = <&mmsys CLK_MM_DISP_MERGE>;
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        merge@14017000 {
+            compatible = "mediatek,mt8173-disp-merge";
+            reg = <0 0x14017000 0 0x1000>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_DISP_MERGE>;
+            clock-names = "merge";
+        };
     };
 
-    merge5: disp_vpp_merge5@1c110000 {
-        compatible = "mediatek,mt8195-disp-merge";
-        reg = <0 0x1c110000 0 0x1000>;
-        interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>;
-        clocks = <&vdosys1 CLK_VDO1_VPP_MERGE4>,
-                 <&vdosys1 CLK_VDO1_MERGE4_DL_ASYNC>;
-        clock-names = "merge","merge_async";
-        power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
-        mediatek,gce-client-reg = <&gce1 SUBSYS_1c11XXXX 0x0000 0x1000>;
-        mediatek,merge-fifo-en = <1>;
-        resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC>;
-    };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
index 842ba7b07a34..00e6a1041a9b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
@@ -71,13 +71,22 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
 
-    mutex: mutex@14020000 {
-        compatible = "mediatek,mt8173-disp-mutex";
-        reg = <0 0x14020000 0 0x1000>;
-        interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
-        clocks = <&mmsys CLK_MM_MUTEX_32K>;
-        mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
-                              <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        mutex: mutex@14020000 {
+            compatible = "mediatek,mt8173-disp-mutex";
+            reg = <0 0x14020000 0 0x1000>;
+            interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_MUTEX_32K>;
+            mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
+                                  <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
index 7519db315217..853fcb9db2be 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
@@ -45,9 +45,15 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mt8173-clk.h>
 
-    od@14023000 {
-        compatible = "mediatek,mt8173-disp-od";
-        reg = <0 0x14023000 0 0x1000>;
-        clocks = <&mmsys CLK_MM_DISP_OD>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        od@14023000 {
+            compatible = "mediatek,mt8173-disp-od";
+            reg = <0 0x14023000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_DISP_OD>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
index e3cef99d0f98..da999ba53b7c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
@@ -66,13 +66,23 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/power/mt8183-power.h>
+    #include <dt-bindings/gce/mt8183-gce.h>
+    #include <dt-bindings/memory/mt8183-larb-port.h>
 
-    ovl_2l0: ovl@14009000 {
-        compatible = "mediatek,mt8183-disp-ovl-2l";
-        reg = <0 0x14009000 0 0x1000>;
-        interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
-        clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
-        iommus = <&iommu M4U_PORT_DISP_2L_OVL0_LARB0>;
-        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ovl_2l0: ovl@14009000 {
+            compatible = "mediatek,mt8183-disp-ovl-2l";
+            reg = <0 0x14009000 0 0x1000>;
+            interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+            clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
+            iommus = <&iommu M4U_PORT_DISP_2L_OVL0_LARB0>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index fc691d00c60e..f77094e61443 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -81,13 +81,23 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
+    #include <dt-bindings/memory/mt8173-larb-port.h>
 
-    ovl0: ovl@1400c000 {
-        compatible = "mediatek,mt8173-disp-ovl";
-        reg = <0 0x1400c000 0 0x1000>;
-        interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-        clocks = <&mmsys CLK_MM_DISP_OVL0>;
-        iommus = <&iommu M4U_PORT_DISP_OVL0>;
-        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ovl0: ovl@1400c000 {
+            compatible = "mediatek,mt8173-disp-ovl";
+            reg = <0 0x1400c000 0 0x1000>;
+            interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_DISP_OVL0>;
+            iommus = <&iommu M4U_PORT_DISP_OVL0>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
index 6ac1da2e8871..2d769422e29f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
@@ -58,12 +58,21 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8192-clk.h>
+    #include <dt-bindings/power/mt8192-power.h>
+    #include <dt-bindings/gce/mt8192-gce.h>
 
-    postmask0: postmask@1400d000 {
-        compatible = "mediatek,mt8192-disp-postmask";
-        reg = <0 0x1400d000 0 0x1000>;
-        interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH 0>;
-        power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
-        clocks = <&mmsys CLK_MM_DISP_POSTMASK0>;
-        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        postmask0: postmask@1400d000 {
+            compatible = "mediatek,mt8192-disp-postmask";
+            reg = <0 0x1400d000 0 0x1000>;
+            interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH 0>;
+            power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+            clocks = <&mmsys CLK_MM_DISP_POSTMASK0>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index b56e22fbcd52..e8c72afa0630 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -94,14 +94,24 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
+    #include <dt-bindings/memory/mt8173-larb-port.h>
 
-    rdma0: rdma@1400e000 {
-        compatible = "mediatek,mt8173-disp-rdma";
-        reg = <0 0x1400e000 0 0x1000>;
-        interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-        clocks = <&mmsys CLK_MM_DISP_RDMA0>;
-        iommus = <&iommu M4U_PORT_DISP_RDMA0>;
-        mediatek,rdma-fifosize = <8192>;
-        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        rdma0: rdma@1400e000 {
+            compatible = "mediatek,mt8173-disp-rdma";
+            reg = <0 0x1400e000 0 0x1000>;
+            interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_DISP_RDMA0>;
+            iommus = <&iommu M4U_PORT_DISP_RDMA0>;
+            mediatek,rdma-fifo-size = <8192>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
index 4f08e89c1067..35ace1f322e8 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
@@ -49,10 +49,17 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
-    split0: split@14018000 {
-        compatible = "mediatek,mt8173-disp-split";
-        reg = <0 0x14018000 0 0x1000>;
-        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
-        clocks = <&mmsys CLK_MM_DISP_SPLIT0>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        split0: split@14018000 {
+            compatible = "mediatek,mt8173-disp-split";
+            reg = <0 0x14018000 0 0x1000>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_DISP_SPLIT0>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
index 6e8748529e73..b8bb135fe96b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
@@ -51,11 +51,18 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
 
-    ufoe@1401a000 {
-        compatible = "mediatek,mt8173-disp-ufoe";
-        reg = <0 0x1401a000 0 0x1000>;
-        interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-        clocks = <&mmsys CLK_MM_DISP_UFOE>;
+        ufoe@1401a000 {
+            compatible = "mediatek,mt8173-disp-ufoe";
+            reg = <0 0x1401a000 0 0x1000>;
+            interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_DISP_UFOE>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
index f9f00a518edf..7d7cc1ab526b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -64,13 +64,23 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
+    #include <dt-bindings/memory/mt8173-larb-port.h>
 
-    wdma0: wdma@14011000 {
-        compatible = "mediatek,mt8173-disp-wdma";
-        reg = <0 0x14011000 0 0x1000>;
-        interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-        clocks = <&mmsys CLK_MM_DISP_WDMA0>;
-        iommus = <&iommu M4U_PORT_DISP_WDMA0>;
-        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        wdma0: wdma@14011000 {
+            compatible = "mediatek,mt8173-disp-wdma";
+            reg = <0 0x14011000 0 0x1000>;
+            interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_DISP_WDMA0>;
+            iommus = <&iommu M4U_PORT_DISP_WDMA0>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
+        };
     };
-- 
2.18.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
