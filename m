Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DB14C5F91
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Feb 2022 23:49:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C99E5C5F1F1;
	Sun, 27 Feb 2022 22:49:02 +0000 (UTC)
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93ADDC5F1EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Feb 2022 22:49:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.90,142,1643641200"; d="scan'208";a="111725986"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 28 Feb 2022 07:48:57 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id C590C4006DFA;
 Mon, 28 Feb 2022 07:48:54 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chris Brandt <chris.brandt@renesas.com>
Date: Sun, 27 Feb 2022 22:48:44 +0000
Message-Id: <20220227224845.27348-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: timer: renesas: ostm: Document
	Renesas RZ/V2L OSTM
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

Document the General Timer Module(a.k.a OSTM) found on the RZ/V2L SoC.
OSTM module is identical to one found RZ/G2L SoC. No driver changes are
required as generic compatible string "renesas,ostm" will be used as a
fallback.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
DTSI changes have been posted as part of series [0]

[0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/
20220227203744.18355-8-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 Documentation/devicetree/bindings/timer/renesas,ostm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
index 7fa7f977b44c..c399a019dde7 100644
--- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
@@ -24,6 +24,7 @@ properties:
           - renesas,r7s72100-ostm  # RZ/A1H
           - renesas,r7s9210-ostm   # RZ/A2M
           - renesas,r9a07g044-ostm # RZ/G2{L,LC}
+          - renesas,r9a07g054-ostm # RZ/V2L
       - const: renesas,ostm        # Generic
 
   reg:
@@ -54,6 +55,7 @@ if:
       contains:
         enum:
           - renesas,r9a07g044-ostm
+          - renesas,r9a07g054-ostm
 then:
   required:
     - resets
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
