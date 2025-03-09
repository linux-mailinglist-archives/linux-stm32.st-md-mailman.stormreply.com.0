Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D57F9A58007
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Mar 2025 01:33:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89339C78F60;
	Sun,  9 Mar 2025 00:33:15 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AAEBC7803B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  9 Mar 2025 00:33:14 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-38f403edb4eso1648746f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 08 Mar 2025 16:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741480394; x=1742085194;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qPD5zeaLyTv7Qy4hdBTQxNRUyG0FnO7mcXkBMLrnQgo=;
 b=JATFBw//8cBt+IhpqVoMsKlw817v0DqWMT0RxLxo7CPBq01ixWCcRH3Liu91HYgfMU
 kLGbXl+VRVKQZQizKMX83PQq1Ff/d6Zhq4IsnGqX9eQXcwiENKOuHP9YUtG2qQTLipvE
 D7VIeXcenNeShhxQYUSZpHl5wXXpat0VLZBvP8ERnSqsJ1leul4gAASiuRxbG36eRyf3
 WFiVbdyvalYh0HvjwZRGfXiR+62vtea1nFp6Fd61kGpaj+b43XPzUAv0QvfaHvPYpwnT
 HsAX4rga7h+KOiQOMhp9EEwea7B9HbK2YbsNOLCBE0SdALdeaeQ9pgiKjgXuBwL0mFJ7
 xtjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741480394; x=1742085194;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qPD5zeaLyTv7Qy4hdBTQxNRUyG0FnO7mcXkBMLrnQgo=;
 b=QvN72hkqgF7TNA6fO04q3xyxnVKDsNmBuFT6k4bIC0nF1fDA/YZ8fC19qXaTkRdSkO
 OwoihLxG4lnbE1HwoRGPLjuRTCjivgtepV6m7DpN+GOLTRd5QC0aolprJ+BCfg4mkF51
 E74kDejDXkT0BIM8l+VCdG0OU/AcseHMYpq1t9u2NoPoU1JtVsn+duRBDJqWVWlkPoNb
 qLaXqrVdqCrO65kEsyYhEbz8vO9WGCh9kit5RkZ+O0KzWRG1+cFHQeHR7uiz2l2OcYTa
 Tf5hNXg+6Ci408qGfYdJ2R9GACKPZRDVWxlxqcLGXXZpppucJmAzp8A1jmCYP0MBCxjd
 +23w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhnAsSAN3B8dZTlRiNtJHwwm+9QpN30kiEQAi0T9HdXqnM0DdVeFuaY7aYM/hyaWi1OScQMt5atk+z/w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzSvS5R4FMFcry2G5/WVtPBKmXTa9C5t1RVQEHdrtEsmLXXAocn
 RWBCA3RuIgYsKkGz59Ls1b/tUqvVIA4YuXjlk9EmM7KhXWDEb6jL
X-Gm-Gg: ASbGncuYxrdVbJNv9kF7P8zUET2CpqoqO7EZs/SpQLlN9TGpIjCW/tjm2cbEvRBaEVh
 YRrua8lFW8IVl66pXUEbPte9x9p5LQ1qfGuKTmDn+5LDahzlpFdNEKNCst7PyCGyB2QjA6Uqkq/
 kc8zL/m4NFlk9Fuina54UfT9Tk8c5REFfLZ9rEzEbISi0l/x++wmMrN0BYkCoFB89q71TpzUXTM
 8gRL+rOQzS0cNRpLFIoxfw1rNOiCK4RpDu94lo8flgauGDCijb1kMd9bW9uoMrDjE2flXQlE4L3
 C3lvml7fLISCYVvW2Myw704b9HCUCGCs/SR5wyKsqKv4OSt3x21vXUTPXQxclMOG5Dz03YfEIQ=
 =
