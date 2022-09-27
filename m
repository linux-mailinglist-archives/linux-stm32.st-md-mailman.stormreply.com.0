Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 902335EB6CA
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 03:24:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31C37C63324;
	Tue, 27 Sep 2022 01:24:58 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4998CC5EC6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 01:24:56 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C4FAD845EF;
 Tue, 27 Sep 2022 03:24:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664241895;
 bh=Qbar4PN2LNDaYnWve5+IGbY8N/ouTxJqLJBgGyp/dDY=;
 h=From:To:Cc:Subject:Date:From;
 b=xq0CJi0mSWcQfknmt8561ovABRtORwgw6khEAAczjDRPLZW+bMdfclkSPtYORp5ib
 qxlaoiKHk5xcmSjq749r9odlwMyvZJCN8AjQUxf3tnMbjtXDX970S337IvZW7W+pFw
 SxTC7nzOsoOQAi3FF59OIlV0zpf/FiAwPW9MczCqzUEXFGlPThV8u1IbyXouDVAuwG
 gHWtqIIZC0foDK3kfqCZI3ZfT83K6QLjEl80YG7T5gs2gK8TxIjNJfkMNz/mMhFdtj
 hxT4/4nYvE8GjReaHmIZOVTyy3IltjW9xdwUXhB6eWhpuM8OthMGe8guYJmw+ZbgYk
 mSwBnRCxi65jA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Tue, 27 Sep 2022 03:24:49 +0200
Message-Id: <20220927012449.698915-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH] dt-bindings: net: snps,
	dwmac: Document stmmac-axi-config subnode
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

The stmmac-axi-config subnode is present in multiple dwmac instance DTs,
document its content per snps,axi-config property description which is
a phandle to this subnode.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: David S. Miller <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: netdev@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
---
 .../devicetree/bindings/net/snps,dwmac.yaml   | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 2d4e7c7c230a5..be8cd44e6a2aa 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -302,6 +302,60 @@ properties:
     required:
       - compatible
 
+  stmmac-axi-config:
+    type: object
+    unevaluatedProperties: false
+    description:
+      AXI BUS Mode parameters.
+
+    properties:
+      snps,lpi_en:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          enable Low Power Interface
+
+      snps,xit_frm:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          unlock on WoL
+
+      snps,wr_osr_lmt:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          max write outstanding req. limit
+
+      snps,rd_osr_lmt:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          max read outstanding req. limit
+
+      snps,kbbe:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          do not cross 1KiB boundary.
+
+      snps,blen:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          this is a vector of supported burst length.
+        minItems: 7
+        maxItems: 7
+
+      snps,fb:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          fixed-burst
+
+      snps,mb:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          mixed-burst
+
+      snps,rb:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          rebuild INCRx Burst
+
 required:
   - compatible
   - reg
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
