Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCC16B852F
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 23:51:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32ED5C6A610;
	Mon, 13 Mar 2023 22:51:26 +0000 (UTC)
Received: from post.baikalelectronics.com (post.baikalelectronics.com
 [213.79.110.86])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9500C6A619
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 22:51:24 +0000 (UTC)
Received: from post.baikalelectronics.com (localhost.localdomain [127.0.0.1])
 by post.baikalelectronics.com (Proxmox) with ESMTP id 481C7E0EBD;
 Tue, 14 Mar 2023 01:51:24 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 baikalelectronics.ru; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:from:from:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=post;
 bh=+OS7gKmNrCQi7J6HvsjQM8Wy5XPVxZEjlX8wgOsbMHA=; b=mogFCfYvuc56
 kfRSaRAV+ww3e+h3XSTnsXj6z9p27ZhEZU5QmlFLM9dZLWFMbsJD/A3xjpoGcjc/
 CiA47wdQWh/sbBxzNJDbCm7JrShd6jlLALTI9cQ3mQ4jTmt3sueHpo3fnkYI6C0R
 SOl+sO6oJEfs2qfK8C9sN2YOFqhK+RE=
Received: from mail.baikal.int (mail.baikal.int [192.168.51.25])
 by post.baikalelectronics.com (Proxmox) with ESMTP id EF31AE0E6A;
 Tue, 14 Mar 2023 01:51:23 +0300 (MSK)
Received: from localhost (10.8.30.10) by mail (192.168.51.25) with Microsoft
 SMTP Server (TLS) id 15.0.1395.4; Tue, 14 Mar 2023 01:51:23 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Tue, 14 Mar 2023 01:50:58 +0300
Message-ID: <20230313225103.30512-12-Sergey.Semin@baikalelectronics.ru>
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
Subject: [Linux-stm32] [PATCH net-next 11/16] dt-bindings: net: dwmac: Add
	MTL Rx Queue properties constraints
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

Currently none of the MTL Rx Queues QoS-related DT-properties have been
equipped with the proper constraints. Meanwhile they can be specified at
least based on the corresponding CSR field sizes or the DW (x|xG)MAC
IP-core synthesize parameter constraints. Let's do that:
+ snps,rx-queues-to-use - number of Rx queues to utilise is limited with a
number of available queues. DW MAC/GMAC: no queues, DW Eth QoS: <= 8, DW
xGMAC: <= 12.
+ snps,map-to-dma-channel - DMA channel ID is limited with a number of
available DMA-channels. DW MAC/GMAC: <= 3, DW Eth QoS: <= 8, DW xGMAC: <=
16.
+ snps,priority - bitfield of the USP (user Priority) values of the tagged
packets is limited with the corresponding CSR field width or a maximum
possible VLAN tag PRI field value (it's 7). DW MAC/GMAC: no queues, DW Eth
QoS: 0xff, DW xGMAC: 0xff.

Since the constraints vary for different IP-cores and the DT-schema is
common for all of them the least restrictive values are chosen. The info
above can be used for the IP-core specific DT-schemas if anybody ever is
bothered with one to create.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 .../devicetree/bindings/net/snps,dwmac.yaml          | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index f24718a8d184..e5662b1498b7 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -115,6 +115,10 @@ properties:
       snps,rx-queues-to-use:
         $ref: /schemas/types.yaml#/definitions/uint32
         description: number of RX queues to be used in the driver
+        default: 1
+        minimum: 1
+        maximum: 12
+
       snps,rx-sched-sp:
         type: boolean
         description: Strict priority
@@ -135,7 +139,7 @@ properties:
           properties:
             snps,rx-sched-sp: false
     patternProperties:
-      "^queue[0-9]$":
+      "^queue([0-9]|1[0-1])$":
         description: Each subnode represents a queue.
         type: object
         properties:
@@ -148,6 +152,9 @@ properties:
           snps,map-to-dma-channel:
             $ref: /schemas/types.yaml#/definitions/uint32
             description: DMA channel id to map
+            minimum: 0
+            maximum: 15
+
           snps,route-avcp:
             type: boolean
             description: AV Untagged Control packets
@@ -166,6 +173,9 @@ properties:
           snps,priority:
             $ref: /schemas/types.yaml#/definitions/uint32
             description: Bitmask of the tagged frames priorities assigned to the queue
+            minimum: 0
+            maximum: 0xFF
+
         allOf:
           - if:
               required:
-- 
2.39.2


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
