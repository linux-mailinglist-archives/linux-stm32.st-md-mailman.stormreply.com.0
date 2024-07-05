Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1018492858D
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 11:52:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8CC5C78013;
	Fri,  5 Jul 2024 09:52:12 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E37FC78014
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 09:52:11 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2ee920b0781so10059821fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jul 2024 02:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720173131; x=1720777931;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RpMYuJ0dfGhKXJajPxXWJEOB8SeiMwwjEYPx0ijTq+w=;
 b=tkDb2lj85W664+zk6HH2FPjRReGAoeZxCVHLFEtXw8Jj8ZmfMKwKADc+rBDdzmQPzq
 CF3xdgFmM+S4Uqsm9dhxikj7acdhD0odf1dvi6I1umgjM2xs90XcjVwDKl24nj7iwUMV
 gw1j7IMhmnKMBesu9OH2fXzbzvBqrKT3xWN5tEj/N2Yqf1ilYWxykHKiafo6jnD5ms7p
 MQhM4BVjvzjkBqq9IEOA4y9EfhBBVwPEnMvQqaH0M/+5jg2rDqz1gKdldRfJOYx0Z73k
 UymZ7lPzlirAevJTi+JBkyD23ep2dlxiH4nKfjIXITub6GJOBazmH+ZWODDEJXt5FNUu
 k/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720173131; x=1720777931;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RpMYuJ0dfGhKXJajPxXWJEOB8SeiMwwjEYPx0ijTq+w=;
 b=hjupOeyQTaF9eHMFi93oYS4lfx6C9yDw77iYwpIWUQh8cDU3gqmDEUy7zpU+1nOgLb
 Rbgt4o6mSfdVdFI83slg9aNRc8dZz3TiKknPERbMK5vMaQHP6XlSIdq5/ddg/HSfkKG9
 Xuxjh5po8ALdBEzqmb2mYxWh4oUa9St4rqZWg9Uer7/XJOSSp8WJ8uMikPyaC6zlMSLi
 dJ5tX0DslFmGBlfVJgzbmd0+64lIpFsJxjSNH3XQLCgQX1rhIgORSFvXQ06lb9q01VlO
 TVI3Ki/cil48de0hvh3WUWWGCVM2QA7jUQPekp8RdCsF9lcM4e1qpPBFzzkiZRq7Cf3i
 xP7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoaG8vosHWI14kuvJD8O0fVoZGbO624L0mYXdiMaMFHb0c6yFKbots55mhUslnhz+6oTHzGes6WrcSyy+cIxbFh/c8foEqU0HTU4Q0z/erYkxicRnblTW2
X-Gm-Message-State: AOJu0YzmI5ikPO4hx41aG6Gs7G1oGfdj6uqn+48nSjfbaRVUdWre85s6
 gbDEU80YbDivzGnUCY+lIY5EsuMEFprXLT5wGX0xBcrl/4+UKXOwdmQ+JzN5tu8=
X-Google-Smtp-Source: AGHT+IETSHLx2zzowgiEOGpjYLxdVdv6J8fsjUHUvaJDxS3VDywKP7ENhmO8Keeop5zSaLogLiZsxg==
X-Received: by 2002:a2e:a913:0:b0:2ee:81eb:6bd6 with SMTP id
 38308e7fff4ca-2ee8eda3d7amr34978111fa.23.1720173130803; 
 Fri, 05 Jul 2024 02:52:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 02:52:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:28 +0200
MIME-Version: 1.0
Message-Id: <20240705-dt-bindings-thermal-allof-v1-9-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1582;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=9GRX79mD0Qnp5m87TzZAuzLxfukwJoqm8reUPg+HeMU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8IraTqSs9zXCQgTjfReqMGMnHrccOsUqjqdv
 h2tuW/AYMiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCKwAKCRDBN2bmhouD
 10Y6D/9oTPxkLaWQSK0Zutky2g8bfWF3Az9HX0SCfqtcHP1CTgFWvKUJ847L7+6zScZ+CkBfFKv
 74RhKFt0yJxG2d3fnk7z8XGYmbGYt4RB5IlopZ8xL5OH2iOJJmqUgNJ9jQokzSn2fivLfETFv2v
 00+6DiAvmoeeQcuZ+T+YRa8k221r07QK8lwh8Q8qNb0J5rbPYV9H7erdx2/zEPuef1LPpjTxvMR
 7efX5o+RlrlMV101gkvXPBFHcwuVvinQti39t8Sqlg8/YZRHhdk6PebYXx6/pekO6RVb5R9RcW1
 9rte7VUPRZT6CF7ILZy7L+fwAzdABfwK5juqSR0moG0u93xOFyTPeHFcP+6EI50hNu9ppYkZwL+
 GCbM8fC78oWlP7PX3CKB7O4GZXibSRrqXOqu34x2Ya8ebcPzwLzeF2cvISfTrx+t+ahXqBzobtg
 OYwxf5+mcHZf3kNRX9SCcNAhxafXerYoic7DFHWiUh48FK66YajdrdSUaArj4cfb3opaG6Rn1Bm
 sXqZqDgDXm5ShGfuiEDgfQLJyUepKi66yBbRCfvtDW/fKh8C8ThwCmUABgYuHRRo0wEXEabBqMq
 0t7TUagrvO/jtIMGA87RSODLPAMc/yPKID9WVovTujYV6RVTkXoz21dYbpnKF095/Vyy5TwKmth
 GnOo7hn3HprgNhw==
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
Subject: [Linux-stm32] [PATCH RESEND 09/22] dt-bindings: thermal:
 qcom-spmi-adc-tm-hc: reference thermal-sensor schema
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
 .../devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml          | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml
index 7541e27704ca..bfad8130a042 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml
@@ -8,6 +8,8 @@ title: Qualcomm's SPMI PMIC ADC HC Thermal Monitoring
 maintainers:
   - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: qcom,spmi-adc-tm-hc
@@ -20,9 +22,6 @@ properties:
 
   "#thermal-sensor-cells":
     const: 1
-    description:
-      Number of cells required to uniquely identify the thermal sensors. Since
-      we have multiple sensors this is set to 1
 
   "#address-cells":
     const: 1
@@ -106,9 +105,8 @@ required:
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
