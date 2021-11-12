Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB2844ECC3
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Nov 2021 19:44:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6271DC5EC75;
	Fri, 12 Nov 2021 18:44:27 +0000 (UTC)
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC3ECC5EC75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 18:44:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.87,230,1631545200"; d="scan'208";a="100101575"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 13 Nov 2021 03:44:25 +0900
Received: from localhost.localdomain (unknown [10.226.92.48])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4E36840D6012;
 Sat, 13 Nov 2021 03:44:22 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 12 Nov 2021 18:44:11 +0000
Message-Id: <20211112184413.4391-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
References: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 2/4] dt-bindings: timer: renesas: ostm:
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V2->v3:
 * Added Geert's Rb tag.
v1->v2:
 * Use renesas,ostm instead od rzg2l-ostm
---
 .../bindings/timer/renesas,ostm.yaml          | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
index 600d47ab7d58..7fa7f977b44c 100644
--- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
@@ -21,9 +21,10 @@ properties:
   compatible:
     items:
       - enum:
-          - renesas,r7s72100-ostm # RZ/A1H
-          - renesas,r7s9210-ostm  # RZ/A2M
-      - const: renesas,ostm       # Generic
+          - renesas,r7s72100-ostm  # RZ/A1H
+          - renesas,r7s9210-ostm   # RZ/A2M
+          - renesas,r9a07g044-ostm # RZ/G2{L,LC}
+      - const: renesas,ostm        # Generic
 
   reg:
     maxItems: 1
@@ -37,6 +38,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -44,6 +48,16 @@ required:
   - clocks
   - power-domains
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - renesas,r9a07g044-ostm
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
