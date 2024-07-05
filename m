Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 129DE92858E
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 11:52:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D33E2C78014;
	Fri,  5 Jul 2024 09:52:14 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 029BFC78014
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 09:52:13 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-425809eef0eso9666525e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jul 2024 02:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720173132; x=1720777932;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oSkEeXERWLNSk941iK/O66Z7is4lgvPwTjaN4ljEkCs=;
 b=wSyGQ9glMWRXes7ZMJ6o7Gf/A4AWZdMomtx0a9KmJ/sIKGjWRIHAcwAafUwkfVI94b
 xiN27Z/JFE6jIhC7SSpPNs1CHNc3xUKZ81s0DPA9Ls0BrMOsXkTcqn+AGX1rTdsMVsBs
 rkwShyBmynalo4wZYg4jlXqjg4RA81kYjYKpYfuDLE+Jq2eIoQBQiat9sCzaQpt72JWz
 QphIUqHI7XytWS/ZELitjZN6+hlGDaRuKD71enYJ4Or3RG+22Ji7bFFeJvvsS9QtivUa
 Rz0mEzMz4WGzvKkK7nZU+I7GGJSolj2bqJcMDBPgLBHt+7vUGW1M/rKkRRW9sVT1KGzK
 2xGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720173132; x=1720777932;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oSkEeXERWLNSk941iK/O66Z7is4lgvPwTjaN4ljEkCs=;
 b=DrE4VOkAS7LmXMMGQw/299gCJcVKAHznBbweyvCIyG2qR/91hkXukb0yGI/+7aQ4XG
 DLkaWoLQd0qc1znXXGg7LnWHah1qjz/Z1phlWZztbUZSIvtoAp+hdWCT2G2W4g9cEz1T
 5ycb3S65/Ku8sPzVjVULVCCeTdu2rJnYS/LrgGxXlS1++pHRWN5TwsN3P+HS6cJFBI6U
 Mp9Ur7ZTVc8jUY9NGgMRx2RbRcfA/Hn+C6bJcjsnUc/m0x9r2iwdHrq4pyWoo2J+5tbX
 yDn6d6i2exSTWdvjMjGoEuiZww5ZGleeY0mLEh3Rj6uqSc9fhQc4Fs0kwTr+Z+kP925m
 ZelQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWG4z5j2YSx7tpwhMQS9lB27vaxBmVrA6kUUblvqwYOHFNQg8N2hu8roz/m0Kd2V1qqMHd2R20DrTdBzv9ruBWAXPCUvnFFt8cfQQEA3b9d5bJDDcCOHZg
X-Gm-Message-State: AOJu0YxtHB8SfMh1rK2R06Sx4Xc0/2SVn5e1oyo3tLhLj7eRlaEqFkHt
 1ESRUPPx/0FEuaF9/FANAoGGJC7cAbx57mpgW2V5RPs1nlFsOJv+s+AfLpEnAvE=
X-Google-Smtp-Source: AGHT+IGkEaOGS3SEXQ2doYjoak+87kIZOp+NhiPnICsEeJe+OnkfTqVvU7x0phLNiFA/Cnmkm/jPpQ==
X-Received: by 2002:a7b:cd05:0:b0:425:7c29:7480 with SMTP id
 5b1f17b1804b1-4264a48cb74mr33010955e9.38.1720173132598; 
 Fri, 05 Jul 2024 02:52:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 02:52:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:29 +0200
MIME-Version: 1.0
Message-Id: <20240705-dt-bindings-thermal-allof-v1-10-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1549;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nsdQLuN+SQydv/zvdmA4FzqEJl/eMf90B93Xt2y2vFI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8Is5nr18957M3S5EaFoQLgXcr0SMWBi7Ve0P
 mBnPLk+fdqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCLAAKCRDBN2bmhouD
 153BD/9X2T5QDXnPLqN8Gj/7SoVTWByJdN1lmjyIS2Hn9aXBhpXIgaARl93vDJP44E1LktOdGEr
 uNrptTktREtD52QtzNPMfBICj4LoiDlGNnajUM0eaP5UQgVM6thw7ho3mUkJM0Lh5YJKbxlpxKQ
 AzQFA3TPII6BhbFTLMMs+shIkI3PGMD7SSs4koEk6SI3BjThUeHqiZwPfKfpTW+K9f+CjXQ5O8d
 grI3ChmVLvxJdL63sbWOIVqrSHaQysCArD8TYdznl/qsnPXcNE/4AGsnYb9y9Ku39ftH7O3+2yE
 Et3LxCpzwfsD9fNL5bJslIFnBZoT6t6YQUBYM+npfEtATLmtmFG9vl/QpojEyaGttF3LApp7ZWJ
 XXQatmPnIiq71nGTMFZkoXVmdcRUvJfnNfwXwG3XXwtQpWjQ2ivFAo9EXmB+DmX0YGioiMwJn1l
 2LrG2ricYNcfYIgjsbEYpAT6q1DKm07JO4LAWHm2vXHj7kz2dZZ5dJbYWjlpE+4yXCvkn7tOasf
 BKfNaHHwTEb/biqkgpXZ97JpdyT7GJ6mNAB3Yu49N9uF6DiSg4EhB5C8D0uW05lPHSpZoOyXDje
 cHcvcqnUcgcuZ0hFlyfT0RxWJ5r/bJ4VAbZBM+fM1fKktjUniAZQnjl5B+8JM3CxFabmecjYyT9
 QEtxnJkZLgEptOQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RESEND 10/22] dt-bindings: thermal:
 qcom-spmi-adc-tm5: reference thermal-sensor schema
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

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
index d9d2657287cb..4470a5942fb2 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
@@ -8,6 +8,8 @@ title: Qualcomm's SPMI PMIC ADC Thermal Monitoring
 maintainers:
   - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     enum:
@@ -23,9 +25,6 @@ properties:
 
   "#thermal-sensor-cells":
     const: 1
-    description:
-      Number of cells required to uniquely identify the thermal sensors. Since
-      we have multiple sensors this is set to 1
 
   "#address-cells":
     const: 1
@@ -159,9 +158,8 @@ required:
   - interrupts
   - "#address-cells"
   - "#size-cells"
-  - "#thermal-sensor-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
