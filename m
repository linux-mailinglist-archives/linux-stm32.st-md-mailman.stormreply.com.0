Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 309321CED83
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2020 09:03:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F01B6C36B3D;
	Tue, 12 May 2020 07:03:55 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 222D4C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 07:03:54 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id u35so2750532pgk.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 00:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=o//dTfJVTpsa5Zo7nPNQBSOusaLkGD86FZMNihxJfus=;
 b=gHte5rVUD6y77Xe/TFwjDfYe9ap4bclJIR3xqi1I4zZijHaTmhe0Gim+Ke3EaFnJXe
 XJUjPVATgmdLPBcdDcR2qvWe2tRzSWZuFX3VmGuLTvYRJYbWD4+vqJebdZlZ0s+4uF/q
 EOsHEQv66zGagOhM3QAwtb5vCkNRPX9YPjRBJiOCej/P6J6Acyko6XtZNeWvFM1CbH2I
 VSToK4mNIq0e1Y1inpqYK+SmtdgxbaFKQe+EzRBulSqHa2pf3fwoMz5qa+5MZbIeK3uV
 YvPxu4ZQgWH6ZHmBADxC/MtYhY7NVcdmzOg40KLgnYVFrmHg+4htNhrzMAMfu+zc8Uei
 VoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=o//dTfJVTpsa5Zo7nPNQBSOusaLkGD86FZMNihxJfus=;
 b=DR3THbgvDO5RmIQzeCuKYIhxcQj/nXYhrChMEw8+d8xWbnKo9yhmVsnws9NyMPov2B
 GzfM74wUx3rQP+cgIdauGa4qknp3InIEcuR6S1UHcFU7hbMs5utYVBfbpH6CJl6XPr2X
 AAmE2qkdGxF6yEnHFZBvG2fN2/fGNs2HkRamn4/MmlykTH5zk4/rLZg4/61k/m2XURtw
 3kfEXJkiaXLMvlfOWE5G/apNFqY148FUva1idg9ovCViu9QIK1tQZjGJV0YxDZv/ovnc
 55vAoQAUp5ou0+cezmzVmjzJ6etBJ7viJF6Xgo/Xe+XuFw9+uMI5aqI9ayTtZ68JwUi9
 7fNQ==
X-Gm-Message-State: AOAM532mKiAdW8W5xqOr2LPNq+wwWafUQ+1w1aOYmkda7z2LCy4kCIL6
 hFz0vVYrEV72r4T37gF3EZk=
X-Google-Smtp-Source: ABdhPJyvQqwVfnqNh+p34cdkk3VkqZVcQx818ZVzyde7cIL1JuJ8VM2Siydwch4p+f1lnq+Vtm0N7A==
X-Received: by 2002:a63:3c19:: with SMTP id j25mr9279778pga.434.1589267032602; 
 Tue, 12 May 2020 00:03:52 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id 62sm11016369pfu.181.2020.05.12.00.03.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 May 2020 00:03:52 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Date: Tue, 12 May 2020 15:03:34 +0800
Message-Id: <1589267017-17294-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 dillon.minfei@gmail.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 2/5] dt-bindings: display: panel: Add
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

From: dillon min <dillon.minfei@gmail.com>

Add documentation for "ilitek,ili9341" panel.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---

Changes:

V3:
    change compatible to st,sf-tc240t-9370-t, match #vendor,#lcd_module style

V2:
    verifyied with make dt_binding_check

V1:
    none

.../bindings/display/panel/ilitek,ili9341.yaml     | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
new file mode 100644
index 0000000..9f694d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -0,0 +1,68 @@
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
+    description: Display data/command selection (D/CX)
+
+  spi-3wire: true
+
+  spi-max-frequency:
+    const: 10000000
+
+  port: true
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
+                 compatible = "st,sf-tc240t-9370-t", "ilitek,ili9341";
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
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
