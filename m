Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9769C6B8533
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 23:51:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B571C6A60F;
	Mon, 13 Mar 2023 22:51:31 +0000 (UTC)
Received: from post.baikalelectronics.com (post.baikalelectronics.com
 [213.79.110.86])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F478C6A610
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 22:51:30 +0000 (UTC)
Received: from post.baikalelectronics.com (localhost.localdomain [127.0.0.1])
 by post.baikalelectronics.com (Proxmox) with ESMTP id A5BB5E0EC0;
 Tue, 14 Mar 2023 01:51:29 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 baikalelectronics.ru; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:from:from:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=post;
 bh=6xrFxVFBCRoCwxV5M3KY75YLEifw9tZ9oXtCfQTCeVs=; b=KMRYLuxUvxwE
 kwtRfkaJKPlM5KUepPRKyA5TfFU7uP5VUadRQWnfhFfx5HdNeTL2phNG7hF1bIim
 r8XK0Lf2AslW63hVY3Io0uz2uNSzMYvsArsFflyTdipDptWQgujEkPosznPVTHW3
 O/Kk6PLGGD7P4j7yMIf0zAGOhSATCSQ=
Received: from mail.baikal.int (mail.baikal.int [192.168.51.25])
 by post.baikalelectronics.com (Proxmox) with ESMTP id 87853E0E6A;
 Tue, 14 Mar 2023 01:51:29 +0300 (MSK)
Received: from localhost (10.8.30.10) by mail (192.168.51.25) with Microsoft
 SMTP Server (TLS) id 15.0.1395.4; Tue, 14 Mar 2023 01:51:28 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Tue, 14 Mar 2023 01:51:01 +0300
Message-ID: <20230313225103.30512-15-Sergey.Semin@baikalelectronics.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
References: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-Originating-IP: [10.8.30.10]
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Christian Marangi <ansuelsmth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 14/16] dt-bindings: net: dwmac: Use
	flag definition instead of booleans
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

Currently some of the boolean properties defined in the DT-schema are
marked to have the basic boolean type meanwhile the rest referencing the
/schemas/types.yaml#/definitions/flag schema. For the sake of unification
let's convert the first group to referencing the pre-defined flag schema.
Thus bindings will look a bit more coherent and the DT-bindings
maintainers will have a better control over the booleans defined in the
schema (if ever needed).

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   | 45 ++++++++++++-------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 69be39d55403..a863b5860566 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -120,11 +120,13 @@ properties:
         maximum: 12
 
       snps,rx-sched-sp:
-        type: boolean
+        $ref: /schemas/types.yaml#/definitions/flag
         description: Strict priority
+
       snps,rx-sched-wsp:
-        type: boolean
+        $ref: /schemas/types.yaml#/definitions/flag
         description: Weighted Strict priority
+
     allOf:
       - if:
           required:
@@ -144,11 +146,13 @@ properties:
         type: object
         properties:
           snps,dcb-algorithm:
-            type: boolean
+            $ref: /schemas/types.yaml#/definitions/flag
             description: Queue to be enabled as DCB
+
           snps,avb-algorithm:
-            type: boolean
+            $ref: /schemas/types.yaml#/definitions/flag
             description: Queue to be enabled as AVB
+
           snps,map-to-dma-channel:
             $ref: /schemas/types.yaml#/definitions/uint32
             description: DMA channel id to map
@@ -156,20 +160,25 @@ properties:
             maximum: 15
 
           snps,route-avcp:
-            type: boolean
+            $ref: /schemas/types.yaml#/definitions/flag
             description: AV Untagged Control packets
+
           snps,route-ptp:
-            type: boolean
+            $ref: /schemas/types.yaml#/definitions/flag
             description: PTP Packets
+
           snps,route-dcbcp:
-            type: boolean
+            $ref: /schemas/types.yaml#/definitions/flag
             description: DCB Control Packets
+
           snps,route-up:
-            type: boolean
+            $ref: /schemas/types.yaml#/definitions/flag
             description: Untagged Packets
+
           snps,route-multi-broad:
-            type: boolean
+            $ref: /schemas/types.yaml#/definitions/flag
             description: Multicast & Broadcast Packets
+
           snps,priority:
             $ref: /schemas/types.yaml#/definitions/uint32
             description: Bitmask of the tagged frames priorities assigned to the queue
@@ -255,17 +264,21 @@ properties:
         maximum: 16
 
       snps,tx-sched-wrr:
-        type: boolean
+        $ref: /schemas/types.yaml#/definitions/flag
         description: Weighted Round Robin
+
       snps,tx-sched-wfq:
-        type: boolean
+        $ref: /schemas/types.yaml#/definitions/flag
         description: Weighted Fair Queuing
+
       snps,tx-sched-dwrr:
-        type: boolean
+        $ref: /schemas/types.yaml#/definitions/flag
         description: Deficit Weighted Round Robin
+
       snps,tx-sched-sp:
-        type: boolean
+        $ref: /schemas/types.yaml#/definitions/flag
         description: Strict priority
+
     allOf:
       - if:
           required:
@@ -311,14 +324,16 @@ properties:
             maximum: 0x1312D0
 
           snps,dcb-algorithm:
-            type: boolean
+            $ref: /schemas/types.yaml#/definitions/flag
             description: TX queue will be working in DCB
+
           snps,avb-algorithm:
-            type: boolean
+            $ref: /schemas/types.yaml#/definitions/flag
             description:
               TX queue will be working in AVB.
               Queue 0 is reserved for legacy traffic and so no AVB is
               available in this queue.
+
           snps,send_slope:
             $ref: /schemas/types.yaml#/definitions/uint32
             description:
-- 
2.39.2


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
