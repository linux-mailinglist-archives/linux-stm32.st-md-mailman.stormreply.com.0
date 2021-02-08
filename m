Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B307A3133E5
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 14:56:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12A16C57B59;
	Mon,  8 Feb 2021 13:56:14 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0EC9C3FADB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 13:56:12 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Joao Pinto <jpinto@synopsys.com>, Lars Persson
 <larper@axis.com>
Date: Mon, 8 Feb 2021 16:55:46 +0300
Message-ID: <20210208135609.7685-3-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20210208135609.7685-1-Sergey.Semin@baikalelectronics.ru>
References: <20210208135609.7685-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 02/24] dt-bindings: net: dwmac: Extend
	number of PBL values
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

In accordance with [1] the permitted PBL values can be set as one of [1,
2, 4, 8, 16, 32]. The rest of the values result in undefined behavior. At
the same time some of the permitted values can be also invalid depending
on the controller FIFOs size and the data bus width. Due to having too
many variables all the possible PBL property constraints can't be
implemented in the bindings schema, let's extend the set of permitted PBL
values to be as much as the configuration register supports leaving the
undefined behaviour cases for developers to handle.

[1] DesignWare Cores Ethernet MAC Universal Databook, Revision 3.73a,
    October 2013, p. 380.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>

Changelog v2:
- Use correct syntax of the JSON pointers, so the later would begin
  with a '/' after the '#'.
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 40a002770441..cb68a8dcafd7 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -267,23 +267,26 @@ properties:
 
   snps,pbl:
     description:
-      Programmable Burst Length (tx and rx)
+      Programmable Burst Length (tx and rx). Note some of these values
+      can be still invalid due to HW limitations connected with the data
+      bus width and the FIFOs depth, so a total length of a single DMA
+      burst shouldn't exceed half the FIFO depth.
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [2, 4, 8]
+    enum: [1, 2, 4, 8, 16, 32]
 
   snps,txpbl:
     description:
       Tx Programmable Burst Length. If set, DMA tx will use this
       value rather than snps,pbl.
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [2, 4, 8]
+    enum: [1, 2, 4, 8, 16, 32]
 
   snps,rxpbl:
     description:
       Rx Programmable Burst Length. If set, DMA rx will use this
       value rather than snps,pbl.
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [2, 4, 8]
+    enum: [1, 2, 4, 8, 16, 32]
 
   snps,no-pbl-x8:
     $ref: /schemas/types.yaml#/definitions/flag
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
