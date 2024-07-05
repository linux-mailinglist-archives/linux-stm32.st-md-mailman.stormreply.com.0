Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F317928590
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 11:52:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC7ABC78015;
	Fri,  5 Jul 2024 09:52:15 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9DD8C78015
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 09:52:14 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4257a390a4eso9899825e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jul 2024 02:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720173134; x=1720777934;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SNLCghh0Yz7i7p/GLk3+VVI6b/6S91C5eV8NUz+ePr4=;
 b=do4jKAArgQLXighmG4hYvTrGM8jU3c89Yh+VKRIdtCiQLWMmGEweK26UH56lkHCHdx
 188fgB6dh5O7RaAyFVnicGY0a7SZrMYJAa5sXPwbAiTchjU7H4NGM3pFgaCIYI1QBl0o
 YTgUnmN6ZyUTkRY1EqBWnoapwcfD7ClTOvZ4R2zjaDiv1dJbeuMSduHP2mREJmdtisFq
 boo3MUHJapCDyLJGqsb++KZPyLvXZ1LxLAshuzFsnfweGYrjj+vLT3fiwaKzIHrbIDpk
 MvVKFcQZvMim6UHMJUenq191e0EYtVP9rXlrZDd7TuuNTC4qngXBkfDOs4IjCOw0jGZC
 jQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720173134; x=1720777934;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SNLCghh0Yz7i7p/GLk3+VVI6b/6S91C5eV8NUz+ePr4=;
 b=vdmmXk6b9DV4sxabt+rmZRiSpp6QHsF4uUJJhNKBTlK4Eq5Nvd7yMRZo/KYWpaDUi/
 xSKP9GKS6NlZZID9AyaVcXQ+X3fN/vh4iXXX4TMUJ5H7vHT/QJ4zvAtz3lK3NeHMY1JV
 pHh70E7i11ezcWOpbirXWZoT/5m+jtfqigGqo8df8YOv5cf+7ZXel/LMWXlfzpp49OjJ
 mThWiJedRtuZLIGh394xuk13rS1D1wNWOUb6NyydDA4d7LvjXZgMZTTy5mEyFS9aPbhU
 4nFe/CEXSm9KpBkBNHawwRKUlQ49j66VkLnX7AEMcZUnVcfJvci6uaEK992VkyEOSLfs
 B4nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt57yK8+zYaYibLa2pM08gs/Am6+MGBryxs7/d//3OjRiNrW8FyJSL6TwVmgGQD8fSyX52seARJLMVA1ZHBn3VjPLeZYpHAo0Bkoxm8T91jjy2EmLaZn1e
X-Gm-Message-State: AOJu0Yz1lWx0+9TlXkUyk1IMPNyisbljUzRhZ3bm8cIgQuv5BEuZyYsy
 M63QkNY/cQ88HKAw7CIr2FuvExNebq5WW7RKBuMKUZIuaHecY41tjYsOZJErPZw=
X-Google-Smtp-Source: AGHT+IFYfb3KFQclQvKrC0bxRkYL5QT+2rGoFThcisJv2vbGuFeFm7mkup3MxH/OKF2jKfIZ5LbeHA==
X-Received: by 2002:a05:600c:1c98:b0:422:4fcd:d4b3 with SMTP id
 5b1f17b1804b1-4264a45f9b6mr29668465e9.37.1720173134425; 
 Fri, 05 Jul 2024 02:52:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 02:52:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:30 +0200
MIME-Version: 1.0
Message-Id: <20240705-dt-bindings-thermal-allof-v1-11-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=a/lRhuB7v/RH3R5hhGbQWTk2cMSnvHEqh4aApez49W0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8ItUHW8uis0xqBnpaivnedFAv03y9sHCQoyi
 PU5+qzAltKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCLQAKCRDBN2bmhouD
 18AfD/9FP2sbB58gVOPvih1LQKxHYPR0Hs/4bGCOQweiMftG+QKq9EOPHzRIXTtK7kgNYMmiIPJ
 ESDVzDFpQtdPNScJKmQrrzckoPdulbnhSf/C+HvC+AOXeNQ3Y5rXnqVJyaVIzCATsGwB2G30OaX
 bwOopuCQR4XRMwuV1SSTvnm6iBuKVCpRBeIx1xF6whanxk5+b3/QcZ4sDwYhMkd8xYnhWtBaDOI
 LK+cxkel64DvnNqsQQIT12u1VVfMEgsLvlq+pBTxskUJ57J9xq2ZCpbbC0TJxa7haCFUdI8DXOZ
 ert0DERpvbg3lNVt2S9d6CdgftWlo9jIaMEqWl1k466LDEfu7skl8Bim3Muevr+0PTV39uJG2Vw
 Eu0o7uNkutPJRXAMgv+ikwQnff624dT9I5OsObJOX1sDCAn8vPv0eSCPw+7lFtRmfdJXGKOt4XN
 33+A2HmS+If/cDDdBuNDc9oob72OJWXKk2I/1SRHVwTCxPAfWMIyXdGcqpo/g3qdnFe12hr0lwY
 EmfN9bd0R0r3sVz17OiSSyA9ooIkguFI8MpmZ3GynWf+OdUcpsi7IMHMcXwqfXkaUME59Qk7rhQ
 vMYrJqv9zEwcvxGkvh88o+St8318dVAOhwM82L/kj3iot6Tiw5uoXXZt1UOwj0JtT3PkO0y4caT
 +jSo368RDDbbF7Q==
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
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Amit Kucheria <amitk@kernel.org>
Subject: [Linux-stm32] [PATCH RESEND 11/22] dt-bindings: thermal:
 qcom-tsens: reference thermal-sensor schema
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

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Amit Kucheria <amitk@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 99d9c526c0b6..cce6624228c7 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -217,18 +217,16 @@ properties:
 
   "#thermal-sensor-cells":
     const: 1
-    description:
-      Number of cells required to uniquely identify the thermal sensors. Since
-      we have multiple sensors this is set to 1
 
 required:
   - compatible
   - interrupts
   - interrupt-names
-  - "#thermal-sensor-cells"
   - "#qcom,sensors"
 
 allOf:
+  - $ref: thermal-sensor.yaml#
+
   - if:
       properties:
         compatible:
@@ -292,7 +290,7 @@ allOf:
       required:
         - reg
 
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
