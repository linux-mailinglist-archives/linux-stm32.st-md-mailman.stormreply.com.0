Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BAF2AADC5
	for <lists+linux-stm32@lfdr.de>; Sun,  8 Nov 2020 23:14:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64F5DC3FAE2;
	Sun,  8 Nov 2020 22:14:47 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE870C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Nov 2020 22:14:45 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CTpMS3psdz1rt44;
 Sun,  8 Nov 2020 23:14:44 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CTpMS2w1Mz1qy5Z;
 Sun,  8 Nov 2020 23:14:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id pqmUv7j6a4bA; Sun,  8 Nov 2020 23:14:43 +0100 (CET)
X-Auth-Info: LirUQGMHELDycsfgCCJoy3mBg80Y58ZOue2POre1IFM=
Received: from localhost.localdomain (ip-89-176-112-137.net.upcbroadband.cz
 [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun,  8 Nov 2020 23:14:43 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Sun,  8 Nov 2020 23:14:38 +0100
Message-Id: <20201108221438.310406-1-marex@denx.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Patrick Delaunay <patrick.delaunay@st.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] dt-bindings: arm: stm32: Add compatible
	strings for DH SoMs and boards
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

Document devicetree compatible strings of the DH SoMs and boards.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 .../devicetree/bindings/arm/stm32/stm32.yaml      | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 009b424e456e..f9939ec28eae 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -14,6 +14,20 @@ properties:
     const: "/"
   compatible:
     oneOf:
+      - description: DH STM32MP1 SoM based Boards
+        items:
+          - enum:
+              - arrow,stm32mp157a-avenger96 # Avenger96
+              - dh,stm32mp153c-dhcom-drc02
+              - dh,stm32mp157c-dhcom-pdk2
+              - dh,stm32mp157c-dhcom-picoitx
+          - enum:
+              - dh,stm32mp153c-dhcom-som
+              - dh,stm32mp157a-dhcor-som
+              - dh,stm32mp157c-dhcom-som
+          - enum:
+              - st,stm32mp153
+              - st,stm32mp157
       - items:
           - enum:
               - st,stm32f429i-disco
@@ -39,7 +53,6 @@ properties:
           - const: st,stm32h743
       - items:
           - enum:
-              - arrow,stm32mp157a-avenger96 # Avenger96
               - lxa,stm32mp157c-mc1
               - shiratech,stm32mp157a-iot-box # IoT Box
               - shiratech,stm32mp157a-stinger96 # Stinger96
-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
