Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA602928581
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 11:52:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90549C7801B;
	Fri,  5 Jul 2024 09:52:03 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B0B1C78015
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 09:52:02 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4255fa23f7bso9686235e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jul 2024 02:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720173122; x=1720777922;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MU2D03rBymimeEThachF3vpMLpUyintAFPPxBkkYiN8=;
 b=Fs1V7Eo4lIO3fI+gVhww5cPV7hywmBtt7aLC0FBbp/EPHxhcJfdHjJUw0/mu52pQlD
 edeOUjVVDz7SrOBRCUa9WuxrSL2QFvaWLLYBJTSiVXJO+/8RQv6W/xCfuqGsPr8R6dik
 ua/yU+AetDmd7V3WUxmCpo7vzerf4l/TF6R2ucsQxS6eR5jhERqrNs7AtLNyDctg455b
 tsMsUg1uhdcagc9lpkZtWtXXX31rQKExKAFhFqjSc0VsAFypz+1Vzpv7YeYK6HJ7h/pj
 S8ZbM0IZxcNww8BNBT71pCrrZCLUGR/2vayDeqw+Jz1D9pSgMx70sUuG5H2Vqnd23oOZ
 KE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720173122; x=1720777922;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MU2D03rBymimeEThachF3vpMLpUyintAFPPxBkkYiN8=;
 b=gX5PgnJz1tGpsDMh2sC/dZ6UIRBzDKm3D9XIz3JSnHHxxaEMRIggKYl+XPGbSoH4dy
 9wEG/Uk/bn+lZh+xezfmoKtABrW1AR7hzRjoKV/ldxJDrsxvmvHYHdW9gG5GPv8dTEt9
 0vF5kWJOzhYl/TmG3D/jTCkeqrYuG6Mkgztjv6FhRAk5FLh8HGD3FS46IfFU5U1yWnCj
 b7wSgYaSKZ3lhczg3ax/oOM3q49vHfrhMlD/8XdBHlcfo5rbYHnIzKQ2FnX4AlGm2VtZ
 rP2fEtKSqTwJP70KTJRahXVvpS63PPSloIOB9zsPINXN3H7Vw2q6XhfNKhhDY8rdVmCx
 dJqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxxhNXnGuXl0XJpzaZBMEW+B7WLfAStl5nP9fHSDA9fq2Q9ywwplYMvTSZ4yHAgnkACnBdtzndA1p/0Q1R9xWxao544EVHcwsOgRiJxWA3dPMPbDgIqWGH
X-Gm-Message-State: AOJu0Yz1BZKu5bkbkhT3SIcW8X5dz17iwRmG4XtJ4dgPkhfCQ+ikyhu/
 tAPJYQaEtZmvPRXXliwt6NFEZGWovFLSUsWKEqqAUo08lG/+x1DKGqArvHlgHTk=
X-Google-Smtp-Source: AGHT+IEcpp60tR4PKcwDGPP14DeUI+AoL2ftunbhF9352ciJ0gccYmGm6xSSUx+JTouCAodSiLlByg==
X-Received: by 2002:a05:600c:358f:b0:426:4765:16f7 with SMTP id
 5b1f17b1804b1-4264fc79f5dmr12586365e9.21.1720173121834; 
 Fri, 05 Jul 2024 02:52:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 02:52:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:23 +0200
MIME-Version: 1.0
Message-Id: <20240705-dt-bindings-thermal-allof-v1-4-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=77dfRMvnVxm1OF5oitgwjLhiiD1KP8HFaw6H5YipzNI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8InA3pcGxOIaNi/3wwA1jD22EnC+9r/hUFT5
 oPaKfM6oyOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCJwAKCRDBN2bmhouD
 15/ZD/9s57cCbSiSE5irX/Uur4kDRE/StNK9tbyUxFiaMjpwhSzBdaX4L7325iJWZtbhhpo7bDO
 Olnbs21yUzxNsQKW4iv88RhSDqHQikiZq7o5QSiW+fKeWh8ku21wgSZs2fl/JJF5pRtsswwm7rn
 /+XMjbE+UIp2qbtHeYCPE67y6pp58dKe21sjcb0dHUC7GORWROwV06u4cDth3tmYkfeZoK0ffJN
 HB0JWweA//qKV0IJX7mIpAhwfCh3Ttlh7RMzIYXM7xnLmAYeitzpOdYTJv/DbhvCtIakG5Tz1Za
 VCfME6nIO3DSJ9ETrkzVC59rj1OG4PS7eYAZ11PmQAXLZQharcnAk5bfSIoe5SAgqdsXY0iN8wo
 lF235kN83UGvPQ8Rh2+CCKscddW9fKr8igS7x0VVO57VhYGmscjUOsWPHaUqlwxyZKTtTb8yZr7
 A0ek8L5L4q8gp7XERg4FdEC122X7tjUQM8Itq4FytD/EqAYhQP9GoKpz6OJ5srrcTFHJXe2Za/i
 t9I7SfHCcX7VbZHck/tb5Y3+FEJzpLzVX7y8cxRMLr9bhLicB9XyRKb1SFbfFeugE9NfDcnjuWq
 2AYBQhZNcXR2N/xCjpthq4NDkp7nDdOXdTVqluE6epqCbmZb3MTT7/nGMdlOe7xuLwGyvEbH8CZ
 bl1TOEbO83/Qz4g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RESEND 04/22] dt-bindings: thermal: brcm,
 avs-ro: reference thermal-sensor schema
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

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml b/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
index 89a2c32c0ab2..0271a0bc1843 100644
--- a/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
@@ -19,19 +19,19 @@ description: |+
   Refer to the bindings described in
   Documentation/devicetree/bindings/mfd/syscon.yaml
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: brcm,bcm2711-thermal
 
-  # See Documentation/devicetree/bindings/thermal/thermal-sensor.yaml for details
   "#thermal-sensor-cells":
     const: 0
 
 required:
   - compatible
-  - '#thermal-sensor-cells'
 
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
