Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6D16B8534
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 23:51:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B552C6A610;
	Mon, 13 Mar 2023 22:51:33 +0000 (UTC)
Received: from post.baikalelectronics.com (post.baikalelectronics.com
 [213.79.110.86])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AF13C6A610
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 22:51:31 +0000 (UTC)
Received: from post.baikalelectronics.com (localhost.localdomain [127.0.0.1])
 by post.baikalelectronics.com (Proxmox) with ESMTP id 3F5A0E0EC1;
 Tue, 14 Mar 2023 01:51:31 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 baikalelectronics.ru; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:from:from:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=post;
 bh=GDWLCKbTjZjHBGbg9BZjPvJY7ns7quDEaw1d5obfFoI=; b=Su5mxlbVtf7o
 HyrJOJcxzszhKpQ6kT8G485hALnO3itaeV7HwX6WS1qCTYw/blglbHawXh2+wssm
 Oeve5lvR0oImztmoDy88paEtRG0KeZc0fJBGTupcoKoJmClWy0JNd/ASS5/tg+Ln
 rrPM41V8hbhipuR7e48Ul7M4eS3qW5Q=
Received: from mail.baikal.int (mail.baikal.int [192.168.51.25])
 by post.baikalelectronics.com (Proxmox) with ESMTP id 2827BE0E6A;
 Tue, 14 Mar 2023 01:51:31 +0300 (MSK)
Received: from localhost (10.8.30.10) by mail (192.168.51.25) with Microsoft
 SMTP Server (TLS) id 15.0.1395.4; Tue, 14 Mar 2023 01:51:30 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Tue, 14 Mar 2023 01:51:02 +0300
Message-ID: <20230313225103.30512-16-Sergey.Semin@baikalelectronics.ru>
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
Subject: [Linux-stm32] [PATCH net-next 15/16] dt-bindings: net: dwmac:
	Simplify MTL queue props dependencies
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

Currently the Tx/Rx queues properties interdependencies are described by
means of the pattern: "if: required: X, then: properties: Y: false, Z:
false, etc". Due to very unfortunate MTL Tx/Rx queue DT-node design the
resultant sub-nodes schemas look very bulky and thus hard to read. The
situation can be improved by using the "allOf:/oneOf: required: X,
required: Y, etc" pattern instead thus getting shorter and a bit easier to
comprehend constructions.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Note the solution can be shortened out a bit further by replacing the
single-entry allOf statements with just the "not: required: etc" pattern.
But in order to do that the DT-schema validation tool must be fixed like
this:

--- a/meta-schemas/nodes.yaml	2021-02-08 14:20:56.732447780 +0300
+++ b/meta-schemas/nodes.yaml	2021-02-08 14:21:00.736492245 +0300
@@ -22,6 +22,7 @@
     - unevaluatedProperties
     - deprecated
     - required
+    - not
     - allOf
     - anyOf
     - oneOf

Thus all the patterns like
allOf:
  - not:
      required:
        - X
could be replaced with just
not:
  required:
    - X
---
 .../devicetree/bindings/net/snps,dwmac.yaml   | 175 +++++++-----------
 1 file changed, 63 insertions(+), 112 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index a863b5860566..9df301cf674e 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -127,19 +127,6 @@ properties:
         $ref: /schemas/types.yaml#/definitions/flag
         description: Weighted Strict priority
 
-    allOf:
-      - if:
-          required:
-            - snps,rx-sched-sp
-        then:
-          properties:
-            snps,rx-sched-wsp: false
-      - if:
-          required:
-            - snps,rx-sched-wsp
-        then:
-          properties:
-            snps,rx-sched-sp: false
     patternProperties:
       "^queue([0-9]|1[0-1])$":
         description: Each subnode represents a queue.
@@ -185,67 +172,46 @@ properties:
             minimum: 0
             maximum: 0xFF
 
+        additionalProperties: false
+
+        # Choose only one of the bridging algorithm and the packets routing
         allOf:
-          - if:
+          - not:
               required:
                 - snps,dcb-algorithm
-            then:
-              properties:
-                snps,avb-algorithm: false
-          - if:
-              required:
                 - snps,avb-algorithm
