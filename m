Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8C4C1F15F
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Oct 2025 09:50:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 925B1C62D85;
	Thu, 30 Oct 2025 08:50:43 +0000 (UTC)
Received: from zg8tmty1ljiyny4xntuumtyw.icoremail.net
 (zg8tmty1ljiyny4xntuumtyw.icoremail.net [165.227.155.160])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 285C5C62D82
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 08:50:42 +0000 (UTC)
Received: from E0005182LT.eswin.cn (unknown [10.12.96.155])
 by app1 (Coremail) with SMTP id TAJkCgCHjmu+JgNpOMwJAA--.56198S2;
 Thu, 30 Oct 2025 16:50:08 +0800 (CST)
From: weishangjuan@eswincomputing.com
To: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 vladimir.oltean@nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 weishangjuan@eswincomputing.com, jan.petrous@oss.nxp.com,
 inochiama@gmail.com, jszhang@kernel.org, 0x1207@gmail.com,
 boon.khai.ng@altera.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, linux-arm-kernel@lists.infradead.org
Date: Thu, 30 Oct 2025 16:50:01 +0800
Message-Id: <20251030085001.191-1-weishangjuan@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
MIME-Version: 1.0
X-CM-TRANSID: TAJkCgCHjmu+JgNpOMwJAA--.56198S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZw45tr4DGry3tr13ur15Jwb_yoW5Wr18pa
 s7G39xJF1rZr17XayxK3W8KF4fJa9xCF4Ykrn7Xr1xX3Z0q3yvv3Wayry5Wa4UCrW8ZF45
 WFy5Cay0yFyUArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBv14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
 IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRBOJnUUUUU=
X-CM-SenderInfo: pzhl2xxdqjy31dq6v25zlqu0xpsx3x1qjou0bp/
Cc: ningyu@eswincomputing.com, pinkesh.vaghela@einfochips.com,
 lizhi2@eswincomputing.com, linmin@eswincomputing.com
Subject: [Linux-stm32] [PATCH] dt-bindings: ethernet: eswin: fix yaml schema
	issues
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

Due to the detection of errors in the eswin mmc module
regarding the eswin,hsp-sp-csr attributes in the
eswin,eic7700-eth.yaml file, the link is as follows:
https://lore.kernel.org/all/176096011380.22917.1988679321096076522.robh@kernel.org/
Therefore, the eswin,hsp-sp-csr attributes of the eic7700-eth.yaml file
regarding eswin and hsp-sp-csr will be changed to the form of:
items:
  - items:
      - description: ...
      - description: ...
      - description: ...
      - description: ...

The MMC,Ethernet,and USB modules of eswin vendor have defined
eswin,hsp-sp-csr attribute in YAML. In order to be consistent
with the property description of MMC,USB, I have modified the
description content of eswin,hsp-sp-csr attribute in Ethernet YAML.

Fixes: 888bd0eca93c("dt-bindings: ethernet: eswin: Document for EIC7700 SoC")
Reported-by: Rob Herring (Arm) <robh@kernel.org>
Closes: https://lore.kernel.org/all/176096011380.22917.1988679321096076522.robh@kernel.org/
Signed-off-by: Shangjuan Wei <weishangjuan@eswincomputing.com>
---
 .../bindings/net/eswin,eic7700-eth.yaml       | 20 ++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
index 9ddbfe219ae2..91e8cd1db67b 100644
--- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
+++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
@@ -69,17 +69,19 @@ properties:
     enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]

   eswin,hsp-sp-csr:
+    description:
+      HSP CSR is to control and get status of different high-speed peripherals
+      (such as Ethernet, USB, SATA, etc.) via register, which can tune
+      board-level's parameters of PHY, etc.
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
-      - description: Phandle to HSP(High-Speed Peripheral) device
-      - description: Offset of phy control register for internal
-                     or external clock selection
-      - description: Offset of AXI clock controller Low-Power request
-                     register
-      - description: Offset of register controlling TX/RX clock delay
-    description: |
-      High-Speed Peripheral device needed to configure clock selection,
-      clock low-power mode and clock delay.
+      - items:
+          - description: Phandle to HSP(High-Speed Peripheral) device
+          - description: Offset of phy control register for internal
+                         or external clock selection
+          - description: Offset of AXI clock controller Low-Power request
+                         register
+          - description: Offset of register controlling TX/RX clock delay

 required:
   - compatible
--
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
