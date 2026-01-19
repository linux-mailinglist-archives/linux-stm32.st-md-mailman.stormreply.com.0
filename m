Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1143D39FF4
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jan 2026 08:33:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C029C87ED3;
	Mon, 19 Jan 2026 07:33:56 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5D9AC87ED4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 07:33:54 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-29efd139227so25369695ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Jan 2026 23:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768808033; x=1769412833;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kwRM1gGaHi8PnymUuB5O39xP4xhmWw83uFj1UvSjw/w=;
 b=HsE4VBwWQHNkFNPWizjQNuyuLPX67MsSZkRdahoQeo30o9CPaRyhJYIGg9KPGdTUmT
 s2DjCthFlALwoW5tPXkIWxL7BexRWUfpJ+nxJJ1IARKJF3BLOs3Ck9d0G8KLmJ4j32Ol
 dWoLXpjGtV9KBrP9iYySDH14QXhvRWvyhh6WlDipUaPrWZI+77ZX6iDPwJel3hfvkIOl
 2NBMeUnZG00gUXFyhiuOGF7StvDqL+kZEOJtKpPKDDuscEq+6fEWw/rMBWOUsmmRSCWO
 KooqooYolkB5MHHYoctDWaaBesfyumZvn+OUL7K3zlRCYVUc9aNPBqViMEGBuQ37qY8a
 Y45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768808033; x=1769412833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kwRM1gGaHi8PnymUuB5O39xP4xhmWw83uFj1UvSjw/w=;
 b=Vq/ESm3+yOSWgToXXIwOzQPsVXEgkQW4yEqC7rHnlpXptRZGCp+jeinS6F93Bj25rt
 NOWSy3v4iTMSPqXI9pMX9jKN9XtmoAmP8Pk9W3rSkq4gL+gmLPRYXbXwUwdBANTVfhhl
 +cDMXD/2ueYWHUs5N4Q4EoqX15HM4vsyRypfarsCW+REdo1WlE8HALhKGqC9Ps7MSIy6
 JewBaGQVO2LI1nv75OoSxq774kCGYgO3YFdsw/V2Km+b0DX276EKSiMhtkLA1S4Z4U2y
 mg7WOYM33nvhwxnu3YTMfrt0N67N4R0Hq/NzJWliIPozN+ayOg1w06mr6rVm0RE7KMU8
 t4Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT//exTrqZuq5gaKVFIdh/OD6ILtfzMiJ/G7gRSuQN47rH5pPf+ZDgBZ7KfF7aIpK63c6cJynoD+OBmA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyAnVPrKlN1SA2r2ryH4WMvVYOJlvrw+ZJzhug3cF0zYK2jZYMi
 afLcqsH7uFuAHjjnZk4KDcHPGPrdRafwYwWPKNSy8Yultmerl56CmOXr
X-Gm-Gg: AZuq6aI5hT3QzQ4j2n4zdgJsVKfYLd5i5Z17wvGgGvcRCxqyHs+qKa1NkHSxnxRggX8
 UQVYeKkpbmsvY8Wci8oEoKxBIqrRjvAhnS8eqoINgCFAJzGQb+iFKoFZPp8kTv3EONM4KUJqJch
 IHjigBfWEHK4izNuuQNii1LswGvt15Nu8hGqMMthIDIIUqYy/yNbv1gz4LlYDI2oy5wYWaN/RCX
 bgoXkk3V/G706zEaX+Y35HRBLRIKd/HngXtK6Qm4Arxicsk1jgZu9F5X6Gx6dAmWk2hSTGZNzOK
 trQgK0Ss/PsZjOCIJcFrZJYdLnJgs94ttg+LxIfWc8jfE1uMjlr/SCxhYiygZXdcNEM5q88/Xjl
 CFAPkxsPfmUvkB5iviN9P1SjcXJuhwzBrQa+97q/705uLSqBvu1dSjSRZ13ZC0faJnmFr+Yp39O
 RbesH/SKf0Y7NmffWNytTzkGWHhC55UmCugO5XNwtVYsjAL1T+bxm3hlb+Zu5e1SjKfp15VZDxk
 AyrjiXguQE=
X-Received: by 2002:a17:903:94f:b0:2a2:c4b4:f72d with SMTP id
 d9443c01a7336-2a718928be5mr113594955ad.30.1768808033242; 
 Sun, 18 Jan 2026 23:33:53 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a71941e3cdsm84863325ad.100.2026.01.18.23.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 23:33:52 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Mon, 19 Jan 2026 15:33:39 +0800
Message-ID: <20260119073342.3132502-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119073342.3132502-1-a0987203069@gmail.com>
References: <20260119073342.3132502-1-a0987203069@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com,
 Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v8 1/3] dt-bindings: net: nuvoton:
	Add schema for Nuvoton MA35 family GMAC
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

Create initial schema for Nuvoton MA35 family Gigabit MAC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 127 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
new file mode 100755
index 000000000000..8eaddfdc937c
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton DWMAC glue layer controller
+
+maintainers:
+  - Joey Lu <yclu4@nuvoton.com>
+
+description:
+  Nuvoton 10/100/1000Mbps Gigabit Ethernet MAC Controller is based on
+  Synopsys DesignWare MAC (version 3.73a).
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nuvoton,ma35d1-dwmac
+
+  reg:
+    maxItems: 1
+    description:
+      Register range should be one of the GMAC interface.
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: MAC clock
+      - description: PTP clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+
+  nuvoton,sys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to access syscon registers.
+          - description: GMAC interface ID.
+            enum:
+              - 0
+              - 1
+    description:
+      A phandle to the syscon with one argument that configures system registers
+      for MA35D1's two GMACs. The argument specifies the GMAC interface ID.
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: stmmaceth
+
+  phy-mode:
+    enum:
+      - rmii
+      - rgmii
+      - rgmii-id
+      - rgmii-txid
+      - rgmii-rxid
+
+  tx-internal-delay-ps:
+    default: 0
+    minimum: 0
+    maximum: 2000
+    description:
+      RGMII TX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-txid') in pico-seconds.
+      Allowed values are from 0 to 2000.
+
+  rx-internal-delay-ps:
+    default: 0
+    minimum: 0
+    maximum: 2000
+    description:
+      RGMII RX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-rxid') in pico-seconds.
+      Allowed values are from 0 to 2000.
+
+required:
+  - clocks
+  - clock-names
+  - nuvoton,sys
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+    ethernet@40120000 {
+        compatible = "nuvoton,ma35d1-dwmac";
+        reg = <0x40120000 0x10000>;
+        interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
+        clock-names = "stmmaceth", "ptp_ref";
+
+        nuvoton,sys = <&sys 0>;
+        resets = <&sys MA35D1_RESET_GMAC0>;
+        reset-names = "stmmaceth";
+
+        phy-mode = "rgmii-id";
+        phy-handle = <&eth_phy0>;
+        mdio {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            eth_phy0: ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index dd3c72e8363e..10cb5e555750 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -69,6 +69,7 @@ properties:
         - ingenic,x2000-mac
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
+        - nuvoton,ma35d1-dwmac
         - nxp,s32g2-dwmac
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
