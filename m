Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51680493F38
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jan 2022 18:44:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3195C5F1EB;
	Wed, 19 Jan 2022 17:44:16 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D0A0C57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jan 2022 17:44:15 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id y14so5273092oia.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jan 2022 09:44:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KpLkQGHLvfl7uQnQ0Gz9HQ7CbtFmU1lgLR6VE5GiEys=;
 b=xEFoFA1ExiqgMAuZAo05BMkoXkCyrzIoFnehteiXWIhVFV3ZJFcfVjMELztg1uU1LS
 IU59iCNiRY6wfC2kqBTpNv7h6pQyACMHelCBj3fLvG9TVcC043yLFobd7w6s+XZeT8Hh
 IAACgSW04F34SFZf9vLnrSOYEzHeOg7mFV7GsKlK1W5q2cQ/gC631q2NqNx9GVEyXXwz
 DZ11f4VJMjXmpeYP4OqwpCvUFFlgQ4y9feLzehhZIZoqUPHaLcvvDzVJTR+Stl6/iW2z
 MDSH463TvYTIptnBUqhX9VDmh0aDL1MYxkKmSdMU0yCJxDZnAG423VfVUA/V/ud3f4jU
 f/RQ==
X-Gm-Message-State: AOAM5300OUL8h+HVA/XaLiEC+oTTD9ELtvEpph9pGa/kaXXezz/WVGw7
 nv+KGLBnqcSE0qwiyCsf9w==
X-Google-Smtp-Source: ABdhPJyOS1pvnElPNh4TbjSAgOzKuS8FtvhaAUcUpdGJedrl9supK918JbpezOPIInPkzig9dhUT2w==
X-Received: by 2002:a05:6808:3d1:: with SMTP id
 o17mr4026302oie.12.1642614254287; 
 Wed, 19 Jan 2022 09:44:14 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id bd41sm284361oib.32.2022.01.19.09.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 09:44:13 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
Date: Wed, 19 Jan 2022 11:44:07 -0600
Message-Id: <20220119174407.3810088-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] dt-bindings: i2c: stm32-i2c: Move st,
	syscfg-fmp definition to top level
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

It is preferred to define all properties in the main schema and leave
if/then/else schemas to just be further constraints on properties.

Rework the schema to use be more specific for each cell. Previously,
multiple entries of 3 cells each was allowed.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/i2c/st,stm32-i2c.yaml | 24 ++++++++++---------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index 46b62e1c9273..dccbb18b6dc0 100644
--- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
@@ -25,16 +25,9 @@ allOf:
 
         i2c-scl-falling-time-ns:
           default: 10
-
-        st,syscfg-fmp:
-          description: Use to set Fast Mode Plus bit within SYSCFG when
-                       Fast Mode Plus speed is selected by slave.
-                       Format is phandle to syscfg / register offset within
-                       syscfg / register bitmask for FMP bit.
-          $ref: "/schemas/types.yaml#/definitions/phandle-array"
-          items:
-            minItems: 3
-            maxItems: 3
+    else:
+      properties:
+        st,syscfg-fmp: false
 
   - if:
       properties:
@@ -87,6 +80,16 @@ properties:
     minimum: 1
     maximum: 1000000
 
+  st,syscfg-fmp:
+    description: Use to set Fast Mode Plus bit within SYSCFG when Fast Mode
+      Plus speed is selected by slave.
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    items:
+      - items:
+          - description: phandle to syscfg
+          - description: register offset within syscfg
+          - description: register bitmask for FMP bit
+
 required:
   - compatible
   - reg
@@ -147,4 +150,3 @@ examples:
           i2c-scl-falling-time-ns = <20>;
           st,syscfg-fmp = <&syscfg 0x4 0x2>;
       };
-...
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
