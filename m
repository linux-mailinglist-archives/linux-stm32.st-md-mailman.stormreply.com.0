Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE4E1E3A5E
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2020 09:28:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95D3CC36B21;
	Wed, 27 May 2020 07:28:05 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECCADC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 07:28:02 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id x18so8705837pll.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 00:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nVArjOONMUkkYFoFrci5k0663uSmHnt2FzTEZnX/GkE=;
 b=fNuI+idsbzoB3q+zS+ICH8mO5EylmfUuUOqZmykgFsWg7vs6FF87px9saoDbnpMB1N
 9Pt6MoaMW+ot6Kjuwk95RYR4F8rLKpcDYuvEvPOPftpgTVRx/KD0Gz1y2dCPMWKOrZcE
 aX+Nij+DtOvqgqXWrssP49bQvzkFQuV0TsLmqFgDyG3xOZayLc+E2xe88K/lunp1mlOm
 uhJiCNPxCW/g2h4L9YdqTpAqKNA6BUHtm3B2QUJe/FsjT4g7IE63UzNB5x5j2z09Iabr
 +peSmHWwb+BBTn/5IUJ1/Yb71gjsvAYsMeRC8gC/zKp6zOM0uqvUXaAbPgJf/N+51uig
 OoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nVArjOONMUkkYFoFrci5k0663uSmHnt2FzTEZnX/GkE=;
 b=cfnTGhFCYmASwNp1Tb59N/RLv1zHQRrXNz23EE8tN4N5n2So4Il8TlY6Se4UIUm0Uv
 UddClDPtzrfx1vKeSuPEYP26u3dB2539S5h/a74UC7bYdqgIfQTpSIjS8Bz0U7Sa0kqL
 GvU4XG2mR76jjMKJYQttgRrFPzg4CZ5+KQK/s99A/lRTXcuAcgwOAtge71xUFcPq+LNo
 m2hoQR0tMfQQgPv7ija/AdGamQYmpv/gGYdaC/aHOGFIViH4ZI8VG53BVxNVolyQWwhv
 xDMs9BBEQWc+8wi2hreJ0TbT7KWcd0lRr1l14nKsgF/byPMkzpxXYZQEcUWCrdK1rD6+
 0LTA==
X-Gm-Message-State: AOAM533B50+SE+7a+x/NiOKAcB3qSs2imb8gm9ZdARq+rQFwwzwLcvDT
 SF49ypA6sLoFdHb6o9cEFKE=
X-Google-Smtp-Source: ABdhPJzrL/U3t1oZby1+25XxH8pSctzfppOL3s8v/Pl5c9EFRQsy1WnMGrduSxxRz3uMkZe46M4AsQ==
X-Received: by 2002:a17:902:7b96:: with SMTP id
 w22mr4863111pll.232.1590564481460; 
 Wed, 27 May 2020 00:28:01 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id q201sm1371842pfq.40.2020.05.27.00.27.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 May 2020 00:28:01 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, mturquette@baylibre.com,
 sboyd@kernel.org, andy.shevchenko@gmail.com, noralf@tronnes.org,
 linus.walleij@linaro.org, broonie@kernel.org
Date: Wed, 27 May 2020 15:27:28 +0800
Message-Id: <1590564453-24499-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, dillonhua@gmail.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 4/9] dt-bindings: display: panel: Add
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
 .../bindings/display/panel/ilitek,ili9341.yaml     | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
new file mode 100644
index 000000000000..2172f889af3c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -0,0 +1,69 @@
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
