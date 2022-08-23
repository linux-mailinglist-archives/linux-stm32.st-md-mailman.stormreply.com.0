Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9021B59E56E
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Aug 2022 16:57:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F733C64101;
	Tue, 23 Aug 2022 14:57:29 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24D0EC640F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Aug 2022 14:57:28 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id a133so8511726oif.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Aug 2022 07:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=OzBwVNVcuw97NSLMRu+l5m89xmv/7oQltEZIuBb21aY=;
 b=BXMC4gSTkQ2hUcjrVSYFUR7cs9oEaSxcFkgX1+KrI+uR/R44BcfLysMhynmyDZpXsl
 WwWNA9i8pb+0eKMeJzEqKP6kH2RL8lzLRU14CcgP/ayunWkG2iroBIu7CxgTId3TJQwL
 RSyU4yhyr1XhM/0UTLDDc/GuENr+N2f1GUJCLnta6lkfyt6NinQ91uceMqqD4JVOUB7z
 oIChAL33TAgkETMUHhrQEa6ChICcqkkarhamNRWhCqXsTCjLevsgHZtseHjcODRma4ik
 hXzYYbEcmkv07z8plJRP5o5exGADubkRI6CXMku/bYlQxpNGfFwiImL9TBQsWC9nErh6
 WVLQ==
X-Gm-Message-State: ACgBeo0iNEcaNf5gSovJo+DEVkjPbpPCpeL50j+CiKlnknBIcPrHp6JZ
 PzUf/8JaG8THe582IqyA/Q==
X-Google-Smtp-Source: AA6agR7y3yTCXHdaSUcb4hAB7EPibQs1k+VOqbuaUbMd2rNy9+oj283SKmIrjZMP47Ak7vTsrWijeA==
X-Received: by 2002:a05:6808:1a06:b0:343:290e:813e with SMTP id
 bk6-20020a0568081a0600b00343290e813emr1457530oib.256.1661266646958; 
 Tue, 23 Aug 2022 07:57:26 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020a056870600100b0011c65559b04sm3840637oaa.34.2022.08.23.07.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 07:57:26 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rohit kumar <rohitkr@codeaurora.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Shane Chien <shane.chien@mediatek.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jonathan Bakker <xc-racer2@live.ca>
Date: Tue, 23 Aug 2022 09:56:39 -0500
Message-Id: <20220823145649.3118479-8-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ASoC: dt-bindings: Add missing
	(unevaluated|additional)Properties on child nodes
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

In order to ensure only documented properties are present, node schemas
must have unevaluatedProperties or additionalProperties set to false
(typically).

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/amlogic,gx-sound-card.yaml      |  2 ++
 .../bindings/sound/audio-graph-port.yaml           |  2 ++
 .../bindings/sound/google,sc7180-trogdor.yaml      |  4 ++++
 .../devicetree/bindings/sound/imx-audio-card.yaml  |  2 ++
 .../sound/mt8192-mt6359-rt1015-rt5682.yaml         |  4 ++++
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  6 ++++++
 .../devicetree/bindings/sound/renesas,rsnd.yaml    | 14 ++++++++++++--
 .../bindings/sound/samsung,aries-wm8994.yaml       |  2 ++
 .../bindings/sound/samsung,midas-audio.yaml        |  2 ++
 .../devicetree/bindings/sound/samsung,snow.yaml    |  2 ++
 .../devicetree/bindings/sound/st,stm32-sai.yaml    |  1 +
 11 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
index b4b35edcb493..5b8d59245f82 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -40,6 +40,7 @@ properties:
 patternProperties:
   "^dai-link-[0-9]+$":
     type: object
+    additionalProperties: false
     description: |-
       dai-link child nodes:
         Container for dai-link level properties and the CODEC sub-nodes.
@@ -63,6 +64,7 @@ patternProperties:
     patternProperties:
       "^codec-[0-9]+$":
         type: object
+        additionalProperties: false
         description: |-
           Codecs:
           dai-link representing backend links should have at least one subnode.
diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 5c368674d11a..c54ca5eb0baa 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -27,6 +27,8 @@ properties:
 patternProperties:
   "^endpoint(@[0-9a-f]+)?":
     $ref: /schemas/graph.yaml#/$defs/endpoint-base
+    unevaluatedProperties: false
+
     properties:
       mclk-fs:
         description: |
diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
index 233caa0ade87..67ccddd44489 100644
--- a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
+++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
@@ -61,6 +61,8 @@ patternProperties:
       cpu:
         description: Holds subnode which indicates cpu dai.
         type: object
+        additionalProperties: false
+
         properties:
           sound-dai:
             maxItems: 1
@@ -68,6 +70,8 @@ patternProperties:
       codec:
         description: Holds subnode which indicates codec dai.
         type: object
+        additionalProperties: false
+
         properties:
           sound-dai:
             maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index bb3a435722c7..b6f5d486600e 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -58,6 +58,7 @@ patternProperties:
       cpu:
         description: Holds subnode which indicates cpu dai.
         type: object
