Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B751FAB9B49
	for <lists+linux-stm32@lfdr.de>; Fri, 16 May 2025 13:42:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 468FFC7A840;
	Fri, 16 May 2025 11:42:42 +0000 (UTC)
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net
 (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 534F5C78F6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 May 2025 01:11:09 +0000 (UTC)
Received: from E0005182DT.eswin.cn (unknown [10.12.97.162])
 by app2 (Coremail) with SMTP id TQJkCgBn+ZKVkCZowph8AA--.41039S2;
 Fri, 16 May 2025 09:10:49 +0800 (CST)
From: weishangjuan@eswincomputing.com
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 p.zabel@pengutronix.de, yong.liang.choong@linux.intel.com,
 rmk+kernel@armlinux.org.uk, jszhang@kernel.org, inochiama@gmail.com,
 jan.petrous@oss.nxp.com, dfustini@tenstorrent.com, 0x1207@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 16 May 2025 09:10:38 +0800
Message-ID: <20250516011040.801-1-weishangjuan@eswincomputing.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250516010849.784-1-weishangjuan@eswincomputing.com>
References: <20250516010849.784-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
X-CM-TRANSID: TQJkCgBn+ZKVkCZowph8AA--.41039S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXF1DKr4rCF4rur17GFy8Xwb_yoWrWFy7pF
 WxC34UJF4SqF13XayxtF10kF13tan7Gr1YkrnFqa43t395Xa4Yqr4ak3W5GFy7Cr1xXa45
 WayYy34xA3WUArJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1Y6r17McIj6xkF7I0En7xvr7AKxVWUJVW8JwAv7VC2z280aVAFwI
 0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CE
 Vc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwAKzVCY07xG64k0F24lc7CjxVAaw2
 AFwI0_GFv_Wrylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
 6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
 AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
 2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
 vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
 vjDU0xZFpf9x0pRVyxiUUUUU=
X-CM-SenderInfo: pzhl2xxdqjy31dq6v25zlqu0xpsx3x1qjou0bp/
X-Mailman-Approved-At: Fri, 16 May 2025 11:42:40 +0000
Cc: ningyu@eswincomputing.com, lizhi2@eswincomputing.com,
 Shangjuan Wei <weishangjuan@eswincomputing.com>, linmin@eswincomputing.com
Subject: [Linux-stm32] [PATCH v1 1/2] ethernet: eswin: Document for eic7700
	SoC
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

Add ESWIN EIC7700 Ethernet controller, supporting
multi-rate (10M/100M/1G) auto-negotiation, PHY LED configuration,
clock/reset control, and AXI bus parameter optimization.

Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
Signed-off-by: Shangjuan Wei <weishangjuan@eswincomputing.com>
---
 .../bindings/net/eswin,eic7700-eth.yaml       | 142 ++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml

diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
new file mode 100644
index 000000000000..6cb9c109c036
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
@@ -0,0 +1,142 @@
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
+description: |
+  The eth controller registers are part of the syscrg block on
+  the EIC7700 SoC.
+
+properties:
+  compatible:
+    const: eswin,eic7700-qos-eth
+
+  reg:
+    minItems: 1
+    items:
+      - description: Base address and size
+      - description: Extension region (optional)
+
+  interrupt-names:
+    const: macirq
+
+  interrupts:
+    maxItems: 1
+
+  phy-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [mii, gmii, rgmii, rmii, sgmii]
+
+  id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Controller instance ID
+
+  clocks:
+    minItems: 3
+    maxItems: 7
+
+  clock-names:
+    minItems: 3
+    items:
+      - const: app
+      - const: stmmaceth
+      - const: tx
+      - const: slave_bus
+      - const: master_bus
+      - const: ptp_ref
+      - const: phy_ref_clk
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: ethrst
+
+  dma-noncoherent: true
+
+  # Custom properties
+  eswin,hsp_sp_csr:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: HSP SP control registers
+
+  eswin,syscrg_csr:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: System clock registers
+
+  eswin,dly_hsp_reg:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: HSP delay control registers
+
+  snps,axi-config:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: AXI bus configuration
+
+  stmmac-axi-config:
+    type: object
+    unevaluatedProperties: false
+    properties:
+      snps,lpi_en:
+        type: boolean
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: Low Power Interface enable flag (true/false)
+
+required:
+  - compatible
+  - reg
+  - interrupt-names
+  - interrupts
+  - phy-mode
+  - id
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - eswin,hsp_sp_csr
+  - eswin,syscrg_csr
+  - eswin,dly_hsp_reg
+  - snps,axi-config
+  - snps,blen
+  - snps,rd_osr_lmt
+  - snps,wr_osr_lmt
+  - snps,lpi_en
+
+additionalProperties: false
+
+examples:
+  - |
+    gmac0: ethernet@50400000 {
+        compatible = "eswin,eic7700-qos-eth";
+        reg = <0x0 0x50400000 0x0 0x10000>;
+        interrupt-parent = <&plic>;
+        interrupt-names = "macirq";
+        interrupts = <61>;
+        phy-mode = "rgmii";
+        id = <0>;
+        status = "disabled";
+        clocks = <&clock 550>,
+                 <&clock 551>,
+                 <&clock 552>;
+        clock-names = "app", "stmmaceth", "tx";
+        resets = <&reset 0x07 (1 << 26)>;
+        reset-names = "ethrst";
+        dma-noncoherent;
+        eswin,hsp_sp_csr = <&hsp_sp_csr 0x1030 0x100 0x108>;
+        eswin,syscrg_csr = <&sys_crg 0x148 0x14c>;
+        eswin,dly_hsp_reg = <0x114 0x118 0x11c>;
+        snps,axi-config = <&stmmac_axi_setup>;
+        stmmac_axi_setup: stmmac-axi-config {
+            snps,blen = <0 0 0 0 16 8 4>;
+            snps,rd_osr_lmt = <2>;
+            snps,wr_osr_lmt = <2>;
+            snps,lpi_en;
+        };
+    };
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
