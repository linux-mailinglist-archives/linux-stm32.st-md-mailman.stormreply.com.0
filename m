Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE316F9BC2
	for <lists+linux-stm32@lfdr.de>; Sun,  7 May 2023 23:19:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91168C6A60C;
	Sun,  7 May 2023 21:19:24 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25F6AC6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 May 2023 21:19:23 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2ac81d2bfbcso40747491fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 07 May 2023 14:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683494362; x=1686086362;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HwevgKM2xEEUV3PSktWUIPbGHR7oQ/3U2UMCdx8DSQw=;
 b=s0U+zU8aQqPN7MZYfmfTf7ia97xzp/vNrAFvrs+ppmfmgP3K9zLYYvuAWKWhKEPAu6
 1q4NiExKLniEtMhN93KP0TJGpIPG0pqwBBojEJrvuRIMQxxWCpXhzrWzS4zIzhy8mY5t
 U5jFWeg20HhB2N0RhkyS1T4WqTOodZtbPuXcnCpXoohlW0t3UcLmDeye3edPTYISperg
 bcU48JJRSmNFDoBnxG1uHVJvF95iiSCWNwyBFB62p/gsZLe8tEkfh8mVahz0kaWMwFkM
 SR1aR+4tIHK2MMhOGUV0ju3EOAmyf/qKayh6jmd6zbtfrLTZrxLKRgd4F7atNyx4S+YT
 36dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683494362; x=1686086362;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HwevgKM2xEEUV3PSktWUIPbGHR7oQ/3U2UMCdx8DSQw=;
 b=QPoCM/lRC7v8GhiL8sL9URLjujJn1iHYUJCz2dss9S44PB283TOQns5GcVysPJ8l4q
 AWDKtUuUuvoduttTrENPBrU1CAKe+ad7VjDsrZLnATk+7p7BMNcKuNl4wK8q6F5pVX0A
 LhIezHflgOys4xz6NnyfDSffGr6Yzn00rc1QLHhvu1+oAIfO1HHh2QyqkwSZ2+9Vl5Qf
 8VLcjILFsEvENMYKxt6S/xfBOcz0zF4sxamV7Xb5xofFykFNiH13LPgxTWdToQHHRXjn
 h2VmkTZqn8MNoPRrs/Ms9Y+tc48LgTmmMYB3pC1Oh7/FA+kgbZYVl+WoTkgQ3WexDhT6
 zMzQ==
X-Gm-Message-State: AC+VfDxLqw13xBYryrDYdkTqq00J2zYzZmJ0uqQx+0Y31/I4n8HVW6n+
 P0/g4rkFcLIFD4kW7MdnC+G0ng==
X-Google-Smtp-Source: ACHHUZ6ZmVkOzsWwDj+8CfTHL7QUXKzzOW6RwAWZoKAFr8SQTCmMN/kOl3Lxqsmd61vvFgbizYRcdA==
X-Received: by 2002:ac2:4310:0:b0:4ef:f017:e52 with SMTP id
 l16-20020ac24310000000b004eff0170e52mr2042177lfh.5.1683494362323; 
 Sun, 07 May 2023 14:19:22 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 c27-20020ac244bb000000b004f195cc3918sm623424lfm.176.2023.05.07.14.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 14:19:21 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 07 May 2023 23:19:19 +0200
MIME-Version: 1.0
Message-Id: <20230426-stmpe-dt-bindings-v3-1-eac1d736e488@linaro.org>
References: <20230426-stmpe-dt-bindings-v3-0-eac1d736e488@linaro.org>
In-Reply-To: <20230426-stmpe-dt-bindings-v3-0-eac1d736e488@linaro.org>
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
Subject: [Linux-stm32] [PATCH v3 1/2] dt-bindings: gpio: Add STMPE YAML DT
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
ChangeLog v2->v3:
- Use a compact hog node schema backed by the standard hog
  schema.
ChangeLog v1->v2:
- New patch split off from the MFD patch.
---
 .../devicetree/bindings/gpio/st,stmpe-gpio.yaml    | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
new file mode 100644
index 000000000000..41aa82b8b3eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
@@ -0,0 +1,51 @@
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
+    required:
+      - gpio-hog
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
