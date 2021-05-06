Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A77375527
	for <lists+linux-stm32@lfdr.de>; Thu,  6 May 2021 15:51:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC69FC59783;
	Thu,  6 May 2021 13:51:11 +0000 (UTC)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D74DC57B74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 May 2021 13:21:27 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FbZ102Ff8zlc6p;
 Thu,  6 May 2021 21:19:16 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Thu, 6 May 2021 21:21:14 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Al Cooper <alcooperx@gmail.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, linux-serial <linux-serial@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, bcm-kernel-feedback-list
 <bcm-kernel-feedback-list@broadcom.com>, linux-riscv
 <linux-riscv@lists.infradead.org>, linux-stm32
 <linux-stm32@st-md-mailman.stormreply.com>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Date: Thu, 6 May 2021 21:20:48 +0800
Message-ID: <20210506132049.1513-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210506132049.1513-1-thunder.leizhen@huawei.com>
References: <20210506132049.1513-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 06 May 2021 13:51:09 +0000
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [Linux-stm32] [PATCH v3 1/2] dt-bindings: serial: Change to
	reference the kernel-defined serial.yaml
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

The /schemas/serial.yaml from dt-schema only has the property $nodename,
whereas the kernel-defined /schemas/serial/serial.yaml contains more
useful properties, support for more complex application scenarios.

For example:
1) The property "current-speed" in fsl-lx2160a.dtsi
2) The subnode "bluetooth" in hi3660-hikey960.dts

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 Documentation/devicetree/bindings/serial/8250.yaml            | 2 +-
 .../devicetree/bindings/serial/brcm,bcm7271-uart.yaml         | 2 +-
 Documentation/devicetree/bindings/serial/ingenic,uart.yaml    | 2 +-
 Documentation/devicetree/bindings/serial/pl011.yaml           | 4 ++--
 Documentation/devicetree/bindings/serial/qca,ar9330-uart.yaml | 4 ++--
 Documentation/devicetree/bindings/serial/renesas,em-uart.yaml | 2 +-
 Documentation/devicetree/bindings/serial/samsung_uart.yaml    | 2 +-
 Documentation/devicetree/bindings/serial/sifive-serial.yaml   | 4 ++--
 .../devicetree/bindings/serial/snps-dw-apb-uart.yaml          | 2 +-
 Documentation/devicetree/bindings/serial/st,stm32-uart.yaml   | 3 +--
 10 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index f0506a917793dde..1a849fc17181c8d 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -10,7 +10,7 @@ maintainers:
   - devicetree@vger.kernel.org
 
 allOf:
-  - $ref: /schemas/serial.yaml#
+  - $ref: serial.yaml#
   - if:
       anyOf:
         - required:
diff --git a/Documentation/devicetree/bindings/serial/brcm,bcm7271-uart.yaml b/Documentation/devicetree/bindings/serial/brcm,bcm7271-uart.yaml
index 46c62745f901e2f..6d176588df47d84 100644
--- a/Documentation/devicetree/bindings/serial/brcm,bcm7271-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/brcm,bcm7271-uart.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Al Cooper <alcooperx@gmail.com>
 
 allOf:
-  - $ref: /schemas/serial.yaml#
+  - $ref: serial.yaml#
 
 description: |+
   The Broadcom UART is based on the basic 8250 UART but with
diff --git a/Documentation/devicetree/bindings/serial/ingenic,uart.yaml b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
index 7748d8c3bab85b6..b432d4dff730b1f 100644
--- a/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Paul Cercueil <paul@crapouillou.net>
 
 allOf:
-  - $ref: /schemas/serial.yaml#
+  - $ref: serial.yaml#
 
 properties:
   $nodename:
diff --git a/Documentation/devicetree/bindings/serial/pl011.yaml b/Documentation/devicetree/bindings/serial/pl011.yaml
index 1f8e9f2644b6b80..142187337c765fa 100644
--- a/Documentation/devicetree/bindings/serial/pl011.yaml
+++ b/Documentation/devicetree/bindings/serial/pl011.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Rob Herring <robh@kernel.org>
 
 allOf:
-  - $ref: /schemas/serial.yaml#
+  - $ref: serial.yaml#
 
 # Need a custom select here or 'arm,primecell' will match on lots of nodes
 select:
@@ -103,7 +103,7 @@ dependencies:
   poll-rate-ms: [ auto-poll ]
   poll-timeout-ms: [ auto-poll ]
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/serial/qca,ar9330-uart.yaml b/Documentation/devicetree/bindings/serial/qca,ar9330-uart.yaml
index a344369285b6aa9..a644e5af12b24ba 100644
--- a/Documentation/devicetree/bindings/serial/qca,ar9330-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/qca,ar9330-uart.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Oleksij Rempel <o.rempel@pengutronix.de>
 
 allOf:
-  - $ref: /schemas/serial.yaml#
+  - $ref: serial.yaml#
 
 properties:
   compatible:
@@ -35,7 +35,7 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml b/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
index 82aefdb0d45e5f1..e98ec48fee46379 100644
--- a/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
@@ -35,7 +35,7 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 97ec8a093bf303e..0c24e7b1f15ec32 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -82,7 +82,7 @@ required:
 unevaluatedProperties: false
 
 allOf:
-  - $ref: /schemas/serial.yaml#
+  - $ref: serial.yaml#
 
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/serial/sifive-serial.yaml b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
index 5fa94dacbba97b4..09aae43f65a7f4a 100644
--- a/Documentation/devicetree/bindings/serial/sifive-serial.yaml
+++ b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
@@ -12,7 +12,7 @@ maintainers:
   - Palmer Dabbelt <palmer@sifive.com>
 
 allOf:
-  - $ref: /schemas/serial.yaml#
+  - $ref: serial.yaml#
 
 properties:
   compatible:
@@ -49,7 +49,7 @@ required:
   - interrupts
   - clocks
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 87ef1e218152d1a..99d8888e88a9d18 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Rob Herring <robh@kernel.org>
 
 allOf:
-  - $ref: /schemas/serial.yaml#
+  - $ref: serial.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
index 71a6426bc558a1c..f50f4ca893a099d 100644
--- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
@@ -112,8 +112,7 @@ required:
   - interrupts
   - clocks
 
-additionalProperties:
-  type: object
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.26.0.106.g9fadedd


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
