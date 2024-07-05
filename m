Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B5A92857B
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 11:52:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 339E4C71282;
	Fri,  5 Jul 2024 09:52:02 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4178AC6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 09:51:58 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4265921b0f6so1454735e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jul 2024 02:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720173118; x=1720777918;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8COq06alpIOkksMoTKi/tXV/R1PC4Z5hewvoLdmduzg=;
 b=bN0C9v36aZE7Zt9+OK845YXGyj4zcKuCi/1JK4q6AvjaQN1kctKyUP0yx9bC39skCj
 z9hUKkw/jzSgQFo3pWSIL2l4IAOqTNU9FytTbWqcmtcLn57LejVn1vu7QdI1gFP8lN+K
 tgNRqPOa949pzTR4s2McDlBMX55TftJRWe92VmcJjJZKp+A9G9lrBEqJoNoutIsv/Dop
 h1UHkxMn0AVEk98wPhfbZETiEAIDRSZleAR7oVMAuUJUza3bP0dkAQNfl5cwRjv8Rci4
 oGWw0ZCPD+aQuUROJ/qSsvTedyr8Xe6U5XbtWjbKJDPjwP5kS68vpUN9/MQ5Avyh7y/U
 /daQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720173118; x=1720777918;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8COq06alpIOkksMoTKi/tXV/R1PC4Z5hewvoLdmduzg=;
 b=bHKgcdi06sroirBx3T2li1CxcFuck1ysXTFR/GRgRvMHLxq2oRPND3FLYSeDCfJiZ5
 50Dyy/ACExszABorL+YkQFqBnqM48kYTvp0c1xEwoH0CVMCLK2V+P5R8ArCp3GiZ++nP
 obDNdX/T7d72ohIhrkUZTXmIwluiUn75/6/YBck2z5HGsNeGqoYIx3e/E9JSZ7NgXGKs
 oZd/nxp+ZMmAht6efNAZZsO8IwoqbtqmGT+lTzbgUmRKtuKwQvAZq9msFsCRtly7JZLX
 DzLgUXRU/7SU98ckoLNzczfBuihtDl0ZG+Yn9a+cq1DyPcO5FnYQalu7GgX3bzux90B4
 aoQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX49As/1fvafqEZWK9sWO9ve2duWJj9FVD2ONecXQwYdQ4OlKd9iYxo5Vd/y2h4gH5kOU+FiHS0FdNBI7rd81zIOGp9zE9cZuipX0H3QU7dhS8LY1bPooOl
X-Gm-Message-State: AOJu0Ywxe/bCUNhy8C00++U76PMg5cR2MrzqyUAd9p2sl2PW5EjpZkYQ
 VyE3LeQ78dmu2gvHwYfElY75qprjS5iORqHq0jEED1s3ybPv5rgS9tXyPAwBGJI=
X-Google-Smtp-Source: AGHT+IG1gRQHdpu2sW5QFoF1LniSXRvboVCxaOleTK3xsQy/rvilU/vtH+YKOuVGHfgb67tw64B23Q==
X-Received: by 2002:a05:600c:4ca8:b0:426:51d1:63c3 with SMTP id
 5b1f17b1804b1-42651d16511mr8916535e9.38.1720173118303; 
 Fri, 05 Jul 2024 02:51:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 02:51:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:21 +0200
MIME-Version: 1.0
Message-Id: <20240705-dt-bindings-thermal-allof-v1-2-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1232;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=LeSP685Kq7VRSSmr0/04GPkxgxhjYf+AaH4Aoa6qJmw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8IlkQpQruYXCBJmeLjrsSCjy/A96oZulHmNT
 BgmKyLiQHmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCJQAKCRDBN2bmhouD
 1ynkD/9TX/+loWJbQv5z+n7E0oNbl34ziXNPnnRwtmKBF+YXd72Utz+bdkjnSJutW6EqAh4i0BA
 MyGzrk7k8ABIGMvBwk8+5HQSlCAsjsRRNaMieuxVnqXzhgfaZlfvUsIyN57KSUpzGmm0xYZYW1O
 TwabUrxmDq49lNhaL1soSHAaKezV8cw8ZjHtnC+6NKewpbW39+ipivJIpNxvTdoMvccHUHadlIO
 IvgdAAL1dGmGkmkl6ARHXH3Agj619JOixf/ylFr965+UxEYWNp1RmeZIVfgAwCA/3LKf7sXSDmP
 PwKgo03lc3yyH74EdnS4hYtIBaZ6OG0jYx6A0W023nSkAmcDxYgAGRnNjKPbEvfEu8fQvOvjrBU
 YUO6B49ZU20YmCkr4fxDJdsEJIDr1aBRhTlf8ek6gwtXqxT35oFEXJVXFa4poX43FH6Oi2PO93m
 w0WE2laiwoSf7AvQtogVWJMfoHY0RNX0lE10j1CoYbz87yVdLjVg0BDNpby3/IUzXrpR9ZfkyqO
 WoFoOk2/daib50kAEnVw/D1FldDWwdUJ5PgCrnJVzAv9FXsKCYFIT9CKQkIu5tueI6e56YOLSrm
 d63rcP+UdVMKyrt1Fj9g67/8DyDGtZOMEn6oUAr+rgqb7HnNpqeGWljv/daZcqYKRwNqJ5cfDjw
 g5lf3f3ssrwlG0A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RESEND 02/22] dt-bindings: thermal: amlogic:
 reference thermal-sensor schema
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

Device is a thermal sensor and all in-tree DTS provide
'#thermal-sensor-cells', so reference the thermal-sensor.yaml to
simplify it, bring the common definition of '#thermal-sensor-cells'
property and require it.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Guillaume LA ROQUE <glaroque@baylibre.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
index 01fccdfc4178..e52fc40e215d 100644
--- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -11,6 +11,8 @@ maintainers:
 
 description: Binding for Amlogic Thermal
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -44,7 +46,7 @@ required:
   - clocks
   - amlogic,ao-secure
 
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
