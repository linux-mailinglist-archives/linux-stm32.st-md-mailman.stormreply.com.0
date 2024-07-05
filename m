Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F499285A3
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 11:52:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E10FC78013;
	Fri,  5 Jul 2024 09:52:35 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB4CAC78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 09:52:32 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52e99060b41so1486474e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jul 2024 02:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720173152; x=1720777952;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xHK/qxjThTBQx3yAiyF3Z2q8vhY+c5nKTIQAaD+D4oY=;
 b=QCgDN3gKENbyT+kSq3nKmVnMv2GknUWV2e+Hgiorbyg3FQD8y8y4uQ9S9Ofloxblmg
 ioPhRtrH5dhoJDMDaZ1g8sqyqb6r49CCkO+M1SRvnQvklRNTX3+sR6Sd31cWA+I+V1cc
 fp+mPjLJnCFuGa5nB4nsdoAEmHFA2CCXCU+GNSE66t8Ywq30fW+J0qF10STal8waw65r
 pQWsKo7GxOt7hzx2xzw+pbQ8xltgKPnROafBUg2l7inPTJLRdRvHE6fo7fbHZgvFoImY
 mgIPqB6GyIPb+9qd2iZxPY1FlsOhtRriD8HaXXn7e7Kb0jJZtUUm4J4XMP3puStg+V4Q
 zSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720173152; x=1720777952;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xHK/qxjThTBQx3yAiyF3Z2q8vhY+c5nKTIQAaD+D4oY=;
 b=wPMTu3jaaZ5NTZcPfdgq4H+iQccL0X18X97/InQYNM3R5ppnVVfJveP02IDeM5vJ31
 lo5fC2wPo8twcAmXRqLLNzXcs2AzaMfcBIw+FjCqiAnqSyYkcImcxFJONY6o1PGy/EuK
 cWHsGJLodjcc5a3Ahc/MGGdaMEsDGNlSOJKGPtOWnPryvBkw6UO1dsaO2nO1sFnDpZRX
 s09zy+N8F0DHsjperm8pnW6k0ud6xt+NrjHwaNJAvcts61UKROAZ9ScwsE5bntSmu/Zs
 F14Y9vADqI/D8gcTSY2h9PTWuWVJKLGNi1pBMHWS2ZXektEYOqYiodK4V3JUGxP2xHg0
 Meqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGcvV8nJkCbCnNdgXrPjS/E/zQjQxvahtCon/uB4k29UZa/88vNI56bKmAnXDV75epfvjbh/Y/5Zq+sRwmEDctBCCVGcH7DSUd5M37IOtkPsX9pX2B6wCt
X-Gm-Message-State: AOJu0YwtPTWsp8NipCnzSP/6FaGhWF3+iftWo1IFWH21OcM8Y5+ovxHk
 FPiPESNNEevdTscNFkH/geKG/aFNoBrVSL5WQQbl9ajCNDP0Z4Wcyi8X7b068yo=
X-Google-Smtp-Source: AGHT+IEK1KKdTzbDztsnn+12R3zWG+9Jig/tlf9CjSDpwbnzRDyxiwqr84PK3eJ7qPGx/h4/oxG65w==
X-Received: by 2002:a19:f01a:0:b0:52c:df8c:72cc with SMTP id
 2adb3069b0e04-52ea06bb625mr2380698e87.43.1720173152244; 
 Fri, 05 Jul 2024 02:52:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 02:52:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:40 +0200
