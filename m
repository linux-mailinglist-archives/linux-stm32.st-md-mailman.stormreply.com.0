Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF2850E2E0
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 16:18:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE215C60462;
	Mon, 25 Apr 2022 14:18:40 +0000 (UTC)
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96D71C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 14:18:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.90,288,1643641200"; d="scan'208";a="119095566"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 25 Apr 2022 23:18:35 +0900
Received: from localhost.localdomain (unknown [10.226.93.95])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id ECB42436BEF6;
 Mon, 25 Apr 2022 23:18:30 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 25 Apr 2022 15:18:28 +0100
Message-Id: <20220425141828.197321-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chris Brandt <chris.brandt@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] dt-bindings: timer: renesas: ostm:
	Document Renesas RZ/G2UL OSTM
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

Document the General Timer Module(a.k.a OSTM) found on the RZ/G2UL SoC.
OSTM module is identical to one found RZ/G2L SoC. No driver changes are
required as generic compatible string "renesas,ostm" will be used as a
fallback.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
 * Make the resets property required on RZ/G2UL SoC
 * Added Ack from Krzysztof Kozlowski
 * Added Rb tag from Geert
---
 Documentation/devicetree/bindings/timer/renesas,ostm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
index c399a019dde7..7207929e5cd6 100644
--- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
@@ -23,6 +23,7 @@ properties:
       - enum:
           - renesas,r7s72100-ostm  # RZ/A1H
           - renesas,r7s9210-ostm   # RZ/A2M
+          - renesas,r9a07g043-ostm # RZ/G2UL
           - renesas,r9a07g044-ostm # RZ/G2{L,LC}
           - renesas,r9a07g054-ostm # RZ/V2L
       - const: renesas,ostm        # Generic
@@ -54,6 +55,7 @@ if:
     compatible:
       contains:
         enum:
+          - renesas,r9a07g043-ostm
           - renesas,r9a07g044-ostm
           - renesas,r9a07g054-ostm
 then:
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
