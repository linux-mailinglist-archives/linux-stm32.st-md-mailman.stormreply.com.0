Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3FE5EB31C
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Sep 2022 23:30:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2994FC63324;
	Mon, 26 Sep 2022 21:30:32 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B23EC5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 21:30:30 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A0EEA8499D;
 Mon, 26 Sep 2022 23:30:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664227829;
 bh=x/RYZgcv8T/IAq7rRBEgYG3sMPjFOuK4IdWa0GUYQ1Y=;
 h=From:To:Cc:Subject:Date:From;
 b=Ir97rBh9A7ih9JsZlbxCI7uV4dNOJAMSwt15PYtawOWF2TgycvhkIBTj5jFw8Yig2
 iTyUu0brZoizqRu2xafhH99Oeyi04YawzhnpC1BGO9u5iP8tFNnb0vd5Cno5U8jXD2
 ToaIYe579SPWdYp0FZts4k9ugjcFckMaMkyFyktkWLbYbg2rvzxKWTWIAJfSbeMUmn
 p4hYYZ2q4KjmvWIQEQ+QoC2MTTFkgx2Cf/RA30V+kta6aPeqLwp5I9hAM6kslQi1Ko
 KectZP1ze1RlvoCqlv+J1StMkOup3rC0AfCkcBLyZ8RC4ucQ5FwrAeOvprLkfYi4rt
 1SHka3sw24ofw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 26 Sep 2022 23:29:57 +0200
Message-Id: <20220926212958.505561-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: arm: stm32: Add compatible
	string for DH electronics DHCOR Testbench board
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

Add DT compatible string for DHCOR Testbench board, which is a testbench
for testing of DHCOR SoM during manufacturing. This is effectively a
trimmed down version of AV96 board with CSI-2 bridge, HDMI bridge, WiFi,
Audio and LEDs removed and used as GPIOs instead.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 4c605bccc474e..44f5c5855af8c 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -59,6 +59,12 @@ properties:
               - prt,prtt1s   # Protonic PRTT1S
           - const: st,stm32mp151
 
+      - description: DH STM32MP151 DHCOR SoM based Boards
+        items:
+          - const: dh,stm32mp151a-dhcor-testbench
+          - const: dh,stm32mp151a-dhcor-som
+          - const: st,stm32mp151
+
       - description: DH STM32MP153 DHCOM SoM based Boards
         items:
           - const: dh,stm32mp153c-dhcom-drc02
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
