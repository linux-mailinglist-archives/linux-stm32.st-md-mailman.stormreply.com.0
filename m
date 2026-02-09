Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JrjH2atiWndAgUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 10:48:22 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2533710DBE4
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 10:48:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C03F7C36B3E;
	Mon,  9 Feb 2026 09:48:21 +0000 (UTC)
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net
 (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7ED94C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Feb 2026 09:48:20 +0000 (UTC)
Received: from E0004057DT.eswin.cn (unknown [10.11.96.26])
 by app1 (Coremail) with SMTP id TAJkCgAXZzdVrYlpDjcEAA--.19005S2;
 Mon, 09 Feb 2026 17:48:06 +0800 (CST)
From: lizhi2@eswincomputing.com
To: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon,  9 Feb 2026 17:48:01 +0800
Message-ID: <20260209094801.909-1-lizhi2@eswincomputing.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260209094628.886-1-lizhi2@eswincomputing.com>
References: <20260209094628.886-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
X-CM-TRANSID: TAJkCgAXZzdVrYlpDjcEAA--.19005S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JFW5GF43AFyUCw4DXFykAFb_yoW7uF48pF
 W5u3yUGFn8Xr1fJa17tF109a4fJws3WF1akrn7t3Z7Xws0qryYqr42yFyrWa4UCr4xZFy5
 WFWYqay8uay0k3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
 IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRmZXOUUUUU=
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/
Cc: ningyu@eswincomputing.com, pinkesh.vaghela@einfochips.com,
 Zhi Li <lizhi2@eswincomputing.com>, weishangjuan@eswincomputing.com,
 linmin@eswincomputing.com
Subject: [Linux-stm32] [PATCH v2 1/2] dt-bindings: ethernet: eswin: add
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[eswincomputing.com];
	FREEMAIL_TO(0.00)[vger.kernel.org,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:devicetree@vger.kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:netdev@vger.kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:rmk+kernel@armlinux.org.uk,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:ningyu@eswincomputing.com,m:pinkesh.vaghela@einfochips.com,m:lizhi2@eswincomputing.com,m:weishangjuan@eswincomputing.com,m:linmin@eswincomputing.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.351];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_PROHIBIT(0.00)[3.1.50.16:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,eswincomputing.com:mid,eswincomputing.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 2533710DBE4
X-Rspamd-Action: no action

From: Zhi Li <lizhi2@eswincomputing.com>

The second Ethernet controller (eth1) on the EIC7700 SoC may experience
RX data sampling issues at high speed due to EIC7700-specific receive
clock to data skew at the MAC input.

On the EIC7700 SoC, the second Ethernet controller (eth1) requires
inversion of the internal RGMII receive clock in order to meet RX data
sampling timing at high speed.

Describe this SoC-specific difference by introducing a distinct compatible
string for MAC instances that require internal clock inversion, allowing the
driver to select the appropriate configuration without relying on per-board
vendor-specific properties.

The rx-internal-delay-ps and tx-internal-delay-ps properties now use
minimum and maximum constraints to reflect the actual hardware delay
range (0-2400 ps) applied in 20 ps steps. This relaxes the binding
validation compared to the previous enum-based definition and avoids
regressions for existing DTBs while keeping the same hardware limits.

In addition, the binding now includes additional background information
about the HSP CSR registers accessed by the MAC. The TXD and RXD delay
control registers are included so the driver can explicitly clear any
residual configuration left by the bootloader. Background reference for
the High-Speed Subsystem and HSP CSR block is available in Chapter 10
("High-Speed Interface") of the EIC7700X SoC Technical Reference Manual,
Part 4 (EIC7700X_SoC_Technical_Reference_Manual_Part4.pdf):
https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases

There are currently no in-tree users of the EIC7700 Ethernet driver, so
these changes are safe.

Fixes: 888bd0eca93c ("dt-bindings: ethernet: eswin: Document for EIC7700 SoC")
Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
---
 .../bindings/net/eswin,eic7700-eth.yaml       | 63 ++++++++++++++++---
 1 file changed, 54 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
index 91e8cd1db67b..8a7035dfd4a2 100644
--- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
+++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
@@ -20,6 +20,7 @@ select:
       contains:
         enum:
           - eswin,eic7700-qos-eth
+          - eswin,eic7700-qos-eth-clk-inversion
   required:
     - compatible
 
@@ -28,9 +29,13 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - const: eswin,eic7700-qos-eth
-      - const: snps,dwmac-5.20
+    oneOf:
+      - items:
+          - const: eswin,eic7700-qos-eth
+          - const: snps,dwmac-5.20
+      - items:
+          - const: eswin,eic7700-qos-eth-clk-inversion
+          - const: snps,dwmac-5.20
 
   reg:
     maxItems: 1
@@ -63,16 +68,27 @@ properties:
       - const: stmmaceth
 
   rx-internal-delay-ps:
-    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
+    minimum: 0
+    maximum: 2400
 
   tx-internal-delay-ps:
-    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
+    minimum: 0
+    maximum: 2400
 
   eswin,hsp-sp-csr:
     description:
       HSP CSR is to control and get status of different high-speed peripherals
       (such as Ethernet, USB, SATA, etc.) via register, which can tune
       board-level's parameters of PHY, etc.
+
+      Additional background information about the High-Speed Subsystem
+      and the HSP CSR block is available in Chapter 10 ("High-Speed Interface")
+      of the EIC7700X SoC Technical Reference Manual, Part 4
+      (EIC7700X_SoC_Technical_Reference_Manual_Part4.pdf). The manual is
+      publicly available at
+      https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases
+
+      This reference is provided for background information only.
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
       - items:
@@ -81,7 +97,9 @@ properties:
                          or external clock selection
           - description: Offset of AXI clock controller Low-Power request
                          register
+          - description: Offset of register controlling TXD delay
           - description: Offset of register controlling TX/RX clock delay
+          - description: Offset of register controlling RXD delay
 
 required:
   - compatible
@@ -111,17 +129,44 @@ examples:
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
+        compatible = "eswin,eic7700-qos-eth-clk-inversion", "snps,dwmac-5.20";
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
