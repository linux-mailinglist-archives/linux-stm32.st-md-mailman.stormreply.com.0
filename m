Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D5A6EF34C
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Apr 2023 13:21:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72A9FC6907C;
	Wed, 26 Apr 2023 11:21:44 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EFBCC6907C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Apr 2023 11:21:42 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-4f004943558so787569e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Apr 2023 04:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682508102; x=1685100102;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Zyn3pWh1I5zYmXKJZnDWojm/WjqJCfT4hRVyzg3c8zM=;
 b=AL84eNVXhM+h+pb78WkGyas5/MFVD8cGu6qX5aqC4mJg0AkPLmvvlXEdas3556gk2k
 qgaMsEvIrooQhgFM3M7P9FzkTxd2YEACMufo5FCNMh00HhP6zjXxMmwDeLIOt3jiueLT
 Yu9lCfLko3eN+3viE/7nYNe7N2QHjNY92YXAd04avgqgUFB/iLT0/AIJvNtd9PqWwlO4
 3acOv6iSujIymNCpbCeIV7vw17pulTz/J4/VP1+G6MbDYsI8aVl96IIfSSSdSBtHcYxU
 Fdn746aHI6yb5toQrKjt/6rcntmx4ojALZ5fCg1gXc50hq3+OLTtoGD/b2OfsB+E1Hcj
 V6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682508102; x=1685100102;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zyn3pWh1I5zYmXKJZnDWojm/WjqJCfT4hRVyzg3c8zM=;
 b=BdOhcp7QmrGhz7JAHgiuNPSCtUYLyIIUEpHWvmZ2PczF5pGhxcgwaboXAsatno6P81
 nNqUvyeMFCY8sIB9ZMGL/mk4B0Fzir5iq3PW7K/yE52eLcpIZCtGaEWUSEvPsVyRMdw7
 k5Nfft4m2WenVkFEntLu6IseIr6RdHZsqijdV18WMJU+32FkIpVgd/2zjDFSewLrigwF
 9aelv1U5yc099n7dfvcI9Et8fV3YiwhbzncGPn8KQ+Hm4+g3OWw2JlZOb9gaeb+CVSdl
 J5l82OwBlaqVfP5aeDJ9b6gpZdp0aIhzrL0HikkYryK2ouaS+y4/q4N1HvIUphOzvYMW
 5ILg==
X-Gm-Message-State: AAQBX9d+GjEzdVooqlQnqliIeGLR7eS5teMcSHpC21eLM1LoFKzEhGWV
 YnX47ZCUWCeQ/04alJgl7MoGXA==
X-Google-Smtp-Source: AKy350YhOl8LLm54rt/4YgIe3Ha5QTCl8gyTtf7aqKuYUiXyHktmWRGMYpRDOSjHD+nKNyCmwHspJg==
X-Received: by 2002:a19:ae0d:0:b0:4ef:d4d7:a9f4 with SMTP id
 f13-20020a19ae0d000000b004efd4d7a9f4mr4140058lfc.19.1682508101728; 
 Wed, 26 Apr 2023 04:21:41 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 u28-20020a056512041c00b004ec84d24818sm2453237lfk.282.2023.04.26.04.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 04:21:41 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Apr 2023 13:21:38 +0200
MIME-Version: 1.0
Message-Id: <20230426-stmpe-dt-bindings-v2-1-2f85a1fffcda@linaro.org>
References: <20230426-stmpe-dt-bindings-v2-0-2f85a1fffcda@linaro.org>
In-Reply-To: <20230426-stmpe-dt-bindings-v2-0-2f85a1fffcda@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
 Philippe Schenker <philippe.schenker@toradex.com>, 
 Stefan Agner <stefan@agner.ch>, Marek Vasut <marex@denx.de>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.12.1
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/2] dt-bindings: gpio: Add STMPE YAML DT
	schema
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

This adds a schema for the STMPE GPIO that while it is used a
lot in the kernel tree is anyway missing its bindings.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- New patch split off from the MFD patch.
---
 .../devicetree/bindings/gpio/st,stmpe-gpio.yaml    | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
new file mode 100644
index 000000000000..6e991ebbdf77
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/st,stmpe-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectonics Port Expander (STMPE) GPIO Block
+
+description: STMicroelectronics Port Expander (STMPE) is a series of slow
+  bus controllers for various expanded peripherals such as GPIO, keypad,
+  touchscreen, ADC, PWM or rotator. It can contain one or several different
+  peripherals connected to SPI or I2C. These bindings pertain to the
+  GPIO portions of these expanders.
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+properties:
+  compatible:
+    const: st,stmpe-gpio
+
+  "#gpio-cells":
+    const: 2
+
+  "#interrupt-cells":
+    const: 2
+
+  gpio-controller: true
+
+  interrupt-controller: true
+
+  st,norequest-mask:
+    description: A bitmask of GPIO lines that cannot be requested because for
+      for example not being connected to anything on the system
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+patternProperties:
+  "^.+-hog(-[0-9]+)?$":
+    type: object
+
+    properties:
+      gpio-hog: true
+      gpios: true
+      input: true
+      output-high: true
+      output-low: true
+      line-name: true
+
+    required:
+      - gpio-hog
+      - gpios
+
+additionalProperties: false
+
+required:
+  - compatible
+  - "#gpio-cells"
+  - "#interrupt-cells"
+  - gpio-controller
+  - interrupt-controller

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
