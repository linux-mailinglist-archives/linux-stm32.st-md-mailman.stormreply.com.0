Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E472644BDE3
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Nov 2021 10:36:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D485C5EC72;
	Wed, 10 Nov 2021 09:36:01 +0000 (UTC)
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D500C5EC6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 08:32:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.87,223,1631545200"; d="scan'208";a="99778034"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 10 Nov 2021 17:32:01 +0900
Received: from localhost.localdomain (unknown [10.226.92.40])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id AE7BE40062CE;
 Wed, 10 Nov 2021 17:31:58 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 10 Nov 2021 08:31:51 +0000
Message-Id: <20211110083152.31144-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211110083152.31144-1-biju.das.jz@bp.renesas.com>
References: <20211110083152.31144-1-biju.das.jz@bp.renesas.com>
X-Mailman-Approved-At: Wed, 10 Nov 2021 09:36:00 +0000
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: timer: renesas: ostm:
	Document Renesas RZ/G2L OSTM
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Document the General Timer Module(a.k.a OSTM) found on the RZ/G2L SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/timer/renesas,ostm.yaml          | 29 +++++++++++++++----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
index 600d47ab7d58..5a8ffdc8b1cb 100644
--- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
@@ -19,11 +19,17 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r7s72100-ostm # RZ/A1H
-          - renesas,r7s9210-ostm  # RZ/A2M
-      - const: renesas,ostm       # Generic
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r7s72100-ostm  # RZ/A1H
+              - renesas,r7s9210-ostm   # RZ/A2M
+          - const: renesas,ostm        # Generic
+
+      - items:
+          - enum:
+              - renesas,r9a07g044-ostm # RZ/G2{L,LC}
+          - const: renesas,rzg2l-ostm  # RZ/G2L
 
   reg:
     maxItems: 1
@@ -37,6 +43,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -44,6 +53,16 @@ required:
   - clocks
   - power-domains
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - renesas,rzg2l-ostm
+then:
+  required:
+    - resets
+
 additionalProperties: false
 
 examples:
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
