Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1C8AF6E6D
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jul 2025 11:20:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86A7AC3F943;
	Thu,  3 Jul 2025 09:20:14 +0000 (UTC)
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net
 (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D964AC3F93E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jul 2025 09:20:12 +0000 (UTC)
Received: from E0005182LT.eswin.cn (unknown [10.12.96.155])
 by app2 (Coremail) with SMTP id TQJkCgAHmZI2S2ZoXl+oAA--.51343S2;
 Thu, 03 Jul 2025 17:19:52 +0800 (CST)
From: weishangjuan@eswincomputing.com
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 yong.liang.choong@linux.intel.com, vladimir.oltean@nxp.com,
 jszhang@kernel.org, jan.petrous@oss.nxp.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@gmail.com,
 boon.khai.ng@altera.com, dfustini@tenstorrent.com, 0x1207@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Thu,  3 Jul 2025 17:19:47 +0800
Message-Id: <20250703091947.1148-1-weishangjuan@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20250703091808.1092-1-weishangjuan@eswincomputing.com>
References: <20250703091808.1092-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
X-CM-TRANSID: TQJkCgAHmZI2S2ZoXl+oAA--.51343S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw45Zw4rZw47trykKw1ftFb_yoW7Ar1Upa
 yxC3y3Jr1xJr13Xw47tF10kF13Jan3Cr4YkrnFqw17t3sIga4Fqr4akF15Ga4UCr4xZFy5
 uFWYv34xA3Wjyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBm14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1U
 MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
 8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRMrWrDUUUU
X-CM-SenderInfo: pzhl2xxdqjy31dq6v25zlqu0xpsx3x1qjou0bp/
Cc: ningyu@eswincomputing.com, lizhi2@eswincomputing.com,
 Shangjuan Wei <weishangjuan@eswincomputing.com>, linmin@eswincomputing.com
Subject: [Linux-stm32] [PATCH v3 1/2] dt-bindings: ethernet: eswin: Document
	for EIC7700 SoC
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

From: Shangjuan Wei <weishangjuan@eswincomputing.com>

Add ESWIN EIC7700 Ethernet controller, supporting clock
configuration, delay adjustment and speed adaptive functions.

Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
Signed-off-by: Shangjuan Wei <weishangjuan@eswincomputing.com>
---
 .../bindings/net/eswin,eic7700-eth.yaml       | 175 ++++++++++++++++++
 1 file changed, 175 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml

diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
new file mode 100644
index 000000000000..04b4c7bfbb5b
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
@@ -0,0 +1,175 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/eswin,eic7700-eth.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Eswin EIC7700 SOC Eth Controller
+
+maintainers:
+  - Shuang Liang <liangshuang@eswincomputing.com>
+  - Zhi Li <lizhi2@eswincomputing.com>
+  - Shangjuan Wei <weishangjuan@eswincomputing.com>
+
+description:
+  The eth controller registers are part of the syscrg block on
+  the EIC7700 SoC.
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - eswin,eic7700-qos-eth
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: eswin,eic7700-qos-eth
+      - const: snps,dwmac-5.20
+
+  reg:
+    minItems: 1
+
+  interrupt-names:
+    const: macirq
+
+  interrupts:
+    maxItems: 1
+
+  phy-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - rgmii
+      - rgmii-rxid
+      - rgmii-txid
+      - rgmii-id
+
+  phy-handle:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the PHY device
+
+  clocks:
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    minItems: 2
+    maxItems: 2
+    contains:
+      enum:
+        - stmmaceth
+        - tx
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: stmmaceth
+
+  rx-internal-delay-ps:
+    description:
+      RGMII Receive Clock Delay defined in pico seconds. This is used for
+      controllers that have configurable RX internal delays. If this
+      property is present then the MAC applies the RX delay.
+
+  tx-internal-delay-ps:
+    description:
+      RGMII Transmit Clock Delay defined in pico seconds. This is used for
+      controllers that have configurable TX internal delays. If this
+      property is present then the MAC applies the TX delay.
+
+  eswin,hsp-sp-csr:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - description: Phandle to HSP(High-Speed Peripheral) device
+      - description: Control register offset
+      - description: Status register offset
+      - description: Interrupt register offset
+    description: |
+      A phandle to hsp-sp-csr with three arguments that configure
+      HSP(High-Speed Peripheral) device. The argument one is the
+      offset of control register, the argument two is the offset
+      of status register, the argument three is the offset of
+      interrupt register.
+
+  eswin,syscrg-csr:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - description:
+          Phandle to system CRG(System Clock and Reset Generator)
+          device
+      - description: Clock control register offset
+      - description: Reset control register offset
+    description: |
+      A phandle to syscrg-csr with two arguments that configure
+      CRG(System Clock and Reset Generator) device. The argument
+      one is the offset of clock control register, the argument
+      two is the offset of reset control register.
+
+  eswin,dly-hsp-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      - description: Control the delay of TXD
+      - description: Control the CLK delay of TX and RX
+      - description: Control the delay of RXD
+    description: |
+      An array to dly-hsp-reg with three arguments that
+      configure delay. The argument one is used to control the
+      delay of TXD, the argument two is used to control the
+      CLK delay of TX and RX, the argument three is used to
+      control the delay of RXD.
+
+required:
+  - compatible
+  - reg
+  - interrupt-names
+  - interrupts
+  - phy-mode
+  - rx-internal-delay-ps
+  - tx-internal-delay-ps
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - eswin,hsp-sp-csr
+  - eswin,syscrg-csr
+  - eswin,dly-hsp-reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet@50400000 {
+        compatible = "eswin,eic7700-qos-eth", "snps,dwmac-5.20";
+        reg = <0x50400000 0x10000>;
+        interrupt-parent = <&plic>;
+        interrupt-names = "macirq";
+        interrupts = <61>;
+        phy-mode = "rgmii";
+        phy-handle = <&phy0>;
+        rx-internal-delay-ps = <9000>;
+        tx-internal-delay-ps = <2200>;
+        clocks = <&clock 417>, <&clock 418>;
+        clock-names = "stmmaceth", "tx";
+        resets = <&reset 95>;
+        reset-names = "stmmaceth";
+        eswin,hsp-sp-csr = <&hsp_sp_csr 0x1030 0x100 0x108>;
+        eswin,syscrg-csr = <&sys_crg 0x148 0x14c>;
+        eswin,dly-hsp-reg = <0x114 0x118 0x11c>;
+        snps,axi-config = <&stmmac_axi_setup>;
+        snps,fixed-burst;
+        snps,aal;
+        snps,tso;
+        stmmac_axi_setup: stmmac-axi-config {
+            snps,blen = <0 0 0 0 16 8 4>;
+            snps,rd_osr_lmt = <2>;
+            snps,wr_osr_lmt = <2>;
+        };
+    };
--
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
