Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB23413694
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Sep 2021 17:52:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00740C5AB65;
	Tue, 21 Sep 2021 15:52:45 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37096C5A4F8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Sep 2021 15:52:36 +0000 (UTC)
X-UUID: b46e6b44f26d46bf9d462acbb39fa236-20210921
X-UUID: b46e6b44f26d46bf9d462acbb39fa236-20210921
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 459640252; Tue, 21 Sep 2021 23:52:30 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Sep 2021 23:52:29 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 21 Sep 2021 23:52:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 21 Sep 2021 23:52:28 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>
Date: Tue, 21 Sep 2021 23:52:09 +0800
Message-ID: <20210921155218.10387-8-jason-jh.lin@mediatek.com>
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
Subject: [Linux-stm32] [PATCH v11 07/16] dt-bindings: arm: mediatek: move
	common module from display folder
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

AAL, COLOR, CCORR, MUTEX, WDMA could be used by other modules,
such as MDP, so move their binding document into the common folder.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 .../{display => arm}/mediatek/mediatek,aal.yaml      |  9 ++++-----
 .../{display => arm}/mediatek/mediatek,ccorr.yaml    |  9 ++++-----
 .../{display => arm}/mediatek/mediatek,color.yaml    | 11 +++++------
 .../{display => arm}/mediatek/mediatek,mutex.yaml    | 12 +++++-------
 .../{display => arm}/mediatek/mediatek,wdma.yaml     |  9 ++++-----
 5 files changed, 22 insertions(+), 28 deletions(-)
 rename Documentation/devicetree/bindings/{display => arm}/mediatek/mediatek,aal.yaml (88%)
 rename Documentation/devicetree/bindings/{display => arm}/mediatek/mediatek,ccorr.yaml (87%)
 rename Documentation/devicetree/bindings/{display => arm}/mediatek/mediatek,color.yaml (86%)
 rename Documentation/devicetree/bindings/{display => arm}/mediatek/mediatek,mutex.yaml (85%)
 rename Documentation/devicetree/bindings/{display => arm}/mediatek/mediatek,wdma.yaml (90%)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,aal.yaml
similarity index 88%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
rename to Documentation/devicetree/bindings/arm/mediatek/mediatek,aal.yaml
index 311bbf05a967..ab6eb9b550a4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,aal.yaml
@@ -1,17 +1,16 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,aal.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek display adaptive ambient light processor
+title: MediaTek adaptive ambient light processor
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
-  Mediatek display adaptive ambient light processor, namely AAL,
+  MediaTek adaptive ambient light processor, namely AAL,
   is responsible for backlight power saving and sunlight visibility improving.
   AAL device node must be siblings to the central MMSYS_CONFIG node.
   For a description of the MMSYS_CONFIG binding, see
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ccorr.yaml
similarity index 87%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
rename to Documentation/devicetree/bindings/arm/mediatek/mediatek,ccorr.yaml
index 60752ce45d49..de86e9ae35f3 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ccorr.yaml
@@ -1,17 +1,16 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,ccorr.yaml#
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,ccorr.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek display color correction
+title: MediaTek color correction
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
-  Mediatek display color correction, namely CCORR, reproduces correct color
+  MediaTek color correction, namely CCORR, reproduces correct color
   on panels with different color gamut.
   CCORR device node must be siblings to the central MMSYS_CONFIG node.
   For a description of the MMSYS_CONFIG binding, see
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,color.yaml
similarity index 86%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
rename to Documentation/devicetree/bindings/arm/mediatek/mediatek,color.yaml
index f6636869909c..73be301b50d2 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,color.yaml
@@ -1,18 +1,17 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,color.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek display color processor
+title: MediaTek color processor
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
-  Mediatek display color processor, namely COLOR, provides hue, luma and
-  saturation adjustments to get better picture quality and to have one panel
+  MediaTek color processor, namely COLOR, provides hue, luma and saturation
+  adjustments to get better picture quality and to have one panel
   resemble the other in their output characteristics.
   COLOR device node must be siblings to the central MMSYS_CONFIG node.
   For a description of the MMSYS_CONFIG binding, see
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mutex.yaml
similarity index 85%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
rename to Documentation/devicetree/bindings/arm/mediatek/mediatek,mutex.yaml
index 6eca525eced0..713c7485e11a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mutex.yaml
@@ -1,19 +1,17 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,mutex.yaml#
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mutex.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek mutex
+title: MediaTek mutex
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
-  Mediatek mutex, namely MUTEX, is used to send the triggers signals called
-  Start Of Frame (SOF) / End Of Frame (EOF) to each sub-modules on the display
-  data path or MDP data path.
+  MediaTek mutex, namely MUTEX, is used to send the triggers signals called
+  Start Of Frame(SOF) / End Of Frame(EOF) to each sub-modules on the data path.
   In some SoC, such as mt2701, MUTEX could be a hardware mutex which protects
   the shadow register.
   MUTEX device node must be siblings to the central MMSYS_CONFIG node.
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,wdma.yaml
similarity index 90%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
rename to Documentation/devicetree/bindings/arm/mediatek/mediatek,wdma.yaml
index 25f9a63fe7af..5222535d98c6 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,wdma.yaml
@@ -1,17 +1,16 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,wdma.yaml#
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,wdma.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek display WDMA
+title: MediaTek WDMA
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
-  Mediatek display WDMA stands for Write Direct Memory Access.
+  MediaTek WDMA stands for Write Direct Memory Access.
   It can write the data in display pipeline into DRAM.
   WDMA device node must be siblings to the central MMSYS_CONFIG node.
   For a description of the MMSYS_CONFIG binding, see
-- 
2.18.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
