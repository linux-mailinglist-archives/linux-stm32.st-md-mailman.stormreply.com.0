Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D09A349C430
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jan 2022 08:19:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F574C60468;
	Wed, 26 Jan 2022 07:19:49 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 034ADC60464
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jan 2022 07:19:47 +0000 (UTC)
X-UUID: 2ef845d61cbf4284ae2b9fdfe74fe7c1-20220126
X-UUID: 2ef845d61cbf4284ae2b9fdfe74fe7c1-20220126
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 116876558; Wed, 26 Jan 2022 15:19:42 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 26 Jan 2022 15:19:41 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 Jan 2022 15:19:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 15:19:34 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Wed, 26 Jan 2022 15:19:26 +0800
Message-ID: <20220126071932.32615-7-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
References: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, Jitao shi <jitao.shi@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, Fabien Parent <fparent@baylibre.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 linux-kernel@vger.kernel.org, CK
 Hu <ck.hu@mediatek.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 nancy.lin@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v15 06/12] dt-bindings: display: mediatek: add
	mt8195 SoC binding for vdosys0
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

Add mt8195 SoC binding to AAL, CCORR, COLOR, DITHER, GAMMA, MERGE,
MUTEX, OVL and RDMA yaml schema for vdosys0.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,aal.yaml   | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 5 +++++
 .../devicetree/bindings/display/mediatek/mediatek,color.yaml | 1 +
 .../bindings/display/mediatek/mediatek,dither.yaml           | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,merge.yaml | 2 ++
 .../devicetree/bindings/display/mediatek/mediatek,mutex.yaml | 5 +++--
 .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml   | 5 +++++
 .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml  | 2 ++
 9 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 044331f5aacb..225f9dd726d2 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -28,6 +28,7 @@ properties:
               - mediatek,mt2712-disp-aal
               - mediatek,mt8183-disp-aal
               - mediatek,mt8192-disp-aal
+              - mediatek,mt8195-disp-aal
           - enum:
               - mediatek,mt8173-disp-aal
 
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index ea45b40edee7..6894b6999412 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -25,6 +25,11 @@ properties:
           - const: mediatek,mt8183-disp-ccorr
       - items:
           - const: mediatek,mt8192-disp-ccorr
+      - items:
+          - enum:
+              - mediatek,mt8195-disp-ccorr
+          - enum:
+              - mediatek,mt8192-disp-ccorr
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index 13628f346718..bc83155b3b4c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -38,6 +38,7 @@ properties:
           - enum:
               - mediatek,mt8183-disp-color
               - mediatek,mt8192-disp-color
+              - mediatek,mt8195-disp-color
           - enum:
               - mediatek,mt8173-disp-color
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 2c05e3019c75..9d89297f5f1d 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8192-disp-dither
+              - mediatek,mt8195-disp-dither
           - enum:
               - mediatek,mt8183-disp-dither
 
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index 89ccb8dbadd7..247baad147b3 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -28,6 +28,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8192-disp-gamma
+              - mediatek,mt8195-disp-gamma
           - enum:
               - mediatek,mt8183-disp-gamma
 
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
index fae106cf1753..60b21ef5549b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
@@ -23,6 +23,8 @@ properties:
     oneOf:
       - items:
           - const: mediatek,mt8173-disp-merge
+      - items:
+          - const: mediatek,mt8195-disp-merge
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
index 90f11e12a55e..6eca525eced0 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/display/mediatek/mediatek,mutex.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek display mutex
+title: Mediatek mutex
 
 maintainers:
   - Chun-Kuang Hu <chunkuang.hu@kernel.org>
@@ -36,7 +36,8 @@ properties:
           - const: mediatek,mt8183-disp-mutex
       - items:
           - const: mediatek,mt8192-disp-mutex
-
+      - items:
+          - const: mediatek,mt8195-disp-mutex
   reg:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 8e4a62cb9c81..e71f79bc2dee 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -35,6 +35,11 @@ properties:
               - mediatek,mt2712-disp-ovl
           - enum:
               - mediatek,mt2701-disp-ovl
+      - items:
+          - enum:
+              - mediatek,mt8195-disp-ovl
+          - enum:
+              - mediatek,mt8183-disp-ovl
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index a3c5f4c9fbcd..8ef821641672 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -29,6 +29,8 @@ properties:
           - const: mediatek,mt8173-disp-rdma
       - items:
           - const: mediatek,mt8183-disp-rdma
+      - items:
+          - const: mediatek,mt8195-disp-rdma
       - items:
           - enum:
               - mediatek,mt7623-disp-rdma
-- 
2.18.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
