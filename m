Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 247EF9102EA
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 13:35:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1D17C712A2;
	Thu, 20 Jun 2024 11:35:20 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C082C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 11:35:20 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2ec3f875e68so8840481fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 04:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718883319; x=1719488119;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9RdxrQ5ek7BKyD1Q5GyGk/KJKbJ7uIbq14OZ4VVg0Iw=;
 b=utd9zV3vE2xke8ihfdcYvIYlQ0/TzTYcYGucrv3d7V1w5T9TnLnr7Ak5OKfuCH3baU
 xAhIMkcO3mSPHWWlrxJv7c0u0aELzd8G38nCxUKUK1d4txsWXWeqKSVuV4DUBpec63U5
 n3V5us9PLSIe6Zw6motkgCthypth0I2CqWQjKmnfF4ODcArt+r4Qh3+++peU924Ms+L1
 3DCYM1IOAj2MtVuhY2Jw4LCFYcfZRxLlf25ImmRCGHecpV9ktqarC1vqaO7xiz/NF4NR
 cOKBV6rPTexKFtpw07IVnrVAKBcGSTKKKb/FPZTQ8vbpPzi+yo+hYHOCgs7FLq757oeB
 475Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718883319; x=1719488119;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9RdxrQ5ek7BKyD1Q5GyGk/KJKbJ7uIbq14OZ4VVg0Iw=;
 b=IBk/AXbO6fYi1bgFbvxpsJUSEXTVsd3udgEN8gWsA0guVK/UlIBBu6Fw24WS/3/v01
 JrU2uK2H8SjXvRlihVMa8790Obiqynp87lQ7BtaCc/jqno2UUkEaHRME8mhg3TXnJEXD
 9tdJiEeyZX4gdDZ6gO3DjCczDeEmjNaQKiRhmAZJ47qQdYxmPCZEvb6Q446iN57hCoW5
 z2GJAP+m6/U7hZ2IH5qExNpecajXaVXk6woYWbkidOmg9X4oORZNAJlokernU4c4aiw4
 jtTmJwxbAtTSq0VyB5sMIBe86NIr+1rH+EBkOiiO+ug0LQMRyiuFHAtiT4lrbA/mDxmp
 D/ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhG8MPxLV1KRjATYM2dMdsFgxMqW6QxYQxsSRPK7sKdwhiJsgMf7HOtkdYsVMJSaGKjztooM3bytlBzme636SaSKmUGQ6tk2WYypQajj92Aclbx3BcvJ0J
X-Gm-Message-State: AOJu0Yx2RDzRPw6yqgugdqTSoL0hTe9Xz8o3g6aUhaKKP2QffMW63U/l
 B+9HYDwpJChgRP1WJR2dmCUXkD3rmB85ZK+3JW326y1spNe5OvP3YpzkmzebKlE=
X-Google-Smtp-Source: AGHT+IFq9QPiqdW/LV2Lp4ipmnGkGcnbeE41LGRET4efCA18VuEBGazMmSwAgyABOsGpRfVB16xuXQ==
X-Received: by 2002:a05:6512:32b1:b0:52c:99e5:6880 with SMTP id
 2adb3069b0e04-52ccaa36930mr3166877e87.33.1718883319455; 
 Thu, 20 Jun 2024 04:35:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42471e6623fsm49708985e9.1.2024.06.20.04.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 04:35:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 20 Jun 2024 13:34:54 +0200
MIME-Version: 1.0
Message-Id: <20240620-dt-bindings-i2c-clean-v1-6-3a1016a95f9d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2120;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=se0qu2ScDHev5e2u9T2lUYbcxySx/dcEaULZrF/4POM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmdBPjSq+rIwMEv+nxqFX6eolXOSM2y3OaG46ld
 hES3qoe0I6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnQT4wAKCRDBN2bmhouD
 18ktEACWRnxxzFEN5hoHHubQp9ltuAKuiTii5YSgG71yB9jinAqHGF3jmQZasCvFKp/Y+C6XSE4
 7HbfKJqc6iVJUTmJ9IHYa0FDAoP6myAlMkuf4z8mBw8uodhtnA4FPsPAgnKnmpN7CMUkfjsO1IB
 RfuBQlifdmWFTp2bvqqIwWSNTjROsr8uSHUki+Ww8DgzlsWkQ7HfMzwBy4idLIeUkzNtuRb0Rfq
 0QuXu7sAiFPaq4i+V7Z6sDKJckvnHTx5zEpVJv8z2X/D1Z7+jEfByDjXYftdHKCOvK6lWm+qYZc
 VEtxStj3nxMhPO232xFXoij7eu8UKvrFsDseAZkBU/Vq7GCyyhj8SGDlfTlwG9zQN82lD0W8Xlx
 HeX/+LtGE2bjCXPKaMPWGMT9t2tdwsmqAbXgcflvypg+KmDe+kg60qizj/VNKa8JsHWPCLaHpxW
 txJs+EQ+emVa80XM3ga3vvvcum1STbUNjVEDZjuTF3pUGqCyS3IL4fUPjZEXewYueHwtW5RZSTH
 M4z27wsRgrMUTClUO8SVOrHJykSSLhOHYirJ6JupXaT0ju6kviSTzxtG9cYYcu2JJiB/qzGJT07
 3vSZBQyonxBRu0eI7T2ALDo/VeTLqrT166RyOQGK75poPywXVfTIR1nkcED+fABKAkI0znrkI8t
 30sKJbP5RtX6h1A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 6/7] dt-bindings: i2c: ti,
 omap4: reference i2c-controller.yaml schema
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

Reference the core I2C controller schema to properly define common
properties.  This allows to drop several (now redundant) properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml      | 52 +++++++++-------------
 1 file changed, 20 insertions(+), 32 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
index 781108ae1ce3..c9d1030e9857 100644
--- a/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
@@ -37,16 +37,8 @@ properties:
   clock-names:
     const: fck
 
-  clock-frequency: true
-
   power-domains: true
 
-  "#address-cells":
-    const: 1
-
-  "#size-cells":
-    const: 0
-
   ti,hwmods:
     description:
       Must be "i2c<n>", n being the instance number (1-based).
@@ -55,38 +47,34 @@ properties:
     $ref: /schemas/types.yaml#/definitions/string
     deprecated: true
 
-# subnode's properties
-patternProperties:
-  "@[0-9a-f]+$":
-    type: object
-    description:
-      Flash device uses the below defined properties in the subnode.
-
 required:
   - compatible
   - reg
   - interrupts
 
-additionalProperties: false
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
 
-if:
-  properties:
-    compatible:
-      enum:
-        - ti,omap2420-i2c
-        - ti,omap2430-i2c
-        - ti,omap3-i2c
-        - ti,omap4-i2c
+  - if:
+      properties:
+        compatible:
+          enum:
+            - ti,omap2420-i2c
+            - ti,omap2430-i2c
+            - ti,omap3-i2c
+            - ti,omap4-i2c
 
-then:
-  properties:
-    ti,hwmods:
-      items:
-        - pattern: "^i2c([1-9])$"
+    then:
+      properties:
+        ti,hwmods:
+          items:
+            - pattern: "^i2c([1-9])$"
 
-else:
-  properties:
-    ti,hwmods: false
+    else:
+      properties:
+        ti,hwmods: false
+
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
