Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2706A50E298
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 16:04:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C586AC60462;
	Mon, 25 Apr 2022 14:04:45 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BBB2C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 14:04:44 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id g23so11525647edy.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 07:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A/KjYfxWY6dO26Q/Gz+eZoR2t9LGmKY4e8SrCiDCtaw=;
 b=qoct3X/M96zwh5rBzwzAzpVicsmVVPwtHu1jI+7dbJcKQTYvl1zG/c4Hec0mNj2VBy
 AuM5tT36C0XiFizxUMpVWsmMw+06MZHLkQLez8dKeF1PlYpyUQysLBPGXGFIddlaFPaM
 O8PNjbcUBUygXEYh88H+WcRiEtP4jAsPkuB29I4DpCIwCdXMS6WW1fMmqXxH6lUrUR3y
 F0z3iHqwGUyxyRnrH2sMG0ImODkYqGc+uHeng4+RSUvjbPPL0f5qw3uutRoklRAHFHr3
 8qkoX2UeEyY2A+2tFlzdwVGcXMnQYu1jVZKMYqyyagoK5c7O3565R0kRc6ipV9OsTvss
 jflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A/KjYfxWY6dO26Q/Gz+eZoR2t9LGmKY4e8SrCiDCtaw=;
 b=1mNV1210Wvw+B0NBX/tSZXZGaSbfbzxoKU6CcC/T9Vu7CIJgo9u5MNQZ/dMjgWp6Fj
 K3ZQyQFHg70mfScfbdTiSRvHhdTksatq1zCJrZg4lLfJlUFLTIymHRIaPckKnCzgXXhv
 meGp+/+uXOED2tdCxFzaQI9NCi4V/9knbldTpPMinIa9tcdK8SSw7+hqCqkMCWxkHv+4
 yfgh2EJFcyKyvvMZKbuQU2HJjY5WUT7mA6OA0jSIVmkWCzaa73ui/DHMed4SJcEUDy+7
 R7q2C4dbGK+099aE175rPXbdqxMkAznObikjTk/qJmSe1M78+0V4NmKk9Xszg6J6wMsL
 poHQ==
X-Gm-Message-State: AOAM530Cu4lvmYZ87Laj6hFK61sk+Il3DlpjfTHGpygDEWai+oiOoI9k
 Qj1aqsrlyxYW6KbMNiXskjlMPA==
X-Google-Smtp-Source: ABdhPJykCgU1o5E3oYd27kWf/cilZ8TlR93/84M5TvIIClDxB48S9+chsPS5lEeoQ7jZ0QFZ4XMLgw==
X-Received: by 2002:a50:c31e:0:b0:425:e127:2901 with SMTP id
 a30-20020a50c31e000000b00425e1272901mr7328570edb.134.1650895483991; 
 Mon, 25 Apr 2022 07:04:43 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 l20-20020a1709062a9400b006ce71a88bf5sm3663554eje.183.2022.04.25.07.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 07:04:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 25 Apr 2022 16:04:35 +0200
Message-Id: <20220425140436.332467-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: arm: stm32: narrow DH
	STM32MP1 SoM boards
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

The bindings for DH STM32MP1 SoM boards allows invalid combinations,
e.g. st,stm32mp153 SoC on a dh,stm32mp157c-dhcom-som SoM.

Split the enums to properly match valid setups.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/arm/stm32/stm32.yaml  | 37 +++++++++++--------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index fa0a1b84122e..2f83f2760e6a 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -14,21 +14,6 @@ properties:
     const: "/"
   compatible:
     oneOf:
-      - description: DH STM32MP1 SoM based Boards
-        items:
-          - enum:
-              - arrow,stm32mp157a-avenger96 # Avenger96
-              - dh,stm32mp153c-dhcom-drc02
-              - dh,stm32mp157c-dhcom-pdk2
-              - dh,stm32mp157c-dhcom-picoitx
-          - enum:
-              - dh,stm32mp153c-dhcom-som
-              - dh,stm32mp157a-dhcor-som
-              - dh,stm32mp157c-dhcom-som
-          - enum:
-              - st,stm32mp153
-              - st,stm32mp157
-
       - description: emtrion STM32MP1 Argon based Boards
         items:
           - const: emtrion,stm32mp157c-emsbc-argon
@@ -65,6 +50,13 @@ properties:
           - enum:
               - st,stm32mp135f-dk
           - const: st,stm32mp135
+
+      - description: DH STM32MP153 SoM based Boards
+        items:
+          - const: dh,stm32mp153c-dhcom-drc02
+          - const: dh,stm32mp153c-dhcom-som
+          - const: st,stm32mp153
+
       - items:
           - enum:
               - shiratech,stm32mp157a-iot-box # IoT Box
@@ -79,6 +71,21 @@ properties:
           - const: st,stm32mp157c-ed1
           - const: st,stm32mp157
 
+      - description: DH STM32MP1 SoM based Boards
+        items:
+          - enum:
+              - arrow,stm32mp157a-avenger96 # Avenger96
+          - const: dh,stm32mp157a-dhcor-som
+          - const: st,stm32mp157
+
+      - description: DH STM32MP1 SoM based Boards
+        items:
+          - enum:
+              - dh,stm32mp157c-dhcom-pdk2
+              - dh,stm32mp157c-dhcom-picoitx
+          - const: dh,stm32mp157c-dhcom-som
+          - const: st,stm32mp157
+
       - description: Engicam i.Core STM32MP1 SoM based Boards
         items:
           - enum:
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
