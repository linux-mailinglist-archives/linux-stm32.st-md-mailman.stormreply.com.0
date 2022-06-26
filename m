Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA16555ADB9
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Jun 2022 02:21:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3978DC5EC6B;
	Sun, 26 Jun 2022 00:21:22 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BA46C0D2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Jun 2022 00:21:20 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A4EDE81A02;
 Sun, 26 Jun 2022 02:21:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1656202879;
 bh=2+VzDUUThiI1ROiEciRv+pLrxIIEoD+pHIMT2yd+Fxs=;
 h=From:To:Cc:Subject:Date:From;
 b=I3EuzIGCf3zrPzZ7AubGI3pt16yq5UUcQt+bFa0MnP6q2s/US/7mKYkSzCzDxUtj8
 llAqJ7uvNvtNHUbGzuSD+6Cx/Pgp/3i1hdd/LqpT5pgklzK7GiVklBCZrXW9oYT11f
 N05DnQ58C1gN8Y7mIRzIQfNNrNNC74fvs1W+dGFoormsfOF0ZHRsfeNIb9oBcAu5xG
 ftmKHZQ0ijzqKLDt1YUHBLD4FVkM++iIj1e7PQVsKIYxb2z+50bFPkXaIs8sKm7cnj
 95G5Iqx/lLox0SWBZGqqaXsbLEznYOJCBxPk2K8mxfvWTgQEzmNnMuFa2oyc1FAtGs
 9fQi37PBvhlVg==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Sun, 26 Jun 2022 02:20:59 +0200
Message-Id: <20220626002105.198854-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 1/7] dt-bindings: arm: stm32: Add
	compatible string for DH electronics DHCOR DRC Compact
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

Add DT compatible string for DH electronics STM32MP15xx DHCOR on DRC Compact
carrier board into YAML DT binding document. This system is a general purpose
DIN Rail Controller design.

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
V2: Split DHCOM and DHCOR SoM entries
V3: No change
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 8b31565fee591..4c605bccc474e 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -59,12 +59,18 @@ properties:
               - prt,prtt1s   # Protonic PRTT1S
           - const: st,stm32mp151
 
-      - description: DH STM32MP153 SoM based Boards
+      - description: DH STM32MP153 DHCOM SoM based Boards
         items:
           - const: dh,stm32mp153c-dhcom-drc02
           - const: dh,stm32mp153c-dhcom-som
           - const: st,stm32mp153
 
+      - description: DH STM32MP153 DHCOR SoM based Boards
+        items:
+          - const: dh,stm32mp153c-dhcor-drc-compact
+          - const: dh,stm32mp153c-dhcor-som
+          - const: st,stm32mp153
+
       - items:
           - enum:
               - shiratech,stm32mp157a-iot-box # IoT Box
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
