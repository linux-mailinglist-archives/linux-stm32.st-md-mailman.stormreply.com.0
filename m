Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D56B3F177
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Sep 2025 02:13:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E9F7C3FACE;
	Tue,  2 Sep 2025 00:13:10 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67FE1C3FACB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Sep 2025 00:13:08 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3d1bf79d758so2120172f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Sep 2025 17:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756771988; x=1757376788;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=etFKt7+tWRxLPhUeF783JanGoHY0JOZ/EUy1MnL+9k4=;
 b=PB+e6Docx1WzRtljYpAp9Bu1xO+jmEhAI33EcFXdG2MKExS0vUDpAWeCoxtzASD2sM
 6KNiYRunYesIc7KdebA1QjtYLZKtuapj42uGC5RZ/ttMH875WWjW43A224cvDLJ6LrXI
 HrsGcvvi22S3QnJf5dvyRo2tQzS1iAARWTNvYf+WOolZrmgmJ3PgwCkL+TDGgUYyUxPR
 ANrb2L7WtBXZPsmKOilFeDqwrsjhb28/ZeXzgDfwSxZ6NCI13lHJkLNTWB6FfeCE3Msy
 lSJjOHRSnCEjwV9q6CUiWA0Qe+XUHZ6+Wn5iL351wbxi7Y9mEWt82wQp98Fov6ixCqGa
 OD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756771988; x=1757376788;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=etFKt7+tWRxLPhUeF783JanGoHY0JOZ/EUy1MnL+9k4=;
 b=iu5rCgRLrOSODGEkSUxKDbVwcJEZ2XlLZeJDvLHdkjnXhGQDymHe+I2ZjFvPJtWAlR
 WGpvqNR+/JuN630wQcRUpsfepru1zfWZd1gO61zXrpucB+MSmNAQfaeURyZexUe6K0xv
 tMUyfT/R8aqUljvy8nfKHkWVxJnjsv8uT7Rd++d8wFjArhT5cMsdgBT+RbdGj/X58Tam
 9XI35J/vz3zClIF8FniwuTKD/125BLatmTG6y6LpCtyTi7pYdBWf2PtlVwdkfUxCyMAv
 1rCOf0DnnmPX11ZOhNM3Ap4NlbGgtJ1ahwm+bpT84TwfQ/b01Mp6r5coxEiHWCnhdiu7
 3J5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4JG9Q8cxP7Lv6tPUrZ27odq+eunwSDgekovEbCd5B5nxe6sjKgBwSsEE3QnTWbtQzhsCw+ncYRlrGmw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwuZDsc0FPCFRAxaUEWyi2zMHrjWMA7i5xn/6KGL88rlXtHm6H1
 U5Co+yjOTT216fpRGJi9MHzqIDebz5+oBVaFDQWR5UnBH7kmPOkKqbzp
X-Gm-Gg: ASbGnctidy6LLpUlO+LF3nv+EzO5teO3z7Y2eDw6F3nUC6YZPES4ctOYq/P8xE+yaaE
 2F6IeIOtjVoelbF6SNQUM3gYPnxPGDi0rxS7NQdWdz0fUtpRV0X18Mygl5UOPQ9ChWKMp9X2T45
 vTE3ToxG3v9k20Z1HJQXA4FGY0w7AkPrc/d7NyX5uZ+QShUomDS1cqSl2qlvnrQtajNyIy+GS65
 3XmsVvRMFK28dI2Jdq6VpxKy948AdRI9Ad2MREwnRJ9Ila1UvUdzsgLqpQrrdIbYtcY1qLL7YV5
 hd6vzAbJPt6Dz1DdZcdxlRGNSWH3elsUo1XwhGMyXN7gWdMdaI4o7/a61JLNsDpSDTST9b4f2YZ
 0R7Ekty2SlVN+rwat84xL4hYBw7wCPfyvGtW0JEZMIcNtAcJAHia2Dqh4
X-Google-Smtp-Source: AGHT+IFPGTlk+evyu+xtq0waHE/04booU4YiDIt+L0pMGxGvKONa+Sj6VFPE3ubiKF0MVGHEbhBjNA==
X-Received: by 2002:a05:6000:2387:b0:3cd:cf31:d77b with SMTP id
 ffacd0b85a97d-3d1dfcfb96fmr6542569f8f.37.1756771987739; 
 Mon, 01 Sep 2025 17:13:07 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d92d51982bsm2138153f8f.21.2025.09.01.17.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 17:13:07 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Date: Tue,  2 Sep 2025 01:13:00 +0100
Message-ID: <20250902001302.3823418-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/4] dt-bindings: net: renesas,
	rzv2h-gbeth: Document Renesas RZ/T2H and RZ/N2H SoCs
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

Document the Ethernet MAC (GMAC) IP present on the Renesas RZ/T2H
(R9A09G077) and RZ/N2H (R9A09G087) SoCs. The GMAC IP on RZ/N2H is
identical to that found on the RZ/T2H SoC.

While the RZ/V2H(P), RZ/T2H, and RZ/N2H SoCs all integrate the Synopsys
DesignWare MAC (version 5.20), the hardware is synthesized with different
options compared to the RZ/V2H(P):
  - RZ/T2H requires only 3 clocks instead of 7
  - RZ/T2H supports 8 RX/TX queue pairs instead of 4
  - RZ/T2H needs 2 reset controls with reset-names property, vs. a single
    unnamed reset
  - RZ/T2H has the split header feature enabled, while it is disabled on
    RZ/V2H(P)

To accommodate these differences, introduce a new generic compatible
string `renesas,rzt2h-gbeth`, used as a fallback for both RZ/T2H and
RZ/N2H SoCs.

