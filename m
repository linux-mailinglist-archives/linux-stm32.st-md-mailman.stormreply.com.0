Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F13381B09
	for <lists+linux-stm32@lfdr.de>; Sat, 15 May 2021 22:43:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25FE9C5718F;
	Sat, 15 May 2021 20:43:38 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E129CC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 May 2021 20:43:34 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C054881CD1;
 Sat, 15 May 2021 22:43:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1621111413;
 bh=/1XN1sKw6nxkrasqV/slVq75nUutbIzyydawvAxlUg0=;
 h=From:To:Cc:Subject:Date:From;
 b=exqfR/DZ7kxshIayNhv1Dvw5bivqQ+eTmElGiBGQSxHfu7yKoZJTSj3STVoayi6nn
 r5fhJ5HO9joVKNLawPhat3N1bdd/B6gz65e4lY0pvRiIOzoS2oOj2s1uyORqpU6iwC
 OFI8eRIUYThoQcuFtIXf5CQUrTZ0Obc5sZP2eVg6fN2wYa/fiT0bRq0vW7DMAL1J7i
 X3e15p3WhF3VOAEiE6mx13ICpxXkNKHAOCRvHXSF2NFmjB1/n/iFqDjg1EdetPx9yM
 ScA0rrTESneSmIbDZ8RBVWMDFp7JnD7XXket65QchwY+HIY0qLV47DRq4W0+iD4/NN
 E2zXnWuvD9SZw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Date: Sat, 15 May 2021 22:43:15 +0200
Message-Id: <20210515204317.366967-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, ch@denx.de,
 Antonio Borneo <antonio.borneo@st.com>, Vincent Abriou <vincent.abriou@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [Linux-stm32] [PATCH V4 1/2] dt-bindings: display: bridge:
	lvds-codec: Document pixel data sampling edge select
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

The OnSemi FIN3385 Parallel-to-LVDS encoder has a dedicated input line to
select input pixel data sampling edge. Add DT property "pclk-sample", not
the same as the one used by display timings but rather the same as used by
media, to define the pixel data sampling edge.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Antonio Borneo <antonio.borneo@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Philippe Cornu <philippe.cornu@st.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Vincent Abriou <vincent.abriou@st.com>
Cc: Yannick Fertre <yannick.fertre@st.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: dri-devel@lists.freedesktop.org
---
V4: New patch split from combined V3
---
 .../bindings/display/bridge/lvds-codec.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 304a1367faaa..f4dd16bd69d2 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -64,6 +64,14 @@ properties:
       - port@0
       - port@1
 
+  pclk-sample:
+    description:
+      Data sampling on rising or falling edge.
+    enum:
+      - 0  # Falling edge
+      - 1  # Rising edge
+    default: 0
+
   powerdown-gpios:
     description:
       The GPIO used to control the power down line of this device.
@@ -71,6 +79,16 @@ properties:
 
   power-supply: true
 
+if:
+  not:
+    properties:
+      compatible:
+        contains:
+          const: lvds-encoder
+then:
+  properties:
+    pclk-sample: false
+
 required:
   - compatible
   - ports
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
