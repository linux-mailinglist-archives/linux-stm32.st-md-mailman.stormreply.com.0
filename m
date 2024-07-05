Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DF9928584
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 11:52:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B5BCC78017;
	Fri,  5 Jul 2024 09:52:05 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F462C78019
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 09:52:04 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-425624255f3so9112245e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jul 2024 02:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720173123; x=1720777923;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GzjIIKaoQE5SHKk2q2uAy6nqX+WGU4NAuF2D0sAZ4sQ=;
 b=ICKBzdZZWMI2ViwU1DThaWrj1DSGqhdK2fZ5KllF1/FqsccyAs5h3zEahiQj9Lr+ME
 /w7LDn/0dJeD2tv1ZGVzZMnANz/GbrphRFQmrYbEpWIOltu4ZWpUg9xMndry4CNwPZ/K
 l+eC+n93nPBpdUKWSsqXhzrWLMUidTwe5+UWIaKbHmHQgYj6f0fN7WcDRQQtNrP4PObo
 TpAelGLb5W+FzBi/Otl13WPwWo1xpPluP8sq9WYvgt58thpIvU2Ep4tgAa40CZ7lfVgB
 mrnQSXghLCXUZ1wVNqv9ckaH8Mg/MuLpnOgen3RyPjFBCJyUu4Db+fJvU/Ny8mTF4KZY
 v2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720173123; x=1720777923;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GzjIIKaoQE5SHKk2q2uAy6nqX+WGU4NAuF2D0sAZ4sQ=;
 b=TqgHZOJtL1V3glkivxjJA8ksOtG7EETQtarAXWr3UhdMfLiVcTln7ms0S3WimjNoXC
 w4BIOkwfLAYx3LYXl/Iar/ViQ9ebzqrLUiUTXL5bGOgerEJ++mQfG3/Qo68lXPSdsbB7
 sFSHI8o0dGHl5eZyySWPEXa8c2I4/HSEAfUprLWlkv5CCOHDAhilvphxaqc6dLC8ikzC
 AUIS92pQ7Upk+X+v59ZmUs7hCH4XPsuaFgUU+5MLgXTx508+wQXhGrGzjPbVLW+MfPpR
 iwgxUoFxq+sGPd1trPtdyE/jRdgQLWzU+nnihm+fyX72D3znGFcst7qEuOZIOoY4aDsd
 1sCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPdIla8RCHYLi40kP3hU+Su2Xr18+wApZkaZ7oe2bzH6TGHvXYzPwj3ElR10nhNLX3sY6GFk+kJBKF9tP9eIDJGzpqr2ZnVuhJIi+K8tOqX++AgpQa1Ldn
X-Gm-Message-State: AOJu0Ywq3M/43LmL/apx28DRZrnXumtO2aQPjZFv8oZ/rYG4mVjmsjh0
 D86kYMywWvb17Rid7pD1dCboOukD9B1gWS3IUqihgY+AZMXc8I1Mu0mx4jLVAA0=
X-Google-Smtp-Source: AGHT+IEQcA20h38s2g6Ses3CSWYigWtghZ46X0AMmLlWuAFBEueee78GxaQQ7J8Wp1trOqfa0lXIHg==
X-Received: by 2002:a05:600c:2d16:b0:426:5b52:84fb with SMTP id
 5b1f17b1804b1-4265b528599mr450995e9.7.1720173123637; 
 Fri, 05 Jul 2024 02:52:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 02:52:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:24 +0200
MIME-Version: 1.0
Message-Id: <20240705-dt-bindings-thermal-allof-v1-5-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=0fSb5xqcGi4HKz3CDANpHnfXYtl8RCvr5qhaTQ5S2P0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8Io7vHh9SbWP804f84WKaCS+gN67JOZDpJ41
 c7gdcSv29+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCKAAKCRDBN2bmhouD
 1+8WD/9874fMQJU7KMpw+RJkf1AXrSErvGZqp1YNJWcmDsOz+1Tp2k35XRBfCNDd4nDARTBW6JC
 /Xr357TKiY69Zpiz/6IcOBOXOrbsS+3sovbC8/+gW/BhEBaSTTXtHv6KmSkXSD/Nz0AlIYhZUQT
 AbIefNplxTDpH/VzarDlGXQfXRb43L6qdntvnUaECYnMZtahhPE2ejNg/PT7hEBY4GJZwwQQw2q
 uwXWuOGuU6JW/1Nrjk36mNrl0gb0RXhvPTfCp5uF9+iAwWKfwuIUN5WJUj0+jRNrJLwLjDBQ5EO
 U9xpRjZnhahvHyOAuFjy4loDCHA7X1galk/JwSl87mAZLVUaQo1uu7EfhC/8z/eyOtnDlPZePV5
 yf6clqtHUvhyzXnMnzqY4AegFT94QQ3x7RYMClqZGB6DzPFaDUqbuOtp9OUmhOyyNRfPnfG/lVH
 84Q01sbbgVEq7fUfcG7ckbBBr9FVxuTkSSLkdwiVjlzUcby0YT4gZ6ZEceVL6qEr4G2ft8xvnYS
 t1tyYn5KC0qS5ag4npu4NQUCZJ0fW4yol49RHj7Haxf5nrLnMcLD8KIwdGi16A74pjmP4JdmuPP
 fLFzRTf3fo6D6ftg7zQmYHZnAiuFZDmyEhvuBRZRo4qJTJ4bx8zqTE/LMpApxQJXMYaFm9iyj6j
 gteb/K4P/0ftdsw==
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
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RESEND 05/22] dt-bindings: thermal:
 generic-adc: reference thermal-sensor schema
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
index f1fc3b0d8608..12e6418dc24d 100644
--- a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
@@ -15,6 +15,8 @@ description:
   sensor resistor. The voltage read across the sensor is mapped to
   temperature using voltage-temperature lookup table.
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: generic-adc-thermal
@@ -44,11 +46,10 @@ properties:
 
 required:
   - compatible
-  - '#thermal-sensor-cells'
   - io-channels
   - io-channel-names
 
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
