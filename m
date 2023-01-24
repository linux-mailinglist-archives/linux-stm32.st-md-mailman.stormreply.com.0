Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3F56793DD
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 10:19:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 611FCC65E72;
	Tue, 24 Jan 2023 09:19:48 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D224C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 09:19:47 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id g10so10915913wmo.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 01:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5uL5KX+lq7Bh76mZga/YGxKAjqZK+AdDiUOgEFy1RwQ=;
 b=CqVtGiLsIQtBM5HC7e4JAs5ne7xOL0h7GAY2cRHqngOX6tAotoI4tdflCP332C9T1q
 ebm2ELFU1+Ug/a1y0TeWu9aGwQiLKKnWDSIEmwUZRAghplQkjWEQxaYBf5Ey4BE2k4jJ
 VK46ot2pwa00RBXGvfZYZg3SMXzA0Lh1pbW8jgf1rXVEeNuSnOQxiRAKaGRyvpkoNrei
 OJxD/0sU9CSdaNJ+wGU8nRten2J4szDCSGuQdFgJyR2vdcLR496YmAH/kCqa87QhjOTP
 DSyxz9sKiuG3/zXclPNhK65pMK0GXgVEoYgr0c13Sw0UIyWtsIz+fvqnELnsRql27WCf
 Jpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5uL5KX+lq7Bh76mZga/YGxKAjqZK+AdDiUOgEFy1RwQ=;
 b=2e+BIR0LtZDPzBmCcvjsOyP9ZFBonBMvDP/pYZiBgfzZterKUbfJliXN2cIqvF24DO
 fYpeK0nsOqmCEWVE03x9RZTqvaLsqi7WTKtY7WPInWQYsm0ZxQK/jfPiAFMZIZcF13GC
 bMEMzN6zuWheV3clOP9Vrpw8gSMcazclBYPIOKJRszZfweGMXzhzqUIaeeTRBdkpV3N+
 H39TqQvHHjjbecxfPc1i/qJuLxTuq8eYTMC5UotwPGOLlogUMVm3SK7BQVCC3wnh+BJS
 0NQPpTbZxvCqDjAyft6ODx/92JbMIGTQ6MiazYx2puZ6BtqgoJa8AJnllQO+9NAdyf6Y
 Xb1w==
X-Gm-Message-State: AFqh2kpkGiR5wvFDKSQ8av14I+l/guntSIwoGes+01TqC1yNoBLD5duJ
 JnvWeKgtK1EM85eH0gJIVkAN1A==
X-Google-Smtp-Source: AMrXdXt6ZXjN2UR9CDMMCyR/xCneinHGOcEykSqybnBEASsnB1wxAPHlJm08OnK7Not9iguLyjZzVA==
X-Received: by 2002:a1c:7216:0:b0:3cf:614e:b587 with SMTP id
 n22-20020a1c7216000000b003cf614eb587mr27496678wmc.26.1674551987275; 
 Tue, 24 Jan 2023 01:19:47 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 i22-20020a05600c355600b003a84375d0d1sm13672242wmq.44.2023.01.24.01.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 01:19:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michal Simek <michal.simek@xilinx.com>, Chester Lin <clin@suse.com>,
 Fugang Duan <fugang.duan@nxp.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Pragnesh Patel <pragnesh.patel@sifive.com>,
 Le Ray <erwan.leray@foss.st.com>, Peter Korsgaard <jacmet@sunsite.dk>,
 Tomer Maimon <tmaimon77@gmail.com>, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Date: Tue, 24 Jan 2023 10:19:09 +0100
Message-Id: <20230124091916.45054-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michal Simek <michal.simek@amd.com>
Subject: [Linux-stm32] [PATCH v2 05/12] dt-bindings: serial: cdsn,
	uart: add power-domains
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

Few Xilinx DTS have power domains in serial node:

  zynqmp-zc1232-revA.dtb: serial@ff000000: Unevaluated properties are not allowed ('power-domains' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Michal Simek <michal.simek@amd.com>
---
 .../devicetree/bindings/serial/cdns,uart.yaml   | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
index 0c118d5336cc..38925b79cb38 100644
--- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
@@ -9,9 +9,6 @@ title: Cadence UART Controller
 maintainers:
   - Michal Simek <michal.simek@xilinx.com>
 
-allOf:
-  - $ref: serial.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -46,6 +43,9 @@ properties:
       port does not use this pin.
     type: boolean
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -53,6 +53,17 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - $ref: serial.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: cdns,uart-r1p8
+    then:
+      properties:
+        power-domains: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