-            then:
-              properties:
-                snps,dcb-algorithm: false
-          - if:
-              required:
-                - snps,route-avcp
-            then:
-              properties:
-                snps,route-ptp: false
-                snps,route-dcbcp: false
-                snps,route-up: false
-                snps,route-multi-broad: false
-          - if:
-              required:
-                - snps,route-ptp
-            then:
-              properties:
-                snps,route-avcp: false
-                snps,route-dcbcp: false
-                snps,route-up: false
-                snps,route-multi-broad: false
-          - if:
-              required:
-                - snps,route-dcbcp
-            then:
-              properties:
-                snps,route-avcp: false
-                snps,route-ptp: false
-                snps,route-up: false
-                snps,route-multi-broad: false
-          - if:
-              required:
-                - snps,route-up
-            then:
-              properties:
-                snps,route-avcp: false
-                snps,route-ptp: false
-                snps,route-dcbcp: false
-                snps,route-multi-broad: false
-          - if:
-              required:
-                - snps,route-multi-broad
-            then:
-              properties:
-                snps,route-avcp: false
-                snps,route-ptp: false
-                snps,route-dcbcp: false
-                snps,route-up: false
-        additionalProperties: false
+          - oneOf:
+              - required:
+                  - snps,route-avcp
+              - required:
+                  - snps,route-ptp
+              - required:
+                  - snps,route-dcbcp
+              - required:
+                  - snps,route-up
+              - required:
+                  - snps,route-multi-broad
+              - not:
+                  anyOf:
+                    - required:
+                        - snps,route-avcp
+                    - required:
+                        - snps,route-ptp
+                    - required:
+                        - snps,route-dcbcp
+                    - required:
+                        - snps,route-up
+                    - required:
+                        - snps,route-multi-broad
+
     additionalProperties: false
 
+    allOf:
+      - not:
+          required:
+            - snps,rx-sched-sp
+            - snps,rx-sched-wsp
+
   snps,mtl-tx-config:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -279,39 +245,6 @@ properties:
         $ref: /schemas/types.yaml#/definitions/flag
         description: Strict priority
 
-    allOf:
-      - if:
-          required:
-            - snps,tx-sched-wrr
-        then:
-          properties:
-            snps,tx-sched-wfq: false
-            snps,tx-sched-dwrr: false
-            snps,tx-sched-sp: false
-      - if:
-          required:
-            - snps,tx-sched-wfq
-        then:
-          properties:
-            snps,tx-sched-wrr: false
-            snps,tx-sched-dwrr: false
-            snps,tx-sched-sp: false
-      - if:
-          required:
-            - snps,tx-sched-dwrr
-        then:
-          properties:
-            snps,tx-sched-wrr: false
-            snps,tx-sched-wfq: false
-            snps,tx-sched-sp: false
-      - if:
-          required:
-            - snps,tx-sched-sp
-        then:
-          properties:
-            snps,tx-sched-wrr: false
-            snps,tx-sched-wfq: false
-            snps,tx-sched-dwrr: false
     patternProperties:
       "^queue([0-9]|1[0-5])$":
         description: Each subnode represents a queue.
@@ -380,23 +313,41 @@ properties:
             minimum: 0
             maximum: 0xFF
 
+        additionalProperties: false
+
+        # Choose only one of the Queue TC algo
         allOf:
-          - if:
+          - not:
               required:
                 - snps,dcb-algorithm
-            then:
-              properties:
-                snps,avb-algorithm: false
-          - if:
-              required:
                 - snps,avb-algorithm
-            then:
-              properties:
-                snps,dcb-algorithm: false
-                snps,weight: false
-        additionalProperties: false
+
+        dependencies:
+          snps,weight: ["snps,dcb-algorithm"]
+
     additionalProperties: false
 
+    # Choose one of the TX scheduling algorithms
+    oneOf:
+      - required:
+          - snps,tx-sched-wrr
+      - required:
+          - snps,tx-sched-wfq
+      - required:
+          - snps,tx-sched-dwrr
+      - required:
+          - snps,tx-sched-sp
+      - not:
+          anyOf:
+            - required:
+                - snps,tx-sched-wrr
+            - required:
+                - snps,tx-sched-wfq
+            - required:
+                - snps,tx-sched-dwrr
+            - required:
+                - snps,tx-sched-sp
+
   snps,reset-gpio:
     deprecated: true
     maxItems: 1
-- 
2.39.2


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
