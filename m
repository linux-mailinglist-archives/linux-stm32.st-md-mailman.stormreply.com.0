Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CEF7611A3
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jul 2023 12:54:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8BCFC6B459;
	Tue, 25 Jul 2023 10:54:29 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C5D8C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 10:54:28 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-52229f084beso3530717a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 03:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690282467; x=1690887267;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9XvBEhiljLAJfGUeTgW+OPWzjRV1YWWycztsm2LeLB0=;
 b=b9hrnVX60q2msck+zlotnWfv+WZ6UUe6Uz7mE/Vb/cIRkkFqtz4GMg/RjfBwHccixd
 sP8lVu84VCqhiPUkkcxkpghJLxFYLbXTzdascqZgmbjJoIlkKUGWrBXZuqRT5JWzOX7E
 p2GkntswKBF8g/zBsgJqoYy9UD4YgCkzzrQQ+BVwYQSlSI4chmPWv0DK1qNjQF7/NoFG
 fO7OidQS8XYJ52/iGzLEb2/5/Wx0EEQb+puiE66GIAJeeVCfCia0wBOzkxZJdbi1Ei/D
 42KBWqzoxYtCvS9eKAvj8fTaCpRgx6mUvEMSHqDpg99Imf/spk68/9eAbWyNApv1r3fF
 bWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690282467; x=1690887267;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9XvBEhiljLAJfGUeTgW+OPWzjRV1YWWycztsm2LeLB0=;
 b=T0rtMEQ8redOzRFxRLVw6VRuRyc59k5TpjK3s32H4wSeTGHubHH//iaRG9bJ5BB8DZ
 +loOkyFmo9+Wwfdwj41dJKnkOuLFwR1sLfO375i0SKLLICuYihljLM5ggwyg/y3udJhC
 M1hNNmmc4nXT1INOzDtpROPET2da5IxWbrYkSlJRNVyZIZfdYFTGiR9ujIMOFOSEBvKS
 6ess0HHBTpBZJUdv3FtZhyoyuMLbaGLSy97wuq1A5TIj6BOHhrfvaBebAcfcm1hqB82i
 Yu7421G57fDQoKCNWarLHryt4Y+dZcAjltLAzH8XCE3DO2is+mCbcUuqvrzV2dYBz0xC
 VzVA==
X-Gm-Message-State: ABy/qLY52rSDIaFolirMk4BWZ5UyVSihNVqMmq7oAu0h6SBzbjpzWJk3
 gDQWqbEYs9kDVVW8fcmAutZuTg==
X-Google-Smtp-Source: APBJJlEBd79V8FzekDC8zmB2dcU2i30PcbnQL6AH3k5NC4ZMeRGeosc90mmA7pJqtzUE02K6QQ4Mpg==
X-Received: by 2002:a17:906:289:b0:99b:237e:6ee with SMTP id
 9-20020a170906028900b0099b237e06eemr12860028ejf.30.1690282467322; 
 Tue, 25 Jul 2023 03:54:27 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104]) by smtp.gmail.com with ESMTPSA id
 xo22-20020a170907bb9600b0098860721959sm7980597ejc.198.2023.07.25.03.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 03:54:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Saravanan Sekar <sravanhome@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Robin Gong <yibin.gong@nxp.com>, ChiYuan Huang <cy_huang@richtek.com>,
 Pascal Paillet <p.paillet@foss.st.com>, - <patches@opensource.cirrus.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Tue, 25 Jul 2023 12:54:20 +0200
Message-Id: <20230725105421.99160-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 1/2] regulator: dt-bindings: add missing
	unevaluatedProperties for each regulator
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

