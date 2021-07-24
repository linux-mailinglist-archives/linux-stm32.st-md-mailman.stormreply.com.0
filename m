Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2FC3D4489
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Jul 2021 05:44:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 469C4C597AC;
	Sat, 24 Jul 2021 03:44:22 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A1BCC597AC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Jul 2021 03:44:20 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id t21so5175466plr.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jul 2021 20:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HIJcQQZ2vH+eFbl0b4W6tu/X9LzbnNwvqBiC4k0Fytc=;
 b=Rhy1OnFnUKa0pETJY0jQAisJa+DRiS52JW6k5vDI0UHWc2fPfyzOTD5AZaL23+kZ7l
 nZRoRZwbXBq0iY5q7NOk4qyYUZHzANGHCEy/YxrctYMraVJzF6hNyct4BBReHmBCzj96
 JoFXdR2IUCX8Qa0Emoosr2/rm80dI/SToFipvIsyiT68ySw13iUzCBNl6t96LMHCanDs
 Zl9DeeL6TtPQz0mDnvirfacYwXpPU8QBPQWF1kzQCeRKjeC6Y5U+T473nRgihVWgs2C/
 c6pYXIOARyeGdZz7ARm9pVbfxQ4qBCkLJvFZGZfipBPMdJ8V81mtyp9WvSmV7MKg4NjF
 V8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HIJcQQZ2vH+eFbl0b4W6tu/X9LzbnNwvqBiC4k0Fytc=;
 b=P2DXyh9TzSxeb5XeB+lGbC9S/fYKHU9SjH4EIDW7AkHG0hmxkVjZ4JLyfcLgT6N+Dp
 zK0a2MnweRjWjiynnzgD+vnaCNJwME/wUbSZLPtDE1EqBLaWpQ44aTLGIQi1LKHOz5Rb
 ejIkzQZqKJ0RA4rwSI1Xzah8T4CaDZXsMnWAijF+V0et8dWmVhUxPWgqtK+503gFXtqM
 A473Yf/itBtQ55bRu3JrIN73jQqx2dA6TSlhG4mvLr4BAQdxJg+UjPuMbQzmwov9GHdM
 4lW9XmLuatYjkWtYHEHCNS1CJQd0HETKo+vqSRChKebk+Jhxb8q9uZonwzXefZ8D3TnF
 2DYQ==
X-Gm-Message-State: AOAM533chzqpVO6iPmS8PJ9Un3c87+l+qGPa0P81sPgvLekRB600ROdP
 Fgm+KoGADiAV86tkwjw2KZw=
X-Google-Smtp-Source: ABdhPJwlcOi0gv6VYmZqlsNpfU5gc7Otmsc5iwXbyyruTBTQ2bV1i83B8XYAsTNAxQnl3V6V9WZxBA==
X-Received: by 2002:a63:fe51:: with SMTP id x17mr7735764pgj.58.1627098258760; 
 Fri, 23 Jul 2021 20:44:18 -0700 (PDT)
Received: from localhost.localdomain ([23.228.102.68])
 by smtp.gmail.com with ESMTPSA id c17sm35118733pfv.68.2021.07.23.20.44.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Jul 2021 20:44:18 -0700 (PDT)
From: dillon.minfei@gmail.com
To: laurent.pinchart@ideasonboard.com, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 linus.walleij@linaro.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, noralf@tronnes.org
Date: Sat, 24 Jul 2021 11:44:01 +0800
Message-Id: <1627098243-2742-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
References: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 1/3] dt-bindings: display: panel: Add
	ilitek ili9341 panel bindings
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Dillon Min <dillon.minfei@gmail.com>

Add documentation for "ilitek,ili9341" panel.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/lkml/1626853288-31223-2-git-send-email-dillon.minfei@gmail.com/
---
v4: no change.

 .../bindings/display/panel/ilitek,ili9341.yaml     | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
new file mode 100644
index 000000000000..2ed010f91e2d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili9341.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek-9341 Display Panel
+
+maintainers:
+  - Dillon Min <dillon.minfei@gmail.com>
+
+description: |
+  Ilitek ILI9341 TFT panel driver with SPI control bus
+  This is a driver for 320x240 TFT panels, accepting a rgb input
+  streams with 16 bits or 18 bits.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          # ili9341 240*320 Color on stm32f429-disco board
+        - st,sf-tc240t-9370-t
+      - const: ilitek,ili9341
+
+  reg: true
+
+  dc-gpios:
+    maxItems: 1
+    description: Display data/command selection (D/CX) of this DBI panel
+
+  spi-3wire: true
+
+  spi-max-frequency:
+    const: 10000000
+
+  port: true
+
+  vci-supply:
+    description: Analog voltage supply (2.5 .. 3.3V)
+
+  vddi-supply:
+    description: Voltage supply for interface logic (1.65 .. 3.3 V)
+
+  vddi-led-supply:
+    description: Voltage supply for the LED driver (1.65 .. 3.3 V)
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - dc-gpios
+  - port
+
+examples:
+  - |+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel: display@0 {
+                 compatible = "st,sf-tc240t-9370-t",
+                              "ilitek,ili9341";
+                 reg = <0>;
+                 spi-3wire;
+                 spi-max-frequency = <10000000>;
+                 dc-gpios = <&gpiod 13 0>;
+                 port {
+                         panel_in: endpoint {
+                           remote-endpoint = <&display_out>;
+                      };
+                 };
+             };
+        };
+...
+
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
