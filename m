Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 628324CF037
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Mar 2022 04:30:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16DABC6049E;
	Mon,  7 Mar 2022 03:30:07 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3648DC5F1ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Mar 2022 03:30:03 +0000 (UTC)
X-UUID: 7d17bff4378f4c8f9bcc23d2b0859b4c-20220307
X-UUID: 7d17bff4378f4c8f9bcc23d2b0859b4c-20220307
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 714354515; Mon, 07 Mar 2022 11:29:56 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 7 Mar 2022 11:29:56 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 7 Mar 2022 11:29:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Mar 2022 11:29:55 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Mon, 7 Mar 2022 11:28:52 +0800
Message-ID: <20220307032859.3275-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220307032859.3275-1-jason-jh.lin@mediatek.com>
References: <20220307032859.3275-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, "jason-jh
 . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 jason-jh lin <jason-jh.lin@mediatek.corp-partner.google.com>,
 Fabien Parent <fparent@baylibre.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, CK
 Hu <ck.hu@mediatek.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 nancy.lin@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v16 1/8] dt-bindings: soc: mediatek: move out
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

From: jason-jh lin <jason-jh.lin@mediatek.corp-partner.google.com>

AAL, COLOR, CCORR, MUTEX, WDMA could be used by other modules,
such as MDP, so move their binding document into the common folder.

Signed-off-by: jason-jh lin <jason-jh.lin@mediatek.corp-partner.google.com>
---
 .../{display => soc}/mediatek/mediatek,aal.yaml     | 13 ++++---------
 .../{display => soc}/mediatek/mediatek,ccorr.yaml   | 13 ++++---------
 .../{display => soc}/mediatek/mediatek,color.yaml   | 13 ++++---------
 .../{display => soc}/mediatek/mediatek,mutex.yaml   | 12 +++---------
 .../{display => soc}/mediatek/mediatek,wdma.yaml    |  9 ++-------
 5 files changed, 17 insertions(+), 43 deletions(-)
 rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,aal.yaml (81%)
 rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,ccorr.yaml (80%)
 rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,color.yaml (83%)
 rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,mutex.yaml (82%)
 rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,wdma.yaml (85%)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,aal.yaml
similarity index 81%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
rename to Documentation/devicetree/bindings/soc/mediatek/mediatek,aal.yaml
index 4fdc9b3283b0..08934b10b54e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,aal.yaml
@@ -1,22 +1,17 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,aal.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek display adaptive ambient light processor
+title: Mediatek adaptive ambient light processor
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
-  Mediatek display adaptive ambient light processor, namely AAL,
+  Mediatek adaptive ambient light processor, namely AAL,
   is responsible for backlight power saving and sunlight visibility improving.
-  AAL device node must be siblings to the central MMSYS_CONFIG node.
-  For a description of the MMSYS_CONFIG binding, see
-  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
-  for details.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
similarity index 80%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
rename to Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
index 0ed53b6238f0..bf52b7b53475 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
@@ -1,22 +1,17 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,ccorr.yaml#
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,ccorr.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek display color correction
+title: Mediatek color correction
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
-  Mediatek display color correction, namely CCORR, reproduces correct color
+  Mediatek color correction, namely CCORR, reproduces correct color
   on panels with different color gamut.
-  CCORR device node must be siblings to the central MMSYS_CONFIG node.
-  For a description of the MMSYS_CONFIG binding, see
-  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
-  for details.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,color.yaml
similarity index 83%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
rename to Documentation/devicetree/bindings/soc/mediatek/mediatek,color.yaml
index 3ad842eb5668..91ff2adcf390 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,color.yaml
@@ -1,23 +1,18 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,color.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek display color processor
+title: Mediatek color processor
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
-  Mediatek display color processor, namely COLOR, provides hue, luma and
+  Mediatek color processor, namely COLOR, provides hue, luma and
   saturation adjustments to get better picture quality and to have one panel
   resemble the other in their output characteristics.
-  COLOR device node must be siblings to the central MMSYS_CONFIG node.
-  For a description of the MMSYS_CONFIG binding, see
-  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
-  for details.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
similarity index 82%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
rename to Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
index 00e6a1041a9b..d334050105db 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
@@ -1,25 +1,19 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,mutex.yaml#
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Mediatek mutex
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
   Mediatek mutex, namely MUTEX, is used to send the triggers signals called
-  Start Of Frame (SOF) / End Of Frame (EOF) to each sub-modules on the display
-  data path or MDP data path.
+  Start Of Frame(SOF) / End Of Frame(EOF) to each sub-modules on the data path.
   In some SoC, such as mt2701, MUTEX could be a hardware mutex which protects
   the shadow register.
-  MUTEX device node must be siblings to the central MMSYS_CONFIG node.
-  For a description of the MMSYS_CONFIG binding, see
-  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
-  for details.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
similarity index 85%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
rename to Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
index 7d7cc1ab526b..a6f9e1b3268d 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
@@ -1,22 +1,17 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,wdma.yaml#
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,wdma.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Mediatek Write Direct Memory Access
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
   Mediatek Write Direct Memory Access(WDMA) component used to write
   the data into DMA.
-  WDMA device node must be siblings to the central MMSYS_CONFIG node.
-  For a description of the MMSYS_CONFIG binding, see
-  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
-  for details.
 
 properties:
   compatible:
-- 
2.18.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