X-Google-Smtp-Source: AGHT+IH28MQPA+zgYnEC4J5mfzAYw/utosENTHqe/I9TDxz+92mmLwx5LY/MLbLi26Rzp9G7AsQlAA==
X-Received: by 2002:a5d:584f:0:b0:391:ffc:2413 with SMTP id
 ffacd0b85a97d-39132da08b4mr5384923f8f.40.1741480393495; 
 Sat, 08 Mar 2025 16:33:13 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:238d:d8a2:7f2b:419e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c1031fdsm9976382f8f.89.2025.03.08.16.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Mar 2025 16:33:11 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Biao Huang <biao.huang@mediatek.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Linux Team <linux-imx@nxp.com>, David Wu <david.wu@rock-chips.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 netdev@vger.kernel.org
Date: Sun,  9 Mar 2025 00:33:01 +0000
Message-ID: <20250309003301.1152228-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-rockchip@lists.infradead.org, Prabhakar <prabhakar.csengg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH net-next] dt-bindings: net: Define interrupt
	constraints for DWMAC vendor bindings
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The `snps,dwmac.yaml` binding currently sets `maxItems: 3` for the
`interrupts` and `interrupt-names` properties, but vendor bindings
selecting `snps,dwmac.yaml` do not impose these limits.

Define constraints for `interrupts` and `interrupt-names` properties in
various DWMAC vendor bindings to ensure proper validation and consistency.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Hi All,

Based on recent patch [0] which increases the interrupts to 11
and adds `additionalItems: true` its good to have constraints
to validate the schema. Ive made the changes based on the DT
binding doc and the users. Ive ran dt binding checks to ensure
the constraints are valid. Please let me know if you'd like me
to split this patch or if any of the constraints are incorrect,
as I don't have documentation for all of these platforms.

https://lore.kernel.org/all/20250308200921.1089980-2-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers, Prabhakar
---
 .../devicetree/bindings/net/amlogic,meson-dwmac.yaml   |  6 ++++++
 .../devicetree/bindings/net/intel,dwmac-plat.yaml      |  6 ++++++
 .../devicetree/bindings/net/mediatek-dwmac.yaml        |  6 ++++++
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml         |  8 ++++++++
 .../devicetree/bindings/net/rockchip-dwmac.yaml        | 10 ++++++++++
 Documentation/devicetree/bindings/net/stm32-dwmac.yaml | 10 ++++++++++
 .../bindings/net/toshiba,visconti-dwmac.yaml           |  6 ++++++
 7 files changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 798a4c19f18c..0cd78d71768c 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -152,6 +152,12 @@ properties:
           The second range is is for the Amlogic specific configuration
           (for example the PRG_ETHERNET register range on Meson8b and newer)
 
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: macirq
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml b/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
index 42a0bc94312c..62c1da36a2b5 100644
--- a/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
+++ b/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
@@ -41,6 +41,12 @@ properties:
       - const: ptp_ref
       - const: tx_clk
 
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: macirq
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
index ed9d845f6008..3aab21b8e8de 100644
--- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
@@ -64,6 +64,12 @@ properties:
       - const: rmii_internal
       - const: mac_cg
 
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: macirq
+
   power-domains:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
index 87bc4416eadf..e5db346beca9 100644
--- a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
@@ -56,6 +56,14 @@ properties:
         - tx
         - mem
 
+  interrupts:
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: macirq
+      - const: eth_wake_irq
+
   intf_mode:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index f8a576611d6c..891396140a7f 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -58,6 +58,16 @@ properties:
               - rockchip,rv1126-gmac
           - const: snps,dwmac-4.20a
 
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: macirq
+      - const: eth_wake_irq
+
   clocks:
     minItems: 5
     maxItems: 8
diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
index 85cea9966a27..987254900d0d 100644
--- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
@@ -54,6 +54,16 @@ properties:
     items:
       - const: stmmaceth
 
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: macirq
+      - const: eth_wake_irq
+
   clocks:
     minItems: 3
     items:
diff --git a/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
index 052f636158b3..f0f32e18fc85 100644
--- a/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
@@ -42,6 +42,12 @@ properties:
       - const: stmmaceth
       - const: phy_ref_clk
 
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: macirq
+
 required:
   - compatible
   - reg
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
