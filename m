Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FDD9285A1
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 11:52:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CE7EC78013;
	Fri,  5 Jul 2024 09:52:31 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32427C78014
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 09:52:29 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4265b7514fcso87155e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jul 2024 02:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720173149; x=1720777949;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MIlgI7ATvfa56t24WLZv2N3r+FaRSfcqNDIIELB3K9k=;
 b=zIHdVXoJaiWbYYPxGrV17Zng7eqYcW9A+FekhhOS2byM9xbImSZ0MFHmVL+t5Gm7d0
 9DcHqhQ+b22TmaswN5FPiUzN2p/6lqRU5N2G7nSaI6+oMkKko8ukiVKwP/QT68gdOzsF
 TMnKoWQv7+cGmEpNnBSDnzK9WV9YUGQnSUiTdMOrKSDJMADW00pe07s8NKjVaCgTdRnc
 UGjl2dQOqYgJq2X53vmZ3rJqLViPtOl99Cnecm/ZPfqd2jidZoumYFL4EiteeXvGiWhK
 zIliCkTK86gzpedn+jleQxFCJ+UjkDwX7JCdzajYtaeiUZ1AyezznVOGdShFxQGr7H0m
 +Usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720173149; x=1720777949;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MIlgI7ATvfa56t24WLZv2N3r+FaRSfcqNDIIELB3K9k=;
 b=ct14/FfyFVhh7X2RZjfq8E1qqQHVRfxlcrtxh63IAXfPyd72PouCXg5punAatu+P9P
 t/+CyNkQP8FVY749wOMXQNxhe3H2RI4W3++BPQ9TzEW+AG1EIs9lJl1jd8lQGm0O+g6R
 LGAfMjCNhYnqn8zJC3y4ZorKGccnUptA90yoceYC7oqZSrCG43tRpqiggpH3VyCmLJuH
 xUvOybWj+VNmXvxCSu7aDpeLXrOxybbIs64VyfUyGdGfI+o0QifBZaiC9YizDeYimWhO
 0zWimNxYVvfhpyw/E1vOJ3gesg9EtDF5vpxCp0kXZ/4EqTupWOM0SXEU70F6SwHqLa6K
 3mBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNj/Yteap+X2s2LeZpZHoKpnLTFkqcAZOg5MSSdBSCWr1r+QRA1nvrlvOdvsdOpvvVGlEZO0dvp0jo/nwlbj7DIyo328LpUtMrzzUw+1GLiJE0NDlmjGy/
X-Gm-Message-State: AOJu0YxncKvOCMQb+/D6BmvT5xX8/mXfEfnjHKCOlGSYKloNB4F5BNPw
 5nMUTDtajYdCylxtDsqN4n0YwMZ80vCHt7kyNWANncz4eiCag10hVmetQ1daOx6y8sPNZIYtWvZ
 n
X-Google-Smtp-Source: AGHT+IFYdBqLIR/9JTaFBXxYKpGPilE8OqK2LNR3FAi3qauVlnALpvoJQYHb02bjbWHRYQZYEu9JFQ==
X-Received: by 2002:a05:600c:4f92:b0:421:811b:b83e with SMTP id
 5b1f17b1804b1-4264b190342mr38378725e9.13.1720173148796; 
 Fri, 05 Jul 2024 02:52:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 02:52:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:38 +0200
MIME-Version: 1.0
Message-Id: <20240705-dt-bindings-thermal-allof-v1-19-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IKWqNRSn2TqsTvhE9YUkxh3RffPeZr4kiizlC1WJ2gI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8I0O7SO6MI6c2V1rHwrBXfHjz7fayuCjb2vT
 5QKRdVQc2eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCNAAKCRDBN2bmhouD
 129dEACM/HkC9ezNBuq2ZBGjirp82olHBKI4OVbJ44FpK6kq/5oyavQNNv67gqtmbfwg/+1ZfgT
 YmnKcEbPaJkGgTo4k3KgS0Xj0DMaW1N4/8uQs5Z5hf/Zw+00jqua2RzRe3K73g2qnBUklPFndd8
 LKWGCYDmTGc9Ff9Wu3djwXmslxZAwKUoZyjcePf96FAznTNekClRSLFF/hB1SwuEzRpVohjfC/b
 ROAqWk1gz3g4Z6GdGlwLdXvMv+l9/YveTMv9K5XlznFWOH7f2vqVGgS2YOV5GE2y04Qq0d/EanC
 4bYllTtcVtNocx4BTsncBd5bd+xL1U1Z065kx80B6hwx/+GkQ6bEB2yS7/5Rm5f73hIMVwuYOVg
 ws9M+6hb2Y3igrkvicIEKMzUfnSp0HKbLKhP1eNdQa8qL6GN5O9bvc8vaLzLvdQ6LVhNz2rIv4H
 PQOYt9hmIB3IuYBLwVl1SMNoj2srEJEZfGUuNI1+8K7cv0v4AXTPJtsfn1KbecOc3l3VIME3HNr
 +Kh53D6zCQYbFJy1RR0wAbp4f1RUGnv7uYaves2Cs3h1pu+8KdRct/Gq0+qEYKi9IPvetsAcOR/
 hgkko8KvukQb96Jaq51+8fMGnAYvOnMi5HfJTPBO+fnb1JpRVHwZhJmg2DOW618OIAd6wLAFdm3
 NRAZlVl0Ki08abQ==
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
Subject: [Linux-stm32] [PATCH RESEND 19/22] dt-bindings: thermal: ti,
 am654: reference thermal-sensor schema
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
 Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml b/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
index 7ed0abe9290f..16801aa78bc2 100644
--- a/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
@@ -9,6 +9,8 @@ title: Texas Instruments AM654 VTM (DTS)
 maintainers:
   - Keerthy <j-keerthy@ti.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: ti,am654-vtm
@@ -26,9 +28,8 @@ required:
   - compatible
   - reg
   - power-domains
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
