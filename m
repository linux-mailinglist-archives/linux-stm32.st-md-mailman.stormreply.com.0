Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90215569430
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Jul 2022 23:20:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 450F5C04005;
	Wed,  6 Jul 2022 21:20:33 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9FC6C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Jul 2022 21:20:31 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id f14so12081821qkm.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 Jul 2022 14:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UhZoitLijiPNAqkv3CxoYd+Lpg8Yl4Q/B3mulaHhdfA=;
 b=1+vePiCDlRvnU4WFzk3h1EkwqND0wS6GmCATBJ4ziXKCtvab+3POiTUyx14A0Pxoc6
 j7Zeg6VrFiaRXE2p7r+MgL2Zq5ZiZ9p638oEWGjWT09IDGK8fr7KMEIRCdtDzk3XSYq9
 LZrjNUGm2p1MJge8xwnZ0jOcPzQVBto9G2iY8vXR5CCci85bc8zdreKpQeCS8oVrmyRz
 4ZrVcB45GavnH5uxbTqO3tNtRsAs1HOLKPLGtxcN5DEgdWAJ9vF5kPba7LkgKUM6IUdW
 XHbvDZZCH3jMzqrhlJG9T5lT2uH/nvTRuBvu2hlnFjyFEDwO3lLx9yvgTqAAJuM2UqPZ
 kpnA==
X-Gm-Message-State: AJIora/4Q6zGW7iM5Jv7CNzNblxctkI+5vpK3GawMUVOrp5dFnruQ1c/
 gZj9V01k2RAoZV/HZMeINQ==
X-Google-Smtp-Source: AGRyM1vLksfEbmgZTWC3JTIY/XUPlZEUEUJd/Qvv4YtXmYQAiWVfNp/9Xu+RP+Hxr0ST8igasPl8Og==
X-Received: by 2002:a05:620a:1924:b0:6b2:85c1:7c7e with SMTP id
 bj36-20020a05620a192400b006b285c17c7emr13557929qkb.142.1657142430724; 
 Wed, 06 Jul 2022 14:20:30 -0700 (PDT)
Received: from xps15.. ([172.58.107.140])
 by smtp.googlemail.com with ESMTPSA id
 c7-20020a05620a268700b006aef1e5eb87sm31500678qkp.24.2022.07.06.14.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 14:20:30 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Lee Jones <lee.jones@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed,  6 Jul 2022 15:19:33 -0600
Message-Id: <20220706211934.567432-1-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] dt-bindings: mfd: stm32-timers: Move fixed
	string node names under 'properties'
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

Fixed string node names should be under 'properties' rather than
'patternProperties'. Additionally, without beginning and end of line
anchors, any prefix or suffix is allowed on the specified node name.

Move the stm32 timers 'counter' and 'timer' nodes to the 'properties'
section.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/mfd/st,stm32-lptimer.yaml        | 28 +++++++++----------
 .../bindings/mfd/st,stm32-timers.yaml         | 20 ++++++-------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
index ec7f0190f46e..a58f08aa430d 100644
--- a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
@@ -58,43 +58,43 @@ properties:
       - "#pwm-cells"
       - compatible
 
-patternProperties:
-  "^trigger@[0-9]+$":
+  counter:
     type: object
 
     properties:
       compatible:
-        const: st,stm32-lptimer-trigger
-
-      reg:
-        description: Identify trigger hardware block.
-        items:
-          minimum: 0
-          maximum: 2
+        const: st,stm32-lptimer-counter
 
     required:
       - compatible
-      - reg
 
-  counter:
+  timer:
     type: object
 
     properties:
       compatible:
-        const: st,stm32-lptimer-counter
+        const: st,stm32-lptimer-timer
 
     required:
       - compatible
 
-  timer:
+patternProperties:
+  "^trigger@[0-9]+$":
     type: object
 
     properties:
       compatible:
-        const: st,stm32-lptimer-timer
+        const: st,stm32-lptimer-trigger
+
+      reg:
+        description: Identify trigger hardware block.
+        items:
+          minimum: 0
+          maximum: 2
 
     required:
       - compatible
+      - reg
 
 required:
   - "#address-cells"
diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
index 10b330d42901..1bd663f886dc 100644
--- a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
@@ -87,6 +87,16 @@ properties:
       - "#pwm-cells"
       - compatible
 
+  counter:
+    type: object
+
+    properties:
+      compatible:
+        const: st,stm32-timer-counter
+
+    required:
+      - compatible
+
 patternProperties:
   "^timer@[0-9]+$":
     type: object
@@ -107,16 +117,6 @@ patternProperties:
       - compatible
       - reg
 
-  counter:
-    type: object
-
-    properties:
-      compatible:
-        const: st,stm32-timer-counter
-
-    required:
-      - compatible
-
 required:
   - compatible
   - reg
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
