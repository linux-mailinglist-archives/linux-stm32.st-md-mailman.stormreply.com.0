Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B536646CD0
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Dec 2022 11:31:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52096C65E70;
	Thu,  8 Dec 2022 10:31:42 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60E31C65E6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Dec 2022 10:31:40 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id cf42so1394798lfb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Dec 2022 02:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1+xgakROSa2tyyNfQUbDwsLUYdUS/rSfQ5IgxtrQvUM=;
 b=LWYhpiQGZcljQmKqXE0nzGnQ+/Xt4SK3zRwV0uDp4Sa5q5GaZMEb3tKeG3bFvYMrFK
 MrGzfhJ3kGPa856SsR3tflHMiU4nByAp3ECuciU5Q7abOa365oluhz3zmOGT42nTVhye
 z/9lX8nMtCI58JXJiBmEM0BM9e39Hy1X/6oygVowka6jOiEQH7kJ3hhED5wYhwC5slB4
 pkklhnpJ5g+7YI09TdUX7o/sk/X/vEd8XR8mLJpcvm1GyVFwPYBxsBTu4r0K/+HF5hRK
 GrT4yDKldhHuxLF+Jd3RigIXC+Rqykt9qV3sAnUIIGevqnA+MrCspDIyL5MmB99NDBdw
 6bCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1+xgakROSa2tyyNfQUbDwsLUYdUS/rSfQ5IgxtrQvUM=;
 b=g8iko7Ybu459S5+/LrTd++eB1Z0ZOehotsBYiTXh/YXIRTmPRx6xiwh4hiAnqYthZs
 FtLOJQlePYEOuxFijb73FdXQ6hQT9U4GcNn6tTbwySY+qBNij4MLE7RSNzguhmhBhJWR
 xCOtCHJHgGFDANjNZhGQkfOA25yKOzANMUsZf5Xms9AhnwEW55KhsBbOkM4fQc+YTHFE
 7XRgMtc8+oSTXLWZxvXM1x+d2RBkTKLwMZqS5DaUIZPiTZCPYU2oQKClPGMDPrrA2uqY
 eqnEYSgk3PRMNnl+BcojEGtoeZH9NpSrLNwjPlGvIZTO6J8NoQWKgUr8P7Vl7PgjNL2G
 uT+w==
X-Gm-Message-State: ANoB5pn0v0drOCWRwMM5qTFQkBLNBdnQ75iTl5a5dekW+U39c6gNioCF
 pgiKFwwXV9oo/pZLGARtBbCumw==
X-Google-Smtp-Source: AA0mqf7IIpnAZdER30ZNR4/8dvaWUTKWeHA+46Hr5MPcrEEGtcgkvblAk2HVaimF1GRTwBTFp6kXeA==
X-Received: by 2002:ac2:4ac8:0:b0:4b3:ac9d:9354 with SMTP id
 m8-20020ac24ac8000000b004b3ac9d9354mr30478020lfp.85.1670495500019; 
 Thu, 08 Dec 2022 02:31:40 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a2eb0f2000000b00279e5247dabsm1699580ljl.18.2022.12.08.02.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 02:31:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Joe Tessler <jrt@google.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Thu,  8 Dec 2022 11:31:13 +0100
Message-Id: <20221208103115.25512-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
References: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v4 7/9] media: dt-bindings: cec-gpio: convert
	to DT schema
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

Convert HDMI CEC GPIO bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v3:
1. Add missing SPDX.
---
 .../devicetree/bindings/media/cec-gpio.txt    | 42 -----------
 .../bindings/media/cec/cec-gpio.yaml          | 74 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 75 insertions(+), 43 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/cec-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/media/cec/cec-gpio.yaml

