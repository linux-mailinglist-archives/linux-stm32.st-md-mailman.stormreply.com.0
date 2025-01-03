Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFCDA0045F
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Jan 2025 07:33:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08808C78F68;
	Fri,  3 Jan 2025 06:33:17 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55EE4C78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jan 2025 06:33:12 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2ef87d24c2dso13569863a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Jan 2025 22:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735885991; x=1736490791;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7dW9tSKSb3CcOFy1YNdY01ABpN6qWxIbLh8Rm1LEF2s=;
 b=hobylwNuFScMU3SEFrBqcHytkvTWq7BlNTMXyDXuLxxkZnnfjO2QgZYQpqWPkq7nwp
 Oo75ZZtws4J7Qy6Awb3En64iY8HNEPTz/wlYysYG6IoErPJwMKrhjzW7sdN6LIjMkNW/
 iHNE9g05btSyAtka1taqnTEclk/KBdSM7XKKiRRWJ1KMpCO05sM5/dUk3v6LcMQbZZml
 LadoPruIqe/Qh4Vzhqwp1WFoxQoF/qJw6+qnNrna/YJ80GNPJmkjydqwnkOb21EOxHqc
 1ckDpAElrbnASBvivMBAW/kc+oyB3+YSJXrdN1RNotIKMpFyX3VHGaEBeSYmY68GVVZa
 Zl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735885991; x=1736490791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7dW9tSKSb3CcOFy1YNdY01ABpN6qWxIbLh8Rm1LEF2s=;
 b=KC/4anduGqEp7QjNbjOg0ZLewTRKvTXNVvrGNfIjbSFy4WASqSmtKN0k5KUk3Qrx08
 eKEcpQAAK/NvXEIlQ1OZnDBPolpQKTLffTwgEBLq6fB9yM/6O/H+qAE6w0GnXqMaMEJh
 sqhLITahxOma/HIk3/XHxTcwn1FCRzuI+LjjJOmSw74k6XuQXZY6p5aEuvZcq4TpVNQ1
 sPzSfq89E5z+7PT4AxYh1pSCk2ZEYtDWKjtBXBNfW8/uL1WnLKHl1snRjOd/klWYENAV
 /tA+q9WzftIE1G5iQG8SSDSr6ljj4lGNbLsQeWZMQQD2ro694O94TcIMjvqfiBA+LNZ1
 sJkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM9p2JFIQs5GMnuGPOZ4PZgD30BuVRL5npjWUX768VpViigZlfRE/nwVRjzmBOUKC2u6Ir1IsE5L6KxA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx1UY1Ur4dyqe0uaipKHzE6Fhr4PfOhRVghdnNeBevXUzF1GNht
 lYVUcxmvt7WWutGPKpjsL/6IL3Im632D530fW0VTV0UYbymBurQx
X-Gm-Gg: ASbGncurU2cO0yOV0faO8/v/hU0GlXZsjOL4POwik9sZhCMFQslWqXfjUp383gEXsPU
 ecNhTWF5rRoE8Xaz3yPSyjD5dmd/kSX5fESjuF50+js3iJY42E2Tk21AtGHD7ccQ5iixypTmhc2
 +B7eSh4WrMjv11SdwrNFMi2OA+WyZgjVrYMhzcxxSzUr8gT7ysFcJuHCT/bAnqMS17VvEsp+27f
 6hZ77PHH7957HpAMagzJwqO9le+hhocLsXd+52U/gZuN1ucK/FCnWHu3Q3BnqluauG9HyY0v4xE
 HvDKTn0vfLn3D1hkq8K6Tg==
X-Google-Smtp-Source: AGHT+IEiOFe4evfri1nnuFO6yzTBznHLXu75pnxX+t4aHQDSqgiu6wv6g4L6GtYLrIIjCWk7VdcMRQ==
X-Received: by 2002:a17:90b:3d50:b0:2ee:b4bf:2d06 with SMTP id
 98e67ed59e1d1-2f452e458ccmr71154893a91.19.1735885991475; 
 Thu, 02 Jan 2025 22:33:11 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ee26d89asm29427805a91.46.2025.01.02.22.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 22:33:11 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Fri,  3 Jan 2025 14:32:39 +0800
Message-Id: <20250103063241.2306312-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103063241.2306312-1-a0987203069@gmail.com>
References: <20250103063241.2306312-1-a0987203069@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com,
 Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 1/3] dt-bindings: net: nuvoton:
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

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
new file mode 100644
index 000000000000..c3f2ad423cc0
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
+            ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index eb1f3ae41ab9..4bf59ab910cc 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -67,6 +67,7 @@ properties:
         - ingenic,x2000-mac
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
+        - nuvoton,ma35d1-dwmac
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
