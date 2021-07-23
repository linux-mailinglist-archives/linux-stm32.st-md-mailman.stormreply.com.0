Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 935C03D3370
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jul 2021 06:06:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55B9DC5A4CD;
	Fri, 23 Jul 2021 04:06:57 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 064B7C5A4CE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jul 2021 04:06:55 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 m2-20020a17090a71c2b0290175cf22899cso2131628pjs.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 21:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=B7rhomLLzwRgFfNNTM797mpLG3BiqS6x3e33hEPmJTQ=;
 b=SGgCTbvwYG1v+5tp6r3T4PLgjP/4PBx3FlYRSZedUbj8Q7Kly0YN2p2Q9sGasqkcP9
 zniQ+1QPUF/TaPtGoLFABC3ATUvZgbHOnbpFMc8DQQA6mijc9N8YXLNOo3bShwinLK2L
 mRCXD+rwSUYOescplYpusojv62U32AmIZNUWpSVEjoJxxKbIRdDCmyOLco577IjYeAeR
 HzseF5PMoRs2RJS33HBAft8nYJrTMnN6lUZ8YgkzvjOqwhaEgt4YUdtFroZ71fy/GQ2p
 Z71CdFvti5fjEzCU/KSQ9iT7fMlXcXipr4BQxQ5MY+0r4Gp06cZard3Ft6MBSKGvllsX
 mj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=B7rhomLLzwRgFfNNTM797mpLG3BiqS6x3e33hEPmJTQ=;
 b=OXOXCJW6FiJ1ifbVIY+3HElsZmScPCflVlVU9v3+drxDLBaHu3HBbI2VeAUoxRmCV+
 3ZL1i2s+BueZR7MschL8pfd6S5NZPtmdwOhJkCJcT7JWDBJerojMJsZKYgosrQH681Xt
 2S/7E/lK6x2q0Yyd6NZ0B6o5Tg0lV2Fy2CfEZj+Nxd4ROVqBEdFCTuoO/JXF9a3Zjtg4
 qwh5q8NSq2vsO7hu191pnSJHi1zMJiBVNS875vKh8A36Kv6scXkZVxOayv1NtCmWRxGF
 JPVHID78cfjRDovu2M/AiTnV+Ez01gLzm63IRexkuOL2ahfL37l1WHZvNYvrYmPww6DV
 FP+g==
X-Gm-Message-State: AOAM531v21tj2SWGsU+c7MfBU2UMUrDYTQ4zDx0k5kK5ZIjKo8ZTxMBh
 XJtz34X8xdk/XM+u3uJO7Iw=
X-Google-Smtp-Source: ABdhPJykvEEecxAO8ZNgVcwsI6ew9t6mtT9/SC/ITDuPpUox4KucwUVfybx2mBKvkZiM9vXgiLdpFw==
X-Received: by 2002:a62:3344:0:b029:28c:6f0f:cb90 with SMTP id
 z65-20020a6233440000b029028c6f0fcb90mr2633175pfz.58.1627013213589; 
 Thu, 22 Jul 2021 21:06:53 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id p3sm35474910pgi.20.2021.07.22.21.06.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Jul 2021 21:06:53 -0700 (PDT)
From: dillon.minfei@gmail.com
To: laurent.pinchart@ideasonboard.com, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 linus.walleij@linaro.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com
Date: Fri, 23 Jul 2021 12:06:41 +0800
Message-Id: <1627013203-23099-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627013203-23099-1-git-send-email-dillon.minfei@gmail.com>
References: <1627013203-23099-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 noralf@tronnes.org, Dillon Min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 1/3] dt-bindings: display: panel: Add
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
v3:
- collect reviewed-by tags from linus.
- add link address.

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
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