Each regulator node, which references common regulator.yaml schema,
should disallow additional or unevaluated properties.  Otherwise
mistakes in properties will go unnoticed.

Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Closes: https://git.codelinaro.org/linaro/qcomlt/kernel/-/commit/1c8aeef8a6e84520b77f0c270d99c8bf692c5933
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/regulator/mps,mp5416.yaml   | 2 ++
 Documentation/devicetree/bindings/regulator/mps,mpq7920.yaml  | 2 ++
 Documentation/devicetree/bindings/regulator/pfuze100.yaml     | 4 ++++
 .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml    | 2 ++
 .../devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml | 1 +
 .../bindings/regulator/richtek,rt4831-regulator.yaml          | 1 +
 .../bindings/regulator/richtek,rtmv20-regulator.yaml          | 1 +
 .../bindings/regulator/richtek,rtq6752-regulator.yaml         | 1 +
 .../devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml    | 2 +-
 Documentation/devicetree/bindings/regulator/ti,tps65090.yaml  | 1 +
 Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml  | 1 +
 Documentation/devicetree/bindings/regulator/wlf,arizona.yaml  | 2 ++
 12 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/mps,mp5416.yaml b/Documentation/devicetree/bindings/regulator/mps,mp5416.yaml
index 2e720d152890..0221397eb51e 100644
--- a/Documentation/devicetree/bindings/regulator/mps,mp5416.yaml
+++ b/Documentation/devicetree/bindings/regulator/mps,mp5416.yaml
@@ -29,10 +29,12 @@ properties:
     patternProperties:
       "^buck[1-4]$":
         $ref: regulator.yaml#
+        unevaluatedProperties: false
         type: object
 
       "^ldo[1-4]$":
         $ref: regulator.yaml#
+        unevaluatedProperties: false
         type: object
 
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/regulator/mps,mpq7920.yaml b/Documentation/devicetree/bindings/regulator/mps,mpq7920.yaml
index f3fcfc8be72f..38475a568451 100644
--- a/Documentation/devicetree/bindings/regulator/mps,mpq7920.yaml
+++ b/Documentation/devicetree/bindings/regulator/mps,mpq7920.yaml
@@ -39,11 +39,13 @@ properties:
       ldortc:
         type: object
         $ref: regulator.yaml#
+        unevaluatedProperties: false
 
     patternProperties:
       "^ldo[1-4]$":
         type: object
         $ref: regulator.yaml#
+        unevaluatedProperties: false
 
       "^buck[1-4]$":
         type: object
diff --git a/Documentation/devicetree/bindings/regulator/pfuze100.yaml b/Documentation/devicetree/bindings/regulator/pfuze100.yaml
index e384e4953f0a..0eda44752cdd 100644
--- a/Documentation/devicetree/bindings/regulator/pfuze100.yaml
+++ b/Documentation/devicetree/bindings/regulator/pfuze100.yaml
@@ -68,18 +68,22 @@ properties:
       "^sw([1-4]|[1-4][a-c]|[1-4][a-c][a-c])$":
         $ref: regulator.yaml#
         type: object
+        unevaluatedProperties: false
 
       "^vgen[1-6]$":
         $ref: regulator.yaml#
         type: object
+        unevaluatedProperties: false
 
       "^vldo[1-4]$":
         $ref: regulator.yaml#
         type: object
+        unevaluatedProperties: false
 
       "^(vsnvs|vref|vrefddr|swbst|coin|v33|vccsd)$":
         $ref: regulator.yaml#
         type: object
+        unevaluatedProperties: false
 
     additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index 72b533c3761a..e758093365bc 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -111,6 +111,7 @@ properties:
   bob:
     type: object
     $ref: regulator.yaml#
+    unevaluatedProperties: false
     description: BOB regulator node.
     dependencies:
       regulator-allow-set-load: [ regulator-allowed-modes ]
@@ -119,6 +120,7 @@ patternProperties:
   "^(smps|ldo|lvs|bob)[0-9]+$":
     type: object
     $ref: regulator.yaml#
+    unevaluatedProperties: false
     description: smps/ldo regulator nodes(s).
     dependencies:
       regulator-allow-set-load: [ regulator-allowed-modes ]
diff --git a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
index a8ca8e0b27f8..9ea8ac0786ac 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
@@ -110,6 +110,7 @@ patternProperties:
   "^((s|l|lvs|5vs)[0-9]*)|(boost-bypass)|(bob)$":
     description: List of regulators and its properties
     $ref: regulator.yaml#
