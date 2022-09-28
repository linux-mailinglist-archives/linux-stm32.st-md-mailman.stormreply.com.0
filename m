Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A095EE437
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Sep 2022 20:19:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BBD3C63327;
	Wed, 28 Sep 2022 18:19:57 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAF67C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 18:19:55 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E6B7E84BA7;
 Wed, 28 Sep 2022 20:19:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664389195;
 bh=oHUL8N7jt5BdWdd0pR9XgOFERS28uiLK5avUOBW3Ca8=;
 h=From:To:Cc:Subject:Date:From;
 b=KOF8K46/RdC36v0WsEievTB5gF7g8DNX7QyACJzLokGeGkoYvFvZO+782WUOz+joX
 gOgLEsl2Jr/SIk7q0SRLaKMmxkKEVE32D4ixpd9/H3BqrH4RJGUzhvQqOLYaOYWvFb
 rhnWsivtZJ/iIlB0W0no+NTQr+Jn1SHh5SYV2YeXwtzuHjrakrFsB3sH71FdIlYyNi
 TtVcpOV/jR4CsWgzkqtteGFmH0G/C4N+Mdbols1Q1gKVPnHsjVRgJORx3t1koq1sGT
 WvkxXb3XA4dhXCERVU9Ky4MOClPzH0gX1vsGF1+sieKt32yJCawcZp59ZYW4PCek4l
 A6eucQZs5c9cw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Wed, 28 Sep 2022 20:19:44 +0200
Message-Id: <20220928181944.194808-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3] dt-bindings: memory-controller: st,
	stm32: Split off MC properties
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

Split st,stm32-fmc2-ebi.yaml specific properties into st,stm32-fmc2-ebi-props.yaml ,
split memory-controller bus peripheral properties into mc-peripheral-props.yaml ,
reference the st,stm32-fmc2-ebi-props.yaml in mc-peripheral-props.yaml and
reference the mc-peripheral-props.yaml in micrel,ks8851.yaml .

This way, the FMC2 controller properties in Micrel KSZ8851MLL ethernet
controller node can be properly validated.

Fixes the following warning:

"
arch/arm/boot/dts/stm32mp153c-dhcor-drc-compact.dtb: ethernet@1,0: Unevaluated properties are not allowed ('bank-width', 'st,fmc2-ebi-cs-mux-enable', 'st,fmc2-ebi-cs-transaction-type', 'st,fmc2-ebi-cs-buswidth', 'st,fmc2-ebi-cs-address-setup-ns', 'st,fmc2-ebi-cs-address-hold-ns', 'st,fmc2-ebi-cs-bus-turnaround-ns', 'st,fmc2-ebi-cs-data-setup-ns', 'st,fmc2-ebi-cs-data-hold-ns', 'st,fmc2-ebi-cs-write-address-setup-ns', 'st,fmc2-ebi-cs-write-address-hold-ns', 'st,fmc2-ebi-cs-write-bus-turnaround-ns', 'st,fmc2-ebi-cs-write-data-setup-ns', 'st,fmc2-ebi-cs-write-data-hold-ns' were unexpected)
"

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
V2: - Depends on bugfix [PATCH] dt-bindings: memory-controller: st,stm32: Fix st,fmc2_ebi-cs-write-address-setup-ns
    - Replace MC controllers with Memory Controllers
    - Add type uint32 and enum 1,2,4 to bank-width prop
    - Add RB from Rob
V3: - Add ref: mc-peripheral-props.yaml# to patternProperties with great
      explanation by Krzysztof (big thanks!)
---
 .../mc-peripheral-props.yaml                  |  38 +++++
 .../st,stm32-fmc2-ebi-props.yaml              | 144 ++++++++++++++++++
 .../memory-controllers/st,stm32-fmc2-ebi.yaml | 138 +----------------
 .../bindings/net/micrel,ks8851.yaml           |   1 +
 4 files changed, 184 insertions(+), 137 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi-props.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml b/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
