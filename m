Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A607E6B8525
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 23:51:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62EF0C6904C;
	Mon, 13 Mar 2023 22:51:10 +0000 (UTC)
Received: from post.baikalelectronics.com (post.baikalelectronics.com
 [213.79.110.86])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8530BC65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 22:51:08 +0000 (UTC)
Received: from post.baikalelectronics.com (localhost.localdomain [127.0.0.1])
 by post.baikalelectronics.com (Proxmox) with ESMTP id 19318E0EB2;
 Tue, 14 Mar 2023 01:51:08 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 baikalelectronics.ru; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:from:from:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=post;
 bh=pK/cCmy7hQrJyE9NQeB9yO2KIq8yqVfTtGldxs03tag=; b=U7y0JqJZtuQk
 TZbJt1w2qXDtOvlw+MFw+lU2b/i7IxrJ0odcBIOIq3uAqDxT6HwpQDxrFhYDhVla
 DqnKru53elR3fQ/RIOOTVo6EsI1HSVORdl6lOMv3/lmWXeQ7a5dWz9bR93RGMoNs
 jOTmLTyCHgVdOihClF39lFNerh2dxPI=
Received: from mail.baikal.int (mail.baikal.int [192.168.51.25])
 by post.baikalelectronics.com (Proxmox) with ESMTP id 025FDE0E6A;
 Tue, 14 Mar 2023 01:51:08 +0300 (MSK)
Received: from localhost (10.8.30.10) by mail (192.168.51.25) with Microsoft
 SMTP Server (TLS) id 15.0.1395.4; Tue, 14 Mar 2023 01:51:07 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Tue, 14 Mar 2023 01:50:48 +0300
Message-ID: <20230313225103.30512-2-Sergey.Semin@baikalelectronics.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
References: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-Originating-IP: [10.8.30.10]
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Christian Marangi <ansuelsmth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 01/16] dt-bindings: net: dwmac:
	Validate PBL for all IP-cores
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

Indeed the maximum DMA burst length can be programmed not only for DW
xGMACs, Allwinner EMACs and Spear SoC GMAC, but in accordance with [1]
for Generic DW *MAC IP-cores. Moreover the STMMAC set of drivers parse
the property and then apply the configuration for all supported DW MAC
devices. All of that makes the property being available for all IP-cores
the bindings supports. Let's make sure the PBL-related properties are
validated for all of them by the common DW MAC DT schema.

[1] DesignWare Cores Ethernet MAC Universal Databook, Revision 3.73a,
    October 2013, p. 380.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changelog v1:
- Use correct syntax of the JSON pointers, so the later would begin
  with a '/' after the '#'.
---
 .../devicetree/bindings/net/snps,dwmac.yaml   | 77 +++++++------------
 1 file changed, 26 insertions(+), 51 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 16b7d2904696..a0a0437eb4f0 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -426,6 +426,32 @@ properties:
     description:
       Use Address-Aligned Beats
 
+  snps,pbl:
+    description:
+      Programmable Burst Length (tx and rx)
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [2, 4, 8]
+
+  snps,txpbl:
+    description:
+      Tx Programmable Burst Length. If set, DMA tx will use this
+      value rather than snps,pbl.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [2, 4, 8]
+
+  snps,rxpbl:
+    description:
+      Rx Programmable Burst Length. If set, DMA rx will use this
+      value rather than snps,pbl.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [2, 4, 8]
+
+  snps,no-pbl-x8:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Don\'t multiply the pbl/txpbl/rxpbl values by 8. For core
+      rev < 3.50, don\'t multiply the values by 4.
+
   snps,fixed-burst:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
@@ -556,57 +582,6 @@ dependencies:
 
 allOf:
   - $ref: "ethernet-controller.yaml#"
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - allwinner,sun7i-a20-gmac
-              - allwinner,sun8i-a83t-emac
-              - allwinner,sun8i-h3-emac
-              - allwinner,sun8i-r40-gmac
-              - allwinner,sun8i-v3s-emac
-              - allwinner,sun50i-a64-emac
-              - ingenic,jz4775-mac
-              - ingenic,x1000-mac
-              - ingenic,x1600-mac
-              - ingenic,x1830-mac
-              - ingenic,x2000-mac
-              - snps,dwmac-3.50a
-              - snps,dwmac-4.10a
-              - snps,dwmac-4.20a
-              - snps,dwxgmac
-              - snps,dwxgmac-2.10
-              - st,spear600-gmac
-
-    then:
-      properties:
-        snps,pbl:
-          description:
-            Programmable Burst Length (tx and rx)
-          $ref: /schemas/types.yaml#/definitions/uint32
-          enum: [1, 2, 4, 8, 16, 32]
-
-        snps,txpbl:
-          description:
-            Tx Programmable Burst Length. If set, DMA tx will use this
-            value rather than snps,pbl.
-          $ref: /schemas/types.yaml#/definitions/uint32
-          enum: [1, 2, 4, 8, 16, 32]
-
-        snps,rxpbl:
-          description:
-            Rx Programmable Burst Length. If set, DMA rx will use this
-            value rather than snps,pbl.
-          $ref: /schemas/types.yaml#/definitions/uint32
-          enum: [1, 2, 4, 8, 16, 32]
-
-        snps,no-pbl-x8:
-          $ref: /schemas/types.yaml#/definitions/flag
-          description:
-            Don\'t multiply the pbl/txpbl/rxpbl values by 8. For core
-            rev < 3.50, don\'t multiply the values by 4.
-
   - if:
       properties:
         compatible:
-- 
2.39.2


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