+        additionalProperties: false
         properties:
           sound-dai:
             maxItems: 1
@@ -65,6 +66,7 @@ patternProperties:
       codec:
         description: Holds subnode which indicates codec dai.
         type: object
+        additionalProperties: false
         properties:
           sound-dai:
             minItems: 1
diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
index 4fa179909c62..478be7e3fa29 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
@@ -30,6 +30,8 @@ properties:
 
   headset-codec:
     type: object
+    additionalProperties: false
+
     properties:
       sound-dai:
         $ref: /schemas/types.yaml#/definitions/phandle
@@ -38,6 +40,8 @@ properties:
 
   speaker-codecs:
     type: object
+    additionalProperties: false
+
     properties:
       sound-dai:
         minItems: 1
diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index e6e27d09783e..a3a4289f713e 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -71,6 +71,8 @@ patternProperties:
       cpu:
         description: Holds subnode which indicates cpu dai.
         type: object
+        additionalProperties: false
+
         properties:
           sound-dai:
             maxItems: 1
@@ -78,6 +80,8 @@ patternProperties:
       platform:
         description: Holds subnode which indicates platform dai.
         type: object
+        additionalProperties: false
+
         properties:
           sound-dai:
             maxItems: 1
@@ -85,6 +89,8 @@ patternProperties:
       codec:
         description: Holds subnode which indicates codec dai.
         type: object
+        additionalProperties: false
+
         properties:
           sound-dai:
             minItems: 1
diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index e17c0245f77a..268895c90bd5 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -129,6 +129,8 @@ properties:
     patternProperties:
       "^dvc-[0-1]$":
         type: object
+        additionalProperties: false
+
         properties:
           dmas:
             maxItems: 1
@@ -145,7 +147,7 @@ properties:
     patternProperties:
       "^mix-[0-1]$":
         type: object
-        # no properties
+        additionalProperties: false
     additionalProperties: false
 
   rcar_sound,ctu:
@@ -154,7 +156,7 @@ properties:
     patternProperties:
       "^ctu-[0-7]$":
         type: object
-        # no properties
+        additionalProperties: false
     additionalProperties: false
 
   rcar_sound,src:
@@ -163,6 +165,8 @@ properties:
     patternProperties:
       "^src-[0-9]$":
         type: object
+        additionalProperties: false
+
         properties:
           interrupts:
             maxItems: 1
@@ -186,6 +190,8 @@ properties:
     patternProperties:
       "^ssiu-[0-9]+$":
         type: object
+        additionalProperties: false
+
         properties:
           dmas:
             maxItems: 2
@@ -206,6 +212,8 @@ properties:
     patternProperties:
       "^ssi-[0-9]$":
         type: object
+        additionalProperties: false
+
         properties:
           interrupts:
             maxItems: 1
@@ -243,6 +251,8 @@ properties:
     patternProperties:
       "^dai([0-9]+)?$":
         type: object
+        additionalProperties: false
+
         properties:
           playback:
             $ref: /schemas/types.yaml#/definitions/phandle-array
diff --git a/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml b/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
index a01c4ad929b8..447e013f6e17 100644
--- a/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
@@ -23,6 +23,7 @@ properties:
 
   cpu:
     type: object
+    additionalProperties: false
     properties:
       sound-dai:
         minItems: 2
@@ -34,6 +35,7 @@ properties:
       - sound-dai
 
   codec:
+    additionalProperties: false
     type: object
     properties:
       sound-dai:
diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
index ec50bcb4af5f..31095913e330 100644
--- a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
@@ -19,6 +19,7 @@ properties:
 
   cpu:
     type: object
+    additionalProperties: false
     properties:
       sound-dai:
         maxItems: 1
@@ -28,6 +29,7 @@ properties:
 
   codec:
     type: object
+    additionalProperties: false
     properties:
       sound-dai:
         maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/samsung,snow.yaml b/Documentation/devicetree/bindings/sound/samsung,snow.yaml
index 51a83d3c7274..3d49aa4c9be2 100644
--- a/Documentation/devicetree/bindings/sound/samsung,snow.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,snow.yaml
@@ -19,6 +19,7 @@ properties:
 
   codec:
     type: object
+    additionalProperties: false
     properties:
       sound-dai:
         description: List of phandles to the CODEC and HDMI IP nodes.
@@ -30,6 +31,7 @@ properties:
 
   cpu:
     type: object
+    additionalProperties: false
     properties:
       sound-dai:
         description: Phandle to the Samsung I2S controller.
diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
index fe2e15504ebc..1a3abc949505 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
@@ -60,6 +60,7 @@ required:
 patternProperties:
   "^audio-controller@[0-9a-f]+$":
     type: object
+    additionalProperties: false
     description:
       Two subnodes corresponding to SAI sub-block instances A et B
       can be defined. Subnode can be omitted for unsused sub-block.
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
