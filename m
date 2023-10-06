Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BF37BB328
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Oct 2023 10:27:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BC63C6C836;
	Fri,  6 Oct 2023 08:27:55 +0000 (UTC)
Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD941C6C835
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Oct 2023 08:27:54 +0000 (UTC)
Received: from dslb-188-097-209-100.188.097.pools.vodafone-ip.de
 ([188.97.209.100] helo=martin-debian-2.paytec.ch)
 by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <martin@kaiser.cx>)
 id 1qogBR-0007T2-IT; Fri, 06 Oct 2023 10:27:41 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Date: Fri,  6 Oct 2023 10:22:48 +0200
Message-Id: <20231006082247.3830719-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: pinctrl: st,
	stm32: fix phandle-array warning
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

make CHECK_DTBS=y st/stm32f469-disco.dtb

brings up a warning about a missing argument:

stm32f469-disco.dtb: pinctrl@40020000: st,syscfg:0: [21, 8] is too short

The description of the third entry indicates that this entry is optional.
The code in stm32_pctrl_dt_setup_irq parses st,syscfg and treats the third
entry as optional. It defaults to 0xf if not present in the devicetree.

Update the schema to require at least two entries, use the same syntax as
the description of renesas,ipmmu-main in
Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---

I tested the following cases, all of them returned the expected result:

   st,syscfg = <&syscfg>;              (too short)
   st,syscfg = <&syscfg 0x8>;          (ok)
   st,syscfg = <&syscfg 0x8 0x0>;      (ok)
   st,syscfg = <&syscfg 0x8 0x0 0x0>;  (too long)

 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml          | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 2120ef71a78d..e1eb45a9eda4 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -48,7 +48,8 @@ properties:
     description: Phandle+args to the syscon node which includes IRQ mux selection.
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
-      - items:
+      - minItems: 2
+        items:
           - description: syscon node which includes IRQ mux selection
           - description: The offset of the IRQ mux selection register
           - description: The field mask of IRQ mux, needed if different of 0xf
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
