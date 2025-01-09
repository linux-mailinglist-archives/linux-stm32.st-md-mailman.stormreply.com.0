Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E5EA0821A
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2025 22:19:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19ACAC78011;
	Thu,  9 Jan 2025 21:19:19 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DB78C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2025 21:19:17 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5d3bdccba49so2097261a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Jan 2025 13:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1736457557; x=1737062357;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kMDwINMgp57JdnWDRo35bVQVHIu764enuWXH+P8QtD8=;
 b=rFLxaFNdujD1Ed6P4BOpN+itX06uPO0nZj0d7KtNZ0icIPKuTbqcUhkhrVYD8B4oFe
 R8HJV5WNvqfBKzOvo9VS7YAP3NxNwMCYkvOPpjv9ob/O4W4r4VNOswB5Jae5Ffxvq4b9
 DO4+xYQXMOVo/mVyFR+HFaN+kEb+GcpKJPwTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736457557; x=1737062357;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kMDwINMgp57JdnWDRo35bVQVHIu764enuWXH+P8QtD8=;
 b=eCSRhXgi5UW/M1vQpQ7ttC2Sm7/4K8hI2D+SeGfm00nKnUWtJrB0DK0ay8ksUKmL4/
 InH6BQ9lMbZhZOkl2qJU+nw3ULic0CLtnGBfHABDRL0CkjrywJSKOKJ5YdXRgfL4Rzqx
 y4ht6iCK5f9hvy1OGf21vDD9W2MFZpjWgxFD/pu5nDWobY9sXIhxE1kSwTSx56242t1z
 OK168/lYNElkBkZD0NcGaIHNR0hPttgNPOU01rHD03NK3IEWkIU9JqX434wARk3OYrDe
 5NCaYNLr+m5YfPCnojfGb6Bf0cq3AhMOCJNqY/sfkeTkyiL3SUV19c2M0ujxSsRCvr4A
 jn/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSklnl5Va9Vh9rkkeCU8SE3I+8ZLHKQdG7nZHqrmEGj06L7Oiz6uQim7efSMNm/AuzLQjLAYco534XGw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwOwGBcA4ivnHCAwL/AfTvr0EZKVqNVyIYw0/0NFwaiy7h2hITj
 69V0U0Rhfr41RtlGcARIjrj6AQLVDzIiVGbaFOQZFgLXSL6oamHB+etcmICuxDM=
X-Gm-Gg: ASbGncsNWKGn73tB9sqStpYIUl+MTDv9eVg+pAL8b00nfWDjP1ZKJbCwRpmx+ueCw90
 qVAd86tiMCiai5/SUW9BEFzW8dcC80LUFUNooF9qWvjJQbyO5YuOo1NUh+9XLkX+/ZI0dPxE9Tq
 LyHBZF5+/cglhMjopo+FYLtIzzQb6xINbs7y8QzvIG/4QUQqNgsCmeIEwxXoiJMWPV6RyHwRLU7
 ho0VpTlzUfUZhnwTPsJs9lB5ezbqSVLJsl3MTPanZFsoBNJXWQXsC2+tBGVLwdvuSSpKQEr9L/V
 Ojxx1DIALOkCXPOALE13lpGthg5TeltJ52DosUi/jeDTlhtbs1LHs2yZbH2Vrx/9tyEQXHEhfNl
 iIrAdBgpbJD81aoMwIw==
X-Google-Smtp-Source: AGHT+IHUAVP6+PgKfM9g4JVq2jFqpWDWI9WunzPqIfkbBNq/oJX0XMZspcKrfWFqNV5TF87Psj1xjg==
X-Received: by 2002:a05:6402:3225:b0:5d9:b8a:9e08 with SMTP id
 4fb4d7f45d1cf-5d972e1b768mr7727175a12.16.1736457556741; 
 Thu, 09 Jan 2025 13:19:16 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9900c4b56sm925567a12.32.2025.01.09.13.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 13:19:15 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Thu,  9 Jan 2025 22:18:28 +0100
Message-ID: <20250109211908.1553072-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
References: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/4] dt-bindings: clock: convert stm32 rcc
	bindings to json-schema
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

The patch converts st,stm32-rcc.txt to the JSON schema, but it does more
than that. The old bindings, in fact, only covered the stm32f{4,7}
platforms and not the stm32h7. Therefore, to avoid patch submission tests
failing, it was necessary to add the corresponding compatible (i. e.
st,stm32h743-rcc) and specify that, in this case, 3 are the clocks instead
of the 2 required for the stm32f{4,7} platforms.
Additionally, the old bindings made no mention of the st,syscfg property,
which is used by both the stm32f{4,7} and the stm32h7 platforms.

