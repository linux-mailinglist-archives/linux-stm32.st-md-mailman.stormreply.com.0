Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 176749102E8
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 13:35:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8093C7128F;
	Thu, 20 Jun 2024 11:35:17 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 878BEC7128E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 11:35:17 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-42172ed3597so4834185e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 04:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718883317; x=1719488117;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fk1qcrUS7VR6uiv3rXSOo78BTaK4F+eyz6aHAa6MhHk=;
 b=UY2/WhxTCeIJ2O2k/Bkyh0CxBS1psRd9ankqvvslqDB5n/GSGsf7RWFXITn/h3uuNC
 nPrGtCTSlPVKmV0WmcDpe5M96ttKSygYx5tuwYTzlg3jV+/Z0DWgNf7KfKXJmrxfpEAf
 KtEhu9164XBunFH+CCmzPAhoxBmqj36fFOS1im0SJSld2Tx17c0LX3bHDUcuPYgKyz9F
 qbHvjQ4vuZ0RtGzRJMNA/yMsHuqxkYz3lwiqKQvMihEA26Zj0oj/TQBpUGuQCQ7OsYwS
 0XET7wy5LBCl/SFcgIohYUu1oJ30AKt1ZiBDUYgpmdVP7IQLZxrilIhFEl21jb17rc8i
 URKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718883317; x=1719488117;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fk1qcrUS7VR6uiv3rXSOo78BTaK4F+eyz6aHAa6MhHk=;
 b=bxSGDXsTd3ZX9gQQXD0vhp3oT8YMbAr2Xm0bSHuTrwxaqeynPMD7bPcjZSS3YzYqHc
 XKGytWCM4ceEvyoJgZZ8Y9IL6pAhuCKAgKEPyocHRsJmtmX4vVK172FRifpX15klWlIp
 D2VWg0cn1V5+wlJ5a0Zg6ZkgoExVDd1xkvuY5j3vZAN0rKzITi9SSNAgCvuKhZVyftti
 XXzQM4grRuvX9P6XNuLzcWdj53FPx9SgPFLwfSDUg6PAvAkQbR3dUqK1EbqS8EgzzyaM
 Lv2alnlACqGU8O4WcMr1Y1h6zNVfCFi+9buQWkKA8AI1L/CJCV/9nV0uumLn29RvPB4H
 xJrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnGeYY2Gdaa0CFQzIGDorlHdwK/HXTnzWrICwuBV+VbOT9DeUwKaDk/RhA/FptWTDfiXs/Jg4sTGYeG9seZoo1UyvZA+lgzIN0hQmrzvbEnwc1/EipeC/L
X-Gm-Message-State: AOJu0YyXLAiUWjNGMtD/7w+3RpLPGWwtQlZn8RjqPjdb/cI/7J6p/LFm
 xHsseFJGCEFq9JTM6tRyQs6wxnQ63UdGP6iAMbcEiXWcFNz4Gf8nFoGAKo4tiyw=
X-Google-Smtp-Source: AGHT+IGMJUumhVd5zXX1rZU2J+BofHfd7fe0MAIVGxolusk6jZTAFq1NMKscErXYaaG68fe04/BU0g==
X-Received: by 2002:a05:600c:787:b0:421:8179:6127 with SMTP id
 5b1f17b1804b1-42474d41065mr43498665e9.20.1718883317066; 
 Thu, 20 Jun 2024 04:35:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42471e6623fsm49708985e9.1.2024.06.20.04.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 04:35:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 20 Jun 2024 13:34:53 +0200
MIME-Version: 1.0
Message-Id: <20240620-dt-bindings-i2c-clean-v1-5-3a1016a95f9d@linaro.org>
References: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
In-Reply-To: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Sergiu Moga <sergiu.moga@microchip.com>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, Doug Anderson <dianders@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 =?utf-8?q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Vignesh R <vigneshr@ti.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Chris Brandt <chris.brandt@renesas.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zPPCGCpVrPzpnwGMQ8MGX8wE9ElLtDgEtXc1fM6D7sg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmdBPi8sMmfgAT+DLum6aX4eAJT720TZZUkgMYw
 dBmfI6bvhyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnQT4gAKCRDBN2bmhouD
 1+1zD/9KzXHoic8Js9IUevJUSUE5qw0ydGDkJYZhaxsct+uBZoLdqQn/whX6ZYyfBFgZ7o8weCW
 z/uL4moE2VBBBYfuHGCyQ9b8c36gL4uV9ejRbYShlKCl/52gH52I0+TEJ4p7+94ez47mPJi7uXo
 I7mz+pEIhzb0Rp9eltBnyTfZw4CF6G6Ly+R5egovOIwM4oVYMdgsAoo9TQHlrE/y4oFzGmSpZTf
 wZ/50+rdWr/hWGodiJZSlqWWaVdAvC3SxDTY67//Hjub/2cs6ALiP4v7Xulsx1QHLr7U7s8JTq/
 uXr8Sezuzi0p91Qzipa5Nurvs5ZQncV5xL8VZgXAUeClC/+gnqxYJywGSdcCmLV3j/IdiU7y3fs
 KLcXmrlkHX317BwGXdSJUtmt8uUKXovBI92qdGwmuCR3hx7MPJlVPpA613HrEDC/mai2fYLEpKu
 aI7SzB+vmya07U34LGOSdSO6uQkuCh7xz+r1rRRzVbXG1ZcO046fMm5ORSXwzEN5mQPHQl/GDpR
 XcXClw/9IHKj6Eo1W+tfACtgWDPEqIOAFMcxgZL0LTlT8UYNU68n8drTzsA6meXAy9nHLfkUCTL
 8B5IPOyaQppDn4T67+uRuvq7EkaQHLcnqvOWaj9tAMnsvQ/Md8kToe1yTrTWBQau2bGEO6+AMoC
 UAk2iDhLThbpVhw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/7] dt-bindings: i2c: samsung,
 s3c2410: drop unneeded address/size-cells
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

The reference i2c-controller.yaml already defines 'address-cells' and
'size-cells', so drop them from list of properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
index 1303502cf265..bbc568485627 100644
--- a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
@@ -26,9 +26,6 @@ properties:
               - samsung,exynos850-i2c
           - const: samsung,s3c2440-i2c
 
-  '#address-cells':
-    const: 1
-
   clocks:
     maxItems: 1
 
@@ -73,9 +70,6 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: Pandle to syscon used to control the system registers.
 
-  '#size-cells':
-    const: 0
-
 required:
   - compatible
   - reg

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