diff --git a/Documentation/devicetree/bindings/media/cec-gpio.txt b/Documentation/devicetree/bindings/media/cec-gpio.txt
deleted file mode 100644
index 47e8d73d32a3..000000000000
--- a/Documentation/devicetree/bindings/media/cec-gpio.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-* HDMI CEC GPIO driver
-
-The HDMI CEC GPIO module supports CEC implementations where the CEC line
-is hooked up to a pull-up GPIO line and - optionally - the HPD line is
-hooked up to another GPIO line.
-
-Please note: the maximum voltage for the CEC line is 3.63V, for the HPD and
-5V lines it is 5.3V. So you may need some sort of level conversion circuitry
-when connecting them to a GPIO line.
-
-Required properties:
-  - compatible: value must be "cec-gpio".
-  - cec-gpios: gpio that the CEC line is connected to. The line should be
-    tagged as open drain.
-
-If the CEC line is associated with an HDMI receiver/transmitter, then the
-following property is also required:
-
-  - hdmi-phandle - phandle to the HDMI controller, see also cec.txt.
-
-If the CEC line is not associated with an HDMI receiver/transmitter, then
-the following property is optional and can be used for debugging HPD changes:
-
-  - hpd-gpios: gpio that the HPD line is connected to.
-
-This property is optional and can be used for debugging changes on the 5V line:
-
-  - v5-gpios: gpio that the 5V line is connected to.
-
-Example for the Raspberry Pi 3 where the CEC line is connected to
-pin 26 aka BCM7 aka CE1 on the GPIO pin header, the HPD line is
-connected to pin 11 aka BCM17 and the 5V line is connected to pin
-15 aka BCM22 (some level shifter is needed for the HPD and 5V lines!):
-
-#include <dt-bindings/gpio/gpio.h>
-
-cec-gpio {
-	compatible = "cec-gpio";
-	cec-gpios = <&gpio 7 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
-	hpd-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;
-	v5-gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
-};
diff --git a/Documentation/devicetree/bindings/media/cec/cec-gpio.yaml b/Documentation/devicetree/bindings/media/cec/cec-gpio.yaml
new file mode 100644
index 000000000000..64d7ec057672
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/cec/cec-gpio.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/cec/cec-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HDMI CEC GPIO
+
+maintainers:
+  - Hans Verkuil <hverkuil-cisco@xs4all.nl>
+
+description: |
+  The HDMI CEC GPIO module supports CEC implementations where the CEC line is
+  hooked up to a pull-up GPIO line and - optionally - the HPD line is hooked up
+  to another GPIO line.
+
+  Please note:: the maximum voltage for the CEC line is 3.63V, for the HPD and
+  5V lines it is 5.3V. So you may need some sort of level conversion
+  circuitry when connecting them to a GPIO line.
+
+properties:
+  compatible:
+    const: cec-gpio
+
+  cec-gpios:
+    maxItems: 1
+    description:
+      GPIO that the CEC line is connected to. The line should be tagged as open
+      drain.
+
+  hpd-gpios:
+    maxItems: 1
+    description:
+      GPIO that the HPD line is connected to.  Used for debugging HPD changes
+      when the CEC line is not associated with an HDMI receiver/transmitter.
+
+  v5-gpios:
+    maxItems: 1
+    description:
+      GPIO that the 5V line is connected to.  Used for debugging changes on the
+      5V line.
+
+required:
+  - compatible
+  - cec-gpios
+
+allOf:
+  - $ref: cec-common.yaml#
+  - if:
+      required:
+        - hdmi-phandle
+    then:
+      properties:
+        hpd-gpios: false
+
+  - if:
+      required:
+        - hpd-gpios
+    then:
+      properties:
+        hdmi-phandle: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    cec {
+        compatible = "cec-gpio";
+        cec-gpios = <&gpio 7 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+        hpd-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;
+        v5-gpios = <&gpio 22 GPIO_ACTIVE_HIGH>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 05acbaecef52..197351d3bb57 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4848,7 +4848,7 @@ L:	linux-media@vger.kernel.org
 S:	Supported
 W:	http://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/cec-gpio.txt
+F:	Documentation/devicetree/bindings/media/cec/cec-gpio.yaml
 F:	drivers/media/cec/platform/cec-gpio/
 
 CELL BROADBAND ENGINE ARCHITECTURE
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