The DT schema is updated to validate the clocks, resets, reset-names,
interrupts, and interrupt-names properties accordingly. Also extend
`snps,dwmac.yaml` with the new `renesas,rzt2h-gbeth` compatible.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/net/renesas,rzv2h-gbeth.yaml     | 177 ++++++++++++++----
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 138 insertions(+), 40 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
index 23e39bcea96b..e01763389164 100644
--- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
@@ -17,63 +17,112 @@ select:
           - renesas,r9a09g047-gbeth
           - renesas,r9a09g056-gbeth
           - renesas,r9a09g057-gbeth
+          - renesas,r9a09g077-gbeth
+          - renesas,r9a09g087-gbeth
           - renesas,rzv2h-gbeth
   required:
     - compatible
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a09g047-gbeth # RZ/G3E
-          - renesas,r9a09g056-gbeth # RZ/V2N
-          - renesas,r9a09g057-gbeth # RZ/V2H(P)
-      - const: renesas,rzv2h-gbeth
-      - const: snps,dwmac-5.20
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a09g047-gbeth # RZ/G3E
+              - renesas,r9a09g056-gbeth # RZ/V2N
+              - renesas,r9a09g057-gbeth # RZ/V2H(P)
+          - const: renesas,rzv2h-gbeth
+          - const: snps,dwmac-5.20
+
+      - items:
+          - enum:
+              - renesas,r9a09g077-gbeth # RZ/T2H
+              - renesas,r9a09g087-gbeth # RZ/N2H
+          - const: renesas,rzt2h-gbeth
+          - const: snps,dwmac-5.20
 
   reg:
     maxItems: 1
 
   clocks:
-    items:
-      - description: CSR clock
-      - description: AXI system clock
-      - description: PTP clock
-      - description: TX clock
-      - description: RX clock
-      - description: TX clock phase-shifted by 180 degrees
-      - description: RX clock phase-shifted by 180 degrees
+    oneOf:
+      - items:
+          - description: CSR clock
+          - description: AXI system clock
+          - description: PTP clock
+          - description: TX clock
+          - description: RX clock
+          - description: TX clock phase-shifted by 180 degrees
+          - description: RX clock phase-shifted by 180 degrees
+
+      - items:
+          - description: CSR clock
+          - description: AXI system clock
+          - description: TX clock
 
   clock-names:
-    items:
-      - const: stmmaceth
-      - const: pclk
-      - const: ptp_ref
-      - const: tx
-      - const: rx
-      - const: tx-180
-      - const: rx-180
-
-  interrupts:
-    minItems: 11
+    oneOf:
+      - items:
+          - const: stmmaceth
+          - const: pclk
+          - const: ptp_ref
+          - const: tx
+          - const: rx
+          - const: tx-180
+          - const: rx-180
+
+      - items:
+          - const: stmmaceth
+          - const: pclk
+          - const: tx
+
 
   interrupt-names:
-    items:
-      - const: macirq
-      - const: eth_wake_irq
-      - const: eth_lpi
-      - const: rx-queue-0
-      - const: rx-queue-1
-      - const: rx-queue-2
-      - const: rx-queue-3
-      - const: tx-queue-0
-      - const: tx-queue-1
-      - const: tx-queue-2
-      - const: tx-queue-3
+    oneOf:
+      - items:
+          - const: macirq
+          - const: eth_wake_irq
+          - const: eth_lpi
+          - const: rx-queue-0
+          - const: rx-queue-1
+          - const: rx-queue-2
+          - const: rx-queue-3
+          - const: tx-queue-0
+          - const: tx-queue-1
+          - const: tx-queue-2
+          - const: tx-queue-3
+
+      - items:
+          - const: macirq
+          - const: eth_wake_irq
+          - const: eth_lpi
+          - const: rx-queue-0
+          - const: rx-queue-1
+          - const: rx-queue-2
+          - const: rx-queue-3
+          - const: rx-queue-4
+          - const: rx-queue-5
+          - const: rx-queue-6
+          - const: rx-queue-7
+          - const: tx-queue-0
+          - const: tx-queue-1
+          - const: tx-queue-2
+          - const: tx-queue-3
+          - const: tx-queue-4
+          - const: tx-queue-5
+          - const: tx-queue-6
+          - const: tx-queue-7
 
   resets:
-    items:
-      - description: AXI power-on system reset
+    oneOf:
+      - items:
+          - description: AXI power-on system reset
+
+      - items:
+          - description: GMAC stmmaceth reset
+          - description: AHB reset
+
+  reset-names: true
 
 required:
   - compatible
@@ -87,6 +136,54 @@ required:
 allOf:
   - $ref: snps,dwmac.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rzt2h-gbeth
+    then:
+      properties:
+        clocks:
+          maxItems: 3
+
+        clock-names:
+          maxItems: 3
+
+        interrupts:
+          minItems: 19
+
+        interrupt-names:
+          minItems: 19
+
+        resets:
+          minItems: 2
+
+        reset-names:
+          minItems: 2
+
+      required:
+        - reset-names
+    else:
+      properties:
+        clocks:
+          minItems: 7
+
+        clock-names:
+          minItems: 7
+
+        interrupts:
+          minItems: 11
+          maxItems: 11
+
+        interrupt-names:
+          minItems: 11
+          maxItems: 11
+
+        resets:
+          maxItems: 1
+
+        reset-names: false
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 578553840c9e..14be80fe9c82 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -77,6 +77,7 @@ properties:
         - renesas,r9a06g032-gmac
         - renesas,rzn1-gmac
         - renesas,rzv2h-gbeth
+        - renesas,rzt2h-gbeth
         - rockchip,px30-gmac
         - rockchip,rk3128-gmac
         - rockchip,rk3228-gmac
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
