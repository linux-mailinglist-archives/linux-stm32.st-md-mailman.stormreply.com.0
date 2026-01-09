Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F32DFD07B8B
	for <lists+linux-stm32@lfdr.de>; Fri, 09 Jan 2026 09:09:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1A15C8F286;
	Fri,  9 Jan 2026 08:09:19 +0000 (UTC)
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net
 [13.76.78.106])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46D3FC1A97C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jan 2026 08:09:17 +0000 (UTC)
Received: from E0004057DT.eswin.cn (unknown [10.11.96.26])
 by app2 (Coremail) with SMTP id TQJkCgCHyaydt2Bpf2ySAA--.23335S2;
 Fri, 09 Jan 2026 16:09:02 +0800 (CST)
From: lizhi2@eswincomputing.com
To: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri,  9 Jan 2026 16:08:59 +0800
Message-ID: <20260109080859.1285-1-lizhi2@eswincomputing.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260109080601.1262-1-lizhi2@eswincomputing.com>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
X-CM-TRANSID: TQJkCgCHyaydt2Bpf2ySAA--.23335S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZw1xWw1fZry8ZF1rZF4UCFg_yoWruFyxpF
 W5C3y7JrsYqr1fZa17tw10kF9xGa93CF13Grn3t3WfXa1qvFZ0qr1aya45J3WUCr4xZFy5
 uFWYkay8CF1jk3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
 IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRuHqcUUUUU=
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/
Cc: ningyu@eswincomputing.com, pinkesh.vaghela@einfochips.com,
 Zhi Li <lizhi2@eswincomputing.com>, weishangjuan@eswincomputing.com,
 linmin@eswincomputing.com
Subject: [Linux-stm32] [PATCH v1 1/2] dt-bindings: ethernet: eswin: add
	clock sampling control
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

From: Zhi Li <lizhi2@eswincomputing.com>

The second Ethernet controller (eth1) on the EIC7700 SoC may experience
RX data sampling issues at high speed due to EIC7700-specific receive
clock to data skew at the MAC input.

Add vendor-specific device tree properties to describe optional receive
and transmit clock inversion controls used to compensate for the EIC7700
Ethernet MAC, which may be required to ensure correct RX sampling at
high speed.

This binding also updates the enum values of the rx-internal-delay-ps
and tx-internal-delay-ps properties to reflect the actual delay step
resolution implemented by the EIC7700 hardware. The hardware applies
delay in 20 ps increments, while the previous enum values were based on
an incorrect mapping. This change corrects the DT-to-hardware mapping
without changing the meaning of the delay properties.

In addition, the binding also describes the relevant HSP CSR registers
accessed by the MAC. The TXD and RXD delay control registers are included
so the driver can explicitly clear any residual configuration left by
the bootloader, ensuring the hardware is initialized into a known and
deterministic state.

Fixes: 888bd0eca93c ("dt-bindings: ethernet: eswin: Document for EIC7700 SoC")
Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
---
 .../bindings/net/eswin,eic7700-eth.yaml       | 57 +++++++++++++++++--
 1 file changed, 51 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
index 91e8cd1db67b..c948f62e97e9 100644
--- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
+++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
@@ -63,10 +63,25 @@ properties:
       - const: stmmaceth
 
   rx-internal-delay-ps:
-    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
+    enum: [0, 20, 60, 100, 200, 400, 800, 1600, 2400]
 
   tx-internal-delay-ps:
-    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
+    enum: [0, 20, 60, 100, 200, 400, 800, 1600, 2400]
+
+  eswin,rx-clk-invert:
+    description:
+      Invert the receive clock sampling polarity at the MAC input.
+      This property may be used to compensate for SoC-specific
+      receive clock to data skew and help ensure correct RX data
+      sampling at high speed.
+    type: boolean
+
+  eswin,tx-clk-invert:
+    description:
+      Invert the transmit clock polarity driven by the MAC.
+      This property provides SoC-specific transmit clock control
+      when required by the platform.
+    type: boolean
 
   eswin,hsp-sp-csr:
     description:
@@ -81,7 +96,9 @@ properties:
                          or external clock selection
           - description: Offset of AXI clock controller Low-Power request
                          register
+          - description: Offset of register controlling TXD delay
           - description: Offset of register controlling TX/RX clock delay
+          - description: Offset of register controlling RXD delay
 
 required:
   - compatible
@@ -111,17 +128,45 @@ examples:
         interrupts = <61>;
         interrupt-names = "macirq";
         phy-mode = "rgmii-id";
-        phy-handle = <&phy0>;
+        phy-handle = <&gmac0_phy0>;
         resets = <&reset 95>;
         reset-names = "stmmaceth";
+        rx-internal-delay-ps = <20>;
+        tx-internal-delay-ps = <100>;
+        eswin,hsp-sp-csr = <&hsp_sp_csr 0x100 0x108 0x114 0x118 0x11c>;
+        snps,axi-config = <&stmmac_axi_setup_gmac0>;
+        snps,aal;
+        snps,fixed-burst;
+        snps,tso;
+        stmmac_axi_setup_gmac0: stmmac-axi-config {
+            snps,blen = <0 0 0 0 16 8 4>;
+            snps,rd_osr_lmt = <2>;
+            snps,wr_osr_lmt = <2>;
+        };
+    };
+
+    ethernet@50410000 {
+        compatible = "eswin,eic7700-qos-eth", "snps,dwmac-5.20";
+        reg = <0x50410000 0x10000>;
+        clocks = <&d0_clock 186>, <&d0_clock 171>, <&d0_clock 40>,
+                <&d0_clock 194>;
+        clock-names = "axi", "cfg", "stmmaceth", "tx";
+        interrupt-parent = <&plic>;
+        interrupts = <70>;
+        interrupt-names = "macirq";
+        phy-mode = "rgmii-rxid";
+        phy-handle = <&gmac1_phy0>;
+        resets = <&reset 94>;
+        reset-names = "stmmaceth";
         rx-internal-delay-ps = <200>;
         tx-internal-delay-ps = <200>;
-        eswin,hsp-sp-csr = <&hsp_sp_csr 0x100 0x108 0x118>;
-        snps,axi-config = <&stmmac_axi_setup>;
+        eswin,rx-clk-invert;
+        eswin,hsp-sp-csr = <&hsp_sp_csr 0x200 0x208 0x214 0x218 0x21c>;
+        snps,axi-config = <&stmmac_axi_setup_gmac1>;
         snps,aal;
         snps,fixed-burst;
         snps,tso;
-        stmmac_axi_setup: stmmac-axi-config {
+        stmmac_axi_setup_gmac1: stmmac-axi-config {
             snps,blen = <0 0 0 0 16 8 4>;
             snps,rd_osr_lmt = <2>;
             snps,wr_osr_lmt = <2>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
