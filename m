Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 176236CAB34
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Mar 2023 19:01:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCF10C6A5F2;
	Mon, 27 Mar 2023 17:01:25 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F510C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 17:01:24 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-17aaa51a911so9955755fac.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 10:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679936483;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OiTyBpredZ9G3c2Qr8ZySRrki6vsviNzT8Ei0s2GCWs=;
 b=uluKECn+M7CP3T/E4RNy/hjYcsrmkpzs5x90NCMnlvncQ7agqVsShqhPqP0QKQMxTU
 SuRihWEJ7qvhr3rckjFL+eeJeNRkv4S1K6FKwU+yypIhid3xt05haN4XfJq/I6j/uyDp
 xdywSmyZYPrw50Aebn0JWvIIrFkwUmTImP2iFGsEN0RiWHNagonVGqJ43K1iEcfbAv5g
 4vZdezxEBrSnZ7DcQpt9jPNmMwMTjV1aCYvEBcCxsEiNp+LI7zsHEO+zQNVA49b3yZwE
 je6M9eCAG+evmEXeKXQ8MSuHACzLJbGkvle/czuQ59w8CEiDmU+H1WU5A4xpeTEz8Ei7
 BN2w==
X-Gm-Message-State: AO0yUKVaov3JvYWyjJuQFpOOz3a1Mqx6QU7e2lLwoMksI0w6E2R4bee0
 qrzZG7Mb2dx+8IygXdO6NA==
X-Google-Smtp-Source: AKy350apFLu0p89aoZfe3hbeUVq/LGMiZBqIYewYKZlim7HEkNZnKA09d3D1uR6qEYhHiwbYrEbXIQ==
X-Received: by 2002:a05:6870:c5a5:b0:17a:d08c:c8a8 with SMTP id
 ba37-20020a056870c5a500b0017ad08cc8a8mr7880979oab.44.1679936482131; 
 Mon, 27 Mar 2023 10:01:22 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b1-20020a4a98c1000000b00524f47b4682sm11527277ooj.10.2023.03.27.10.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 10:01:21 -0700 (PDT)
Received: (nullmailer pid 4103173 invoked by uid 1000);
 Mon, 27 Mar 2023 17:01:20 -0000
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 27 Mar 2023 12:01:13 -0500
Message-Id: <20230327170114.4102315-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: remoteproc: Drop unneeded quotes
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

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../remoteproc/amlogic,meson-mx-ao-arc.yaml        |  4 ++--
 .../bindings/remoteproc/fsl,imx-rproc.yaml         |  4 ++--
 .../bindings/remoteproc/ingenic,vpu.yaml           |  4 ++--
 .../bindings/remoteproc/qcom,glink-edge.yaml       |  2 +-
 .../bindings/remoteproc/qcom,smd-edge.yaml         |  2 +-
 .../bindings/remoteproc/renesas,rcar-rproc.yaml    |  4 ++--
 .../bindings/remoteproc/st,stm32-rproc.yaml        | 14 +++++++-------
 7 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
index 11cb42a3fdd1..3100cb870170 100644
--- a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/remoteproc/amlogic,meson-mx-ao-arc.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/remoteproc/amlogic,meson-mx-ao-arc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Amlogic Meson AO ARC Remote Processor
 
diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index ae2eab4452dd..0c3910f152d1 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/remoteproc/fsl,imx-rproc.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/remoteproc/fsl,imx-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: NXP i.MX Co-Processor
 
diff --git a/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml b/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
index 85b1e43cab08..8b55dbd909b0 100644
--- a/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/remoteproc/ingenic,vpu.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/remoteproc/ingenic,vpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Ingenic Video Processing Unit
 
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
index 15e6851e1ff8..7b43ad3daa56 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
@@ -15,7 +15,7 @@ description:
 
 properties:
   $nodename:
-    const: "glink-edge"
+    const: glink-edge
 
   apr:
     $ref: /schemas/soc/qcom/qcom,apr.yaml#
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,smd-edge.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,smd-edge.yaml
index 7ec8a6b6682c..02c85b420c1a 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,smd-edge.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,smd-edge.yaml
@@ -21,7 +21,7 @@ description:
 
 properties:
   $nodename:
-    const: "smd-edge"
+    const: smd-edge
 
   apr:
     $ref: /schemas/soc/qcom/qcom,apr.yaml#
diff --git a/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
index 7e0275d31a3c..4bea679a0f61 100644
--- a/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/remoteproc/renesas,rcar-rproc.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/remoteproc/renesas,rcar-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Renesas R-Car remote processor controller
 
diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
index 66b1e3efdaa3..37c0d7b4ceef 100644
--- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/remoteproc/st,stm32-rproc.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/remoteproc/st,stm32-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: STMicroelectronics STM32 remote processor controller
 
@@ -29,7 +29,7 @@ properties:
 
   st,syscfg-holdboot:
     description: remote processor reset hold boot
-    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
       - items:
           - description: Phandle of syscon block
@@ -39,7 +39,7 @@ properties:
   st,syscfg-tz:
     description:
       Reference to the system configuration which holds the RCC trust zone mode
-    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
       - items:
           - description: Phandle of syscon block
@@ -95,7 +95,7 @@ properties:
       (see ../reserved-memory/reserved-memory.txt)
 
   st,syscfg-pdds:
-    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    $ref: /schemas/types.yaml#/definitions/phandle-array
     description: |
       Reference to the system configuration which holds the remote
     items:
@@ -105,7 +105,7 @@ properties:
           - description: The field mask of the PDDS selection
 
   st,syscfg-m4-state:
-    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    $ref: /schemas/types.yaml#/definitions/phandle-array
     description: |
       Reference to the tamp register which exposes the Cortex-M4 state.
     items:
@@ -115,7 +115,7 @@ properties:
           - description: The field mask of the Cortex-M4 state
 
   st,syscfg-rsc-tbl:
-    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    $ref: /schemas/types.yaml#/definitions/phandle-array
     description: |
       Reference to the tamp register which references the Cortex-M4
       resource table address.
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