new file mode 100644
index 0000000000000..53ae995462db7
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/mc-peripheral-props.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Peripheral-specific properties for a Memory Controller bus.
+
+description:
+  Many Memory Controllers need to add properties to peripheral devices.
+  They could be common properties like reg or they could be controller
+  specific like delay in clock or data lines, etc. These properties need
+  to be defined in the peripheral node because they are per-peripheral
+  and there can be multiple peripherals attached to a controller. All
+  those properties are listed here. The controller specific properties
+  should go in their own separate schema that should be referenced
+  from here.
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+properties:
+  reg:
+    description: Bank number, base address and size of the device.
+
+  bank-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Bank width of the device, in bytes.
+    enum: [1, 2, 4]
+
+required:
+  - reg
+
+# The controller specific properties go here.
+allOf:
+  - $ref: st,stm32-fmc2-ebi-props.yaml#
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi-props.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi-props.yaml
new file mode 100644
index 0000000000000..475e4095068c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi-props.yaml
@@ -0,0 +1,144 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/st,stm32-fmc2-ebi-props.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Peripheral properties for ST FMC2 Controller
+
+maintainers:
+  - Christophe Kerello <christophe.kerello@foss.st.com>
+  - Marek Vasut <marex@denx.de>
+
+properties:
+  st,fmc2-ebi-cs-transaction-type:
+    description: |
+      Select one of the transactions type supported
+      0: Asynchronous mode 1 SRAM/FRAM.
+      1: Asynchronous mode 1 PSRAM.
+      2: Asynchronous mode A SRAM/FRAM.
+      3: Asynchronous mode A PSRAM.
+      4: Asynchronous mode 2 NOR.
+      5: Asynchronous mode B NOR.
+      6: Asynchronous mode C NOR.
+      7: Asynchronous mode D NOR.
+      8: Synchronous read synchronous write PSRAM.
+      9: Synchronous read asynchronous write PSRAM.
+      10: Synchronous read synchronous write NOR.
+      11: Synchronous read asynchronous write NOR.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 11
+
+  st,fmc2-ebi-cs-cclk-enable:
+    description: Continuous clock enable (first bank must be configured
+      in synchronous mode). The FMC_CLK is generated continuously
+      during asynchronous and synchronous access. By default, the
+      FMC_CLK is only generated during synchronous access.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,fmc2-ebi-cs-mux-enable:
+    description: Address/Data multiplexed on databus (valid only with
+      NOR and PSRAM transactions type). By default, Address/Data
+      are not multiplexed.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,fmc2-ebi-cs-buswidth:
+    description: Data bus width
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 8, 16 ]
+    default: 16
+
+  st,fmc2-ebi-cs-waitpol-high:
+    description: Wait signal polarity (NWAIT signal active high).
+      By default, NWAIT is active low.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,fmc2-ebi-cs-waitcfg-enable:
+    description: The NWAIT signal indicates wheither the data from the
+      device are valid or if a wait state must be inserted when accessing
+      the device in synchronous mode. By default, the NWAIT signal is
+      active one data cycle before wait state.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,fmc2-ebi-cs-wait-enable:
+    description: The NWAIT signal is enabled (its level is taken into
+      account after the programmed latency period to insert wait states
+      if asserted). By default, the NWAIT signal is disabled.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,fmc2-ebi-cs-asyncwait-enable:
+    description: The NWAIT signal is taken into account during asynchronous
+      transactions. By default, the NWAIT signal is not taken into account
+      during asynchronous transactions.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  st,fmc2-ebi-cs-cpsize:
+    description: CRAM page size. The controller splits the burst access
+      when the memory page is reached. By default, no burst split when
+      crossing page boundary.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 0, 128, 256, 512, 1024 ]
+    default: 0
+
+  st,fmc2-ebi-cs-byte-lane-setup-ns:
+    description: This property configures the byte lane setup timing
+      defined in nanoseconds from NBLx low to Chip Select NEx low.
+
+  st,fmc2-ebi-cs-address-setup-ns:
+    description: This property defines the duration of the address setup
+      phase in nanoseconds used for asynchronous read/write transactions.
+
+  st,fmc2-ebi-cs-address-hold-ns:
+    description: This property defines the duration of the address hold
+      phase in nanoseconds used for asynchronous multiplexed read/write
+      transactions.
+
+  st,fmc2-ebi-cs-data-setup-ns:
+    description: This property defines the duration of the data setup phase
+      in nanoseconds used for asynchronous read/write transactions.
+
+  st,fmc2-ebi-cs-bus-turnaround-ns:
+    description: This property defines the delay in nanoseconds between the
+      end of current read/write transaction and the next transaction.
+
+  st,fmc2-ebi-cs-data-hold-ns:
+    description: This property defines the duration of the data hold phase
+      in nanoseconds used for asynchronous read/write transactions.
+
+  st,fmc2-ebi-cs-clk-period-ns:
+    description: This property defines the FMC_CLK output signal period in
+      nanoseconds.
+
+  st,fmc2-ebi-cs-data-latency-ns:
+    description: This property defines the data latency before reading or
+      writing the first data in nanoseconds.
+
+  st,fmc2-ebi-cs-write-address-setup-ns:
+    description: This property defines the duration of the address setup
+      phase in nanoseconds used for asynchronous write transactions.
+
+  st,fmc2-ebi-cs-write-address-hold-ns:
+    description: This property defines the duration of the address hold
+      phase in nanoseconds used for asynchronous multiplexed write
+      transactions.
+
+  st,fmc2-ebi-cs-write-data-setup-ns:
+    description: This property defines the duration of the data setup
+      phase in nanoseconds used for asynchronous write transactions.
+
+  st,fmc2-ebi-cs-write-bus-turnaround-ns:
+    description: This property defines the delay between the end of current
+      write transaction and the next transaction in nanoseconds.
+
+  st,fmc2-ebi-cs-write-data-hold-ns:
+    description: This property defines the duration of the data hold phase
+      in nanoseconds used for asynchronous write transactions.
+
+  st,fmc2-ebi-cs-max-low-pulse-ns:
+    description: This property defines the maximum chip select low pulse
+      duration in nanoseconds for synchronous transactions. When this timing
+      reaches 0, the controller splits the current access, toggles NE to
+      allow device refresh and restarts a new access.
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
index a1f535cececcc..d71af02b7f16c 100644
--- a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
@@ -48,143 +48,7 @@ properties:
 patternProperties:
   "^.*@[0-4],[a-f0-9]+$":
     type: object