+    unevaluatedProperties: false
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/regulator/richtek,rt4831-regulator.yaml b/Documentation/devicetree/bindings/regulator/richtek,rt4831-regulator.yaml
index d9c23333e157..cd06e957b9db 100644
--- a/Documentation/devicetree/bindings/regulator/richtek,rt4831-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/richtek,rt4831-regulator.yaml
@@ -29,6 +29,7 @@ patternProperties:
   "^DSV(LCM|P|N)$":
     type: object
     $ref: regulator.yaml#
+    unevaluatedProperties: false
     description:
       Properties for single Display Bias Voltage regulator.
 
diff --git a/Documentation/devicetree/bindings/regulator/richtek,rtmv20-regulator.yaml b/Documentation/devicetree/bindings/regulator/richtek,rtmv20-regulator.yaml
index 446ec5127d1f..fec3d396ca50 100644
--- a/Documentation/devicetree/bindings/regulator/richtek,rtmv20-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/richtek,rtmv20-regulator.yaml
@@ -121,6 +121,7 @@ properties:
     description: load switch current regulator description.
     type: object
     $ref: regulator.yaml#
+    unevaluatedProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/regulator/richtek,rtq6752-regulator.yaml b/Documentation/devicetree/bindings/regulator/richtek,rtq6752-regulator.yaml
index e6e5a9a7d940..ef62c618de67 100644
--- a/Documentation/devicetree/bindings/regulator/richtek,rtq6752-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/richtek,rtq6752-regulator.yaml
@@ -35,6 +35,7 @@ properties:
       "^(p|n)avdd$":
         type: object
         $ref: regulator.yaml#
+        unevaluatedProperties: false
         description: |
           regulator description for pavdd and navdd.
 
diff --git a/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml
index 7d53cfa2c288..c9586d277f41 100644
--- a/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml
+++ b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml
@@ -25,8 +25,8 @@ properties:
 patternProperties:
   "^(reg11|reg18|usb33)$":
     type: object
-
     $ref: regulator.yaml#
+    unevaluatedProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/regulator/ti,tps65090.yaml b/Documentation/devicetree/bindings/regulator/ti,tps65090.yaml
index 0ae95ac6de57..8ae8de7fe3de 100644
--- a/Documentation/devicetree/bindings/regulator/ti,tps65090.yaml
+++ b/Documentation/devicetree/bindings/regulator/ti,tps65090.yaml
@@ -67,6 +67,7 @@ properties:
     patternProperties:
       "^dcdc[1-3]|fet[1-7]|ldo[1-2]$":
         $ref: regulator.yaml
+        unevaluatedProperties: false
         properties:
           ti,enable-ext-control:
             $ref: /schemas/types.yaml#/definitions/flag
diff --git a/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml b/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml
index c5ea7012c653..ef093344c7bc 100644
--- a/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml
+++ b/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml
@@ -64,6 +64,7 @@ properties:
     patternProperties:
       "^sys|sm[0-2]|ldo[0-9]|ldo_rtc$":
         $ref: regulator.yaml
+        unevaluatedProperties: false
 
 allOf:
   - $ref: /schemas/gpio/gpio.yaml
diff --git a/Documentation/devicetree/bindings/regulator/wlf,arizona.yaml b/Documentation/devicetree/bindings/regulator/wlf,arizona.yaml
index 011819c10988..11e378648b3f 100644
--- a/Documentation/devicetree/bindings/regulator/wlf,arizona.yaml
+++ b/Documentation/devicetree/bindings/regulator/wlf,arizona.yaml
@@ -29,11 +29,13 @@ properties:
       Initial data for the LDO1 regulator.
     $ref: regulator.yaml#
     type: object
+    unevaluatedProperties: false
 
   micvdd:
     description:
       Initial data for the MICVDD regulator.
     $ref: regulator.yaml#
     type: object
+    unevaluatedProperties: false
 
 additionalProperties: true
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
