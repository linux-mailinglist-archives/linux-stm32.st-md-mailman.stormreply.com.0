Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 175C6413690
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Sep 2021 17:52:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C631DC5AB69;
	Tue, 21 Sep 2021 15:52:38 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 759E7C5A4D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Sep 2021 15:52:36 +0000 (UTC)
X-UUID: 9b1cd131b18048cd9ea7959b5c7ef509-20210921
X-UUID: 9b1cd131b18048cd9ea7959b5c7ef509-20210921
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2057887529; Tue, 21 Sep 2021 23:52:30 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Sep 2021 23:52:28 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 21 Sep 2021 23:52:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 21 Sep 2021 23:52:28 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>
Date: Tue, 21 Sep 2021 23:52:08 +0800
Message-ID: <20210921155218.10387-7-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
References: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, jason-jh.lin@mediatek.com,
 singo.chang@mediatek.com, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, roy-cw.yeh@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 nancy.lin@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v11 06/16] dt-bindings: display: mediatek: add
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
index 92a350ab9722..311bbf05a967 100644
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
index 7840e12d4caf..60752ce45d49 100644
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
index 7a249ba8584c..f6636869909c 100644
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
index 316374315962..d4fa75bb19a3 100644
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
index 1c53ce20a71e..8ce612b016ab 100644
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
index 542dd7137d3b..6007e00679a8 100644
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
index 50552428150f..a6dbbd65166e 100644
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
index 8393a25a3781..0dcde0749078 100644
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
