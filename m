Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D0F5EB5EE
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 01:45:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF1BEC63324;
	Mon, 26 Sep 2022 23:45:15 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9860AC5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 23:45:14 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9686E84BEF;
 Tue, 27 Sep 2022 01:45:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664235914;
 bh=C8gWIDs4Jz5cItlEC5PdGI7V8drgK9GC2bW5sHDcyZ8=;
 h=From:To:Cc:Subject:Date:From;
 b=v1Z6T9uaBNPppQ/epfPscPQTDY0JANoqvraXOQRxfFfjeegZqOUAjIf8F7kC6BsVk
 x+vN94AmrhB+JB47OEz+/w/dBuGfCATnmOxQoN+Zfub8T1zYoOvSu2krYnYiA5WfCo
 76ZhezfE4prgnxANWhOmBYg3RcVsmhqZ1lMXgQK7dvHy4Sjd0RHO1ojx7KPrY0nOMt
 +jtksQYd0pYEB0DyWfGW1eRyGMZTaoWs6Xve0lRNQGkPwkIVBaoI/FiTwhm2g4OQ+a
 lZxcVYAp0pOiRYMfa+Df2FwrvtQpKDbk4TAnU2/GQW8qAWxJgpnnwvpR8il2gs1Ih0
 HYFIWt8pa0v9g==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Tue, 27 Sep 2022 01:45:01 +0200
Message-Id: <20220926234501.583115-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Yannick Fertre <yannick.fertre@foss.st.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] dt-bindings: display: st,
	stm32-dsi: Handle data-lanes in DSI port node
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

Handle 'data-lanes' property of the DSI output endpoint, it is possible
to describe DSI link with 1 or 2 data lanes this way.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Philippe Cornu <philippe.cornu@foss.st.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 .../bindings/display/st,stm32-dsi.yaml          | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
index 54f67cb510401..c488308d7be13 100644
--- a/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
@@ -58,9 +58,20 @@ properties:
           DSI input port node, connected to the ltdc rgb output port.
 
       port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description:
-          DSI output port node, connected to a panel or a bridge input port"
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: |
+          DSI output port node, connected to a panel or a bridge input port.
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              data-lanes:
+                minItems: 1
+                items:
+                  - const: 1
+                  - const: 2
 
 required:
   - "#address-cells"
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