The patch also fixes the files referencing to the old st,stm32-rcc.txt.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

Changes in v2:
- Fixup patches:
  2/6 dt-bindings: reset: st,stm32-rcc: update reference due to rename
  3/6 dt-bindings: clock: stm32fx: update reference due to rename
- Update the commit message
- Reduce the description section of the yaml file
- List the items with description for the clocks property
- Use only one example
- Rename rcc to clock-controller@58024400 for the node of the example

 .../bindings/clock/st,stm32-rcc.txt           | 138 ------------------
 .../bindings/clock/st,stm32-rcc.yaml          | 111 ++++++++++++++
 .../bindings/reset/st,stm32-rcc.txt           |   2 +-
 include/dt-bindings/clock/stm32fx-clock.h     |   2 +-
 4 files changed, 113 insertions(+), 140 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml

diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.txt b/Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
deleted file mode 100644
index cfa04b614d8a..000000000000
--- a/Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
+++ /dev/null
@@ -1,138 +0,0 @@
-STMicroelectronics STM32 Reset and Clock Controller
-===================================================
-
-The RCC IP is both a reset and a clock controller.
-
-Please refer to clock-bindings.txt for common clock controller binding usage.
-Please also refer to reset.txt for common reset controller binding usage.
-
-Required properties:
-- compatible: Should be:
-  "st,stm32f42xx-rcc"
-  "st,stm32f469-rcc"
-  "st,stm32f746-rcc"
-  "st,stm32f769-rcc"
-
-- reg: should be register base and length as documented in the
-  datasheet
-- #reset-cells: 1, see below
-- #clock-cells: 2, device nodes should specify the clock in their "clocks"
-  property, containing a phandle to the clock device node, an index selecting
-  between gated clocks and other clocks and an index specifying the clock to
-  use.
-- clocks: External oscillator clock phandle
-  - high speed external clock signal (HSE)
-  - external I2S clock (I2S_CKIN)
-
-Example:
-
-	rcc: rcc@40023800 {
-		#reset-cells = <1>;
-		#clock-cells = <2>
-		compatible = "st,stm32f42xx-rcc", "st,stm32-rcc";
-		reg = <0x40023800 0x400>;
-		clocks = <&clk_hse>, <&clk_i2s_ckin>;
-	};
-
-Specifying gated clocks
-=======================
-
-The primary index must be set to 0.
-
-The secondary index is the bit number within the RCC register bank, starting
-from the first RCC clock enable register (RCC_AHB1ENR, address offset 0x30).
-
-It is calculated as: index = register_offset / 4 * 32 + bit_offset.
-Where bit_offset is the bit offset within the register (LSB is 0, MSB is 31).
-
-To simplify the usage and to share bit definition with the reset and clock
-drivers of the RCC IP, macros are available to generate the index in
-human-readble format.
-
-For STM32F4 series, the macro are available here:
- - include/dt-bindings/mfd/stm32f4-rcc.h
-
-Example:
-
-	/* Gated clock, AHB1 bit 0 (GPIOA) */
-	... {
-		clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOA)>
-	};
-
-	/* Gated clock, AHB2 bit 4 (CRYP) */
-	... {
-		clocks = <&rcc 0 STM32F4_AHB2_CLOCK(CRYP)>
-	};
-
-Specifying other clocks
-=======================
-
-The primary index must be set to 1.
-
-The secondary index is bound with the following magic numbers:
-
-	0	SYSTICK
-	1	FCLK
-	2	CLK_LSI		(low-power clock source)
-	3	CLK_LSE		(generated from a 32.768 kHz low-speed external
-				 crystal or ceramic resonator)
-	4	CLK_HSE_RTC	(HSE division factor for RTC clock)
-	5	CLK_RTC		(real-time clock)
-	6	PLL_VCO_I2S	(vco frequency of I2S pll)
-	7	PLL_VCO_SAI	(vco frequency of SAI pll)
-	8	CLK_LCD		(LCD-TFT)
-	9	CLK_I2S		(I2S clocks)
-	10	CLK_SAI1	(audio clocks)
-	11	CLK_SAI2
-	12	CLK_I2SQ_PDIV	(post divisor of pll i2s q divisor)
-	13	CLK_SAIQ_PDIV	(post divisor of pll sai q divisor)
-
-	14	CLK_HSI		(Internal ocscillator clock)
-	15	CLK_SYSCLK	(System Clock)
-	16	CLK_HDMI_CEC	(HDMI-CEC clock)
-	17	CLK_SPDIF	(SPDIF-Rx clock)
-	18	CLK_USART1	(U(s)arts clocks)
-	19	CLK_USART2
-	20	CLK_USART3
-	21	CLK_UART4
-	22	CLK_UART5
-	23	CLK_USART6
-	24	CLK_UART7
-	25	CLK_UART8
-	26	CLK_I2C1	(I2S clocks)
-	27	CLK_I2C2
-	28	CLK_I2C3
-	29	CLK_I2C4
-	30	CLK_LPTIMER	(LPTimer1 clock)
-	31	CLK_PLL_SRC
-	32	CLK_DFSDM1
-	33	CLK_ADFSDM1
-	34	CLK_F769_DSI
-)
-
-Example:
-
-	/* Misc clock, FCLK */
-	... {
-		clocks = <&rcc 1 STM32F4_APB1_CLOCK(TIM2)>
-	};
-
-
-Specifying softreset control of devices
-=======================================
-
-Device nodes should specify the reset channel required in their "resets"
-property, containing a phandle to the reset device node and an index specifying
-which channel to use.
-The index is the bit number within the RCC registers bank, starting from RCC
-base address.
-It is calculated as: index = register_offset / 4 * 32 + bit_offset.
-Where bit_offset is the bit offset within the register.
-For example, for CRC reset:
-  crc = AHB1RSTR_offset / 4 * 32 + CRCRST_bit_offset = 0x10 / 4 * 32 + 12 = 140
-
-example:
-
-	timer2 {
-		resets	= <&rcc STM32F4_APB1_RESET(TIM2)>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
new file mode 100644
index 000000000000..779e547700be
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/st,stm32-rcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 Reset Clock Controller
+
+maintainers:
+  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
+
+description: |
+  The RCC IP is both a reset and a clock controller.
+  The reset phandle argument is the bit number within the RCC registers bank,
+  starting from RCC base address.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: st,stm32f42xx-rcc
+          - const: st,stm32-rcc
+      - items:
+          - enum:
+              - st,stm32f469-rcc
+          - const: st,stm32f42xx-rcc
+          - const: st,stm32-rcc
+      - items:
+          - const: st,stm32f746-rcc
+          - const: st,stm32-rcc
+      - items:
+          - enum:
+              - st,stm32f769-rcc
+          - const: st,stm32f746-rcc
+          - const: st,stm32-rcc
+      - items:
+          - const: st,stm32h743-rcc
+          - const: st,stm32-rcc
+
+  reg:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 1
+
+  '#clock-cells':
+    enum: [1, 2]
+
+  clocks:
+    minItems: 2
+    maxItems: 3
+
+  st,syscfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to system configuration controller. It can be used to control the
+      power domain circuitry.
+
+required:
+  - compatible
+  - reg
+  - '#reset-cells'
+  - '#clock-cells'
+  - clocks
+  - st,syscfg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32h743-rcc
+    then:
+      properties:
+        '#clock-cells':
+          const: 1
+          description: |
+            The clock index for the specified type.
+        clocks:
+          items:
+            - description: high speed external (HSE) clock input
+            - description: low speed external (LSE) clock input
+            - description: Inter-IC sound (I2S) clock input
+    else:
+      properties:
+        '#clock-cells':
+          const: 2
+          description: |
+            - The first cell is the clock type, possible values are 0 for
+              gated clocks and 1 otherwise.
+            - The second cell is the clock index for the specified type.
+        clocks:
+          items:
+            - description: high speed external (HSE) clock input
+            - description: Inter-IC sound (I2S) clock input
+
+additionalProperties: false
+
+examples:
+  # Reset and Clock Control Module node:
+  - |
+    clock-controller@58024400 {
+        compatible = "st,stm32h743-rcc", "st,stm32-rcc";
+        reg = <0x58024400 0x400>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        clocks = <&clk_hse>, <&clk_lse>, <&clk_i2s>;
+        st,syscfg = <&pwrcfg>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/reset/st,stm32-rcc.txt b/Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
index 01db34375192..384035e8e60b 100644
--- a/Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
+++ b/Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
@@ -3,4 +3,4 @@ STMicroelectronics STM32 Peripheral Reset Controller
 
 The RCC IP is both a reset and a clock controller.
 
-Please see Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
+Please see Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
diff --git a/include/dt-bindings/clock/stm32fx-clock.h b/include/dt-bindings/clock/stm32fx-clock.h
index e5dad050d518..b6ff9c68cb3f 100644
--- a/include/dt-bindings/clock/stm32fx-clock.h
+++ b/include/dt-bindings/clock/stm32fx-clock.h
@@ -10,7 +10,7 @@
  * List of clocks which are not derived from system clock (SYSCLOCK)
  *
  * The index of these clocks is the secondary index of DT bindings
- * (see Documentation/devicetree/bindings/clock/st,stm32-rcc.txt)
+ * (see Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml)
  *
  * e.g:
 	<assigned-clocks = <&rcc 1 CLK_LSE>;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