-
-    properties:
-      reg:
-        description: Bank number, base address and size of the device.
-
-      st,fmc2-ebi-cs-transaction-type:
-        description: |
-          Select one of the transactions type supported
-          0: Asynchronous mode 1 SRAM/FRAM.
-          1: Asynchronous mode 1 PSRAM.
-          2: Asynchronous mode A SRAM/FRAM.
-          3: Asynchronous mode A PSRAM.
-          4: Asynchronous mode 2 NOR.
-          5: Asynchronous mode B NOR.
-          6: Asynchronous mode C NOR.
-          7: Asynchronous mode D NOR.
-          8: Synchronous read synchronous write PSRAM.
-          9: Synchronous read asynchronous write PSRAM.
-          10: Synchronous read synchronous write NOR.
-          11: Synchronous read asynchronous write NOR.
-        $ref: /schemas/types.yaml#/definitions/uint32
-        minimum: 0
-        maximum: 11
-
-      st,fmc2-ebi-cs-cclk-enable:
-        description: Continuous clock enable (first bank must be configured
-          in synchronous mode). The FMC_CLK is generated continuously
-          during asynchronous and synchronous access. By default, the
-          FMC_CLK is only generated during synchronous access.
-        $ref: /schemas/types.yaml#/definitions/flag
-
-      st,fmc2-ebi-cs-mux-enable:
-        description: Address/Data multiplexed on databus (valid only with
-          NOR and PSRAM transactions type). By default, Address/Data
-          are not multiplexed.
-        $ref: /schemas/types.yaml#/definitions/flag
-
-      st,fmc2-ebi-cs-buswidth:
-        description: Data bus width
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [ 8, 16 ]
-        default: 16
-
-      st,fmc2-ebi-cs-waitpol-high:
-        description: Wait signal polarity (NWAIT signal active high).
-          By default, NWAIT is active low.
-        $ref: /schemas/types.yaml#/definitions/flag
-
-      st,fmc2-ebi-cs-waitcfg-enable:
-        description: The NWAIT signal indicates wheither the data from the
-          device are valid or if a wait state must be inserted when accessing
-          the device in synchronous mode. By default, the NWAIT signal is
-          active one data cycle before wait state.
-        $ref: /schemas/types.yaml#/definitions/flag
-
-      st,fmc2-ebi-cs-wait-enable:
-        description: The NWAIT signal is enabled (its level is taken into
-          account after the programmed latency period to insert wait states
-          if asserted). By default, the NWAIT signal is disabled.
-        $ref: /schemas/types.yaml#/definitions/flag
-
-      st,fmc2-ebi-cs-asyncwait-enable:
-        description: The NWAIT signal is taken into account during asynchronous
-          transactions. By default, the NWAIT signal is not taken into account
-          during asynchronous transactions.
-        $ref: /schemas/types.yaml#/definitions/flag
-
-      st,fmc2-ebi-cs-cpsize:
-        description: CRAM page size. The controller splits the burst access
-          when the memory page is reached. By default, no burst split when
-          crossing page boundary.
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [ 0, 128, 256, 512, 1024 ]
-        default: 0
-
-      st,fmc2-ebi-cs-byte-lane-setup-ns:
-        description: This property configures the byte lane setup timing
-          defined in nanoseconds from NBLx low to Chip Select NEx low.
-
-      st,fmc2-ebi-cs-address-setup-ns:
-        description: This property defines the duration of the address setup
-          phase in nanoseconds used for asynchronous read/write transactions.
-
-      st,fmc2-ebi-cs-address-hold-ns:
-        description: This property defines the duration of the address hold
-          phase in nanoseconds used for asynchronous multiplexed read/write
-          transactions.
-
-      st,fmc2-ebi-cs-data-setup-ns:
-        description: This property defines the duration of the data setup phase
-          in nanoseconds used for asynchronous read/write transactions.
-
-      st,fmc2-ebi-cs-bus-turnaround-ns:
-        description: This property defines the delay in nanoseconds between the
-          end of current read/write transaction and the next transaction.
-
-      st,fmc2-ebi-cs-data-hold-ns:
-        description: This property defines the duration of the data hold phase
-          in nanoseconds used for asynchronous read/write transactions.
-
-      st,fmc2-ebi-cs-clk-period-ns:
-        description: This property defines the FMC_CLK output signal period in
-          nanoseconds.
-
-      st,fmc2-ebi-cs-data-latency-ns:
-        description: This property defines the data latency before reading or
-          writing the first data in nanoseconds.
-
-      st,fmc2-ebi-cs-write-address-setup-ns:
-        description: This property defines the duration of the address setup
-          phase in nanoseconds used for asynchronous write transactions.
-
-      st,fmc2-ebi-cs-write-address-hold-ns:
-        description: This property defines the duration of the address hold
-          phase in nanoseconds used for asynchronous multiplexed write
-          transactions.
-
-      st,fmc2-ebi-cs-write-data-setup-ns:
-        description: This property defines the duration of the data setup
-          phase in nanoseconds used for asynchronous write transactions.
-
-      st,fmc2-ebi-cs-write-bus-turnaround-ns:
-        description: This property defines the delay between the end of current
-          write transaction and the next transaction in nanoseconds.
-
-      st,fmc2-ebi-cs-write-data-hold-ns:
-        description: This property defines the duration of the data hold phase
-          in nanoseconds used for asynchronous write transactions.
-
-      st,fmc2-ebi-cs-max-low-pulse-ns:
-        description: This property defines the maximum chip select low pulse
-          duration in nanoseconds for synchronous transactions. When this timing
-          reaches 0, the controller splits the current access, toggles NE to
-          allow device refresh and restarts a new access.
-
-    required:
-      - reg
+    $ref: mc-peripheral-props.yaml#
 
 required:
   - "#address-cells"
diff --git a/Documentation/devicetree/bindings/net/micrel,ks8851.yaml b/Documentation/devicetree/bindings/net/micrel,ks8851.yaml
index 5aa7cf2eacb1a..b44d83554ef57 100644
--- a/Documentation/devicetree/bindings/net/micrel,ks8851.yaml
+++ b/Documentation/devicetree/bindings/net/micrel,ks8851.yaml
@@ -44,6 +44,7 @@ required:
 
 allOf:
   - $ref: ethernet-controller.yaml#
+  - $ref: /schemas/memory-controllers/mc-peripheral-props.yaml#
   - if:
       properties:
         compatible:
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
