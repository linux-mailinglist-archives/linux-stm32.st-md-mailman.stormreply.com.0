Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B131CA1DD
	for <lists+linux-stm32@lfdr.de>; Fri,  8 May 2020 06:13:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30D73C3FACF;
	Fri,  8 May 2020 04:13:37 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F6CAC3FACC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2020 04:13:35 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id z6so154306plk.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 21:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Db6qOihor5Bj8DkFXZYYMAre3zfCOsyEXmYIyTZWgqc=;
 b=HZa4Ftrmwnb5Ap1XUema1giGFlB40rvdwsHrEWexpeZ6u5tBF43Pq4MFzxAYUu84aI
 JunK7vj/+KG0NUE2q78MI7A8GNKQoC+8zU6hWn6d1wy/rzVCxyRUPShkVXyJi/z4rZ8X
 i25uLgD5ruVcCH5djhBBhZKzsS361Rev4ajBHWYRd4FOcqm3ApHA7RHKdjnCKfSxMdL/
 OYq7KHB0yYJoOYEjmMuKH2w3YwgJDQNmQMo5R1V5fS/spm2DHonKxkvkoJEquM3oeLcX
 SCQtrBzKRLKh6kVEGNoNtw3jUeLMTnSQoqR3iHXqONoXhHB0amdTdYRt6MPXFkfyz2Fy
 C1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Db6qOihor5Bj8DkFXZYYMAre3zfCOsyEXmYIyTZWgqc=;
 b=j/whhviVRlU8HaaMUKseFxBQpeqmLcEwTaJE5TkvhDGVGXMEgbFu1WTeuV7cl9fcgK
 e0GP7UBL5niVrb/bikGobbsKHACNPrHpCfzzc9EZoRMjlEH+t7HsBC3MtgD3kBVluPVN
 P2SBSKyyjGzCjyfY/UA5j8A3h4w3o8LpBw3Ax/KqijXL/WyGHR4eioxLuIeBISqQtIEu
 nYOMpdZvwNhU2UQjrXYkJEOsjH3LUFSF7emaFocz8Am4RsJrwU24Fym77NvVetaLr/9F
 7RqmMxWYblEMldXLvLnWPGfFlbU0VWzVbg0CtiCkDWI84vV3ojpEUYqOppK64F49rer+
 Zhrw==
X-Gm-Message-State: AGi0PubPXmeOuz1sXdD6QgeRejGlMKIQRbNjgTQBuP9nKUQvZRB5wWtX
 dVpdEJcTYxGtqff2op8GKFE=
X-Google-Smtp-Source: APiQypJLGCxoTkz92z+vdPnEwubOafhAAPIJICKtjIgVVEZQPHbclNonxkvq6mn3XY2pZohgYlX7KQ==
X-Received: by 2002:a17:90a:208f:: with SMTP id
 f15mr3825087pjg.60.1588911213774; 
 Thu, 07 May 2020 21:13:33 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id h12sm314868pfq.176.2020.05.07.21.13.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 21:13:33 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Date: Fri,  8 May 2020 12:13:12 +0800
Message-Id: <1588911194-12433-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588911194-12433-1-git-send-email-dillon.minfei@gmail.com>
References: <1588911194-12433-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 dillon min <dillon.minfei@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/5] dt-bindings: display: panel: Add
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

Hi Rob Herring,

This patch [PATCH V2 3/5] about ilitek,ili9341.yaml was verifyed with make dt_binding_check

thanks.

best regards,

dillon,

.../bindings/display/panel/ilitek,ili9341.yaml     | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
new file mode 100644
index 0000000..94c2b15
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
+  streams that get adapted and scaled to the panel.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: stm32f429,ltdc-panel
+      - {} # ilitek,ili9341, but not listed here to avoid false select
+
+  reg: true
+
+  dc-gpios:
+    maxItems: 1
+    description: panel spi dc gpio
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
+  - spi-3wire
+  - spi-max-frequency
+  - port
+
+examples:
+  - |+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel: display@0 {
+                 compatible = "stm32f429,ltdc-panel", "ilitek,ili9341";
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
