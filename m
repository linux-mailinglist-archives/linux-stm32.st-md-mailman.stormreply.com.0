Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C1492857E
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 11:52:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B99BC78018;
	Fri,  5 Jul 2024 09:52:02 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43354C71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 09:51:57 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2ebe40673d8so17455881fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jul 2024 02:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720173116; x=1720777916;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=G1lgREowMpDgegSv36xdcxK3AnkFlFwaiDjciQiE+8Y=;
 b=yjVeqQkVV243gvTn8J0wnuiLaFG9i2FmR6WEqVS2KDC8C9SvvC5XbaDyYWcD3N3Ctx
 cjOegXwUpU9jhhvaYhtupZuO0H6dHhbQqhvNEiQxT9qArgyK4uadJE9Tw35w6xPQxTn6
 +ldTre7l3fgHj5e6PqMrShTk/YTlfbTzTApuYC1KrccC8dEZUev/6ycPcVOO/kafLx41
 G3lVYsamNHNDmT4m24tMPxCJaS8keU/wwjl3llF9U6eDdRTxmVbmNRdW+3OC2T/Vgh1k
 bDGGce23T+EqU80Krc3YjusqttI8EU3Df18+hxWTlDbGwprLS77//BBNPhX0/jSm3ATo
 eQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720173116; x=1720777916;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G1lgREowMpDgegSv36xdcxK3AnkFlFwaiDjciQiE+8Y=;
 b=YfAMAenwXystP/qvaHq9vowPOkg50J7L7cJ+CJosEiw6011KI6MD7EozHlMOvGIMHB
 0zC8ggMZmqmnUJ3iSLhgkffIjvjTAn4RbJ6RSf4iU/rwYwaO1dJFK7R1OZ6J2UEe5y4v
 /NbKz/39myDVkUK5DEVdw/WGfpi4Y0Z9IlLAt55l6kZp7o2+tQe3DaOzrX0xY5OLlRTg
 jHI0httZxfK9CJIyX/UaJf2gIJELZrqVTZ92MKKMsOOu/etH64wfGYESD/4VgXa89Z2w
 C3UIaGbUa5t2mk4AYHxMHOOOX5ixSSuqnWcfnswVjitnMILmFahfBJcgw+ZiX5QbqRhk
 OkWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzOin27FntU4Zw3ahBqSW2oC07dWehnqGG0AaZi+hmeCuMepSrgPfb6ZlCdW4hF0gCpCVUSCymul7Kt4fvkW3jwYbxpOTCYDUjFsgXbi8/c53IIekl36Ou
X-Gm-Message-State: AOJu0Yxlu98BMh7thlPDHdG3YCWgToBj+TXCyegdHehM9yelPSV5Jt8l
 7WlV5PRiKHjC6d0mQQOTikDfQEauLgCSPdJ67D77KnsHtaiuSunUJBNOgALq8JI=
X-Google-Smtp-Source: AGHT+IEeSo1l6X3Fn7oREnziy7wGl86YV+iWvBeIrZ1RnzxH6wICinSt6W9cTAWxOTsN1SfeBkyhoQ==
X-Received: by 2002:ac2:47fb:0:b0:52e:6d6e:5770 with SMTP id
 2adb3069b0e04-52ea061f4a5mr2746219e87.14.1720173116487; 
 Fri, 05 Jul 2024 02:51:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 02:51:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:20 +0200
MIME-Version: 1.0
Message-Id: <20240705-dt-bindings-thermal-allof-v1-1-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=3EnSa82o7YAfbkSZeSakkuZ4xjdHqVx+EJ+E8oKBlvg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8IkvFsEQjTwZFnbae9AS2ygRayZquLi0sRos
 UXLxi65fnCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCJAAKCRDBN2bmhouD
 17PuD/9a49GewAbEVoD10yTzhnQEIJm7VmLlCWlVgVZiMpLg6K5LLHZn7lT1CAo/2so5Q3+XXF1
 Tjbp+LcH4moDaYOy3CUt0+YHeNd9BGdOqIwbRBykpRhvc9rKVkMxe3piyICn6h5RhtDePV7NnCt
 6Cr5rJCjnFcf2AbZZeOQxZLPwBDwqxET1/yWFebn0e/7AaDIo7JAW6+1okCZcjnqPQIyJa5cDBw
 vua10epXrG9CiX7NnWzzT3B8QxMahZgtWcUPiUdtO7hnqZmfWCChO4B1VozqWnEheSnRpvSZ3x0
 zpMYhpkXacNsNT78pm/OgCTK9ZtGQD40/GqQtWScwbJsnytA5Q2ubJH55ro+g8zuc1ZW89uYkDq
 /x4vhyjvRaYjLeC7C1MeZagVotfluZqWAAufbRbJubk4Xa9n4ZQ8jaak5OEhDd/l1gWJHWE172X
 aRN0zlVnImPidjB4ONSQ4oO7gog5Umsylxs6EQA9Zx0MlkLZ1ydbxhY0p31lsUnl17b7LYYlqGU
 TK3+xHPXDGHja8qrdgMTUzvvq82VgcN8s5mqc/EjGE3c49RP1fwFwzzkVleR+PPIxeH/OvTOyXu
 AXkWN4yvcmqD0ctz8QtvSWiyJSOTLPl3O0ILl7vQwO9ge36B3+c6ILtuQ61lYLyUZre0QUQIlot
 5awo2AdWu4Ir/Yg==
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
Subject: [Linux-stm32] [PATCH RESEND 01/22] dt-bindings: thermal: samsung,
 exynos: specify cells
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

All Samsung Exynos SoCs Thermal Management Units have only one sensor,
so make '#thermal-sensor-cells' fixed at 0.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
index 1344df708e2d..29a08b0729ee 100644
--- a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
@@ -61,7 +61,8 @@ properties:
           TRIMINFO at 0x10068000 contains data for TMU channel 2
     minItems: 1
 
-  '#thermal-sensor-cells': true
+  '#thermal-sensor-cells':
+    const: 0
 
   vtmu-supply:
     description: The regulator node supplying voltage to TMU.

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