MIME-Version: 1.0
Message-Id: <20240705-dt-bindings-thermal-allof-v1-21-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5012;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XNyfNCGFScy9mZ8hCS/9iIypk5k0G+Ilo2PzHccYoHA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8I2NN3X7IIsqrtIAyFnYLzq5eiKU2FODdAu8
 m9zE/RImbaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCNgAKCRDBN2bmhouD
 11edEACVWgk06f6mBBoU7ppKmkICVWMkDHqhZC5XD4tsFEwEeWIGR3i9N/ehawoJlf81x4kZKoB
 m2+Ny3Lj0kk7pgw4g9zyXaGpdcoLuO6A9C+uH65ryVZIvClp65c3qVptOrtnlOWKSCI/cJwlo1X
 QE5WNsru4dj7xatBg774QL36pO4P5tsBDKEpges7jwlaDM1iKEC3TI935frpKvWRmS6b2JOTHOR
 njAs0ota2n81UZZcSj77goFxYTG+lGTG+2Agig6skKaZrMVvM3m9Dd3tEbYrIQPWSAaEXfRTYIT
 A/2y82Mf0UOlcYBMLrgcUds2Ntbx7vUOjExoOUsqbte8yyorWyu2OzYPc/zlkxSIq8gTj9knSHD
 /+wHokENvv7198RXplN30RIjc17e7n1RlWltCzPmeCB3zPwU2i1Y8DvDXGq5LnnxmeoT2E2MNlH
 PfH33sW0BEgVKI1gtXh2TIFX36/KFjQasf/Uitd6/5bRv/lXW0o8DmbyEhBBu1j6maxzKQe154y
 TsPoDS5ppoa4Z1JLQstMJzilHeQ2OPtUFmYr9EBqUYha4r92tpGW+XCBW8HpQc3iBr3Cx0/8ytk
 bjJaL5+cCMbFF8LF7lxgD4WSxwh7mz84dUgamDnNx4DT0txwejUAnJka/ck7TJ7n+iaYcQyN+bD
 RpN1eJkt201tlFg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH RESEND 21/22] dt-bindings: thermal: simplify
	few bindings
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

Simplify few bindings which already reference thermal-sensor.yaml schema
by dropping unneeded requiring of '#thermal-sensor-cells' and dropping
assigned-clocks properties (core schema allows it if 'clocks' are
there).

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml          | 1 -
 Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml   | 1 -
 Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml        | 1 -
 Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml  | 1 -
 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml  | 1 -
 .../devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml         | 1 -
 Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml | 4 ----
 Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml   | 1 -
 8 files changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml b/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml
index 267a0f423504..32730211e15b 100644
--- a/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml
+++ b/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml
@@ -42,7 +42,6 @@ additionalProperties: false
 required:
   - compatible
   - reg
-  - "#thermal-sensor-cells"
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml b/Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml
index 2b6026d9fbcf..ddf0f20e5285 100644
--- a/Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml
@@ -34,7 +34,6 @@ required:
   - compatible
   - reg
   - clocks
-  - '#thermal-sensor-cells'
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml b/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml
index e02d04d4f71e..ceef318668bf 100644
--- a/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml
@@ -28,7 +28,6 @@ properties:
 
 required:
   - compatible
-  - '#thermal-sensor-cells'
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
index ca81c8afba79..79e691b08341 100644
--- a/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
@@ -38,7 +38,6 @@ required:
   - compatible
   - reg
   - interrupts
-  - '#thermal-sensor-cells'
 
 if:
   properties:
diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
index 331cf4e662e3..0259cd3ce9c5 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
@@ -99,7 +99,6 @@ required:
   - resets
   - nvmem-cells
   - nvmem-cell-names
-  - "#thermal-sensor-cells"
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
index b0237d236021..19bb1f324183 100644
--- a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
@@ -197,7 +197,6 @@ required:
   - clock-names
   - resets
   - reset-names
-  - "#thermal-sensor-cells"
 
 allOf:
   - $ref: thermal-sensor.yaml
diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
index 972d608ddf95..63a29a1f7fe6 100644
--- a/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
@@ -48,10 +48,6 @@ properties:
   "#thermal-sensor-cells":
     const: 1
 
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-  assigned-clocks: true
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml b/Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml
index 5f08b6e59b8a..30b22151aa82 100644
--- a/Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml
@@ -42,7 +42,6 @@ required:
   - compatible
   - reg
   - interrupts
-  - '#thermal-sensor-cells'
 
 additionalProperties: false
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
